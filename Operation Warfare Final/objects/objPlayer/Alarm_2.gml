audio_stop_sound(sndPortal);

if (portalTransport == 2) {
	
	imgAlphaPortal += 0.25;
	alarm[2] = 6;
	
	if imgAlphaPortal >= 1 {
		portalTransport = 0;
		invincible = false;
	}
}