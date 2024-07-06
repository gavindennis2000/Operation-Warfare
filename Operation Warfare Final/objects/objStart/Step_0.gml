var keyStart = input_check_pressed("start");
var keyForward = input_check_pressed("jump");
var keyBack = input_check_pressed("shoot");
var keyUp = input_check_pressed("up");
var keyDown = input_check_pressed("down");
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");

if 
	( ( (keyStart and displayOptions == "start") or keyForward) and next) {
		
	if (displayOptions == "start" and keyStart) {
		next = false;
		with (instance_create_layer(-16, rh, layer, objTitleFire)) {  // create fire effect
			hspeed = 6;
			face = right;
		}
	}
	// first options menu
	else if (displayOptions == "menu") {
		next = false;
		switch(selection) {
			case 0:  // start a new game
			with (instance_create_layer(room_width+8, rh - 24, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
			}
			break;
			
			case 1:  // load game
				with (instance_create_layer(room_width+8, rh - 8, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
				
			case 2:  // practice mode
				with (instance_create_layer(room_width+8, rh + 8, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
				
			case 3:  // end the game
				with (instance_create_layer(room_width+8, rh + 24, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
				
		}
	}
	
	// second options menu
	else if (displayOptions == "difficulty") {
		next = false;
		switch(diff) {
			case easy:  // easy mode
				with (instance_create_layer(room_width+8, rh - 16, layer, objTitleFire)) {
						hspeed = -6;
						face = left;
				}
				instance_create_layer(x, y, "Controller", objEasy);
				break;
			
			case normal:  // normal mode
				with (instance_create_layer(room_width+8, rh, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
				
			case hard:  // hard mode
				with (instance_create_layer(room_width+8, rh + 16, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				instance_create_layer(x, y, "Controller", objHard);
				break;
				
		}
	}
	
	// second options menu
	else if (displayOptions == "settings") {
		next = false;
		switch(setting) {
			case "controls":  // controls
				with (instance_create_layer(room_width+8, rh - 24, layer, objTitleFire)) {
						hspeed = -6;
						face = left;
				}
				break;
			
			case "watch trailer":  // watch trailer
				with (instance_create_layer(room_width+8, rh - 8, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
				
			case "credits":  // credits
				with (instance_create_layer(room_width+8, rh + 8, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
			
			case "sound test":  // sound test
				with (instance_create_layer(room_width+8, rh + 24, layer, objTitleFire)) {
					hspeed = -6;
					face = left;
				}
				break;
				
		}
	}
	
	else if (displayOptions == "sound test") {
		
		// stop current song and play new one
		audio_stop_all();
		switch (soundtest) {
			
			case "OPERATION WARFARE":
				audio_play_sound(sndTitle, 1, false);
				break;
				
			case "TUTORIAL MODE":
				audio_sound_loop_start(sndPractice, 1.567);
				audio_play_sound(sndPractice, 1, true);
				break;
				
			case "PERIL":
				audio_play_sound(sndStory, 1, false);
				break;
				
			case "CYBER FOREST":
				audio_sound_loop_start(sndStage1, 32);
				audio_play_sound(sndStage1, 1, true);
				break;
			
			case "MAGMA CRATER":
				audio_play_sound(sndStage2, 1, true);
				break;
				
			case "ANTENNA CRADLE":
				audio_play_sound(sndStage3, 1, true);
				break;
				
			case "EVENT HORIZON":
				audio_play_sound(sndStageFinal, 1, true);
				break;
				
			case "ENEMY ATTACK":
				audio_sound_loop_start(sndBoss, 5.35);
				audio_play_sound(sndBoss, 1, true);
				break;
				
			case "GAME OVER":
				audio_play_sound(sndGameOver, 1, true);
				break;
				
			case "FANFARE":
				audio_play_sound(sndStageComplete, 1, false);
				break;
				
			case "POWER UP!":
				audio_sound_loop_start(sndPowerUp, 7.55);
				audio_play_sound(sndPowerUp, 1, true);
				break;
				
			case "LET'S TAKE A BREAK":
				audio_play_sound(sndPause, 1, true);
				break;
				
			case "METEOR SHOWER":
				audio_play_sound(sndMeteorShower, 1, true);
				break;
				
			case "FINAL BATTLE":
				audio_play_sound(sndFinalBoss, 1, true);
				break;
				
			case "ENDING":
				audio_play_sound(sndEnding, 1, false);
				break;
				
			case "THE PLANET'S HERO":
				audio_sound_loop_start(sndCredits, 1.95);
				audio_play_sound(sndCredits, 1, true);
				break;
				
			case "BODYBUILDER RPG #1":
				audio_sound_loop_start(sndMom, 48.0);
				audio_play_sound(sndMom, 1, true);
				break;
				
			case "BODYBUILDER RPG #2":
				audio_play_sound(sndBBRPG2, 1, true);
				break;
				
			default:
				audio_play_sound(sndPause, 1, true);
				break;
		}
	}
	
	// when you press A on the controls page
	else if (displayOptions == "controls") {
		
		next = false;
		
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		
		switch(csetting) {
		
			case "jump":
				b1 = w;
				b11 = c;
				b22 = w;
				b33 = w;
				b44 = w;
				
				input_binding_scan_start(function(new_binding) {
					input_binding_set_safe("jump", new_binding);
					
					b11 = w;
					b1 = c;
					
					// sound effect	
					if audio_is_playing(sndCursor)
						audio_stop_sound(sndCursor);
					audio_play_sound(sndCursor, 1, false);
					
					alarm[0] = aTime;
				});
				
				
				break;
				
			case "shoot":
				b22 = #a4e4fc;
				b11 = w;
				b33 = w;
				b44 = w;
				
				input_binding_scan_start(function(new_binding) {
					input_binding_set_safe("shoot", new_binding);
					
					b22 = w;
					b2 = c;
					
					// sound effect	
					if audio_is_playing(sndCursor)
						audio_stop_sound(sndCursor);
					audio_play_sound(sndCursor, 1, false);
					
					alarm[0] = aTime;
				});
				
				break;
				
			case "select":
				b33 = #a4e4fc;
				b22 = w;
				b11 = w;
				b44 = w;
				
				input_binding_scan_start(function(new_binding) {
					input_binding_set_safe("select", new_binding);
					
					b33 = w;
					b3 = c;
					
					// sound effect	
					if audio_is_playing(sndCursor)
						audio_stop_sound(sndCursor);
					audio_play_sound(sndCursor, 1, false);
					
					alarm[0] = aTime;
				});
				
				break;
				
			case "start":
				b44 = #a4e4fc;
				b22 = w;
				b33 = w;
				b11 = w;
				
				input_binding_scan_start(function(new_binding) {
					input_binding_set_safe("start", new_binding);
					
					b44 = w;
					b4 = c;
					
					// sound effect	
					if audio_is_playing(sndCursor)
						audio_stop_sound(sndCursor);
					audio_play_sound(sndCursor, 1, false);
					
					alarm[0] = aTime;
				});
				
				break;
				
			case "default":
			
				input_profile_reset_bindings(input_profile_get());
				
				
				// sound effect	
				if audio_is_playing(sndShock)
					audio_stop_sound(sndShock);
				if audio_is_playing(sndCursor)
					audio_stop_sound(sndCursor);
				audio_play_sound(sndShock, 1, false);
				
				alarm[0] = aTime;
				
				break;
		}
	}
	
}

// change the screen when the fire hits the text
if  (place_meeting(x+64, y, objTitleFire) and (displayOptions == "start")) {
	
	displayOptions = "menu";
	selection = 0;
	
	audio_stop_sound(sndFire);
	audio_play_sound(sndEnemyExplosion, 1, false);
	
	
	instance_create_layer(x, rh, layer, objExplosion);
	alarm[0] = aTime;
	with (objTitleFire) instance_destroy();
}

else if place_meeting(x-64, y, objTitleFire) and (displayOptions == "menu") {
	
	
	instance_create_layer(x, rh - 24 + (selection*16), layer, objExplosion);
		
	
	with (objTitleFire) instance_destroy();
	
	switch (selection) {
		case 0:  // new game
		
			displayOptions = "difficulty";
	
			audio_stop_sound(sndFire);
			audio_play_sound(sndEnemyExplosion, 1, false);
	
	
			alarm[0] = aTime;
			
			diff = normal;
			
			with (objTitleFire)
				instance_destroy();
			
			break;
		
		case 1:  // load game
			
			with(objTitle) {   // set alarm for title object
				
		
				roomGoto = load;
				alarm[1] = 140; 
				
			}
			
			audio_stop_all();
			audio_play_sound(sndBossExplosion, 1, false);
			instance_create_layer(x, y, "Controller", objHealth);
			
			flicker2 = true;
			break;
			
		case 2:  // practice mode
			
			with(objTitle) {   // set alarm for title object
				
		
				roomGoto = practice;
				alarm[1] = 140; 
				
			}
			
			audio_stop_all();
			audio_play_sound(sndBossExplosion, 1, false);
			instance_create_layer(x, y, "Controller", objHealth);
			
			flicker3 = true;
			break;
		
		
		case 3:  // settings
		
			displayOptions = "settings";
	
			audio_stop_sound(sndFire);
			audio_play_sound(sndEnemyExplosion, 1, false);
	
	
			alarm[0] = aTime;
			
			setting = "controls";
			
			with (objTitleFire)
				instance_destroy();
			
			break;
	}
}

else if place_meeting(x-64, y, objTitleFire) and (displayOptions == "difficulty") {
	
	switch (diff) {
	
		case easy:
			instance_create_layer(x, rh-16, layer, objExplosion);
			break;
			
		case normal: 
			instance_create_layer(x, rh, layer, objExplosion);
			break;
			
		case hard: 
			instance_create_layer(x, rh+16, layer, objExplosion);
			break;
			
	}
	
	audio_stop_all();
	audio_play_sound(sndBossExplosion, 1, false);
	instance_create_layer(x, y, "Controller", objHealth);
	
	with (objTitleFire) instance_destroy();
	
	switch (diff) {
			
		case easy:
			flicker4 = true;
			with(objTitle) {   // set alarm for title object
				
				roomGoto = play;
				alarm[1] = 140; 
			}
			break;
			
		case normal:
			flicker5 = true;
			with(objTitle) {   // set alarm for title object
				
				roomGoto = play;
				alarm[1] = 140; 
			}
			break;
		
		case hard:
			flicker6 = true;
			with(objTitle) {   // set alarm for title object
				
				roomGoto = play;
				alarm[1] = 140; 
			}
			break;
			
		
			
	}
}

else if place_meeting(x-64, y, objTitleFire) and (displayOptions == "settings") {
	
	var sel = 0; 
	switch (setting) {
		case "controls":
			sel = 0;
			break;
		case "watch trailer":
			sel = 1;
			break;
		case "credits":
			sel = 2;
			break;
		case "sound test":
			sel = 3;
			break;
	}
	
	instance_create_layer(x, rh - 24 + (sel*16), layer, objExplosion);
		
	
	with (objTitleFire) instance_destroy();
	
	switch (setting) {
		
		case "controls":
		
			displayOptions = "controls";
	
			audio_stop_sound(sndFire);
			audio_play_sound(sndEnemyExplosion, 1, false);
	
	
			alarm[0] = aTime;
			
			csetting = "jump";
			
			b1 = c;
			b2 = w;
			b3 = w;
			b4 = w;
			b5 = w;
			
			b11 = w;
			b22 = w;
			b33 = w;
			b44 = w;
			
			with (objTitleFire)
				instance_destroy();
			
			break;
		
		case "watch trailer":
		
			with (objTitleFire)
				instance_destroy();
			audio_stop_sound(sndFire);
			
			audio_pause_all();
			video_open("trailer.mp4")
			video_enable_loop(false);
			alarm[1] = video_get_duration() / 1000 * 60;
			
			break;
		
		case "credits":
	
			audio_stop_sound(sndFire);
			audio_play_sound(sndEnemyExplosion, 1, false);
	
			showCredits = true;
			
			with (objTitleFire)
				instance_destroy();
			
			break;
			
		case "sound test":
		
			displayOptions = "sound test";
			
			audio_stop_sound(sndFire);
			audio_play_sound(sndEnemyExplosion, 1, false);
	
	
			alarm[0] = aTime;
			
			with (objTitleFire)
				instance_destroy();
			
			break;
	}
}

// color the text for the first set of options
if (displayOptions == "menu") {
	
	if selection == 0
		b1 = c;
	else
		b1 = c_white;
		
	if selection == 1
		b2 = c;
	else
		b2 = c_white;
		
	if selection == 2
		b3 = c;
	else
		b3 = c_white;
		
	if selection == 3
		b4 = c;
	else
		b4 = c_white;
		
	if selection == 4
		b5 = c;
	else
		b5 = c_white;
		
	
	if !flicker {
		if (keyUp and next) {
			
			// go up on menu
			if (displayOptions == "menu") {
				selection--;
			
				// skip continue if there's no save file
				if (!file_exists("save.txt") and selection == 1)
					selection--;
			}
			
			// sound effect	
			if audio_is_playing(sndCursor)
				audio_stop_sound(sndCursor);
			audio_play_sound(sndCursor, 1, false);
		}
		
		else if (keyDown and next) {
			
			// go down on menu
			if (displayOptions == "menu") {
				selection++;
			
				// skip continue if there's no save file
				if (!file_exists("save.txt") and selection == 1)
					selection++;
			}
			
				
			// sound effect	
			if audio_is_playing(sndCursor)
				audio_stop_sound(sndCursor);
			audio_play_sound(sndCursor, 1, false);
		}
	}
}

else if (displayOptions == "difficulty") {
	
	// go up on difficulty
	if (keyUp and next) {
		diff--;
				
		// if diff goes past limit, reset it		
		if (diff < easy) 
			diff = hard;
			
		// skip continue if there's no save file
		if (!file_exists("hard.txt") and diff == hard)
			diff--;
			
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
			
	}
	
	// go down on difficulty
	else if (keyDown and next) {
		diff++;
				
		// skip continue if there's no save file
		if (!file_exists("hard.txt") and diff == hard)
			diff++;
			
		// if diff goes past limit, reset it	
		if (diff > hard) 
			diff = easy;
			
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
			
	}
	
}

else if (displayOptions == "settings" and !showCredits) {
	
	// go down on settings
	if (keyDown and next) {
		switch (setting) {
		
			case "controls":
				setting = "watch trailer";
				break;
				
			case "watch trailer":
				setting = "credits";
				break;
				
			case "credits":
				setting = "sound test";
				break;
				
			case "sound test":
				setting = "controls";
				break;
		}
		
		// skip continue if there's no save file
		if (!hardComp and setting == "sound test")
			setting = "controls";
			
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
			
	}
	
	// go up on settings
	else if (keyUp and next) {
		switch (setting) {
		
			case "controls":
				setting = "sound test";
				break;
				
			case "watch trailer":
				setting = "controls";
				break;
				
			case "credits":
				setting = "watch trailer";
				break;
				
			case "sound test":
				setting = "credits";
				break;
		}
				
		// skip continue if there's no save file
		if (!hardComp and setting == "sound test")
			setting = "credits";
			
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
			
	}
	
}
else if (displayOptions == "controls" and next) {
	
	if (keyUp) {
		
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		
		switch (csetting) {
		
			
			case "jump":
				csetting = "default";
				b1 = w;
				b5= c;
				break;
			
			case "shoot":
				csetting = "jump";
				b2 = w;
				b1 = c;
				break;
				
			case "select":
				csetting = "shoot";
				b3 = w;
				b2 = c;
				break;
				
			case "start":
				csetting = "select";
				b4 = w;
				b3 = c;
				break;
				
			case "default":
				csetting = "start";
				b5 = w;
				b4 = c;
				break;
		}
	}
	
	else if (keyDown) {
		
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		
		switch (csetting) {
		
			case "jump":
				csetting = "shoot";
				b1 = w;
				b2 = c;
				break;
			
			case "shoot":
				csetting = "select";
				b2 = w;
				b3 = c;
				break;
				
			case "select":
				csetting = "start";
				b3 = w;
				b4 = c;
				break;
				
			case "start":
				csetting = "default";
				b4 = w;
				b5 = c;
				break;
				
			case "default":
				csetting = "jump";
				b5 = w;
				b1 = c;
				break;
		}
	}
}

if selection > 3
	selection = 0;
if selection < 0
	selection = 3;
	
if flicker {
	i++;

	if i % 10 == 0
		j++;
	
	if j % 2 == 0
		imgA = 0;
	else
		imgA = 1;
}

if flicker2 {
	i++;

	if i % 8 == 0
		j++;
	
	if j % 2 == 0
		imgB = 0;
	else
		imgB = 1;
}

if flicker3 {
	i++;

	if i % 8 == 0
		j++;
	
	if j % 2 == 0
		imgC = 0;
	else
		imgC = 1;
}

if flicker4 {
	i++;

	if i % 8 == 0
		j++;
	
	if j % 2 == 0
		imgD = 0;
	else
		imgD = 1;
}

if flicker5 {
	i++;

	if i % 8 == 0
		j++;
	
	if j % 2 == 0
		imgE = 0;
	else
		imgE = 1;
}

if flicker6 {
	i++;

	if i % 8 == 0
		j++;
	
	if j % 2 == 0
		imgF = 0;
	else
		imgF = 1;
}

// difficulty color 
if (displayOptions == "difficulty") {
	switch (diff) {
	
		case easy:
			c1 = c;
			c2 = c_white; 
			c3 = c_white;
			break;
		
		case normal:
			c1 = c_white;
			c2 = c; 
			c3 = c_white;
			break;
		
		case hard:
			c3 = c;
			c1 = c_white; 
			c2 = c_white;
			break;
	

	}
}

// setting color
else if (displayOptions == "settings") {
	switch (setting) {
	
		case "controls":
			c1 = c;
			c2 = c_white; 
			c3 = c_white;
			c4 = c_white;
			break;
		
		case "watch trailer":
			c1 = c_white;
			c2 = c; 
			c3 = c_white;
			c4 = c_white;
			break;
		
		case "credits":
			c3 = c;
			c1 = c_white; 
			c2 = c_white;
			c4 = c_white;
			break;
		
		case "sound test":
			c4 = c;
			c1 = c_white; 
			c2 = c_white;
			c3 = c_white;
			break;
	
	}
}

// cancel trailer
if (keyBack and video_get_status() == video_status_playing) {
	
		closeVid();
		
}

// go back from show credits 
if (keyBack and showCredits) {
	
		alarm[0] = aTime;
		showCredits = false;
		
}

// go back to previous screen 
else if (keyBack and next) {
	
	if (video_get_status() == video_status_playing) {
	
		closeVid();
		
	}
	
	if (displayOptions == "menu") {
		
		// previous display
		displayOptions = "start"; 
		next = false; 
		alarm[0] = aTime;
		
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
	}
	
	else if (displayOptions == "controls" || displayOptions == "sound test") {
		
		// previous display
		displayOptions = "settings"; 
		next = false; 
		alarm[0] = aTime;
		
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
	}
	
	else if (displayOptions != "menu" and displayOptions != "start") {
		
		// previous display
		displayOptions = "menu"; 
		next = false; 
		alarm[0] = aTime;
		
		// sound effect	
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
			
	}
	
	else 
		exit;
	
}

if (displayOptions == "sound test") {
	
	if (keyRight) {
		
		// cursor sfx
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		
		// change the soundtrack
		switch (soundtest) {
			
			case "OPERATION WARFARE":
				soundtest = "TUTORIAL MODE";
				break;
				
			case "TUTORIAL MODE":
				soundtest = "PERIL";
				break;
				
			case "PERIL":
				soundtest = "CYBER FOREST";
				break;
				
			case "CYBER FOREST":
				soundtest = "MAGMA CRATER";
				break;
				
			case "MAGMA CRATER":
				soundtest = "ANTENNA CRADLE";
				break;
				
			case "ANTENNA CRADLE":
				soundtest = "EVENT HORIZON";
				break;
				
			case "EVENT HORIZON":
				soundtest = "ENEMY ATTACK";
				break;
				
			case "ENEMY ATTACK":
				soundtest = "GAME OVER";
				break;
				
			case "GAME OVER":
				soundtest = "FANFARE";
				break;
				
			case "FANFARE":
				soundtest = "POWER UP!";
				break;
				
			case "POWER UP!":
				soundtest = "LET'S TAKE A BREAK";
				break;
				
			case "LET'S TAKE A BREAK":
				soundtest = "METEOR SHOWER";
				break;
				
			case "METEOR SHOWER":
				soundtest = "FINAL BATTLE";
				break;
				
			case "FINAL BATTLE":
				soundtest = "ENDING";
				break;
				
			case "ENDING":
				soundtest = "THE PLANET'S HERO";
				break;
				
			case "THE PLANET'S HERO":
				soundtest = "BODYBUILDER RPG #1";
				break;
				
			case "BODYBUILDER RPG #1":
				soundtest = "BODYBUILDER RPG #2";
				break;
				
			case "BODYBUILDER RPG #2":
				soundtest = "OPERATION WARFARE";
				break;
		}
		
		
		
	}
	
	if (keyLeft) {
		
		// cursor sfx
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		
		// change the soundtrack
		switch (soundtest) {
			
			case "OPERATION WARFARE":
				soundtest = "BODYBUILDER RPG #2";
				break;
				
			case "TUTORIAL MODE":
				soundtest = "OPERATION WARFARE";
				break;
				
			case "PERIL":
				soundtest = "TUTORIAL MODE";
				break;
				
			case "CYBER FOREST":
				soundtest = "PERIL";
				break;
				
			case "MAGMA CRATER":
				soundtest = "CYBER FOREST";
				break;
				
			case "ANTENNA CRADLE":
				soundtest = "MAGMA CRATER";
				break;
				
			case "EVENT HORIZON":
				soundtest = "ANTENNA CRADLE";
				break;
				
			case "ENEMY ATTACK":
				soundtest = "EVENT HORIZON";
				break;
				
			case "GAME OVER":
				soundtest = "ENEMY ATTACK";
				break;
				
			case "FANFARE":
				soundtest = "GAME OVER";
				break;
				
			case "POWER UP!":
				soundtest = "FANFARE";
				break;
				
			case "LET'S TAKE A BREAK":
				soundtest = "POWER UP!";
				break;
				
			case "METEOR SHOWER":
				soundtest = "LET'S TAKE A BREAK";
				break;
				
			case "FINAL BATTLE":
				soundtest = "METEOR SHOWER";
				break;
				
			case "ENDING":
				soundtest = "FINAL BATTLE";
				break;
				
			case "THE PLANET'S HERO":
				soundtest = "ENDING";
				break;
				
			case "BODYBUILDER RPG #1":
				soundtest = "THE PLANET'S HERO";
				break;	
				
			case "BODYBUILDER RPG #2":
				soundtest = "BODYBUILDER RPG #1";
				break;		
		}
		
		
		
	}
	
}