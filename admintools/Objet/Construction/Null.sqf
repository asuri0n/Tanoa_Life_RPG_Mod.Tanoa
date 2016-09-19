VarFloor = 0;
TypeObject = 0;
deleteVehicle Objet;
(FindDisplay 46) displayRemoveEventHandler ["keydown",ChangeObjetHandler] ;
removeAllActions player;
[] execVM "admintools\activate.sqf";
[] execVM "admintools\loop.sqf";