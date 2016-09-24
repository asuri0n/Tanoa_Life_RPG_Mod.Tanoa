switch(playerSide) do
{
	case west: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\Tenue-gendarme.paa"];
		};
		if(uniform player == "U_B_GEN_Commander_F") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\PulloverUniform.paa"];
		};
		if(uniform player == "U_B_GEN_Soldier_F") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\U_B_GEN_Soldier_F.paa"];
		};
		if(uniform player == "U_O_T_Officer_F") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\U_O_T_Officer_Gend.paa"];
		};
	};
	case civilian: {

	};
	case independent: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\med\medic_uniform.paa"];
		};
	};
};