///@description djfire heals boss

if eHealth < eHealthInitial
	eHealth++;

// sound effect
if (audio_is_playing(sndEnemyHit))
	audio_stop_sound(sndEnemyHit);
audio_play_sound(sndEnemyHit,1,false);

// destroy the flame shield
with (other)
	instance_destroy();