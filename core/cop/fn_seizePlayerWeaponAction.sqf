/*
        File: fn_seizePlayerWeaponAction.sqf
        Author: Skalicon
        Traduction : Skydred
        Description:
        Removes the players weapons client side
        EDIT La10 : 21/02/2015 Test pour voir si la fonction ne peut retirer QUE les armes et pas tout ce qu'il y a dans le sac !
*/

private["_weaponsP", "_mags"];

_weaponsP = weapons player;
{player removeWeapon _x} forEach _weaponsP;
_mags = magazines player;
{player removeMagazineGlobal _x} forEach _mags;

//removeAllWeapons player;
license_civ_gun = false;
[] call life_fnc_civFetchGear;
[] call life_fnc_civLoadGear;
titleText["Toutes vos armes ont été saisies.","PLAIN"];