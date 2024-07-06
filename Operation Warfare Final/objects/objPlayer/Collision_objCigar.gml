// powerup clears the screen

with (other) {
	instance_destroy(); }

// make sound effect and increase health
if audio_is_playing(sndHealthUp)
	audio_stop_sound(sndHealthUp);
audio_play_sound(sndHealthUp, 1, false);

// increase player health if not on the tutorial level
if (!instance_exists(objHard))
	instance_create_layer(x, y, layer, objScreenWipe);
	
// enable rapid fire for five seconds
alarm[3] = 60 * 5;
rapidFire = true;
rfCounter = 0;