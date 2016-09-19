/*
	File: fn_delLicense.sqf
	Author: Bloopis
	Date : 05/02/2014
	
	Description:
	Delete selected license

	Parameter(s) :
		0: OBJECT - Target 

	Returns:
		NULL
*/
private["_display","_data","_list","_licenses"];
disableSerialization;
_display = findDisplay 42000;
_data = lbData[42001,(lbCurSel 42001)];
[[2,_data,player],"life_fnc_removeLicenses",(_this select 0),false] call life_fnc_MP;