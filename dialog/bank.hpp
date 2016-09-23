class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class fondBank: Life_RscPicture {
			idc = 9090909;
			text = "textures\ATM.paa";
		    x = 0.25963 * safezoneW + safezoneX;
		    y = 0.0749805 * safezoneH + safezoneY;
		    w = 0.495203 * safezoneW;
		    h = 0.850039 * safezoneH;
		};
	};

	class controls {

		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			x = 0.484805 * safezoneW + safezoneX;
			y = 0.188777 * safezoneH + safezoneY;
			w = 0.3;
			h = 0.14;
		};

		class moneyEdit : Life_RscEdit {

			idc = 2702;

			text = "1";
			sizeEx = 0.030;
			x = 0.484805 * safezoneW + safezoneX;
			y = 0.38-(0.0235845 * safezoneH);
			w = 0.0649965 * safezoneW;
			h = 0.0235845 * safezoneH;

		};
/*
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};*/

		class WithdrawButton : life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankWithdraw";
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

			x = 0.627416 * safezoneW + safezoneX;
			y = 0.346993 * safezoneH + safezoneY;
			w = 0.0476055 * safezoneW;
			h = 0.0446374 * safezoneH;
		};

		class DepositButton : life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankDeposit";
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

			x = 0.627416 * safezoneW + safezoneX;
			y = 0.193986 * safezoneH + safezoneY;
			w = 0.0461416 * safezoneW;
			h = 0.0446374 * safezoneH;
		};

		class PlayerList : Life_RscCombo
		{
			idc = 2703;

			x = 0.4;
			y = 0.38;
			w = 0.223;
			h = 0.04;
		};

		class TransferButton : life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_bankTransfer";
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

			x = 0.627416 * safezoneW + safezoneX;
			y = 0.2685 * safezoneH + safezoneY;
			w = 0.0490694 * safezoneW;
			h = 0.0420331 * safezoneH;
		};

		class GangDeposit : TransferButton
		{
			idc = 2705;
			onButtonClick = "[] call life_fnc_gangDeposit";
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
			x = 0.340729 * safezoneW + safezoneX;
			y = 0.346993 * safezoneH + safezoneY;
			w = 0.0461417 * safezoneW;
			h = 0.040731 * safezoneH;
		};

		class GangWithdraw : TransferButton
		{
			idc = 2706;
			onButtonClick = "[] call life_fnc_gangWithdraw";
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
			x = 0.339265 * safezoneW + safezoneX;
			y = 0.19659 * safezoneH + safezoneY;
			w = 0.0461417 * safezoneW;
			h = 0.040731 * safezoneH;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
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
			x = 0.540989 * safezoneW + safezoneX;
			y = 0.64584 * safezoneH + safezoneY;
			w = 0.0541931 * safezoneW;
			h = 0.0511481 * safezoneH;
		};
	};
};