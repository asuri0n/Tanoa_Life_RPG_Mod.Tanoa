enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
[] execVM "fastrope.sqf" ;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];
life_versionInfo = "Tanoa Life RPG v3.1.3.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Market prices generated!";

	/*
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
	*/
};
if (hasInterface) then {[] execVM "monitor\info.sqf";};
//[] execVM "anti-hack.sqf";

//[] execVM "core\inventory\init.sqf";

StartProgress = true;

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};

/* Komodo: j'y comprends rien...!
if (isDedicated) then
{
	execFSM "core\fsm\server.fsm"; //Komodo: added for market random changes
};
*/

/////////////////////////////////////
//    Réglages Task Force Radio    //
/////////////////////////////////////
/*
tf_radio_channel_name = "SALON TFR";  // Nom du Channel TeamSpeak
tf_radio_channel_password = "12691269";  // Mot de passe du channel TeamSpeak
TF_terrain_interception_coefficient = 4.0;  // Réglage de l'interception sur le terrain
player setVariable ["tf_unable_to_use_radio", false];  // Permet d'autoriser la radio ou non ( False = autoriser, true = refuser )
tf_no_auto_long_range_radio = true;  // Permet de donner une radio long porter ou non
*/