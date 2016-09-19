/*
	File: fn_antiCheatCash.sqf
	Author: Komodo
	Description: Allows to store previous state of cash/dab money and last transaction to check if this is corresponding to life actions. If not, the the difference is due to a cheat.
	Logs each transactions so we can further check in the logs.
    ["receiveMoney", false, (parseNumber(_val))] call life_fnc_antiCheatCash;
*/

private["_action","_isDab","_delta","_cheatAmount"];

_action = _this select 0;
_isDab = _this select 1;
_delta = _this select 2;

switch (_isDab) do {
    case true: {
    	/* Handling DAB money */

    	switch (life_dabliquide_before) do {
    	    case 0: {
    	    	/* If 0, then it's init case or everything is withdrawn. */
    	    	/* life_dabliquide_before = life_dabliquide; */
    	    };

    	    default {
    	     	/* Other cases */
    	     	if (life_dabliquide == life_dabliquide_before + _delta) then {
    	     		/* [[format["ANTICHEAT-MOD_DAB - name: %1; delta: %2; dab_before: %3; dab_new: %4; action: %5",name player, [_delta] call life_fnc_numberText, [life_dabliquide_before] call life_fnc_numberText, [life_dabliquide] call life_fnc_numberText, _action]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
                    diag_log format["ANTICHEAT-MOD_DAB - name: %1; delta: %2; dab_before: %3; dab_new: %4; action: %5",name player, [_delta] call life_fnc_numberText, [life_dabliquide_before] call life_fnc_numberText, [life_dabliquide] call life_fnc_numberText, _action]; */
    	     	}
    	     	else {
                    //Potential Cheater identified! Or bug ;)
                    _cheatAmount = life_dabliquide_before + _delta - life_dabliquide;
    	     		[[format["ANTICHEAT-CHEAT_MOD_DAB-name:%1;delta:%2;dab_before:%3;dab_new:%4;action:%5;cheatval:%6",name player, [_delta] call life_fnc_numberText, [life_dabliquide_before] call life_fnc_numberText, [life_dabliquide] call life_fnc_numberText, _action, [_cheatAmount] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
                    //diag_log format["ANTICHEAT-CHEAT_MOD_DAB - name: %1; delta: %2; dab_before: %3; dab_new: %4; action: %5; cheat val: %6",name player, [_delta] call life_fnc_numberText, [life_dabliquide_before] call life_fnc_numberText, [life_dabliquide] call life_fnc_numberText, _action, [_cheatAmount] call life_fnc_numberText];
    	     	};
                life_dabliquide_before = life_dabliquide;
    	    };
    	};
    life_dabliquide_delta = _delta;
    };

    case false: {
     	/* Handling CASH money */
        if (life_liquide == life_liquide_before + _delta) then {
            /* Everything is fine
           [[format["ANTICHEAT-MOD_LIQUIDE: %1; delta: %2; liquide_before: %3; liquide_new: %4; action: %5",name player, [_delta] call life_fnc_numberText, [life_liquide_before] call life_fnc_numberText, [life_liquide] call life_fnc_numberText, _action]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP; */
           //diag_log format["ANTICHEAT-MOD_LIQUIDE: %1; delta: %2; liquide_before: %3; liquide_new: %4; action: %5",name player, [_delta] call life_fnc_numberText, [life_liquide_before] call life_fnc_numberText, [life_liquide] call life_fnc_numberText, _action];
        }
        else {
            /* cheater or bug */
            _cheatAmount = life_liquide_before + _delta - life_liquide;
            [[format["ANTICHEAT-CHEAT_MOD_LIQUIDE: %1; delta: %2; liquide_before: %3; liquide_new: %4; action: %5; cheat val: %6",name player, [_delta] call life_fnc_numberText, [life_liquide_before] call life_fnc_numberText, [life_liquide] call life_fnc_numberText, _action, [_cheatAmount] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
            //diag_log format["ANTICHEAT-CHEAT_MOD_LIQUIDE: %1; delta: %2; liquide_before: %3; liquide_new: %4; action: %5; cheat val: %6",name player, [_delta] call life_fnc_numberText, [life_liquide_before] call life_fnc_numberText, [life_liquide] call life_fnc_numberText, _action, [_cheatAmount] call life_fnc_numberText];
        };
    life_liquide_before = life_liquide;
    life_liquide_delta = _delta; //In case we need it, so far useless.
    };
};