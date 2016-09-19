// Dog IA by Ideo

_DogRace = "Alsatian_Random_F";

ScriptStop = "admintools\event\Animals\DogAction\Stop.sqf";
ScriptFollow = "admintools\event\Animals\DogAction\Follow.sqf";
ScriptAttack = "admintools\event\Animals\DogAction\Attack.sqf";
ScriptCall = "admintools\event\Animals\DogAction\Call.sqf";
stopDog = 0;
DogAttack = 0;
posDog = player;
_Dog = createAgent [_DogRace, position player, [], 0, "FORM"];
_DogmenuStop = player addaction ["<t color='#FF9955'>Stopper chien</t>",ScriptStop,""];
_DogmenuCall =  player addaction ["<t color='#FF9955'>Sifler chien</t>",ScriptCall,""];
_DogmenuAttack =  player addaction ["<t color='#FF9955'>Attaquer cible</t>",ScriptAttack,""];

	while {alive _Dog} do 
	{ 
		if (stopDog == 0 ) then 
		{
			_Dog enableAI "MOVE";
			_Dog moveTo (getPos posDog);	
			_Dog forceSpeed -1;
			if (posDog != player ) then 
			{
			_Dog forceSpeed 60;
			};
		
			if (_Dog distance posDog < 4 && posDog != player) then							
			{
				_cible = posDog;
				posDog = player;			
				_aDir = [_Dog, _cible] call BIS_fnc_dirTo;
				_Dog setDir _aDir;
				_cible setVelocity [sin _aDir * 10, cos _aDir *10 ,1]; 	
				titleText[format["Le chien a choppé la cible"],"PLAIN"];
				_cible playMoveNow "Incapacitated";
				_cible setDamage (damage _cible + 0.1);	
				_cible sethit ["legs", 1];
				_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _cible);
				_obj setPosATL (getPosATL _cible);
				_cible attachTo [_obj,[0,0,0]];
				sleep 5;
				_cible playMoveNow "amovppnemstpsraswrfldnon";
				detach _cible;
				deleteVehicle _obj;
				_cible = 0;

			}; 			
		};
		
		if (stopDog == 1 ) then 
		{
		_Dog forceSpeed 0;
		};
		sleep 1; 
	};
								

if (!alive _Dog) exitWith {player removeAction _DogmenuAttack, player removeAction _DogmenuCall, player removeAction _DogmenuStop};