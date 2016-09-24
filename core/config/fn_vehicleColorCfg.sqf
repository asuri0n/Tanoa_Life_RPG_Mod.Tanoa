comment "Exported from Arsenal by Teodros Russo";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "U_B_GEN_Soldier_F";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {this addItemToUniform "30Rnd_65x39_caseless_mag";};
this addVest "V_Chestrig_rgr";
for "_i" from 1 to 2 do {this addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "MiniGrenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
for "_i" from 1 to 2 do {this addItemToVest "Chemlight_green";};
this addBackpack "B_AssaultPack_rgr_BTReconMedic";
this addItemToBackpack "Medikit";
for "_i" from 1 to 8 do {this addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 2 do {this addItemToBackpack "SmokeShellRed";};
this addItemToBackpack "SmokeShellBlue";
this addItemToBackpack "SmokeShellOrange";
this addHeadgear "H_HelmetB_Light_tna_F";

comment "Add weapons";
this addWeapon "arifle_MXC_khk_ACO_Pointer_Snds_F";
this addPrimaryWeaponItem "muzzle_snds_H_khk_F";
this addPrimaryWeaponItem "acc_pointer_IR";
this addPrimaryWeaponItem "optic_Aco";
this addWeapon "hgun_P07_khk_F";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "ItemGPS";
this linkItem "NVGoggles_tna_F";

comment "Set identity";
this setFace "WhiteHead_13";
this setSpeaker "Male01GRE";
