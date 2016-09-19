_veh = vehicle player;
if ((side player == civilian) || !(_veh getVariable ["siren",false])) then {
        if (_veh isKindOf "CAR") Then {
        _limitation = _this select 0;
        _Location = _this select 1;
        _speed = (speed _veh);
        _contravention = (_speed-_limitation)*60;

        hint parseText format["Tu a été flashé à <t color='#ff0000'>%1</t> km/h dans une zone limité à <t color='#8cff9b'>%2</t> km/h sur <t color='#08abc4'>%3</t>.<br/>Par conséquent <t color='#ff0000'>%4</t> € on été prélevés dans ton compte en banque",_speed,_limitation,_Location,_contravention];
        };
};