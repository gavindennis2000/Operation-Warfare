///@description special move: fire bullets

// temp variables for bullet speed and direction
var bDirection = point_direction(x, y, objPtr.x, objPtr.y);  // homing bullet direction
var bSpeed = 3.5;  // bullet speed
if (!instance_exists(objEasy))
	bSpeed = 3.75
var bH = 1;  // bullets will always face the right direction
var inc = 28;  // increment to adjust spread bullets

if 
	(!instance_exists(objHard) and smCounter == 8) or 
	(!instance_exists(objEasy) and !instance_exists(objHard) and smCounter == 8 and eHealth > eHealthInitial/2) or
	(!instance_exists(objEasy) and !instance_exists(objHard) and smCounter == 10 and eHealth <= eHealthInitial/2) or
	(instance_exists(objHard) and smCounter == 8 and eHealth > eHealthInitial/2) or  // go back to normal after attack
	(instance_exists(objHard) and smCounter == 15 and eHealth <= eHealthInitial/2) {  // go back to normal after attack	
	alarm[5] = 60;
	animationSlow = true;
}

else {  // shoot homing bullets
	if (audio_is_playing(sndSpreadshot))  // spread gun sound effect
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
	
	smCounter++;  // increment the counter
	var aTime = 35;
	if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
		aTime = 25;
	alarm[4] = aTime;  //repeat attack
	
}