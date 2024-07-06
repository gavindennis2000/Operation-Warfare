if (canSee) {
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(font2);
	draw_text(  // draw the text on the screen
		camera_get_view_x(view_camera[0])+128, 
		camera_get_view_y(view_camera[0])+112,
		"READY"
	);
	//draw_sprite(sprPlayerStart, 0, camera_get_view_x(view_camera[0])+128,
	//						camera_get_view_y(view_camera[0])+112 );
}
else 
	draw_set_alpha(0);