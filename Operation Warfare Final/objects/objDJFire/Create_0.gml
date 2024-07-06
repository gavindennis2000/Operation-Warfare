// set health for fire
fHealth = 1;

// check player existance
heExists = (
	instance_exists(objPlayer) and 
	!instance_exists(objPlayerDeath) and
	!instance_exists(objPlayerStart) and
	!instance_exists(objPlayerVictory))

// set direction facing
left = -1;
right = 1;

if (heExists)
	face = objPlayer.face;
else
	face = right;