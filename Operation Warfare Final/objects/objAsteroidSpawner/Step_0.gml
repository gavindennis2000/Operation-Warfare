var camX = camera_get_view_x(view_camera[0]);

if (global.checkpoint)
	instance_destroy();

if (instance_exists(objPlayer)) {
	
	if (camX + 256 > x && fireAsteroid && !instance_exists(objAsteroid)) {
	
		fireAsteroid = false;
		
		var asteroidY = room_height / 6;
		with instance_create_layer(camX+256, asteroidY, "Player", objAsteroid) {
			if (instance_exists(objHard))
				speed++;
		}
		
		with instance_create_layer(camX+256, room_height-asteroidY, "Player", objAsteroid) {
			if (instance_exists(objHard))
				speed++;
		}
	
	}
	
	if (objPlayer.x - 1000 > x)
		instance_destroy();
}