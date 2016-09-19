/*
	File: admin_advanced_menu.hpp
	Author: Komodo

	Description:

*/
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
			onButtonClick = "[] call life_fnc_closeMenu; closeDialog 0; createDialog 'life_admin_tools_TPmenu';";
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