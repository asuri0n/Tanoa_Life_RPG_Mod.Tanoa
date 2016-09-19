(_this  select 0) animateDoor ["Door_RB", 0];
(_this  select 0) animateDoor ["Door_RM", 0];
(_this  select 0) removeAction fermerPorteARD;
ouvrirPorteARD = (_this  select 0) addaction ["Ouvrir porte arrère droite",dossierVehDoors+"ouvrirARD.sqf"];