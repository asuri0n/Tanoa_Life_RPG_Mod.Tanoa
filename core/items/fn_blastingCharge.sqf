/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint "Ceci peut juste être utilisé sur un coffre."};
if(_vault getVariable["chargeplaced",false]) exitWith {hint "Il y a déja une charge de posée sur le coffre."};
if(_vault getVariable["safe_open",false]) exitWith {hint "Le coffre est déjà ouvert."};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?
if(!(_vault in invo_vaults)) exitWith {hint "Impossible de poser une charge ici.";};
if({side _x == west} count playableUnits < 2) exitWith {hint "Il doit y avoir 5 Gendarmes sur l'île pour que les coffres soient remplis"};

_vault setVariable["chargeplaced",true,true];
[[0,format["Une charge a été posé sur un coffre de la banque !",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[1,"Une charge d'explosifs a été posée sur le coffre de la banque, tu as jusqu'à la fin du temps pour désarmer la bombe!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
hint "Le décompte a commencé! Tuez tous les flics !!";
_handle = [_vault] spawn life_fnc_demoChargeTimer;
[[_vault],"life_fnc_demoChargeTimer",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(_vault getVariable["chargeplaced",false])) exitWith {hint "La charge a été désamorcée"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _vault select 0, getPosATL _vault select 1, (getPosATL _vault select 2)+0.5];
_vault setVariable["chargeplaced",false,true];
_vault setVariable["safe_open",true,true];

hint "La caisse est maintenant ouverte";