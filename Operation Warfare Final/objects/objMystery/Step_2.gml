// if health is 0, destroy
if (eHealth <= 0) {
	
	if (audio_is_playing(sndEnemyExplosion)) // play enemy death sound
		audio_stop_sound(sndEnemyExplosion);
		
	if (audio_is_playing(sndEnemyHit))
		audio_stop_sound(sndEnemyHit);
		
	audio_play_sound(sndEnemyExplosion, 1, false);
	instance_create_layer(x+8, y+8, "Player", objExplosion);
	instance_destroy(); 
}