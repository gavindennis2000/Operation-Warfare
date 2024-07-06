///@description shoot two bullets at enemy; first
if (instance_exists(objPlayer) and !instance_exists(objPlayerStart)) {
	
	if (!instance_exists(objPlayerDeath)) {
		playerX = objPlayer.x;
		playerY = objPlayer.y;
	}
	
	if (audio_is_playing(sndEnemyBullet))
		audio_stop_sound(sndEnemyBullet);
	audio_play_sound(sndEnemyBullet, 1, false);
	
	
	with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {
		direction = point_direction(x, y, other.playerX, other.playerY);
		if (room == roomStageFinal)
			speed = 4;
		else
			speed = 3; 
			
		if (instance_exists(objHard))
			if (room == roomStageFinal)
				speed += 0.5;
			else
				speed++;
		}
	
	shootCheck = true; 
}