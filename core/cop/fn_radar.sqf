/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon

	Description:
	Looks like weird but radar?
*/

if(((playerSide == civilian) OR (playerSide == east)) AND ((license_civ_rebel) OR (license_civ_gangster) OR (!(license_civ_bounty_hunter)))) exitWith {};
private ["_speed","_vehicle","_primary","_handgun","_curWep"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;
_primary = primaryWeapon _vehicle;
_handgun = handGunWeapon _vehicle;
_curWep = currentWeapon _vehicle;


if((currentWeapon player) == "rangefinder") then
{
	if(playerSide == west) then
	{
		switch (true) do
		{
			case ((_speed > 33 && _speed <= 80)) :
			{
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Vitesse %1 km/h<br /><t>Analyse Faciale.... Il s'agit de %2</t>",round _speed,name _vehicle];
			};

			case ((_speed > 100)) :
			{
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vitesse %1 km/h<br /><t>Analyse Faciale.... VEHICULE TROP RAPIDE</t>",round  _speed];
			};
			case ((_speed < 5) && (_vehicle isKindOf "Man")) :
			{

			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Resultat Analyse Faciale <br/><t color='#FF0000'><t align='center'><t size='1'> %1",[cursortarget] call life_fnc_getPlayerName];
			/*if((_primary OR _handgun OR _curWep) in life_rebelweapons) then {hint parseText format ["<t color='#FF0000'><t align='center'><t size='1'> ATTENTION ARME REBELLE 		!!!!!!"]};
			A redéfinir variable cause string string strrrrrrrriiiiiiiiiiiiing
			*/
			};
		};
	}
	else
	{
		switch (true) do
		{
			case (_speed <= 130) :
			{
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Reconnaissance faciale<br/><t color='#33CC33'><t align='center'>Il s'agit de %1</t>",name _vehicle];
			};

			case (_speed > 130) :
			{
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Reconnaissance faciale<br/><t color='#FF0000'><t align='center'>ERREUR ANALYSE.... VEHICULE TROP RAPIDE</t>"];
			};
			case ((_vehicle isKindOf "Man")) :
			{
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Reconnaissance faciale<br/><t color='#FF0000'><t align='center'><t size='1'> %1",[cursortarget] call life_fnc_getPlayerName];
			};
		};
	};
};
