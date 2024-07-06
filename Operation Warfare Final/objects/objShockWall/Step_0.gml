if instance_exists(objPlayer) and !instance_exists(objPlayerDeath) {
	
	if place_meeting(x, y+objPlayer.image_yscale, objPlayer) and instance_exists(objDJFire) and !shock{
		shock = true;
		alarm[0] = 15;
		if !audio_is_playing(sndShock)
			audio_play_sound(sndShock, 1, false);
			image_blend = #f8d878;
		
		objPlayer.doubleJumpTemp = true;
		
	}
}

// Inherit the parent event
event_inherited();

