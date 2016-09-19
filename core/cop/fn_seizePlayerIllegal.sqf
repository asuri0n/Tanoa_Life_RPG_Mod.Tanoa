/*
	File: fn_seizePlayerWeapon.sqf
	Author: Skalicon
	Traduction : Skydred	
	Description:
	Preforms the seizePlayerWeaponAction script on the cursorTarget
*/
[[],"life_fnc_seizePlayerIllegalAction",cursorTarget,false] spawn BIS_fnc_mp;
//titleText format["Saisie des armes de %1", name cursorTarget];