	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};

		class controlsBackground
		{
			class foodHIcon : life_RscPicture
			{

				idc = -1;
				text = "icons\food.paa";
				x = safeZoneX+safeZoneW-0.12;
				y = safeZoneY+safeZoneH-safeZoneH/5 -0.15;
				w = 0.033; h = 0.044;
			};

			class waterHIcon : life_RscPicture
			{

				idc = -1;
				text = "icons\water.paa";
				x = safeZoneX+safeZoneW-0.12;
				y = safeZoneY+safeZoneH-safeZoneH/5 -0.10;
				w = 0.033; h = 0.044;
			};

			class healthHIcon : life_RscPicture
			{

				idc = -1;
				text = "icons\health.paa";
				x = safeZoneX+safeZoneW-0.12;
				y = safeZoneY+safeZoneH-safeZoneH/5 -0.05;
				w = 0.033; h = 0.044;
			};
		};

		class controls
		{
			class foodtext
			{
				type= 0;
				idc= 23500;
				style= 0;
				x= safeZoneX + safeZoneW - 0.09;
				y = safeZoneY+safeZoneH-safeZoneH/5 -0.15;
				w= 0.1;
				h= 0.05;
				sizeEx= 0.03;
				size= 1;
				font= "PuristaSemibold";
				colorBackground[]= {0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow= true;
				text= "";
			};

			class watertext
			{
				type= 0;
				idc= 23510;
				style= 0;
				x= safeZoneX + safeZoneW - 0.09;
				y = safeZoneY+safeZoneH-safeZoneH/5 - 0.1;
				w= 0.1;
				h= 0.05;
				sizeEx= 0.03;
				size= 1;
				font= "PuristaSemibold";
				colorBackground[]= {0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow= true;
				text= "";
			};

			class healthtext
			{
				type= 0;
				idc= 23515;
				style= 0;
				x= safeZoneX + safeZoneW - 0.09;
				y = safeZoneY+safeZoneH-safeZoneH/5 -0.05;
				w= 0.1;
				h= 0.05;
				sizeEx= 0.03;
				size= 1;
				font= "PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow= true;
				text= "";
			};
		};
 	};