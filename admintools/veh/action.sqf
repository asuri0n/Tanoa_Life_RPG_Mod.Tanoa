dossierVehDoors = "admintools\veh\VehDoors\";

cursorTarget removeAction ouvrirPorteAVG;
cursorTarget removeAction ouvrirPorteAVD;
cursorTarget removeAction ouvrirPorteARG;
cursorTarget removeAction ouvrirPorteARD;
cursorTarget removeAction ouvrirPorteC;

cursorTarget removeAction fermerPorteAVG;
cursorTarget removeAction fermerPorteAVD;
cursorTarget removeAction fermerPorteARG;
cursorTarget removeAction fermerPorteARD;
cursorTarget removeAction fermerPorteC;

TypeDeVehicule = typeOf cursorTarget;
hint format ["%1", TypeDeVehicule]; 

if (TypeDeVehicule == "O_MRAP_02_F" or TypeDeVehicule == "B_MRAP_01_F" or TypeDeVehicule == "I_MRAP_03_F") then 
{
	ouvrirPorteAVG = cursorTarget addaction ["Ouvrir porte avant gauche",dossierVehDoors+"ouvrirAVG.sqf"];
	ouvrirPorteAVD = cursorTarget addaction ["Ouvrir porte avant droite",dossierVehDoors+"ouvrirAVD.sqf"];
	if (TypeDeVehicule != "I_MRAP_03_F") then 
	{
		ouvrirPorteARG = cursorTarget addaction ["Ouvrir porte arrière gauche",dossierVehDoors+"ouvrirARG.sqf"];
		ouvrirPorteARD = cursorTarget addaction ["Ouvrir porte arrière droite",dossierVehDoors+"ouvrirARD.sqf"];
		if (TypeDeVehicule == "O_MRAP_02_F") then 
		{
			ouvrirPorteC = cursorTarget addaction ["Ouvrir coffre",dossierVehDoors+"ouvrirC.sqf"];
		};
	}
};