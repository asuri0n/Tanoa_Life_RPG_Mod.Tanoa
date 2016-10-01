#include <macro.h>
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(life_liquide < _price) exitWith {hint format[(localize "STR_NOTF_NE_1"),[_price] call life_fnc_numberText,_license select 1];};

//Vérification du grade pour acheter le licence d'acces aux armes de l'armée
switch (_license select 0) do
{
    case "license_civ_gangster": {
		invo_faction = "gangster"; player setVariable ["invo_faction","gangster",true]; license_civ_rebel = false;
		life_liquide = life_liquide - _price;
		["Achat Licence", false, -1 * _price] call life_fnc_antiCheatCash;
		titleText[format[(localize "STR_NOTF_B_1"), _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
		missionNamespace setVariable[(_license select 0),true];
		PlaySound "caching";
	};
	case "license_civ_rebel": {
		//if(!(license_civ_permrebel)) exitWith { hint "Vous devez être dans la whiteliste rebelle"};
		invo_faction = "rebel"; player setVariable ["invo_faction","rebel",true]; license_civ_gangster = false;
		life_liquide = life_liquide - _price;
		["Achat Licence", false, -1 * _price] call life_fnc_antiCheatCash;
		titleText[format[(localize "STR_NOTF_B_1"), _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
		missionNamespace setVariable[(_license select 0),true];
		PlaySound "caching";
	};
	default	{
		life_liquide = life_liquide - _price;
		["Achat Licence", false, -1 * _price] call life_fnc_antiCheatCash;
		titleText[format[(localize "STR_NOTF_B_1"), _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
		missionNamespace setVariable[(_license select 0),true];
		PlaySound "caching";
	};
};
[] call SOCK_fnc_updateRequest;