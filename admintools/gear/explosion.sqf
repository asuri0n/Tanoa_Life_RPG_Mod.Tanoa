_gen = _this select 0;
_id = _this select 2;
player removeAction _id;
_explosion = "HelicopterExploBig" createVehicle(position player);
player setDamage 1;