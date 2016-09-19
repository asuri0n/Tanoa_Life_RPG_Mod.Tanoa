/*
	File: fn_sendCommercialMsg.sqf
	Author: Bloopis
	Date : 07/11/2014

	Description:
	put message in list of display

	Parameter(s) :
		N/A

	Returns :
		N/A
*/
private ["_size","_sentence","_action"];

if((ctrlText 70003) == "") ExitWith {};

_size = count (toArray (ctrlText 70003));
life_msg_cost = _size * 1000;
life_msg_pub = (ctrlText 70003);

_sentence = parseText format["<t align='center'><t size='.8px'>Vous souhaitez envoyer une annonce pour votre société en payant <t color='#d16428'>%1€</t>, vous confirmez ?<br /><br />Attention, l'annonce n'est valide que jusqu'au prochain reboot.",life_msg_cost];

_action =
[
	_sentence,
	"Poster Annonce",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	//[] spawn life_fnc_sendCivilMsg;
	if(life_dabliquide < life_msg_cost) exitWith {hint format["Tu ne dispose pas de %1€ en banque, tu ne peux donc envoyer ton annonce !", life_msg_cost]};
	if(getPlayerUID player in life_msg_Owner) exitWith {hint format["Une seule annonce par personne est autorisée !"]};
	if(life_msg_pub == "") ExitWith {hint format["le message ne peut être vide !"]};
	life_dabliquide = life_dabliquide - life_msg_cost;
	["sendCivMsg", true, -1 * life_msg_cost] call life_fnc_antiCheatCash;

	[[player],"INVO_fnc_setClientDate",false,false] spawn life_fnc_MP;
	sleep 2;
	_date = player getVariable ["INVO_date",[0000,0,0,0,0]];
	//[year, month, day, hour, minute]
	/*
		Add 0 if only 1 digit for month, day,hour & minute
	*/
	for "_i" from 3 to ((count _date) -1) do
	{
		if (( _date select _i) < 10 ) then
		{
			//diag_log format["Avant %1",( _date select _i)];
			_date set [_i, "0" + str (_date select _i)];
			//diag_log format["Après %1",( _date select _i)];
		};
	};
	_dateString = format["%1:%2", _date select 3, _date select 4];
	life_msg_Owner set[count life_msg_Owner,(getPlayerUID player)];
	life_msg_Civil set[count life_msg_Civil,[life_msg_pub, name player, _dateString, getPlayerUID player]];
	publicVariableServer "life_msg_Civil";
	publicVariableServer "life_msg_Owner";
	sleep 2;								//little sleep
	[[],"TON_fnc_actualiseVariablesMsg",false,false] spawn life_fnc_MP;
	life_msg_cost = 0;
	life_msg_pub = "";
	hint format["Ton annonce a bien été postée !"];
	closeDialog 0;
} else {
	closeDialog 0;
};
