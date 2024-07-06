/// @description Insert description here

if (instance_exists(objEasy))
	instance_destroy();
	

// Inherit the parent event
event_inherited();

if (dontMove)
	exit;
	
else {
	
	
	
	if (start) {  
		// move the wasp to the center of the screen
	
		if (y >= room_height/3)
			vspeed -= 0.2;
		else {
			vspeed = 0;
			start = false;
			alarm[1] = 30;
		}
	}
	
	else if (finish) {
	
		if (y >= -sprite_height/2)
			vspeed -= 0.2;
		else {
			instance_destroy();
		}
		
	}
	
	else {
		// move the wasp up and down
	
		if (dir == up) {
		
			if (vspeed > -1)
				vspeed -= 0.05;
			else 
				dir = down;
		}
		
		if (dir == down) {
		
			if (vspeed < 1)
				vspeed += 0.05;
			else 
				dir = up
		}
	}
}