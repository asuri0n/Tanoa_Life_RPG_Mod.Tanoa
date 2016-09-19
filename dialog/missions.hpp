#define BGW_MAIN 1
#define BGH_MAIN 1
#define BGX_MAIN safeZoneX + safeZoneW/2 - BGW_MAIN/2
#define BGY_MAIN safeZoneY + safeZoneH/2 - BGH_MAIN/2

class invo_missions
{
	name= "invo_missions";
	idd = 48000;
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
			idc = 48001;
			x = BGX_MAIN;
			y = BGY_MAIN;
			w = BGW_MAIN;
			h = (1 / 25);
		};

		class MainBackground : life_RscText
		{
			idc = 48002;
			colorBackground[] = {0.196,0.204,0.235,0.95};
			x = BGX_MAIN;
			y = BGY_MAIN + (11 / 250);
			w = BGW_MAIN;
			h = BGH_MAIN - (22 / 250);
		};

		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 48003;
			text = "Pôle Emploi";
			x = BGX_MAIN;
			y = BGY_MAIN;
			w = BGW_MAIN;
			h = (1 / 25);
		};
	};

	class controls
	{
		class treeViewContainer : Life_RscControlsGroup
		{
			idc = 48049;
			x = BGX_MAIN + 0.02;
			y = BGY_MAIN + 0.06;
			w = 0.3;
			h = BGH_MAIN - 0.12;

			class Controls
			{
				class treeView : Life_RscTree
				{
					access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
					idc = 48050; // Control identification (without it, the control won't be displayed)
					type = 12; // Type is 12
					style = 2; // Style
					//default = 0; // Control selected by default (only one within a display can be used)
					blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

					x = 0;
					y = 0;
					w = 0.3;
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
					onTreeSelChanged = "[] call INVO_fnc_missionMenuSelect; false";
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
			idc = 48005;
			text = "<t color='#D26728'>Type :</t>";
			x = BGX_MAIN + 0.32;
			y = BGY_MAIN + 0.05;
			w = 0.12;
			h = 0.04;
		};

		class TitleNotif : Life_RscStructuredText
		{
			idc = 48006;
			text = "";
			x = BGX_MAIN + 0.42;
			y = BGY_MAIN + 0.05;
			w = 0.36;
			h = 0.10;
		};

		class AuthorTitle : Life_RscStructuredText
		{
			idc = 48007;
			text = "<t color='#D26728'>Objectif :</t>";
			x = BGX_MAIN + 0.32;
			y = BGY_MAIN + 0.16;
			w = 0.12;
			h = 0.04;
		};

		class AuthorDesc : Life_RscStructuredText
		{
			idc = 48008;
			text = "";
			x = BGX_MAIN + 0.42;
			y = BGY_MAIN + 0.16;
			w = 0.36;
			h = 0.04;
		};

		class DateTitle : Life_RscStructuredText
		{
			idc = 48009;
			text = "<t color='#D26728'>Paie :</t>";
			x = BGX_MAIN + 0.32;
			y = BGY_MAIN + 0.21;
			w = 0.12;
			h = 0.04;
		};

		class DateDesc : Life_RscStructuredText
		{
			idc = 48010;
			text = "";
			x = BGX_MAIN + 0.42;
			y = BGY_MAIN + 0.21;
			w = 0.36;
			h = 0.04;
		};

		class ContentDesc : Life_RscStructuredText
		{
			idc = 48011;
			text = "";
			x = BGX_MAIN + 0.33;
			y = BGY_MAIN + 0.27;
			w = 0.65;
			h = 0.60;
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
			text = "Accepter";
			onButtonClick = "closeDialog 0; [] call INVO_fnc_missionMenuAccept";
			x = BGX_MAIN + (6.25 / 40) + 0.01 ;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};