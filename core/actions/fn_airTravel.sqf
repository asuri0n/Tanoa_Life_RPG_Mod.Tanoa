/*    
	File: fn_busTravel.sqf    
	Author: Asurion 	
	Description: Tanoa AirTravel!
*/
private["_vendor","_dest","_destInfo","_action","_weaponsP","_mags","_var","_val"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_dest = [_this,3,"",[""]] call BIS_fnc_param;

if(life_action_inUse) exitWith {hint "Tu attend déja un avion ...";};
_action = [
	"Tu es sur de vouloir prendre l'avion ? Les objets illégales et les armes seront saisient par la douane !",
	"AirTravel",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if (_action) then
{	
	//Error check
	if(isNull _vendor OR _dest == "" OR (player distance _vendor > 10)) exitWith {};

	switch (_vendor) do {	
		case ta_air : {		   
			_destInfo = switch (_dest) do {			
				case "sg_air" : {
					[11703.8, 3028.64, 0, 2600];
				};			
				case "lr_air" : {
					[11622.5, 13133.6, 0, 2960];
				};
				default {
					[];
				};		
			};	
		};
		case lr_air : {		   
			_destInfo = switch (_dest) do {			
				case "sg_air" : {
					[11703.8, 3028.64, 0, 2960];
				};		
				case "ta_air" : {
					[6916.5, 7379.93, 0, 2600];
				};
				default {
					[];
				};		
			};	
		};
		case sg_air : {		   
			_destInfo = switch (_dest) do {			
				case "lr_air" : {
					[11622.5, 13133.6, 0, 2960];
				};		
				case "ta_air" : {
					[6916.5, 7379.93, 0, 2600];
				};
				default {
					[];
				};		
			};	
		};	
		default {
			[];
		};
	};
	// Si l'aéroport existe pas ...
	if(count _destInfo == 0) exitWith {hint "La destination que vous avez choisi n'est pas disponible.";};

	// Si il est trop pauvre
	if(life_liquide - (_destInfo select 3) < 0) exitWith {hint "Vous n'avez pas assez d'argent";};

	// Pas bougé !
	player enableSimulation false; 
	life_action_inUse = true;

	// Flou écran noir
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,0], [1,1,1,1]]; 
	"colorCorrections" ppEffectCommit 1;
	titleText["40 secondes de voyage, c'est rapide hein ?","PLAIN"];

	// Sons décolage attérissage 
	playSound "avion_decole";
	sleep 20;
	playSound "avion_atteri";
	sleep 20;

	// Déduction de l'argent liquide
	life_liquide = life_liquide - (_destInfo select 3);

	// Téléportation
	player setPos [(_destInfo select 0), (_destInfo select 1), (_destInfo select 2)];
	"colorCorrections" ppEffectEnable false; 

	// Tu peux bougé !
	player enableSimulation true; 
	life_action_inUse = false;

	//Saisi de l'illégale
	_weaponsP = weapons player;
	{player removeWeapon _x} forEach _weaponsP;
	_mags = magazines player;
	{player removeMagazineGlobal _x} forEach _mags;
	
	{
		_var = [_x select 0,0] call life_fnc_varHandle;
		_val = missionNamespace getVariable _var;
		
		if(_val > 0) then
		{
			[false,(_x select 0),_val] call life_fnc_handleInv;
		};
	} foreach life_illegal_items;

	hint format["Vous êtes arrivé a destination. Votre voyage vous a couté %1€. Merci d'avoir utilisé Tanoa AirTravel",_destInfo select 3];
};
