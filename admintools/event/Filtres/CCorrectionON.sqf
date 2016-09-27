_info = _this select 3;
_CCfile = _info select 0;
["admintools\event\Filtres\"+format ["%1",_CCfile]+"","BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;