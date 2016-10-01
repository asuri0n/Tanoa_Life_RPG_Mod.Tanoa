/*
	File: fn_farmingToolUse.sqf
	Author: Komodo

	Description:
	Main functionality to handle what happens when a farming tool is used.
*/
private["_mine","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_tool","_starttime","_duration","_exitMessage","_iterationNumber","_displayText","_cpUp"];
_tool = _this select 0; //use to get the selected tool
//diag_log format["farmingToolUse init. Tool: %1",_tool];
/* Initial checks and actions */
closeDialog 0; //Close the interaction menu.
if(vehicle player != player) exitWith {hint "Tu ne peux pas miner a partir d'une voiture";};

_resourceZones = ["or_area","argile_area","diamant_area","fer_area","souffre_area","charbon_area","uranium_area","petrole_area","foret_area_1","foret_area_2","foret_area_3","foret_area_4","lin_area","heroine_area","cocaine_area","marijuana_area","apple_area_1","apple_area_2","apple_area_3","apple_area_4","apple_area_5","apple_area_6","apple_area_7"];
_zone = "";
_mine = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 75) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
};

if (VACA_SERV_DEBUG) then
{
	diag_log format["farmingToolUse Zone: %1",_zone];
};

//Switching between pickaxe and machete, for now. With this method, other tools could be used later to enrich the game.
switch (_tool) do {
    case "pickaxe": {
    	/* pickaxe case for mines */
    	switch (_zone) do
		{
			case "or_area": 		{_mine = "goldp"; _val = 1;};
			case "argile_area": 	{_mine = "clayp"; _val = 1;};
			case "diamant_area": 	{_mine = "diamantp"; _val = 1;};
			case "fer_area": 		{_mine = "ironorep"; _val = 1;};
			case "souffre_area": 	{_mine = "souffrep"; _val = 1;};
			case "charbon_area": 	{_mine = "charbonp"; _val = 1;};
			case "uranium_area": 	{_mine = "uraniump1"; _val = 1.2;};
			case "petrole_area": 	{_mine = "oilpy"; _val = 1;};
			default {_mine = "";};
		};
		if(_mine == "") exitWith {_exitMessage = "Tu n'es pas proche d'une mine.";};
    };

    case "machete": {
    	/* machete case for plants */
    	switch (_zone) do {
    		case "foret_area_1": 	{_mine = "boisp"; _val = 0.66;};
    		case "foret_area_2": 	{_mine = "boisp"; _val = 0.66;};
    		case "foret_area_3": 	{_mine = "boisp"; _val = 0.66;};
    		case "foret_area_4": 	{_mine = "boisp"; _val = 0.66;};
			case "lin_area": 		{_mine = "linp"; _val = 1;};
			case "heroine_area": 	{_mine = "heroinpy"; _val = 1.2;};
			case "cocaine_area": 	{_mine = "cocainp"; _val = 1.2;};
			case "marijuana_area": 	{_mine = "marip"; _val = 1.2;};
			case "apple_area_1": 	{_mine = "apple"; _val = 0.66;};
			case "apple_area_2": 	{_mine = "apple"; _val = 0.66};
			case "apple_area_3": 	{_mine = "apple"; _val = 0.66;};
			case "apple_area_4": 	{_mine = "apple"; _val = 0.66;};
			case "apple_area_5": 	{_mine = "apple"; _val = 0.66;};
			case "apple_area_6": 	{_mine = "apple"; _val = 0.66;};

    	    default {_mine = "";};
    	};
    	if(_mine == "") exitWith {_exitMessage = "Tu n'es pas proche d'un champ.";};
	};

    default {
     	if(_mine == "") exitWith {_exitMessage = "Cet outil ne permet pas de récolter ce type de ressource";};
    };
};
if (_mine == "") exitWith {hint _exitMessage;};

_west = playersNumber west;
if((_mine == "heroinpy" OR _mine == "uraniump1"  OR _mine == "cocainp") && _west == 0)then
{
	titleText[format["Il n'y a pas de gendarmes de connecté. Tu peux toujours recolter mais tu ne pourras pas la traiter"],"PLAIN"];
};

/* testing now if we can put something in the player's inventory, and telling how many */
_diff = 0;
//Taille pour 100 places du produit
_diff = [_mine,100,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0 OR _val==0) exitWith {hint "Votre inventaire est rempli."};

//diag_log format ["farmingToolUse; diff: %1", _diff];
/* now we can launch the action */
life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/
_starttime = time;
_duration = round (3 * _diff / _val);

_profName = [_mine] call life_fnc_profType;

if (VACA_SERV_DEBUG) then
{
	diag_log format["[VACA_DEBUG] ===== RECOLTE DU %1 ======", _profName];
};

if( _profName != "" ) then {
	_data = missionNamespace getVariable (_profName);
	diag_log format["LEVEL %1", _data select 0];
	switch ( _data select 0 ) do {
		case 1: {
			_cpUp = 1.8;
		};
		case 2: {
			_cpUp = 1.61;
		};
		case 3: {
			_cpUp = 1.52;
		};
		case 4: {
			_cpUp = 1.44;
		};
		case 5: {
			_cpUp = 1.37;
		};
		case 6: {
			_cpUp = 1.3;
		};
		case 7: {
			_cpUp = 1.23;
		};
		case 8: {
			_cpUp = 1.17;
		};
		case 9: {
			_cpUp = 1.11;
		};
		case 10: {
			_cpUp = 1.05;
		};
		case 11: {
			_cpUp = 0.99;
		};
		case 12: {
			_cpUp = 0.94;
		};
		case 13: {
			_cpUp = 0.89;
		};
		case 14: {
			_cpUp = 0.85;
		};
		case 15: {
			_cpUp = 0.8;
		};
		case 16: {
			_cpUp = 0.75;
		};
		case 17: {
			_cpUp = 0.71;
		};
		case 18: {
			_cpUp = 0.68;
		};
		case 19: {
			_cpUp = 0.64;
		};
		case 20: {
			_cpUp = 0.61;
		};
		case 0: {
			_cpUp = 1.8;
		};
	};

	_duration = _cpUp * round((life_maxWeight - life_carryWeight)/([_mine] call life_fnc_itemweight))*([_mine] call life_fnc_itemweight) * _val;

	if (VACA_SERV_DEBUG) then
	{
		diag_log format["%1 * ((%2 - %3)/%6) * %4 = %5",_cpUp,life_maxWeight,life_carryWeight,_val,_duration,([_mine] call life_fnc_itemweight)];
	};
};

_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
hint format["Début de la récupération de ressources. %1 %2 seront récupérés en %3 secondes environ.",_diff,_itemName,_duration];
_displayText = format ["Récupération de %1 %2", _diff, _itemName];
[_duration,_displayText] spawn life_fnc_progressBar;

//handles interruption
life_interrupted = false;

for "_i" from 0 to (_duration/2.5) do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
	if (life_interrupted) exitWith {};
	if (vehicle player != player) exitWith {};
};

if (life_interrupted OR (vehicle player != player)) exitWith {hint "Action annulée, tu n'as rien récolté."; life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};

if (VACA_SERV_DEBUG) then
{
	diag_log format ["farmingToolUse; starttime: %1; endtime: %2", _starttime, time];
	diag_log "[VACA_DEBUG] ===== FIN ======";
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	titleText[format["Tu as récupéré %2 %1",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
/*player setVariable ["AGM_canTreat", true, true];*/