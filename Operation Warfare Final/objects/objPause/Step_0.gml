var keyStart = input_check_pressed("start");

var keyShoot = input_check_pressed("shoot");
var keyJump = input_check_pressed("jump");
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");
var keyUp = input_check_pressed("up");
var keyDown = input_check_pressed("down");
var keySelect = input_check_pressed("select");

if
	(keyStart) and 
	(!instance_exists(objPlayerStart)) and 
	(!instance_exists(objPlayerDeath)) and 
	(!instance_exists(objPlayerVictory)) and 
	(room != roomStageSpecial) {
		switch (gamePause) {
			
			case false:
				instance_deactivate_layer("Player");
				instance_deactivate_layer("Bullet");
				instance_deactivate_layer("Wall");
				instance_deactivate_layer("DWall");
				instance_deactivate_layer("MWall");
				instance_deactivate_layer("Cannon");
				instance_deactivate_layer("Controller");
				instance_deactivate_layer("FinalBoss");
				
				gamePause = true;
				next = false;
				alarm[0] = aTime;
				selection = 0;
				screen = 1;
				
				shake = camera_get_view_angle(view_camera[0]);
				camera_set_view_angle(view_camera[0], 0);
				
				if (!audio_is_playing(sndMeteorShower)) {
					audio_pause_all();
					audio_play_sound(sndPause, 1, true);
				}
				
				else if (audio_sound_get_gain(sndMeteorShower) >= 0.6)
					audio_sound_gain(sndMeteorShower, 0.6, 0);	
				
				break;
			
			case true:
				switch selection {  // resume if you press start
				
					case 0:  // resume
					case 1:
					case 2:
						instance_activate_layer("Player");
						instance_activate_layer("Bullet");
						instance_activate_layer("Wall");
						instance_activate_layer("DWall");
						instance_activate_layer("MWall");
						instance_activate_layer("Cannon");
						instance_activate_layer("Controller");
						instance_activate_layer("FinalBoss");
						
						gamePause = false;
						camera_set_view_angle(view_camera[0], shake);
						
						audio_stop_sound(sndPause);
						if (audio_is_playing(sndMeteorShower) and audio_sound_get_gain(sndMeteorShower) >= 0.6 and instance_exists(objPlayerSpaceship))
							audio_sound_gain(sndMeteorShower, 1, 0);
						else
							audio_resume_all();
						
						break;
						
				}
				
				break;
			
		}
	}
	
if ((keyJump) and gamePause and screen == 1 and next) {
	switch selection {
				
		case 0:  // resume
			instance_activate_layer("Player");
			instance_activate_layer("Bullet");
			instance_activate_layer("Wall");
			instance_activate_layer("DWall");
			instance_activate_layer("MWall");
			instance_activate_layer("Cannon");
			instance_activate_layer("Controller");
			instance_activate_layer("FinalBoss");
						
			gamePause = false;
			camera_set_view_angle(view_camera[0], shake);
						
			audio_stop_sound(sndPause);
			if (audio_is_playing(sndMeteorShower) and audio_sound_get_gain(sndMeteorShower) >= 0.6 and instance_exists(objPlayerSpaceship))
				audio_sound_gain(sndMeteorShower, 1, 0);
			else
				audio_resume_all();
						
			break; 
				
		case 1:  // retry
			screen = 2;
			cursor = no;
			next = false; 
			alarm[0] = aTime;
			if audio_is_playing(sndCursor)
				audio_stop_sound(sndCursor);
			audio_play_sound(sndCursor, 1, false);
			break;
					
		case 2:  // main menu
			screen = 3;
			cursor = no;
			next = false; 
			alarm[0] = aTime;
			
			if audio_is_playing(sndCursor)
				audio_stop_sound(sndCursor);
			audio_play_sound(sndCursor, 1, false);
		
			break;
			
	}
}

else if (keyShoot and gamePause and screen > 1 and next) {
	next = false; 
	alarm[0] = aTime; 
	
	if audio_is_playing(sndCursor)
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
			
	screen = 1;
}

else if ((keyJump) and gamePause and screen > 1 and next) {
	
	if (screen == 2) {  // restart the level
		
		if (cursor == yes) {
			
			instance_activate_layer("Player");
			instance_activate_layer("Bullet");
			instance_activate_layer("Wall");
			instance_activate_layer("DWall");
			instance_activate_layer("MWall");
			instance_activate_layer("Cannon");
			instance_activate_layer("Controller");
			instance_activate_layer("FinalBoss");
			gamePause = false;
			camera_set_view_angle(view_camera[0], 0);
						
			audio_stop_all();
			with (objStageController) {  // make sure the boss doesn't come if you restart
				alarm[1] = -1;	
			}
						
			if (room == roomPractice)
				room_restart();
			else {
				if (instance_exists(objStageController) and instance_exists(objScore)) {
					// reset the score to what it was at the beginning of the level
					objScore.zeroScore();
					objScore.gameScore += objStageController.previousScore;
				}
					
				room_goto(roomStageSelect);	
			}
			
		}
		
		else {
		
			next = false; 
			alarm[0] = aTime; 
			screen = 1;
	
		}
		
	}
	
	else if (screen == 3)  {  // quit the game 
	
		if (cursor == yes)
			game_restart();
		
		else {
		
			next = false; 
			alarm[0] = aTime; 
			screen = 1;
	
		}
	
	}
}


		
// sound select cheat code
// key input
if (gamePause) {
	// gamepad input
	
	// if any button is pressed on the gamepad or keyboard
	var keyAny = (
		keyUp or
		keyDown or
		keyLeft or 
		keyRight or 
	
		keyShoot or keyJump or 
		keySelect or keyStart
	)
	
	// change selection on pause menu
	if (keyDown and screen == 1) {
		selection++;
		if selection >= 3
			selection = 0;
		
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
	}
	
	else if (keyUp and screen == 1) {
		selection--;
		if selection <= -1
			selection = 2;
		
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
	}
	
	// move the cursor from yes to no
	if (keyLeft) and (screen > 1) {
		
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		
		if (cursor == yes)
			cursor = no; 
		else
			cursor = yes;
		
	}
	else if (keyRight) and (screen > 1) {
		
		if audio_is_playing(sndCursor)
			audio_stop_sound(sndCursor);
		audio_play_sound(sndCursor, 1, false);
		if (cursor == yes)
			cursor = no; 
		else
			cursor = yes;
			
	}
		
	
	// the actual cheat code: up, left, down, right, select, select
	if variable_global_exists("soundTest")
	
		if (cheatTempST == 5) {
			if (keySelect)
				cheatTempST++;
			else if (keyAny)
				cheatTempST = 0;
		}
	
		if (cheatTempST == 4) {
			if (keySelect)
				cheatTempST++;
			else if (keyAny)
				cheatTempST = 0;
		}
	
		if (cheatTempST == 3) {
			if (keyRight)
				cheatTempST++;
			else if (keyAny)
				cheatTempST = 0;
		}
	
		if (cheatTempST == 2) {
			if (keyDown)
				cheatTempST++;
			else if (keyAny)
				cheatTempST = 0;
		}

		if (cheatTempST == 1) {
			if (keyLeft)
				cheatTempST++;
			else if (keyAny)
				cheatTempST = 0;
		}
		
		if (keyUp and cheatTempST >= 0) {
			cheatTempST = 1;
		}
		
		if (variable_global_exists("soundTest")) {
			if (global.soundTest)
				cheatTempST = -1;
			
			if (cheatTempST == 6) and (!global.soundTest) {
				global.soundTest = true;
				if audio_is_playing(sndHealthUp)
					audio_stop_sound(sndHealthUp);
				audio_play_sound(sndHealthUp, 1, false);
			}
		}
}

// change color of selection
switch (selection) {
	case 0:
		b1 = #a4e4fc;
		b2 = c_white;
		b3 = c_white;
		break;
		
	case 1:
		b1 = c_white;
		b2 = #a4e4fc;
		b3 = c_white;
		break;
		
	case 2:
		b1 = c_white;
		b2 = c_white;
		b3 = #a4e4fc;
		break;
}

// yes and no color
switch(cursor) {
	
	case no: 
		b4 = #a4e4fc;
		b5 = c_white;
		break; 
		
	case yes: 
		b5 = #a4e4fc;
		b4 = c_white;
	
}