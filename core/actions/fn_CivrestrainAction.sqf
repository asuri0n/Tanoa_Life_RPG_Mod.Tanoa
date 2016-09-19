/*
	File: fn_CivrestrainAction.sqf
	Author & Traduction : Skydred
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {hint "Cette action est impossible ou non autorisée."}; //Not valid
if(player == _unit) exitWith {hint "Cette action est impossible ou non autorisée."};
if(!isPlayer _unit) exitWith {hint "Cette action est impossible ou non autorisée."};
if((_unit getVariable "civrestrained")) exitWith {hint "Cette personne est déjà menottée."};
if((_unit getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "civrestrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
//Broadcast!
if(([false,"ziptie",1] call life_fnc_handleInv)) then
{
	titleText["Tu as utilisé tes menottes.","PLAIN"];

	if (side cursorTarget == west) then
	{
		[getPlayerUID player,name player,player,"209"] call life_fnc_addWantedCond;
	};
	if (side cursorTarget == civilian) then
	{
		if(!(license_civ_bounty_hunter)) then
		{
			[getPlayerUID player,name player,player,"208"] call life_fnc_addWantedCond;
		};
	};
	_unit setVariable["playerSurrender",false,true];
	_unit setVariable["civrestrained",true,true];
	[[player], "life_fnc_Civrestrain", _unit, false] spawn life_fnc_MP;
	[[0,format["%1 a été ligoté par %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
}
else{
	titleText["Tu n'as aucune menottes sur toi !","PLAIN"];
};