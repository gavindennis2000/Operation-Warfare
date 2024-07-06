// spawn two smaller asteroids
with instance_create_layer(x, y, layer, objAsteroid)
	direction = other.direction - 20
with instance_create_layer(x, y, layer, objAsteroid)
	direction = other.direction + 20

// only run this event if the player killed the enemy
if !(variable_instance_exists(self, "eHealth"))
	eHealth = 1;
	
if (eHealth > 0)
	exit;
	
// create explosion animation
instance_create_layer(x,y, "Bullet", objExplosion);

// increase game score
if (instance_exists(objScore)) {

	if (instance_exists(objEasy))
		objScore.gameScore += 1000;
		
	else if (instance_exists(objHard))
		objScore.gameScore += 1000;
		
	else
		objScore.gameScore += 1000;
		
}


if (audio_is_playing(sndEnemyHit))  // stop enemy hit sound
	audio_stop_sound(sndEnemyHit);
	
if (audio_is_playing(sndEnemyExplosion)) // play enemy death sound
	audio_stop_sound(sndEnemyExplosion);
audio_play_sound(sndEnemyExplosion, 1, false);