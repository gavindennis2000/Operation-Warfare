// inherit parent event
event_inherited()

// rotating cannon arm
if (!instance_exists(objPlayerStart)) and (!dontShoot)
	draw_sprite_ext(sprCannonArm, 0, x, y, 1, 1, point_direction(x, y, playerX, playerY), image_blend, image_alpha);