(_this  select 0) animateDoor ["Door_RF", 0];
(_this  select 0) removeAction fermerPorteAVD;
ouvrirPorteAVD = (_this  select 0) addaction ["Ouvrir porte avant droite",dossierVehDoors+"ouvrirAVD.sqf"];