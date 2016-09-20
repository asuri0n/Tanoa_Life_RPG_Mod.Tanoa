/*
File : fn_civShowPassport.sqf
Create : Black Lagoon
Edit : Deathblade
*/

private["_target", "_message","_queryResult","_playerNationalite","_sexe"];

_target = cursorTarget;
_playerNationalite = player getVariable ["playerNationalite",0];

if(playerSide != civilian) exitWith { hint "Vous n'êtes pas un civil !";};

if(_playerNationalite == "Clandestin") exitWith { hint "Tu n'as pas de passport ...";};

if(isNull _target) then {_target = player;};

if(!(_target isKindOf "Man") ) then {_target = player;};

if(!(alive _target) ) then {_target = player;};

if (VACA_SERV_DEBUG) then
{
	diag_log "------------- CIV PASSPORT client -------------";
	diag_log format["Result AGE: %1",			player getVariable ["playerAge",0]];
	diag_log format["Result SEXE: %1",			player getVariable ["playerSexe",0]];
	diag_log format["Result NATIONALITE: %1",	player getVariable ["playerNationalite",0]];
	diag_log "------------------------------------------------";
};

if(player getVariable ["playerSexe",0] == "1") then {
	_sexe = "Homme";
} else {
	_sexe = "Femme";
};

_message = format["<img size='10' color='#FFFFFF' image='textures\passport.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1'>Citoyen de Tanoa</t><br/> Age : %2<br/>Sexe : %3<br/>Nationalite : %4", name player, player getVariable ["playerAge",0],_sexe, player getVariable ["playerNationalite",0]];

[[player, _message],"life_fnc_civPassportShown",_target,false] spawn life_fnc_MP;
