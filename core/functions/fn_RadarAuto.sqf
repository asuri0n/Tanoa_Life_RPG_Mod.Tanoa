if (RadarOn) Then {
RadarOn = false;
_veh = vehicle player;
_limitation = _this select 0;
_Location = _this select 1;
_speed = round (sqrt(speed _veh)^2);
_contravention = (_speed-_limitation)*60;
	if (_veh isKindOf "CAR" && (driver _veh) == player && (_speed-_limitation) > 0) Then {
			if ((side player == civilian) || !(_veh getVariable ["siren",false])) then {

		hint parseText format["Tu a été flashé à <t color='#ff0000'>%1</t> km/h dans une zone limité à <t color='#8cff9b'>%2</t> km/h sur <t color='#08abc4'>%3</t>.<br/>Par conséquent <t color='#ff0000'>%4</t> € on été prélevés dans ton compte en banque",_speed,_limitation,_Location,_contravention];

			if (life_dabliquide > _contravention) Then {life_dabliquide = life_dabliquide - _contravention;["RadarAuto", true, -1 * _contravention] call life_fnc_antiCheatCash;};
		};
	};
};
