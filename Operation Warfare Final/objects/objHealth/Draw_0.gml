// dont draw on the title screen, stage select, or game over
if (room == roomGameOver or
	room == roomStory or
	room == roomTitle or
	room == roomStageSelect or
	room == roomStageSpecial or
	room == roomPowerUp or 
	room == roomPractice or 
	room == roomEnding or
	room == roomCredits )
or (instance_exists(objPlayerStart))
	exit;


// draw the health bar
if variable_global_exists("playerHealth") {
	
	draw_set_alpha(0.8);
	
	var life = global.playerHealth;
	var camX = camera_get_view_x(view_camera[0]);
	var camY = 0;
	
	for (i = 1; i <= life; i++) {
	
		if (i > 6) {
			exit;
		}
		else if (i > 3) {
			camX = camera_get_view_x(view_camera[0]) - 24*3;
			camY = 24;
		}
		else {
			camX = camera_get_view_x(view_camera[0]);
			camY = 0;
		}
			
		draw_sprite(sprHealth, 0, camX + i*24 - 24 + 2, camY + 2)
		
	}
}	
	