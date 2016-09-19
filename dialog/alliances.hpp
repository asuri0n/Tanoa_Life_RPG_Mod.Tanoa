class Life_Group_Alliances_Menu {
	idd = 47000;
	name= "life_group_alliances_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.85;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.85;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 47001;
			text = "Interface de Gestion des Alliances";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class LegendeGang : Life_RscLine {
			idc = -1;
			style = 0;
			x = 0.11;
			y = 0.25;
			w = 0.350;
			h = 0.05;
			text = "Liste des groupes";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1.0};
		};

		class GangSelect : Life_RscListBox
		{
			idc = 47002;
			text = "";
			sizeEx = 0.035;

			x = 0.11;
			y = 0.31;
			w = 0.350;
			h = 0.420;
		};

		class AskAlliances : Life_RscButtonMenu {
			idc = 47003;
			text = "Demander une Alliance";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_clientInsertAllianceRequest;";
			x = 0.505;
			y = 0.36;
			w = 0.400;
			h = (1 / 25);

			class Attributes
			{
				align = "center";
			};
		};

		class AllianceDisband : Life_RscButtonMenu
		{
			idc = 47004;
			text = "Accepter l'Alliance";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_clientAcceptAllianceRequest;";
			x = 0.505;
			y = 0.41;
			w = 0.400;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class GroupDemote : AllianceDisband
		{
			idc = 47005;
			text = "Supprimer l'Alliance";
			onButtonClick = "[] spawn life_fnc_clientDeleteAlliance;";
			x = 0.505;
			y = .46;
		};

		class InviteMember : AllianceDisband
		{
			idc = 47006;
			text = "Autoriser";
			onButtonClick = "hint 'En cours de Dev'";
			x = 0.505;
			y = 0.51;
		};

		class KickerGangGestion : InviteMember
		{
			idc = 47007;
			text = "Kicker Joueur";
			onButtonClick = "hint 'En cours de Dev'";
			x = 0.505;
			y = .56;
		};

		class PromoteLeader : InviteMember
		{
			idc = 47008;
			text = "Mettre Leader";
			onButtonClick = "hint 'En cours de Dev'";
			x = 0.505;
			y = .61;
		};

		class ColorList : Life_RscCombo
		{
			idc = 47009;
			x = 0.47; y = 0.27;
			w = (9 / 40); h = 0.03;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_gangMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};