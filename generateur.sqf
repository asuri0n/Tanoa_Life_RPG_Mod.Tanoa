private ["_object","_player","_id"];
//On prend les arguments
_object = _this select 0;
_player = _this select 1;
_id = _this select 2;


//s?quence d'animation:
_player playMove "DismountOptic";
sleep 3.0;
waitUntil {animationState _player != "DismountOptic"};
_player playMove "DismountOptic";
sleep 3.0;
waitUntil {animationState _player != "DismountOptic"};

//Petit message pour tous:
hint"Le generateur de secours a été allumé ";

//Ici placer scripts pour ?teindre les lumi?res: ATTENTION au probl?me de localit? avec le addaction et le multijoueur (en solo pas de souci)
 /*
 Pour
 */

[["ON"],"life_fnc_cutOffLightsBorder",true,false] spawn life_fnc_MP;