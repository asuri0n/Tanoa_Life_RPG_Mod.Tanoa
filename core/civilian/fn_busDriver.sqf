/*
    File: fn_busDriver.sqf
    Author: Ladislas with Komodo
    Date : 04/10/2014

    Description:
    Develop. Bus Driver job with automatic

    https://community.bistudio.com/wiki/DIK_KeyCodes
*/
private ["_vehicle","_playersInVehicule","_nbPlayersIn","_posOrigin","_distanceAparcourir","_distance","_prixM","_upp","_ui","_progress","_pgText","_cP","_nbPlayerOut","_remun","_salaire","_strPlayerInVhl","_tmp"];

if (!license_civ_busDriver) exitWith {};

if(((typeOf vehicle player == "RDS_Ikarus_Civ_01") || (typeOf vehicle player =="RDS_Ikarus_Civ_02") || (typeOf vehicle player =="Invo_RDS_Bus"))) then
{

	_enService = false;
	if(player in invo_busDrivers) then
	{
		_enService = true;
	};

	if (license_civ_rebel) exitWith {hint "Tu as la licence rebelle, ce métier est interdit mais tu peux quand même conduire le bus";};
	if(!_enService) exitWith {hint "Tu n'as pas déclaré ton service donc tu ne sera pas payé pour tes voyages. Va déclarer ton activité avant à l'aide de la licence transport de personne et de l'activation via le PNJ !";};

	_vehicle = vehicle player;

	if(player == driver _vehicle) then {hint "Vous avez commencé votre tournée";};

	while {true} do
	{
		if (!alive player OR isNull _vehicle OR !alive _vehicle OR player != driver _vehicle) exitWith {hint "Tu n'es plus conducteur du bus, donc plus de salaire !";};

		_playersInVehicule = crew _vehicle;

		_strPlayerInVhl = format["Dans ton bus il y a : <br/>"];

		{
			_tmp = format["<t color='#BC1B1B'> %1 </t> <br/>", _x getVariable["realname",name _x]];
			_strPlayerInVhl = _strPlayerInVhl + _tmp;
		} forEach _playersInVehicule;

		hintSilent parseText _strPlayerInVhl;													//affiche les joueurs présents dans le bus (pour contrôler) : BETA

		_nbPlayersIn = count _playersInVehicule;  								//Komodo: il faudra enlever le conducteur!
		_posOrigin = getPos player;
		_distanceAparcourir = 200;												//distance en metre à parcourir pour toucher le salaire associe. Faudrait plutôt mettre une valeur assez basse pour tenir compte au mieux de la distance réellement parcourue.
		_distance = 0;
		_prixM = 2; 															//prix en euros par metre parcouru

		disableSerialization;													//Komodo progressBar fcn distance
		5 cutRsc ["life_progress","PLAIN"];
		_upp = "distance à parcourir : 200m";
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%1",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while {true} do
		{			//tant que la distance parcourue est inferieure a la distance a parcourir
			if (!alive player OR isNull _vehicle OR !alive _vehicle) exitWith {};
			if (_distance > _distanceAparcourir) exitWith {};
			if (vehicle player == player) exitWith {};			//Si le joueur sort du véhicule, on sort de la boucle.
			sleep 0.5;
			_distance = _posOrigin distance player;								//distance entre la position origine et la nouvelle position
			_cP = _distance / _distanceAparcourir;
			_progress progressSetPosition _cP;

		};

		5 cutText ["","PLAIN"]; 												//supprimer la barre de progression
		if (vehicle player == player) exitWith {hint "N'oublie pas que maintenant que tu as déclaré ton activité, des personnes peuvent t'appeller donc si tu reçoit un SMS n'hésites pas à répondre à cette personne !";};
		if (!alive player OR isNull _vehicle OR !alive _vehicle) exitWith {};	//Condition souvent répétée pour s'assurer qu'en cas de décès on sorte bien de la deuxième boucle.

		_nbPlayerOut = count crew _vehicle;
		if(_nbPlayerOut >= _nbPlayersIn) then {_remun = _nbPlayersIn;}
		else {_remun = _nbPlayerOut;};

		_salaire = _remun * _distanceAparcourir * _prixM;
		life_dabliquide = life_dabliquide + _salaire; 				//salaire pour x metres
		["busDriver", true, _salaire] call life_fnc_antiCheatCash;  //Komodo: mon système anti-cheat, à appeller systématiquement si tu modifies life_dabliquide ou life_liquide
		hint format["Vous avez parcouru %1m avec vous et %2 passager(s), vous gagnez donc $%3",_distanceAparcourir,_remun - 1,_salaire];
	};
};