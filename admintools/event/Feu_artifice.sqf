///////////////////////////////////////
//  Firefork script 0.5 by Ideo      //  
//  copyright 2014        			 //       
///////////////////////////////////////


// Nombres de fusées :
_nbr_tires = 5;

// Hauteur des explosions :
_height = 400;

// Randomisation de l'explosion :
_x = 20;
_y = 20;
_z = 20;

// Coefficient du rayon :
_c = 1.5;

// Delai entre eplosions en secondes :
_delay = 0.2;

// Initialisation de la position de lancement sur le marqueur :
_initpos =  GetPos player;
//_initpos = getPos player; // Pour lancer a partir du joueur

Origin = "Land_Battery_F" createVehicle (_initpos);

// Allumage des fusées
Fusee = "Smokeshell" createVehicle (getPos Origin);
Fusee attachto [player,[0.1,-0.1,-0.1], "lefthandmiddle1"]; 
detach Fusee;
sleep 2;


// Lancement des fusées
Fusee setVelocity [0, 0, 50];
sleep 2;
deleteVehicle Fusee;


_pos    = Origin;


_InitExplosion = "HelicopterExploBig";		// Type d'explosion intial
_explosion = "HelicopterExploSmall";	// Type d'explosion multiples, "grenade"


 _nouvelpos = GetPos _pos;
 _posX = _nouvelpos select 0;
 _posY = _nouvelpos select 1;
 _k = _c;
 _bomb1 = _InitExplosion createVehicle[_posX,_posY,_height];
 for [{_i = 0},{_i < _nbr_tires},{_i = _i + 1}] do
{  
//_k = _k + (_c * 0.1); // Effet de grossissement du rayon
_k = _c * (random 1.5) ; // Effet de grossissement du rayon

_bomb1_0 = _explosion createVehicle[_posX + random _x,_posY + (80 * _k) + random _y, _height + random _z];
_bomb2_0 = _explosion createVehicle[_posX + random _x,_posY - (80 * _k) + random _y, _height + random _z];
sleep 0.01;
_bomb1_1 = _explosion createVehicle[_posX + (24.721 * _k) + random _x,_posY + (64.721 * _k) + random _y,_height -(40 * _k) + random _z];
_bomb2_1 = _explosion createVehicle[_posX - (24.721 * _k) + random _x,_posY + (64.721 * _k) + random _y,_height -(40 * _k) + random _z];
_bomb3_1 = _explosion createVehicle[_posX + (24.721 * _k) + random _x,_posY + (64.721 * _k) + random _y,_height + (40 * _k) + random _z];
_bomb4_1 = _explosion createVehicle[_posX - (24.721 * _k) + random _x,_posY + (64.721 * _k) + random _y,_height + (40 * _k) + random _z];
sleep 0.01;
_bomb1_2 = _explosion createVehicle[_posX + (24.721 * _k) + random _x,_posY - (64.721 * _k) + random _y,_height -(40 * _k) + random _z];
_bomb2_2 = _explosion createVehicle[_posX - (24.721 * _k) + random _x,_posY - (64.721 * _k) + random _y,_height -(40 * _k) + random _z];
_bomb3_2 = _explosion createVehicle[_posX + (24.721 * _k) + random _x,_posY + (64.721 * _k) + random _y,_height + (40 * _k) + random _z];
_bomb4_2 = _explosion createVehicle[_posX - (24.721 * _k) + random _x,_posY + (64.721 * _k) + random _y,_height + (40 * _k) + random _z];
sleep 0.01;

_bomb1_3 = _explosion createVehicle[_posX + (42.058 * _k) + random _x,_posY +(68.052 * _k) + random _y,_height + random _z];
_bomb2_3 = _explosion createVehicle[_posX - (42.058 * _k) + random _x,_posY +(68.052 * _k) + random _y,_height + random _z];
_bomb3_3 = _explosion createVehicle[_posX + (42.058 * _k) + random _x,_posY -(68.052 * _k) + random _y,_height + random _z];
_bomb4_3 = _explosion createVehicle[_posX - (42.058 * _k) + random _x,_posY -(68.052 * _k) + random _y,_height + random _z];
sleep 0.01;
_bomb1_4 = _explosion createVehicle[_posX + random _x,_posY + (42.058 * _k) + random _y,_height + (68.052 * _k) + random _z];
_bomb2_4 = _explosion createVehicle[_posX + random _x,_posY + (42.058 * _k) + random _y,_height - (68.052 * _k) + random _z];
_bomb3_4 = _explosion createVehicle[_posX + random _x,_posY - (42.058 * _k) + random _y,_height - (68.052 * _k) + random _z];
_bomb4_4 = _explosion createVehicle[_posX + random _x,_posY - (42.058 * _k) + random _y,_height + (68.052 * _k) + random _z];
sleep 0.01;

_bomb1_5 = _explosion createVehicle[_posX + (40 * _k) + random _x,_posY + (24.721 * _k) + random _y,_height -(64.721 * _k) + random _z];
_bomb2_5 = _explosion createVehicle[_posX - (40 * _k) + random _x,_posY + (24.721 * _k) + random _y,_height -(64.721 * _k) + random _z];
_bomb3_5 = _explosion createVehicle[_posX + (40 * _k) + random _x,_posY + (24.721 * _k) + random _y,_height +(64.721 * _k) + random _z];
_bomb4_5 = _explosion createVehicle[_posX - (40 * _k) + random _x,_posY + (24.721 * _k) + random _y,_height +(64.721 * _k) + random _z];
_bomb5_5 = _explosion createVehicle[_posX + (40 * _k) + random _x,_posY - (24.721 * _k) + random _y,_height -(64.721 * _k) + random _z];
_bomb6_5 = _explosion createVehicle[_posX - (40 * _k) + random _x,_posY - (24.721 * _k) + random _y,_height -(64.721 * _k) + random _z];
_bomb7_5 = _explosion createVehicle[_posX + (40 * _k) + random _x,_posY - (24.721 * _k) + random _y,_height +(64.721 * _k) + random _z];
_bomb8_5 = _explosion createVehicle[_posX - (40 * _k) + random _x,_posY - (24.721 * _k) + random _y,_height +(64.721 * _k) + random _z];
sleep 0.01;
_bomb1_6 = _explosion createVehicle[_posX + (64.721 * _k) + random _x,_posY + (40 * _k) + random _y,_height -(24.721 * _k) + random _z];
_bomb2_6 = _explosion createVehicle[_posX - (64.721 * _k) + random _x,_posY + (40 * _k) + random _y,_height -(24.721 * _k) + random _z];
_bomb3_6 = _explosion createVehicle[_posX + (64.721 * _k) + random _x,_posY + (40 * _k) + random _y,_height +(24.721 * _k) + random _z];
_bomb4_6 = _explosion createVehicle[_posX - (64.721 * _k) + random _x,_posY + (40 * _k) + random _y,_height +(24.721 * _k) + random _z];
_bomb5_6 = _explosion createVehicle[_posX + (64.721 * _k) + random _x,_posY - (40 * _k) + random _y,_height -(24.721 * _k) + random _z];
_bomb6_6 = _explosion createVehicle[_posX - (64.721 * _k) + random _x,_posY - (40 * _k) + random _y,_height -(24.721 * _k) + random _z];
_bomb7_6 = _explosion createVehicle[_posX + (64.721 * _k) + random _x,_posY - (40 * _k) + random _y,_height +(24.721 * _k) + random _z];
_bomb8_6 = _explosion createVehicle[_posX - (64.721 * _k) + random _x,_posY - (40 * _k) + random _y,_height +(24.721 * _k) + random _z];
sleep 0.01;
_bomb1_7 = _explosion createVehicle[_posX + (68.052 * _k) + random _x,_posY + random _y,_height -(42.058 * _k) + random _z];
_bomb2_7 = _explosion createVehicle[_posX - (68.052 * _k) + random _x,_posY + random _y,_height -(42.058 * _k) + random _z];
_bomb3_7 = _explosion createVehicle[_posX + (68.052 * _k) + random _x,_posY + random _y,_height +(42.058 * _k) + random _z];
_bomb4_7 = _explosion createVehicle[_posX - (68.052 * _k) + random _x,_posY + random _y,_height +(42.058 * _k) + random _z];
sleep 0.01;
_bomb1_8 = _explosion createVehicle[_posX + (80 * _k) + random _x,_posY + random _y,_height + random _z];
_bomb2_8 = _explosion createVehicle[_posX - (80 * _k) + random _x,_posY + random _y,_height + random _z];

sleep _delay;
};

deleteVehicle Origin;