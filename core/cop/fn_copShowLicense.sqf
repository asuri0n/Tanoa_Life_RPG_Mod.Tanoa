#include <macro.h>
/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Deathblade
*/

private["_target", "_message","_rang","_image"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Vous n'êtes pas un flic !";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_image = "insigne.paa";
switch (__GETC__(life_coplevel)) do
{
	case 1: { 
		_rang = "Réserviste"; 
	};
	case 2: { 
		_rang = "Gendarme"; 
	};
	case 3: { 
		_rang = "Adjudant"; 
	};
	case 4: { 
		_rang = "Lieutenant"; 
	};
	case 5: { 
		_rang = "Major"; 
	};
	case 6: { 
		_rang = "Colonel"; 
	};
	case 7: { 
		_rang = "Groupe Intervention Gendarmerie Nationale"; 
	};
	case 8: { 
		_rang = "Général"; 
	};
	default {
		_rang = "Erreur";
	};
};

_message = format["<img size='10' color='#FFFFFF' image='\vacation_textures\data\%3'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Gendarme de Tanoa</t>", name player, _rang,_image];

[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
