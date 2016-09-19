/*
	File: fn_addCriminal.sqf
	Author: Bloopis
	Date : 04/28/2014
	Traduction : Skydred
	Description:
	ADD A CRIMINAL TO THE WANTED LIST

	Parameter(s) :
		NONE

	Returns:
		BOOL
*/
private["_display","_clist","_plist","_crime","_unit","_val"];
disableSerialization;

_val = false;
_display = findDisplay 2400;
_clist = _display displayCtrl 2408;
_plist = _display displayCtrl 2407;

_sel = lbCurSel _clist;
if(_sel == -1) exitWith {hint "Aucun crime sélectionné.";_val;};
_crime = _clist lbData _sel;

_sel = lbCurSel _plist;
if(_sel == -1) exitWith {hint "Aucun joueur sélectionné.";_val;};
_unit = _plist lbData _sel;
_unit = format ["%1", _unit];
if(_unit == "") exitWith {hint "Une erreur est survenue lors de l'ajout.";_val;};

//we add criminal in wanted list
diag_log format ["INVO DEBUG - addCriminal - unit: %1; _crime: %2", _unit, _crime];
try {
	[_unit,"", _crime] call INVO_fnc_wantedAdd;
	hint "Le criminel a été ajouté à la liste, TRACK HIM NOW !";
	_val = true;
}
catch {
	hint "L'ajout du criminel a échoué !";
};

_val;