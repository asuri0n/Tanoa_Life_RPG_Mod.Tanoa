_spawn = "C_Kart_01_F";
_posplr = [((getPos player) select 0) - 3, ((getPos player) select 1) + 3, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);

[[_spwnveh,"Conducteur","admintools\veh\Kart.sqf"],"Fock_addactionMP",true,true] spawn BIS_fnc_MP;