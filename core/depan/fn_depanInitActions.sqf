/*
	File: fn_depanInitActions.sqf
	Author: 

	Description:
	Loads the depan out with the default gear.
*/

player addAction ["<t color='#B40404'>Dépaneuse : Attacher</t>",{[] spawn fnc_DepaneuseR}
,0,0,true,true,'','(vehicle player) == player && count (nearestObjects [player, ["B_Truck_01_mover_F"], 15]) > 0 && (cursorTarget isKindOf "CAR" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && typeOf cursorTarget != "B_Truck_01_mover_F" && (count attachedObjects ((nearestObjects [player, ["B_Truck_01_mover_F"], 15]) select 0) == 0)'];

player addAction ["<t color='#0F3F99'>Dépaneuse : Détacher</t>",{[] spawn fnc_DepaneuseD},0,0,true,true,'','(vehicle player) == player && count (nearestObjects [player, ["B_Truck_01_mover_F"], 15]) > 0 && (cursorTarget isKindOf "CAR" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && typeOf cursorTarget != "B_Truck_01_mover_F" && !isNull attachedTo cursorTarget'];

/*
player addAction ["Dépaneuse : Impound",{[cursorTarget] spawn life_fnc_impoundAction},0,0,true,true,'','(vehicle player) == player && (cursorTarget isKindOf "CAR" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship")']; */


if (isNil {fnc_DepaneuseR}) Then {
	fnc_DepaneuseR = {
			_depanneuse = (nearestObjects [player, ["B_Truck_01_mover_F"], 15]) select 0;
			//Komodo: pour une raison inconnue, nearestObjects sur ce type retourne aussi les cargaison et fuel...
			_depanneuseList = (nearestObjects [player, ["LandVehicle"], 15]);
			{
				if (typeOf _x == "B_Truck_01_mover_F") exitWith {_depanneuse = _x;};
			} forEach _depanneuseList;
			_veh = cursorTarget;
			_vehtype = typeOf cursorTarget;
			_dir = sqrt((direction _depanneuse - direction _veh)^2);
			if ((player distance _veh) < 5 && _dir < 12) then        {
							hint "Remorquage du véhicule ...";
							player playMove "AinvPknlMstpSlayWrflDnon_healed";
							sleep 11;
							switch (_vehtype) do
							{
								case "C_Offroad_01_F" :
								{
									//réduire d'un peu moins de moitié le x et redescendre de pas grand chose en y
									//_veh attachTo [_depanneuse,[0.1,-2.5,1.23]];
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "B_Quadbike_01_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5.5,0]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_Offroad_01_repair_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_Hatchback_01_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.30]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_Hatchback_01_sport_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.30]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_SUV_01_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_Van_01_box_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.60]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_Van_01_transport_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.60]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "C_Van_01_fuel_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.60]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};

								case "B_MRAP_01_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-7,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									//_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "I_Truck_02_covered_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-9,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									//_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "I_Truck_02_transport_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-9,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									//_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};

								case "I_MRAP_03_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};

								case "O_MRAP_02_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-7,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								/*
								case "B_Truck_01_mover_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								*/
								case "O_Truck_02_covered_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-9,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									//_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "O_Truck_02_Ammo_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-9,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									//_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								/*
								case "B_Truck_01_fuel_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								case "B_Truck_01_box_F" :
								{
									_veh attachTo [_depanneuse,[0.1,-5,0.40]];
									//[[0,0.66,-0.33],[0,0.33,0.66]];
									_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
									hint "Le véhicule est en place !";
								};
								*/
								default
								{
									_veh attachTo [_depanneuse,[0.1,-9,0.40]];
									hint "Le véhicule est en place !";
								};
							};
					} else {hint "Le véhicule est trop loin ou n'est pas aligné !"};
	};

	fnc_DepaneuseD = {
			_depanneuse = (nearestObjects [player, ["B_Truck_01_mover_F"], 15]) select 0;
			//Komodo: pour une raison inconnue, nearestObjects sur ce type retourne aussi les cargaison et fuel...
			_depanneuseList = (nearestObjects [player, ["LandVehicle"], 15]);
			{
				if (typeOf _x == "B_Truck_01_mover_F") exitWith {_depanneuse = _x;};
			} forEach _depanneuseList;
			_veh = (attachedObjects  _depanneuse) select 0;
			_vehtype = typeOf _veh;
		switch (_vehtype) do
		{
			case "C_Offroad_01_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "B_Quadbike_01_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_Offroad_01_repair_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_Hatchback_01_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_Hatchback_01_sport_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_SUV_01_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_Van_01_box_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_Van_01_transport_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "C_Van_01_fuel_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};
			case "I_MRAP_03_F" :
			{
				hint "Détachement du véhicule...";
				player playMove "AinvPknlMstpSlayWrflDnon_healed";
				sleep 7;
				_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.9]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,0.3]];
				sleep 2;
				_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
				/*
				if (_veh isKindOf "Truck_F") Then {
				_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
				};*/
				_veh setvectorup [0,0,1];
				sleep 0.5;
				detach _veh;
			};

			default
			{
				sleep 5;
				detach _veh;
			};
		};
	};
};