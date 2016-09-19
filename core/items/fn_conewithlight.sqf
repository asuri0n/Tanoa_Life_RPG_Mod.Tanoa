/*
	File: fn_conewithlight.sqf
	Author & Traduction : Skydred
	Description:
	cree le plot et la place
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule.";
	if(([true,"conewithlight",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré le plot lumineux.","PLAIN"];
	};
};
if (player getVariable ["restrained",false]) exitWith { hint "Impossible d'effectuer cette action en étant menotté.";
	if(([true,"conewithlight",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré le plot lumineux.","PLAIN"];
	};
};
closeDialog 0;
private["_position","_barriere"];
_barriere = "RoadCone_L_F" createVehicle [0,0,0];
_barriere attachTo[player,[0,2,0.5]];
_barriere setDir 90;
_barriere setVariable["item",true];
_barriere setVariable["idleTime",time,true];
//Ajout 3.1.2 Sky
life_action_barriereDeploy = player addAction["Placer le plot lumineux",{if(!isNull life_barriere) then {detach life_barriere; life_barriere = ObjNull;}; player removeAction life_action_barriereDeploy; life_action_barriereDeploy = nil;},"",999,false,false,"",'!isNull life_barriere'];
//Fin Ajout
life_barriere = _barriere;
waitUntil {isNull life_barriere};
//Ajout 3.1.2 Sky
if(!isNil "life_action_barriereDeploy") then {player removeAction life_action_barriereDeploy;};
//Fin Ajout
if(isNull _barriere) exitWith {life_barriere = ObjNull;};
_barriere setPos [(getPos _barriere select 0),(getPos _barriere select 1),0];
_barriere setDamage 1;

_barriere addAction["Récupérer le cone.",'[] call life_fnc_packupConewithlight;'];