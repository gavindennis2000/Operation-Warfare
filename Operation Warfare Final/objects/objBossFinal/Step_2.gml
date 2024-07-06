if (eHealth <= 0) and (state != finish) {
	
	state = finish;
	hspeed = 0;
	vspeed = 0;
	hSpeed = 0;
	vSpeed = 0;
	audio_stop_all();
	audio_sound_gain(sndFinalComplete, 1.25, 0);
	audio_play_sound(sndFinalComplete, 1, false);
	alarm[7] = 12 * 60;
}