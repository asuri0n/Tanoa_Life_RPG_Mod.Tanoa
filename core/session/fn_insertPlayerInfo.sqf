/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText["Aucunes informations trouvées. Déconnectez vous, reconnectez vous.","BLACK FADED"];
0 cutFadeOut 9999999;

[[getPlayerUID player,profileName,life_liquide,life_dabliquide,player],"DB_fnc_insertRequest",false,false] spawn life_fnc_MP;
