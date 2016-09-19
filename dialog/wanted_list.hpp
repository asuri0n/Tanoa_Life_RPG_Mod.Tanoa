class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 1;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 1;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0.1;
			y = 0.2;
			w = 1;
			h = (1 / 25);
		};

		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};

		class WantedList : Life_RscListBox
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_wantedInfo";

			x = 0.12; y = 0.26;
			w = 0.4; h = 0.4;
		};

		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};

			x = 0.56;
			y = 0.30;
			w = 0.52;
			h = 0.32;
		};

		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.56;
			y = -0.03;
			w = 0.8;
			h = 0.6;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] spawn life_fnc_pardon;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		//-------------------------------------------------------------------------------
		//section added 04/28/2014
		class AddButtonKey : Life_RscButtonMenu {
			idc = 2406;
			text = "Ajouter Criminel";
			onButtonClick = "_val = [] call life_fnc_addCriminal; if(_val) then{closeDialog 0};";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (10 / 40);
			h = (1 / 25);
		};

		class AllPlayers : Life_RscCombo {

			idc = 2407;

			x = 0.11; y = 0.71;
			w = 0.35; h = (1 / 25);

		};

		class AllCrimes : Life_RscCombo {

			idc = 2408;

			x = 0.48; y = 0.71;
			w = 0.6; h = (1 / 25);

		};

		class Description : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2409;
			text = "Ajouter un criminel manuellement :";
			x = 0.11;
			y = 0.67;
			w = 0.6;
			h = 0.04;
		};
		//-------------------------------------------------------------------------------

		class SearchButtonKey : Life_RscButtonMenu {
			idc = 2411;
			text = "Rechercher";
			onButtonClick = "[] spawn INVO_fnc_trackPerson;";
			//x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));	//Ladis : Ajout du pardon wanted list pour les CdP
																			//donc décalage de l'actuelle rechercher après la touche pardonner
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (10 / 40);
			h = (1 / 25);
		};
	};
};