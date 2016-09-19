/*
	File: fn_barriereStop.sqf
	Author & Traduction : Skydred
	Description:
	cree la barriere et la place
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule.";
	if(([true,"barriereStop",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré la barriere Stop.","PLAIN"];
	};
};
if (player getVariable ["restrained",false]) exitWith { hint "Impossible d'effectuer cette action en étant menotté.";
	if(([true,"barriereStop",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré la barriere Stop.","PLAIN"];
	};
};
closeDialog 0;
private["_position","_barriereStop"];
_barriereStop = "Land_BarGate_F" createVehicle [0,0,0];
_barriereStop attachTo[player,[0.5,5.5,0.5]];
_barriereStop setDir 90;
_barriereStop setVariable["item",true];
_barriereStop setVariable["idleTime",time,true];
//Ajout 3.1.2 Sky
life_action_barriereStopDeploy = player addAction["Placer la Barrière Stop",{if(!isNull life_barriereStop) then {detach life_barriereStop; life_barriereStop = ObjNull;}; player removeAction life_action_barriereStopDeploy; life_action_barriereStopDeploy = nil;},"",999,false,false,"",'!isNull life_barriereStop'];
//Fin Ajout
life_barrierestop = _barriereStop;
waitUntil {isNull life_barrierestop};
//Ajout 3.1.2 Sky
if(!isNil "life_action_barriereStopDeploy") then {player removeAction life_action_barriereStopDeploy;};
//Fin Ajout
if(isNull _barriereStop) exitWith {life_barrierestop = ObjNull;};
_barriereStop setPos [(getPos _barriereStop select 0),(getPos _barriereStop select 1),0];
_barriere_interactive setDamage 0;
_barriere_interactive enableSimulation false;
_barriere_interactive allowDamage false;
//Ajout 3.1.2 Sky
life_action_barriereStopPickup = player addAction["Récupérer la Barrière Stop",life_fnc_packupBarriereStop,"",0,false,false,"",
' _barriereStops = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_barriereStops" && !isNil {(_barriereStops getVariable "item")}'];
//Fin Ajout