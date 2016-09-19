/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the client.
*/
private["_cop","_player"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (60 * 60)};

		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith {
			player setVariable["restrained",FALSE,TRUE];
			player setVariable["Escorting",FALSE,TRUE];
			player setVariable["transporting",false,true];
			detach player;
			titleText["Vous avez été libéré automatiquement","PLAIN"];
			[[player, "Cuff",10],"life_fnc_playSound",true,false] spawn BIS_fnc_mp;
			playSound3D ["sounds/cuff.ogg",player,false,getPosASL player, 1, 1, 10];

		};
	};
};
if (side _cop == west) then {
	titleText[format["Vous avez été menotté par %1",_cop getVariable["realname",name _cop]],"PLAIN"];
	[[player, "Cuff",10],"life_fnc_playSound",true,false] spawn BIS_fnc_mp;
	playSound3D ["sounds/cuff.ogg",player,false,getPosASL player, 1, 1, 10];
} else {
	titleText[format["Vous avez été mise sous camisole par %1",_cop getVariable["realname",name _cop]],"PLAIN"];
	[[player, "Cuff",10],"life_fnc_playSound",true,false] spawn BIS_fnc_mp;
	playSound3D ["sounds/cuff.ogg",player,false,getPosASL player, 1, 1, 10];
};



while {player getVariable "restrained"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";

	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};

	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;

	};

	if(!alive _cop) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;

	};

	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};

	};
};

//disableUserInput false;

if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};