ADMForce = 50;
cible = cursorTarget;
_dir = direction player;
cible setVelocity [sin _dir*ADMForce,cos _dir*ADMForce,ADMForce/5];