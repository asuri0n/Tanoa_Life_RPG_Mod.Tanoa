/*
    File: fn_busDriverCall.sqf
    Author: Ladislas with Komodo
    Date : 22/01/2014

    Description:
    People can call a free bus when one is available. This program send an automatic message to the bus driver group (if exist)
*/

private ["_nbChauffeurs","_messageClient","_msg","_dist","_busPlusProche"];

if (time < (invo_lastBusCall + 60)) exitWith {hint "Tu ne peux faire qu'un appel par minute";};

invo_lastBusCall = time;

{
	if (isNull _x) then
	{
		invo_busDrivers deleteAt _foreachIndex;
	};
} forEach invo_busDrivers;

//Komodo: il faut ne compter que ceux toujours connectés (méthode à tester)
_nbChauffeurs = {!(isNull _x)} count invo_busDrivers;

if(_nbChauffeurs == 0) exitwith {hint "Aucun bus n'est disponible actuellement";};

_dist = player distance (invo_busDrivers select 0);
_busPlusProche = invo_busDrivers select 0;

{
	if(!(isNull _x) && {player distance _x <= _dist}) then
	{
		_dist = player distance _x;
		_busPlusProche = _x;
	};
} count invo_busDrivers;

_messageClient = format["Le bus conduit par %1 a été averti de votre demande. Il est actuellement à %2 mètres de vous. Patience !",name _busPlusProche, _dist];
hint _messageClient;

_msg = "Un client attend un bus, tu es le plus proche. Regarde ta carte pour voir le point où attend la personne";
[[_msg,player,8],"INVO_fnc_clientReceiveMessage",_busPlusProche,false] spawn life_fnc_MP;
[[getPosATL player, player, "", "Appel de bus", "ColorOrange"],"INVO_fnc_addMarker",_busPlusProche,false] spawn life_fnc_MP;
