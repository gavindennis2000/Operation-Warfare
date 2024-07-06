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