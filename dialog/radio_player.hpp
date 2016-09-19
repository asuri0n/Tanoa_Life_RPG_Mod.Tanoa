

#define BGW_RADIO 0.7
#define BGH_RADIO 0.25
#define BGX_RADIO safeZoneX + safeZoneW/2 - BGW_RADIO/2
#define BGY_RADIO safeZoneY

class invo_radio_player
{
	name= "invo_radio_player";
	idd = 65000;
	movingEnabled = true;
	enableSimulation = true;
	fadein = 2;
	duration = 10;
  	fadeout = 2;
  	onLoad="uiNamespace setVariable ['invo_radio_player',_this select 0]; [] spawn INVO_fnc_radioLoad";
  	onDestroy = "uiNamespace setVariable ['invo_radio_player', displayNull]; INVO_radio_display = false;";

	class controlsBackground
	{
		class RscTitleBackground:life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = BGX_RADIO;
			y = BGY_RADIO;
			w = BGW_RADIO;
			h = (1 / 25);
		};

		class MainBackground : life_RscText
		{
			idc = 65001;
			colorBackground[] = {0,0,0,0.7};
			x = BGX_RADIO;
			y = BGY_RADIO + (11 / 250);
			w = BGW_RADIO;
			h = BGH_RADIO - (22 / 250);
		};

		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 65002;
			text = "Vacation Player Radio";
			x = BGX_RADIO;
			y = BGY_RADIO;
			w = BGW_RADIO;
			h = (1 / 25);
		};

		class imgBackground : Life_RscPictureKeepAspect
		{

			idc = -1;
			text = "icons\krisscut\favicon_radio.paa";
			x = BGX_RADIO + BGW_RADIO - 0.15;
			y = BGY_RADIO + 0.05;
			w = 0.15;
			h = 0.15;

			colorText[] = {1, 1, 1, 0.6};
		};

	};

	class controls
	{
		// class TitreRadio : Life_RscStructuredText
		// {
			// idc = 65003;
			// text = "<t color='#b67e2a'>Radio :</t> Altis FM";
			// sizeEx = 0.035;
			// x = BGX_RADIO + 0.02;
			// y = BGY_RADIO + 0.06;
			// w = BGW_RADIO/2 - 0.05;
			// h = 0.06;
		// };

		class TitreMusique : Life_RscStructuredText
		{
			idc = 65004;
			text = "<t color='#b67e2a'>Titre :</t> Pas de donnees";
			sizeEx = 0.035;
			x = BGX_RADIO + 0.02;
			y = BGY_RADIO + 0.10;
			w = BGW_RADIO - 0.05;
			h = 0.11;
		};

		class VolumeMusique : Life_RscStructuredText
		{
			idc = 65005;
			text = "<t color='#b67e2a'>Volume :</t> 50";
			sizeEx = 0.035;
			x = BGX_RADIO + BGW_RADIO - (BGW_RADIO/2 - 0.09);
			y = BGY_RADIO + 0.06;
			w = BGW_RADIO/2 - 0.05;
			h = 0.06;
		};
	};
};