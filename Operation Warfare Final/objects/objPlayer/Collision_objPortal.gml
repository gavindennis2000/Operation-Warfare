if (instance_exists(objPlayerDeath))
	exit;
	
if (other.next != 0 and portalTransport == 0) {
	
	portalTransport = 1
	alarm[1] = 1;
	
	
	if (!audio_is_playing(sndPortal))
		audio_play_sound(sndPortal, 1, false);
	
	portalX = other.next.x;
	portalY = other.next.y;
	
	
}