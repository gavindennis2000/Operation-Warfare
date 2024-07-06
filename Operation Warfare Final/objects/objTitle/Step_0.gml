// stops moving when at the top of the screen
if (y == 0) {
	vspeed = 0;
	if (!instance_exists(objStart)) {
		instance_create_layer(room_width/2, room_height/2, layer, objStart);
		flash = true;
		alarm[2] = 4;
		instance_create_layer(0,0, layer_create(199, "Star"), objStar);
	}
}
	
// maps start button from keyboard and gamepad	
var keyStart = input_check_pressed("start");

// cheat codes!
// key input

var keyUp = input_check_pressed("up");
var keyDown = input_check_pressed("down");
var keyLeft = input_check_pressed("left");
var keyRight = input_check_pressed("right");

var key1 = input_check_pressed("shoot");
var key2 = input_check_pressed("jump");

var keySelect = input_check_pressed("select");

 // if any button is pressed on the gamepad or keyboard
var keyAny = (
	keyUp or
	keyDown or
	keyLeft or 
	keyRight or 
	
	key1 or key2 or 
	keySelect or keyStart
)

if (keyAny) {
	if (alarm_get(3) < alarmTime/2)
		alarm[3] = alarmTime/2;
}

if (instance_exists(objStart)) {
	if objStart.displayOptions != "start"
		exit;
	else {
// spreadshot cheat
		if (cheatTemp == 5) {
			if (key2)
				cheatTemp++;
			else if (keyAny)
				cheatTemp = 0;
		}
	
		if (cheatTemp == 4) {
			if (key1)
				cheatTemp++;
			else if (keyAny)
				cheatTemp = 0;
		}
	
		if (cheatTemp == 3) {
			if (keyRight)
				cheatTemp++;
			else if (keyAny)
				cheatTemp = 0;
		}
	
		if (cheatTemp == 2) {
			if (keyLeft)
				cheatTemp++;
			else if (keyAny)
				cheatTemp = 0;
		}

		if (cheatTemp == 1) {
			if (keyDown)
				cheatTemp++;
			else if (keyAny)
				cheatTemp = 0;
		}

		if (keyUp)
			cheatTemp = 1;
		if (global.spreadshotCheat)
			cheatTemp = -1;
	
// double jump cheat
		if (cheatTemp1 == 5) {
			if (key2)
				cheatTemp1++;
			else if (keyAny)
				cheatTemp1 = 0;
		}
	
		if (cheatTemp1 == 4) {
			if (key2)
				cheatTemp1++;
			else if (keyAny)
				cheatTemp1 = 0;
		}
	
		if (cheatTemp1 == 3) {
			if (key1)
				cheatTemp1++;
			else if (keyAny)
				cheatTemp1 = 0;
		}
	
		if (cheatTemp1 == 2) {
			if (key1)
				cheatTemp1++;
			else if (keyAny)
				cheatTemp1 = 0;
		}

		if (cheatTemp1 == 1) {
			if (key2)
				cheatTemp1++;
			else if (keyAny)
				cheatTemp1 = 0;
		}

		if (key1) and (cheatTemp1 != 3) and (cheatTemp1 != 4)
			cheatTemp1 = 1;
		if (global.doubleJumpCheat)
			cheatTemp1 = -1;

// infinite lives cheat
		if (cheatTemp2 == 9) {
			if (key2)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
		if (cheatTemp2 == 8) {
			if (key1)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
		if (cheatTemp2 == 7) {
			if (keyRight)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
		if (cheatTemp2 == 6) {
			if (keyLeft)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
		if (cheatTemp2 == 5) {
			if (keyRight)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
	
		if (cheatTemp2 == 4) {
			if (keyLeft)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
	
		if (cheatTemp2 == 3) {
			if (keyDown)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}
	
		if (cheatTemp2 == 2) {
			if (keyDown)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}

		if (cheatTemp2 == 1) {
			if (keyUp)
				cheatTemp2++;
			else if (keyAny)
				cheatTemp2 = 0;
		}

		if (keyUp) and (cheatTemp2 != 2)
			cheatTemp2 = 1;
		if (global.infiniteLives)
			cheatTemp2 = -1;
	
// invincibility cheat
		if (cheatTemp3 == 5) {
			if (keySelect)
				cheatTemp3++;
			else if (keyAny)
				cheatTemp3 = 0;
		}
	
		if (cheatTemp3 == 4) {
			if (key2)
				cheatTemp3++;
			else if (keyAny)
				cheatTemp3 = 0;
		}
	
		if (cheatTemp3 == 3) {
			if (key1)
				cheatTemp3++;
			else if (keyAny)
				cheatTemp3 = 0;
		}
	
		if (cheatTemp3 == 2) {
			if (keySelect)
				cheatTemp3++;
			else if (keyAny)
				cheatTemp3 = 0;
		}

		if (cheatTemp3 == 1) {
			if (keyRight)
				cheatTemp3++;
			else if (keyAny)
				cheatTemp3 = 0;
		}

		if (keyLeft)
			cheatTemp3 = 1;
		if (global.invincibilityCheat)
			cheatTemp3 = -1;
			

		// activate cheats

		// spreadshot
		if (cheatTemp == 6) and (!global.spreadshotCheat) {
			global.spreadshotCheat = true;
			if audio_is_playing(sndHealthUp)
				audio_stop_sound(sndHealthUp);
			audio_play_sound(sndHealthUp, 1, false);
		}

		// double jump
		if (cheatTemp1 == 6) and (!global.doubleJumpCheat) {
			global.doubleJumpCheat = true;
			if audio_is_playing(sndHealthUp)
				audio_stop_sound(sndHealthUp);
			audio_play_sound(sndHealthUp, 1, false);
	
		}

		// infinite lives
		if (cheatTemp2 == 10) and (!global.infiniteLives) {
			global.infiniteLives = true;
			if audio_is_playing(sndHealthUp)
				audio_stop_sound(sndHealthUp);
			audio_play_sound(sndHealthUp, 1, false);
	
		}

		// invincibility
		if (cheatTemp3 == 6) and (!global.invincibilityCheat) {
			global.invincibilityCheat = true;
			if audio_is_playing(sndHealthUp)
				audio_stop_sound(sndHealthUp);
			audio_play_sound(sndHealthUp, 1, false);
	
		}
	}
}