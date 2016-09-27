(_this  select 0) animateDoor ["Door_RB", 1];
(_this  select 0) animateDoor ["Door_RM", 1];
(_this  select 0) removeAction ouvrirPorteARD;
fermerPorteARD = (_this  select 0) addaction ["Fermer porte arrière droite",dossierVehDoors+"fermerARD.sqf"];