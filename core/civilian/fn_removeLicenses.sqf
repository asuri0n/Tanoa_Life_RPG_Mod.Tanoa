/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state","_lic"];
_state = [_this,0,1,[0]] call BIS_fnc_param;
_lic =  [_this,1,"",[""]] call BIS_fnc_param; //introduced to ensure compatibility with Bloopis' code.

if (_lic != "") then {
	switch (_lic) do
	{
		case "license_civ_rebel": {license_civ_rebel = false;};
		case "license_civ_driver": {license_civ_driver = false;};
		case "license_civ_truck": {license_civ_truck = false;};
		case "license_civ_driver": {license_civ_driver = false;};
		case "license_civ_gun": {license_civ_gun = false;};
	};
}
else
{
	switch (_state) do
	{
		//Death while being wanted
		case 0:
		{
			license_civ_rebel = false;
			license_civ_driver = false;
			license_civ_heroin = false;
			license_civ_marijuana = false;
			license_civ_coke = false;
		};

		//Jail licenses
		case 1:
		{
			license_civ_gun = false;
			//license_civ_gangster = false;
			//license_civ_driver = false;
			//license_civ_rebel = false;
		};

		//Remove motor vehicle licenses
		case 2:
		{
			if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
				/*license_civ_driver = false;
				license_civ_air = false;
				license_civ_truck = false;
				license_civ_boat = false;
				hint "Vous avez perdu toutes vos licences de permis de conduire pour homicide involontaire.";*/
			};
		};

		//Killing someone while owning a gun license
		case 3:
		{
			if(license_civ_gun) then {
				//license_civ_gun = false;
				//hint "Vous avez perdu votre permis d'armes à feu pour homicide involontaire.";
			};
		};
		//KILLING BY COP
		case 4:	{
			//license_civ_rebel = false;
			//hint "Vous avez perdu votre entrainement rebelle.";
		};
	};
};