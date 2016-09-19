#define ST_RIGHT 0x01

class agnStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['agnStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['agnStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['agnStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = safezoneX + safezoneW - 1;
			y = safezoneY + safezoneH - 0.08;
			w = 1;
			h = 0.04;
			shadow = 2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text="Chargement...";
			class Attributes {
				align="right";
				color = "#DF7401";
			};
		};
	};
};