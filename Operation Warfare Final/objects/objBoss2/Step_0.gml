// check player Existance;
heExists = (instance_exists(objPlayer) and !instance_exists(objPlayerStart));
heNotDead = (!instance_exists(objPlayerDeath));

// boss becomes faster when he's low on health
if (!instance_exists(objEasy)) {
	if (eHealth <= eHealthInitial/2) {
		alarmTime = alarmTimeInitial - 12;
		smStart = 9;
		alarm5Time = alarm5TimeInitial / 1.5 + 5;
	}
}


// dont check for movement if in start state
if (state == start) {
	
	// sprite flicker
	counter++;
	if (counter % 3 == 0)
		imgAlpha = 0.2
	else
		imgAlpha = 1;
	
	// stop moving when you hit the wall
	if (place_meeting(x, y+vspeed ,objWall)) {
	while (!place_meeting(x, y+sign(vspeed), objWall)) {
		y += sign(vspeed); }
	vspeed = 0; }
	
	// set alarm for attack mode after vspeed is 0
	if (vspeed == 0) and (startTemp) {
		alarm[0] = 120;
		startTemp = false;
	}
	
	exit;
}

// special move state: ignore regular movement
if (state == special) {
	
	if (y <= yTarget and speed != 0) {
		speed = 0;
		x = xTarget;
		y = yTarget;
		
		if alarmTemp = true {
			alarmTemp = false
			alarm[7] = 60;
		}
	}
	
	if (speed == 0) and (makeHellFire) and (!instance_exists(objHellfire)) and (alarmTemp) {
		var cX = camera_get_view_x(view_camera[0]);
		
		// create hellfire number 1
		with (instance_create_layer(cX, 0, "Bullet", objHellfire)) {
			dir = right;
		}
		
		makeHellFire = false;
		hellFireAgain = 3;
		
		alarm[5] = alarm5Time;
	}
	
	// slow down animation after special attack
	if (animationSlow) {
		aniCounter ++;
		if (aniCounter % 10 == 0 and image_speed >= 0.1)
			image_speed -= 0.1;
	}
	
	exit;
}

// calculate movement
if (state != special) {
	vSpeed += grav; // gravity
}

// don't break terminal velocity when falling
if (vSpeed > maxFallSpeed)
	vSpeed = maxFallSpeed;

// check horizontal collision
if (place_meeting(x+hSpeed, y ,objWall)) {
	while (!place_meeting(x+sign(hSpeed), y, objWall)) {
		x += sign(hSpeed); }
	hSpeed = 0; }
	
// check vertical collision
if (place_meeting(x, y+vSpeed ,objWall)) {
	while (!place_meeting(x, y+sign(vSpeed), objWall)) {
		y += sign(vSpeed); 
	}
	
	vSpeed = 0;  // go back to standing position temporarily
}

// move the enemy
if (state != special) {
	x += hSpeed;
	y += vSpeed;
}

if (state == jump or state == run) {
	if (!place_meeting(x, y+1, objWall))
		state = jump;
	else
		state = run;
}
	

// change direction if it hits the wall
var cameraX = camera_get_view_x(view_camera[0]); // current camera position
if (x <= cameraX+16)
	x = cameraX+16;
else if (x >= cameraX+240)
	x = cameraX+240;