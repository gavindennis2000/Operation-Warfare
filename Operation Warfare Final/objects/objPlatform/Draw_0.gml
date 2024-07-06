if room == roomStageFinal
	if (x >= 3552)
		draw_sprite_ext(sprPlatformFinal, -1, x, y + 16, image_xscale, -1, image_angle, c_white, image_alpha);
	else
		draw_sprite_ext(sprPlatformFinal, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
else
	draw_sprite_ext(sprPlatform, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);