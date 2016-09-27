//<MAP ESP>
#include <macro.h>
if(!invo_godmod) exitwith {};
[[format["%1 a activer l'ESP",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
if (__GETC__(life_adminlevel) != 0) then {
	/*marker_mapesp = true;
	//Alle Vehicle
	list_vec = (allMissionObjects "Plane")+(allMissionObjects "LandVehicle")+(allMissionObjects "Helicopter")+(allMissionObjects "Ship");
	//<-----GLOBAL-VARIABLE----->

	//hint "Adding Markers on the map";

	while {marker_mapesp} do
	{
		//<-----PLAYER-MARKER----->
		//<----------------------->
		//<-----PLAYER-MARKER----->
		unitList_player = playableUnits; //getting all units
		totalunits = count unitList_player;
		//hint format["%1", totalunits];

		o = 0;
		yo = 0;

		for "o" from 0 to totalunits do
		{
		   // actualunit = unitList_player select o; //Player1
		   // hint format["%1", unitList_player];
		   // sleep 10;

			if ((isPlayer (unitList_player select o)) && (alive (unitList_player select o))) then
			{
				deleteMarkerLocal ("Player" + (str o));
				yo = o + 1;
				deleteMarkerLocal ("Player" + (str yo));

				namePlayer = "";
				namePlayer = name (unitList_player select o);

				mark_player = "Player" + (str o); //Player0, Player1, Player2
				mark_player = createMarkerLocal [mark_player,getPos (unitList_player select o)];
				mark_player setMarkerTypeLocal "waypoint";
				mark_player setMarkerPosLocal (getPos (unitList_player select o));
				mark_player setMarkerColorLocal "ColorBlue";
				mark_player setMarkerTextLocal format ["%1",namePlayer];
			};
		};
		//bit of sleep
		sleep 0.1;
	};

	k = 0;
	for "k" from 0 to 2000 do
	{
		deleteMarkerLocal ("Player"+ (str k));
		deleteMarkerLocal ("Vehicle"+ (str k));
	};*/
    //onEachFrame {

    life_ESP = true;				//fix ladislas

    while{true} do
    {
    	if(!life_ESP) exitwith{};	//fix ladislas
    	sleep 0.01;					//fix ladislas
        //_l49 = nearestobjects[player, ["CAManBase"], 1400];
        yo = 0;
        o = 0;
        {
            if ((player != _x) && (vehicle _x != _x) && (alive _x) && ((player distance _x) <= 3000)) then {//player in vehicle
                drawIcon3D["", [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1 m", round(player distance _x), name (driver  _x)]), 1, 0.04, "TahomaB"]
            } else {
                if ((player != _x) && (alive _x) && ((player distance _x) <= 3000)) then {//player
                	if(((player distance _x) <= 500)) then {
                    	drawIcon3D["", [0.267,0.757,0.204,1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1 m", round(player distance _x), name _x]), 1, 0.04, "TahomaB"]
                    } else {
                    	drawIcon3D["", [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format["%2 : %1 m", round(player distance _x), name _x]), 1, 0.04, "TahomaB"]
                	};
                };
            };

	        if ((isPlayer _x) && (alive _x)) then
			{
				deleteMarkerLocal ("Player" + (str o));
				yo = o + 1;
				deleteMarkerLocal ("Player" + (str yo));

				namePlayer = "";
				namePlayer = name _x;

				mark_player = "Player" + (str o); //Player0, Player1, Player2
				mark_player = createMarkerLocal [mark_player,(getPos _x)];
				mark_player setMarkerTypeLocal "waypoint";
				mark_player setMarkerPosLocal (getPos _x);
				mark_player setMarkerColorLocal "ColorBlue";
				mark_player setMarkerTextLocal format ["%1",namePlayer];
				o = o +1;
			};
        }foreach playableUnits;
    };
};
