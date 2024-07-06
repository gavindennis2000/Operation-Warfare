//draw_self();
draw_set_font(font3);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
	
draw_text(x, y - 6, names[image_index, 0]);
draw_text(x, y + 6, names[image_index, 1]);

// draw the score when the credits are finished
if (finished) {
	
	var scoreHeight = room_height - 60;
	var scoreX = room_width/2 - 35;
	
	// draw the score
	if (instance_exists(objScore)) {
		
		draw_set_font(fontScore);
		
		var drawScore = objScore.compileScore()
		var space = 14;
		
		if (drawScore >= 999999) {
			draw_text(scoreX+space*5, scoreHeight, objScore.gameScore);
			draw_text(scoreX+space*4, scoreHeight, objScore.gameScore10);
		}

		else {
			draw_text(scoreX+space*5, scoreHeight, 0);
			draw_text(scoreX+space*4, scoreHeight, 0);
		}

		draw_text(scoreX+space*3, scoreHeight, objScore.gameScore100);
		draw_text(scoreX+space*2, scoreHeight, objScore.gameScore1000);
		draw_text(scoreX+space*1, scoreHeight, objScore.gameScore10000);
		draw_text(scoreX, scoreHeight, objScore.gameScore100000);
	
	/*
		draw_sprite(sprNumbers, objScore.gameScore, scoreX+70, scoreHeight); // 100s
		draw_sprite(sprNumbers, objScore.gameScore10, scoreX+56, scoreHeight); // 100s
		draw_sprite(sprNumbers, objScore.gameScore100, scoreX+42, scoreHeight); // 100s
		draw_sprite(sprNumbers, objScore.gameScore1000, scoreX+28, scoreHeight); // 1,000s
		draw_sprite(sprNumbers, objScore.gameScore10000, scoreX+14, scoreHeight); // 10,000s
		draw_sprite(sprNumbers, objScore.gameScore100000, scoreX, scoreHeight); // 100,000
		*/
	}
}