/*
	File: fn_vehTransferItems.sqf
	Author: Komodo
	Description:
	Transfer items from player/vehicle to player/vehicle. Only non handled cas so far: player to player.
*/

private["_vehFrom","_vehTo","_item","_num"];
_vehFrom = _this select 0;
_vehTo = _this select 1;
_item = [_this,2,"",[""]] call BIS_fnc_param;
_num = [_this,3,0,[0]] call BIS_fnc_param;

//diag_log "vehTransferItems START";

if (isNil "_vehFrom") exitWith {diag_log "vehTransferItems _vehFrom isNil";};
if (isNull _vehFrom) exitWith {diag_log "vehTransferItems _vehFrom isNull";};
if (isNil "_vehTo") exitWith {diag_log "vehTransferItems _vehTo isNil";};
if (isNull _vehTo) exitWith {diag_log "vehTransferItems _vehTo isNull";};

//diag_log format["vehTransferItems FROM: %1; TO: %2; ITEM: %3; NUM: %4", _vehFrom, _vehTo, _item, _num];

switch (true) do {
    case (_vehFrom == player): {
        /* source player, target vehicle */
        if ([true,_item,_num,_vehTo] call life_fnc_vehCanHandleTrunk) then {
            if([false,_item,_num] call life_fnc_handleInv) then {
                [true,_item,_num,_vehTo] call life_fnc_vehHandleTrunk;
            }
            else {
                hint "Impossible d'enlever les items sélectionnés de ton inventaire.";
            };
        }
        else {
            hint "Impossible d'ajouter les items sélectionnés à l'inventaire de la cible.";
            //diag_log format ["player->veh: %1", [true,_item,_num,_vehTo] call life_fnc_vehCanHandleTrunk];
        };
    };
    case (_vehTo == player): {
        //_diff should containt the acceptable amount of items to add to the player's inventory
        _diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
        if ([false,_item,_diff,_vehFrom] call life_fnc_vehCanHandleTrunk) then {
            if([true,_item,_diff] call life_fnc_HandleInv) then {
                [false,_item,_diff,_vehFrom] call life_fnc_vehHandleTrunk;
                if (_diff != _num) then {hint format ["Seul %1 ont été ajouté à ton inventaire.", _diff]; };
            } else {
                hint format "Impossible d'ajouter autant à ton inventaire.";
            };
        } else {
            hint "Impossible de retirer les items sélectionnés de la source.";
        };
    };

    default {
     	/* vehicle to vehicle, or player to player. Second case should not be possible for now. */
     	if ([false,_item,_num,_vehFrom] call life_fnc_vehCanHandleTrunk) then {
     		if ([true,_item,_num,_vehTo] call life_fnc_vehCanHandleTrunk) then {
     			[true,_item,_num,_vehTo] call life_fnc_vehHandleTrunk;
     			[false,_item,_num,_vehFrom] call life_fnc_vehHandleTrunk;
     		} else {
     			hint "le véhicule cible ne peut contenir autant.";
     		};
     	} else {
     		hint "le véhicule source n'en a pas autant.";
     	};
    };
};