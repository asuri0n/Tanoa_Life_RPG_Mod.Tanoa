//ESU road barrier script
//Written by Warnerm14 http://lathanalife.enjin.com/

_list = position player nearObjects ["RoadCone_F", 1];
_cone = (_list select 0);
deleteVehicle _cone;