/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index","_veh","_ziptiesOwners"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

//Komodo: bizarrement, supprimer ainsi plusieurs éléments dans un Array que l'on parcout ne fait pas planter. On commence par une phase de nettoyage de la liste.
diag_log format["life_vehicles keymenu %1",life_vehicles];

//Internal Debugging.
if (VACA_SERV_DEBUG) then {
	hint format["life_vehicles %1",life_vehicles];
};

{
	if(_x isKindOf "Man") then
	{
		_ziptiesOwners = _x getVariable["ziptiesOwners",[]];
		if (!(player in _ziptiesOwners)) then
		{
			life_vehicles deleteAt _forEachIndex;
		};
	};
	if(_x getVariable ["house_sold",false]) then
	{
		life_vehicles deleteAt _forEachIndex;
	};
} forEach life_vehicles;


{ if(player distance _x < 20) then {_near_units pushBack _x;};} foreach playableUnits;

for "_i" from 0 to (count life_vehicles)-1 do
{
	_veh = life_vehicles select _i;

	//diag_log "KeyMenu : Life_vehicules";
	//diag_log life_vehicles;
	//diag_log _veh;

	/* Make the house disapear if it was sold	*/
	if (_veh isKindOf "House_F") then
	{
		//diag_log "Detect maison";
		if(_veh getVariable ["house_sold",false]) then
		{
			//diag_log "Delete véhicule from key menu";
			life_vehicles set[_i,-1]; //Remove vehicle from the list
			_veh = objNull;
			//diag_log _veh;
		};
	};
	if(_veh isKindOf "Man") then
	{
		_ziptiesOwners = _veh getVariable["ziptiesOwners",[]];
		if (!(player in _ziptiesOwners)) then
		{
			life_vehicles set[_i,-1];
		} //Suppression des clefs de menottes des personnes mortes/démenottées
		else
		{
			_text = "";
			_name = "Menottes de " + ([_veh] call life_fnc_getPlayerName);
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
			_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
			if(_pic != "pictureStaticObject") then {
				_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
			};
			_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
		};
	}
	else
	{
		if(!isNull _veh && alive _veh) then
		{
			//diag_log "Detect Véhicule alive";
			_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
			_text = format["(%1)",_color];
			if(_text == "()") then
			{
				_text = "";
			};

			_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
			_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
			if(_pic != "pictureStaticObject") then {
				_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
			};
			_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
		};
	};
};

//Remove houses that has been sell
//diag_log "after Removing of houses sold : ";
life_vehicles = life_vehicles - [-1];
//diag_log life_vehicles;

{
	if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then
	{
		_plist lbAdd format["%1 - %2",[_x] call life_fnc_getPlayerName, side _x];
		_plist lbSetData [(lbSize _plist)-1,str(_x)];
	};
} foreach _near_units;

lbSort [_plist, "ASC"];

if(((lbSize _vehicles)-1) == -1) then
{
	_vehicles lbAdd "Tu n'as pas de véhicule.";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};