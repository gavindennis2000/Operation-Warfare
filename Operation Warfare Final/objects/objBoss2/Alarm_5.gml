///@description create the second hellfire if necessary
if (hellFireAgain == 3) {
	hellFireAgain--;
	var cX = camera_get_view_x(view_camera[0]);
	
	with (instance_create_layer(cX+256-8, 0, "Bullet", objHellfire)) {
			dir = left;
	}
	
	alarm[5] = alarm5Time;
	
	exit;
}

// create the third hellfire if necessary
else if 
	(hellFireAgain == 2) and 
	(eHealth <= eHealthInitial/2) and 
	!instance_exists(objEasy) {
	hellFireAgain--;
	var cX = camera_get_view_x(view_camera[0]);
	
	with (instance_create_layer(cX, 0, "Bullet", objHellfire)) {
			dir = right;
	}
	
	alarm[5] = alarm5Time;
	
	exit;
}

// create the second hellfire if necessary
else if 
	(hellFireAgain == 1) and 
	(eHealth <= eHealthInitial / 2) and
	!instance_exists(objEasy) {
		
		hellFireAgain--;
		var cX = camera_get_view_x(view_camera[0]);
	
		with (instance_create_layer(cX+256-8, 0, "Bullet", objHellfire)) {
				dir = left;
		}
	
	alarm[5] = alarm5Time;
	
	exit;
}

// go back to normal after special move
else {
	animationSlow = true;
	specialMove = smStart;

	alarm[2] = alarm5TimeInitial-45;
}