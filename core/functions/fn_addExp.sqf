/*
	File: fn_addExp.sqf
	Author: Jacob "PapaBear" Tyler 
	Description:Add exp to given prof
*/
//add exp
_type = [_this,0,"",[""]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param; 
_profData = missionNamespace getVariable (_type);
_level = (_profData select 0);
_exp = (_profData select 1);
_nextLevel = _level + 1;
_xp2Up = [_nextLevel] call life_fnc_getLevelXp;
_exp = _exp + _amount; 


if (VACA_SERV_DEBUG) then
{
	diag_log "------------------- AJOUT EXPERIENCE ------------------";
	diag_log format["Nom champ : %1",_type];
	diag_log format["Nombre d'XP en plus: %1",_amount];
	diag_log format["Donnée du joueur: %1",_profData];
	diag_log format["Level du joueur avant: %1",(_profData select 0)];
	diag_log format["Experience du joueur avant: %1",(_profData select 1)];
	diag_log format["Xp requis pour acceder au level %1: %2",_nextLevel, _xp2Up];
	diag_log format["Experience du joueur apres: %1",_exp];
	diag_log "-------------------------------------------------------";
};


// Si le nombre d'xp du joueur est >= au palier du prochain level
if( _exp >= _xp2Up ) then 
{
	if( _level == 20 ) then
	{
		titleText [format["%1 est déja au niveau maximal.",_text],"PLAIN"];		
		titleFadeOut 10; 
	}else
	{
		if( _level == 19 ) then
		{
			titleText [format["Tu es désormais niveau maximal (%1)!",_nextLevel],"PLAIN"]; 
			//Pour qu'il sois bloqué niveau 20 et pas plus
			missionNamespace setVariable [_type,[(_profData select 0) + 1,(_xp2Up)]];
			titleFadeOut 10;
		}else
		{
			missionNamespace setVariable [_type,[(_profData select 0) + 1,(_exp)]];
			_text = [_type] call life_fnc_varToStr;
			titleText [format["%1 est maintenant niveau %2.",_text,_nextLevel],"PLAIN"]; 
			titleFadeOut 10; 
		}; 
	};
}else
{
	missionNamespace setVariable [_type,[(_profData select 0),(_exp)]];
};
