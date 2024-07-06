if (instance_exists(objPlayerSpaceship)) {
	
		event_inherited();
		exit
		
}

else {

	// only run this event if the player killed the enemy
	if !(variable_instance_exists(self, "eHealth"))
		eHealth = 1;
	
	if (eHealth > 0)
		exit;
	
	// create explosion animation
	instance_create_layer(x,y, "Bullet", objExplosion);


	// random powerup drops

	var powerup = irandom(4) // one in five chance you get an extra life
	if (powerup == 3) {
	
		var ran = irandom(1);
		switch (ran) {
		
			case 0:
				instance_create_layer(x, y, "Bullet", objHealthUp);
				break;
			case 1:	
				instance_create_layer(x, y, "Bullet", objCigar);
				break;
	
		}
	}

	if (audio_is_playing(sndEnemyHit))  // stop enemy hit sound
		audio_stop_sound(sndEnemyHit);
	
	if (audio_is_playing(sndEnemyExplosion)) // play enemy death sound
		audio_stop_sound(sndEnemyExplosion);
	audio_play_sound(sndEnemyExplosion, 1, false);

}