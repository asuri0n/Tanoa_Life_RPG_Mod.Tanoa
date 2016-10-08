switch(playerSide) do
{
	case west: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\Tenue-gendarme.paa"];
		};
	};
	case civilian: {
		if(uniform player == "U_B_HeliPilotCoveralls") then {
        	player setObjectTextureGlobal [0,"textures\tenues\civ\prisonier.paa"];
		};
		if(uniform player == "U_C_Poloshirt_blue") then {
        	player setObjectTextureGlobal [0,"textures\tenues\civ\vacationgaming.paa"];
		};
	};
	case east: {
		if(uniform player == "U_B_HeliPilotCoveralls") then {
        	player setObjectTextureGlobal [0,"textures\tenues\civ\prisonier.paa"];
		};
	};
	case independent: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\med\medic_uniform.paa"];
		};
	};
};