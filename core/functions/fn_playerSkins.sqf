switch(playerSide) do
{
	case west: {
		if(uniform player == "U_Rangemaster") then {
        	player setObjectTextureGlobal [0,"textures\tenues\cop\Tenue-gendarme.paa"];
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