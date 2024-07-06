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

// special attack
else if (state == special) {
	
	
	
	var aTime = 70;
	if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
		aTime = 28;
	
	if (up) {
		
		var spd = 0.1;
		
		vspeed -= spd;
		
		if y <= room_height/2 {
			
			if (vspeed < 0 ) 
				vspeed += 0.2;
				
			else {
				vspeed = 0;
				up = false
				alarm[4] = aTime;
			}
		}
	}
		
	else {
		
		// flutter if not homing on the enemy
		if (flutter == 1) {
			
			if (vspeed >= -1) {
				vspeed -= 0.05;
			}
			else { 
				vspeed = -1;
				flutter = 2;
			}
			
		}
		else if (flutter == 2) {
			
			if (vspeed <= 1) {
				vspeed += 0.05;
			}
			else { 
				vspeed = 1;
				flutter = 1;
			}
			
		}
		
		if (objPtr.x > x) {
			
			moveRight = true;
			moveLeft = false;
			
		}
		
		else if (objPtr.x < x) {
			
			moveLeft = true; 
			moveRight = false; 
		
		}
		
		else {
			
			moveLeft = false; 
			moveRight = false; 
		
		}
	
	}
		
	// homing attack 
	if (homing) {
		
		
		moveLeft = false; 
		moveRight = false;
		flutter = 0;
		
		if (vspeed < 0) {
			if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
				speed -= 0.9; 
			else 
				speed -= 0.65; 
		}
		else {
			if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
				speed += 0.9; 
			else
				speed += 0.65;
		}
			
		if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
			
			
		if changeDir 
			hTime++;
		else 
			hTime--;
			
		if (y > tempPY and changeDir) {
			
			changeDir = false;
			speed = - speed/2;
			alarm[8] = 180;
		}
		
		else if (!changeDir and y < initY + 5) or (!changeDir and fix) {
			alarm[4] = aTime;
			alarm[8] = -1;
			fix = false;
			hTime = 0;
			y = initY+5;
			speed = 0;
			changeDir = true;
			flutter = 1; 
			homing = false;
			hCount--;
			
		}
		
	}
	
	if (moveRight) {
		hspeed += 0.1;
	}
	if (moveLeft) {
		hspeed -= 0.1;
	}
	
	if (flutter != 0) {
		n = 3;
		if (hspeed > n) 
			hspeed = n; 
		if (hspeed < -n) 
			hspeed = -n
	}
	
	
	// don't go past the view
	var cameraX = camera_get_view_x(view_camera[0]); // current camera position
	if (x <= cameraX+16 and hspeed < 0) {
		x = cameraX+16;
	}
	else if (x >= cameraX+240 and hspeed > 0) {
		x = cameraX+240;
	}
	
	
	exit;
}

// fall state {
if (state == fall) or (state == finish) {
	
	if (!falling) {
		falling = true;
		alarm[5] = 100;
	}
		
	hspeed = 0;
	
	if (falling) {
		
		tick++; 
		if (tick % 4 == 0) or (tick % 5 == 0)
			image_blend = c_black;
		else 
			image_blend = c_white;
			
		
	}

}

// gravity displaces y
if (state != special) {
	vSpeed += grav; // gravity
}

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
	if (state == jump)
		hSpeed = 0;
	
	if (state == jump and (alarm_get(1) == -1))
		alarm[1] = 1;
	
}

// move the boss
if (state != special) {
	x += hSpeed;
	if (!instance_exists(objEasy) and eHealth <= eHealthInitial/2)
		x+= hSpeed/4;
	y += vSpeed;
}


// shoot bullets

// player location for shooting

if (state == jump and canShoot) {
	if vSpeed <= -1
		tempPX = point_direction(x, y, objPtr.x, objPtr.y);
	
	else if vSpeed >= -0.2 {
		canShoot = false;
		if (jumps % 2 == 0) {
		
			var d = 10;
			if (instance_exists(objHard) and eHealth <= eHealthInitial/4)
				d = 15;
			if audio_is_playing(sndSpreadshot) 
				audio_stop_sound(sndSpreadshot);
			audio_play_sound(sndSpreadshot, 1, false);
			for (dir = -d; dir <= d; dir += 10) {
			
				with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {
					direction = other.tempPX;
					direction += other.dir;
					speed = 6;
				}
			
			}
		}
		 
		
	}
}

// don't go past the view
var cameraX = camera_get_view_x(view_camera[0]); // current camera position
if (x <= cameraX+16)
	x = cameraX+16;
else if (x >= cameraX+240)
	x = cameraX+240;