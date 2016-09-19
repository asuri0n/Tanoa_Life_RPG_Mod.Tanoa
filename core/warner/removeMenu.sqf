//ESU road barrier script
//Written by Warnerm14 http://lathanalife.enjin.com/

player removeAction placeCone;
player removeAction placeBarrier;
player removeAction removeCone;
player removeAction removeBarrier;
player removeAction cancelBarrier;
player removeAction header;

	barrierMain = player addaction [("<t color=""#3333CC"">" + ("Barriers") +"</t>"),"core\warner\barrierMenu.sqf"]; 