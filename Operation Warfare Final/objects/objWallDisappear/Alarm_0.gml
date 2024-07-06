// play the sound effect and destroy the instance
if (audio_is_playing(sndWallExplosion))
	audio_stop_sound(sndWallExplosion);
audio_play_sound(sndWallExplosion, 1, false);
instance_destroy();