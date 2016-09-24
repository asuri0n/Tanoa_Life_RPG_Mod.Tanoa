KeyConstruction={

     private ["_r","_key_delay","_max_height"] ;
	 VarIncHauteur = 0.1;
	 _keyCodeObjetUP = 201; // PAGEUP
	 _keyCodeObjetDOWN = 209; // PAGEDOWN
	 _keyCodePauser = 76   ; // 5
	 _keyCodeTournerX = 210; // Inser
	 _keyCodeTournerY = 199; // Debut
	 _keyCodeObjetRetour = 211 ; // Suppr
	 
//////////////////////////////////////////////////////////////////////////////     POWER UP
	if ((_this select 1)  == _keyCodeObjetUP) then 
{
hauteurObject = hauteurObject + VarIncHauteur; 
hint format ["%1", hauteurObject];
deleteVehicle Objet;

Objet = TypeObject createVehicle (getPosASLW player);
Objet allowDamage false;

Objet attachTo [player,[0,3,hauteurObject]];
Objet setdir Rotation; 
Objet attachTo [player,[0,3,hauteurObject]];
Objet setdir Rotation; 
if ( VarFloor == 1) then {
Objet setvectordirandup [[0,0,-1],[0,1,0]];
};
};

//////////////////////////////////////////////////////////////////////////////     POWER DOWN
	if ((_this select 1)  == _keyCodeObjetDOWN) then 
{
hauteurObject = hauteurObject - VarIncHauteur; 
deleteVehicle Objet;

Objet = TypeObject createVehicle (getPosASLW player);
Objet allowDamage false;

Objet attachTo [player,[0,3,hauteurObject]];
Objet setdir Rotation; 
Objet attachTo [player,[0,3,hauteurObject]];
Objet setdir Rotation; 
if ( VarFloor == 1) then {
Objet setvectordirandup [[0,0,-1],[0,1,0]];
};
};


//////////////////////////////////////////////////////////////////////////////     Pauser
	if ((_this select 1)  == _keyCodePauser) then 
{

if (VarFloor == 1) then {
_Objet2 = TypeObject createVehicle (getPosASLW player);
_Objet2 setvectordirandup [[0,0,-1],[0,1,0]];
_Objet2 allowDamage false;
_Objet2 attachTo [player,[0,3,hauteurObject]];
_Objet2 setvectordirandup [[0,0,-1],[0,1,0]];
_Objet2 attachTo [player,[0,3,hauteurObject]];
detach _Objet2;
} else {
_Objet2 = TypeObject createVehicle (getPosASLW player);
_Objet2 attachTo [player,[0,3,hauteurObject]];
_Objet2 setdir Rotation; 
_Objet2 attachTo [player,[0,3,hauteurObject]];
_Objet2 setdir Rotation; 
detach _Objet2;
};
if (OptionObject == 1 ) then {
[[_Objet2,"<t color='#0099FF'>S'asseoir</t>","scripts\Chair\sitdown.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
};

//////////////////////////////////////////////////////////////////////////////     Tourner X
	if ((_this select 1)  == _keyCodeTournerX) then 
{

VarFloor = 0;
deleteVehicle Objet;
Rotation = Rotation + 45;
Objet = TypeObject createVehicle (getPosASLW player);
Objet allowDamage false;
Objet attachTo [player,[0,3,hauteurObject]];
Objet setdir Rotation; 
Objet attachTo [player,[0,3,hauteurObject]];
Objet setdir Rotation; 
};

//////////////////////////////////////////////////////////////////////////////     Tourner Y
	if ((_this select 1)  == _keyCodeTournerY) then 
{
VarFloor = 1;
deleteVehicle Objet;

Objet = TypeObject createVehicle (getPosASLW player);
Objet setvectordirandup [[0,0,-1],[0,1,0]];
Objet allowDamage false;
Objet attachTo [player,[0,3,hauteurObject]];
Objet setvectordirandup [[0,0,-1],[0,1,0]];
Objet attachTo [player,[0,3,hauteurObject]];
};

//////////////////////////////////////////////////////////////////////////////     Retour
	if ((_this select 1)  == _keyCodeObjetRetour) then 
{
deleteVehicle Objet;
exitWith {[] execVM "admintools\Objet\Construction\menu.sqf"};
};

};