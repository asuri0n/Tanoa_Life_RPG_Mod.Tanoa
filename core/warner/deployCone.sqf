//ESU road barrier script
//Written by Warnerm14 http://lathanalife.enjin.com/

_pos = position player;
_cone = "RoadCone_F" createVehicle ([0,0,0]);
_dir = getDir player;
_cone setpos _pos;
_cone setDir _dir;