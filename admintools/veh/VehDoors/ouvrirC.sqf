(_this  select 0) animateDoor ["Door_rear", 1];
(_this  select 0) removeAction ouvrirPorteC;
fermerPorteC = (_this  select 0) addaction ["Fermer coffre",dossierVehDoors+"fermerC.sqf"];