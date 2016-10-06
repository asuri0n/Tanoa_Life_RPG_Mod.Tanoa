class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class updateRequestMoney {}; //Komodo: added to handle money only sync.
		class updateRequestCivGear {};
		class syncData {};
	};
};

class Life_Client_Core
{
	tag = "life";

	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initDepan {};
		class welcomeNotification {};
		class welcomeNotification_bluefor {};
		class welcomeNotification_independant {};
		class initZeus {};
		class uniform {};
		class initRebel {};
	};
	class Addons
	{
		file = "addons";
		class standup {};
		class sitdown {};
		class earthquake {};
		class nuke {};
	};
	class Market
	{
		file = "core\market";

		class openMarketView {};
		class refreshMarketView {};
		class marketShortView {};
		class marketBuy {};
		class marketSell {};
		class marketGetBuyPrice {};
		class marketGetSellPrice {};
		class marketconfiguration {};
		class marketReset {};
		class marketChange {};
		class marketGetRow {};
		class marketGetPriceRow {};
		class marketSetPriceRow {};
	};
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class RadioKick {};
	};

	class Depan_System
	{
		file = "core\depan";
		class depanLoadout {};
		class depanSirenLights {};
		class depanLights {};
		class depanSiren {};
		class depanInitActions {};
	};

	class Actions
	{
		file = "core\actions";
		class craftAction {};
		class buyLicense {};
		class chemlightUse {};
		class heal {};
		class healHospital {};
		class heal_target {}; //ajout serrat
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};

		class getDPMission {};
		class postBail {};
		class processAction {};

		class suicideBomb {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};

		class pumpRepair {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};

		class captureHideout {};
		class disputeArea {}; //Komodo: contestation de zone!

		class getLicensesAction {}; // ajout serrat
		class surrender {};//asurion
		// Interraction menu civil
		class CivrestrainAction {};
		class Civunrestrain {};
		class Civrestrain {};
		class CivstopEscorting {};
		class CivpulloutAction {};
		class CivescortAction {};
		class CivputInCar {};
		class defibrilateur {};
		class copEnter {};
		class gatherArcheologie {};
		class gatherOrgan {};
		class packupBarriere {};
		class packupBarriereStop {};
		class packupConewithlight {};
		//class insureVehicle {};//added by asurion
		//class drawInsurance {};//added 05/28/2014
		class gatherRye {};
		class gatherHops {};
		class gatherYeast {};
		class med {};
		class revivedirect {};
		class gather {};
		class spotShop {}; //added by ladislas
		class spotShopMarker{}; //added by ladislas

		class robATM {}; //Rob ATM
		class airTravel {}; // Asurion
		class sendVisa {}; // Asurion
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class getBuildingSpawnPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};

	class GangsterAction
	{
		file = "core\gangsters";
		class robShops {};
		class robbery {};
	};

	class Config
	{
		file = "core\config";

		class craftCfg {}; // Pytha

		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class copDefault {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};

		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_med {};
		class clothing_dep {};
		class clothing_gangster {};
		class clothing_bac {};
		class clothing_hunter {}; //Mais qu'il est con.
		class clothing_presse {}; //Mais qu'il est teubé
		class clothing_xxx {};
		class clothing_sscp {};
		class clothing_wt {};
		class clothing_donator {};

		class itemIsLiquid {}; //Komodo: returns true if item in argument is a liquid
		class carryLoadCfg {}; //Komodo: computes lifeMaxWeight

		class itemIcon {};
		class profType {}; //papabear pesistent system

	};

	class Player_Menu
	{
		file = "core\pmenu";

		class craft {};
		class craft_update {};

		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};

		//class msgCivils {};//added 07/11/2014
		class jailTime {};
		class delStuff {};//added 05/02/2014
		class delLicenses {};//added 05/02/2014
		class addCriminal {};//added 05/02/2014

		class movesMenu {};//added 25/06
	};

	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class fetchGear{};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pulloutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class playerSkins{};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};

		class playSound {};//added 05/11/2014
		class delLicense {};//added 05/11/2014
		//class sendCivilMsg {};//added 05/11/2014
		class msgDraw {};//added 05/11/2014
		class activateRed {};//added 05/11/2014
		class activateFrini {};//added 05/11/2014
		class msgDelete {};//added 05/11/2014
		class desactivateMsg {};//added 05/11/2014
		class onDeath {};//added test
		class onRespawn {};//added test
		class CivpullOutVeh {};// ajout serrat
		class RadarAuto {};// ajout GreeFine
		class randomRound {}; //ajout Serrat

        class displayCode {};	//added Kriss
        class unmask {};		//unmask target
        class dropRadioGPS {};	//Drop radioGPS
        class helpHint {};		//Hint button

        class cutOffLightsBorder {};

        class antiCheatCash {};	//Komodo: anti-cheat system, added 04/09/2014, to be used each time life_dabliquide or life_liquide is modified.
        class progressBar {}; //Komodo: generic progress bar [duration, text], cancelled if life_action_inUse false or life_interrupted true.
        class computePaycheck {}; //Komodo: remplace le contenu du client.fsm
		class antiAFK {}; //Ladislas: script Anti AFK
		class updateAreaBank {};
		class addWantedCond {}; //Ladislas: script addwanted conditionné
		class getPlayerName {}; //Komodo: obtenir "Masqué" ou le nom du joueur quand applicable.
		class IntroOnOff {}; //Komodo: Option pour choisir si on veut l'intro ou pas.
		class openAGMmenu {}; //Komodo: used to open AGM menu while throwing corresponding event.
		class listCivGroups {}; //Komodo: returns list of civilian groups
		class updateInvoAllies {}; //Komodo: updates invo_allies variable
		class clientInsertAllianceRequest {}; //Send request to server
		class clientAcceptAllianceRequest {};
		class clientDeleteAlliance {};
		class initAlliancesMenu {};
		class computeOwnCrimes {};
		class stripDownPlayer {};
		class handleFlashbang {};

		class NLR {};

		class profSetUp {}; //papabear pesistent system 27/08/2016
		class addExp {}; //papabear pesistent system 27/08/2016
		class getLevelXp {}; //asurion : Get level for a given amount of exp 26/08/2016
		class firstViewCombat {};

		class getPriceVeh {};
		class refuelPump {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class say3D {};
		class setTexture {};
	};

	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class civFetchGear {};
		class civLoadGear {};
		class civLoadLifeGear {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};

		class removeLicenses {};
		//class zoneCreator {}; obsolete
		class demoChargeTimer {};

		class houseSoundClose {};
		class houseSoundOpen {};
		class sendCommercialMsg {};
		class civInteractionMenu {};//added 05/04/2014
		class civilmarkers {};
		class defibrillateur_son {};
		class busDriver {};//added by Ladislas 04/10/2014
		class busDriverServiceStart {};
		class busDriverServiceStop {};
		class busDriverCall {};
		class jeuBlackJack {};//added by Ladislas 12/10/2014


		class GPS_Sound {};
        class civShowPassport  {};
        class civPassportShown  {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class vehProcessIllegal {}; //Zamak Labo - Process
		class vehDetect {}; //Zamak Labo - Detect
		class vehInsure {};//added bloopis
		class spawnAltisVehicle {}; //Komodo: function to spawn a Life ready vehicle for moderators.
		class vehInventoryClose {}; //Komodo: function called when "T" menu is closed.
		class vehCanHandleTrunk {}; //Komodo: function designed to test if somthing can be either added or removed from a "Trunk"
		class vehHandleTrunk {}; //Komodo: function that add/removes stuff from Trunk.
		class vehTransferItems {}; //Komodo: transfer items between player & trunk or trunk & trunk
		class vehIsTank {}; // Komodo: tells if a vehicule can contain liquids.
		class changeInVehicleGarage {}; //Komodo: tells client if given type of garage content has changed to optimize queries to server.
		class openGarage {};
		class spawnEventVehicle {};
	};

	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class loadGear {};
		class saveGear {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};

		class copBeep {};
		class waitSound {};

		class seizePlayerWeaponAction {};//added 05/02/2014
		class seizePlayerStuffAction {};//added 05/02/2014

		class breathalyzer {};
		class borderAlarm {};
		class displayBreachNotification {};

		/*class KavalaLoadout {}; //05/10/14 Johnny Loadout flic
		//class InterLoadout {}; //05/10/14 Johnny Loadout flic
		//class WaterLoadout {}; //05/10/14 Johnny Loadout flic*/
		class copOpener{};
		class copShowLicense {};
        class copLicenseShown {};
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};

		class licenses {};
	};

	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};

		class barriere {};
		class barrierestop {};
		class conewithlight {};

		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class weed {};

		class farmingToolUse {}; //Komodo: added to replace pickaxeUse and others!

		class gpsTracker {};


	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class gangWithdraw {};
	};
};

class Involved
{
	tag = "INVO";
	class INVO_wanted
	{
		file = "core\WantedSystem";
		class wantedAdd {};
		class wantedBounty {};
		class wantedFetch {};
		class wantedPardon {};
		class wantedPerson {};
		class wantedPunish {};
		class wantedRemove {};
		class wantedTicket {};
		class wantedCodeCfg {};
		class wantedComputeBounty {};
	};
	class INVO_Monitor
	{
		file = "monitor";
		class drawAlliesIcons {};
		class getAlliedUnits {};
	};
};

