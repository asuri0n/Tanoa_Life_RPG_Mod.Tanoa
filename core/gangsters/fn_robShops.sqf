/*
	file: fn_robShops.sqf
	Author: MrKraken
	Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
	Description:
	Executes the rob shob action!
	Modified by: KrisSerbia
	Translated & Edited by Johnny.
*/

private["_robber","_shop","_timer","_funds","_pos","_dist","_action","_cooldownTime","_lastRobbery","_marker","_markerName","_msg","_nbCops","_answer","_handle"];

_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;//Action name
_timer = 120;//Time for the robbery to be completed
_funds = 10000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_cooldownTime = 20*60; //Komodo: cooldown time, use to prevent someone else from farming this...!
_dist = _robber distance _shop;//Distance beetwen the robber and the shop owner
_lastRobbery = _shop getVariable ["lastRobbery",-2000]; //Komodo: we put default last robbery to -2000 to ensure people can start right from the beginning of game. Can be adjusted if necessary.

INVO_robShops_Result = true;

_nbCops = {(side _x == west)} count allUnits;
if (_nbCops < 3) exitWith {hint "Pas assez de Gendarmes sur l'île pour autoriser cette action, il en faut 3 minimum.";};

if (vehicle player == _robber && {alive _robber} && {currentWeapon _robber != ""} && {_funds > 0}) then
{

	if(vehicle player != _robber) exitWith { hint "Tu dois quitter le véhicule pour braquer ce vendeur !"; }; //If the player is in a vehicle, kill the script execution with a message to the player
	if(time < (_lastRobbery + _cooldownTime)) exitWith {hint "Ce magasin n'a plus un rond!";};
	hint format ["Braquage en cours ! Veuillez patienter %1 secondes.",_timer];
	_shop setVariable ["lastRobber", getPlayerUID player,true];
	_shop setVariable["lastRobbery", time, true];
	if (random(2) > 1) then
	{
		//50% de chances de voir le PNJ avertir les forces de l'ordre avec une alarme
		_msg = "[PNJ]: Vol en cours, venez m'aider!";
		[[_msg,player,1],"INVO_fnc_clientReceiveMessage",west,false] spawn life_fnc_MP;
		[[getPosATL player, player, "cop", "Braquage en cours", "ColorRed"],"INVO_fnc_addMarker",west,false] spawn life_fnc_MP;
		[[0,format["Un braquage en cours au %1",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Préviens les flics
	};

	_handle = [_shop, _robber, _timer] spawn life_fnc_robbery;
	waitUntil {scriptDone _handle;};
	if (!INVO_robShops_Result) exitWith {};

	_lastRobber = _shop getVariable ["lastRobber",""];

	if (_lastRobber != (getPlayerUID player)) exitWith
	{
		hint "Seul un des braqueurs récupère la caisse. Bien essayé, ceci est enregistré dans les logs.";
		[[format["%1 a tenté de glitch la fonction robShops",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
	};

	life_liquide = life_liquide + _funds;
	["robShops", false, _funds] call life_fnc_antiCheatCash;
	[getPlayerUID _robber,name _robber,_robber,"211"] call life_fnc_addWantedCond;
	hint format["Vous avez volé un montant de $%1",_funds];

	//Komodo: second part of robbery, longer, but way more interesting!
	_answer = [
		format["<t color='#8cff9b'>Veux-tu continuer le braquage et t'attaquer au coffre? Cela prendra 4 minutes de plus et te rapportera bien plus que les fonds de caisse...</t>"],
		"Braquage!",
		"Oui",
		"Non"
	] call BIS_fnc_guiMessage;

	if (!_answer) exitWith {};

	_timer = 300;

	if (random(2) > 0.5) then
	{
		//75% de chances de voir le PNJ avertir les forces de l'ordre avec une alarme
		_msg = "[PNJ]: Vol en cours, ça dure, sortez-vous les doigts du cul!";
		[[_msg,player,1],"INVO_fnc_clientReceiveMessage",west,false] spawn life_fnc_MP;
		[[getPosATL player, player, "cop", "Braquage en cours", "ColorRed"],"INVO_fnc_addMarker",west,false] spawn life_fnc_MP;
		[[0,format["Un braquage en cours au %1",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Préviens les flics
	};

	_handle = [_shop, _robber, _timer] spawn life_fnc_robbery;
	waitUntil {scriptDone _handle;};
	if (!INVO_robShops_Result) exitWith {};

	life_liquide = life_liquide + 60000;
	["robShops", false, 60000] call life_fnc_antiCheatCash;
	[getPlayerUID _robber,name _robber,_robber,"211"] call life_fnc_addWantedCond;
	hint format["Vous avez volé un montant de $%1",50000];
}
else
{
	hint "Tu ne peux pas être dans un véhicule et il te faut une arme!";
};