/*
	File: fn_activateFrini.sqf
	Author: Bloopis
	Date : 05/11/2014

	Description:
	Activate drawing message to each client
	For new player (just connected) we must create a loop each 1 minutes who draw again message

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
private["_players","_val","_players2"];
_text= parseText"<t size='1.8'color='#FEFEFE'>Breaking news - Intervention militaire sur l'île rebelle</t><br/><t color='#FFFF00'>Veuillez quitter la ville ou obtempérer. Toute menace sera abattue sans sommation.</t>";
_scroll = parseText"<t size='1.2'color='#FE0000'> - Rentrée : les fabricants de sacs scolaires trouvent les enfants trop faibles.</t><t size='1.2'color='#FE0000'> - Le conseil d'Etat valide les arrêtés municipaux contre ceux qui portent des chaussettes avec leurs sandales</t><t size='1.2'color='#FE0000'> - Tir à la carabine : il repart avec le gros lot après avoir tiré sur le patron du stand.</t><t size='1.2'color='#FE0000'> - Fort Boyard : Un candidat oublié dans la cellule d'une épreuve retrouvé 7 ans plus tard.</t><t size='1.2'color='#FE0000'> - Manuel Valls surprit sous sa douche en burkini « Je voulais savoir ce qu’on ressentait en le portant »"". </t>";
_lock = true;
life_stopRedCode = false;
_players = [];
_val = 0;

While { _lock } do {
	if(!life_stopRedCode) then {
		//first launch
		if(_val == 0) then {[[_text,_scroll],"life_fnc_msgDraw",true,false] spawn BIS_fnc_mp;_players = playableUnits;};

		//security -> no spam if 0 players in server
		if((count playableUnits == 0) && (_val != 0)) then {_lock = false;};

		//we check new players entities
		if((count playableUnits != 0) && (_val != 0)) then {_players2 = [];{if(alive _x) then {_players2 pushBack _x;};}forEach playableUnits;_players = _players2 - _players;if(count _players > 0) then {{[[_text,_scroll],"life_fnc_msgDraw",_x,false] spawn BIS_fnc_mp;}forEach _players;};_players = _players2;};
	}
	else{
		_lock = false;
	};
	_val = _val + 1;
	sleep 30;//we wait 30 seconds to advertising new players who just connected (no spawn server)
};

/*private["_players","_val","_players2"];
_text= parseText"<t size='1.8'color='#FEFEFE'>Breaking news - Intervention militaire sur l'île rebelle</t><br/><t color='#FFFF00'>Veuillez quitter la ville ou obtempérer. Toute menace sera abattue sans sommation.</t>";
_scroll = parseText"<t size='1.2'color='#FE0000'> - Rentrée : les fabricants de sacs scolaires trouvent les enfants trop faibles.</t><t size='1.2'color='#FE0000'> - Le conseil d'Etat valide les arrêtés municipaux contre ceux qui portent des chaussettes avec leurs sandales</t><t size='1.2'color='#FE0000'> - Tir à la carabine : il repart avec le gros lot après avoir tiré sur le patron du stand.</t><t size='1.2'color='#FE0000'> - Fort Boyard : Un candidat oublié dans la cellule d'une épreuve retrouvé 7 ans plus tard.</t><t size='1.2'color='#FE0000'> - Manuel Valls surprit sous sa douche en burkini « Je voulais savoir ce qu’on ressentait en le portant ».</t><t size='1.2'color='#FE0000'> - Le DRH Adjoint d’Air France forcé par des grévistes à manger un plateau repas de la compagnie"". </t>";
_lock = true;
player setVariable["stopRedCode",false,true];
_players = [];
_val = 0;

While { _lock } do {
	if(!(player getVariable["stopRedCode",false])) then {
		//first launch
		if(_val == 0) then {[[_text,_scroll],"life_fnc_msgDraw",true,false] spawn BIS_fnc_mp;_players = playableUnits;};

		//security -> no spam if 0 players in server
		if((count playableUnits == 0) && (_val != 0)) then {_lock = false;};

		//we check new players entities
		if((count playableUnits != 0) && (_val != 0)) then {_players2 = [];{if(alive _x) then {_players2 set[count _players2,_x]};}forEach playableUnits;_players = _players2 - _players;if(count _players > 0) then {{[[_text,_scroll],"life_fnc_msgDraw",_x,false] spawn BIS_fnc_mp;}forEach _players;};_players = _players2;};
	}
	else{
		_lock = false;
	};
	_val = _val + 1;
	sleep 30;//we wait 30 seconds to advertising new players who just connected (no spawn server)
};*/