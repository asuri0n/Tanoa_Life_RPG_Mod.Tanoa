/*
    File: fn_fatigueReset.sqf
    Author: Itsyuka

    Description:
    Stop the fatigue from going higher than what ever you set it to (Fucking BI Devs, shouldn't be doing this).
*/

[] spawn {
    while {true} do {
        player setFatigue 0;
        sleep 30;
    }
};