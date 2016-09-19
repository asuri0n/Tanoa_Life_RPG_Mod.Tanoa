#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end","_handle"];

//Sauvegarde de la position
_playerPosition = med_position;
//diag_log format ["%1",_playerPosition]; //For debugging

player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

	if((__GETC__(life_medicLevel)) < 1) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};

player setVariable ["AGM_IsMedic", true, true]; //Komodo: nécessaire pour @AGM
player setVariable["mediclevel", __GETC__(life_mediclevel), true];

life_actions = life_actions + [player addAction["Voir les inconscient",life_fnc_med,"",0,false,false,"",' playerside == independent ']];
//life_actions = life_actions + [player addAction["Réanimation",life_fnc_revivedirect,"",0,false,false,"",' playerside == independent ']];
barrierMain = player addaction [("<t color=""#3333CC"">" + ("Barriers") +"</t>"),"core\warner\barrierMenu.sqf"]; 
[] call life_fnc_depanInitActions;

if (indep_gear isEqualTo []) then
{
	[] call life_fnc_medicLoadout;
}
else
{
	_handle = [] spawn life_fnc_civLoadGear;
	waitUntil {scriptDone _handle};
};


/*****
SAUVEGARDE DE LA POSITION
******/

diag_log "------------- Life is alive -------------";
diag_log format["med position: %1",med_position];
diag_log format["Life is alive: %1",life_is_alive];
diag_log "------------------------------------------------";

if (life_is_alive == 0 || (typeName _playerPosition != "ARRAY")) then{	
	[] call life_fnc_spawnMenu;	
	waitUntil{!isNull (findDisplay 38500)}; 	
	//Wait for the spawn selection to be open.
	
	waitUntil{isNull (findDisplay 38500)}; 
	//Wait for the spawn selection to be done.
	
	life_is_alive = true; 
	// Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
} else {				
	player setPos _playerPosition;						
	hint format["Vous êtes toujours en vie. Vous avez réapparu au même endroit."];			
	life_is_alive = true;
}; 


[] execVM "admintools\activate.sqf";

//player addAction ["<t color=""#C90000"">" + "Menu Radio" + "</t>", {[] call life_fnc_RadioKick}, [], 9, false, true, "", ""];
3 radioChannelAdd [player];

[] execVM "core\functions\tm4_fuelUptake.sqf";
[] spawn life_fnc_antiAFK;

invo_faction = "medic";
player setVariable ["invo_faction","medic",true];


//EMT Faction
invo_faction = "depan"; 
player setVariable ["invo_faction","depan",true];
player setVariable["depanlevel", __GETC__(life_depanlevel), true];

[] spawn  
{  
	while {true} do  
    {  
        waitUntil {uniform player == "U_Rangemaster"};  
        player setObjectTextureGlobal [0,"\vacation_textures\data\tenues\med\medic_uniform.paa"];  
        waitUntil {uniform player != "U_Rangemaster"};  
    };  
}; 