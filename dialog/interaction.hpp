#define BGX 0.35
#define BGY 0.2
#define BGW 0.32

class Interaction_Extended
{
	idd = 45000;
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
			idc = 45001;
			text = "Interaction Menu";
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
			onButtonClick = "closeDialog 0; life_action_inUse = false; player setVariable [""AGM_canTreat"", true, true];";
			x = BGX;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonOk: life_RscButtonMenu
		{
			idc = 45002;
			//shortcuts[] = {0x00050000 + 2};
			text = "Valider";
			onButtonClick = "[] call life_fnc_launchInteraction";
			x = BGX +(6.25 / 40)+0.01;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class OptionList : Life_RscListBox
		{
			idc = 45003;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "";
			onLBDblClick = "[] call life_fnc_launchInteraction";
			x = BGX + 0.02;
			y = BGY + 0.06;
			w = 0.28;
			h = 0.48;
		};
	};
};
