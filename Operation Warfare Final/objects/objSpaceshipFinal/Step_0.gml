if (up) {
	
	if vspeed <= -1 {
		up = false; 
		down = true;
		
	}
	
	else 
		vspeed -= 0.1;
	
}

if (down) {
	
	if vspeed >= 1 {
		up = true; 
		down = false;
		
	}
	
	else 
		vspeed += 0.1;
	
}


if (instance_exists(objPlayerVictory)) {
	
	if (x >= objPlayerVictory.x) {
		
		image_index = 1;
		
		with (objPlayerVictory)
			instance_destroy();
	}
}