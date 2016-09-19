/*
	Author: Komodo
	Filename: fn_IntroOnOff.sqf

	Description: activates or not intro.
*/
private["_display","_intro"];

if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Impossible d'ouvrir?"};
};

disableSerialization;

_display = findDisplay 2900;
_intro = _display displayCtrl 2973;

if (invo_play_intro) then
{
	invo_play_intro = false;
	profileNamespace setVariable ["invo_play_intro",invo_play_intro];
	_intro ctrlSetTextColor [1,0,0,1];
	_intro ctrlSetText "OFF";
}
else
{
	invo_play_intro = true;
	profileNamespace setVariable ["invo_play_intro",invo_play_intro];
	_intro ctrlSetTextColor [0,1,0,1];
	_intro ctrlSetText "ON";
};
