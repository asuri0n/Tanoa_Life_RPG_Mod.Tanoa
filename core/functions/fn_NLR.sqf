/*
NLR
Kevin Webb
Semi-enforces NLR
*/
private["_NLR","_msg","_dMarker"];
if(life_is_arrested) exitWith {}; 
systemChat "Attention! La règle du retour du zone s'applique !";
_msg = "Ce joueur a violer la règle du retour sur zone!";
life_lastKnownPos = [_this,0,[],[[]]] call BIS_fnc_param;
waitUntil{alive player};
_dMarker = createMarkerLocal["My Death Location",life_lastKnownPos];
_dMarker setMarkerTypeLocal "hd_warning";
_dMarker setMarkerTextLocal "My Death Location - Stay Away!";
_dMarker setMarkerColorLocal "ColorWhite";
_NLR = time + 900;
waitUntil{uiSleep 1; ((_NLR - time) <= 0 || player distance life_lastKnownPos < 900 || !alive player)};
if((_NLR - time) <= 0 || !alive player) exitWith {life_lastKnownPos = [0,0,0]; deleteMarker _dMarker;};
[[format["%1 a tenté de faire un retour sur zone",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
[[0,format["%1 a fait un retour sur zone.",player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
life_lastKnownPos = [0,0,0];
deleteMarker _dMarker;