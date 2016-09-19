class Life_insure_confirm
{
	idd = 3310;
	name = "life_insure_confirm";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.60;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.60;
			h = 0.3 - (22 / 250) + 0.10;
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = 3311;
			sizeEx = 0.020;
			text = "";
			x = 0.287+ 0.03 - 0.01;
			y = 0.2 + (11 / 250);
			w = 0.55 + 0.02; h = 0.12+0.10;
		};

		class payInsurance: Life_RscButtonMenu {
			idc = -1;
			text = "NON DISPONIBLE";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_vehInsure;closeDialog 0;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25) + 0.10;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class refuseInsurance : Life_RscButtonMenu {
			idc = -1;
			text = "Ne pas assurer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25) + 0.10;
			w = (10 / 40);
			h = (1 / 25);
		};
	};
};