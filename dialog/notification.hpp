
class invo_notification_side
{
	name= "invo_notification_side";
	idd = 65600;
	movingEnabled = true;
	enableSimulation = true;
	fadein = 2;
	duration = 4;
  	fadeout = 2;
  	onLoad="uiNamespace setVariable ['invo_notification_side',_this select 0];";
  	onDestroy = "uiNamespace setVariable ['invo_notification_side', displayNull];";

	class controlsBackground
	{
		class imgBackground : Life_RscPictureKeepAspect
		{
			idc = 65601;
			moving = 1 ;
			text = "\vacation_textures\data\krisscut\notif2.paa";
			x = safeZoneX;
			y = safeZoneY + 1.2*safeZoneH/5;
			w = 0.08;
			h = 0.08;

			colorText[] = {1, 1, 1, 0.8};
		};
	};

	class controls
	{
		class NumberUnread : Life_RscStructuredText
		{
			idc = 65602;
			text = "<t color='#D26728' align='center' size='2'>10</t>";
			x = safeZoneX - 0.01;
			y = safeZoneY +1.2*safeZoneH/5 - 0.04;
			w = 0.08;
			h = 0.08;
		};
	};
};

#define BGW_MAIN 0.9
#define BGH_MAIN 0.7
#define BGX_MAIN safeZoneX + safeZoneW/2 - BGW_MAIN/2
#define BGY_MAIN safeZoneY + safeZoneH/2 - BGH_MAIN/2

class invo_notification_main
{
	name= "invo_notification_main";
	idd = 68000;
	movingEnabled = true;
	enableSimulation = true;
	multiselectEnabled = 0;
  	onLoad="[] spawn INVO_fnc_notificationOnLoadMainIHM;";
  	onDestroy = "";

	class controlsBackground
	{
		class RscTitleBackground : life_RscText
		{
			colorBackground[] = {0.824,0.404,0.157,1.0};
			idc = 68001;
			x = BGX_MAIN;
			y = BGY_MAIN;
			w = BGW_MAIN;
			h = (1 / 25);
		};

		class MainBackground : life_RscText
		{
			idc = 68002;
			colorBackground[] = {0.196,0.204,0.235,0.95};
			x = BGX_MAIN;
			y = BGY_MAIN + (11 / 250);
			w = BGW_MAIN;
			h = BGH_MAIN - (22 / 250);
		};

		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 68003;
			text = "Historique des SMS";
			x = BGX_MAIN;
			y = BGY_MAIN;
			w = BGW_MAIN;
			h = (1 / 25);
		};
	};

	class controls
	{
		class HideNotification : Life_RscText
		{
			idc = 68070;
			default = 1;
			text = "Pas de SMS !";
			sizeEx = 0.06;
			colorBackground[] = {0,0,0,0.8};
			x = BGX_MAIN;
			y = BGY_MAIN + (11 / 250);
			w = BGW_MAIN;
			h = BGH_MAIN - (22 / 250);
		};

		class treeViewContainer : Life_RscControlsGroup
		{
			idc = 68049;
			x = BGX_MAIN + 0.02;
			y = BGY_MAIN + 0.06;
			w = 0.2;
			h = BGH_MAIN - 0.12;

			class Controls
			{
				class treeView : Life_RscTree
				{
					access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
					idc = 68050; // Control identification (without it, the control won't be displayed)
					type = 12; // Type is 12
					style = 2; // Style
					//default = 0; // Control selected by default (only one within a display can be used)
					blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

					x = 0;
					y = 0;
					w = 0.2;
					h = BGH_MAIN - 0.12;
					class ScrollBar
					{
						width = 0; // width of ScrollBar
						height = 0; // height of ScrollBar
						scrollSpeed = 0.01; // scroll speed of ScrollBar

						arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
						arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
						border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
						thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

						color[] = {1,1,1,1}; // Scrollbar color
					};

					shadow = 1; // Shadow (0 - none, 1 - N/A, 2 - black outline)

					colorBorder[] = {0,0,0,1}; // Frame color
					colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
					colorSelect[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 0)
					colorMarked[] = {1,0.5,0,0.5}; // Marked item fill color (when multiselectEnabled is 1)
					colorMarkedSelected[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 1)

					colorText[] = {1,1,1,1}; // Text color
					colorSelectText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 0)
					colorMarkedText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 1)
					colorScrollbar[] = {0.95,0.95,0.95,1};
					colorDisabled[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
					colorArrow[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown

					multiselectEnabled = 0; // Allow selecting multiple items while holding Ctrl or Shift
					expandOnDoubleclick = 1; // Expand/collapse item upon double-click
					hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa"; // Expand icon
					expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa"; // Collapse icon
					maxHistoryDelay = 1; // Time since last keyboard type search to reset it

					// Scrollbar configuration systemChat str ['onTreeSelChanged',_this];
					onTreeSelChanged = "[] call INVO_fnc_notificationOnCLickTree; false";
					//onTreeLButtonDown = "systemChat str ['onTreeLButtonDown',_this]; false";
					//onTreeDblClick = "systemChat str ['onTreeDblClick',_this]; false";
					//onTreeExpanded = "systemChat str ['onTreeExpanded',_this]; false";
					//onTreeCollapsed = "systemChat str ['onTreeCollapsed',_this]; false";
					//onTreeMouseExit = "systemChat str ['onTreeMouseExit',_this]; false";
				};
			};
		};

		class TitleDesc : Life_RscStructuredText
		{
			idc = 68005;
			text = "<t color='#D26728'>TITRE :</t>";
			x = BGX_MAIN + 0.22;
			y = BGY_MAIN + 0.05;
			w = 0.12;
			h = 0.04;
		};

		class TitleNotif : Life_RscStructuredText
		{
			idc = 68006;
			text = "";
			x = BGX_MAIN + 0.32;
			y = BGY_MAIN + 0.05;
			w = 0.46;
			h = 0.10;
		};

		class AuthorTitle : Life_RscStructuredText
		{
			idc = 68007;
			text = "<t color='#D26728'>Auteur :</t>";
			x = BGX_MAIN + 0.22;
			y = BGY_MAIN + 0.16;
			w = 0.12;
			h = 0.04;
		};

		class AuthorDesc : Life_RscStructuredText
		{
			idc = 68008;
			text = "";
			x = BGX_MAIN + 0.32;
			y = BGY_MAIN + 0.16;
			w = 0.46;
			h = 0.04;
		};

		class DateTitle : Life_RscStructuredText
		{
			idc = 68009;
			text = "<t color='#D26728'>Date :</t>";
			x = BGX_MAIN + 0.22;
			y = BGY_MAIN + 0.21;
			w = 0.12;
			h = 0.04;
		};

		class DateDesc : Life_RscStructuredText
		{
			idc = 68010;
			text = "";
			x = BGX_MAIN + 0.32;
			y = BGY_MAIN + 0.21;
			w = 0.46;
			h = 0.04;
		};

		class ContentDesc : Life_RscStructuredText
		{
			idc = 68011;
			text = "";
			x = BGX_MAIN + 0.23;
			y = BGY_MAIN + 0.27;
			w = 0.65;
			h = 0.35;
			colorBackground[] = {0.196,0.204,0.235,0.98};
		};

		class ButtonClose : Life_RscButtonMenu
		{
			idc = -1;
			text = "Fermer";
			onButtonClick = "closeDialog 0;";
			x = BGX_MAIN;
			y = BGY_MAIN + (11 / 250)  + BGH_MAIN - (22 / 250) + 0.01;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonSettings : ButtonClose
		{
			idc = -1;
			text = "Reglages";
			onButtonClick = "closeDialog 0; createDialog 'invo_notification_settings';";
			x = BGX_MAIN + (6.25 / 40) + 0.01 ;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

#define BGW_NOTIFICATION 0.7
#define BGH_NOTIFICATION 0.25
#define BGX_NOTIFICATION safeZoneX + safeZoneW/2 - BGW_NOTIFICATION/2
#define BGY_NOTIFICATION safeZoneY + safeZoneH - BGH_NOTIFICATION + 0.04

class invo_notification_bottom
{
	name= "invo_notification_bottom";
	idd = 65500;
	movingEnabled = true;
	enableSimulation = true;
	fadein = 2;
	duration = 10;
  	fadeout = 2;
  	onLoad="uiNamespace setVariable ['invo_notification_bottom',_this select 0]; [] spawn INVO_fnc_notificationLoad;";
  	onDestroy = "uiNamespace setVariable ['invo_notification_bottom', displayNull];";

	class controlsBackground
	{
		class RscTitleBackground:life_RscText
		{
			colorBackground[] = {0.824,0.404,0.157,0.90};
			idc = 65510;
			x = BGX_NOTIFICATION;
			y = BGY_NOTIFICATION;
			w = BGW_NOTIFICATION;
			h = (1 / 25);
		};

		class MainBackground : life_RscText
		{
			idc = 65511;
			colorBackground[] = {0.196,0.204,0.235,0.90};
			x = BGX_NOTIFICATION;
			y = BGY_NOTIFICATION + (11 / 250);
			w = BGW_NOTIFICATION;
			h = BGH_NOTIFICATION - (22 / 250);
		};

		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 65499;
			text = "Système de notification";
			x = BGX_NOTIFICATION;
			y = BGY_NOTIFICATION;
			w = BGW_NOTIFICATION/2;
			h = (1 / 25);
		};

		class Source : Life_RscStructuredText
		{
			colorBackground[] = {0,0,0,0};
			idc = 65501;
			text = "";
			x = BGX_NOTIFICATION + BGW_NOTIFICATION/2 -0.02;
			y = BGY_NOTIFICATION;
			w = BGW_NOTIFICATION/2 + 0.02;
			h = (1 / 25);
		};
	};

	class controls
	{
		class TitleDesc : Life_RscStructuredText
		{
			idc = -1;
			text = "<t color='#D26728'>TITRE :</t>";
			x = BGX_NOTIFICATION + 0.02;
			y = BGY_NOTIFICATION + 0.04;
			w = 0.34;
			h = 0.06;
		};

		class TitleNotif : Life_RscStructuredText
		{
			idc = 65502;
			text = "";
			x = BGX_NOTIFICATION + 0.14;
			y = BGY_NOTIFICATION + 0.04;
			w = BGW_NOTIFICATION/2 + 0.08;
			h = 0.04;
		};

		class Content : Life_RscStructuredText
		{
			idc = 65503;
			text = "";
			x = BGX_NOTIFICATION + 0.02;
			y = BGY_NOTIFICATION + 0.08;
			w = BGW_NOTIFICATION - 0.05;
			h = 0.14;
		};
	};
};

#define BGW_SETTINGS 0.5
#define BGH_SETTINGS 0.28
#define BGX_SETTINGS safeZoneX + safeZoneW/2 - BGW_SETTINGS/2
#define BGY_SETTINGS safeZoneY + safeZoneH/2 - BGH_SETTINGS/2 + 0.04

class invo_notification_settings
{
	name= "invo_notification_settings";
	idd = 66800;
	movingEnabled = true;
	enableSimulation = true;
  	onLoad="uiNamespace setVariable ['invo_notification_settings',_this select 0]; ['open'] call INVO_fnc_notificationSettings;";
  	onDestroy = "uiNamespace setVariable ['invo_notification_settings', displayNull];['exit'] call INVO_fnc_notificationSettings;";


  	class controlsBackground
	{
		class RscTitleBackground:life_RscText
		{
			colorBackground[] =  {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			idc = 66800;
			x = BGX_SETTINGS;
			y = BGY_SETTINGS;
			w = BGW_SETTINGS;
			h = (1 / 25);
		};

		class MainBackground : life_RscText
		{
			idc = 66801;
			colorBackground[] = {0.196,0.204,0.235,0.90};
			x = BGX_SETTINGS;
			y = BGY_SETTINGS + (11 / 250);
			w = BGW_SETTINGS;
			h = BGH_SETTINGS - (22 / 250);
		};

		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 66802;
			text = "Réglages notification";
			x = BGX_SETTINGS;
			y = BGY_SETTINGS;
			w = BGW_SETTINGS/2;
			h = (1 / 25);
		};
	};

	class controls
	{
		class BubbleTitle : Life_RscText
		{
			idc = -1;
			text = "Bulle notification:";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = BGX_SETTINGS + 0.02;
			y = BGY_SETTINGS + 0.05;
			w = 0.34;
			h = 0.06;
		};

		class BubbleCheckBox : Life_RscActiveText
		{
			idc = 66803;
			x = BGX_SETTINGS + 0.40;
			y = BGY_SETTINGS + 0.05;
			tooltip = "Active la bulle de notification.";
			action = "['bubbleActiveChanged'] call INVO_fnc_notificationSettings;";
			w = 0.175;
		};

		class BubbleBlinkTitle : BubbleTitle
		{
			text = "Clignotement Bulle:";
			y = BGY_SETTINGS + 0.12;
		};

		class BubbleBlinkCheckbox : BubbleCheckBox
		{
			idc = 66804;
			y = BGY_SETTINGS + 0.12;
			tooltip = "Active le clignotement en permanence (ON) ou une seule fois(OFF) à la reception.";
			action = "['bubblePeriodicChanged'] call INVO_fnc_notificationSettings;";
		};

		class BubblePosition : Life_RscButtonMenu
		{
			idc = 66805;
			text = "Positionner Bulle";
			onButtonClick = "['positionBubble'] call INVO_fnc_notificationSettings;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = BGX_SETTINGS + 0.02;
			y = BGY_SETTINGS + 0.19;
			w = 0.25;
			h = (1 / 25);
		};

		class BubblePositionText : Life_RscActiveText
		{
			idc = 66806;
			text = "defaul Text";
			x = BGX_SETTINGS + 0.27;
			y = BGY_SETTINGS + 0.19;
			tooltip = "Position actuelle, cliquer pour reset";
			action = "['resetBubblePosition'] call INVO_fnc_notificationSettings;";
			w = 0.195;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "Fermer";
			onButtonClick = "closeDialog 0; createDialog 'invo_notification_main';";
			x = BGX_SETTINGS;
			y = BGY_SETTINGS + BGH_SETTINGS - 0.04;
			w = 0.15625;
			h = 0.04;
		};
	};

};