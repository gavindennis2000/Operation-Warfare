// adjust room camera
roomCamera = camera_get_view_x(view_camera[0]);

if (instance_exists(objEasy))
	instance_destroy();

// check if player exists
heExists = (instance_exists(objPlayer));
heNotDead = (!instance_exists(objPlayerDeath));
if (heExists) and (heNotDead)
	pX = (objPlayer.x + objPlayer.hSpeed);
if (x > roomCamera+260) or (instance_exists(objPlayerStart))
	dontMove = true;
else {
	dontMove = false;
}
// make the helicoptor go up and down
if (!attack) {
	if (vspeed >= goUp)
		heli = goDown;
	if (vspeed <= goDown)
		heli = goUp;
	if (!dontMove) {
		vspeed += heli/20;
		counter++;
		if (counter % 2 == 0)
		x += face / 2;
	}
	
	if (!dontMove && alarm_get(2) <= 0) {
		alarm[2] = 60;	
	}
}

// change direction if it hits the wall
if (x <= roomCamera+8 and !dontMove) {
	face = right;
	if (homing)
		x = roomCamera+8;
}

else if (x >= roomCamera+248 && !dontMove) {
	face = left;
	x = roomCamera + 248
}