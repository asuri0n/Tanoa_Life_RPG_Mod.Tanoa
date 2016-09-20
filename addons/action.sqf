private ["_object","_player","_id"];

//On prend les arguments
_object = _this select 0;
_player = _this select 1;
_id = _this select 2;


//On lance la petite séquence d'animation:
_player playMove "DismountOptic";
sleep 3.0;
waitUntil {animationState _player != "DismountOptic"};
_player playMove "DismountOptic";
sleep 3.0;
waitUntil {animationState _player != "DismountOptic"};
	_player playMove "DismountOptic";
sleep 3.0;
waitUntil {animationState _player != "DismountOptic"};
_player playMove "DismountOptic";
sleep 3.0;
waitUntil {animationState _player != "DismountOptic"};

//Petit message pour tous:
hint"Le transformateur est hors-service";

//Ici placer scripts pour éteindre les lumières: ATTENTION au problème de localité avec le addaction et le multijoueur (en solo pas de souci)

[["OFF"],"life_fnc_cutOffLightsBorder",true,false] spawn life_fnc_MP;