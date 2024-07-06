/// @description spawn baby asteroids

if (!instance_exists(objEasy)) {
	if (instance_exists(objPlayerSpaceship)) {
		instance_create_layer(x, y, layer, objAsteroidSmall, {direction: other.direction + 10} );
		instance_create_layer(x, y, layer, objAsteroidSmall, {direction: other.direction - 10} );
	}
	
	else if (instance_exists(objPlayer)) {
		instance_create_layer(x, y, layer, objAsteroidSmall, {direction: other.direction + 10, speed: 3, sprite_index: sprAsteroidBlueSmall} );
		instance_create_layer(x, y, layer, objAsteroidSmall, {direction: other.direction - 10, speed: 3, sprite_index: sprAsteroidBlueSmall} );
	}
}



// Inherit the parent event
if (instance_exists(objPlayerSpaceship))
	event_inherited();

else {
	
		// only run this event if the player killed the enemy
	if !(variable_instance_exists(self, "eHealth"))
		eHealth = 1;
	
	if (eHealth > 0)
		exit;
	
	
	
	// create explosion animation
	instance_create_layer(x,y, "Bullet", objExplosion);
		

	if (audio_is_playing(sndEnemyHit))  // stop enemy hit sound
		audio_stop_sound(sndEnemyHit);
	
	if (audio_is_playing(sndEnemyExplosion)) // play enemy death sound
		audio_stop_sound(sndEnemyExplosion);
	audio_play_sound(sndEnemyExplosion, 1, false);
	
}