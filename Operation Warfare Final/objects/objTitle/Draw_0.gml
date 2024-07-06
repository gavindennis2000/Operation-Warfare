// draw the screen without the character at first
if (y != 0) {
	draw_sprite(sprite_index, 0, x, y); 
}
	
// draw the character after the screen is done moving
else {
	draw_sprite(sprite_index, 0, x, y);
	draw_sprite(sprTitleCharacter, 0, 0, room_height);
	
	// created by gavin dennis
	draw_set_font(font4); 
	draw_set_color(c_white);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text(room_width, room_height, string_upper("Created by\nGavin Dennis"));
}

if (flash)
	draw_clear(c_white);
	
// draw the black rectangle
if (screenAlpha > 0) {
	
	draw_set_color(c_black);
	draw_set_alpha(screenAlpha);
	draw_rectangle(	camera_get_view_x(view_camera[0]), // draw a black rectangle to fade out the stage
					camera_get_view_y(view_camera[0]),
					camera_get_view_x(view_camera[0])+256,
					camera_get_view_y(view_camera[0])+room_height,
					false);
	
}