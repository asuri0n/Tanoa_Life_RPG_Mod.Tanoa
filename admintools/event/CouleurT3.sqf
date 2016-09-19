/*////////////////////////////////////////////////////////////////////////////////////////////
Auteur : Ideo
Changement de couleurs du vetement du joueur
////////////////////////////////////////////////////////////////////////////////////////////*/



_r = 0.001; // init couleur rouge
_g = 0.001; // init couleur vert
_b = 0.001; // init couleur bleu
_a = 0.5; // saturation 0 - 1
_varSleep = 0.1;  // vitesse de changement de couleur
_varInc = 0.01; // valeur d'incrementation
_varContrast = 50; // Nombre de changement de couleur
_target = cursorTarget;
////////////////////////////////////////////////////////////////////////////////////////////

player removeAction ActionStopCouleur;
stopCouleurs = 0;
ActionStopCouleur = player addAction ["Stop couleur",{stopCouleurs = 1;}];




for "_i" from 0 to (_varContrast - 1) do {
_r = _r + _varInc;
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
sleep _varSleep;
while {stopCouleurs == 0} do {
for "_i" from 0 to (_varContrast - 1) do {
_g = _g + _varInc;
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
sleep _varSleep;
for "_i" from 0 to (_varContrast - 1) do {
_r = _r - _varInc;
if (_r <=0 ) then {_r=0};
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
sleep _varSleep;
for "_i" from 0 to (_varContrast - 1) do {
_b = _b + _varInc;
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
sleep _varSleep;
for "_i" from 0 to (_varContrast - 1) do {
_g = _g - _varInc;
if (_g <=0 ) then {_g=0};
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
sleep _varSleep;
for "_i" from 0 to (_varContrast - 1) do {
_r = _r + _varInc;
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
for "_i" from 0 to (_varContrast - 1) do {
_b = _b - _varInc;
if (_b <=0 ) then {_b=0};
_couleur = [2,"#(argb,1,8,3)color("+format ["%1",_r]+","+format ["%1",_g]+","+format ["%1",_b]+","+format ["%1",_a]+")"];
_target setObjectTextureGlobal _couleur;
sleep _varSleep;
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};
};
sleep _varSleep;
};
if ( stopCouleurs == 1) exitWith { player removeAction ActionStopCouleur;};