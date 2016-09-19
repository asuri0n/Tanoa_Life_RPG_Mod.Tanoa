#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground {
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			text = "textures\tablette.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		/*class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};*/

		/*class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};*/

		/*class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_PM_Title";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};*/

		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.179;
			y = 0.3;
			w = 0.3; h = 0.6;
		};

		class PlayersName : Life_RscStructuredText {
			idc = carry_weight;
			style = 1;
			text = "";
			x = 0.10;
			y = 0.10;
			w = 0.3; h = 0.6;
		};

		/*class imgBackground : Life_RscPictureKeepAspect
		{

			idc = -1;
			text = "icons\background.paa";
			x = 0.55;
			y = 0.35;
			w = 0.4; h = 0.4;

			colorText[] = {1, 1, 1, 0.2};
		};*/
	};

	class controls {

		/*class itemHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;

			x = 0.62; y = 0.26;
			w = 0.275; h = 0.04;
		};*/

		/*class licenseHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_Licenses";
			sizeEx = 0.04;

			x = 0.336+(0.079/2); y = 0.26;
			w = 0.079*3; h = 0.04;
		};*/

		/*class moneySHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.04;

			x = 0.11; y = 0.26;
			w = 0.219; h = 0.04;
		};*/

		class itemList : life_RscListBox
		{
			idc = item_list;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {0, 0, 0, 1};
			color2[] = {0, 0, 0, 1};
			colorText[] = {0, 0, 0, 1};
			sizeEx = 0.030;

			x = 0.65; y = 0.29;
			w = 0.21; h = 0.265;
		};

		class moneyEdit : Life_RscEdit
		{
			idc = 2018;

			text = "1";
			sizeEx = 0.030;
			x = 0.13; y = 0.42;
			w = 0.223; h = 0.04;
		};

		class NearPlayers : Life_RscCombo
		{
			idc = 2022;

			x = 0.13; y = 0.475;
			w = 0.223; h = 0.04;
		};

		class moneyDrop : Life_RscButtonMenu
		{
			idc = 2001;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.25; y = 0.53;
			w = 0.097; h = 0.035;
		};

		class itemEdit : Life_RscEdit {

			idc = item_edit;

			text = "1";
			sizeEx = 0.030;
			x = 0.646; y = 0.58;
			w = 0.21; h = 0.035;

		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;

			x = 0.646; y = 0.63;
			w = 0.21; h = 0.035;
		};
		/*
		Disabled till it can be redone
		class moneyInput: life_RscCombo {

			idc = money_value;

			x  = 0.02; y = 0.402;
			w = .1; h = .030;
		};
		*/

		class DropButton : life_RscButtonMenu {

			idc = 2002;
			
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_giveItem;";

			x = 0.655+0.097+0.01;
			y = 0.678;
			w = 0.097; h = 0.032;
		};

		class UseButton : life_RscButtonMenu {

			
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_useItem;";

			x = 0.655;
			y = 0.678;
			w = 0.097; h = 0.032;
		};

		class RemoveButton : life_RscButtonMenu {

			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_removeItem;";

			x = 0.655-0.097-0.01;
			y = 0.678;
			w = 0.097; h = 0.032;
		};
		/*
		Disabled till it can be redone
		class DropcButton : life_RscButtonMenu {

			text = "Drop Money";
			onButtonClick = "[] execVM 'player_system\money_fnc.sqf'";

			x = 0.13; y = 0.4;
			w = 0.135; h = 0.05;

		};
		*/

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "closeDialog 0;";
			tooltip = "Fermer";
			x = 0.1;
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		class ButtonSettings : life_RscButtonMenu {
			idc = -1;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_settingsMenu;";
			tooltip = "Paramètres";
			x = 0.1 + (0.079);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] spawn life_fnc_openGang;";
			tooltip = "Mon gang";
			x = 0.1 + (0.079*2);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		

		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			w = 0.079*3;
			h = 0.38;
			x = 0.34+(0.079/2);
			y = 0.27;
			
			class Controls
			{
				class Life_Licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					color[] = {0, 0, 0, 1};
					color2[] = {0, 0, 0, 1};
					colorText[] = {0, 0, 0, 1};
					x = 0;
					y = 0;
					w = 0.27; h = 0.65;
				};
			};
		};

		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			text = "$STR_PM_WantedList";
			tooltip = "Interpol";
			onButtonClick = "[] call life_fnc_wantedMenu";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.7 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Life_RscButtonInvisible10 : Life_RscButtonMenu { //menu clés
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			idc = 2013;
			onButtonClick = "createDialog ""Life_key_management"";";
			tooltip = "Mes clés";
			x = 0.1 + (0.079*3);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		/*class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			text = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};*/

		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "createDialog ""Life_cell_phone"";";
			tooltip = "Téléphone";

			x = 0.1 + (0.079*4);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		class ButtonAide : Life_RscButtonMenu {
			idc = 2050;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_helpHint;";
			tooltip = "Aide raccourcies";

			x = 0.1 + (0.079*9);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		class ButtonWanted : Life_RscButtonMenu {
			idc = 2030;
			text = "wanted list";
			onButtonClick = "[] call life_fnc_wantedMenu";
			tooltip = "Interpol";

			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonAdminMenu : Life_RscButtonMenu {
			idc = 2021;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "createDialog ""life_admin_tools_advancedMenu"";";
			tooltip = "Admin menu";
			x = 0.1 + (0.079*7);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		}

		class ButtonCraft : Life_RscButtonMenu {
			idc = 2025;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "createDialog ""Life_craft"";";
			tooltip = "Fabrication objet";
			x = 0.1 + (0.079*6);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};

		class ButtonMarket : Life_RscButtonMenu {
			idc = 2050;
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] spawn life_fnc_openMarketView;";
			tooltip = "Marché dynamique";
			//x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			x = 0.1 + (0.079*8);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
			};
		class ButtonSyncData : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call SOCK_fnc_syncData;";
			tooltip = "Syncronisation joueur avec le serveur";
			x = 0.1 + (0.079*5);
			y = 0.785 - (1 / 25);
			w = 0.079;
			h = 0.1;
		};
		// class ButtonMoves : life_RscButtonMenu {
			// idc = -1;
			// text = "Animations";
			// onButtonClick = "closeDialog 0; createDialog ""life_moves_menu"";";
			// x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.805;
			// w = (6.25 / 40);
			// h = (1 / 25);
		// };
		class ProfButton : life_RscButtonMenu { 
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {1, 1, 1, 0};
			color2[] = {1, 1, 1, 0};
			colorText[] = {1, 1, 1, 0};
			colorDisabled[] = {1, 1, 1, 0};
			onButtonClick = "[] call life_fnc_profSetup;";	
			tooltip = "Expériences";		
			x = 0.115;
			y = 0.68;
			w = (5.75 / 40)+0.02;
			h = (1 / 25); 
		};
	};
};