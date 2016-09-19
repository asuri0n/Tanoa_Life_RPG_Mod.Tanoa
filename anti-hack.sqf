/*waituntil {alive player};
	while {alive player} do
	{
	//special anti-hack for Script kiddies ;)
		WaitUntil {!isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 0)) || !isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 1)) || (!isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 2)) && !isNil (DISPLAY_HACK_BLOOPIS select 3))};
		[] call life_fnc_antiHackAction;
		WaitUntil {isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 0)) || isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 1)) || (!isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 2)) && !isNil (DISPLAY_HACK_BLOOPIS select 3))};
	};
waituntil {alive player};
[] execVM "anti-hack.sqf";*/