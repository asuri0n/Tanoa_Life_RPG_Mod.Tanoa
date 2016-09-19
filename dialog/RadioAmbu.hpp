class Life_RadioMenu {
	idd = 7775;
	name= "life_RadioAmbu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.4 - (22 / 250);
		};
	};

	class controls {

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Liste Radio Ambulancier";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class KickButton : life_RscButtonMenu
		{
			idc = -1;
			text = "Kick";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "MenuOk=true;";

			x = 0.432;
			y = 0.3;
			w = (6 / 40);
			h = (1 / 25);
		};

		class PlayerList : Life_RscCombo
		{
			idc = 7776;

			x = 0.4; y = 0.4;
			w = 0.2; h = 0.05;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};