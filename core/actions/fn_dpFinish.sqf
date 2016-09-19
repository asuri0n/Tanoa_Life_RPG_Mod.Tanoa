/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price","_search"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_random = round(random 300);
_mini = 250;
_search = nearestObjects[getPos player,["Air"],(_mini + _random)];
if(count _search > 0) exitWith {hint "Il y a un hélicoptère à proximité dans les 500m.!"};
if(vehicle player != player) exitWith {hint "Interdiction de rendre la mission dans un vehicule"};//player is in vehicle
life_delivery_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(4.7 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
life_liquide = life_liquide + _price;
["DP Finish", false, _price] call life_fnc_antiCheatCash;