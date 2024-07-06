if (rectAlpha > 0) {
	
	var camX = camera_get_view_x(view_camera[0]);
	
	draw_set_color(c_black);
	if (room == roomStageFinal)
		draw_set_color(#4428bc);
	draw_set_alpha(rectAlpha);
	draw_rectangle(camX, 0, camX + 256, room_height, false);
}