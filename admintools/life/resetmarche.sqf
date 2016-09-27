_action = [
	format["Vous êtes sur le point de reset les prix du marche.<br/><br/><t color='#8cff9b'>Etes vous sur de vouloir reset le marche?</t>"],
	"Reset marché?",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if (_action) then
{
	[] call life_fnc_marketReset;
};