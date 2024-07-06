// modified parent event
// its different because the runner can face left and right
if instance_exists(objPlayerStart) or (dontMove)
	exit;

if (!place_meeting(x,y+1, objWall)) {
	
	if room == roomStageFinal
		sprite_index = sprRunnerFinalJump;
	else
		sprite_index = sprRunnerJump;
		
}

else {
	
	if room == roomStageFinal
		sprite_index = sprRunnerFinal;
	else
		sprite_index = sprRunner;
		
}

draw_sprite_ext(sprite_index, -1, x, y, -face, image_yscale, image_angle, image_blend, 255);
