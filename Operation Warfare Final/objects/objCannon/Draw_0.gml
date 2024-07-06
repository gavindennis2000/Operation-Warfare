if (room == roomStageFinal) 
	sprite_index = sprCannonFinal;

// inherit parent event
event_inherited()

// rotating cannon arm
if (!instance_exists(objPlayerStart)) and (!dontShoot) {
	
	if (room == roomStageFinal) 
		draw_sprite_ext(sprCannonArmFinal, 0, x, y, 1, 1, point_direction(x, y, playerX, playerY), image_blend, image_alpha);
	else
		draw_sprite_ext(sprCannonArm, 0, x, y, 1, 1, point_direction(x, y, playerX, playerY), image_blend, image_alpha);

}