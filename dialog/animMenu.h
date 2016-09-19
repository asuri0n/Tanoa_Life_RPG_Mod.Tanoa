class animMenu {
	idd = 13750;
	name = "animMenu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Title: Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.1;
			w = 0.3;
			h = (1/25);
		};

		class BG : Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.1;
			w = 0.3;
			h = 0.4;
		};
	};

	class controls {
		class Title : Life_RscTitle {	
			idc = -1;
			text = "Animations";
			x = 0.3;
			y = 0.1;
		};


		class AnimationsList : Life_RscListBox {
			sizeEx = 0.03;
			idc = 13751;
			x = 0.315; y = 0.1 + 0.05;
			w = 0.3 - 0.03; h = 0.4 - 0.11;
			onLBSelChanged = "[true] spawn life_fnc_animMenu;";
		};
	};
};