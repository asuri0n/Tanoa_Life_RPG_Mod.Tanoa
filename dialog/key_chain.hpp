class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			text = "textures\cle.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};		
		
		/*class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};*/
		
		/*class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};*/
	};
	
	class controls {
		
		/*class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Keys_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};*/
		
		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			
			x = 0.255; 
			y = 0.377;
			w = 0.48; 
			h = 0.228;
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
			sizeEx = 0.030;
			onButtonClick = "closeDialog 0;";
			tooltip = "Fermer";
			x = 0.227;
			y = 0.730;
			w = 0.027;
			h = 0.03;
		};
		
		class NearPlayers : Life_RscCombo {		
			idc = 2702;			
			x = 0.385; y = 0.62;
			w = 0.220; h = 0.03;		
		};
		
		class DropKey : life_RscButtonMenu {
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
			sizeEx = 0.030;
			onButtonClick = "[] call life_fnc_keyDrop";
			tooltip = "Jeter";
			x = 0.268;
			y = 0.731;
			w = 0.1;
			h = 0.03;
		};
		
		class GiveKey : Life_RscButtonMenu {
			idc = 2703;
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
			onButtonClick = "[] call life_fnc_keyGive";
			tooltip = "Donner";
			x = 0.45;
			y = 0.665;
			w = 0.1;
			h = 0.03;
		};
	};
};