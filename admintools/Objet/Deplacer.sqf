// Superman script by IDEO - Copyright 2014 Altis-azura.fr

_Stxt = parseText format
["
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Inser.   : Tourner vers la gauche</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Debut	: Tourner vers la droite</t><br/>
<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> PAGEUP	: Monter</t><br/>
<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> DOWN		: Descendre</t><br/>
<t color='#99EEFF' size='0.8' shadow='1' shadowColor='#000000' align='right'>Copyright 2014 Altis-Azura.fr</t><br/>
"];
hintSilent _Stxt; 

PauserObjet = 0;
detach DeplaceObjet; 
player removeAction ActionDeplaceObjet;
DeplaceObjet = cursorTarget;
_bbr = boundingBoxReal DeplaceObjet; 
_p1 = _bbr select 0; 
_p2 = _bbr select 1;
maxLengthObjet = abs ((_p2 select 1) - (_p1 select 1)); 
maxHeightObjet = abs ((_p2 select 2) - (_p1 select 2));

DirectionObjet = 0;
cutText[format["%1",DeplaceObjet],"PLAIN"];
cutText[format["Angle = %1",DirectionObjet],"PLAIN"];
height = 0;
DeplaceObjet attachTo [player,[0, maxLengthObjet + 2, maxHeightObjet/2], ""];
ActionDeplaceObjet = player addaction ["Pauser",{PauserObjet = 1},""];


dokeyUp={
	 _keyCodeMonter = 201; // PAGEUP
	 _keyCodeDescendre = 209; // PAGEDOWN
	 _keyCodeTournerGauche = 210; // Inser
	 _keyCodeTournerDroite = 199; // Debut
//////////////////////////////////////////////////////////////////////////////     Monter
	if ((_this select 1)  == _keyCodeMonter && PauserObjet == 0 ) then 
{
height = height + 0.02;
DeplaceObjet attachTo [player,[0, maxLengthObjet + 2,maxHeightObjet/2 + height], ""];
cutText[format["Hauteur = %1",height],"PLAIN"];
};

//////////////////////////////////////////////////////////////////////////////     Descendre
	if ((_this select 1)  == _keyCodeDescendre && PauserObjet == 0 ) then 
{
height = height - 0.02;
DeplaceObjet attachTo [player,[0, maxLengthObjet + 2,maxHeightObjet/2 + height], ""];
cutText[format["Hauteur  = %1",height],"PLAIN"];
};

//////////////////////////////////////////////////////////////////////////////     Tourner gauche
	if ((_this select 1)  == _keyCodeTournerGauche && PauserObjet == 0 ) then 
{
DirectionObjet = DirectionObjet + 1;

DeplaceObjet attachTo [player,[0, maxLengthObjet + 2,maxHeightObjet/2 + height], ""];
DeplaceObjet setdir DirectionObjet;
cutText[format["Angle = %1",DirectionObjet],"PLAIN"];
};
		
//////////////////////////////////////////////////////////////////////////////     Tourner droite
	if ((_this select 1)  == _keyCodeTournerDroite && PauserObjet == 0 ) then 
{
DirectionObjet = DirectionObjet - 1;

DeplaceObjet attachTo [player,[0, maxLengthObjet + 2,maxHeightObjet/2 + height], ""];
DeplaceObjet setdir DirectionObjet;
cutText[format["Angle = %1",DirectionObjet],"PLAIN"];
};


if (PauserObjet == 1) exitWith {detach DeplaceObjet; player removeAction ActionDeplaceObjet};
};

waituntil {!(IsNull (findDisplay 46))};
(FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyUp"];  