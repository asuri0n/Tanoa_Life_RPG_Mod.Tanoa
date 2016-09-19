/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
*/

class Life_craft {
	idd = 666;
	name= "life_craft";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_craft";

	class controlsBackground {
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			text = "textures\fabriquer.paa";
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
			w = 0.8;
			h = (1 / 25);
		};*/

		/*class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};*/
	};

	class controls {

		/*class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 667;
			text = "$STR_CRAFT_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};*/
/*
		class craftListHeader : Life_RscText
		{
			idc = 668;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			x = 0.105; y = 0.26;
			w = 0.275; h = 0.04;
		};*/

		class craftList : life_RscListBox
		{
			idc = 669;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_craft_update";
			x = 0.13;
			y = 0.32;
			w = (0.37-0.13); 
			h = (0.79-0.34);
		};

		/*class materialListHeader : Life_RscText
		{
			idc = 670;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			x = 0.395; y = 0.26;
			w = 0.275; h = 0.04;
		};*/

		class materialList : Life_RscControlsGroup
		{
			idc = 671;
			x = 0.43;
			y = 0.32;
			w = (0.68-0.43);
			h = (0.79-0.32);


			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; 
					h = 0.44;
				};
			};
		};

		class ButtonCraft : Life_RscButtonMenu {
			idc = 672;
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
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftAction};";
			tooltip = "Fabriquer";
			x = 0.69;
			y = 0.49;
			w = (0.89-0.69);
			h = (0.75-0.49);
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
			x = 0.11;
			y = 0.79;
			w = 0.13;
			h = 0.05;
		};
	};
};