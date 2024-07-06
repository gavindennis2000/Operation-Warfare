

var s = sprite_index;

/* draw rectangle for collision mask
draw_set_color(c_red);
draw_set_alpha(0.5);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
*/

// default text options
draw_set_color(w);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font3);



if (displayOptions == "start") {  // push start
	
	draw_set_font(font2);
	draw_text(rw, rh, "PUSH START");
	
}
	
else if (displayOptions == "menu") {  // start, continue, tutorial, quit
	
	// gray out 'load game' if there is no file to load
	if (!file_exists("save.txt"))
		b2 = gray;
	
	// show the options
	draw_text_color(rw, rh - 24, "NEW GAME", b1, b1, b1, b1, imgA);
	draw_text_color(rw, rh - 8, "CONTINUE", b2, b2, b2, b2, imgB);
	draw_text_color(rw, rh + 8, "TUTORIAL", b3, b3, b3, b3, imgC);
	draw_text_color(rw, rh + 24, "SETTINGS", b4, b4, b4, b4, imgD);
	
}

else if (displayOptions == "difficulty") {  // easy, normal, hard
	
	// gray out 'load game' if there is no file to load
	if (!file_exists("hard.txt"))
		c3 = #787878;
	
	
	// show the game difficulties
	draw_text_color(rw, rh - 16, "EASY", c1, c1, c1, c1, imgD);
	draw_text_color(rw, rh, "NORMAL", c2, c2, c2, c2, imgE);
	draw_text_color(rw, rh + 16, "HARD", c3, c3, c3, c3, imgF);
	
	// put a star next to completed difficulties 
	var comp = 40;
	
	if (easyComp) {
		draw_sprite(s, 8, rw + comp, rh - 16);
		draw_sprite(s, 8, rw - comp, rh - 16);
	}
	
	if (normalComp) {
		draw_sprite(s, 8, rw + comp, rh);
		draw_sprite(s, 8, rw - comp, rh);
	}
	
	if (hardComp) {
		draw_sprite(s, 8, rw + comp, rh + 16);
		draw_sprite(s, 8, rw - comp, rh + 16);
	}
		
}

else if (displayOptions == "settings") {
	
	// gray out 'sound test' if there is no file to load
	if (!hardComp)
		c4 = #787878;
	
	// show the settings
	draw_text_color(rw, rh - 24, "CONTROLS", c1, c1, c1, c1, imgA);
	draw_text_color(rw, rh - 8, "WATCH TRAILER", c2, c2, c2, c2, imgB);
	draw_text_color(rw, rh + 8, "CREDITS", c3, c3, c3, c3, imgC);
	draw_text_color(rw, rh + 24, "SOUND TEST", c4, c4, c4, c4, imgD);
	
}

else if (displayOptions == "sound test") {
	var h = 8;
	draw_text_color(rw, rh - h, "SOUND TEST", c_white, c_white, c_white, c_white, 1);
	if (variable_instance_exists(self, "soundtest"))
		draw_text_color(rw, rh + h, soundtest, #4428bc, #4428bc, #4428bc, #4428bc,  1);
}

else if (displayOptions == "controls") {  // change controller input

	draw_set_font(font4);
	
	// show the controls options
	var xDis = 126;
	draw_set_halign(fa_left);
	draw_text_color(rw - xDis, rh - 24, "JUMP/CONFIRM", b1, b1, b1, b1, 1);
	draw_text_color(rw - xDis, rh - 8, "SHOOT/CANCEL", b2, b2, b2, b2, 1);
	draw_text_color(rw - xDis, rh + 8, "TOGGLE", b3, b3, b3, b3, 1);
	draw_text_color(rw - xDis, rh + 24, "PAUSE", b4, b4, b4, b4, 1);
	
	draw_set_halign(fa_right);
	var test = 0
	draw_text_color(rw + xDis, rh - 24 + test, string_upper(input_binding_get("jump")), b11, b11, b11, b11, imgA);
	draw_text_color(rw + xDis, rh - 8 + test,  string_upper(input_binding_get("shoot")), b22, b22, b22, b22, imgB);
	draw_text_color(rw + xDis, rh + 8 + test,  string_upper(input_binding_get("select")), b33, b33, b33, b33, imgC);
	draw_text_color(rw + xDis, rh + 24 + test,  string_upper(input_binding_get("start")), b44, b44, b44, b44, imgD);
	
	draw_set_halign(fa_center);
	draw_text_color(rw, rh + 56, "DEFAULTS", b5, b5, b5, b5, 1);
	
}

// draw the hub
if (displayOptions == "difficulty") {
	
	var helpText = "test";
	draw_set_alpha(0.05);
	draw_set_color(#7c7c7c);
	draw_rectangle(0, 0, room_width, 19, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(font4);
	
	switch(diff) {
			
		case easy:
			helpText = ["FOR NEW PLAYERS. EASIER PLATFORMING","AND WEAKER ENEMIES."];
			break;
				
		case normal:
			helpText = ["THE REAL DEAL. TOUGH","BOSSES AND LOTS OF ENEMIES."];
			break;
				
		case hard:
			helpText =["THE ULTIMATE CHALLENGE.",""];
			break;
	
	}

	var drawY = 5; 
	if diff == hard 
		drawY = 9
		
	for (inc = 0; inc < 2; inc++)
		draw_text(room_width/2, drawY + inc*9, helpText[inc]);
	
}

// show the credits
if (showCredits) {
	
	// black rectangle
	draw_set_alpha(0.9);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	
	// the credits
	var arrLength = array_length(creditsNames);
	var t = 128;
	h = 50;
	for (i = 0; i < arrLength; i++) {
		draw_set_font(font4)
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_text(room_width/2 - t, i*15 + h, creditsNames[i][0]);	
		draw_set_halign(fa_right);
		draw_text(room_width/2 + t, i*15 + h, creditsNames[i][1]);	
	}
	
}

// draw the video if it's playing

var _videoData = video_draw();
var _videoStatus = _videoData[0];
if (_videoStatus == 0) {
	

	if (video_get_status() == video_status_playing) {
		
		draw_set_alpha(0.97);
		with objStar {image_alpha = 1}
		with (objTitle) { alarm[3] = alarmTime; }  // make sure you don't go to high score room

	}
	
	draw_surface(_videoData[1], -40, 0);
	
}

draw_set_alpha(1);