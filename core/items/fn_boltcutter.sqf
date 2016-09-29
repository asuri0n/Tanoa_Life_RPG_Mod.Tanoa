/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Ceci n'est pas une porte."};
if({side _x == west} count playableUnits < 2) exitWith {hint "Il faut 2 gendarmes connectés pour pouvoir braquer une maison"};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
if(_building in invo_bank_buildings) then {
	[[1,"<t color='#ff0000' shadow='2' size = '1.2'>Alerte !</t><br /><t color='#ff0000' shadow='2' size = '1'>La banque fédérale<br />est en train de se faire braquer!</t>",true,[]],"life_fnc_broadcast",true,false] call life_fnc_MP;
} else {
	[[0,"%1 a été vu rentrant dans une maison par effraction.",true,[profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint "Vous n'êtes pas près d'une porte!"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "La porte est déjà débloqué!"};
life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/

//Setup the progress bar
disableSerialization;
_title = "Crochetage de la serrure";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.008;}
};

if(_building in invo_bank_buildings) then {
	_cpRate = 0.0025; // 0.26/0.0025 -> 104 sec
} else {
	_cpRate = 0.002;
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "Action Annulée","PLAIN"]; life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/
if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;