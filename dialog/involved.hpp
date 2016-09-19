class logo
{
	idd=-1;
	movingEnable = 1;
  	fadein =1;
	duration = 20;
  	fadeout =10;
	name= "logo";

	class controlsBackground
	{
		class logoImage : Life_RscPictureKeepAspect
		{
			idc = -1;
			text = "\vacation_textures\data\introinvol.paa";
			x = safeZoneX + (safeZoneW/2) -0.25;
			y = safeZoneY + 0.05;
			w = 0.5; h = 0.25;
			moving = 0;
			colorText[] = {1, 1, 1, 0.5};
		};
	};
};

class banner
{
	idd=-1;
	movingEnable = 1;
  	fadein =1;
	duration = 25;
  	fadeout =10;
	name= "banner";

	class controlsBackground
	{

		class bannerImage : Life_RscPictureKeepAspect
		{

			idc = -1;
			text = "\vacation_textures\data\introbanner.paa";
			x = safeZoneX + (safeZoneW/2) -0.35;
			y = safeZoneY + safeZoneH - 0.2 - 0.05;
			w = 0.7; h = 0.175;
			moving = 0;
			colorText[] = {1, 1, 1, 0.5};
		};

	};
};