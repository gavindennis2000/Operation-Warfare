	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);

	draw_set_color(c_black); 
	draw_set_alpha(fadeAlpha); 
	draw_rectangle(camX, camY, camX+256, camY+224, false);