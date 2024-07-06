// bullet collision

if (state == start)
	exit;


if (state != finish) {
	// reduce health
	eHealth -= 1;

	// increase the game score
	score += 200;
	if (instance_exists(objScore))
		objScore.gameScore += 200;

	// flash to show that enemy is hit
	imgAlpha = 0.2;
	alarm[6] = 5;
	
	// sound effect
	if (audio_is_playing(sndEnemyHit))
		audio_stop_sound(sndEnemyHit);
	audio_play_sound(sndEnemyHit,1,false);

	// destroy the bullet
	with (other) {
		instance_destroy(); 

}

}

else {
	
	// flash to show that enemy is hit
	imgAlpha = 0.2;
	alarm[6] = 5;
	
	// sound effect
	audio_sound_gain(sndEnemyHit, 0.4, 0);
	if (audio_is_playing(sndEnemyHit))
		audio_stop_sound(sndEnemyHit);
	audio_play_sound(sndEnemyHit,1,false);
	
	score += 100;
	if (instance_exists(objScore))
		objScore.gameScore += 100;
	
	var xRand = irandom_range(-16, 16);
	var yRand = irandom_range(-16, 16);
	instance_create_layer(x+xRand, y+yRand, layer, objExplosion);

	// destroy the bullet
	with (other) {
		instance_destroy(); 
	}
		
}