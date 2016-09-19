class life_admin_tools_main {
	idd = 4000;
	name= "life_admin_tools_main";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			moving = 1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.546;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4001;
			text = "Admin Menu - Accueil";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class Teleport : Life_RscButtonMenu
		{
			idc = 4002;
			text = "Moderation";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_TPmenu';";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class Remboursement : Teleport
		{
			idc = 4003;
			text = "Remboursement";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_remboursements';";
			y = 0.12;
		};

		class GodMods : Teleport
		{
			idc = 4004;
			text = "God mods";
			onButtonClick = "closeDialog 0;  createDialog 'life_admin_tools_godMenu';";
			y = 0.18;
		};

		class LifeMenu : Teleport
		{
			idc = 4005;
			text = "Altis Menu";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_altisMenu';";
			y = 0.24;
		};

		class Vehicules : Teleport
		{
			idc = 4006;
			text = "Spawn Véhicules";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.30;
		};

		class Armes : Teleport
		{
			idc = 4007;
			text = "Spawn Armes";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.36;
		};

		class Equipements : Teleport
		{
			idc = 4008;
			text = "Spawn Equipements";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.42;
		};

		class Events : Teleport
		{
			idc = 4009;
			text = "Events";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_eventsMenu'";
			y = 0.48;
		};

		class Construction : Teleport
		{
			idc = 4010;
			text = "Construction";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.54;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = 0.0;
			y = 0.60;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


//###############################################
class life_admin_tools_TPmenu {
	idd = 4100;
	name= "life_admin_tools_TPmenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			moving = 1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.38;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4101;
			text = "Admin Menu - Moderation Menu";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class TPmap : Life_RscButtonMenu
		{
			idc = 4102;
			text = "Téléportation Map";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; player execVM 'admintools\tools\teleport.sqf';";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class InterfaceSurveillance : TPmap
		{
			idc = 4103;
			text = "Moderation Joueur";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_loading;";
			y = 0.12;
		};

		class GoIntoVehicule : TPmap
		{
			idc = 4106;
			text = "Monter véhicule";
			onButtonClick = "player moveInAny cursorTarget;";
			y = 0.18;
		};

		class ESPon : TPmap
		{
			idc = 4107;
			text = "ESP On";
			onButtonClick = "player execVM 'admintools\tools\ESP.sqf';";
			y = 0.24;
		};

		class ESPoff : TPmap
		{
			idc = 4108;
			text = "ESP Off";
			onButtonClick = "player execVM 'admintools\tools\ESPoff.sqf';";
			y = 0.30;
		};

		class Commercial : TPmap
		{
			idc = 4109;
			text = "Petites annonces";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_annoncesModo;";
			y = 0.36;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_main';";
			x = 0.0;
			y = 0.42;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


//###############################################
class life_admin_tools_remboursements {
	idd = 4200;
	name= "life_admin_tools_remboursements";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.38;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4201;
			text = "Admin Menu - remboursements";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class resetLiquide : Life_RscButtonMenu
		{
			idc = 4202;
			text = "Reset Liquide";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\tools\moneyReset.sqf';";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class give200k : resetLiquide
		{
			idc = 4203;
			text = "Donner 200k";
			onButtonClick = "player execVM 'admintools\tools\money200.sqf';";
			y = 0.12;
		};

		class give400k : resetLiquide
		{
			idc = 4204;
			text = "Donner 400k";
			onButtonClick = "player execVM 'admintools\tools\money400.sqf';";
			y = 0.18;
		};

		class give800k : resetLiquide
		{
			idc = 4205;
			text = "Donner 800k";
			onButtonClick = "player execVM 'admintools\tools\money800.sqf';";
			y = 0.24;
		};

		class atmOn : resetLiquide
		{
			idc = 4206;
			text = "ATM ON";
			onButtonClick = "player execVM 'admintools\life\ATMadminON.sqf';";
			y = 0.30;
		};

		class atmOff : resetLiquide
		{
			idc = 4207;
			text = "ATM OFF";
			onButtonClick = "player execVM 'admintools\life\ATMadminOFF.sqf';";
			y = 0.36;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_main';";
			x = 0.0;
			y = 0.42;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_altisMenu {
	idd = 4200;
	name= "life_admin_tools_AltisMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.44;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4201;
			text = "Admin Menu - Altis Menu";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class TrollMenu : Life_RscButtonMenu
		{
			idc = 4202;
			text = "Troll Menu";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_trollMenu';";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class MettreEnFourriere : TrollMenu
		{
			idc = 4203;
			text = "Mettre en fourriere";
			onButtonClick = "player execVM 'admintools\life\impoundAction.sqf';";
			y = 0.12;
		};

		class PlacerVendeurPerso : TrollMenu
		{
			idc = 4204;
			text = "Placer Vendeur Perso";
			onButtonClick = "player execVM 'admintools\life\spawnMarket.sqf';";
			y = 0.18;
		};

		class ResetMarche : TrollMenu
		{
			idc = 4205;
			text = "Reset marche";
			onButtonClick = "player execVM 'admintools\life\resetmarche.sqf';";
			y = 0.24;
		};

		class Revive : TrollMenu
		{
			idc = 4206;
			text = "Réanimer Cible";
			onButtonClick = "player execVM 'admintools\life\Revive.sqf';";
			y = 0.30;
		};

		class LockUnlock : TrollMenu
		{
			idc = 4207;
			text = "Lock/Unlock";
			onButtonClick = "player execVM 'admintools\life\Unlock.sqf';";
			y = 0.36;
		};

		class objetsInventaire : TrollMenu
		{
			idc = 4207;
			text = "Life Objets Menu";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.42;
		};


		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_main';";
			x = 0.0;
			y = 0.48;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_godMenu {
	idd = 4300;
	name= "life_admin_tools_godMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.726;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4301;
			text = "Admin Menu - God modes";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class GodModOn : Life_RscButtonMenu
		{
			idc = 4302;
			text = "God mod ON";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\tools\AdminON.sqf';";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class GodModOff : GodModOn
		{
			idc = 4303;
			text = "God Mod OFF";
			onButtonClick = "player execVM 'admintools\tools\AdminOFF.sqf';";
			y = 0.12;
		};

		class CarGodModOn : GodModOn
		{
			idc = 4304;
			text = "Car God mod ON";
			onButtonClick = "player execVM 'admintools\tools\cargodON.sqf';";
			y = 0.18;
		};

		class CarGodModOff : GodModOn
		{
			idc = 4305;
			text = "Car god mod OFF";
			onButtonClick = "player execVM 'admintools\tools\cargodOFF.sqf';";
			y = 0.24;
		};

		class InvisibleOn : GodModOn
		{
			idc = 4306;
			text = "Invisible ON";
			onButtonClick = "player execVM 'admintools\tools\Invisible.sqf';";
			y = 0.30;
		};

		class InvisibleOff : GodModOn
		{
			idc = 4307;
			text = "Invisible OFF";
			onButtonClick = "player execVM 'admintools\tools\InvisibleOFF.sqf';";
			y = 0.36;
		};

		class PousseMousse : GodModOn
		{
			idc = 4308;
			text = "Pousse mousse";
			onButtonClick = "player execVM 'admintools\tools\pushIT.sqf';";
			y = 0.42;
		};

		class SupprimerCible : GodModOn
		{
			idc = 4309;
			text = "Supprimer Cible";
			onButtonClick = "player execVM 'admintools\tools\DeleteIT.sqf';";
			y = 0.48;
		};

		class DestroyTarget : GodModOn
		{
			idc = 4310;
			text = "Detruire Cible";
			onButtonClick = "player execVM 'admintools\tools\DestroyIT.sqf';";
			y = 0.54;
		};

		class HealTarget : GodModOn
		{
			idc = 4311;
			text = "Reparer Cible";
			onButtonClick = "player execVM 'admintools\tools\RepairIT.sqf';";
			y = 0.60;
		};

		class ReviveSelf : GodModOn
		{
			idc = 4312;
			text = "Se réanimer";
			onButtonClick = "player execVM 'admintools\tools\Rez.sqf';";
			y = 0.66;
		};

		class Superman : GodModOn
		{
			idc = 4313;
			text = "Superman";
			onButtonClick = "player execVM 'admintools\tools\Superman.sqf';";
			y = 0.72;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_main';";
			x = 0.0;
			y = 0.78;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};




//###############################################
class life_admin_tools_trollMenu {
	idd = 4400;
	name= "life_admin_tools_trollMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.38;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4401;
			text = "Admin Menu - Troll Menu";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class TPTrollAttach : Life_RscButtonMenu
		{
			idc = 4402;
			text = "Attacher troll";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\troll\AntiTrollon.sqf;";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class DetachTarget : TPTrollAttach
		{
			idc = 4403;
			text = "Détacher Troll";
			onButtonClick = "player execVM 'admintools\troll\AntiTrolloff.sqf';";
			y = 0.12;
		};

		class RestrainTarget : TPTrollAttach
		{
			idc = 4404;
			text = "Arreter Cible";
			onButtonClick = "player execVM 'admintools\troll\Menotter.sqf';";
			y = 0.18;
		};

		class UnrestrainTarget : TPTrollAttach
		{
			idc = 4405;
			text = "Demenotter Cible";
			onButtonClick = "player execVM 'admintools\troll\Demenotter.sqf';";
			y = 0.24;
		};

		class SendToJail : TPTrollAttach
		{
			idc = 4406;
			text = "Envoyer en prison";
			onButtonClick = "player execVM 'admintools\troll\prison.sqf';";
			y = 0.30;
		};

		class UnrestrainSelf : TPTrollAttach
		{
			idc = 4407;
			text = "Se Démenotter";
			onButtonClick = "player execVM 'admintools\tools\SeDemenotter.sqf';";
			y = 0.36;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_altisMenu';";
			x = 0.0;
			y = 0.42;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_eventsMenu {
	idd = 5200;
	name= "life_admin_tools_eventsMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.25;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 5201;
			text = "Admin Menu - Events Menu";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class Haillon : Life_RscButtonMenu
		{
			idc = 5202;
			text = "Placer Haillons";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\event\hatchback.sqf';";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class Chiens : Haillon
		{
			idc = 5203;
			text = "Animaux";
			onButtonClick = "hint 'Not implemented Yet';";
			y = 0.12;
		};

		class MenuCode : Haillon
		{
			idc =5024;
			text = "Menu Code";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_codesMenu';";
			y = 0.18;
		};

		class MouvementsMenu : Haillon
		{
			idc = 5207;
			text = "Mouvements";
			onButtonClick = "hint 'Not implemented yet';";
			y = 0.24;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;  createDialog 'life_admin_tools_main';";
			x = 0.0;
			y = 0.30;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_codesMenu {
	idd = 5300;
	name= "life_admin_tools_codesMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.32;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 5301;
			text = "Admin Menu - Codes Menu";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class CodeRed : Life_RscButtonMenu
		{
			idc = 5302;
			text = "Attaque kavala";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1] spawn life_fnc_launchCode;";
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class BlueCode : CodeRed
		{
			idc = 5303;
			text = "Intervention";
			onButtonClick = "[2] spawn life_fnc_launchCode;";
			y = 0.12;
		};

		class BlackCode : CodeRed
		{
			idc = 5304;
			text = "Code Noir";
			onButtonClick = "[3] spawn life_fnc_launchCode;";
			y = 0.18;
		};

		class YellowCode : CodeRed
		{
			idc = 5305;
			text = "Army Code";
			onButtonClick = "[4] spawn life_fnc_launchCode;";
			y = 0.24;
		};

		class DesactiverAlerte : CodeRed
		{
			idc = 5306;
			text = "Stopper Code";
			onButtonClick = "[] spawn life_fnc_desactivateMsg;";
			y = 0.30;
		};
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;  createDialog 'life_admin_tools_eventsMenu';";
			x = 0.0;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_vehiculeMenu {
	idd = 4500;
	name= "life_admin_tools_vehiculeMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0;
			y = 0.0;
			w = 0.3;
			h = (1 / 25);
			moving = 1;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 0.3;
			h = 0.31;
			moving = 1;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4501;
			text = "Admin Menu - Spawn Véhicule";
			x = 0.0;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class VehicleType : Life_RscText
		{
			idc = -1;
			text = "Type du vehicule";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.0375;
			y = 0.06;
			w = (9 / 40);
			h = (1 / 25);
		};

		class VehicleTypeCombo : Life_RscCombo
		{
			idc = 4502;

			x = 0.0375;
			y = 0.12;
			w = (9 / 40); h = (1 / 25);
		};

		class VehicleName : Life_RscText
		{
			idc = -1;
			text = "Choix Véhicule";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.0375;
			y = 0.18;
			w = (9 / 40);
			h = (1 / 25);
		};

		class VehiclenameCombo : Life_RscCombo
		{
			idc = 4503;

			x = 0.0375;
			y = 0.24;
			w = (9 / 40); h = (1 / 25);
		};

		class SpawnButton : Life_RscButtonMenu
		{
			idc = 4504;
			text = "Spawner !";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.0375;
			y = 0.30;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_main';";
			x = 0.0;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


//###############################################
//##############MEGAMENU################
//###############################################
class life_admin_tools_advancedMenu {
	idd = 9000;
	name= "life_admin_tools_advancedMenu";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_loading;";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = -0.3;
			y = 0.0;
			w = 1.67;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = 0.0 + (11 / 250);
			w = 1.67;
			h = 0.9;
			moving = 1;
		};

		class MapView : Life_RscMapControl
		{
			idc = 9001;
			x = 0.54; y = 0.53;
			w = 0.4;
			h = 0.4;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 9002;
			text = "Menu de Modération Avancé V1.3";
			x = -0.3;
			y = 0.0;
			w = 1.3;
			h = (1 / 25);
		};

		class TitleInfo : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 9030;
			text = "Interface Information";
			x = 0.41;
			y = 0.0;
			w = 0.8;
			h = (1 / 25);
		};

		class ListeJoueurs : Life_RscText
		{
			idc = 9003;
			text = "Liste des Joueurs";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = -0.27;
			y = 0.06;
			w = 0.35;
			h = (1 / 25);
		};

		class PlayerList_Admin : Life_RscListBox
		{
			idc = 9004;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_queryPlayerInfo";

			x = -0.29; y = 0.12;
			w = 0.39; h = 0.7;
		};

		class InfoJoueur : Life_RscText
		{
			idc = 9005;
			text = "Info Joueur Selectionné";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.15;
			y = 0.06;
			w = 0.35;
			h = (1 / 25);
		};

		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 9006;
			text = "";
			x = 0.12;
			y = 0.12;
			w = 0.41;
			h = 0.35;
		};


		class TitreAutrepseudos : Life_RscText
		{
			idc = 9007;
			text = "Autres pseudos";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.15;
			y = 0.51;
			w = 0.35;
			h = (1 / 25);
		};

		class Aliases : PlayerBInfo
		{
			idc = 9170;
			text = "Waiting for player selection";
			x = 0.12;
			y = 0.57;
			h = 0.12;
		};

		class Autresinfos : Life_RscText
		{
			idc = 9161;
			text = "Autres Informations & outils";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.15;
			y = 0.74;
			w = 0.35;
			h = (1 / 25);
		};

		class ID : PlayerBInfo
		{
			idc = 9162;
			text = "link tools ID";
			x = 0.12;
			y = 0.80;
			h = 0.1;
			w = 0.15;
		};

		class Kicker : Life_RscButtonMenu
		{
			idc = 9163;
			text = "Kicker";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "hint 'Not implemented YET'";
			x = 0.32;
			y = 0.82;
			w = 0.17;
			h = ( 1 / 25 );

			class Attributes
			{
				align = "center";
			};
		};

		//For futur use
		//http://killzonekid.com/arma-extension-real_date-dll/

		class CreerTicket : Life_RscButtonMenu
		{
			idc = 9164;
			text = "Creer Ticket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_createTicket;";
			x = 0.32;
			y = 0.87;
			w = 0.17;
			h = ( 1 / 25 );

			class Attributes
			{
				align = "center";
			};
		};

		class TitreModeration : Life_RscText
		{
			idc = 9009;
			text = "Actions modérations";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.57; y = 0.06;
			w = 0.35;
			h = (1 / 25);
		};

		class Spectateur : Life_RscButtonMenu
		{
			idc = 9010;
			text = "Observer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_spectator; closeDialog 0;";
			x = 0.57; y = 0.12;
			w = 0.17;
			h = 0.04;
			class Attributes
			{
				align = "center";
			};
		};

		class TptoTarget : Spectateur
		{
			idc = 9011;
			text = "TP vers lui";

			onButtonClick = "[] spawn life_fnc_tpToTarget;";
			y = 0.18;
		};

		class TargetToMe : Spectateur
		{
			idc = 9012;
			text = "TP à moi";

			onButtonClick = "[] spawn life_fnc_targetToMe;";
			y = 0.24;
		};

		class Deplacer : Spectateur
		{
			idc = 9050;
			text = "Deplacer";

			onButtonClick = "[] spawn life_fnc_moveTarget;";
			y = 0.30;
		};

		class KillTarget : Spectateur
		{
			idc = 9013;
			text = "Tuer Cible";

			onButtonClick = "[] spawn life_fnc_killTarget;";
			y = 0.36;
		};

		class Reanimer : Spectateur
		{
			idc = 9051;
			text = "Reanimer";

			onButtonClick = "[] spawn life_fnc_reviveTarget;";
			y = 0.42;
		};

		class Soigner : Spectateur
		{
			idc = 9052;
			text = "Soigner";

			onButtonClick = "[] spawn life_fnc_healTarget;";
			y = 0.48;
		};


		class Menotter : Spectateur
		{
			idc = 9014;
			text = "Menotter";

			onButtonClick = "[] spawn life_fnc_restrainTarget;";
			x = 0.75;
			y = 0.12;
		};

		class Demenotter : Menotter
		{
			idc = 9053;
			text = "Demenotter";

			onButtonClick = "[] spawn life_fnc_unrestrainTarget;";
			y = 0.18;
		};

		class GetInTargetVehicle : Menotter
		{
			idc = 9015;
			text = "TP véhicule";

			onButtonClick = "[] spawn life_fnc_getInTargetVehicle";
			y = 0.24;
		};


		class EjectFromVehicle : Menotter
		{
			idc = 9054;
			text = "Eject véhicule";

			onButtonClick = "[] spawn life_fnc_ejectTargetFromVehicle;";
			y = 0.30;
		};


		class PutIntoJail : Menotter
		{
			idc = 9016;
			text = "Prison Troll";

			onButtonClick = "[] spawn life_fnc_putIntoJail";
			y = 0.36;
		};

		class ExtractFromJail : Menotter
		{
			idc = 9055;
			text = "Sortir Prison";

			onButtonClick = "[] spawn life_fnc_extractFromJail;";
			y = 0.42;
		};


		class Troll : Menotter
		{
			idc = 9017;
			text = "Poteau Troll";

			onButtonClick = "[] spawn life_fnc_troll";
			y = 0.48;
		};

		class TicketsSystem : Life_RscText
		{
			idc = 9164;
			text = "Tickets in-game";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.98; y = 0.06;
			w = 0.35;
			h = (1 / 25);
		};

		class TicketsLists : Life_RscListBox
		{
			idc = 9165;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_fillTicketInfo";

			x = 0.96; y = 0.12;
			w = 0.39; h = 0.37;
		};

		class TitreTickets : Life_RscText
		{
			idc = 9167;
			text = "Infos Ticket Selectionné";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.98;
			y = 0.51;
			w = 0.35;
			h = (1 / 25);
		};

		class DateTicket : Life_RscStructuredText
		{
			idc = 9168;
			text = "Date : DATE_TICKET";
			colorBackground[] = {0.28,0.28,0.28,0.28};
			x = 0.96;
			y = 0.57;
			w = 0.39;
			h = (1 / 25);
		};

		class ModoTicket : DateTicket
		{
			idc = 9171;
			text = "De : Nom_Modérateur";
			x = 0.96;
			y = 0.62;
			w = 0.23;
			h = (1 / 25);
		};

		class StatuTicket : DateTicket
		{
			idc = 9173;
			text = "Status : STATUS_SUJET";
			x = 1.20;
			y = 0.62;
			w = 0.15;
			h = (1 / 25);
		};

		class SujetTicket : DateTicket
		{
			idc = 9172;
			text = "Sujet : SUJET_TICKET";
			x = 0.96;
			y = 0.67;
			w = 0.39;
			h = (1 / 25);
		};

		class ContentTicket : DateTicket
		{
			idc = 9174;
			text = "Contenu du sujet : <br/><br/> Le contenu du ticket selectionné s'affichera ici";
			x = 0.96;
			y = 0.72;
			w = 0.39;
			h = 0.21;
		};

		class Refresh : Life_RscButtonMenu
		{
			idc = 9018;
			text = "Rafraichir";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_refresh";
			x = -0.25;
			y = 0.84;
			w = 0.28;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "[] spawn life_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_TPmenu';";
			x = -0.25;
			y = 0.89;
			w = 0.28;
			h = (1 / 25);

			class Attributes
			{
				align = "center";
			};
		};
	};
};



//###############################################
class life_admin_tools_spectatorMenu{
	idd = 4600;
	name= "life_admin_tools_spectatorMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = 0.7;
			y = 0.66;
			w = 0.3;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			moving = 1;
			x = 0.7;
			y = 0.66 + (11 / 250);
			w = 0.3;
			h = 0.38;
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4601;
			text = "Admin Menu - Spectator Menu";
			x = 0.7;
			y = 0.66;
			w = 0.8;
			h = (1 / 25);
		};

		class Menotter : Life_RscButtonMenu
		{
			idc = 4602;
			text = "Menotter";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_restrainTarget;";
			x = 0.7375;
			y = 0.72;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class Tuer : Menotter
		{
			idc = 4603;
			text = "Tuer";
			onButtonClick = "[] spawn life_fnc_killTarget; closeDialog 0; ";
			y = 0.78;
		};

		class TPToMe : Menotter
		{
			idc = 4604;
			text = "Tp to me";
			onButtonClick = "[] spawn life_fnc_targetToMe;";
			y = 0.84;
		};

		class TPToTarget : Menotter
		{
			idc = 4605;
			text = "TP to target";
			onButtonClick = "[] spawn life_fnc_tpToTarget;";
			y = 0.90;
		};

		class Prison : Menotter
		{
			idc = 4606;
			text = "Prison";
			onButtonClick = "[] spawn life_fnc_putIntoJail;";
			y = 0.96;
		};

		class EjecterVehicule : Menotter
		{
			idc = 4607;
			text = "Ejecter Véhicule";
			onButtonClick = "[] spawn life_fnc_ejectTargetFromVehicle;";
			y = 1.02;
		};
	};
};



class life_admin_tools_createTicket {

	idd = 11000;
	name= "life_admin_tools_createTicket";
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground {

		class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.78;
			h = (1 / 25);
		};

		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.78;
			h = 0.48 - (22 / 250);
			moving = true;
		};

		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 11001;
			text = "Outil de création de ticket";
			x = 0.1;
			y = 0.2;
			w = 0.78;
			h = (1 / 25);
			moving = true;
		};
	};

	class controls {

		class description : Life_RscStructuredText
		{
			idc = 11002;
			text = "";
			x = 0.12;
			y = 0.26;
			w = 0.7;
			h = 0.1;
		};

		class dateHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Date : ";
			sizeEx = 0.04;

			x = 0.11; y = 0.38;
			w = 0.219; h = 0.04;
		};

		class dateText : Life_RscEdit
		{
			idc = 11003;
			text = "";
			x = 0.35; y = 0.38;
			w = 0.519; h = 0.04;
			canModify = 0;
		};

		class modoHeader : dateHeader
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Auteur du ticket :";
			sizeEx = 0.04;

			y = 0.43;
		};

		class modoText : dateText
		{
			idc = 11004;
			text = "";
			y = 0.43;
			canModify = 1;
		};

		class sujetHeader : dateHeader
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Sujet Ticket :";
			sizeEx = 0.04;

			y = 0.48;
		};

		class sujetText : dateText
		{
			idc = 11005;
			text = "";
			y = 0.48;
			canModify = 1;
		};

		class textHeader : dateHeader
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Contenu Ticket :";
			sizeEx = 0.04;

			y = 0.53;
		};

		class demandeText : dateText
		{
			idc = 11006;
			text = "";
			y = 0.53;
			canModify = 1;
		};

		class statusHeader : dateHeader
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Status Ticket :";
			sizeEx = 0.04;

			y = 0.58;
		};

		class statusText : dateText
		{
			idc = 11008;
			text = "";
			y = 0.58;
			canModify = 1;
		};

		class EnvoyerTicket : Life_RscButtonMenu {
			idc = 11007;
			text = "Envoyer";
			onButtonClick = "";
			x = 0.72;
			y = 0.68 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_advancedMenu';";
			x = 0.1;
			y = 0.68 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

#define BGX 0.15
#define BGY 0.2
#define BGW 0.7

class Commercial_Modo
{
	idd = 76000;
	movingEnabled = true;
	enableSimulation = true;

	class controlsBackground
	{
		class RscTitleBackground:life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};

		class MainBackground : life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = BGX;
			y = BGY + (11 / 250);
			w = BGW;
			h = 0.6 - (22 / 250);
		};

		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 76001;
			text = "Moderation Petites annonces";
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};
	};

	class controls
	{
		class ButtonClose : life_RscButtonMenu
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = BGX;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonDelete: life_RscButtonMenu
		{
			idc = 76002;
			//shortcuts[] = {0x00050000 + 2};
			text = "Supprimer";
			onButtonClick = "[] spawn life_fnc_deleteAnnonce";
			x = BGX +(6.25 / 40)+0.01;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ListCommercial : Life_RscListBox
		{
			idc = 76003;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "";
			x = BGX + 0.02;
			y = BGY + 0.06;
			w = 0.65;
			h = 0.48;
		};

		class HideCommercial : Life_RscText
		{
			idc = 76004;
			text = "Recherche des annonces...";
			sizeEx = 0.06;
			colorBackground[] = {0,0,0,0.8};
			x = BGX;
			y = BGY + (11 / 250);
			w = BGW;
			h = 0.6 - (22 / 250);
		};
	};
};