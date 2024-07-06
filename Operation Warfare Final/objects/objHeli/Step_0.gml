// adjust room camera
roomCamera = camera_get_view_x(view_camera[0]);

// check if player exists
heExists = (instance_exists(objPlayer));
heNotDead = (!instance_exists(objPlayerDeath));
if (heExists) and (heNotDead)
	pX = (objPlayer.x + objPlayer.hSpeed);
if (x > roomCamera+260) or (instance_exists(objPlayerStart))
	dontMove = true;
else
	dontMove = false;
	
// make the helicoptor go up and down
if (!homing) {
	if (vspeed >= goUp)
		heli = goDown;
	if (vspeed <= goDown)
		heli = goUp;
	if (!dontMove) {
		vspeed += heli/10;
		hspeed = face;
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
	
// homing attack
if (heExists) and (heNotDead) {
	if (objPlayer.startTemp and !objPlayer.invincible) and (!homing) and (alarm_get(1) == -1) and (!dontMove) {
		if ((pX >= x-dist) and (face == left)) or ((pX <= x+dist) and (face == right)) {
			hspeed = 0;
			vspeed = 0;
		
		
			playerX = objPlayer.x;
			playerY = objPlayer.y + objPlayer.image_yscale*8;
		
			direction = point_direction(x, y, playerX, playerY)
			
			if (instance_exists(objHard)) {
				
				if room == roomStageFinal
					speed = 6;
				else
					speed = 5;
					
			}
			
			else {
				
				if room == roomStageFinal
					speed = 5;
				else
					speed = 4;
					
			}
			
			homing = true;	
		}
	}
}

// switch directions during homing attack
if (homing) and (!changeDirection) {
	if (sign(hspeed) == -1) {
		if (x <= playerX) {
			changeDirection = true;
			vspeed = -vspeed;
		}
	}
	else if (sign(hspeed) == 1) {
		if (x >= playerX) {
			changeDirection = true;
			vspeed = -vspeed;
		}
	}
}

if (homing) and (changeDirection) {
	
	var ty = 70;
	if (room == roomStageFinal)
		ty = 35;
	if 
		(vspeed < 0 and y <= ty) or
		(vspeed > 0 and y >= ty) {
		
		speed = 0;
		y = camera_get_view_y(view_camera[0])+ty;
		
		x = round(x);
		
		changeDirection = false;
		homing = false;
		homingTimer = true;
		alarm[1] = 30;
		
		// heli speeds up
		left = -1;
		right = 1;
		
		if (heExists) {
			if objPlayer.x < x
				face = left;
			else
				face = right;
		}
	}
}