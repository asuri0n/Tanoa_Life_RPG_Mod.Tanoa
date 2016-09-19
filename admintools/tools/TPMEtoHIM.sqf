//AlPMaker
_max = 10; snext = false; plist = []; pselect5 = "";
{if ((_x != player) && (getPlayerUID _x != "")) then {plist pushBack (name _x);};} forEach entities "CAManBase";
{if ((count crew _x) > 0) then {{if ((_x != player) && (getPlayerUID _x != "")) then {plist pushBack (name _x);;};} forEach crew _x;};} foreach (entities "LandVehicle" + entities "Air" + entities "Ship");
smenu =
{
	_pmenu = [["Teleportation sur un joueur",true]];
	for "_i" from (_this select 0) to (_this select 1) do
	{_arr = [format['%1', plist select (_i)], [12],  "", -5, [["expression", format ["pselect5 = plist select %1;", _i]]], "1", "1"]; _pmenu set [_i + 2, _arr];};
	if (count plist > (_this select 1)) then {_pmenu set [(_this select 1) + 2, ["Next", [13], "", -5, [["expression", "snext = true;"]], "1", "1"]];}
	else {_pmenu set [(_this select 1) + 2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];};
	_pmenu set [(_this select 1) + 3, ["Exit", [13], "", -5, [["expression", "pselect5 = 'exit';"]], "1", "1"]];
	showCommandingMenu "#USER:_pmenu";
};
_j = 0; _max = 10; if (_max>9) then {_max = 10;};
while {pselect5 == ""} do
{
	[_j, (_j + _max) min (count plist)] call smenu; _j = _j + _max;
	WaitUntil {pselect5 != "" or snext};
	snext = false;
};
if (pselect5 != "exit") then
{
	_name = pselect5;
	{
		if(name _x == _name) then
		{
		//player moveInAny vehicle _x;
			_pos = getPosATL _x;
			if ( _x == vehicle _x && player != vehicle player) then
				{
					hint format ["Téléportation dans le vehicule de %1", _name];
					player moveInAny vehicle _x;
				} else
				{
					(vehicle player) setpos [(_pos select 0) + 5, _pos select 1, 0];
					hint format ["Téléportation sur %1 - position : %2", _name, _pos];
				};
		};
	} forEach entities "CAManBase";
};