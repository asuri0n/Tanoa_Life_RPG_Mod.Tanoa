(_this  select 0) animateDoor ["Door_LB", 1];
(_this  select 0) animateDoor ["Door_LM", 1];
(_this  select 0) removeAction ouvrirPorteARG;
fermerPorteARG = (_this  select 0) addaction ["Fermer porte arrière gauche",dossierVehDoors+"fermerARG.sqf"];