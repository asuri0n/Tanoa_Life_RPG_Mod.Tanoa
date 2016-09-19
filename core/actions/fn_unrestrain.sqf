/*
	File: fn_unrestrain.sqf
*/
private["_unit","_ziptiesOwners"];

if (isServer && isDedicated) exitWith {};

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_ziptiesOwners = _unit getVariable ["ziptiesOwners",[]];

if (!(player in _ziptiesOwners)) exitWith {hint "Impossible de libérer cette personne, tu n'as pas les clefs de ses menottes.";};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
_unit setVariable["ziptiesOwners",[],true];
detach _unit;

[[0,format["%1 a été relaché par %2",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;
[[player, "Cuff",10],"life_fnc_playSound",true,false] spawn BIS_fnc_mp;
playSound3D ["sounds/cuff.ogg",player,false,getPosASL player, 1, 1, 10];
if (playerSide == civilian) then
{
	if ([true,"ziptie",1] call life_fnc_handleInv) then {hint "Les menottes ont été remises dans ton inventaire.";}
	else {hint "Tu as démenotté cette personne, mais tu n'as plus de place dans ton inventaire pour récupérer les menottes";};
};
player enableSimulation true;
life_action_inUse = false;
/*player setVariable ["AGM_canTreat", true, true];*/