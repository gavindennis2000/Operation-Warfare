// restart the level when you press start
var keyStart = input_check_pressed("start");
var keyForward = input_check_pressed("jump");
	
// stop the object when it is in the middle of the screen	
if (y <= room_height/2) and (vspeed != 0) {
	playAgain = true;
	vspeed = 0; 
	y = room_height/2
}
	
// when the player presses start on the first screen
if ((keyStart or keyForward) and selection == 0 and next) {
	
	if (playAgain) {
		
		
		next = false; 
		with (instance_create_layer(room_width+16, y, layer, objTitleFire)) {  // create fire effect
			
			hspeed = -6;
			face = left;
			
		}
	}
	
	else if (vspeed != 0) and (y < room_height-20) {
		
		y = room_height/2;
		playAgain = true; 
		next = false; 
		alarm[3] = 10;
		
	}
}

// select one of the three menu options: retry, main menu, and quit
else if (keyForward and  selection < 4 and next) {
	
	var i = 20;
	switch(selection) {
		
		case 1:
			i = -20;
			break; 
			
		case 2:
			i = 0;
			break; 
			
		case 3:
			i = 20;
			break; 
		
	}
	with (instance_create_layer(-16, y+i, layer, objTitleFire)) {  // create fire effect
			
			next = false; 
			hspeed = 6;
			face = right;
			
	}
	next = false;
	
}

// confirm yes or no
else if (keyForward and  selection >= 4 and next) {
	
	if (cursor == yes) {
		
		i = 20
		with (instance_create_layer(room_width+16, y+i, layer, objTitleFire)) {  // create fire effect
			
				next = false; 
				hspeed = -6;
				face = left;
			
		}
		next = false;
		
	}
	else {
		next = false; 
		alarm[3] = 10; 
		selection = sPrev;
		cursor = no;
	
		// cursor sound effect
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
	}
	
}	

// collision with fire
if (place_meeting(x-64, y, objTitleFire) and selection == 0) {
	
	audio_stop_sound(sndFire);
	audio_play_sound(sndEnemyExplosion, 1, false);
	
	
	instance_create_layer(x,y, layer, objExplosion);
	with (objTitleFire) instance_destroy();
	
	selection = 1;
	alarm[3] = 10;
}

else if (place_meeting(x+64, y, objTitleFire) and selection > 0 and selection < 4) {
	
	audio_stop_sound(sndFire);
	audio_play_sound(sndEnemyExplosion, 1, false);
	
	
	instance_create_layer(x,y, layer, objExplosion);
	with (objTitleFire) instance_destroy();
	
	sPrev = selection;
	switch(selection) {
	
		case 1:
			selection = 4; 
			break; 
			
		case 2:
			selection = 5; 
			break;
			
		case 3:
			selection = 6; 
			break;
			
	}
	alarm[3] = 10;
		
}

else if (place_meeting(x-64, y, objTitleFire) and selection >= 4 and cursor == no) {
	
	selection = sPrev;
	next = false; 
	alarm[3] = 10;
	
	audio_stop_sound(sndFire);
	audio_play_sound(sndEnemyExplosion, 1, false);
	instance_create_layer(x,y, layer, objExplosion);
	with (objTitleFire) 
		instance_destroy();
		
}

else if (place_meeting(x-64, y, objTitleFire) and selection >= 4 and cursor == yes) {
	
	with (objTitleFire)
		instance_destroy();
		
	audio_stop_all();
		
	switch(selection) {
	
		case 4:  //retry
			alarm[2] = 60; 
			visible = false;
			playAgain = false;	
			break; 
			
		case 5: // main menu
			alarm[2] = 60; 
			visible = false;
			playAgain = false;	
			break; 
			
		case 6:  // quit
			game_end();
			break;
	
	}
}

// color highlight for selection
if selection == 1
	b1 = #a4e4fc;
else
	b1 = c_white;
	
if selection == 2
	b2 = #a4e4fc;
else
	b2 = c_white;
	
if selection == 3
	b3 = #a4e4fc;
else
	b3 = c_white;
	
// cursor color
if (cursor == no) 
	b4 = #a4e4fc;
else 
	b4 = c_white;
	
if (cursor == yes) 
	b5 = #a4e4fc;
else 
	b5 = c_white;
	
// cursor movement
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");

if (selection >= 4 and (keyLeft or keyRight) and next) {
			
	// cursor sound effect
	if audio_is_playing(sndCursor)
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
	
	if (cursor == no)	
		cursor = yes;
	else 
		cursor = no;
}
	
	
// change selection
var keyUp = input_check_pressed("up");
	
var keyDown =  input_check_pressed("down");
	
if (keyDown and selection > 0 and selection < 4 and next) {
	
	if selection == 1
		selection = 2;
	else if selection == 2
		selection = 3;
	else
		selection = 1;
		
	// cursor sound effect
	if audio_is_playing(sndCursor)
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
}

// move through menu options
if (keyUp and selection > 0 and selection < 4 and next) {
	
	if selection == 1
		selection = 3;
	else if selection == 2
		selection = 1;
	else
		selection = 2;
		
	if audio_is_playing(sndCursor)
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
}

// go back to previous screen
var keyBack = input_check_pressed("shoot");
if (keyBack and selection > 3 and next) {
	next = false; 
	alarm[3] = 10; 
	selection = sPrev;
	cursor = no;
	
	// cursor sound effect
	if audio_is_playing(sndCursor)
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
}
