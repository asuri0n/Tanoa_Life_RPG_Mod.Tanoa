#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan

	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type","_lastContact","_fastReply","_adminReply","_listCommTowers","_countCommTowers","_cell","_name"];

diag_log "[VACA_DEBUG] ===== CELLPHONE =====";
_cell = false;
{  
	_name = [_x,14] call KRON_StrLeft;  
	diag_log format ["_name %1",_name];
	if(_name == "tf_anprc148jem" || _name == "ItemRadio")then  
	{  
		_cell = true;  
	};
}foreach assignedItems player;

diag_log format ["_cell %1",_cell]; 

_countCommTowers = 0;
//Komodo: ajout pour permettre la désactivation des messages si une personne est en dehors des zones de couverture active. Calcul sous conditions car couteux.
if(_cell) then
{
	_listCommTowers = nearestObjects [getPosATL player, ["Land_TBox_F"], 4000];
	_countCommTowers = {_x getVariable ["commsActive", false];} count _listCommTowers;
};

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;
_fastReply = _display displayCtrl 3022;
_adminReply = _display displayCtrl 3020;

ctrlSetText [3003, ""];
_lastContact = player getVariable "lastestContact";
if(!isNull _lastContact) then {
	if(alive _lastContact) then {
		ctrlSetText [3023, format["Dernier Contact: %1",name _lastContact]];
		player setVariable ["saveContact",_lastContact,true];
	}else {player setVariable ["saveContact",ObjNull,true];};
};
_fastReply buttonSetAction "[""1""] call INVO_fnc_cell_specialmsg;";
_adminReply buttonSetAction"[""2""] call INVO_fnc_cell_specialmsg;";

lbClear _units;

//Komodo: et notre petit message...
if(_countCommTowers == 0) then {
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Tu n'as pas de réseau à cet endroit.</t><br/><br/><t size='0.90 'font='puristaLight' align='left'>Il faut être dans un rayon de 4 km d'une tour active pour permettre l'envoi de messages.</t><br/><br/>Vous pouvez cependant toujours recevoir/envoyer des messages aux administrateurs et aux médecins."];
	ctrlEnable [3022, false];		//Fast reply
	ctrlEnable [3015, false];		//Bouton envoyer
	ctrlEnable [3016, false];		//Cop
	//3017 - Autorisé - Admin
	ctrlEnable [3031, false];		//Depanneuse
};

if(!_cell) then {
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Tu n'as pas de Radio</t><br/><br/><t size='0.90 'font='puristaLight' align='left'>Tu dois avoir une radio pour pouvoir communiquer. Tu peux acheter une radio au Magasin.</t><br/><br/>Vous pouvez cependant toujours recevoir/envoyer des messages aux administrateurs et médecins."];
	ctrlEnable [3022, false];		//Fast reply
	ctrlEnable [3015, false];		//Bouton envoyer
	ctrlEnable [3016, false];		//Cop
	//3017 - Autorisé - Admin
	ctrlEnable [3031, false];		//Depanneuse
};

if(player getVariable ["FAR_isUnconscious", false]) then {
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Vous êtes blessé</t><br/><br/><t size='0.90 'font='puristaLight' align='left'>Vous ne pouvez pas envoyer de messages lorsque vous êtes inconscient, excepté aux services médicaux</t><br/><br/>Vous pouvez cependant toujours recevoir/envoyer des messages aux administrateurs et médecins."];
	ctrlEnable [3022, false];		//Fast reply
	ctrlEnable [3015, false];		//Bouton envoyer
	ctrlEnable [3016, false];		//Cop
	//3017 - Autorisé - Admin
	//ctrlEnable [3031, false];		//Depanneuse
};

if(player getVariable ["playerSurrender", false]) then {
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Vous avez les mains en l'air</t><br/><br/><t size='0.90 'font='puristaLight' align='left'>Vous ne pouvez pas envoyer de messages lorsque vous êtes dans cette position, excepté aux services médicaux</t><br/><br/>Vous pouvez cependant toujours recevoir/envoyer des messages aux administrateurs et médecins."];
	ctrlEnable [3022, false];		//Fast reply
	ctrlEnable [3015, false];		//Bouton envoyer
	ctrlEnable [3016, false];		//Cop
	//3017 - Autorisé - Admin
	ctrlEnable [3031, false];		//Depanneuse
};

if(player getVariable ["restrained", false]) then {
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Vous êtes menotté</t><br/><br/><t size='0.90 'font='puristaLight' align='left'>Vous ne pouvez pas envoyer de messages lorsque vous êtes dans cette position, excepté aux services médicaux</t><br/><br/>Vous pouvez cependant toujours recevoir/envoyer des messages aux administrateurs et médecins."];
	ctrlEnable [3022, false];		//Fast reply
	ctrlEnable [3015, false];		//Bouton envoyer
	ctrlEnable [3016, false];		//Cop
	//3017 - Autorisé - Admin
	ctrlEnable [3031, false];		//Depanneuse
};

/*if(INVO_radio_canUseRadio) then
{
	ctrlEnable[3025,false];
};*/


if((__GETC__(life_adminlevel) < 1)) then
{
	ctrlShow[3020,false];
	ctrlShow[3021,false];
};

{
	if(alive _x && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSort [_units, "ASC"];

lbSetCurSel [3004,0];

diag_log "[VACA_DEBUG] ===== FIN =====";