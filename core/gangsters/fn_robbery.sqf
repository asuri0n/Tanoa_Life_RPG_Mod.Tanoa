/*
	file: fn_robbery.sqf
	Author: Komodo, re-using MrKraken script.
	Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
	Description:
	Executes the rob shob action!
	Modified by: Komodo
	Translated & Edited by Johnny.
*/
private ["_timer","_dist","_robber","_shop"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_timer = [_this,2,60,[0]] call BIS_fnc_param;//Time for the robbery to be completed

INVO_robShops_Result = true;

while {_timer > 0} do
{
	hintsilent format ["Il reste encore %1 secondes. Veuillez rester à proximité du vendeur !",_timer];
	sleep 1;
	_timer = _timer - 1;
	_dist = _robber distance _shop;//Distance beetwen the robber and the shop owner

	if (!(alive _robber)/* || (player getVariable ["AGM_isUnconscious", false])*/) exitwith
	{
		hint "Le braquage a échoué suite à la mort du braqueur !";
		INVO_robShops_Result = false;
	};

	if (life_istazed) exitWith
	{
		hint "Le braquage a échoué car tu as été tazé.";
		INVO_robShops_Result = false;
	};

	if (_dist > 4) exitwith
	{
		hint "Le braquage a échoué car tu t'es éloigné";
		INVO_robShops_Result = false;
	};

	if (vehicle player != player) exitWith
	{
		hint "T'arrives à braquer peinard dans ton véhicule?";
		INVO_robShops_Result = false;
	};
};
