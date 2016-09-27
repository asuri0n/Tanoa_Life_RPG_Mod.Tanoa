detach spawnCIVMarket; 
player removeAction ActionDeplaceObjet;
PauserObjet = 0;

spawnCIVMarket = createAgent ["C_man_hunter_1_F", position player, [], 0, "FORM"]; 
spawnCIVMarket setDir _DirPlayer;
spawnCIVMarket enableSimulation false; 
spawnCIVMarket allowDamage false; 
spawnCIVMarket setPosASLW (getPosASLW player);
spawnCIVMarket attachTo [player,[0,1,0], ""];

ActionDeplaceObjet = player addaction ["Pauser",{PauserObjet = 1},""];

waituntil {PauserObjet ==1};

[[spawnCIVMarket,"Épicerie",life_fnc_virt_menu,"market"],"Fock2_addactionMP",true,true] spawn BIS_fnc_MP;
[[spawnCIVMarket,"Magasin de vêtements",life_fnc_clothingMenu,"bruce"],"Fock2_addactionMP",true,true] spawn BIS_fnc_MP;
[[spawnCIVMarket,"Magasin d'équipements",life_fnc_weaponShopMenu,"genstore"],"Fock2_addactionMP",true,true] spawn BIS_fnc_MP;

if (PauserObjet == 1) exitWith {detach spawnCIVMarket; player removeAction ActionDeplaceObjet};



