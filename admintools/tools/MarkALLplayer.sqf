// Copyright 2014 Altis-azura.fr
if(!isDedicated) then {
    waitUntil {!isNull player && isPlayer player};
    private["_unit", "_unitList", "_mySide", "_unitName", "_aMarker", "_aMarker"];
    player addMPEventHandler ["MPRespawn", { [_this select 0] spawn pinMarkerF;}];
    pinMarkerF = {
        _unit = (_this select 0);
        _unitList = allUnits;
        _mySide = side _unit;
        {
            if((side _x) == _mySide) then {
                _unitName = name _x;
                _aMarker = vehicleVarName _x;
                _aMarker = createMarkerLocal [_aMarker,[0,0]];
                _aMarker setMarkerShapeLocal "ICON";
                _aMarker setMarkerTypeLocal "mil_dot";
                _aMarker setMarkerTextLocal _unitName;
                _aMarker setMarkerSizeLocal [1,1];
                _aMarker setmarkerDirLocal (getdir _x);
                _aMarker setMarkerPosLocal (getPos _x);
                _aMarker setMarkerTextLocal _unitName;
                _aMarker setMarkerColorLocal "ColorGreen";
            };
        } foreach _unitList;
        
        while {alive _unit} do {
            {
            _aMarker = vehicleVarName _x;
            _aMarker setMarkerDirLocal (getDir _x);
            _aMarker setMarkerPosLocal (getPos _x);
            } foreach _unitList;
                sleep 0.2; 
        };
        _myVarName = vehicleVarName _unit;
        _myVarName setMarkerColorLocal "ColorBlack";
        sleep 3;
        deleteMarkerLocal _myVarName;
    };
    [player] spawn pinMarkerF;
};if(!isDedicated) then {
    waitUntil {!isNull player && isPlayer player};
    private["_unit", "_unitList", "_mySide", "_unitName", "_aMarker", "_aMarker"];
    player addMPEventHandler ["MPRespawn", { [_this select 0] spawn pinMarkerF;}];
    pinMarkerF = {
        _unit = (_this select 0);
        _unitList = allUnits;
        _mySide = side _unit;
        {
            if((side _x) == _mySide) then {
                _unitName = name _x;
                _aMarker = vehicleVarName _x;
                _aMarker = createMarkerLocal [_aMarker,[0,0]];
                _aMarker setMarkerShapeLocal "ICON";
                _aMarker setMarkerTypeLocal "mil_dot";
                _aMarker setMarkerTextLocal _unitName;
                _aMarker setMarkerSizeLocal [1,1];
                _aMarker setmarkerDirLocal (getdir _x);
                _aMarker setMarkerPosLocal (getPos _x);
                _aMarker setMarkerTextLocal _unitName;
                _aMarker setMarkerColorLocal "ColorGreen";
            };
        } foreach _unitList;
        
        while {alive _unit} do {
            {
            _aMarker = vehicleVarName _x;
            _aMarker setMarkerDirLocal (getDir _x);
            _aMarker setMarkerPosLocal (getPos _x);
            } foreach _unitList;
                sleep 0.2; 
        };
        _myVarName = vehicleVarName _unit;
        _myVarName setMarkerColorLocal "ColorBlack";
        sleep 3;
        deleteMarkerLocal _myVarName;
    };
    [player] spawn pinMarkerF;
};