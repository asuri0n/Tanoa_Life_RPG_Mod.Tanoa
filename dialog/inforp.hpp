class inforp
{
	idd = 8000;
	name = "inforp";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[0] spawn life_fnc_sendVisa;";

	class controlsBackground {

		class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};

		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Informations personnelles";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.10;
			y = 0.30;
			w = 0.3; h = 0.6;
		};
	};

	class controls {

		class nameText : Life_RscText
		{
			idc = 8003;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.04;

			x = (6.25 / 40)+0.1; y = 0.38;
			w = 0.219+0.01+0.219; h = 0.04;
		};

		class sexeText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Sexe";
			sizeEx = 0.04;

			x = (6.25 / 40)+0.1; y = 0.45;
			w = 0.219; h = 0.04;
		};
		
		class sexeCombo : Life_RscCombo
		{
			idc = 8001;

			text = "";
			sizeEx = 0.030;
			x = (6.25 / 40)+0.219+0.1+0.01; y = 0.45;
			w = 0.219; h = 0.04;
		};
		
		class nationaliteText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Nationalite";
			sizeEx = 0.04;

			x = (6.25 / 40)+0.1; y = 0.52;
			w = 0.219; h = 0.04;
		};
		
		class nationaliteEdit : Life_RscEdit
		{
			idc = 8002;

			text = "";
			sizeEx = 0.030;
			x = (6.25 / 40)+0.219+0.1+0.01; y = 0.52;
			w = 0.219; h = 0.04;
		};
		
		class ageText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Age";
			sizeEx = 0.04;

			x = (6.25 / 40)+0.1; y = 0.59;
			w = 0.219; h = 0.04;
		};
		
		class ageEdit : Life_RscEdit
		{
			idc = 8004;

			text = "";
			sizeEx = 0.030;
			x = (6.25 / 40)+0.219+0.1+0.01; y = 0.59;
			w = 0.219; h = 0.04;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1; y = 0.8 - (1 / 25);
			w = (6.25 / 40); h = (1 / 25);
		};	
		
		class ButtonAccept : Life_RscButtonMenu
		{
			idc = 8888;
			text = "Envoyer";
			colorBackground[] = {0.25,0.48,0.80,0.5};
			onButtonClick = "[1] call life_fnc_sendVisa;";
			x = (6.25 / 40)+0.1+0.01; y = 0.8 - (1 / 25);
			w = (6.25 / 40); h = (1 / 25);
		};	
	};
};