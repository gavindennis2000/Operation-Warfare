if (state == stand)
	draw_sprite_ext(sprPlayerStand, -1, x, y, face, image_yscale, image_angle, image_blend, image_alpha);
if (state == run) {
	image_speed = 0.2;
	draw_sprite_ext(sprPlayerRun, -1, x, y, face, image_yscale, image_angle, image_blend, image_alpha);
}
if (state == jump) {
	draw_sprite_ext(sprPlayerJump, -1, x, y, face, image_yscale, image_angle, image_blend, image_alpha);
}



// black out the room to transition

if (next) {
	
	draw_set_alpha(rectAlpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	
}