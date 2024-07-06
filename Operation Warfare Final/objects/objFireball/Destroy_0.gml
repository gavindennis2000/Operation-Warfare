/// @description Insert description here
// You can write your code in this editor









// Inherit the parent event
event_inherited();

if (audio_is_playing(sndShockwave))
	audio_stop_sound(sndShockwave);
	
if (audio_is_playing(sndFireball))
	audio_stop_sound(sndFireball);
	
with (objFireballBall) {
	
	if parent = instance_id_get(other)
		instance_destroy();
}