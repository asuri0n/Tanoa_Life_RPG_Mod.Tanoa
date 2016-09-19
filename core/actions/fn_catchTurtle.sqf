/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: Komodo

	Description:
	Catches a dead turtle?
	Komodo: Spawns a new one!
*/
private["_obj","_newTurtle","_inArea"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if (life_action_inUse) exitWith {hint "Arrête de massacrer les touches de ton clavier!";};
life_action_inUse = true;
player setVariable ["AGM_canTreat", false, true];

_inArea = false;
_listAreas = ["turtle_1","turtle_2","turtle_3"];

{
	if ((player distance (getMarkerPos _x)) < 350 ) then
	{
		_inArea = true;
	};
} forEach _listAreas;

if(!_inArea) exitWith { titleText["Vous devez être dans la zone de pèche illégale pour ramasser la tortue","PLAIN"]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};

if (!license_civ_turtle) exitWith {hint "Vous devez posséder une licence de vendeur de Tortues pour apprendre comment récupérer de la viande de tortues!"; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};

if(([true,"turtle",2] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];

	//if turtle catched, spawns a new one in a determined radius.
	//_newTurtle = createAgent ["Turtle_F", position player, [], 20, "NONE"]; //killing this makes the Turtle disappear... Impossible to get them simply not alive!
}
else {
	if(([true,"turtle",1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];

		//if turtle catched, spawns a new one in a determined radius.
		//_newTurtle = createAgent ["Turtle_F", position player, [], 20, "NONE"]; //killing this makes the Turtle disappear... Impossible to get them simply not alive!
	}
	else
	{
		hint "Tu n'as plus assez de place dans ton inventaire.";
	};
};

life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];