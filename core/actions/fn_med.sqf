//<MAP ESP>
#include <macro.h>



    k = 0;
    for "k" from 0 to 2000 do
    {
        deleteMarkerLocal ("Player"+ (str k));
        deleteMarkerLocal ("Vehicle"+ (str k));
    };

    onEachFrame {
                nil
    };

    onEachFrame {
        //_l49 = nearestobjects[player, ["CAManBase"], 1400];
        yo = 0;
        o = 0;
        {
            if ((isPlayer _x) && (_x getvariable["FAR_isUnconscious",0] == 1)) then
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

