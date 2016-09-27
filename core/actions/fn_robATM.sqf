/*
file: fn_robATM.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Traduit par Myzzer
Description:
vous permet de faire des braquages au ATM de votre choix
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_kassa = 50000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bi.../wiki/addAction). Give it a try and post below
_action = [_this,2] call BIS_fnc_param;//Action name
_rip = false;

if(side _robber != civilian) exitWith { hint "Vous ne pouvez pas voler cette ATM!" };
if(_robber distance _shop > 2) exitWith { hint "Vous devez etre a 2m de l'ATM!" };
if (_rip) exitWith { hint "Vole en cours!" };
if (vehicle player != _robber) exitWith { hint "Sortez de votre véhicule!" };
_nbCops = {(side _x == west)} count allUnits;
if (_nbCops < 3) exitWith {hint "Pas assez de Gendarmes sur l'île pour autoriser cette action, il en faut 3 minimum.";};

//if(!(license_civ_gangster)) exitWith { hint "Vous ne pouvez pas voler cette ATM!" };
if(!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith { hint "Vous n'avez pas de pince coupante"};
if (_kassa == 0) exitWith { hint "Il n'y a pas de tresorerie dans la machine!" };



_answer = [
	format["<t color='#8cff9b'>Veux-tu continuer le braquage et t'attaquer au coffre ?</t>"],
	"Braquage!",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if (!_answer) exitWith {hint "Tapette !"};

_rip = true;
_kassa = _kassa + round(random 50000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";

hint "L'ATM a une alarme silencieuse, la milice a ete alerte!";
//50% de chances de voir le PNJ avertir les forces de l'ordre avec une alarme
_msg = "[ATM]: Alarme enclenché a un ATM!";
[[_msg,player,1],"INVO_fnc_clientReceiveMessage",west,false] spawn life_fnc_MP;
[[getPosATL player, player, "cop", "Braquage en cours", "ColorRed"],"INVO_fnc_addMarker",west,false] spawn life_fnc_MP;
[[0,format["Un braquage en cours l'ATM de %1",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Préviens les flics
[[0,format["Un braquage en cours l'ATM de %1",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Préviens les flics
[[0,format["Un braquage en cours l'ATM de %1",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Préviens les flics
[[0,format["Un braquage en cours l'ATM de %1",_shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Préviens les flics
[[player],"life_fnc_GPS_Sound",nil,true] spawn life_fnc_MP;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Vole en cours, rester proche (2m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;


if(_rip) then
{
	while{true} do
	{
		sleep 1;
		_cP = _cP + 0.005;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Vole en cours, rester proche (2m) (%1%2)...",round(_cP * 100),"%"];
		_Pos = position player; // by ehno: get player pos
	   _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
	   "Marker200" setMarkerColor "ColorRed";
	   "Marker200" setMarkerText "!ATTENTION! vole ATM !ATTENTION!";
	   "Marker200" setMarkerType "mil_warning";
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 2.5) exitWith { };
		if!(alive _robber) exitWith {};
	};

	if!(alive _robber) exitWith { _rip = false; };
	if(_robber distance _shop > 2.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hint "Vous devez etre dans un rayon de 2m pour voler l'ATM! - Maintenant l'ATM est verrouillé."; 5 cutText ["","PLAIN"]; _rip = false; };
	5 cutText ["","PLAIN"];

	titleText[format["Vous avez voler $%1, Maintenant il faut partir avent que la milice arrive!",[_kassa] call life_fnc_numberText],"PLAIN"];
	deleteMarker "Marker200"; // by ehno delete maker
	life_liquide = life_liquide + _kassa;

	_rip = false;
	life_use_atm = false;
	sleep (30 + random(180));
	life_use_atm = true;
	if!(alive _robber) exitWith {};
	[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 1800;
_action = _shop addAction["Voler l'ATM",life_fnc_robATM];
_shop switchMove "";