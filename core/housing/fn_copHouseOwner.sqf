/*
	Displays the house owner
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Cette maison n'a pas de propriétaire."};
hint parseText format["<t color='#FF0000'><t size='2'>Propriétaire :</t></t><br/>%1",(_house getVariable "house_owner") select 1];