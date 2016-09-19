class Life_msg_Civils {
	idd = 70000;
	name= "life_msg_Civils";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.70;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.70;
			h = 0.20 - (5 / 250);		//0.25
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 70001;
			text = "Régie publicitaire";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MsgToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 70002;
			text = "$STR_CELL_TextToSend";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textMsg : Life_RscEdit {
		
		idc = 70003;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.62; h = 0.03;
		
		};
		
		class SendButton : life_RscButtonMenu 
		{
			idc = 70004;
			text = "Envoyer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_sendCommercialMsg;";
			x = 0.11;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.43;//0.51 + (1 / 50);//0.46
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};