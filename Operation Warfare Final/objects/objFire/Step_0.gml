playerExists = instance_exists(objPlayer);  // check player existance

if (playerExists) and (moveTemp) {
	
	if (objPlayer.x > x-20) {
		move = true;
		moveTemp = false
	}
	
	else
		move = false;
		
}

if (!move and room == roomStage2) {
	if (dir == up)
		vspeed -= 0.025;
	if (dir == down)
		vspeed +=0.025;
		
	if (vspeed == -0.75)
		dir = down;
	if (vspeed == 0.75)
		dir = up;
}

if (move) {
	if (sfx) {
		if (room == roomStage2 or room == roomPractice) {
			// fire sound effect
			if (!audio_is_playing(sndFire))
				audio_play_sound(sndFire, 1, false);
			sfx = false;
		}
		else if (room == roomStage3) {
			if (instance_exists(objPlayer))
				if (objPlayer.x > 4608)
					exit;
			// fire sound effect
			if (!audio_is_playing(sndShockblast))
				audio_play_sound(sndShockblast, 1, false);
			sfx = false;
		}
		else if (room == roomStageFinal) {
			
			// laser sound effect
			if (!audio_is_playing(sndLaser))
				audio_play_sound(sndLaser, 1, false);
			sfx = false;
		}
	}
	vspeed -= 0.2;
	if (vspeed < -5.5)
		vspeed = -5.5;
	if (room == roomStage3) {
		
		var maxV = -4;
		if (!instance_exists(objHard))
			maxV = -5;
			
		if (vspeed < maxV)
			vspeed = maxV;
			
	}
}

if (y <= -224) {  // when the fire hits the top of the screen wrap vertically
	y = room_height;
	wrap = true;
}

if (playerExists) {
	if (y <= ystart and y >= ystart-5) and (wrap) and (objPlayer.x <= x-20) {
			wrap = 0;
			y = ystart;
			vspeed = 0;
			move = false;
			moveTemp = true;
			sfx = true;
	}
}