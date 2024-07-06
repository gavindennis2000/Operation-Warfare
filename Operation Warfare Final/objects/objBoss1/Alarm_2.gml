///@description fire bullets

// temp variables for bullet speed and direction
var bDirection = - 20;  // bullet direction
var bSpeed = 4;  // bullet speed
if (instance_exists(objEasy))
	bSpeed = 3.5;
var bH = face;  // adjust direction to face the boss
var inc = 35;  // increment to adjust spread bullets
if (eHealth <= eHealthInitial/2 and instance_exists(objHard))
	inc = 30;	


if (audio_is_playing(sndSpreadshot))
	audio_stop_sound(sndSpreadshot);
audio_play_sound(sndSpreadshot, 1, false);

with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {  // first bullet
	direction = bDirection
	speed = bSpeed;
	hspeed *= bH;  // set direction of bullets
}

with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {  // second
	direction = bDirection - inc;
	speed = bSpeed;
	hspeed *= bH;  // set direction of bullets
}

with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {  // third
	direction = bDirection + inc;
	speed = bSpeed;
	hspeed *= bH;  // set direction of bullets
}

// create extra bullets on hard
if (instance_exists(objHard)) {
	
	with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {  // second
		direction = bDirection - inc*2;
		speed = bSpeed;
		hspeed *= bH;  // set direction of bullets
	}

	with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {  // third
		direction = bDirection + inc*2;
		speed = bSpeed;
		hspeed *= bH;  // set direction of bullets
	}
	
}