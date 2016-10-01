#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west:
	{
		ctrlShow[2011,false];		//Gang
		ctrlShow[2030,false];
	};

	case civilian:
	{
		ctrlShow[2012,false];		//interpol?
		if(!(license_civ_bounty_hunter)) then
		{
			ctrlShow[2030,false];		//interpol pour bounty hunter (ladis)
		};
	};

	case east:
	{
		ctrlShow[2012,false];		//interpol?
		if(!(license_civ_bounty_hunter)) then
		{
			ctrlShow[2030,false];		//interpol pour bounty hunter (ladis)
		};
	};

	case independent:
	{
		ctrlShow[2011,false];		//Gang
		ctrlShow[2012,false];
		ctrlShow[2050,false];
		ctrlShow[2030,false];
	};
};

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};
[] spawn life_fnc_updateInvoAllies; //Komodo: let's use this event to get allies list updated.