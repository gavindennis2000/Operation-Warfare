if (state == start or state == stand)
	draw_sprite_ext(sprBoss2Run, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	
if (state == run) {
	draw_sprite_ext(sprBoss2Run, -1, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);	
}

if (state == jump) {
	draw_sprite_ext(sprBoss2Run, 1, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);	
}
	
if (state == special) {
	draw_sprite_ext(sprBoss2Special, -1, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
}