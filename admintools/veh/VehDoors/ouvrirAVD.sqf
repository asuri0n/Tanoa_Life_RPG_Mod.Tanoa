(_this  select 0) animateDoor ["Door_RF", 1];
(_this  select 0) removeAction ouvrirPorteAVD;
fermerPorteAVD = (_this  select 0) addaction ["Fermer porte avant droite",dossierVehDoors+"fermerAVD.sqf"];