if (state == start or state == stand)
	draw_sprite_ext(sprBoss3Run, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	
if (state == run) {
	sprite_index = sprBoss3Run
	image_speed = 0.25;
	draw_sprite_ext(sprite_index, -1, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);	
}

if (state == jump) {
	draw_sprite_ext(sprBoss3Jump, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);	
}
	
if (state == special) {
	
	if (glow) {
		
	glowTicker++;
	var tick = round(glowTicker/2)
	
	if (glowTicker % 2 != 0)
		imgAlpha = 0.1;
	else
		imgAlpha = 1;
	}

	sprite_index = sprBoss3Special;
	image_speed = imgSpeed;
	draw_sprite_ext(sprite_index, -1, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
}

if (flash)
	draw_clear(c_white);