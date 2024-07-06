if (instance_exists(objStar)) {
	if (objStar.flashRectangle == 1) {
		
		draw_set_color(c_white);
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, room_width, room_height, false);
	}
}