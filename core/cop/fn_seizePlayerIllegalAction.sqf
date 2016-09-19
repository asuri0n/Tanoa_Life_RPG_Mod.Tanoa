/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	Traduction : Skydred
	Description:
	Removes the players weapons client side
*/

private["_weaponsP", "_mags"];

_weaponsP = weapons player;
{player removeWeapon _x} forEach _weaponsP;
_mags = magazines player;
{player removeMagazineGlobal _x} forEach _mags;
//if (uniform player in ["U_gendarme","U_B_CombatUniform_mcam_worn"]) then {removeUniform player;};
//if (vest player in ["V_HarnessOGL_brn"]) then {removeVest player;};
//license_civ_gun = false;
//[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
//[] call life_fnc_civLoadGear;
titleText["Vos armes ont été saisies.","PLAIN"];