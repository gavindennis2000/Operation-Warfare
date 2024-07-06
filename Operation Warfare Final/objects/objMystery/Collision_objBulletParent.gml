if (!place_meeting(x+1, y, objPlayer))
	exit;

// wall loses health
eHealth--;

// flash to show that enemy is hit
image_alpha = 0.2;
image_blend = c_white;
alarm[0] = 5;

// sound effect
if (audio_is_playing(sndEnemyHit))
	audio_stop_sound(sndEnemyHit);
audio_play_sound(sndEnemyHit,1,false);

// destroy the bullet
with (other) {
	instance_destroy(); }