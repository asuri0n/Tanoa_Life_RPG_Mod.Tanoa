/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.
*/

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
player forceAddUniform "U_Rangemaster";
player addBackpack "B_Carryall_mcamo";