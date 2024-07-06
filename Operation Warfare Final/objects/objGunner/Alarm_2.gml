// shoot two bullets at enemy; first
if (instance_exists(objPlayer) and !instance_exists(objPlayerStart)) {
	
	if objPlayer.x > x	
		exit;
		
	var pX = x;
	var pY = y;
	
	if (!instance_exists(objPlayerDeath)) {
		pX = objPlayer.x;
		pY = objPlayer.y;
	}
	
	pDirection =  point_direction(x, y, pX, pY);

	var tooFar = 115;
	if pDirection < tooFar
		pDirection = tooFar;
		
	if (objPlayer.x + 10 >= x || instance_exists(objPlayerDeath))
		pDirection = 180;
	
	if (audio_is_playing(sndEnemyBullet))
		audio_stop_sound(sndEnemyBullet);
	audio_play_sound(sndEnemyBullet, 1, false);
	
	bullets--;
	
	with (instance_create_layer(x-14, y+9, "Bullet", objBulletEnemy)) {
		
		direction = other.pDirection
		
		if room == roomStageFinal 
			speed = 4.5;
		else
			speed = 3.5; 
		if (instance_exists(objHard))
			speed ++;
			
	}
	
	if (bullets > 0) {
		alarm[2] = aTime;
	}
	
	else {
		bullets = 2;
		shootCheck = true;
	}
}