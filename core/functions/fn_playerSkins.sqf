switch(playerSide) do
{
	case west: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\Tenue-gendarme.paa"];
		};
	};
	case civilian: {
		if(uniform player == "U_B_HeliPilotCoveralls") then {
        	player setObjectTextureGlobal [0,"textures\tenues\prisonier.paa"];
		};
	};
	case independent: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\med\medic_uniform.paa"];
		};
	};
};