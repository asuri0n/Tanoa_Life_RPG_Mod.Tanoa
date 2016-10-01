#include <macro.h>
/*
	Filename: fn_computePaycheck.sqf
	Author: Komodo
	Description:
	Handles the computation of paycheck.
*/

private ["_date, _extra"];

if((!alive player) OR (player getVariable "restrained") OR (player getVariable "Escorting") OR (player getvariable["FAR_isUnconscious",0] == 1) OR (life_is_arrested)) then
{
	systemChat "Vous n'avez pas reçu de salaire car vous êtes soit coma, AFK, menotté, prison, escorté";
}
	else
{
	_extra = 0;
	switch (playerSide) do
	{
		case east:
		{
			_extra = 300;
		};
	};

	life_dabliquide = life_dabliquide +  __GETC__(life_paycheck) + _extra;
	systemChat format["Tu as recu un salaire de $%1",[ __GETC__(life_paycheck) + _extra] call life_fnc_numberText];
	["computePaycheck", true,  __GETC__(life_paycheck) + _extra] call life_fnc_antiCheatCash;
};