_object = _this;

_type = typeOf _object;

x_reload_time_factor = 10.00;

_object setVehicleAmmo 1;

_object vehicleChat format ["Entretien de l'armement en cours %1... Merci de ne pas bouger...", _type];

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			_object vehicleChat format ["Rechargement %1", _x];
			sleep x_reload_time_factor;
			_object addMagazine _x;
			sleep x_reload_time_factor;
		} forEach _magazines;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_object vehicleChat format ["Rechargement %1", _x];
					sleep x_reload_time_factor;
					_object addMagazine _x;
					sleep x_reload_time_factor;
				} forEach _magazines;
			};
		};
	};
};
_object setVehicleAmmo 1;	// Reload turrets / drivers magazine

_object vehicleChat format ["%1 est prêt ... Vous pouvez partir.", _type];

if (true) exitWith {};
