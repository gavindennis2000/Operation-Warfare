// check player Existance;
heExists = (instance_exists(objPlayer) and !instance_exists(objPlayerStart));
heNotDead = (!instance_exists(objPlayerDeath));

// speed boost when low on health
if (!instance_exists(objEasy)) {
	if (eHealth <= eHealthInitial/3) {
		alarmTime = alarmTimeInitial - 40;
		smStart = 3;
	}
	
	else if (eHealth <= eHealthInitial*2/3)
		alarmTime = alarmTimeInitial - 20;
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
	if (place_meeting(x, y+vspeed ,objWall) and y > room_height/2) {
	while (!place_meeting(x, y+sign(vspeed), objWall)) {
		y += sign(vspeed); }
	vspeed = 0; }
	
	// set alarm for attack mode after vspeed is 0
	if (vspeed == 0) and (startTemp) {
		alarm[0] = 80;
		startTemp = false;
	}
	
	exit;
}

// special attack: shockwave
if (state == special) {
	
	var disposition = 180;
	
	if (y < room_height/2-24 and smTemp) {
		
		smTemp = false;
		
		audio_play_sound(sndShockwave, 1, false);
		glow = true;
		pLocation = point_direction(x, y, objPtr.x, objPtr.y);
		speed = 0;
		y = room_height/2-24;
		x = cameraX+256/2;
		alarm[5] = 55;
		alarm[3] = 80;
		alarm[4] = 240;
		
	}
	
	if (animationSlow) {
		aniCounter ++;
		if (aniCounter % 10 == 0 and image_speed > 0.1)
			imgSpeed -= 0.1;
			
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
	
	vSpeed = 0;  
	hSpeed = 0;
	
	if (x > cameraX + 256/2)
		face = left;
	else
		face = right;
}

// end special: go back to starting position after special attack
if (goBack and place_meeting(x, y-1, objWall)) {
	
	hSpeed = -2;
	face = left;
	
	if (x <= cameraX + 30) {
		
		x = cameraX + 30;
		
		hSpeed = 0;
		image_yscale = 1;
		
		grav = -grav;
		face = right;
		
		animationSlow = false;
		imgSpeed = 0.7;
		smTemp = true;
		specialMove = smStart;
		
		alarm[1] = alarmTime;
		
	}
	
}

// move the enemy
if (state != special) {
	x += hSpeed;
	y += vSpeed;
}

if (state == jump or state == run) {
	if	(place_meeting(x, y+1, objWall) or 
		(place_meeting(x, y-1, objWall) and image_yscale == -1))
			state = run;
	else
		state = jump;
}

