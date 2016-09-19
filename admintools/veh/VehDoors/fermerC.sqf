(_this  select 0) animateDoor ["Door_rear", 0];
(_this  select 0) removeAction fermerPorteC;
ouvrirPorteC = (_this  select 0) addaction ["Ouvrir coffre",dossierVehDoors+"ouvrirC.sqf"];