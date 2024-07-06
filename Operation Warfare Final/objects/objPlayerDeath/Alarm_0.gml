// if the player is out of health it's game over
if (global.playerHealth == 0) {
	gameOver();
	exit; }

// otherwise create a new player object

// check for fire reset
if (room == roomStage2 and xInitial >= 2260 and xInitial < 2976) {
	objCamera.fireReset();
}

// check for shock reset
else if (room == roomStage3 and objCamera.x >= 3500 and xInitial < 4608) {
	objCamera.shockReset();
}

// check for space reset
else if (room == roomStageFinal and xInitial >= 2896 and xInitial < 3888) {
	objCamera.spaceReset();
}

// check for spaceship reset
else if (room == roomStageFinal and xInitial >= 4960 and xInitial < 6400) {
	objCamera.spaceshipReset();
}

else {
	
	if image_yscale == 1 {
		instance_create_layer(
			camera_get_view_x(view_camera[0]+16),
			camera_get_view_y(view_camera[0]+16),
			"Player", objPlayer
		);
	}
	
	else {
		with (instance_create_layer(
			camera_get_view_x(view_camera[0]+16),
			camera_get_view_y(view_camera[0]+room_height-16),
			"Player", objPlayer)
		) {
				
			image_yscale = -1;
			y = room_height-38;
				
		};
	}
		
	instance_destroy();
}