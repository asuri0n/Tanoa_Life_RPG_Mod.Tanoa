(_this  select 0) animateDoor ["Door_LB", 0];
(_this  select 0) animateDoor ["Door_LM", 0];
(_this  select 0) removeAction fermerPorteARG;
ouvrirPorteARG = (_this  select 0) addaction ["Ouvrir porte arr�re gauche",dossierVehDoors+"ouvrirARG.sqf"];