// powerup increases health

with (other) {
	instance_destroy(); }

// make sound effect and increase health
if audio_is_playing(sndHealthUp)
	audio_stop_sound(sndHealthUp);
audio_play_sound(sndHealthUp, 1, false);

// increase player health if not on the tutorial level
if (global.playerHealth != -1)
	global.playerHealth += 1;