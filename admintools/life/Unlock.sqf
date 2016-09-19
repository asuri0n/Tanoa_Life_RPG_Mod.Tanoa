_veh = vehicle player;
if (_veh == player) Then {_veh = cursorTarget};
if (locked _veh > 1) Then {_veh lock false} else {_veh lock true};
