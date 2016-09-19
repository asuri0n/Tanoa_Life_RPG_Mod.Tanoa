/*
    File: fn_jeuBlackjack.sqf
    Author: Ladislas
    Date : 10/10/2014

    Description:
    Jeu de BlackJack

    https://community.bistudio.com/wiki/DIK_KeyCodes
*/

private ["_valeur","_couleur","_val","_jeuDeCarteAff","_jeuDeCarteVal","_nbCarte","_pointJoueur","_pointBanque","_i",
"_j","_carte","_finTour","_nbRand","_cartePioche","_valPioche","_tourJ","_pointBanque","_pointJoueur","_action","_mise","_k"];

_valeur = ["As", "Deux", "Trois", "Quatre", "Cinq", "Six", "Sept", "Huit", "Neuf", "Dix", "Valet", "Dame", "Roi"];
_couleur = ["Pique", "Carreau", "Coeur", "Trefle"];
_val = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];

_nbCarte = 52 - 1;
_mise = 100;

_pointJoueur = 0;
_pointBanque = 0;

_tourJ = true; //c'est le tour du joueur

//initialisation du jeu de carte
_i = 0;
_j = 0;

_jeuDeCarteAff = [];
_jeuDeCarteVal = [];

while{true} do
{
	while{true} do
	{
		_carte = format["%1 de %2", _valeur select _j, _couleur select _i];
		_jeuDeCarteAff pushBack _carte;
		_jeuDeCarteVal pushBack (_val select _j);
		if(_j == 12) exitwith{};
		_j = _j + 1;
	};
	if(_i == 3) exitwith{};
	_j = 0;
	_i = _i + 1;
};

_k = 0;
while{true} do
{
	if(_k == count _jeuDeCarteAff) exitwith{};
	_k = _k + 1;
};
//paquet de carte initialisé
hint "le jeu est fait et mélangé !";

//On fait choisir la mise au joueur
//! LA MISE EST CHOISIE AU DEBUT !!//
//Le croupier propose une carte au joueur et retire la carte du paquet

while{true} do
{
	_nbRand = round random _nbCarte; //carte de 0 à 51 (52 -1 pour cpt le 0)
	_cartePioche = _jeuDeCarteAff select _nbRand;
	_valPioche = _jeuDeCarteVal select _nbRand;

	if(_cartePioche == "As de Pique" OR _cartePioche == "As de Carreau" OR _cartePioche == "As de Coeur" OR _cartePioche == "As de Trefle") then
	{
		if(_tourJ) then
		{
			_action = [
			format["Vous avez pioché la carte %1, pour vous, elle vaut 1 ou 11 ?",_cartePioche],
			"Que faire...",
			"Elle vaut 1",
			"Elle vaut 11"
			] call BIS_fnc_guiMessage;

			if(_action) then {_valPioche = 1;}
			else {_valPioche = 11;};
		}
		else
		{
			if(_pointBanque <= 10) then {_valPioche = 11;}
			else {_valPioche = 1;};
		};
	};

	_nbCarte = _nbCarte - 1;
	_jeuDeCarteAff set [_nbRand, "delete"];
	_jeuDeCarteAff = _jeuDeCarteAff - ["delete"];
	_jeuDeCarteVal set [_nbRand, "delete"];
	_jeuDeCarteVal = _jeuDeCarteVal - ["delete"];

	_k = 0;

	if(_tourJ) then
	{
		_pointJoueur = _pointJoueur + _valPioche;
		hint format ["Vous avez pioché la carte %1, de valeur %2, vous êtes à %3 points", _cartePioche, _valpioche, _pointJoueur];
	}
	else
	{
		_pointBanque = _pointBanque + _valPioche;
		hint format ["La banque a pioché la carte %1, de valeur %2, elle en est à %3 points", _cartePioche, _valpioche, _pointBanque];
		sleep 2;
	};

	if((_pointBanque > 21) OR (_pointJoueur == 21)) exitwith
	{
		[
			format["Good Game ! Vous gagnez car vous avez %1 alors que la banque a %2 !",_pointJoueur,_pointBanque],
			"Well Done !",
			true,
			""
		] call BIS_fnc_guiMessage;
	};

	if(((!_tourJ) && (_pointBanque > _pointJoueur)) OR (_pointJoueur > 21) OR (_pointBanque == 21)) exitwith
	{
		[
			format["Dommage ! La banque gagne car elle à %1 et vous avez %2",_pointBanque,_pointJoueur],
			"Dommage..",
			true,
			""
		] call BIS_fnc_guiMessage;
	};

	_action = false;

	if(_tourJ) then
	{
		_action = [
			format["Vous avez pioché la carte %1, vous avez donc %2 points et la banque est à %3, que faites-vous ?",_cartePioche,_pointJoueur,_pointBanque],
			"Que faire...",
			"Carte !",
			"je reste"
			  ] call BIS_fnc_guiMessage;
	};

	if(_action) then
	{
	_tourJ = true;
	}
	else
	{
	_tourJ = false;
	};
};




