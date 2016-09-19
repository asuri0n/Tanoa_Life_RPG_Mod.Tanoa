// Construction script by IDEO - Copyright 2014

_Stxt = parseText format
["
<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Construction</t><br/>
<t color='#FF3B3E' size='1.2' shadow='1' shadowColor='#000000' align='center'> By IDEO</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> PAGEUP	: Monter</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> DOWN		: Descendre</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> F5		: Tirer</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> F6		: Pousser</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> num5		: Poser</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> F7		: Aligner Nord/Sud/Est/Ouest</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> F12		: Supprimer</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Ins?r.	: Rotation 45?</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Debut	: Rotation Y</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Suppr.	: Retour</t><br/>
<t color='#99EEFF' size='0.8' shadow='1' shadowColor='#000000' align='right'>Copyright 2014 Altis-atrium.fr</t><br/>
"];
hintSilent _Stxt;

removeAllActions player;

ActionContructionPauser = player addaction ["Pauser",ScriptConstructionPauser];
Rotation = 0;
_info = _this select 3;
_NomObject = _info select 1;
TypeObject = _info select 0;
OptionObject = _info select 2;
deleteVehicle Objet;
VarFloor = 0;
Objet = TypeObject createVehicle (getPosASLW player);

Objet allowDamage false;

_bbr = boundingBoxReal Objet;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

hauteurObject =  _maxHeight / 2;
longueurObject =  _maxLength + 3;

Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;


if (isNull player) exitwith {} ;

dokeyUp={

	 VarIncHauteur = 0.05;
	 _keyCodeObjetUP = 201; // PAGEUP
	 _keyCodeObjetDOWN = 209; // PAGEDOWN
	 _keyCodePauser = 76   ; // 5
	 _keyCodeTournerX = 210; // Inser
	 _keyCodeTournerY = 199; // Debut
	 _keyCodeObjetRetour = 211 ; // Suppr
	 _keyCodeObjetTirer = 63 ; // F5
	 _keyCodeObjetPousser = 64 ; // F6
	 _keyCodeObjetAligner = 65 ; // F7
	 _keyCodeObjetSuppr = 88 ; // F12
//////////////////////////////////////////////////////////////////////////////     Hauteur +
	if ((_this select 1)  == _keyCodeObjetUP) then
{
hauteurObject = hauteurObject + VarIncHauteur;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;
if ( VarFloor == 1) then {
Objet setvectordirandup [[0,0,-1],[0,1,0]];
};
};

//////////////////////////////////////////////////////////////////////////////     Hauteur -
	if ((_this select 1)  == _keyCodeObjetDOWN) then
{
hauteurObject = hauteurObject - VarIncHauteur;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;

if ( VarFloor == 1) then {
Objet setvectordirandup [[0,0,-1],[0,1,0]];
};
};

//////////////////////////////////////////////////////////////////////////////     POUSSER
	if ((_this select 1)  == _keyCodeObjetPousser) then
{
longueurObject = longueurObject + VarIncHauteur;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;
if ( VarFloor == 1) then {
Objet setvectordirandup [[0,0,-1],[0,1,0]];
};
};

//////////////////////////////////////////////////////////////////////////////     TIRER
	if ((_this select 1)  == _keyCodeObjetTirer) then
{
longueurObject = longueurObject - VarIncHauteur;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;

if ( VarFloor == 1) then {
Objet setvectordirandup [[0,0,-1],[0,1,0]];
};
};
//////////////////////////////////////////////////////////////////////////////     Tourner X
	if ((_this select 1)  == _keyCodeTournerX) then
{

VarFloor = 0;
Rotation = Rotation + 45;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;

};

//////////////////////////////////////////////////////////////////////////////     Tourner Y
	if ((_this select 1)  == _keyCodeTournerY) then
{

if (VarFloor == 1) then {
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setdir Rotation;
VarFloor = 0;
} else {
VarFloor = 1;
Objet attachTo [player,[0,longueurObject,hauteurObject]];
Objet setvectordirandup [[0,0,-1],[0,1,0]];
}
};

//////////////////////////////////////////////////////////////////////////////     Aligner
	if ((_this select 1)  == _keyCodeObjetAligner) then
{
_dirPlayer = getdir player ;
if ( ( _dirPlayer >= 315 && _dirPlayer <= 360) or ( _dirPlayer >= 0 &&  _dirPlayer < 45) ) then {
player setdir 0;
};
if (_dirPlayer >= 45 && _dirPlayer < 135 ) then {
player setdir 90;
};
if (_dirPlayer >= 135 && _dirPlayer < 225 ) then {
player setdir 180;
};
if (_dirPlayer >= 225 && _dirPlayer < 315 ) then {
player setdir 270;
};
};

//////////////////////////////////////////////////////////////////////////////     Supprimer
	if ((_this select 1)  == _keyCodeObjetAligner) then
{
deleteVehicle cursortarget ;
};
//////////////////////////////////////////////////////////////////////////////     Pauser
	if ((_this select 1)  == _keyCodePauser) then
{
if (VarFloor == 1) then {
Objet2 = TypeObject createVehicle (getPosASLW player);
Objet2 setvectordirandup [[0,0,-1],[0,1,0]];
Objet2 attachTo [player,[0,longueurObject,hauteurObject]];
Objet2 setvectordirandup [[0,0,-1],[0,1,0]];
Objet2 attachTo [player,[0,longueurObject,hauteurObject]];
Objet2 setvectordirandup [[0,0,-1],[0,1,0]];
detach Objet2;
} else {
Objet2 = TypeObject createVehicle (getPosASLW player);
Objet2 setdir Rotation;
Objet2 attachTo [player,[0,longueurObject,hauteurObject]];
Objet2 setdir Rotation;
Objet2 attachTo [player,[0,longueurObject,hauteurObject]];
Objet2 setdir Rotation;
detach Objet2;
};
if (OptionObject == 1 ) then {
[[Objet2,"<t color='#0099FF'>S'asseoir</t>","scripts\Chair\sitdown.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
if (OptionObject == 2 ) then {
nul = [Objet2,45,60,"Mobile"] execVM "fnc_radar.sqf"; Objet2 allowDamage false;
};
if (OptionObject == 3 ) then {
[[Objet2,"<t color='#8899FF'>Fermer</t>","admintools\Objet\Construction\FermerCible.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
[[Objet2,"<t color='#8899FF'>Ouvrir</t>","admintools\Objet\Construction\OuvrirCible.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
if (OptionObject == 4 ) then {
Objet2 SetObjectTextureGlobal [0,\vacation_textures\data\\Atrium-Info.paa"];
};
if (OptionObject == 5 ) then {
Objet2 enableSimulation false ;
};
if (OptionObject == 6 ) then {
[[Objet2,"<t color='#FFFF55'>S'entrainer</t>","admintools\Objet\Construction\ActiverMouvement.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
if (OptionObject == 10 ) then {
[[Objet2,"<t color='#FFFF88'>Boire Liqueur</t>","admintools\Objet\Boissons\liqueur.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
if (OptionObject == 11 ) then {
[[Objet2,"<t color='#FFFF88'>Boire Bi?re</t>","admintools\Objet\Boissons\biere.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
if (OptionObject == 12 ) then {
[[Objet2,"<t color='#FFFF88'>Boire Whisky</t>","admintools\Objet\Boissons\sky.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
if (OptionObject == 13 ) then {
[[Objet2,"<t color='#FFFF88'>Boire Vodka</t>","admintools\Objet\Boissons\vodka.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;
};
};
//////////////////////////////////////////////////////////////////////////////     Retour
	if ((_this select 1)  == _keyCodeObjetRetour) then
{
deleteVehicle Objet;
 if true exitWith {[] execVM ScriptConstructionMenu};
};
};

sleep 0.5;
waituntil {!(IsNull (findDisplay 46))};
ChangeObjetHandler = (FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyUp"];


