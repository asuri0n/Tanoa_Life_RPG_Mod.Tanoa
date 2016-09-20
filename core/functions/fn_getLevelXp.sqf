/*
	File: fn_getLEvelXp.sqf
	Author: Nathan "Asurion" 
	Description: Return the number of xp to get the given level
*/
_level = [_this,0,0,[0]] call BIS_fnc_param; 
_xp = 0;
switch (_level) do {
	case 1:{
		_xp = 440; 
	};
	case 2:{
		_xp = 924; 
	};
	case 3:{
		_xp = 1456; 
	};
	case 4:{
		_xp = 2042; 
	};
	case 5:{
		_xp = 2686; 
	};
	case 6:{
		_xp = 3395; 
	};
	case 7:{
		_xp = 4175; 
	};
	case 8:{
		_xp = 5033; 
	};
	case 9:{
		_xp = 5976; 
	};
	case 10:{
		_xp = 7014; 
	};
	case 11:{
		_xp = 8122; 
	};
	case 12:{
		_xp = 9411; 
	};
	case 13:{
		_xp = 10792; 
	};
	case 14:{
		_xp = 12311; 
	};
	case 15:{
		_xp = 13982; 
	};
	case 16:{
		_xp = 15820; 
	};
	case 17:{
		_xp = 17842; 
	};
	case 18:{
		_xp = 20066; 
	};
	case 19:{
		_xp = 22513; 
	};
	case 20:{
		_xp = 25204; 
	};
	default{""};
};


if (VACA_SERV_DEBUG) then
{
	diag_log "---------------- get Level Exp ----------------";
	diag_log format["_level: %1",_level];
	diag_log format["_xp: %1",_xp];
	diag_log "------------------------------------------------";
};
	
_xp;