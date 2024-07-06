// if the player touches the ship
if (place_meeting(x, y, objPlayer) and !instance_exists(objPlayerDeath)) {
	
	// transform player
	with (objPlayer) {
		instance_change(objPlayerSpaceship, true);
	}
	
	// destroy self
	instance_destroy();
	
}