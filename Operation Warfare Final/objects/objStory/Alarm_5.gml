/// @description explosions
var posX = 170; 
var posY = 146;

if (explosions > 0) {
	audio_sound_gain(sndFinalBoom, 0.4, 0);
	if (audio_is_playing(sndFinalBoom))		
		audio_stop_sound(sndFinalBoom);
	audio_play_sound(sndFinalBoom, 1, false)
	var ranX = irandom_range(-40, 40);
	var ranY = irandom_range(-40, 40);
	instance_create_layer(posX+ranX, posY+ranY, layer_create(-1000, "temp"), objExplosion);

	explosions--;
	alarm[5] = 15;
}