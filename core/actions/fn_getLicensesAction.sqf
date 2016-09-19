/*
	File: fn_getLicensesAction.sqf
	Author: Bloopis
	Date : 05/02/2014

	Description:
	Return licenses of target

	Parameter(s) :
		0: OBJECT - Target

	Returns:
		NULL
*/
private["_cop","_licenses"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {hint "Erreur lors de la récupération des licences"};
_licenses = [];
//Licenses
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		//if((_x select 0) != "license_civ_rebel") then {
			_licenses pushBack [([(_x select 0)] call life_fnc_varToStr),(_x select 0)];
		//};
	};
} foreach life_licenses;

//we call cop licenses manager
[[player,_licenses],"life_fnc_delLicenses",_cop,FALSE] spawn life_fnc_MP;