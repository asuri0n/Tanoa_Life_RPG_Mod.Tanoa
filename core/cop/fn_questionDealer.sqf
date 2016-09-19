/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_names"];
_sellers = (_this select 0) getVariable["sellers",[]];
if(count _sellers == 0) exitWith {hint "Personne est venu dealer ici ! Ne me faite pas de mal !"}; //No data.
life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/

_names = "";
{
	if(_x select 2 > 150000) then
	{
		_val = round((_x select 2) / 16);
	};
	[_x select 0,_x select 1,"483",_val] call INVO_fnc_wantedAdd;
	_names = _names + format["%1<br/>",_x select 1];
} foreach _sellers;

hint parseText format["Des personnes m'ont effectivement vendu de la marchandise.<br/><br/>%1",_names];
(_this select 0) setVariable["sellers",[],true];
/*player setVariable ["AGM_canTreat", true, true];*/
life_action_inUse = false;