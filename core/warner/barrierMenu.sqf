//ESU road barrier script
//Written by Warnerm14 http://lathanalife.enjin.com/

	header = player addaction [("<t color=""#FF3300"">" + ("### Barriers ###") +"</t>"),""]; 
	placeCone = player addaction ["Placer Plot","core\warner\deployCone.sqf"]; 
	placeBarrier = player addaction ["Placer Barriere","core\warner\deployBarrier.sqf"]; 
	removeCone = player addaction ["Supprimer Plot","core\warner\removeCone.sqf"]; 
	removeBarrier = player addaction ["Supprimer Barriere","core\warner\removeBarrier.sqf"]; 
	cancelBarrier = player addaction [("<t color=""#FF3300"">" + ("### Cancel ###") +"</t>"),"core\warner\removeMenu.sqf"];
		
	player removeAction barrierMain;
