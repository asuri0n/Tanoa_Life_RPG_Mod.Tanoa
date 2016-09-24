#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system
*/

/*
*****************************
********* DEBUG VAR *********
*****************************
*/
VACA_SERV_DEBUG = true;
if (VACA_SERV_DEBUG) then
{
	diag_log "########-----------------------#########";
	diag_log "##/!\ VACA_SERV_DEBUG IS ACTIVATED /!\##";
	diag_log "########-----------------------#########";
};

/*
*****************************
***** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = ObjNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_clothing_previousSelection = "";
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
/*player setVariable ["AGM_canTreat", true, true];*/
life_action_gather = false;
life_spikestrip = ObjNull;
life_has_insurance = true;
life_fatigue = 0.5; //ajout Serrat
life_respawn_timer = .3; //Scaled in minutes
life_drink = 0;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_ESP = false;//added 16/10/2014 by ladislas
life_fadeSound = false;
life_redCode = false;//added 05/11/2014
life_stopRedCode = false;//added 05/11/2014
life_drawingMessage = false;//added 05/11/2014
life_barrierestop = ObjNull;//added 05/11/2014
life_inv_kit_meth = ObjNull;//added 05/11/2014
life_inv_poudre_hydroxyde_sodium_anhydre = ObjNull;//added 05/11/2014
life_inv_crystal_meth = ObjNull;//added 05/11/2014
life_inv_crystal_meth_pur = ObjNull;//added 05/11/2014
life_vehicle_transfer_from = ObjNull; //Added by Komodo, direct Transfer system
life_vehicle_transfer_to = ObjNull; //Added by Komodo, direct Transfer system
life_vehicle_transfer_house = ObjNull; //Komodo: to handle save of trunk in certain cases

/*
*****************************
****** Custom Variables *****
*****************************
*/
invo_cheating = false; //Komodo: set to true to identify is someone is trying to cheat.
invo_godmod = false;
invo_shop_area = -1; //Komodo: variable that holds the area number we should assign money to when selling.
invo_last_update_request = []; //Komodo: ajouté pour stocker la dernière requette de mise à jour effectuée par un client. On la comparera à celle qu'il souhaite faire afin d'éventuellement l'annuler si elle est identique.
invo_last_update_request_money = [];
invo_last_update_request_civgear = [];
invo_garage_change_car = true; //Komodo: variables destinées à être mises à jour par le serveur ou le client afin de miniser les calls liste de véhicules.
invo_garage_change_air = true;
invo_garage_change_ship = true;
invo_garage_last_query_car = [];
invo_garage_last_query_air = [];
invo_garage_last_query_ship = [];
invo_killer = ObjNull; //Komodo: on stocke l'info sur la personne ayant tiré la dernière fois sur le joueur.
//invo_AGM_knockOut = false;
invo_bleedOutTime = 0;
invo_canSuicide = false;
invo_allies = []; //Komodo: Liste des alliés, remplie à l'init group. 0: id du gang, 1: objet group ou grpNull
invo_previous_AltTab = false;
invo_lastBusCall = -100;
invo_LastLockUnlock = 0; //Komodo anti-spam U
invo_SpamAntibruit = 0; //Komodo anti-spam FadeSound
invo_demoChargeTimerInUse = false;
invo_missionInProgress = -1;
invo_mission_target = objNull;
invo_mission_target_action = 0;
invo_mission_target_marker = "";
invo_createdEventVehicle = objNull;
invo_faction = "";
invo_last_sold_vehicle = 0;
invo_player_version = 1;
life_is_alive = false; // Asurion : RP info player
life_firstCombatActive = false; // Disabled 1rst person when shooting
life_combatTime = 0; // init time during combat
speeding_points = 0; // TO DO

invo_mission_types = [
	["delivery_hemtt", "Livraison en HEMTT"]
];

invo_weird_items = [
	//"AGM_Bandage",
	//"AGM_Morphine",
	//"AGM_Epipen",
	//"AGM_Bloodbag"
];

invo_vaults = [
	fed_bank_1,
	fed_bank_2,
	fed_bank_3
];
invo_bank_buildings = [
	fed_building_office,
	fed_building_cargo,
	fed_building_shed
];

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,250); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5);

//Gang related stuff?
__CONST__(life_gangPrice,600000);
__CONST__(life_gangUpgradeBase,300000);
__CONST__(life_gangUpgradeMultipler,2.5);

player setDamage 0;
//player setVariable ["AGM_Blood", 1, True];
//player setVariable ["AGM_isBleeding", False, True];
//player setVariable ["AGM_Painkiller", 1, True];
//player setVariable ["AGM_Pain", 0, True];
//player setVariable ["AGM_isUnconscious", False, True];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 14; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 14; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_liquide = 0;
life_liquide_delta = 0;
life_liquide_before = 0;
life_dabliquide_delta = 0;
life_dabliquide_before = 0;
life_dab_last_withdraw = time; //Komodo: variable stockant le dernier retrait/dépot d'argent afin de mettre un place un timer de 5 secondes pour éviter le flood de requêtes.
__CONST__(life_impound_car_dep,3500); //add john pas sur de lui
__CONST__(life_impound_boat_dep,5000);//add john pas sur de lui
__CONST__(life_impound_air_dep,8000); //add john pas sur de lui
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
life_my_gang = ObjNull;

life_inv_allowed = false;//added bloopis
life_insure_val = 0;//added bloopis
life_insure_veh = ObjNull;//added bloopis
life_msg_cost = 0;//added bloopis
life_msg_pub = "";//added bloopis
Action_Revived = false;


life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_dabliquide = 50000; //Starting Bank Money
		life_dabliquide_before = 50000;
		life_paycheck = 0; //Paycheck Amount

		//----------------------------------------------------
		//section added 04/28/2014
		//init crimes array, it must be change if the crimes change !
		life_crimes = [
			["480","Délit de Fuite"],
			["187","Homicide"],
			// ["187V","Homicide Involontaire Véhicules"], //retrait de l'amende vehicule
			["187T","Tentative d'Homicide"],
			["188","Homicide sur Agent"],
			["188T","Tentative d'Homicide sur Agent"],
			["208","Séquestration de Civil"],
			["209","Séquestration de Gendarme"],
			["207A","Tentative d'Enlèvement"],
			["207","Enlèvement"],
			["261A","Tentative de Viol"],
			["261","Viol"],
			["211","Braquage à main armée"],
			["483","Trafic de Drogues"],
			["481","Possession de Drogue"],
			["482","Distribution de Drogue"],
			["490","Consommation de Stupéfiants"],
			["215","Tentative de Vol de Véhicule"],
			["487","Vol de Véchicule"],
			["216","Tentative de démenottage"],
			["489","Crochetage de menottes"],
			["488","Larcin"],
			["491","Stationnement Gênant"],
			["492","Conduite Dangereuse"],
			["501","Sabotage"],
			["213","Utilisation d'Explosif"],
			["901","Evasion de Prison"]
			];
		//----------------------------------------------------
	};
	case civilian:
	{

		//----------------------------------------------------
		//section added 13/11/2014
		//init crimes array, it must be change if the crimes change !
		life_crimes = [
			["480","Délit de Fuite"],
			["187","Homicide"],
			// ["187V","Homicide Involontaire Véhicules"],
			["187T","Tentative d'Homicide"],
			["188","Homicide sur Agent"],
			["188T","Tentative d'Homicide sur Agent"],
			["208","Séquestration de Civil"],
			["209","Séquestration de Gendarme"],
			["207A","Tentative d'Enlèvement"],
			["207","Enlèvement"],
			["261A","Tentative de Viol"],
			["261","Viol"],
			["211","Braquage à main armée"],
			["483","Trafic de Drogues"],
			["481","Possession de Drogue"],
			["482","Distribution de Drogue"],
			["490","Consommation de Stupéfiants"],
			["215","Tentative de Vol de Véhicule"],
			["487","Vol de Véchicule"],
			["216","Tentative de démenottage"],
			["489","Crochetage de menottes"],
			["488","Larcin"],
			["491","Stationnement Gênant"],
			["492","Conduite Dangereuse"],
			["501","Sabotage"],
			["213","Utilisation d'Explosif"],
			["901","Evasion de Prison"]
			];

		life_dabliquide = 50000; //@see InsertRequest l13
		life_dabliquide_before = 50000;
		life_paycheck = 0;
	};

	case independent: {
		life_dabliquide = 50000;
		life_dabliquide_before = 50000;
		life_paycheck = 0;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","Sab_af_An2","Sab_ee_An2","Sab_tk_An2","sab_ca_An2","Sab_ana_An2","sab_AH_An2","Sab_yel_An2","Sab_fd_An2","sab_BI_An2","Sab_cz_An2","Sab_Amphi_An2","Sab_sea_An2","Sab_sea2_An2","Sab_sea3_An2","Sab_sea4_An2","Sab_ee_An2","Sab_A2_An2","Sab_ru_An2","Sab_An2_o","Sab_An2_b","Sab_An2_i","shounka_a3_renaultmagnum_f", "shounka_a3_spr_civ_orange", "shounka_a3_spr_civ_violet", "shounka_a3_spr_civ_grise", "shounka_a3_spr_civ_rose", "shounka_a3_spr_civ_jaune", "shounka_a3_spr_civ_rouge", "shounka_a3_spr_civ_bleufonce", "shounka_a3_spr_civ_noir", "shounka_limo_civ_orange", "shounka_limo_civ_violet", "shounka_limo_civ_grise", "shounka_limo_civ_rose", "shounka_limo_civ_jaune", "shounka_limo_civ_rouge", "shounka_limo_civ_bleufonce", "shounka_limo_civ_noir"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);
//These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_cornmeal",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_mash",
	"life_inv_barriere",//added by asurion
	"life_inv_barriereStop",//added by asurion
	"life_inv_ziptie",//added by asurion
	"life_inv_hamburger",//added by asurion
	"life_inv_frites",//added by asurion
	"life_inv_cheeseburger",//added by asurion
  	"life_inv_storage1",//added by asurion
    "life_inv_storage2",//added by asurion
	"life_inv_kitmeth",//added by asurion
	"life_inv_poudrehydroxyde",//added by asurion
	"life_inv_crystalmeth",//added by asurion
	"life_inv_crystalmethpur",//added by asurion
	"life_inv_archeologieillegale",//added by asurion
	"life_inv_archeologie",//added by asurion
	"life_inv_machete", //Komodo: machete to gather plants - objective is to replace add
	"life_inv_conewithlight", //Komodo: plot lumineux pour dépanneurs. actions.
	"life_inv_poison", //serrat : Poison
	"life_inv_hood", //added by Kriss, hood system
	"life_inv_grapes",
	"life_inv_grapejuice",
	"life_inv_wine",
	"life_inv_moonshine",
	"life_inv_sake",
	"life_inv_nem",
	"life_inv_applecompote",
	"life_inv_peachcompote",
	"life_inv_masonry_kit", //Kriss: Kit de maçonnerie : Wall reconstruction
	"life_inv_cargo_hemtt", //Komodo: cargaison HEMTT
	"life_inv_organp",
	"life_inv_organ",
	"life_inv_gpstracker",
	"life_inv_puranium",
	"life_inv_ipuranium",
	"life_inv_uranium1",
	"life_inv_uranium2",
	"life_inv_uranium3",
	"life_inv_uranium4",
	"life_inv_uranium",
	"life_inv_uranium2b",
	"life_inv_uranium3b",
	"life_inv_uranium4b",
	"life_inv_uranium5b",

	//**************************
	//********* NEW ************
	//**************************
	"life_inv_goldp",
	"life_inv_goldbarp",
	"life_inv_clayp",
	"life_inv_briquep",
	"life_inv_diamantp",
	"life_inv_diamantpurp",
	"life_inv_ironorep",
	"life_inv_ironp",
	"life_inv_charbonp",
	"life_inv_souffrep",
	"life_inv_poudrenoirp",
	"life_inv_uraniump1",
	"life_inv_uraniump2",
	"life_inv_uraniump3",
	"life_inv_uraniump4",
	"life_inv_uraniumpurp",
	"life_inv_oilpy",
	"life_inv_plastiquep",
	"life_inv_boisp",
	"life_inv_planchep",
	"life_inv_linp",
	"life_inv_tissup",
	"life_inv_cocainp",
	"life_inv_cocainpurp",
	"life_inv_heroinpy",
	"life_inv_heroinpurp",
	"life_inv_marip",
	"life_inv_maripurp",
	"life_inv_ossilp",
	"life_inv_osslp"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	// EMT
	["license_med_air","med"],

	//GENDARMES
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_cop_bac","cop"],

	//PERMIS
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_truck","civ"],
	["license_civ_boat","civ"],
  	["license_civ_home","civ"],
	["license_civ_presse","civ"],
	["license_civ_permrebel","civ"],
	["license_civ_transport","civ"],
	["license_civ_dive","civ"],

	//RESSOURCES
	//legal
	["license_civ_iron","civ"],
	["license_civ_peche","civ"], //Pecheur
	["license_civ_bucheron","civ"],  //Bucheron
	["license_civ_tissu","civ"],  //Vendeur de tissu
	["license_civ_poudre","civ"],  //Armurier
	["license_civ_brique","civ"],  //Vendeur chez Gédimat
	["license_civ_plastique","civ"], //Vendeur chez LegoGroup
	["license_civ_joaillier","civ"],  //Joaillier
	["license_civ_diamantaire","civ"], //Diamantaire

	//illegal
	["license_civ_heroine","civ"],
	["license_civ_canabis","civ"],
	["license_civ_cocaine","civ"],
	["license_civ_uranium","civ"],
	["license_civ_archeologie","civ"],
	["license_civ_organ","civ"],

	//autre
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_gangster","civ"],

	// ANCIENNE VERSION
	["license_civ_depanneur","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_meth","civ"],
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_civ_papiers","civ"],
	["license_civ_wine","civ"],
	["license_civ_pressjuice","civ"],
	["license_civ_moonshine","civ"],
	["license_civ_applecompote","civ"],
	["license_civ_peachcompote","civ"],
	["license_civ_turtle","civ"],
	["license_civ_gang","civ"],
	["license_civ_bounty_hunter","civ"],

	//ENTREPRISES
	["license_civ_bonbeur","civ"]

];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

//Setup XP system
life_prof =[
	//civil
	["Peche_Prof","civ"],
	["Bucheron_Prof","civ"],
	["Tissu_Prof","civ"],
	["Poudre_Prof","civ"],
	["Brique_Prof","civ"],
	["Plastique_Prof","civ"],
	["Joaillier_Prof","civ"],
	["Diamantaire_Prof","civ"],
	["Forgeron_Prof","civ"],
	["Heroine_Prof","civ"],
	["Canabis_Prof","civ"],
	["Cocaine_Prof","civ"],
	["Uranium_Prof","civ"]

	//gendarme
	//["Ticket_Prof","cop"],
	//["Arrest_Prof","cop"],
	//["Impound_Prof","cop"],

	//emt
	//["Revive_Prof","med"]

	/*
	["Oil_Prof","civ"],
	["Iron_Prof","civ"],
	["Copper_Prof","civ"],
	["Heroin_Prof","civ"],
	["Canabis_Prof","civ"],
	["Cocain_Prof","civ"],
	["Salt_Prof","civ"],
	["Fruit_Prof","civ"],
	["Diamond_Prof","civ"],
	["Rock_Prof","civ"],
	["Sand_Prof","civ"],
	*/
];


//Setup License Variables
{
	missionNamespace setVariable[(_x select 0),[0,0]];
} foreach life_prof;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25","dp_26","dp_27"];
//[shortVar,reward]
life_illegal_items = [
	["heroinu",1200],
	["heroinp",2500],
	["cocaine",1500],
	["cocainep",3500],
	["marijuana",2000],
	["cannabis",980],
	["turtle",3500],
	["crystalmeth",3300],
	["moonshine",7000],
	["bottledshine",11000],
	["mash",5000],
	["crystalmethpur",3600],
	["poudrehydroxyde",3600],
	["kitmeth",3600],
	["poison",50000],
	["goldbar",21000],
	["blastingcharge",30000],
	["archeologieillegale",2500],
	["organp",5000],
	["organ",3000],
	["lockpick",100],
	["uranium2b",10000],
	["uranium3b",10000],
	["uranium4b",10000],
	["uranium5b",10000],
	["ipuranium",10000],
	["cocainp",0], // By Pytha de là
	["cocainpurp",6500],
	["heroinp",0],
	["heroinpurp",6000],
	["marip",0],
	["maripurp",4500], // Jusqu'à là
	["osslp",11900],
	["ossillp",0],
	["uraniump",11600]
];

//added by Kriss 01/09/2014 // To prevent buy this ressources
list_commercial_items =
[
	"heroinu",
	"heroinp",
	"cocaine",
	"cocainep",
	"marijuana",
	"turtle",
	"crystalmeth",
	"moonshine",
	"bottledshine",
	"mash",
	"crystalmethpur",
	"poudrehydroxyde",
	//"kitmeth",
	"goldbar",
	"oilp",
	"iron_r",
	"archeologie",
	"diamondc",
	"copper_r",
	"salt_r",
	"glass",
	"cement",
	"grapes",
	"grapejuice",
	"boltcutter",
"fishp",
"boisp",
"sandp",
"glassp",
"laitp",
"caoutchoucp",
"linp",
"tissup",
"charbonp",
"poudrenoirp",
"souffrep",
"cocainp",
"cocainpurp",
"heroinp",
"heroinpurp",
"marip",
"maripurp",
"uraniump",
"uraniumpurp",
"rockp",
"rocktaillep",
"copperorep",
"sacp",
"goldp",
"goldbarp",
"ironorep",
"ironp",
"diamantp",
"diamantpurp",
"oilpy",
"plastiquep",
"calcairep",
"cimentp",
"ossillp",
"osslp"
];

/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",50],
	["peach",20],
	["heroinu",2700],
	["heroinp",4700],
	["cocaine",1900],
	["cocainep",3900],
	["diamond",2548],
	["diamondc",3548],
	["iron_r",1289],
	["copper_r",1400],
	["salt_r",2800],
	["glass",1800],
	["oilp",1600],
	["cement",1700],
	["marijuana",3680],
	["turtle",9865],
	["crystalmethpur",10279],//added by asurion
	["archeologie",4078], //added by asurion
	["grapejuice",1000],
	["wine",1950],
	["moonshine",4000],
	["applecompote",187],
	["peachcompote",180],

	["salema",500],
	["ornate",500],
	["mackerel",500],
	["tuna",500],
	["mullet",500],
	["catshark",500],
	["rabbit",65],
	["water",5],
	["coffee",5],
	["turtlesoup",4300],
	["donuts",60],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["fuelF",500],
	["spikeStrip",1500],
	["goldbar",75000],
	["bottledshine",10000],
	["bottledwhiskey",9500],
	["bottledbeer",9000],
	["whiskey",4000],
	["beerp",4500],
	["mash",2500],
	["rye",2000],
	["hops",1800],
	["yeast",2000],
	["cornmeal",200],
	["bottles",75],
	["hamburger",25],//added by asurion
	["crystalmeth",5700],
	["frites",5],//added by asurion
	["cheeseburger",30],//added by asurion
	["barriere",300],//added by asurion
	["barriereStop",300],//added by asurion
	["cargoHq",2500],//added by asurion
	["blocdesableLong",1500],//added by asurion
	["ziptie",2000],//added by asurion
	["defibrilateur",10000],//added by asurion
	["acideahlorhydrique",1250],//added by asurion
	["hydrogenchloride",125],//added by asurion
	["hydroxydesodiumanhydre",50],//added by asurion
	["kitmeth",2000],//added by asurion
	["machete",50], //Added by Komodo
	["conewithlight",100], //Added by Komodo conewithlight
	["poison",5000],
	["hood",15000],	//added by Kriss, hood system
	["grapes",1000],
	["sake",60],
	["organp",5000],
	["nem",5],
	["gpstracker",1000],
	["uranium",15000], //When You Sell (Uranium LEGAL)
	["uranium5b",40000], //When You Sell (Uranium ILLEGAL
	["blastingcharge",30000],
	["archeologieillegale",2500],
	["organ",3000],
	["lockpick",100],
	["uranium2b",10000],
	["uranium3b",10000],
	["uranium4b",10000],
	["ipuranium",10000],

["fishp",150],
["boisp",1],
["planchep",500],
["sandp",1],
["glassp",1],
["laitp",1],
["caoutchoucp",1],
["linp",1],
["tissup",1000],
["charbonp",1],
["poudrenoirp",375],
["souffrep",1],
["cocainp",1],
["cocainpurp",6500],
["heroinp",1],
["heroinpurp",6000],
["marip",1],
["maripurp",4500],
["uraniump",11600],
["uraniumpurp",1],
["rockp",1],
["rocktaillep",1],
["copperorep",1],
["sacp",1100],
["goldp",1],
["goldbarp",3500],
["ironorep",1],
["ironp",2000],
["diamantp",1],
["diamantpurp",5000],
["oilpy",1],
["plastiquep",2400],
["calcairep",1],
["cimentp",1],
["osslp",7300],
["organp",11900],
["briquep",1100]

];
__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",65],
    ["rabbit",75],
    ["salema",1550],
    ["ornate",1500],
    ["mackerel",1500],
    ["tuna",1500],
    ["mullet",1500],
    ["catshark",1550],
	["water",10],
	["turtle",4300],
	["turtlesoup",4300],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["bottledshine",15500],
	["bottledwhiskey",10000],
	["bottledbeer",10000],
	["moonshine",7500],
	["whiskey",5500],
	["beerp",5000],
	["cornmeal",500],
	["mash",2500],
	["bottles",100],
	["blastingcharge",30000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["goldbar",60000],
	["ziptie",3000],//added by asurion
	["hamburger",75],//added by asurion
	["frites",60],//added by asurion
	["cheeseburger",90],//added by asurion
	["barriere",500],//added by asurion
	["barriereStop",500],//added by asurion
 //   ["storage2",250000],//added by asurion
	["acideahlorhydrique",2500],//added by asurion
	["hydrogenchloride",250],//added by asurion
	["hydroxydesodiumanhydre",100],//added by asurion
	["poudrehydroxyde",3600],
	["crystalmethpur",10750],
	["kitmeth",2000], //added by asurion
	["hood",30000],	//added by Kriss, hood system
	["machete",100], //Added by Komodo
	["poison",50000],
	["conewithlight",100], //Added by Komodo conewithlight
	["masonry_kit", 25000],	//Kriss, wall reconstruction
	["sake",5000],
	["nem",60],
	["gpstracker",10000],
	["puranium",15687], //When You Buy (Uranium Product Legal)
	["ipuranium",4896], //When You Buy (Uranium Product (Illegal)
	// ["fishp",1],
	// ["boisp",1],
	["planchep",1000],
	// ["sandp",1],
	// ["glassp",1],
	// ["laitp",1],
	// ["caoutchoucp",1],
	// ["linp",1],
	["tissup",1500]
	// ["charbonp",1],
	// ["poudrenoirp",1],
	// ["souffrep",1],
	// ["cocainp",1],
	// ["cocainpurp",1],
	// ["heroinp",1],
	// ["heroinpurp",1],
	// ["marip",1],
	// ["maripurp",1],
	// ["uraniump",1],
	// ["uraniumpurp",1],
	// ["rockp",1],
	// ["rocktaillep",1],
	// ["copperorep",1],
	// ["sacp",1],
	// ["goldp",1],
	// ["goldbarp",1],
	// ["ironorep",1],
	// ["ironp",1],
	// ["diamantp",1],
	// ["diamantpurp",1],
	// ["oilpy",1],
	// ["plastiquep",1],
	// ["calcairep",1],
	// ["cimentp",1]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",0],
	["ItemRadio",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_Quadbike_01_F",1000],
	["C_Hatchback_01_F",2000],
	["C_Offroad_01_F", 2000],
	["B_G_Offroad_01_F",2000],
	["C_SUV_01_F",2000],
	["C_Hatchback_01_sport_F",3000],
	["InvolvedMegane",3000],
	["C_Van_01_transport_F",3000],
	["C_Van_01_fuel_F",3000],
	["C_Van_01_box_F",3000],
	["I_Heli_Transport_02_F",7000],
	["B_Heli_Light_01_F",7000],
	["O_Heli_Light_02_unarmed_F",6000],
	["I_Truck_02_transport_F",4000],
	["I_Truck_02_covered_F",4000],
	["B_Truck_01_transport_F",4000],
	["B_Truck_01_box_F", 4000],
	["B_Truck_01_fuel_F", 4000], //Komodo: added for Fuel truck
	["B_MRAP_01_F",8000],     //hunter
	["O_MRAP_02_F",2000],   //ifrit
	["I_MRAP_03_F",2000],     //strider
	["C_Rubberboat",1000],
	["C_Boat_Civil_01_F",2000],
	["B_Boat_Transport_01_F",2000],
	["C_Boat_Civil_01_police_F",2000],
	["B_Boat_Armed_01_minigun_F",150000],
	["B_G_Offroad_01_armed_F",20000],
	["DAR_MK23ADT",20000],
	["DAR_MK23AD",20000],
	["BAF_Offroad_W_HMG",20000],
	["BAF_Offroad_D_HMG",20000],
	["O_Truck_03_transport_F",4000],
	["B_SDV_01_F",20000],
	["GNT_C185F",20000],
	["GNT_C185",20000],
	["O_Heli_Transport_04_covered_F",7000], //dlc
	["O_Heli_Transport_04_repair_F",7000],
	["O_Heli_Transport_04_medevac_F",7000],
	["O_Heli_Transport_04_F",7000],
	["O_Heli_Transport_04_box_F",7000] //dlc
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	//Véhicules armés
	["B_G_Offroad_01_armed_F",187500],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_Heli_Transport_01_F",250000],
	["B_Heli_Transport_03_F",150000],

	//Véhicules légers
	["B_Quadbike_01_F",2500],
	["C_Offroad_01_F",12500],
	["C_SUV_01_F",35000],
	["C_Van_01_transport_F",40000],
	["B_G_Offroad_01_F",9000],

	//Véhicules blindés
	["O_MRAP_02_F",131000],
	["B_MRAP_01_F",90000],
	["I_MRAP_03_F",225000],

	//Camions
	["C_Van_01_fuel_F",3850],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_covered_F",150000],
	["B_Truck_01_fuel_F",150000], //Komodo: added for fuel truck
	["B_Truck_01_box_F", 150000],
	["O_Truck_03_device_F",140625],


	//Hélicos
	["I_Heli_Transport_02_F",125000],
	["B_Heli_Light_01_F",107000],
	["O_Heli_Light_02_unarmed_F",125000],		// fix lambert revente
	["O_Heli_Transport_04_covered_F",287500],
	["O_Heli_Transport_04_box_F",287500],
	["PMC_MH9",150000],
	["C_Heli_Light_01_civil_F",150000],
	["GNT_C185F",45000],
	["GNT_C185",45000],

	//Bateaux
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_SDV_01_F",45000],

	//AJOUT VEHICULES MODS JOHNNY
	["DAR_TahoeCiv",10000],
	["DAR_TaurusCiv",10000],
	["DAR_ImpalaCiv",10000],
	["DAR_ImpalaPolice",10000],
	["DAR_TahoePolice",10000],
	["DAR_4x4",95750],
	["DAR_MK23",150000],
	["DAR_MK27",262500],
	["DAR_MK27T",375000],
	["DAR_LHS_16",450000]
];
__CONST__(life_garage_sell,life_garage_sell);

//Added by komodo for vehicle resseling prices to control the rules.
life_vehicle_resell =
[
			["B_Quadbike_01_F",950],
			["C_Hatchback_01_F",4500],
			["C_Offroad_01_F", 10500],
			["B_G_Offroad_01_F",10500],
			["C_SUV_01_F",27000],
			["C_Van_01_transport_F",40000],
			["C_Van_01_fuel_F",45000],
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",49800],
			["I_Truck_02_covered_F",75000],
			["O_Truck_02_covered_F",75000],
	/*Ajout véhicules moddés john pat' 20/08/15
	pris du véhicule (fn_vehicleListCfg.sqf)*0.7 sa fait 50% du pris de basse */
			["dbo_CIV_ol_bike",665],
			["A3L_CVBlack",3033],
			["A3L_CVBlue",3033],
			["A3L_CVGrey",3033],
			["A3L_CVPink",3033],
			["A3L_CVRed",3033],
			["A3L_CVWhite",3033],
			["A3L_VolksWagenGolfGTiblack",11666],
			["A3L_VolksWagenGolfGTiblue",11666],
			["A3L_VolksWagenGolfGTired",11666],
			["A3L_VolksWagenGolfGTiwhite",11666],
			["cl3_golf_mk2_yellow",11666],
			["cl3_golf_mk2_black",11666],
			["cl3_golf_mk2_blue",11666],
			["cl3_golf_mk2_aqua",11666],
			["cl3_golf_mk2_babypink",11666],
			["cl3_golf_mk2_red",11666],
			["cl3_golf_mk2_burgundy",11666],
			["cl3_golf_mk2_cardinal",11666],
			["cl3_golf_mk2_dark_green",11666],
			["cl3_golf_mk2_gold",11666],
			["cl3_golf_mk2_green",11666],
			["cl3_golf_mk2_grey",11666],
			["cl3_golf_mk2_lavender",11666],
			["cl3_golf_mk2_light_blue",11666],
			["cl3_golf_mk2_light_yellow",11666],
			["cl3_golf_mk2_lime",11666],
			["cl3_golf_mk2_marina_blue",11666],
			["cl3_golf_mk2_navy_blue",11666],
			["cl3_golf_mk2_orange",11666],
			["cl3_golf_mk2_purple",11666],
			["cl3_golf_mk2_sand",11666],
			["cl3_golf_mk2_silver",11666],
			["cl3_golf_mk2_white",11666],
			["cl3_golf_mk2_violet",11666],
			["cl3_civic_vti_yellow",16100],
			["cl3_civic_vti_black",16100],
			["cl3_civic_vti_blue",16100],
			["cl3_civic_vti_aqua",16100],
			["cl3_civic_vti_babypink",16100],
			["cl3_civic_vti_red",16100],
			["cl3_civic_vti_burgundy",16100],
			["cl3_civic_vti_cardinal",16100],
			["cl3_civic_vti_dark_green",16100],
			["cl3_civic_vti_gold",16100],
			["cl3_civic_vti_green",16100],
			["cl3_civic_vti_grey",16100],
			["cl3_civic_vti_lavender",16100],
			["cl3_civic_vti_light_blue",16100],
			["cl3_civic_vti_light_yellow",16100],
			["cl3_civic_vti_lime",16100],
			["cl3_civic_vti_marina_blue",16100],
			["cl3_civic_vti_navy_blue",16100],
			["cl3_civic_vti_orange",16100],
			["cl3_civic_vti_purple",16100],
			["cl3_civic_vti_sand",16100],
			["cl3_civic_vti_silver",16100],
			["cl3_civic_vti_white",16100],
			["cl3_civic_vti_violet",16100],
			["A3L_PuntoBlack",23333],
			["A3L_PuntoGrey",23333],
			["A3L_PuntoBlue",23333],
			["A3L_PuntoRed",23333],
			["A3L_PuntoWhite",23333],
			["cl3_range_rover_yellow",28000],
			["cl3_range_rover_black",28000],
			["cl3_range_rover_blue",28000],
			["cl3_range_rover_aqua",28000],
			["cl3_range_rover_babypink",28000],
			["cl3_range_rover_red",28000],
			["cl3_range_rover_burgundy",28000],
			["cl3_range_rover_cardinal",28000],
			["cl3_range_rover_dark_green",28000],
			["cl3_range_rover_gold",28000],
			["cl3_range_rover_green",28000],
			["cl3_range_rover_grey",28000],
			["cl3_range_rover_lavender",28000],
			["cl3_range_rover_light_blue",28000],
			["cl3_range_rover_light_yellow",28000],
			["cl3_range_rover_lime",28000],
			["cl3_range_rover_marina_blue",28000],
			["cl3_range_rover_navy_blue",28000],
			["cl3_range_rover_orange",28000],
			["cl3_range_rover_purple",28000],
			["cl3_range_rover_sand",28000],
			["cl3_range_rover_silver",28000],
			["cl3_range_rover_white",28000],
			["cl3_range_rover_violet",28000],
			["cl3_polo_gti_yellow",30100],
			["cl3_polo_gti_black",30100],
			["cl3_polo_gti_blue",30100],
			["cl3_polo_gti_aqua",30100],
			["cl3_polo_gti_babypink",30100],
			["cl3_polo_gti_red",30100],
			["cl3_polo_gti_burgundy",30100],
			["cl3_polo_gti_cardinal",30100],
			["cl3_polo_gti_dark_green",30100],
			["cl3_polo_gti_gold",30100],
			["cl3_polo_gti_green",30100],
			["cl3_polo_gti_grey",30100],
			["cl3_polo_gti_lavender",30100],
			["cl3_polo_gti_light_blue",30100],
			["cl3_polo_gti_light_yellow",30100],
			["cl3_polo_gti_lime",30100],
			["cl3_polo_gti_marina_blue",30100],
			["cl3_polo_gti_navy_blue",30100],
			["cl3_polo_gti_orange",30100],
			["cl3_polo_gti_purple",30100],
			["cl3_polo_gti_sand",30100],
			["cl3_polo_gti_silver",30100],
			["cl3_polo_gti_white",30100],
			["cl3_polo_gti_violet",30100],
			["DAR_FusionCivBlack",35000],
			["DAR_FusionCivBlue",35000],
			["DAR_FusionCivRed",35000],
			["DAR_FusionCiv",35000],
			["cl3_insignia_yellow",37100],
			["cl3_insignia_black",37100],
			["cl3_insignia_blue",37100],
			["cl3_insignia_aqua",37100],
			["cl3_insignia_babypink",37100],
			["cl3_insignia_red",37100],
			["cl3_insignia_burgundy",37100],
			["cl3_insignia_cardinal",37100],
			["cl3_insignia_dark_green",37100],
			["cl3_insignia_gold",37100],
			["cl3_insignia_green",37100],
			["cl3_insignia_grey",37100],
			["cl3_insignia_lavender",37100],
			["cl3_insignia_light_blue",37100],
			["cl3_insignia_light_yellow",37100],
			["cl3_insignia_lime",37100],
			["cl3_insignia_marina_blue",37100],
			["cl3_insignia_navy_blue",37100],
			["cl3_insignia_orange",37100],
			["cl3_insignia_purple",37100],
			["cl3_insignia_sand",37100],
			["cl3_insignia_silver",37100],
			["cl3_insignia_white",37100],
			["cl3_insignia_violet",37100],
			["cl3_e63_amg_yellow",39200],
			["cl3_e63_amg_black",39200],
			["cl3_e63_amg_blue",39200],
			["cl3_e63_amg_aqua",39200],
			["cl3_e63_amg_babypink",39200],
			["cl3_e63_amg_red",39200],
			["cl3_e63_amg_burgundy",39200],
			["cl3_e63_amg_cardinal",39200],
			["cl3_e63_amg_dark_green",39200],
			["cl3_e63_amg_gold",39200],
			["cl3_e63_amg_green",39200],
			["cl3_e63_amg_grey",39200],
			["cl3_e63_amg_lavender",39200],
			["cl3_e63_amg_light_blue",39200],
			["cl3_e63_amg_light_yellow",39200],
			["cl3_e63_amg_lime",39200],
			["cl3_e63_amg_marina_blue",39200],
			["cl3_e63_amg_navy_blue",39200],
			["cl3_e63_amg_orange",39200],
			["cl3_e63_amg_purple",39200],
			["cl3_e63_amg_sand",39200],
			["cl3_e63_amg_silver",39200],
			["cl3_e63_amg_white",39200],
			["cl3_e63_amg_violet",39200],
			["cl3_taurus_yellow",42000],
			["cl3_taurus_black",42000],
			["cl3_taurus_blue",42000],
			["cl3_taurus_aqua",42000],
			["cl3_taurus_babypink",42000],
			["cl3_taurus_red",42000],
			["cl3_taurus_burgundy",42000],
			["cl3_taurus_cardinal",42000],
			["cl3_taurus_dark_green",42000],
			["cl3_taurus_gold",42000],
			["cl3_taurus_green",42000],
			["cl3_taurus_grey",42000],
			["cl3_taurus_lavender",42000],
			["cl3_taurus_light_blue",42000],
			["cl3_taurus_light_yellow",42000],
			["cl3_taurus_lime",42000],
			["cl3_taurus_marina_blue",42000],
			["cl3_taurus_navy_blue",42000],
			["cl3_taurus_orange",42000],
			["cl3_taurus_purple",42000],
			["cl3_taurus_sand",42000],
			["cl3_taurus_silver",42000],
			["cl3_taurus_white",42000],
			["cl3_taurus_violet",42000],
			["A3L_GrandCaravanBlk",46666],
			["A3L_GrandCaravanBlue",46666],
			["A3L_GrandCaravanGreen",46666],
			["A3L_GrandCaravanPurple",46666],
			["A3L_GrandCaravanRed",46666],
			["A3L_RX7_Black",51100],
			["A3L_RX7_Red",51100],
			["A3L_RX7_White",51100],
			["A3L_RX7_Blue",51100],
			["cl3_q7_yellow",53900],
			["cl3_q7_black",53900],
			["cl3_q7_blue",53900],
			["cl3_q7_aqua",53900],
			["cl3_q7_babypink",53900],
			["cl3_q7_red",53900],
			["cl3_q7_burgundy",53900],
			["cl3_q7_cardinal",53900],
			["cl3_q7_dark_green",53900],
			["cl3_q7_gold",53900],
			["cl3_q7_green",53900],
			["cl3_q7_grey",53900],
			["cl3_q7_lavender",53900],
			["cl3_q7_light_blue",53900],
			["cl3_q7_light_yellow",53900],
			["cl3_q7_lime",53900],
			["cl3_q7_marina_blue",53900],
			["cl3_q7_navy_blue",53900],
			["cl3_q7_orange",53900],
			["cl3_q7_purple",53900],
			["cl3_q7_sand",53900],
			["cl3_q7_silver",53900],
			["cl3_q7_white",53900],
			["cl3_q7_violet",53900],
			["cl3_transit_yellow",56000],
			["cl3_transit_black",56000],
			["cl3_transit_blue",56000],
			["cl3_transit_aqua",56000],
			["cl3_transit_babypink",56000],
			["cl3_transit_red",56000],
			["cl3_transit_burgundy",56000],
			["cl3_transit_cardinal",56000],
			["cl3_transit_dark_green",56000],
			["cl3_transit_gold",56000],
			["cl3_transit_green",56000],
			["cl3_transit_grey",56000],
			["cl3_transit_lavender",56000],
			["cl3_transit_light_blue",56000],
			["cl3_transit_light_yellow",56000],
			["cl3_transit_lime",56000],
			["cl3_transit_marina_blue",56000],
			["cl3_transit_navy_blue",56000],
			["cl3_transit_orange",56000],
			["cl3_transit_purple",56000],
			["cl3_transit_sand",56000],
			["cl3_transit_silver",56000],
			["cl3_transit_white",56000],
			["cl3_transit_violet",56000],
			["A3L_F350Black",58333],
			["A3L_F350Blue",58333],
			["A3L_F350Red",58333],
			["A3L_F350White",58333],
			["DAR_TahoeCivBlack",81666],
			["DAR_TahoeCivBlue",81666],
			["DAR_TahoeCivRed",81666],
			["DAR_TahoeCivSilver",81666],
			["DAR_TahoeCiv",81666],
			["BMW_M5Black",93333],
			["BMW_M5Blue",93333],
			["BMW_M5White",93333],
			["BMW_M5Red",93333],
			["cl3_e60_m5_yellow",93333],
			["cl3_e60_m5_black",93333],
			["cl3_e60_m5_blue",93333],
			["cl3_e60_m5_aqua",93333],
			["cl3_e60_m5_babypink",93333],
			["cl3_e60_m5_red",93333],
			["cl3_e60_m5_burgundy",93333],
			["cl3_e60_m5_cardinal",93333],
			["cl3_e60_m5_dark_green",93333],
			["cl3_e60_m5_gold",93333],
			["cl3_e60_m5_green",93333],
			["cl3_e60_m5_grey",93333],
			["cl3_e60_m5_lavender",93333],
			["cl3_e60_m5_light_blue",93333],
			["cl3_e60_m5_light_yellow",93333],
			["cl3_e60_m5_lime",93333],
			["cl3_e60_m5_marina_blue",93333],
			["cl3_e60_m5_navy_blue",93333],
			["cl3_e60_m5_orange",93333],
			["cl3_e60_m5_purple",93333],
			["cl3_e60_m5_sand",93333],
			["cl3_e60_m5_silver",93333],
			["cl3_e60_m5_white",93333],
			["cl3_e60_m5_violet",93333],
			["DAR_TaurusCivBlack",105000],
			["DAR_TaurusCivBlue",105000],
			["DAR_TaurusCiv",105000],
			["cl3_dodge_chargerum_s_black",116666],
			["cl3_dodge_chargerum_o_black",116666],
			["cl3_dodge_chargerum_f_black",116666],
			["cl3_dodge_chargerum_s_blue",116666],
			["cl3_dodge_chargerum_o_blue",116666],
			["cl3_dodge_chargerum_f_blue",116666],
			["cl3_dodge_chargerum_s_darkgreen",116666],
			["cl3_dodge_chargerum_o_darkgreen",116666],
			["cl3_dodge_chargerum_f_darkgreen",116666],
			["cl3_dodge_chargerum_s_darkred",116666],
			["cl3_dodge_chargerum_o_darkred",116666],
			["cl3_dodge_chargerum_f_darkred",116666],
			["cl3_dodge_chargerum_s_green",116666],
			["cl3_dodge_chargerum_o_green",116666],
			["cl3_dodge_chargerum_f_green",116666],
			["cl3_dodge_chargerum_s_grey",116666],
			["cl3_dodge_chargerum_o_grey",116666],
			["cl3_dodge_chargerum_f_grey",116666],
			["cl3_dodge_chargerum_s_lime",116666],
			["cl3_dodge_chargerum_o_lime",116666],
			["A3L_ChargerBlack",116666],
			["A3L_ChargerBlue",116666],
			["A3L_ChargerRed",116666],
			["A3L_ChargerWhite",116666],
			["cl3_z4_2008_yellow",121100],
			["cl3_z4_2008_black",121100],
			["cl3_z4_2008_blue",121100],
			["cl3_z4_2008_aqua",121100],
			["cl3_z4_2008_babypink",121100],
			["cl3_z4_2008_red",121100],
			["cl3_z4_2008_burgundy",121100],
			["cl3_z4_2008_cardinal",121100],
			["cl3_z4_2008_dark_green",121100],
			["cl3_z4_2008_gold",121100],
			["cl3_z4_2008_green",121100],
			["cl3_z4_2008_grey",121100],
			["cl3_z4_2008_lavender",121100],
			["cl3_z4_2008_light_blue",121100],
			["cl3_z4_2008_light_yellow",121100],
			["cl3_z4_2008_lime",121100],
			["cl3_z4_2008_marina_blue",121100],
			["cl3_z4_2008_navy_blue",121100],
			["cl3_z4_2008_orange",121100],
			["cl3_z4_2008_purple",121100],
			["cl3_z4_2008_sand",121100],
			["cl3_z4_2008_silver",121100],
			["cl3_z4_2008_white",121100],
			["cl3_z4_2008_violet",121100],
			["A3L_TaurusBlack",128333],
			["A3L_TaurusBlue",128333],
			["A3L_TaurusRed",128333],
			["A3L_TaurusWhite",128333],
			["wirk_gtr",133000],
			["DAR_ChallengerCivBlack",140000],
			["DAR_ChallengerCivOrange",140000],
			["DAR_ChallengerCivRed",140000],
			["DAR_ChallengerCivWhite",140000],
			["tal_wrangler_black",151666],
			["tal_wrangler_white",151666],
			["tal_wrangler_grey",151666],
			["tal_wrangler_orange",151666],
			["tal_wrangler_red",151666],
			["tal_wrangler_blue",151666],
			["tal_wrangler_green",151666],
			["tal_wrangler_purple",151666],
			["tal_wrangler_yellow",151666],
			["tal_wrangler_lightblue",151666],
			["tal_wrangler_lime",151666],
			["tal_wrangler_pink",151666],
			["S_Skyline_Black",163333],
			["S_Skyline_Blue",163333],
			["S_Skyline_Purple",163333],
			["S_Skyline_Red",163333],
			["S_Skyline_White",163333],
			["S_Skyline_Yellow",163333],
			["DAR_ChargerCiv",175000],
			["DAR_Charger_Blue",175000],
			//cart et moto
			["C_Kart_01_F",14000],
			["C_Kart_01_Fuel_F",14000],
			["C_Kart_01_Blu_F",14000],
			["C_Kart_01_Red_F",14000],
			["C_Kart_01_Vrana_F",14000],
			["cl3_xr_1000_yellow",63637],
			["cl3_xr_1000_black",63637]
];
__CONST__(life_vehicle_resell,life_vehicle_resell);

life_price_insurance =
[
    ["B_Quadbike_01_F",500],
    ["C_Hatchback_01_F",200],
    ["C_Offroad_01_F", 2500],
    ["B_G_Offroad_01_F",2500],
    ["C_SUV_01_F",7500],
    ["C_Van_01_transport_F",10000],
    ["C_Hatchback_01_sport_F",5000],
    ["C_Van_01_fuel_F",10000],
    ["I_Heli_Transport_02_F",32500],
    ["C_Van_01_box_F",12500],
    ["I_Truck_02_transport_F",25000],
    ["I_Truck_02_covered_F",30000],
    ["B_Truck_01_transport_F",67500],
    ["B_Truck_01_box_F", 77500],
    ["O_MRAP_02_F",37500],
    ["B_Heli_Light_01_F",50000],
    ["O_Heli_Light_02_unarmed_F",150000],
    ["B_Truck_01_ammo_F",37500],
    ["O_Truck_03_transport_F",100000],
    ["C_Rubberboat",500],
    ["C_Boat_Civil_01_F",3400],
    ["B_Boat_Transport_01_F",400],
    ["C_Boat_Civil_01_police_F",2500],
    ["B_Boat_Armed_01_minigun_F",10500],
    ["B_SDV_01_F",22500],
    ["B_MRAP_01_F",37500],
    ["I_Truck_02_medical_F",18000],
    ["O_Truck_03_medical_F",20000],
    ["B_Truck_01_medical_F",22000],
    ["O_Truck_03_device_F",80000],
    ["O_Truck_02_Ammo_F",5000000], //Komodo: assurance existante, mais au prix d'achat ;)
	["B_Truck_01_fuel_F",77500], //Komodo: added for liquid transport

	//CIVIL MODED
	["A3L_CVBlack",2166],
	["A3L_CVBlue",2166],
	["A3L_CVGrey",2166],
	["A3L_CVPink",2166],
	["A3L_CVRed",2166],
	["A3L_CVWhite",2166],
	["A3L_VolksWagenGolfGTiblack",16666],
	["A3L_VolksWagenGolfGTiblue",16666],
	["A3L_VolksWagenGolfGTired",16666],
	["A3L_VolksWagenGolfGTiwhite",16666],
	["A3L_PuntoBlack",33333],
	["A3L_PuntoGrey",33333],
	["A3L_PuntoBlue",33333],
	["A3L_PuntoRed",33333],
	["A3L_PuntoWhite",33333],
	["DAR_FusionCivBlack",50000],
	["DAR_FusionCivBlue",50000],
	["DAR_FusionCivRed",50000],
	["DAR_FusionCiv",50000],
	["A3L_RX7_Black",66666],
	["A3L_RX7_Red",66666],
	["A3L_RX7_White",66666],
	["A3L_RX7_Blue",66666],
	["A3L_F350Black",83333],
	["A3L_F350Blue",83333],
	["A3L_F350Red",83333],
	["A3L_F350White",83333],
	["A3L_GrandCaravanBlk",100000],
	["A3L_GrandCaravanBlue",100000],
	["A3L_GrandCaravanGreen",100000],
	["A3L_GrandCaravanPurple",100000],
	["A3L_GrandCaravanRed",100000],
	["DAR_TahoeCivBlack",116666],
	["DAR_TahoeCivBlue",116666],
	["DAR_TahoeCivRed",116666],
	["DAR_TahoeCivSilver",116666],
	["DAR_TahoeCiv",116666],
	["BMW_M5Black",133333],
	["BMW_M5Blue",133333],
	["BMW_M5White",133333],
	["BMW_M5Red",133333],
	["DAR_TaurusCivBlack",150000],
	["DAR_TaurusCivBlue",150000],
	["DAR_TaurusCiv",150000],
	["A3L_ChargerBlack",166666],
	["A3L_ChargerBlue",166666],
	["A3L_ChargerRed",166666],
	["A3L_ChargerWhite",166666],
	["A3L_TaurusBlack",183333],
	["A3L_TaurusBlue",183333],
	["A3L_TaurusRed",183333],
	["A3L_TaurusWhite",183333],
	["DAR_ChallengerCivBlack",200000],
	["DAR_ChallengerCivOrange",200000],
	["DAR_ChallengerCivRed",200000],
	["DAR_ChallengerCivWhite",200000],
	["tal_wrangler_black",216666],
	["tal_wrangler_white",216666],
	["tal_wrangler_grey",216666],
	["tal_wrangler_orange",216666],
	["tal_wrangler_red",216666],
	["tal_wrangler_blue",216666],
	["tal_wrangler_green",216666],
	["tal_wrangler_purple",216666],
	["tal_wrangler_yellow",216666],
	["tal_wrangler_lightblue",216666],
	["tal_wrangler_lime",216666],
	["tal_wrangler_pink",216666],
	["S_Skyline_Black",233333],
	["S_Skyline_Blue",233333],
	["S_Skyline_Purple",233333],
	["S_Skyline_Red",233333],
	["S_Skyline_White",233333],
	["S_Skyline_Yellow",233333],
	["DAR_ChargerCiv",250000],
	["DAR_Charger_Blue",250000],
	["atm_C130_HEC",1333333],
	["atm_C130_JC",1600000],
	["GR_UH1N_1",566666],
	["DAR_4X4",66666],
	["DAR_MK27",133333],
	["DAR_MK23",166666],
	["DAR_MK27T",200000],
	["DAR_LHS_16",400000]
];
__CONST__(life_price_insurance,life_price_insurance);

//Komodo: véhicules dont le nombre est limité par rapport à la quantité de joueurs dans un groupe (gang)
invo_limited_vehicles = [
	"O_MRAP_02_F"
];

invo_limited_vehicles_armed = [
	"B_G_Offroad_01_armed_F",
	"O_MRAP_02_F"
];

//Komodo: ajouté pour lister les véhicules supprimés
invo_deprecated_vehicles = [
	"C_Hatchback_01_sport_F"
];


//Added by S.Lambert alias Krisscut
/* list of equipement that hide the identity of the player */

life_maskingHeadgear = [
        "H_PilotHelmetFighter_B",
        "H_PilotHelmetFighter_O",
        "H_PilotHelmetFighter_I",
        "H_PilotHelmetHeli_B",
        "H_PilotHelmetHeli_O",
        "H_PilotHelmetHeli_I",
        "H_CrewHelmetHeli_B",
        "H_CrewHelmetHeli_O",
        "H_CrewHelmetHeli_I",
        "H_RacingHelmet_1_black_F",
        "H_RacingHelmet_1_blue_F",
        "H_RacingHelmet_2_F",
        "H_RacingHelmet_1_F",
        "H_RacingHelmet_1_green_F",
        "H_RacingHelmet_1_orange_F",
        "H_RacingHelmet_1_red_F",
        "H_RacingHelmet_3_F",
        "H_RacingHelmet_4_F",
        "H_RacingHelmet_1_white_F",
        "H_RacingHelmet_1_yellow_F",
        "H_Shemag_khk",
        "H_Shemag_tan",
        "H_Shemag_olive",
        "H_Shemag_olive_hs",
        "H_ShemagOpen_khk",
        "kio_vfv_mask",
        "H_ShemagOpen_tan",
        "gign_helm",
        "gign_helm4",
        "gign_Balaclava",
        "H_HelmetSpecB_blk"
];
life_maskingGoggles = [
        "G_Balaclava_blk",
        "G_Balaclava_combat",
        "G_Balaclava_lowprofile",
        "G_Balaclava_oli",
        "G_Bandanna_aviator",
        "G_Bandanna_beast",
        "G_Bandanna_blk",
        "G_Bandanna_khk",
        "G_Bandanna_oli",
        "G_Bandanna_shades",
        "G_Bandanna_sport",
        "G_Bandanna_tan",
        "Mask_M50",
        "Shemagh_Face",
        "Shemagh_FaceTan",
        "Shemagh_FaceRed",
        "Shemagh_FaceGry",
        "Shemagh_FaceOD",
        "Mask_M40",
        "T_HoodOD",
        "T_HoodTan",
        "G_mas_wpn_wrap_b",
        "G_mas_wpn_wrap_gog_b",
        "G_mas_wpn_wrap_f",
        "G_mas_wpn_wrap_gog",
        "G_mas_wpn_wrap",
        "G_mas_wpn_wrap_mask",
        "G_mas_wpn_wrap_gog_c",
        "G_mas_wpn_wrap_mask_c",
        "G_mas_wpn_wrap_c",
        "G_mas_wpn_shemag_r"
];

life_maskingUniforms = [
        "U_I_GhillieSuit",
        "U_O_GhillieSuit",
        "U_B_GhillieSuit"
];



    //list of illegal items ( confiscation ... )
    life_illegalUniform = [
			"U_OG_Guerilla1_1",
			"U_BG_leader",
			"U_BG_Guerilla2_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_I_CombatUniform_shortsleeve",
			"U_B_CombatUniform_mcam_worn",
			"U_I_OfficerUniform",
			"U_I_CombatUniform",
			"U_O_CombatUniform_ocamo",
			"U_PMC_CombatUniformLS_IndPBSBB",
			"U_PMC_IndUniformRS_GSTPTB",
			"U_PMC_IndUniformRS_TSGPTB",
			"U_PMC_IndUniformRS_BSTPTB",
			"U_PMC_CombatUniformLS_SSGPSB",
			"U_PMC_CombatUniformLS_GSSPBB",
			"U_PMC_IndUniformRS_GSGPBB",
			"U_O_FullGhillie_ard",
            "U_IG_Guerilla1_1",
            "U_I_G_Story_Protagonist_F",
            "U_I_G_resistanceLeader_F",
            "U_O_CombatUniform_oucamo",
            "U_O_SpecopsUniform_blk",
            "U_O_OfficerUniform_ocamo",
            "U_O_PilotCoveralls",
            "U_IG_leader",
            "U_O_GhillieSuit",
            "U_I_GhillieSuit",
            "U_B_SpecopsUniform_sgg",
            "U_B_CombatUniform_mcam",
            "U_B_CombatUniform_mcam_vest",
            "U_I_G_Story_Protagonist_F",
            "ARC_FR_Daguet_Uniform_vest",
            "ARC_FR_Daguet_Uniform_Light",
            "ARC_GER_Flecktarn_Uniform_Light",
            "ARC_GER_Tropentarn_Uniform_Light",
            "ARC_PL_Pantera_Uniform_Light",
            "ARC_UK_DPM_Uniform_Light",
            "U_I_CombatUniform_tshirt",

			"U_B_Wetsuit",
			"U_OG_Guerilla1_1",
			"U_BG_leader",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_1",
			"U_I_C_Soldier_Para_1_F",
			"U_BG_Guerilla2_3",
			"U_I_C_Soldier_Para_3_F",
			"U_I_C_Soldier_Para_2_F",
			"U_I_C_Soldier_Para_4_F",
			"U_I_CombatUniform_shortsleeve",
			"U_I_OfficerUniform",
			"U_B_CombatUniform_mcam_worn",
			"U_O_PilotCoveralls",
			"U_I_CombatUniform",
			"U_O_OfficerUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_B_CTRG_Soldier_2_F",
			"U_O_CombatUniform_ocamo",
			"U_B_CTRG_Soldier_3_F",
			"U_O_T_Soldier_F",
			"U_O_T_Officer_F",
			"U_I_C_Soldier_Camo_F",
			"U_B_CTRG_Soldier_urb_2_F",
			"U_B_CTRG_Soldier_urb_1_F",
			"U_B_CTRG_Soldier_urb_3_F",
			"U_O_T_Sniper_F",
			"U_B_T_FullGhillie_tna_F",
			"U_O_T_FullGhillie_tna_F",
			"U_O_FullGhillie_ard",

            //Ajout tenues gendarmes illégales 07/09/14 Johnny
            "U_gendarme",
            "gign_uniform",
            "U_O_Wetsuit"

    ];

    life_illegalVest = [
            "V_TacVest_khk",
            "V_BandollierB_cbr",
            "V_HarnessO_brn",
            "V_Chestrig_oli",
            "V_I_G_resistanceLeader_F",
            "ARC_FR_Daguet_PlateCarrier_1",
            "ARC_GER_Flecktarn_Plate_Carrier",
            "ARC_GER_Flecktarn_rangemaster_belt",
            "ARC_GER_Tropentarn_PlateCarrier_1",
            "ARC_PL_Pantera_Plate_Carrier",
            "ARC_PL_Pantera_rangemaster_belt",
            "ARC_UK_DPM_PlateCarrier_1",
            "ARC_UK_DPM_Plate_Carrier_H",

            //Ajout gilets gendarmes illégaux 07/09/14 Johnny
            "V_Rangemaster_belt",
            "V_Press_F",
            "V_Chestrig_blk",
            "V_PlateCarrier1_rgr",
            "V_PlateCarrier2_rgr",
            "V_TacVest_oli",
            "V_TacVestIR_blk",
            "V_TacVest_blk",
            "V_PlateCarrier1_blk",
            "V_BandollierB_oli",
            "V_PlateCarrierGL_rgr",
            "ARC_FR_CE_BandollierB_rgr",
            "ARC_FR_CE_Plate_Carrier_H",
            "V_TacVest_camo",
            "V_PlateCarrierIAGL_dgtl",
            "gign_BlackVest",

			"V_RebreatherB",

			"V_BandollierB_oli",
			"V_Rangemaster_belt",
			"V_BandollierB_blk",
			"V_BandollierB_ghex_F",

			"V_HarnessO_ghex_F",
			"V_HarnessOGL_ghex_F",

			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_gry",
			"V_HarnessO_brn",
			"V_Chestrig_blk",

			"V_PlateCarrier1_rgr",
			"V_PlateCarrier_Kerry",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrier2_rgr_noflag_F",
			"V_PlateCarrier1_blk",
			"V_TacVest_blk",
			"V_TacVestIR_blk",
			"V_PlateCarrier1_rgr_noflag_F"
    ];

    life_illegalGoggles = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Sport_Blackred",
            "G_Sport_Checkered",
            "G_Sport_Blackyellow",
            "G_Sport_BlackWhite",
            "G_Squares",
            "G_Lowprofile",
            "G_Combat",
            "Mask_M50",
            "L_shemagh_white",
            "L_Shemagh_OD",
            "L_Shemagh_Tan",
            "L_Shemagh_Red",
            "L_Shemagh_Gry",
            "Shemagh_Face",
            "Shemagh_FaceTan",
            "Shemagh_FaceRed",
            "Shemagh_FaceGry",
            "Shemagh_FaceOD",
            "Mask_M40",
            "G_Balaclava_oli",
            "G_Balaclava_blk",
        	"G_Balaclava_combat",
        	"G_Balaclava_lowprofile"
    ];
    life_illegalHeadgears = [
            "H_Booniehat_grn",
            "H_Booniehat_tan",
            "H_Booniehat_dirty",
            "H_Bandanna_khk",
            "H_Bandanna_cbr",
            "H_Bandanna_sgg",
            "H_Bandanna_gry",
            "H_Watchcap_blk",
            "H_Watchcap_khk",
            "H_Watchcap_sgg",
            "H_Watchcap_camo",
            "H_ShemagOpen_tan",
            "H_Shemag_olive",
            "H_ShemagOpen_khk",
            "H_Shemag_tan",
            "H_Shemag_olive_hs",
            "H_HelmetO_ocamo",
            "H_MilCap_oucamo",
            "H_HelmetCrew_I",
            "H_Bandanna_camo",
            "H_Booniehat_dgtl",
            "H_Cap_brn_SPECOPS",
            "H_Cap_tan_specops_US",
            "H_Cap_khaki_specops_UK",
            "H_Cap_blk_Raven",
            "H_Bandanna_mcamo",
            "kio_vfv_mask",
            "ARC_FR_CE_Helmet",
            "ARC_FR_Daguet_Helmet",
            "ARC_FR_CE_Helmet_Light",
            "ARC_FR_Daguet_Helmet_Light",
            "ARC_FR_CE_Helmet_simple",
            "ARC_FR_CE_Mich",
            "ARC_FR_Daguet_Mich",
            "ARC_FR_Daguet_Helmet_simple",
            "ARC_GER_Flecktarn_Helmet",
            "ARC_GER_Tropentarn_Helmet",
            "ARC_GER_Tropentarn_Helmet_Light",
            "ARC_GER_Tropentarn_Helmet_simple",
            "ARC_PL_Pantera_Helmet_simple",
            "ARC_UK_DPM_Helmet_simple",
            "ARC_UK_DPM_Helmet_Light",
            "ARC_UK_DPM_Helmet",
            "ARC_PL_Pantera_Helmet",
            //Ajout hats gendarmes illégaux 07/09/14 Johnny
            "H_Watchcap_blk",
            "H_MilCap_blue",
            "H_CrewHelmetHeli_B",
            "H_Booniehat_grn",
            "H_HelmetB_plain_mcamo",
            "H_HelmetIA",
            "H_Cap_tan_specops_US",
            "H_HelmetB_plain_blk",
            "H_HelmetB_black",
            "H_HelmetSpecB_blk",
            "H_PilotHelmetHeli_B",
            "H_MilCap_mcamo",
            "H_Cap_brn_SPECOPS",
            "H_Cap_khaki_specops_UK",
            "H_HelmetB_camo",
            "H_HelmetB_light_black",
            "H_Cap_headphones",
            "H_Beret_blk",
            "H_MilCap_gry",
            "H_Cap_police",
            "H_Beret_02",
            "Beret_Blue",
            "Beret_Green",
            "Beret_Red",
            "rds_police_cap",
            "H_MilCap_dgtl",
            "gign_helm",
            "ARC_FR_CE_Helmet_simple",
            "ARC_FR_CE_Helmet",

			"H_Shemag_tan",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_ShemagOpen_khk",
			"H_BandMask_reaper",
			"H_HelmetB_snakeskin",
			"H_HelmetB_grass",
			"H_HelmetB_sand",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetSpecB_blk",
			"H_HelmetB_camo",
			"H_MilCap_ocamo",
			"H_HelmetSpecB",
			"H_ShemagOpen_tan",
			"H_MilCap_dgtl",
			"H_HelmetB_plain_blk",
			"H_Cap_blk",
			"H_MilCap_gry",
			"H_Helmet_Skate",
			"H_HelmetB_TI_tna_F",
			"H_HelmetB_Light_tna_F",
			"H_HelmetSpecO_ghex_F",
			"H_HelmetLeaderO_ghex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetCrew_O_ghex_F",
			"H_MilCap_ghex_F",

			"H_Shemag_tan",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_ShemagOpen_khk",
			"H_BandMask_reaper",
			"H_HelmetB_snakeskin",
			"H_HelmetB_grass",
			"H_HelmetB_sand",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetSpecB_blk",
			"H_HelmetB_camo",
			"H_MilCap_ocamo",
			"H_HelmetSpecB",
			"H_ShemagOpen_tan",
			"H_MilCap_dgtl",
			"H_HelmetB_plain_blk",
			"H_Cap_blk",
			"H_MilCap_gry",
			"H_Helmet_Skate",
			"H_HelmetB_TI_tna_F",
			"H_HelmetB_Light_tna_F",
			"H_HelmetSpecO_ghex_F",
			"H_HelmetLeaderO_ghex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetCrew_O_ghex_F",
			"H_MilCap_ghex_F"

    ];
life_rebelweapons = [
		"srifle_mas_m24_v",
		"srifle_mas_svd",
		"LMG_mas_rpk_F",
		"LMG_mas_M240_F",
		"arifle_mas_aks74u",
		"arifle_mas_aks74u_c",
		"arifle_mas_aks74",
		"arifle_mas_mk16",
		"arifle_mas_akms",
		"arifle_mas_akms_c",
		"arifle_mas_akm",
		"srifle_DMR_01_F",
		"LMG_Zafir_F",
		"arifle_Katiba_F",
		"arifle_Katiba_GL_F",
		"arifle_Mk20_F",
		"arifle_Mk20_GL_F",
		"arifle_TRG20_F",
		"arifle_TRG21_GL_F",
		"srifle_EBR_F",
		"hgun_mas_mak_F_sd",
		"hgun_Pistol_heavy_01_F",
		"hgun_Pistol_heavy_01_snds_F",
		"hgun_Pistol_heavy_01_MRD_F",
		"hgun_mas_glocksf_F",
		"hgun_Pistol_heavy_02_F",
		"hgun_mas_sa61_F",
		"srifle_DMR_01_F",
		"srifle_GM6_F",
		"srifle_GM6_camo_F"
];