SortByDistance = {
    Private["_current","_nearest","_nearestDistance","_object","_objects","_sorted"];

    _object = _this select 0;
    _objects = +(_this select 1);

    _sorted = [];
    for '_i' from 0 to count(_objects)-1 do {
        _nearest = ObjNull;
        _nearestDistance = 5000;

        for '_j' from count(_objects)-1 to 0 step -1 do {
            _current = _objects select _j;
            _distance = _current distance _object;
            if (_distance < _nearestDistance) then {_nearest = _current;_nearestDistance = _distance};
        };

        _sorted = _sorted + [_nearest];
        _objects = _objects - [_nearest];
    };

    _sorted
};


detach BoiteChiens; 
player removeAction ActionBoiteChiens;
PauserObjet = 0;
LacherChien = 0;
BoiteChiens = "Land_CratesWooden_F" createVehicle (position player);
BoiteChiens setDir _DirPlayer;

_bbr = boundingBoxReal BoiteChiens; 
_p1 = _bbr select 0; 
_p2 = _bbr select 1;
 _maxWidth = abs ((_p2 select 0) - (_p1 select 0)); 
 _maxLength = abs ((_p2 select 1) - (_p1 select 1)); 
 _maxHeight = abs ((_p2 select 2) - (_p1 select 2));
BoiteChiens allowDamage false; 
BoiteChiens attachTo [player,[0,_maxLength + 1 ,_maxHeight / 2]];
ActionBoiteChiens = player addaction ["Pauser",{PauserObjet = 1}];

waituntil {PauserObjet ==1};
detach BoiteChiens;
player removeAction ActionBoiteChiens;
ActionHorde = player addaction ["Lacher les chiens",{LacherChien = 1}];

waituntil {LacherChien ==1};
player removeAction ActionHorde;

_nbrChien = 20;														// Nombre de lapins
Rayon = 20;





for [{_i=0},{_i<_nbrChien},{_i=_i+1}] do
{ 
[] spawn 
	{ 
	_group1 = createGroup civ;
	_Dog = createAgent ["Alsatian_Random_F", getPos BoiteChiens, [], 0, "FORM"]; // Alsatian_Sandblack_F pour un chien
	//_rabbit disableAI "FSM";
	while {alive _Dog} do 
		{ 
			//--- Determine the players if MP, else use player itself.
			_units = [player];
			if (isMultiplayer) then {
				_units = [];
				{if (isPlayer _x) then {_units = _units + [_x]}} forEach playableUnits;
			};
			
			//--- civxyz can be replaced by the center (your civilian for instance).
			_sorted = [_Dog, _units] Call SortByDistance;

			//--- The array return units by order, in our case, we want the closest one.
			_closest = _sorted select 0;
//hint format ["%1",_closest];
			//--- Move the civilian to the position of the closest player.
			_Dog moveTo (getPos _closest);  
			
			if (_Dog distance _closest < 2) then							
			{
				_cible = _closest;
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
		sleep 0.5; 										// Fréquence des dégats en secondes
		};
	}; 
	sleep 0.3;											//delai de spawn
};
//if (LacherChien == 1) exitWith {detach BoiteChiens; player removeAction ActionBoiteChiens};
//if (_i>= _nbrChien) exitWith {};