//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class marketView
{
	idd = 39500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			text = "textures\marche.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		/*class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center'>Prix du marché</t>"; //--- ToDo: Localize;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};*//*
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};*/
		class lblResourceName: RscText
		{
			idc = 1000;
			text = "Resource"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};/*
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};*/
		class lblResourcePrice: RscText
		{
			idc = 1001;
			text = "XXXXXXXXXXXXX$"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {0,1,0,1};
			sizeEx = 1.2 * GUI_GRID_H;
		};/*
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
		};*/
		/*class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "<t align='center'>Developpement</t>"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};*/
		class picTrendGlobal: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class picTrendLocal: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Depuis le début"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Recemment"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class lblTrendGlobal: RscText
		{
			idc = 1004;
			text = "xxxxxxxx$"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class lblTrendLocal: RscText
		{
			idc = 1005;
			text = "xxxxxxxx$"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
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
			onButtonClick="closeDialog 0;";
			tooltip = "Fermer";
			x = 0.84;
			y = 0.785;
			w = 0.027;
			h = 0.03;
		};
		class listResources: RscListbox
		{
			idc = 1500;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
			colorBackground[] = {0, 0, 0, 0};
			colorBackground2[] = {1, 1, 1, 0};
			color[] = {0, 0, 0, 1};
			color2[] = {0, 0, 0, 1};
			colorText[] = {0, 0, 0, 1};
			onLBSelChanged = "[] spawn life_fnc_refreshMarketView";
		};
	};
};

