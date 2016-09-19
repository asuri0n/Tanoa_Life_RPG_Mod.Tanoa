class restric_licenses_Menu {
	idd = 42000;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Confiscation de licenses";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class LicensesList : Life_RscListBox
		{
			idc = 42001;
			text = "";
			sizeEx = 0.035;
			//onLBSelChanged = "[] call life_fnc_wantedInfo";

			x = 0.12; y = 0.26;
			w = 0.45; h = 0.45;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (5.25 / 40);
			h = (1 / 25);
		};

		class PardonButtonKey : Life_RscButtonMenu {
			idc = 42002;
			text = "Supprimer";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (5.25 / 40);
			h = (1 / 25);
		};
	};
};