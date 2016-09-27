_spawn = "B_UAV_02_CAS_F";
_posplr = [((getPos player) select 0) - 3, ((getPos player) select 1) + 3, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);

player addItem "B_UAVTerminal"; 
player assignItem "B_UAVTerminal"; 
player addBackpack "B_UAV_01_backpack_F";  