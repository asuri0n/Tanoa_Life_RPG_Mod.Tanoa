_Dog = createAgent ["Goat_random_F", position player, [], 0, "FORM"];
	_cycle = 0; 
	while {alive _Dog} do 
		{ 
		_Dog moveTo (getPos player);
		_cycle = _cycle+1; 
		sleep 1; 									
		};

if (!alive _Dog) exitWith {};