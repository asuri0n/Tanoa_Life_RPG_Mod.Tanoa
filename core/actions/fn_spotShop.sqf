#include <macro.h>

/*
	File: fn_spotShop.sqf
	Author: Ladislas Robin

	Description:
	Spot a suspect when he does an action where the script is place, indicate the position and name of the place (str) where he's spot.
*/

private["_place", "_pos","_research","_proba"];

_place = _this select 0;
_pos = getPosATL player; //position du suspect !
_research = false;
_research = !(([player] call INVO_fnc_wantedPerson) isEqualTo []);	//Le suspect est-il recherché ?
_proba = round random 3; //une chance sur x+1
//if(_research) then {hint "Attention ! Ce vendeur pourrait te reconnaître vu que tu es recherché !";};
sleep 5; //histoire de laisser le vendeur prendre ses esprits
/*
if(_research && (_proba == 1)) then
{
	hint "Cette personne vous a reconnu sur une affiche 'Wanted', il a renseigné les chasseurs de prime sur votre position !";
	[[_pos,name player],"life_fnc_spotShopMarker",true,false] spawn life_fnc_MP;
};
*/