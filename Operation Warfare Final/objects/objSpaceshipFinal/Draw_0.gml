
	draw_sprite_ext(sprite_index, image_index, x-3, y+vspeed*2, image_xscale, image_yscale, image_angle, image_blend, imgAlpha/3);

	draw_sprite_ext(sprite_index, image_index, x-6, y+vspeed*4, image_xscale, image_yscale, image_angle, image_blend, imgAlpha/5);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, imgAlpha);

// draw the black rectangle
if (fadeOut) {
	
	draw_set_color(c_black);
	draw_set_alpha(imageAlpha);
	draw_rectangle(	camera_get_view_x(view_camera[0]), // draw a black rectangle to fade out the stage
					camera_get_view_y(view_camera[0]),
					camera_get_view_x(view_camera[0])+256,
					camera_get_view_y(view_camera[0])+room_height,
					false);
	
}