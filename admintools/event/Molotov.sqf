speedPower = 20;
_molotovactif = 1;
deleteVehicle bomb;  
deletevehicle _molotov;
//player allowDamage false;
_bouteille = "Land_BottlePlastic_V1_F";

_molotov = _bouteille createVehicle[0,0,0];
_molotov attachto [player,[-0.1,-0.1,-0.1], "righthandmiddle1"]; 
player playmove "AwopPercMstpSgthWnonDnon_start";

waitUntil { ((animationState player) == "AwopPercMstpSgthWnonDnon_end") };

_vel = velocity player;
_dir = direction player;
test = getpos _molotov ;
hauteur = (test select 2) - 1.3;
//_elevation    = acos (_dir select 2); 
cutText[format["%1",hauteur],"PLAIN"];
detach _molotov;
_molotov setVelocity [(_vel select 0)+(sin _dir*speedPower),(_vel select 1)+(cos _dir*speedPower),(_vel select 2)+ (hauteur*50)];


waitUntil { (getPos _molotov select 2) <= 0.2 && _molotovactif == 1};
_molotovactif = 0;
_molotov setVelocity [0,0,0];
player say3D "MolotovSound";
//playSound3D ["D:\Users\Ideo\Documents\Arma 3 - Other Profiles\Brako\missions\Nitro.Altis\scripts\Molotov\Untitled.ogg", _molotov];
_explosion = "test_EmptyObjectForFireBig";
bomb = _explosion createVehicle(position _molotov);
bomb attachTo [_molotov,[0,0,0]];

sleep 10;
{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach (bomb nearObjects 5);   
deleteVehicle bomb;  
deletevehicle _molotov;

//player playmove "AmovPercMstpSnonWnonDnon_exerciseKata";
//player playmove "AmovPercMstpSnonWnonDnon_exercisePushup";

//[] call BIS_fnc_animViewer;

