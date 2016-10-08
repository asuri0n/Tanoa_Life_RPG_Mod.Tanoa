/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_glitch","_countDown","_time2"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time2 = [_this,2,-1,[0]] call BIS_fnc_param;
diag_log "JAILME";
if(_time2 == (-1)) then {_time2 = 30;};
if(_bad) then { _time = time + 1100; } else { _time = time + (_time2 * 60); };

if(count _ret > 0) then { life_bail_amount = [getPlayerUID player] call INVO_fnc_wantedComputeBounty; } else { life_bail_amount = 1500; _time = time + (_time2 * 60); };
_esc = false;
_bail = false;
_glitch = false;

hint format["Vous allez rester en prison pendant %1 minutes. Vous avez perdu votre permis de port d'arme.",_time2];

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
removeAllAssignedItems player;

player addUniform "U_B_HeliPilotCoveralls";
player setObjectTextureGlobal [0,"textures\tenues\prisonier.paa"];

[_bad, _time2] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep ((_this select 1) * 60);
	}
		else
	{
		sleep (5 * 60);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format["Temps restant:<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>Peut payer la caution: %3<br/>Prix: $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Oui"} else {"Non"}];
	};


	if(player distance (getMarkerPos "jail_marker") > 100) exitWith {
		_esc = true;
	};

	if(life_bail_paid) exitWith {
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};

	//anti glitch modif -- Si le mec est loin du marqueur et pas dans un véhicule: il a glitch !
	if((player distance (getMarkerPos "jail_marker") > 80) && (vehicle player == player)) exitWith {
		_glitch = true;
	};

	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint "Vous avez payé votre caution et vous êtes désormais libres.";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player] call INVO_fnc_wantedRemove;
		//[] call SOCK_fnc_updateRequest;
		[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)
	};

	case (_esc) :
	{
		life_is_arrested = false;
		hint "Vous vous êtes échappé de prison, vous conservez toujours vos crimes précédents.";
		[[0,format["%1 s'est échappé de prison!",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[getPlayerUID player,profileName,"901"] call INVO_fnc_wantedAdd;
	};

	case (_glitch) :
	{

		hint parseText "Vous avez essayé de sortir de la prison sans passer par un véhicule ( extraction hélico )<br/><br/>Vous êtes donc renvoyé en prison avec le <t color='#bf271d'>double de votre temps originel dans 15 secondes</t>.<br/>Votre <t color='#bf271d'>tentative de glitch</t> a également été loguée sur le serveur.<br/><br/>Cordialement, le <t color='#da9321'>staff Vacation Gaming</t>.
			";
		[[0,format["%1 a essayé de glitcher la prison!",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[format["%1 a essaye de glitcher la prison",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
		sleep 10;
		for "_i" from 5 to 1 do
		{
			hint parseText format["<t color='#da9321'>%1</t> secondes.", _i];
			sleep 1;
		};
		sleep 1;

		//needed to put into jail again
		life_is_arrested = false;

		//Auto Jail *2
		[[player,false,(_time2) *2],"life_fnc_jail",player,false] spawn life_fnc_MP;
	};

	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint "Vous avez donné de votre temps en prison et avez, par conséquent, été libéré. Prenez soin de vous !";
		[getPlayerUID player] call INVO_fnc_wantedRemove;
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		player addUniform "U_C_Poloshirt_blue";
		[] call life_fnc_playerSkins;
		//[] call SOCK_fnc_updateRequest;
		[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)
	};
};