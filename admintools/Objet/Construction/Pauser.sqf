// Construction script by IDEO - Copyright 2014
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
Objet2 SetObjectTextureGlobal [0,Textures\\Atrium-Info.paa"];
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
Objet2 allowDamage false ;
