/*
	File: fn_barriere.sqf
	Author & Traduction : Skydred
	Description:
	cree la barriere et la place
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule.";
	if(([true,"barriere",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré la barriere.","PLAIN"];
	};
};
if (player getVariable ["restrained",false]) exitWith { hint "Impossible d'effectuer cette action en étant menotté.";
	if(([true,"barriere",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré la barriere.","PLAIN"];
	};
};
closeDialog 0;
private["_position","_barriere","_lightA"];
_barriere = "RoadBarrier_F" createVehicle [0,0,0];
_lightA = "Land_Flush_Light_red_F" createVehicle [0,0,0];
_lightA attachTo[_barriere,[0,0.03,0.7]];
_lightA setDir 90;
_lightA setVectorDirAndUp [[1,0,0],[0,1,0]];
_lightB = "Land_Flush_Light_red_F" createVehicle [0,0,0];
_lightB attachTo[_barriere,[0,-0.03,0.7]];
_lightB setVectorDirAndUp [[-1,0,0],[0,-1,0]];
_barriere attachTo[player,[0,2,0.5]];
_barriere setDir 90;
_barriere setVariable["item",true];
_barriere setVariable["idleTime",time,true];
//Ajout 3.1.2 Sky
life_action_barriereDeploy = player addAction["Placer la barrière",{if(!isNull life_barriere) then {detach life_barriere; life_barriere = ObjNull;}; player removeAction life_action_barriereDeploy; life_action_barriereDeploy = nil;},"",999,false,false,"",'!isNull life_barriere'];
//Fin Ajout
life_barriere = _barriere;
waitUntil {isNull life_barriere};
//Ajout 3.1.2 Sky
if(!isNil "life_action_barriereDeploy") then {player removeAction life_action_barriereDeploy;};
//Fin Ajout
if(isNull _barriere) exitWith {life_barriere = ObjNull;};
_barriere setPos [(getPos _barriere select 0),(getPos _barriere select 1),0];
_barriere setDamage 1;

_barriere addAction["Récupérer la Barrière",'[] call life_fnc_packupBarriere;'];
