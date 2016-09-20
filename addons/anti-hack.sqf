waituntil {alive player};
	while {alive player} do
	{
		diag_log "DISPLAY_HACK_BLOOPIS ||||||  START ALIVE";
		//special anti-hack for Script kiddies ;)
		WaitUntil {!isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 0)) || !isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 1)) || (!isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 2)) && !isNil (DISPLAY_HACK_BLOOPIS select 3))};
		[] call life_fnc_antiHackAction;
		WaitUntil {isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 0)) || isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 1)) || (!isnull (findDisplay (DISPLAY_HACK_BLOOPIS select 2)) && !isNil (DISPLAY_HACK_BLOOPIS select 3))};
		diag_log "DISPLAY_HACK_BLOOPIS ||||||  END IS ALIVE";
	};
waituntil {alive player};		
diag_log "DISPLAY_HACK_BLOOPIS ||||||  START NEW ANTIHACK";
[] execVM "anti-hack.sqf";