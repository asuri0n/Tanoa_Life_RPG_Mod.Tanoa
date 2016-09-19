/*
	File: prof.hpp
	Author: Jacob "PapaBear" 
	Tyler Description: Dialog for new gui
*/ 

class Life_Prof_Dialog {
	idd = 7730;
	name = "life_prof_dialog";
	movingEnabled = false;
	enableSimulation = true; 

	class controlsBackground {
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			text = "textures\experience.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		/*
		class Frame: Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
		}; */
		/*
		class Title: Life_RscText {
			idc = -1;
			text = "Proficicency Levels";
			//--- ToDo: Localize;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};*/
	}; 
			
	class controls {
		class Prof_Text: Life_RscStructuredText {
			idc = 7731;
			color[] = {0, 0, 0, 1};
			color2[] = {0, 0, 0, 1};
			colorText[] = {0, 0, 0, 1};
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
	
		class Prof2_Text: Life_RscStructuredText {
			idc = 7732;
			color[] = {0, 0, 0, 1};
			color2[] = {0, 0, 0, 1};
			colorText[] = {0, 0, 0, 1};
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
	
		class Prof3_Text: Life_RscStructuredText {
			idc = 7733;
			color[] = {0, 0, 0, 1};
			color2[] = {0, 0, 0, 1};
			colorText[] = {0, 0, 0, 1};
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
	
		class CloseBTN: Life_RscButtonMenu {
			idc = -1;
			//--- ToDo: Localize;
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
	};
}; 