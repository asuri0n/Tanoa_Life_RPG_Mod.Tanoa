#include <macro.h>

_pathtotools = "admintools\tools\";
_pathtolife= "admintools\life\";
_pathtoweapon = "admintools\weapons\";
_pathtovehicles = "admintools\veh\";
_pathtogear = "admintools\gear\";
_pathtoevent = "admintools\event\";
_pathtoAnimals = "admintools\event\Animals\";
_pathtoConstruction = "admintools\Objet\Construction\";
_pathtoitems = "admintools\items\";
_pathtotrolls = "admintools\troll\";
_pathtoobjet = "admintools\Objet\";
_pathtoFiltres = "admintools\event\Filtres\";
_pathAlerts = "core\functions\";
_pathVehiclesNew = "core\vehicle\";

_EXECscriptTools = 'player execVM "'+_pathtotools+'%1"';
_EXECscriptLife = 'player execVM "'+_pathtolife+'%1"';
_EXECscriptWeapon = 'player execVM "'+_pathtoweapon+'%1"';
_EXECscriptEvent = 'player execVM "'+_pathtoevent+'%1"';
_EXECscriptVehicule = 'player execVM "'+_pathtovehicles+'%1"';
_EXECscriptItems = 'player execVM "'+_pathtoitems+'%1"';
_EXECscriptEquipement = 'player execVM "'+_pathtogear+'%1"';
_EXECscriptTroll = 'player execVM "'+_pathtotrolls+'%1"';
_EXECscriptAnimals = 'player execVM "'+_pathtoAnimals+'%1"';
_EXECscriptObjet = 'player execVM "'+_pathtoobjet+'%1"';
_EXECscriptConstruction = 'player execVM "'+_pathtoConstruction+'%1"';
_EXECscriptFiltres = 'player execVM "'+_pathtoFiltres+'%1"';
_EXECscript3 = 'player execVM "'+_pathAlerts+'%1"';
_EXECscriptVehicleNew = 'player execVM "'+_pathVehiclesNew+'%1"';

if (__GETC__(life_adminlevel) != 0) then {
	if (__GETC__(life_adminlevel) > 1) then {
		adminmenu =
		[
			["Admin Max Menu",true],
				["Téléportations/Surveillance", [2], "#USER:Teleportations", -5, [["expression", ""]], "1", "1"],
				["Remboursements", [3], "#USER:MoneyMenu", -5, [["expression", ""]], "1", "1"],
				["God mods", [4], "#USER:GodMenu", -5, [["expression", ""]], "1", "1"],
				["Life menu", [5], "#USER:LifeMenu", -5, [["expression", ""]], "1", "1"],
				["Véhicules", [6], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
				["Armes", [7], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["Equipements", [8], "#USER:GearMenu", -5, [["expression", ""]], "1", "1"],
				["Events", [9], "#USER:EventMenu", -5, [["expression", ""]], "1", "1"],
				["Construction", [10], "#USER:ConstructionMenu", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		];
	};
} else {
	adminmenu =
	[
		["Admin Lite Menu",true],
			["Téléportations/Surveillance", [2], "#USER:Teleportations", -5, [["expression", ""]], "1", "1"],
			["Remboursements", [3], "#USER:MoneyMenu", -5, [["expression", ""]], "1", "1"],
			["God mods", [4], "#USER:GodMenu", -5, [["expression", ""]], "1", "1"],
			["Life menu", [5], "#USER:LifeMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [11], "", -3, [["expression", ""]], "1", "1"]
	];
};

Teleportations =
[
	["Téléportations",true],
        ["Téléporter sur la carte", [2],  "", -5, [["expression", format[_EXECscriptTools,"teleport.sqf"]]], "1", "1"],
		["Téléporter un joueur à moi", [3],  "", -5, [["expression", format[_EXECscriptTools,"tptome.sqf"]]], "1", "1"],
		["Téléporter sur un joueur", [4],  "", -5, [["expression", format[_EXECscriptTools,"TPMEtoHIM.sqf"]]], "1", "1"],
		["Spectateur", [5],  "", -5, [["expression", format[_EXECscriptTools,"spectate.sqf"]]], "1", "1"],
		["Aller dans vehicule cible", [6],  "", -5, [["expression", format[_EXECscriptTools,"MoveIn.sqf"]]], "1", "1"],
		["ESP ON", [7],  "", -5, [["expression", format[_EXECscriptTools,"ESP.sqf"]]], "1", "1"],
		["ESP OFF", [7],  "", -5, [["expression", format[_EXECscriptTools,"ESPoff.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

MoneyMenu =
[
	["Outil remboursements",true],
		["Remboursement cargaison", [2], "#USER:CargoMenu", -5, [["expression", ""]], "1", "1"],
		["Reset liquide = 0€", [3],  "", -5, [["expression", format[_EXECscriptTools,"moneyReset.sqf"]]], "1", "1"],
        ["Donner 200.000$", [4],  "", -5, [["expression", format[_EXECscriptTools,"money200.sqf"]]], "1", "1"],
		["Donner 400.000$", [5],  "", -5, [["expression", format[_EXECscriptTools,"money400.sqf"]]], "1", "1"],
		["Donner 800.000$", [6],  "", -5, [["expression", format[_EXECscriptTools,"money800.sqf"]]], "1", "1"],
		["ATM ON", [7],  "", -5, [["expression", format[_EXECscriptLife,"ATMadminON.sqf"]]], "1", "1"],
		["ATM OFF", [8],  "", -5, [["expression", format[_EXECscriptLife,"ATMadminOFF.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

CargoMenu =
[
	["Page 1",true],
		["Pétrole Brut (15)", [2],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_oilu.sqf"]]], "1", "1"],
        ["Pétrole Raffiné (15)", [3],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_oilp.sqf"]]], "1", "1"],
		["Graine blanche de pavot (15)", [4],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_heroinu.sqf"]]], "1", "1"],
		["Héroïne Pure (15)", [5],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_heroinp.sqf"]]], "1", "1"],
		["Cannabis (15)", [6],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_cannabis.sqf"]]], "1", "1"],
		["Marijuana (15)", [7],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_marijuana.sqf"]]], "1", "1"],
		["Viande de tortue (15)", [8],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_turtle.sqf"]]], "1", "1"],
		["Page suivante", [9], "#USER:CargoMenu2", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

CargoMenu2 =
[
	["Page 2",true],
		["Minerai de Cuivre (15)", [2],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_copperore.sqf"]]], "1", "1"],
		["Minerai de Fer (15)", [3],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_ironore.sqf"]]], "1", "1"],
		["Lingot de Fer (15)", [4],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_ironr.sqf"]]], "1", "1"],
		["Lingot de Cuivre (15)", [5],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_copperr.sqf"]]], "1", "1"],
		["Sable (15)", [6],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_sand.sqf"]]], "1", "1"],
		["Sel (15)", [7],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_salt.sqf"]]], "1", "1"],
		["Page suivante", [9], "#USER:CargoMenu3", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

CargoMenu3 =
[
	["Page 3",true],
		["Sel Raffinné (15)", [2],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_saltr.sqf"]]], "1", "1"],
        ["Verre (15)", [3],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_glass.sqf"]]], "1", "1"],
		["Diamant Brut (15)", [4],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_diamond.sqf"]]], "1", "1"],
		["Diamant Taillé (15)", [5],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_diamondr.sqf"]]], "1", "1"],
		["Feuille de Coca (15)", [6],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_coke.sqf"]]], "1", "1"],
		["Cocaïne Pure (15)", [7],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_cokep.sqf"]]], "1", "1"],
		["Bloc de Ciment (15)", [8],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_cement.sqf"]]], "1", "1"],
		["Page suivante", [9], "#USER:CargoMenu4", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

CargoMenu4 =
[
	["Page 4",true],
		["Lingot d'Or (15)", [2],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_goldbar.sqf"]]], "1", "1"],
        ["Kith De Meth (10)", [3],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_kitmeth.sqf"]]], "1", "1"],
		["Cristal Meth Non Purifie (10)", [4],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_crystalmeth.sqf"]]], "1", "1"],
		["Cristal Meth Purifie (10)", [5],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_crystalmethpur.sqf"]]], "1", "1"],
		["Poudre d'Hydroxyde De Sodium Anhydre (10)", [6],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_poudrehydroxyde.sqf"]]], "1", "1"],
		["Echantillon d'Archeologie (15)", [7],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_archeologie.sqf"]]], "1", "1"],
		["Page suivante", [8], "#USER:CargoMenu5", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

CargoMenu5 =
[
	["Page 5",true],
		["Raisin (15)", [2],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_grapes.sqf"]]], "1", "1"],
        ["Jus de Raisin (15)", [3],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_grapejuice.sqf"]]], "1", "1"],
		["Vin (15)", [4],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_wine.sqf"]]], "1", "1"],
		["Alcool illégal (15)", [5],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_moonshine.sqf"]]], "1", "1"],
		["Compote de Pommes (15)", [6],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_applecompote.sqf"]]], "1", "1"],
		["Compote de Pêches (15)", [7],  "", -5, [["expression", format[_EXECscriptItems,"life_inv_peachcompote.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

GodMenu =
[
	["God Mods",true],
		["God Mode ON", [2],  "", -5, [["expression", format[_EXECscriptTools,"AdminON.sqf"]]], "1", "1"],
		["God Mode OFF", [3],  "", -5, [["expression", format[_EXECscriptTools,"AdminOFF.sqf"]]], "1", "1"],
		["Car God Mode ON", [4],  "", -5, [["expression", format[_EXECscriptTools,"cargodON.sqf"]]], "1", "1"],
		["Car God Mode OFF", [5],  "", -5, [["expression", format[_EXECscriptTools,"cargodOFF.sqf"]]], "1", "1"],
		["Invisibilité ON", [6],  "", -5, [["expression", format[_EXECscriptTools,"Invisible.sqf"]]], "1", "1"],
		["Invisibilité OFF", [7],  "", -5, [["expression", format[_EXECscriptTools,"InvisibleOff.sqf"]]], "1", "1"],
		["Pousse Mousse", [8],  "", -5, [["expression", format[_EXECscriptTools,"pushIT.sqf"]]], "1", "1"],
		["Page suivante", [9], "#USER:GodMenu2", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

GodMenu2 =
[
	["God Mods 2",true],
		["Supprimer cible", [2],  "", -5, [["expression", format[_EXECscriptTools,"DeleteIT.sqf"]]], "1", "1"],
		["Détruire/tuer cible", [3],  "", -5, [["expression", format[_EXECscriptTools,"DestroyIT.sqf"]]], "1", "1"],
		["Réparer/soigner cible", [4],  "", -5, [["expression", format[_EXECscriptTools,"RepairIT.sqf"]]], "1", "1"],
		["Se réanimer", [5],  "", -5, [["expression", format[_EXECscriptTools,"Rez.sqf"]]], "1", "1"],
		["Réparer Tours de Comms", [6],  "", -5, [["expression", format[_EXECscriptTools,"repairComms.sqf"]]], "1", "1"],
		["Superman", [7],  "", -5, [["expression", format[_EXECscriptTools,"Superman.sqf"]]], "1", "1"],
		["Superman Version Rocco", [8],  "", -5, [["expression", format[_EXECscriptTools,"superman2.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

TrollMenu =
[
	["Anti Troll",true],
		["TP et attacher un Troll/Cheateur", [2],  "", -5, [["expression", format[_EXECscriptTroll,"AntiTrollon.sqf"]]], "1", "1"],
		["Détacher cible", [3],  "", -5, [["expression", format[_EXECscriptTroll,"AntiTrolloff.sqf"]]], "1", "1"],
		["Menotter cible", [4],  "", -5, [["expression", format[_EXECscriptTroll,"Menotter.sqf"]]], "1", "1"],
		["Demenotter cible", [5],  "", -5, [["expression", format[_EXECscriptTroll,"Demenotter.sqf"]]], "1", "1"],
		["Envoyer en prison", [6],  "", -5, [["expression", format[_EXECscriptTroll,"prison.sqf"]]], "1", "1"],
		["Se demenotter", [7],  "", -5, [["expression", format[_EXECscriptTools,"SeDemenotter.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

WeaponMenu =
[
	["Armes page 1",true],
		["MK 20 GL", [2],  "", -5, [["expression", format[_EXECscriptWeapon,"mk20.sqf"]]], "1", "1"],
		["MK 200", [3],  "", -5, [["expression", format[_EXECscriptWeapon,"mk200.sqf"]]], "1", "1"],
		["M320", [4],  "", -5, [["expression", format[_EXECscriptWeapon,"lrr.sqf"]]], "1", "1"],
		["Mk18", [5],  "", -5, [["expression", format[_EXECscriptWeapon,"ebr.sqf"]]], "1", "1"],
		["GM6 Lynx", [6],  "", -5, [["expression", format[_EXECscriptWeapon,"gm6.sqf"]]], "1", "1"],
		["P07", [7],  "", -5, [["expression", format[_EXECscriptWeapon,"phgun.sqf"]]], "1", "1"],
		["Katiba GL", [8],  "", -5, [["expression", format[_EXECscriptWeapon,"katiba.sqf"]]], "1", "1"],
		["Page suivante", [9], "#USER:WeaponMenu2", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu2 =
[
	["Armes page 2",true],
		["PDW2000", [10],  "", -5, [["expression", format[_EXECscriptWeapon,"pdw.sqf"]]], "1", "1"],
		["Sting 9mm", [2],  "", -5, [["expression", format[_EXECscriptWeapon,"sting.sqf"]]], "1", "1"],
		["SDAT", [3],  "", -5, [["expression", format[_EXECscriptWeapon,"sdar.sqf"]]], "1", "1"],
		["MX", [4],  "", -5, [["expression", format[_EXECscriptWeapon,"mx.sqf"]]], "1", "1"],
		["MXC", [5],  "", -5, [["expression", format[_EXECscriptWeapon,"mxc.sqf"]]], "1", "1"],
		["MXM", [6],  "", -5, [["expression", format[_EXECscriptWeapon,"mxm.sqf"]]], "1", "1"],
		["MX SW", [7],  "", -5, [["expression", format[_EXECscriptWeapon,"mxsw.sqf"]]], "1", "1"],
		["RPG 42", [8],  "", -5, [["expression", format[_EXECscriptWeapon,"rpg.sqf"]]], "1", "1"],
		["Page suivante", [9], "#USER:WeaponMenu3", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];
WeaponMenu3 =
[
	["Armes page 3",true],
		["MP5", [10],  "", -5, [["expression", format[_EXECscriptWeapon,"mp5.sqf"]]], "1", "1"],
		["HK416", [2],  "", -5, [["expression", format[_EXECscriptWeapon,"hk416.sqf"]]], "1", "1"],
		["M1014", [3],  "", -5, [["expression", format[_EXECscriptWeapon,"m1014.sqf"]]], "1", "1"],
		["M107", [4],  "", -5, [["expression", format[_EXECscriptWeapon,"m107.sqf"]]], "1", "1"],
		["AK74", [5],  "", -5, [["expression", format[_EXECscriptWeapon,"ak74.sqf"]]], "1", "1"],
		["Bizon", [6],  "", -5, [["expression", format[_EXECscriptWeapon,"bizon.sqf"]]], "1", "1"],
		["FN FAL", [7],  "", -5, [["expression", format[_EXECscriptWeapon,"fal.sqf"]]], "1", "1"],
		["Stinger", [8],  "", -5, [["expression", format[_EXECscriptWeapon,"stinger.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];
VehicleMenu =
[
	["Vehicles",true],
		["Civil", [2], "#USER:VehicleCivilMenu", -5, [["expression", ""]], "1", "1"],
		["Tanks", [3], "#USER:VehicleTankMenu", -5, [["expression", ""]], "1", "1"],
		["Air", [4], "#USER:VehicleAirMenu", -5, [["expression", ""]], "1", "1"],
		["Drones", [5], "#USER:VehicleDroneMenu", -5, [["expression", ""]], "1", "1"],
		["News helicos a tester", [6], "#USER:DLCHelicopterMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleCivilMenu =
[
	["Vehicules civil",true],
		["Voitures", [2], "#USER:VehicleCivilVoituresMenu", -5, [["expression", ""]], "1", "1"],
		["Camions", [3], "#USER:VehicleCivilCamionsMenu", -5, [["expression", ""]], "1", "1"],
		["Blindés", [4], "#USER:VehicleCivilBlindeMenu", -5, [["expression", ""]], "1", "1"],
		["Ajouter action", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"addons\action.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleCivilVoituresMenu =
[
	["Voitures civil",true],
		["Hayon sport", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Hachback_01_sport_F.sqf"]]], "1", "1"],
		["Offroad", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Offroad_01_F.sqf"]]], "1", "1"],
		["Quad", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Quadbike_01_F.sqf"]]], "1", "1"],
		["SUV", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"C_SUV_01_F.sqf"]]], "1", "1"],
		["Van transport", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Van_01_transport_F.sqf"]]], "1", "1"],
		["Van box", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Van_01_box_F.sqf"]]], "1", "1"],
		["Van Fuel", [8],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Van_01_fuel_F.sqf"]]], "1", "1"],
		["Offroad (Armed)", [9],  "", -5, [["expression", format[_EXECscriptVehicule,"O_G_Offroad_01_armed_F.sqf"]]], "1", "1"],
		["Kart", [10],  "", -5, [["expression", format[_EXECscriptVehicule,"C_Kart_01_Blu_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleCivilCamionsMenu =
[
	["Camions",true],
		["HEMTT", [2], "#USER:VehicleHEMTTMenu", -5, [["expression", ""]], "1", "1"],
		["ZAMAK", [3], "#USER:VehicleZAMAKMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleHEMTTMenu =
[
	["HEMTT",true],
		["HEMTT ammo", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_ammo_F.sqf"]]], "1", "1"],
		["HEMTT box", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_box_F.sqf"]]], "1", "1"],
		["HEMTT covered", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_covered_F.sqf"]]], "1", "1"],
		["HEMTT fuel", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_fuel_F.sqf"]]], "1", "1"],
		["HEMTT medical", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_medical_F.sqf"]]], "1", "1"],
		["HEMTT mover", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_mover_F.sqf"]]], "1", "1"],
		["HEMTT repair", [8],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_Repair_F.sqf"]]], "1", "1"],
		["HEMTT transport", [9],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Truck_01_transport_F.sqf"]]], "1", "1"],
		["HEMTT box Altis", [10],  "", -5, [["expression", format[_EXECscriptVehicleNew,"fn_spawnAltisVehicle.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleZAMAKMenu =
[
	["ZAMAK",true],
		["ZAMAK ammo", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Truck_02_Ammo_F.sqf"]]], "1", "1"],
		["ZAMAK box", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Truck_02_box_F.sqf"]]], "1", "1"],
		["ZAMAK covered", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Truck_02_covered_F.sqf"]]], "1", "1"],
		["ZAMAK fuel", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Truck_02_fuel_F.sqf"]]], "1", "1"],
		["ZAMAK medical", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Truck_02_medical_F.sqf"]]], "1", "1"],
		["ZAMAK transport", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Truck_02_transport_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleCivilBlindeMenu =
[
	["Vehicules blindé",true],
		["Hunter", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"B_MRAP_01_F.sqf"]]], "1", "1"],
		["Hunter HMG", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"B_MRAP_01_hmg_F.sqf"]]], "1", "1"],
		["Hunter GMG", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"B_MRAP_01_gmg_F.sqf"]]], "1", "1"],
		["Ifrit", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"O_MRAP_02_F.sqf"]]], "1", "1"],
		["Ifrit HMG", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"O_MRAP_02_hmg_F.sqf"]]], "1", "1"],
		["Ifrit GMG", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"O_MRAP_02_gmg_F.sqf"]]], "1", "1"],
		["Strider", [8],  "", -5, [["expression", format[_EXECscriptVehicule,"I_MRAP_03_F.sqf"]]], "1", "1"],
		["Strider HMG", [9],  "", -5, [["expression", format[_EXECscriptVehicule,"I_MRAP_03_hmg_F.sqf"]]], "1", "1"],
		["Strider GMG", [10],  "", -5, [["expression", format[_EXECscriptVehicule,"I_MRAP_03_gmg_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleTankMenu =
[
	["Tanks",true],
		["FV-6c Panther", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"B_APC_Tracked_01_rcws_F.sqf"]]], "1", "1"],
		["CRV-6e Bobcat", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"B_APC_Tracked_01_CRV_F.sqf"]]], "1", "1"],
		["IFV-6a Cheetah", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"B_APC_Tracked_01_AA_F.sqf"]]], "1", "1"],
		["M2A1 Slammer", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"B_MBT_01_cannon_F.sqf"]]], "1", "1"],
		["M4 Scorcher", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"B_MBT_01_arty_F.sqf"]]], "1", "1"],
		["M5 Sandstorm MLRS", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"B_MBT_01_mlrs_F.sqf"]]], "1", "1"],
		["BTR-K Kamysh", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"O_APC_Tracked_02_cannon_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleAirMenu =
[
	["Vehicules aeriens",true],
		["AH-9 Pawnee", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Heli_Light_01_armed_F.sqf"]]], "1", "1"],
		["AH-99 Blackfoot", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Heli_Attack_01_F.sqf"]]], "1", "1"],
		["UH-80 Ghost Hawk", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Heli_Transport_01_F.sqf"]]], "1", "1"],
		["A-164 Wipeout", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Plane_CAS_01_F.sqf"]]], "1", "1"],
		["CH-49 Mohawk", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"I_Heli_Transport_02_F.sqf"]]], "1", "1"],
		["WY-55 Hellcat", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"I_Heli_light_03_F.sqf"]]], "1", "1"],
		["A-143 Buzzard", [8],  "", -5, [["expression", format[_EXECscriptVehicule,"I_Plane_Fighter_03_CAS_F.sqf"]]], "1", "1"],
		["To-199 Neophron", [9],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Plane_CAS_02_F.sqf"]]], "1", "1"],
		["Mi-48 Kajman", [10],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Attack_02_black_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

VehicleDroneMenu =
[
	["Drones",true],
		["AR-2 Darter", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"B_UAV_01_F.sqf"]]], "1", "1"],
		["MQ4A Greyhawk", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"B_UAV_02_F.sqf"]]], "1", "1"],
		["MQ4A Greyhawk (CAS)", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"B_UAV_02_CAS_F.sqf"]]], "1", "1"],
		["UGV Stomper", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"B_UGV_01_F.sqf"]]], "1", "1"],
		["UGV Stomper RCWS", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"B_UGV_01_rcws_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

DLCHelicopterMenu =
[
	["DLC Helicopters",true],
		["Mi-290", [2], "#USER:Mi290Menu", -5, [["expression", ""]], "1", "1"],
		["CH Huron", [3], "#USER:CHHuronMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

Mi290Menu =
[
	["Mi-290",true],
		["Mi-290 Taru", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Ammo)", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_ammo_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Bench)", [4],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_bench_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Cargo)", [5],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_box_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Transport)", [6],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_covered_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Fuel)", [7],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_fuel_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Medical)", [8],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_medevac_F.sqf"]]], "1", "1"],
		["Mi-290 Taru (Repair)", [8],  "", -5, [["expression", format[_EXECscriptVehicule,"O_Heli_Transport_04_repair_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

CHHuronMenu =
[
	["CH-67 Huron",true],
		["CH-67 Huron", [2],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Heli_Transport_03_F.sqf"]]], "1", "1"],
		["CH-67 Huron (Black)", [3],  "", -5, [["expression", format[_EXECscriptVehicule,"B_Heli_Transport_03_unarmed_F.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

GearMenu =
[
	["Equipements",true],

		["JVN", [2],  "", -5, [["expression", format[_EXECscriptEquipement,"jvn.sqf"]]], "1", "1"],
		["Toolkit", [3],  "", -5, [["expression", format[_EXECscriptEquipement,"toolkit.sqf"]]], "1", "1"],
		["Carte/gps", [4],  "", -5, [["expression", format[_EXECscriptEquipement,"gps.sqf"]]], "1", "1"],
		["Medkit", [5],  "", -5, [["expression", format[_EXECscriptEquipement,"medkit.sqf"]]], "1", "1"],
		["Sac", [6],  "", -5, [["expression", format[_EXECscriptEquipement,"bagpack.sqf"]]], "1", "1"],
		["Radio", [7],  "", -5, [["expression", format[_EXECscriptEquipement,"radio.sqf"]]], "1", "1"],
		["Télémètre", [8],  "", -5, [["expression", format[_EXECscriptEquipement,"rangefinder.sqf"]]], "1", "1"],
		["Tenues", [9], "#USER:Tenues1", -5, [["expression", ""]], "1", "1"],
		["Arsenal Virtuel", [10],  "", -5, [["expression", format[_EXECscriptTools,"virtualarsenal.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

Tenues1 =
[
	["Tenues",true],

		["Tenue Payday", [2],  "", -5, [["expression", format[_EXECscriptEquipement,"payday.sqf"]]], "1", "1"],
		["Tenue Johnny", [3],  "", -5, [["expression", format[_EXECscriptEquipement,"johnny.sqf"]]], "1", "1"],
		["Tenue Rocco", [4],  "", -5, [["expression", format[_EXECscriptEquipement,"rocco.sqf"]]], "1", "1"],
		["Tenue rebelle", [5],  "", -5, [["expression", format[_EXECscriptEquipement,"Tenuerebelle.sqf"]]], "1", "1"],
		["Tenue civile", [6],  "", -5, [["expression", format[_EXECscriptEquipement,"civil.sqf"]]], "1", "1"],
		["Uniforme modo", [7],  "", -5, [["expression", format[_EXECscriptEquipement,"uniforme.sqf"]]], "1", "1"],
		["Suicide vest", [8],  "", -5, [["expression", format[_EXECscriptEquipement,"suicide.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];


EventMenu =
[
	["Event",true],

		["Placer 6 Hayon sports", [2],  "", -5, [["expression", format[_EXECscriptEvent,"hatchback.sqf"]]], "1", "1"],
		["Chiens", [3], "#USER:Animals1", -5, [["expression", ""]], "1", "1"],
		["Activer Code Noir", [4],  "", -5, [["expression", format[_EXECscript3,"fn_activateNoir.sqf"]]], "1", "1"],
		["Activer Code Frini", [5],  "", -5, [["expression", format[_EXECscript3,"fn_activateFrini.sqf"]]], "1", "1"],
		["Activer Code Rouge", [6],  "", -5, [["expression", format[_EXECscript3,"fn_activateRed.sqf"]]], "1", "1"],
		["Activer code Vigipirate", [7],  "", -5, [["expression", format[_EXECscript3,"fn_activateVigi.sqf"]]], "1", "1"],
		["Activer code Jaune", [8],  "", -5, [["expression", format[_EXECscript3,"fn_activateJaune.sqf"]]], "1", "1"],
		["Desactiver alerte", [9],  "", -5, [["expression", format[_EXECscript3,"fn_desactivateMsg.sqf"]]], "1", "1"],
		["Mouvements", [10], "#USER:MoveMenu", -5, [["expression", ""]], "1", "1"],
		["Remplir Camion avec Armes", [11],  "", -5, [["expression", format[_EXECscriptEvent,"fillWithRandomStuff.sqf"]]], "1", "1"],
		["Recharger Munitions Vehicule", [12],  "", -5, [["expression", format[_EXECscriptEvent,"reloadammo.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ConstructionMenu =
[
	["Construction",true],
		["Déplacer cible", [2],  "", -5, [["expression", format[_EXECscriptObjet,"Deplacer.sqf"]]], "1", "1"],
		//["Construction", [3],  "", -5, [["expression", format[_EXECscriptConstruction,"menu.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

MoveMenu =
[
	["Effectuer des mouvements",true],
		["Pompes", [2],  "", -5, [["expression", format[_EXECscriptEvent,"pompe.sqf"]]], "1", "1"],
		["Karate", [3],  "", -5, [["expression", format[_EXECscriptEvent,"karate.sqf"]]], "1", "1"],
		["Wall jump", [4],  "", -5, [["expression", format[_EXECscriptEvent,"Walljump.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];

FunMenu =
[
	["Fun menu",true],
//["Menu Couleurs", [2], "#USER:ColorMenu", -5, [["expression", ""]], "1", "1"],
//["Menu Filtres", [3], "#USER:ColorCorrectionMenu", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ColorMenu =
[
	["Jeux de couleurs",true],
		["Multicolor cible (layer 0)", [2],  "", -5, [["expression", format[_EXECscriptEvent,"CouleurT.sqf"]]], "1", "1"],
		["Multicolor cible (layer 1)", [3],  "", -5, [["expression", format[_EXECscriptEvent,"CouleurT2.sqf"]]], "1", "1"],
		["Multicolor cible (layer 2)", [4],  "", -5, [["expression", format[_EXECscriptEvent,"CouleurT3.sqf"]]], "1", "1"],
		["Multicolor", [5],  "", -5, [["expression", format[_EXECscriptEvent,"CouleurP.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];

ColorCorrectionMenu =
[
	["Filtres",true],
		["Selection de Filtres", [2],  "", -5, [["expression", format[_EXECscriptFiltres,"menuFiltre.sqf"]]], "1", "1"],
		["Désactiver Filtre", [10],  "", -5, [["expression", format[_EXECscriptFiltres,"CCorrectionOFF.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];


ObjetMenu =
[
	["Placer/Déplacer Objets",true],
		["Déplacer cible", [2],  "", -5, [["expression", format[_EXECscriptObjet,"Deplacer.sqf"]]], "1", "1"],
		["Construction", [3],  "", -5, [["expression", format[_EXECscriptConstruction,"menu.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]

];

LifeMenu =
[
	["Life Menu",true],
		["Troll menu", [2], "#USER:TrollMenu", -5, [["expression", ""]], "1", "1"],
		["Mettre en fourrière", [3],  "", -5, [["expression", format[_EXECscriptLife,"impoundAction.sqf"]]], "1", "1"],
		["Reset prix marché", [4],  "", -5, [["expression", format[_EXECscriptLife,"resetmarche.sqf"]]], "1", "1"],
		["Revive", [5],  "", -5, [["expression", format[_EXECscriptLife,"Revive.sqf"]]], "1", "1"],
		["lock/Unlock", [6],  "", -5, [["expression", format[_EXECscriptLife,"Unlock.sqf"]]], "1", "1"],
		["Objets inventaire", [7], "#USER:LifeItem", -5, [["expression", ""]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

LifeItem =
[
	["Items",true],
		["Pickaxe", [2],  "", -5, [["expression", format[_EXECscriptItems,"pickaxe.sqf"]]], "1", "1"],
		["Menottes", [3],  "", -5, [["expression", format[_EXECscriptItems,"menottes.sqf"]]], "1", "1"],
		["Cagoule", [4],  "", -5, [["expression", format[_EXECscriptItems,"hood.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

Animals1 =
[
	["Chiens",true],
		["Alsatian d'attaque", [2],  "", -5, [["expression", format[_EXECscriptAnimals,"Alsatian_R.sqf"]]], "1", "1"],
		["Horde", [3],  "", -5, [["expression", format[_EXECscriptAnimals,"Horde.sqf"]]], "1", "1"],
		["Dog (Random)", [4],  "", -5, [["expression", format[_EXECscriptAnimals,"Dog_R.sqf"]]], "1", "1"],
		["Mouton", [5],  "", -5, [["expression", format[_EXECscriptAnimals,"Mouton.sqf"]]], "1", "1"],
		["Chèvre", [6],  "", -5, [["expression", format[_EXECscriptAnimals,"Chevre.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:adminmenu";