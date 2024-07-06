image_speed = 1.2;
hSpeed = 0;
alarm[0] = 8;

if audio_is_playing(sndFire)
	audio_stop_sound(sndFire);

audio_play_sound(sndFire, 1, false);