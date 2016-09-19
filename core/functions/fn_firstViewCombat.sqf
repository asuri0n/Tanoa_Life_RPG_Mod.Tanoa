/*
	Code written by Lyeed
*/

life_combatTime = time;
if (!life_firstCombatActive) then
{
	[] spawn
	{
		life_firstCombatActive = true;
		while {(life_combatTime > (time - 30))} do
		{
			if ((cameraView == "External") && ((vehicle player) == player)) then {
				hint "Tu es a coter d'une zone de combat, vous n'avez plus acces a la 3em personne.";
				player switchCamera "Internal";
			};
			sleep 0.2;
		};
		life_firstCombatActive = false;
	};
};