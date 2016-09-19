/*

	Resets market by calling marketConfiguration

*/

[] call life_fnc_marketconfiguration;

[[0,format["ADMIN: %1 à remis les prix du marché à 0.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

hint "Prix des marché remis à 0.";