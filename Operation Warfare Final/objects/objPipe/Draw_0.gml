draw_self();

if (imageAlpha < 0) {
	
	draw_set_color(c_black);
	draw_set_alpha(imageAlpha);
	draw_rectangle(	camera_get_view_x(view_camera[0]), // draw a black rectangle to fade out the stage
					camera_get_view_y(view_camera[0]),
					camera_get_view_x(view_camera[0])+256,
					camera_get_view_y(view_camera[0])+room_height,
					false);
	
}