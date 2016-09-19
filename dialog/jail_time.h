#define BGX 0.35
#define BGY 0.2
#define BGW 0.3

class jailTime_Menu
{
	idd = 40000;
	//name= "jailTime_Menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
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
			idc = 40001;
			text = "--Prison--";
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};
	};
	
	class controls {

		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Fermer";
			onButtonClick = "closeDialog 0;";
			x = BGX;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonOne : life_RscButtonMenu
		{
			idc = 40002;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Prison 10 mins";
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.07;
			w = 0.24;
			h = 0.038;
		};
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 40003;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Prison 20 mins";
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.12;
			w = 0.24;
			h = 0.038;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 40004;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Prison 30 mins";
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.17;
			w = 0.24;
			h = 0.038;
		};
		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 40005;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Prison 1 hr (TROLL)";
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.22;
			w = 0.24;
			h = 0.038;
		};
	};
};