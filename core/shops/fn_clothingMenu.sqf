/*
	File: fn_clothingMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens and initializes the clothing store menu.
	Started clean, finished messy.
*/
private["_list","_clothes","_pic","_filter"];
createDialog "Life_Clothing";
disableSerialization;

//Cop / Civ Pre Check
if((_this select 3) in ["bruce","dive","kart","donator"] && (playerSide != civilian OR playerSide != east)) exitWith {hint "Tu dois être un civil pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) in ["reb"] && playerSide != east) exitWith {hint "Tu dois être rebelle pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) == "reb" && !license_civ_rebel) exitWith {hint "Tu dois être un rebelle pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) == "gangster" && !license_civ_gangster) exitWith {hint "Tu dois être un gangster pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) == "bac" && !license_cop_bac) exitWith {hint "Tu dois être membre de la BAC pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) == "hunter" && !license_civ_bounty_hunter) exitWith {hint "Tu dois être membre des chasseurs de primes pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) in ["cop"] && playerSide != west) exitWith {hint "Tu dois être un gendarme pour utiliser ce vendeur!"; closeDialog 0;};
if((_this select 3) in ["med"] && playerSide != independent) exitWith {hint "Seul l'effectif du SAMU peut utiliser ce vendeur!"; closeDialog 0;};//ajout serrat

// ENTREPRISES
if((_this select 3) == "natiosecuri" && !license_civ_natiosecuri) exitWith {hint "Tu dois être salarié de l'entreprise National Security!"; closeDialog 0;};
if((_this select 3) == "avocat_wh" && !license_civ_avocat_wh) exitWith {hint "Tu dois être membre du cabinet d'avocats!"; closeDialog 0;};
life_clothing_store = _this select 3;

//License Check?
_var = [life_clothing_store,0] call life_fnc_licenseType;
if(_var select 0 != "") then
{
	if(!(missionNamespace getVariable (_var select 0))) exitWith {hint format["Tu dois avoir un %1 pour acheter dans ce magasin!",[_var select 0] call life_fnc_varToStr]; closeDialog 0; [] call life_fnc_playerSkins;};
};

//initialize camera view
life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
_filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd "Vetements";
_filter lbAdd "Chapeaux";
_filter lbAdd "Lunettes";
_filter lbAdd "Gilets";
_filter lbAdd "Sacs a dos";

_filter lbSetCurSel 0;

life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;

waitUntil {isNull (findDisplay 3100)};
life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if(isNil "life_clothesPurchased") exitWith
{
	life_clothing_purchase = [-1,-1,-1,-1,-1];
	if(life_oldClothes != "") then {player addUniform life_oldClothes;} else {removeUniform player};
	if(life_oldHat != "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
	if(life_oldGlasses != "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
	if(backpack player != "") then
	{
		if(life_oldBackpack == "") then
		{
			removeBackpack player;
		}
			else
		{
			removeBackpack player;
			player addBackpack life_oldBackpack;
			clearAllItemsFromBackpack player;
			if(count life_oldBackpackItems > 0) then
			{
				{
					[_x,true,true] call life_fnc_handleItem;
				} foreach life_oldBackpackItems;
			};
		};
	};

	if(count life_oldUniformItems > 0) then
	{
		{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldUniformItems;
	};

	if(vest player != "") then
	{
		if(life_oldVest == "") then
		{
			removeVest player;
		}
			else
		{
			player addVest life_oldVest;
			if(count life_oldVestItems > 0) then
			{
				{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldVestItems;
			};
		};
	};
};
life_clothesPurchased = nil;

//Check uniform purchase.
if((life_clothing_purchase select 0) == -1) then
{
	if(life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if((life_clothing_purchase select 1) == -1) then
{
	if(life_oldHat != headgear player) then {if(life_oldHat == "") then {removeHeadGear player;} else {player addHeadGear life_oldHat;};};
};
//Check glasses
if((life_clothing_purchase select 2) == -1) then
{
	if(life_oldGlasses != goggles player) then
	{
		if(life_oldGlasses == "") then
		{
			removeGoggles player;
		}
			else
		{
			player addGoggles life_oldGlasses;
		};
	};
};
//Check Vest
if((life_clothing_purchase select 3) == -1) then
{
	if(life_oldVest != vest player) then
	{
		if(life_oldVest == "") then {removeVest player;} else
		{
			player addVest life_oldVest;
			{[_x,true,false,false,true] call life_fnc_handleItem;} foreach life_oldVestItems;
		};
	};
};

//Check Backpack
if((life_clothing_purchase select 4) == -1) then
{
	if(life_oldBackpack != backpack player) then
	{
		if(life_oldBackpack == "") then {removeBackpack player;} else
		{
			removeBackpack player;
			player addBackpack life_oldBackpack;
			{[_x,true,true] call life_fnc_handleItem;} foreach life_oldBackpackItems;
		};
	};
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
//Hotfix in for cop gear
if(playerSide == west) then
{
	[] call life_fnc_saveGear;
};

//["Clothing_shop"] spawn life_fnc_spotShop;