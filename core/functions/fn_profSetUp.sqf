/*
	File: fn_profSetUp.sqf
	Author: Jacob "PapaBear" Tyler 
	Description:Opens gui and fills info
*/

createDialog "life_prof_dialog";
disableSerialization;
//fill text block profs
//format
// NAME LVL:1 EXP: xxx/yyyy//character count? or 2 different textboxes 

_dialog = findDisplay 7730;
_Names = _dialog displayCtrl 7731;
_Lvls = _dialog displayCtrl 7732;
_Exp = _dialog displayCtrl 7733;
_struct = "";
_struct2 = "";
_struct3 = "";
_spacesTill = 20;

{
	_numSpaces = 0;
	_profText = [_x select 0] call life_fnc_profType;
	_charCount = count _profText;
	_numSpaces = _spacesTill - _charCount;
	_data = missionNamespace getVariable (_x select 0);
	_profLevel = _data select 0;
	_profExp = _data select 1; 
	_xp2Up = [_profLevel+1] call life_fnc_getLevelXp;
	_struct3 = _struct3 + (format["Exp: %1/%2<br/>", _profExp,_xp2Up ]);
	_struct2 = _struct2 + (format["LvL: %1<br/>",_profLevel]);
	_struct = _struct + format["%1<br/>",_profText];
		
	
	if (VACA_SERV_DEBUG) then
	{
		diag_log format["------------------- Prof Setup (%1) -------------",_x select 0];
		diag_log format["name: %1",_struct];
		diag_log format["name: %1",_struct2];
		diag_log format["name: %1",_struct3];
		diag_log "------------------------------------------------";
	};
		
} foreach life_prof; 
	
_Names ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];
_Lvls ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct2];
_Exp ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct3];

		
		