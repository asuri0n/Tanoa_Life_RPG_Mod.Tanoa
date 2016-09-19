(_this  select 0) animateDoor ["Door_LF", 0];
(_this  select 0) removeAction fermerPorteAVG;
ouvrirPorteAVG = (_this  select 0) addaction ["Ouvrir porte avant gauche",dossierVehDoors+"ouvrirAVG.sqf"];