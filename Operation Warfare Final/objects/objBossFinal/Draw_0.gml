// draw the boss

if (state == start)
	draw_sprite_ext(sprBossFinalRun, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	
else if (state == run) {
	image_speed = 1;
	draw_sprite_ext(sprBossFinalRun, -1, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);	
}

else if (state == jump) {
	if (!place_meeting(x, y+1, objWall))
		draw_sprite_ext(sprBossFinalJump, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	else 
		draw_sprite_ext(sprBossFinalRun, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	
}

else if (state == fall) or (state == finish) {
	if (!place_meeting(x, y+1, objWall))
		draw_sprite_ext(sprBossFinalJump, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	else 
		draw_sprite_ext(sprBossFinalRun, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	
}

else if (state == special) {
	
	
	var i = 2;
	var h = x - hspeed * i;
	var v = y - vspeed * i;
	
	var j = h - hspeed * i;
	var k = v -  vspeed * i;
	
	draw_sprite_ext(sprBossFinalJump, 0, h, v, -face, image_yscale, image_angle, image_blend, imgAlpha*0.5);
	draw_sprite_ext(sprBossFinalJump, 0, j, k, -face, image_yscale, image_angle, image_blend, imgAlpha*0.25);
	draw_sprite_ext(sprBossFinalJump, 0, x, y, -face, image_yscale, image_angle, image_blend, imgAlpha);
	
}