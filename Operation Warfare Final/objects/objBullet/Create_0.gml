

// check for spreadshot
if instance_exists(objPlayer) {
	
	
	
	// shockblast
	if (objPlayer.shockblast) {
		
		if (instance_exists(objBossFinal))
			 if (objBossFinal.state == objBossFinal.finish)	{	
				audio_sound_gain(sndShockblast, 0.3, 0);
				audio_sound_gain(sndBullet, 0.3, 0);
				audio_sound_gain(sndSpreadshot, 0.3, 0);
			 }
			 else {
				 audio_sound_gain(sndShockblast, 0.4, 0);
				audio_sound_gain(sndBullet, 0.9, 0);
				audio_sound_gain(sndSpreadshot, 1, 0);
			 }
				
		if audio_is_playing(sndShockblast)
			audio_stop_sound(sndShockblast);
		audio_play_sound(sndShockblast, 1, false);
		
		sprite_index = sprShockblast;
		image_speed = 1.5;
	}
	
	// spreadshot
	else if (objPlayer.spreadshot) {
		if audio_is_playing(sndSpreadshot)
			audio_stop_sound(sndSpreadshot);
		audio_play_sound(sndSpreadshot, 1, false); 
	}
	
	// regular bullet
	else {
		if audio_is_playing(sndBullet)
			audio_stop_sound(sndBullet);
		audio_play_sound(sndBullet, 1, false); 
	}	
}

// Power Up Screen demonstration
else if instance_exists(objPlayerPowerUp) {
	
		if (instance_exists(objShockblast)) {
			
			if audio_is_playing(sndShockblast)
				audio_stop_sound(sndShockblast);
			audio_play_sound(sndShockblast, 1, false); 
			sprite_index = sprShockblast;
			image_speed = 1.5;
		}
		
		else {
			if audio_is_playing(sndSpreadshot)
				audio_stop_sound(sndSpreadshot);
			audio_play_sound(sndSpreadshot, 1, false); 
		}
		
}

reflect = false;
reflectTemp = true;