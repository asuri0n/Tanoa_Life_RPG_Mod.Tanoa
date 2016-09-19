/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Picks up money
*/
private["_obj","_val","_randomFlag"];

if((time - life_action_delay) < 2) exitWith {
	hint "Tu ne peux pas utiliser les touches d'interactions aussi vite !";
	if(!isNil {(_this select 0) getVariable "inUse"}) then {
		_this select 0 setVariable["inUse",false,true];
	};
};
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_randomFlag = round(random(10000));

_obj setVariable ["accessed_by", _randomFlag, true];
hint "Il te faut 10 secondes pour ramasser ces billets.";
sleep (10);
if ((_obj getVariable ["accessed_by",0]) != _randomFlag) exitWith {hint "Action impossible à plusieurs.";};

_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj setVariable["inUse",false,true];};};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
_obj setVariable["PickedUp",TRUE,TRUE];
if(!isNil {_val}) then
{
	deleteVehicle _obj;
	//waitUntil {isNull _obj};

	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 20000000) : {_val = 100000;}; //VAL>20mil->100k
		case (_val > 5000000) : {_val = 250000;}; //VAL>5mil->250k
		default {};
	};

	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format["Tu as ramassé $%1",[_val] call life_fnc_numberText],"PLAIN"];
	life_liquide = life_liquide + _val;
	["pickupMoney", false, _val] call life_fnc_antiCheatCash;
	life_action_delay = time;
};
