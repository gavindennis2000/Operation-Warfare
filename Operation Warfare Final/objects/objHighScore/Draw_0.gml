if (newHighScore and !drawScore) {
	draw_set_font(font1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var h = 32;
	draw_text(room_width/2, room_height/2 - 30, "NEW HIGH SCORE!!");
	draw_text(room_width/2, room_height/2 + 10, "ENTER YOUR NAME");
	
	draw_set_color(c_red);
	var cursorX = room_width/2 - 58 + cursor*10.5
	var cursorY = room_height/2 + 30;
	var xDis = 10;
	var yDis = 5;
	draw_rectangle(cursorX, cursorY - yDis, cursorX + xDis, cursorY + yDis+1, false);
	
	draw_set_color(c_white);
	draw_text(room_width/2, room_height/2 + 30, string_upper(tempName));
	
}

else if (drawScore and dsTemp) {
	
	draw_set_font(font1);
	draw_set_halign(fa_center);
	var h = 32;
	draw_text(room_width/2, 32, "HIGH SCORE");
	
	var w = 40;
	
	// draw the names
	for (i = 0; i < 5; i++) {
		
		draw_set_halign(fa_left);
		draw_text(w, h + 30 + i*30, highScores[i].name);
	}
	// draw the scores
	for (i = 0; i < 5; i++) {
		
		draw_set_halign(fa_right);
		draw_text(room_width-w, h + 30 + i*30, highScores[i].hscore);
	}
	
}