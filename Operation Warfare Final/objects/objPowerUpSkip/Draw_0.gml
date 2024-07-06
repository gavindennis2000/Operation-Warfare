/// @description black out the room to transition
// draw the can skip 
var c = c_white;
if (canSkip) {
	
	draw_set_font(font4);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_color(room_width/2, 3, "PUSH START TO SKIP", c, c, c, c, skipAlpha);
	
}
// black out the room
if (next) {
	
	draw_set_alpha(rectAlpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	
}