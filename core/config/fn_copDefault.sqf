/*
	File: fn_copDefault.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Default cop configuration.
*/
//Strip the player down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

//Load player with default cop gear.
player addUniform "U_Rangemaster";
player addVest "V_TacVest_gen_F";
player addWeapon "DDOPP_X26_b";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ToolKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";

[] call life_fnc_saveGear;