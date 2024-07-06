// check player Existance;
heExists = (instance_exists(objPlayer) and !instance_exists(objPlayerStart));
heNotDead = (!instance_exists(objPlayerDeath));

// buff when low on health
if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2) {
	
	smStart = 5;
	
}

// jump height
if (jHeight > jHeightMax)
	jHeight = jHeightOriginal;


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
	
// calculate movement
if (state != special) {
	var move = 1.25; // default runner speed
	if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
		move = 1.5
	hSpeed = move * face; // horizontal
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
	hSpeed = 0;
	state = stand;
	
	var aTime = 5;
	if (eHealth <= eHealthInitial/4 and instance_exists(objHard))
		aTime = 3;
	if (canJump) {
		canJump = false;
		if (specialMove != 0) 
			alarm[1] = aTime;  // perform normal jump attack
		else
			alarm[3] = aTime;  // perform special attack
	}
}

	
// move the enemy
if (state != special) {
	x += hSpeed;
	y += vSpeed;
}
	

// change direction if it hits the wall
cameraX = camera_get_view_x(view_camera[0]); // current camera position
if (x <= cameraX+8) {
	face = right;
	x = cameraX+8;
}
else if (x >= cameraX+248) {
	face = left;
}

// special attack
if (state == special) {
	if (y <=  40) {
		speed = 0;
		if (smCounter == 0) {
			smCounter++;
			alarm[4] = 30;
		}
	}
}

// special attack animation speed
if (animationSlow) {
	aniCounter++;
	if (aniCounter % 10 == 0 and image_speed >= 0.1)
		image_speed -= 0.1;
}