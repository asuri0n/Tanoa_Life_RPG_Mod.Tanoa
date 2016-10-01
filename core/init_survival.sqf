[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food =
	{
		if(life_hunger < 2) then {player setDamage 1; hint "Tu es mort de faim";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint "Tu es mort de faim";};
		switch(life_hunger) do {
			case 30: {hint "Tu n'as rien mangé depuis un bon bout de temps !";};
			case 20: {hint "Tu as des troubles, tu vas mourrir dans quelques minutes.";};
			case 10: {hint "C'est la catastrophe ! Tu n'arrives plus à marcher droit, mort dans les secondes à venir";player setFatigue 1;};
			};
		};
	};

	_fnc_water =
	{
		if(life_thirst < 2) then {player setDamage 1; hint "Tu es mort de déshydratation.";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint "Tu es mort de déshydratation.";};
			switch(life_thirst) do
			{
				case 30: {hint"Tu n'as rien bu depuis un bon bout de temps !";};
				case 20: {hint "Tu n'arrives plus à courir car tu n'as pas bu depuis un moment"; player setFatigue 1;};
				case 10: {hint "Tu n'arrives pas à marcher droit !! Bois maintenant ou tu vas mourir"; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp"];
	while{true} do
	{
		_bp = backpack player;

		[] call life_fnc_carryLoadCfg;

		waitUntil {backpack player != _bp};
	};
};


[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Ton inventaire est rempli. Tu ne peux plus courir tant que ton sac est rempli !";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};
//part of alcohol system written by [midgetgrimm]
[] spawn
{
	while {true} do
	{
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {

			if(life_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			sleep 240;
			life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			life_drink = life_drink - 0.02;
			};
		};

		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;

	};
};
[] spawn
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn
{
    while {true} do
    {
        sleep 10;
        if(life_inv_uranium2 != 0) then {
            player forceWalk true;
            player setFatigue 1;
            hint "Tu es un faible ! Tu peux plus courir avec de l'uranium dans le sac";
        } else {
            if(isForcedWalk player) then {
                player forceWalk false;
            };
        };
    };
};
[] spawn
{
    while {true} do
    {
        private["_damage"];
        sleep 5;
        while {((player distance (getMarkerPos "uranium_area") < 150) && (player getVariable["Revive",TRUE]))} do
        {
            if(uniform player != "U_C_Scientist") then
            {
                hint "<!><!> Sort ou tu vas mourir <!><!>";
                _damage = damage player;
                _damage = _damage + 0.2;
                player setDamage (_damage);
                [] call life_fnc_hudUpdate;
                sleep 10;
            };
        };
    };
};

[] spawn
{
    private["_illegalmarkers"];
	_illegalmarkers = ["cocaine_1","cocaine_area","trait_pavot"]; // Héroine
	_illegalmarkers = _illegalmarkers + ["heroine_1","heroine_area","trait_coca"]; // Cocaine
	_illegalmarkers = _illegalmarkers + ["marijuana_1","marijuana_area","trait_marijuana"]; // Majiruana
	_illegalmarkers = _illegalmarkers + ["Vend_archeologie","archeologie_1","turle_dealer_1"]; // Ossements
	_illegalmarkers = _illegalmarkers + ["morgue","organ_trait"]; // Organs
	_illegalmarkers = _illegalmarkers + ["uranium_1","uranium_area","uranium_2","uranium_3","uranium_4","uranium_5","uranium_6"]; // Uranium
	_illegalmarkers = _illegalmarkers + ["dealer_1","dealer_ura","dealer_2","dealer_organ"]; // Dealers
	_illegalmarkers = _illegalmarkers + ["marker_rebel","marker_gangster"]; // Camp rebelle

	if (playerSide == west) then {
		{ deleteMarkerLocal _x; } forEach _illegalmarkers;
	};
};
// delete animals when far from hunting zone
/*
[] spawn {
	while {true} do {
    	private["_agents"];
    	_agents = 0;
		{
			if (!(isNull agent _x) && ((agent _x isKindOf "Snake_random_F") || (agent _x isKindOf "Rabbit_F"))) then {
				deleteVehicle agent _x;
			};
		}forEach agents;
		diag_log format ["Agents supprimé(s) %1",_agents];
		sleep 30;
	};
};
*/

// change les panneaux de pub toutes les 5 min
/*
[] spawn {
	while {true} do {
		_pubs = [
			//"HLTextures\divers\pub\hlnews.paa"
		];
		_boards = [
			//pub1
		];
		{
			_pub = selectRandom _pubs;
			_x setObjectTexture [0,_pub];
		} foreach _boards;
		sleep (5*60);
	};
};
*/

// obliger TFAR
/* TO DO : optimize
[] spawn
{
	while {true} do
	{
		_server = [] call TFAR_fnc_getTeamSpeakServerName;
		_channel = [] call TFAR_fnc_getTeamSpeakChannelName;

		if(_server != "Vacation Gaming TS" || _channel != "SALON TFR") then {
			player enableSimulation false;
			cutText["Mauvaise présence dans le canal Task Force Radio ...","BLACK",0,true];
			sleep 5;
		} else {
			player enableSimulation true;
			cutText["","PLAIN"];
			sleep 7;
		};
	};
};
*/