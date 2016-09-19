/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		tawvd_foot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		profileNamespace setVariable ["tawvd_foot",tawvd_foot];
	};

	case 1:
	{
		tawvd_car = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		profileNamespace setVariable ["tawvd_car",tawvd_car];
	};

	case 2:
	{
		tawvd_air = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		profileNamespace setVariable ["tawvd_air",tawvd_air];
	};

	case 3:
	{
		invo_sound_dim_car = round(_value);
		ctrlSetText[2932,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		profileNamespace setVariable ["invo_sound_dim_car",invo_sound_dim_car];
	};

	case 4:
	{
		invo_sound_dim_air = round(_value);
		ctrlSetText[2942,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		profileNamespace setVariable ["invo_sound_dim_air",invo_sound_dim_air];
	};

	case 5:
	{
		invo_sound_dim_sea = round(_value);
		ctrlSetText[2952,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		profileNamespace setVariable ["invo_sound_dim_sea",invo_sound_dim_sea];
	};
};