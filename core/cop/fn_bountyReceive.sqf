/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;

if(_val == _total) then
{
	titleText[format["Tu as reçu $%1 pour avoir arrêté un criminel",[_val] call life_fnc_numberText],"PLAIN"];
	hint format["Vous avez reçu %1 $ pour ce criminel !", _val];
}
	else
{
	titleText[format["Vous avez recueilli une prime de $%1 pour le meurtre d'un criminel recherché, si vous l'aviez arrêté vous auriez reçu $%2",[_val] call life_fnc_numberText,[_total] call life_fnc_numberText],"PLAIN"];
};

life_dabliquide = life_dabliquide + _val;
["bountyReceive", true, _val] call life_fnc_antiCheatCash;
