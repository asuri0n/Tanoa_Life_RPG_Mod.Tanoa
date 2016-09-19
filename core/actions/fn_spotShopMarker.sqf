#include <macro.h>

/*
	File: fn_spotShopMarker.sqf
	Author: Ladislas Robin

	Description:
	Place a marker at the position with name given in parameters
*/
private["_str", "_pos","_marker"];

if (playerSide != civilian) exitWith {}; //Komodo: dans ce cas les variables du dessous sont inexistantes...

if((!(license_civ_rebel)) AND (!(license_civ_gangster)) AND (license_civ_bounty_hunter)) then
{
	_pos = _this select 0;
	_str = _this select 1;
	["DetectedSuspect",["Un suspect a été detecté !"]] call BIS_fnc_showNotification;
	hint format["Le suspect %1 A été aperçu ! Regardez votre carte ! Choppez-le vivant !", _str];
	_marker = createMarkerLocal ["Marker200", _pos]; //placer un marker pour un bounty hunter
	"Marker200" setMarkerColorLocal "ColorGreen";
	"Marker200" setMarkerTextLocal format["Suspect %1 aperçu", _str];
	"Marker200" setMarkerTypeLocal "mil_objective";

	sleep 120; //on attend 2 min avec le marker
	deleteMarker "Marker200"; //Suppression du marqueur
};