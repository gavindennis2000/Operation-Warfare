// check player existance
heExists = (
	instance_exists(objPlayer) and
	!instance_exists(objPlayerStart) and
	!instance_exists(objPlayerDeath) and 
	!instance_exists(objPlayerVictory))

// destroy if out of health
if (fHealth <= 0)
	instance_destroy();
	
// set x and y position to the player
if (heExists) {
	
	x = objPlayer.x;
	y = objPlayer.y-2;
	
	if (objPlayer.state != objPlayer.jump)
		instance_destroy();
}
else if instance_exists(objPlayerPowerUp) {
	
	x = objPlayerPowerUp.x;
	y = objPlayerPowerUp.y-2;
	
	if (objPlayerPowerUp.state != objPlayerPowerUp.jump)
		instance_destroy();
}
else
	instance_destroy();