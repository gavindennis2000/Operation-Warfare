with (other) {
	
	if spaceMove = true {
		direction = random(360);
		speed = 5;
		if hspeed < 0
			hspeed = abs(hspeed);
		
		// sfx
		if (audio_is_playing(sndBossExplosion))
			audio_stop_sound(sndBossExplosion);
		audio_play_sound(sndBossExplosion, 1, false);
		
		spaceMove = false;
	}
}