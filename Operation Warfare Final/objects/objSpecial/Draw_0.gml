// draw the rectangles
draw_set_color(c_black);
draw_rectangle(0, 27, room_width, 38, false);

if (array_length(ran) == 3)
	draw_rectangle(0, 59, room_width, 89, false);
else if (array_length(ran) == 4)
	draw_rectangle(0, 59, room_width, 99, false);
else	
	draw_rectangle(0, 59, room_width, 79, false);
	
// align the text
draw_set_halign(fa_left);	
draw_set_valign(fa_middle);

var c = c_white;
draw_set_font(font2);
draw_text_color(drawX, 32, string_upper("Congratulations!! You have discovered a hidden cheat code!!"), c, c, c, c, 1);

draw_set_font(fontCheat);
draw_set_halign(fa_center);

	
draw_text_color(room_width/2, 64, string_upper(ran[0]), c, c, c, c, 1);
draw_text_color(room_width/2, 74, string_upper(ran[1]), c, c, c, c, 1);
	
if (array_length(ran) >= 3)
	draw_text_color(room_width/2, 84, string_upper(ran[2]), c, c, c, c, 1);
if (array_length(ran) == 4)
	draw_text_color(room_width/2, 94, string_upper(ran[3]), c, c, c, c, 1);
	


