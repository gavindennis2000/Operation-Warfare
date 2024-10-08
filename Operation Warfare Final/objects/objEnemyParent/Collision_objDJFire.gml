// reduce health
eHealth -= 1;

// reduce other health
with (other) {
	if variable_instance_exists(self, "fHealth")
		fHealth--;
}

// increase the game score
if (instance_exists(objScore)) {
	
	if (instance_exists(objEasy))
		objScore.gameScore += 0;
		
	else if (instance_exists(objHard))
		objScore.gameScore += 100;
		
	else  //normal difficulty
		objScore.gameScore += 100;
	
}

// flash to show that enemy is hit
image_alpha = 0.2;
image_blend = c_white;
alarm[0] = 5;

// sound effect
if (audio_is_playing(sndEnemyHit))
	audio_stop_sound(sndEnemyHit);
if (eHealth > 0)
	audio_play_sound(sndEnemyHit,1,false);