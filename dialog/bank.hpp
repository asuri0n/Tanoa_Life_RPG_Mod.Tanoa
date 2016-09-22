class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class fondATM: Life_RscPicture {
			idc = -1;
			text = "textures\ATM.paa";
			x = 0.125;
			y = 0;
			w = 0.777298;
			h = 1;
		};
	};

	class controls {

		class bank: Life_RscStructuredText
		{
			idc = 2701;
			text = "0";
			x = 0.484805 * safezoneW + safezoneX;
			y = 0.188777 * safezoneH + safezoneY;
			w = 0.0649965 * safezoneW;
			h = 0.0235845 * safezoneH;
		};
		class liquide: Life_RscStructuredText
		{
			idc = 1601;
			x = 0.483253 * safezoneW + safezoneX;
			y = 0.218872 * safezoneH + safezoneY;
			w = 0.0649965 * safezoneW;
			h = 0.0235845 * safezoneH;
		};
		class retraitGang: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_gangWithdraw";
			x = 0.339265 * safezoneW + safezoneX;
			y = 0.19659 * safezoneH + safezoneY;
			w = 0.0461417 * safezoneW;
			h = 0.040731 * safezoneH;
		};
		class depotGang: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_gangDeposit";
			x = 0.340729 * safezoneW + safezoneX;
			y = 0.346993 * safezoneH + safezoneY;
			w = 0.0461417 * safezoneW;
			h = 0.040731 * safezoneH;
		};
		class retrait: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankWithdraw";
			x = 0.627416 * safezoneW + safezoneX;
			y = 0.346993 * safezoneH + safezoneY;
			w = 0.0476055 * safezoneW;
			h = 0.0446374 * safezoneH;
		};
		class Transferer: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankTransfer";
			x = 0.627416 * safezoneW + safezoneX;
			y = 0.2685 * safezoneH + safezoneY;
			w = 0.0490694 * safezoneW;
			h = 0.0420331 * safezoneH;
		};
		class deposerATM: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankDeposit";
			x = 0.627416 * safezoneW + safezoneX;
			y = 0.193986 * safezoneH + safezoneY;
			w = 0.0461416 * safezoneW;
			h = 0.0446374 * safezoneH;
		};
		class annuler: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.540989 * safezoneW + safezoneX;
			y = 0.64584 * safezoneH + safezoneY;
			w = 0.0541931 * safezoneW;
			h = 0.0511481 * safezoneH;
		};
		class entrer: Life_RscButtonMenu
		{
			idc = -1;
			x = 0.543917 * safezoneW + safezoneX;
			y = 0.753918 * safezoneH + safezoneY;
			w = 0.0578528 * safezoneW;
			h = 0.0459395 * safezoneH;
		};
		class players: Life_RscCombo
		{
			idc = 2703;
			x = 0.4;
			y = 0.38;
			w = 0.223;
			h = 0.04;
		};
		class edit: Life_RscEdit
		{
			idc = 2702;
			text = "1";
			sizeEx = 0.030;
			x = 16.05 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.87132 * GUI_GRID_W;
			h = 1.00643 * GUI_GRID_H;
		};
	};
};