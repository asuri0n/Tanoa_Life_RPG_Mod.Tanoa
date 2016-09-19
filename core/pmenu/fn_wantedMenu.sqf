#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_crimes","_listPlayers","_listCrimes"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Etablissement de la connexion..."];


ctrlShow[2411,false];//unvisible text manually add

if((__GETC__(life_coplevel) < 7 && __GETC__(life_adminlevel) == 0) OR (playerSide == civilian)) then
{

	//restric vision for some buttons to low cops
	ctrlShow[2405,false];//unvisible pardon button
	ctrlShow[2406,false];//unvisible button manually add
	ctrlShow[2407,false];//unvisible player list manually add
	ctrlShow[2408,false];//unvisible crimes list manually add
	ctrlShow[2409,false];//unvisible text manually add

	if (license_civ_bounty_hunter) then
	{
		ctrlShow[2411,true];//visible text manually add
		ctrlShow[2405,true];//visible pardon button
	};
}
else{


	//------------------------------------------------------
	//section added 04/28/2014

	_listPlayers = _display displayCtrl 2407;
	_listCrimes = _display displayCtrl 2408;
	lbClear _listPlayers;
	lbClear _listCrimes;
	//we do the work only if the cops have enought coplevel (optimisation)
	//we init crimes combobox
	{
	    _listCrimes lbAdd (_x select 1);//we add crimes names
	    _listCrimes lbSetData [(lbSize _listCrimes)-1,(_x select 0)];//we add crimes values
	} forEach life_crimes;

	//we will find all players conencted (we exclude cops) and init suspect players combobox
	{
	   if (((side _x) != West) AND ((side _x) != independent)) then
	   {
	      _listPlayers lbAdd (name _x);//we add players names
	      _listPlayers lbSetData [(lbSize _listPlayers)-1, getPlayerUID _x];//we add players entities
	   };
	} forEach playableUnits;
	lbSort _listPlayers;
	//------------------------------------------------------
};

diag_log "passer dans wantedmenu";

[] call INVO_fnc_wantedFetch;