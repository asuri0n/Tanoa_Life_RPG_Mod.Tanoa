/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_playerCrimes","_crimeIndex","_crimeCount"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "") exitWith {}; //Bad data passed.

/*
    Komodo: invo_wanted_list == life_wanted_list V2
    format: [uid, [[crime,quantity]]]
*/
_index = [_uid, 0, invo_wanted_list] call life_fnc_indexInTable;
if (_index != -1) then
{
    _playerCrimes = (invo_wanted_list select _index) select 1;
    //Player Crimes structure: list of [crimeCode, Quantities]
    _crimeIndex = [_type, 0, _playerCrimes] call life_fnc_indexInTable;
    if (_crimeIndex != -1) then
    {
        _crimeCount = (_playerCrimes select _crimeIndex) select 1;
        _playerCrimes set [_crimeIndex,[_type, _crimeCount + 1]];
    }
    else
    {
        _playerCrimes pushBack [_type, 1];
    };

    invo_wanted_list set [_index, [_uid, _playerCrimes]];
}
else
{
    invo_wanted_list pushBack [_uid, [[_type,1]]];
};
publicVariable "invo_wanted_list";