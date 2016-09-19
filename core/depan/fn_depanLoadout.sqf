/*
	File: fn_depanLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the depan out with the default gear.
*/

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
//player addBackpack "B_Carryall_mcamo";
player addUniform "U_Dep";
//player addItem "ItemGPS"; //Graincheux: ajout GPS
//player assignItem "ItemGPS"; //Graincheux: ajout GPS
//player addItem "Toolkit"; //Graincheux: toolkit
//player addItem "Toolkit"; //add John
//player addItem "Toolkit"; //add John
//player addItem "Toolkit"; //add John