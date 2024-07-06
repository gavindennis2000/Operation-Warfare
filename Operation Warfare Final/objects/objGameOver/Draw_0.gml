var i = 25;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font2);

if selection == 0 {  // draw the game over text
	draw_set_font(font2);
	draw_text_color(x, y, "GAME OVER", c_white, c_white, c_white, c_white, 1);
	
}
	
else if (selection < 4) {  // game over options
	
	draw_text_color(x, y - 20, "RETRY", b1, b1, b1, b1, 1);  // RETRY
	draw_text_color(x, y, "MAIN MENU", b2, b2, b2, b2, 1);  // MAIN MENU
	draw_text_color(x, y + 20, "QUIT", b3, b3, b3, b3, 1);  // QUIT
	
}

else if (selection == 4) {  // retry yes no
	
	draw_text_color(x, y, "RETRY LEVEL?", c_white, c_white, c_white, c_white, 1);  // retry
	draw_text_color(x - i, y + 20, "NO", b4, b4, b4, b4, 1);  // no
	draw_text_color(x + i, y + 20, "YES", b5, b5, b5, b5, 1);  // yes
	
}

else if (selection == 5) {  // main menu yes no
	
	draw_text_color(x, y, "GO TO THE MAIN MENU?", c_white, c_white, c_white, c_white, 1);  // main menu
	draw_text_color(x - i, y + 20, "NO", b4, b4, b4, b4, 1);  // no
	draw_text_color(x + i, y + 20, "YES", b5, b5, b5, b5, 1);  // yes
	
}

else if (selection == 6) {  // quit yes no
	
	draw_text_color(x, y, "QUIT GAME?", c_white, c_white, c_white, c_white, 1);  // retry
	draw_text_color(x - i, y + 20, "NO", b4, b4, b4, b4, 1);  // no
	draw_text_color(x + i, y + 20, "YES", b5, b5, b5, b5, 1);  // yes
	
}