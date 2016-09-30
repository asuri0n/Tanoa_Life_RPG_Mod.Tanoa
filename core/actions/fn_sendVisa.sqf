/*
	File: sendVisa.sqf
	Author: Nathan
	Description: Initialise et envoi les données recu par le dialog
*/
private["_value","_dialog","_sexeCombo","_name","_nationalite","_sexe","_age"];
disableSerialization; //Obligé, mais pourquoi ?

_value = [_this,0,0,[0]] call BIS_fnc_param; // first parameter
_dialog = findDisplay 8000; // Id of the dialog window
_sexeCombo = _dialog displayCtrl 8001; //id of the combo in the _dialog
_name = _dialog displayCtrl 8003; //id of the name
lbClear _sexeCombo; // késako ?

//hint format ["_value %1",_value]; // DEBUG

// init
if(_value == 0) then {
	_sexeCombo lbAdd format["Homme"];
	_sexeCombo lbSetData [0,"h"];
	_sexeCombo lbAdd format["Femme"];
	_sexeCombo lbSetData [1,"f"];
	lbSort [_sexeCombo, "ASC"];
	_name ctrlSetText profileName;

	hintSilent parseText "<t color='#FF3B3E' size='2.5'>/!\ATTENTION/!\</t><t color='#FFFFFF'><br/>Ces informations seront définitives. Votre RP doit être basé dessus.</t><br/>";
};

// send
if(_value == 1) then {
	_nationalite = ctrlText 8002;
	_age = ctrlText 8004;
	_sexe = lbCurSel 8001; // h (0) ou f (1)

	if(count _nationalite > 10 || _nationalite == "") exitWith {hint "Nationalité trop longue ou manquante";closeDialog 0;};

	if(_sexe == -1) exitWith {hint "Tu dois selectionner ton sexe";closeDialog 0;};
	if(_sexe != 0 && _sexe != 1) exitWith {hint "Erreur";closeDialog 0;};

	if(!([_age] call life_fnc_isnumber)) exitWith {hint "Tu n'as pas mis un vrai nombre.";closeDialog 0;};
	_age = parseNumber(_age);
	if(_age <= 0) exitWith {hint "Tu dois indiquer un age.";closeDialog 0;};
	if(_age < 16) exitWith {hint "Tu n'as pas l'âge requis pour faire une demande visa. Mais rien n'empèche de tricher :)";closeDialog 0;};

	player setVariable ["playerAge",_age];
	player setVariable ["playerSexe",_sexe];
	player setVariable ["playerNationalite",_nationalite];

	if(_sexe == 1) then {
		_sexe = "Femme";
	} else {
		_sexe = "Homme";
	};
	hintSilent parseText format["<t color='#FFFFFF'>Bienvenue sur l'île de Tanoa ! <br/> Nom: %1<br/> Sexe: %2<br/>Nationalite: %3<br/>Age: %4<br/><br/>Pour modifier ces informations, rendez vous sur le forum.</t><br/>",profileName, _sexe, _nationalite, _age];
	closeDialog 0;
};

[] call SOCK_fnc_updateRequest; //call our silent sync.