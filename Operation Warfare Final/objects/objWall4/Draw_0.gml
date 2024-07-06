draw_self();

if (speed != 0) {
	draw_sprite_ext(sprite_index, image_index, x-4*sign(speed), y-4*sign(speed), image_xscale, image_yscale, image_angle, image_blend, 0.33);
	draw_sprite_ext(sprite_index, image_index, x-8*sign(speed), y-8*sign(speed), image_xscale, image_yscale, image_angle, image_blend, 0.2);
	
}