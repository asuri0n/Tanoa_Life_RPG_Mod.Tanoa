//ESU road barrier script
//Written by Warnerm14 http://lathanalife.enjin.com/

_pos = position player;
_barrier = "RoadBarrier_F" createVehicle ([0,0,0]);
_dir = getDir player;
_barrier setpos _pos;
_barrier setDir _dir;
