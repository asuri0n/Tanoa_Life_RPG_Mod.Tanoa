if(!invo_godmod) exitwith {};
cutText ["Cliquez quelque part sur la carte pour vous téléporter", "PLAIN"];

teleportationMAP={

_pos = [_this select 0, _this select 1, _this select 2];
(vehicle player) setpos [_pos select 0, _pos select 1, 0];
player setVariable["lastPos",1];
player setVariable["lastPos",[]];
onMapSingleClick "";
openMap [false, false];
};

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call teleportationMAP";