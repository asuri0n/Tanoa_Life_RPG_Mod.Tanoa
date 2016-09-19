class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";

	class controlsBackground {
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			text = "textures\telephone.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		/*
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.70;
			h = (1 / 25);
		};
		*/
		
		/*
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.70;
			h = 0.30 - (5 / 250);//0.25
		};
		*/
		/*
		class imgBackground : Life_RscPictureKeepAspect
		{

			idc = -1;
			text = "icons\background.paa";
			x = 0.54;
			y = 0.225;
			w = 0.3; h = 0.3;

			colorText[] = {1, 1, 1, 0.2};
		};
		*/
	};

	class controls {

/*
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "$STR_CELL_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		*/

		/*
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			//x = 0.1;
			//y = 0.25;
			//w = 0.6;
			//h = (1 / 25);
		};
		*/

		class NotificationCenter : Life_RscButtonMenu {
			idc = -1;
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
			onButtonClick = "closeDialog 0; createDialog 'invo_notification_main';";
			tooltip = "Historique des SMS";
			x = 0.6;
			y = 0.03;
			w = 0.15;
			h = 0.085;
		};
		
		class TextContact : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3023;
			text = "$STR_CELL_LastContact";
			x = 0.32;
			y = 0.115;
			w = 0.3;
			h = 0.028;
		};
		
		class PlayerList : Life_RscCombo
		{
			idc = 3004;
			x = 0.31;
			y = 0.19;
			w = 0.34;
			h = 0.058;
		};

		class textEdit : Life_RscEdit {
			idc = 3003;
			text = "";
			sizeEx = 0.030;
			x = 0.31;
			y = 0.26;
			w = 0.4; 
			h = 0.51;
		};
		
		
		
		
		class TextReplyButton : life_RscButtonMenu
		{
			idc = 3022;
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
			tooltip = "Répondre au dernier contact";

			x = 0.35;
			y = 0.79;
			w = 0.166;
			h = 0.028;
		};

		class TextMsgButton : life_RscButtonMenu
		{
			idc = 3015;
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
			onButtonClick = "[] call INVO_fnc_cell_textmsg";
			tooltip = "Répondre";
			
			x = 0.36+0.166+0.018;
			y = 0.79;
			w = 0.116;
			h = 0.028;
		};

		class TextAmbulanceButton : life_RscButtonMenu
		{
			idc = 3032;
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
			onButtonClick = "[] call INVO_fnc_cell_emsrequest";
			tooltip = "Envoyer aux ambulanciers";

			x = 0.35;
			y = 0.85;
			w = 0.12;
			h = 0.028;
		};

		class TextCopButton : life_RscButtonMenu
		{
			idc = 3016;
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
			onButtonClick = "[] call INVO_fnc_cell_textcop";
			tooltip = "Envoyer aux gendarmes";

			x = 0.5;
			y = 0.85;
			w = 0.226-0.075;
			h = 0.028;
		};

		class TextAdminButton : life_RscButtonMenu
		{
			idc = 3017;
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
			onButtonClick = "[] call INVO_fnc_cell_textadmin";
			tooltip = "Envoyer aux admins";

			x = 0.415;
			y = 0.93;
			w = 0.19;
			h = 0.028;
		};
		
		//Ajout Sky
		/*
		class TextDepanneuseButton : life_RscButtonMenu
		{
			idc = 3031;
			text = "SMS Depan.";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call INVO_fnc_cell_depanrequest";

			x = 0.53;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
*/
		class AdminMsgButton : life_RscButtonMenu
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};

			x = 0.32;
			y = 0;
			w = 0.2;
			h = (1 / 25);
		};

		class AdminMsgAllButton : life_RscButtonMenu
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call INVO_fnc_cell_adminmsgall";

			x = 0.53;
			y = 0;
			w = 0.2;
			h = (1 / 25);
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
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
			onButtonClick = "closeDialog 0;";
			tooltip = "Fermer";
			x = 0.699;
			y = 0.943;
			w = 0.027;
			h = 0.03;
		};

		// class Radio_Altis_FM : Life_RscButtonMenu {
			// idc = 3025;
			// text = "Altis-FM";
			// colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			// onButtonClick = "closeDialog 0; closeDialog 0; [] spawn INVO_fnc_radioPrepare;";
			// x = -0.06 + (6.25 / 40) + (6.25 / 40) + (13.75 / 40) + 0.02 + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.51 + (1 / 50);			//0.46
			// w = (6.25 / 40);
			// h = (1 / 25);
		// };
	};
};