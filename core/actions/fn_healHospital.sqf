/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Doesn't matter, will be revised later.
*/
private["_nearPlayers","_medics"];

_independent = playersNumber independent;	
if(_independent > 0) exitWith {hint "Il y a des EMT sur l'île qui peuvent te soigner ! Action annulé";};
if(life_liquide < 500) exitWith {hint format[localize "STR_NOTF_HS_NoCash",500];};
hint "Patiente un peu le temps que l'on te soigne.";
sleep 20;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
hint "Tu est maintenant soigné!";

//Komodo: @AGM complete healing.
player setDamage 0;
//player setVariable ["AGM_Blood", 1, True];
//player setVariable ["AGM_isBleeding", False, True];
//player setVariable ["AGM_Painkiller", 1, True];
//player setVariable ["AGM_Pain", 0, True];

life_liquide = life_liquide - 500;
["Heal Hospital", false, -500] call life_fnc_antiCheatCash;

sleep 3;

hint "Cet hopital va aussi rechercher autour de toi s'il y a des blessés. Afin qu'ils puissent être réanimés, ils doivent d'abord ne plus saigner, tu dois donc t'occuper de tes blessés dans un premier temps. Cela ne fonctionnera pas si un ou plusieurs médecins sont actuellement en service sur l'île.";

sleep 10;

//Komodo: now healing units in 5m radius if no medic connected.
_medics = {(side _x == independent) && {_x getVariable ["invo_faction",""] == "medic"};} count allUnits;
if (_medics > 0) exitWith {};
hint "Pas de médecins sur l'île, on va regarder si tu nous as amené des blessés.";
sleep 10;

_nearPlayers = player nearEntities ["Man", 3];
if (count _nearPlayers > 0) then {hint "Ok, on va s'occuper de ce(s) blessé(s)!";}
else {hint "Pas de blessé autour de toi.";};

{
	//if (_x getVariable["AGM_isUnconscious",false] && {!(_x getVariable["AGM_isBleeding",false])}) then
	//{
		//revive
		//_x setVariable ["AGM_isUnconscious", False, True];
		//_x setVariable ["AGM_Blood", 1, True];
		//_x setVariable ["AGM_isBleeding", False, True];
		//_x setVariable ["AGM_Painkiller", 1, True];
		//_x setVariable ["AGM_Pain", 0, True];
		//[_x] call AGM_Medical_fnc_wakeUp;
	//};
	_x setDamage 0;
} forEach _nearPlayers;