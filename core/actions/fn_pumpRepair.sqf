/*
	File: fn_pumpRepair.sqf

	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(life_liquide < 500) then
{
	if(life_dabliquide < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "Tu n'as pas $500 en liquide ou en banque pour payer les réparations."};
	case 1: {vehicle player setDamage 0; life_liquide = life_liquide - 500; hint "Tu as réparé le véhicule pour $500";["pumpRepair", false, -500] call life_fnc_antiCheatCash;};
	case 2: {vehicle player setDamage 0; life_dabliquide = life_dabliquide - 500; hint "Tu as réparé le véhicule pour $500";["pumpRepair", true, -500] call life_fnc_antiCheatCash;};
};
