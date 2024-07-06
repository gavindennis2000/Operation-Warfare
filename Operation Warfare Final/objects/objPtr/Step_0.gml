if (instance_exists(objPlayer) and !instance_exists(objPlayerDeath) and !instance_exists(objPlayerStart)) {
	if (objPlayer.state != objPlayer.start) {
		x = objPlayer.x;
		y = objPlayer.y;
	}
}