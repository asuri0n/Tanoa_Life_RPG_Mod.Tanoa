
_car = "C_Hatchback_01_sport_F";


 _positionVehicule = GetPos player;
 _posX = _positionVehicule select 0;
 _posY = _positionVehicule select 1;


_spwnveh1_1 = _car createVehicle[_posX,_posY,0];
_spwnveh1_1 setVariable ["Sarge",1,true];

_spwnveh1_2 = _car createVehicle[_posX + 3,_posY,0];
_spwnveh1_2 setVariable ["Sarge",1,true];

_spwnveh1_3 = _car createVehicle[_posX + 6,_posY,0];
_spwnveh1_3 setVariable ["Sarge",1,true];


_spwnveh2_1 = _car createVehicle[_posX,_posY - 5,0];
_spwnveh2_1 setVariable ["Sarge",1,true];

_spwnveh2_2 = _car createVehicle[_posX + 3,_posY - 5,0];
_spwnveh2_2 setVariable ["Sarge",1,true];

_spwnveh2_3 = _car createVehicle[_posX+6,_posY - 5,0];
_spwnveh2_3 setVariable ["Sarge",1,true];