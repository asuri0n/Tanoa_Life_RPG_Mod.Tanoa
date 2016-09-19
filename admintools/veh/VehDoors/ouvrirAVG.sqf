(_this  select 0) animateDoor ["Door_LF", 1];
(_this  select 0) removeAction ouvrirPorteAVG;
fermerPorteAVG = (_this  select 0) addaction ["Fermer porte avant gauche",dossierVehDoors+"fermerAVG.sqf"];
