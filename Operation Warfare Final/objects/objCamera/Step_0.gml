// update backgrounds
if (
	room == roomStage1 or 
	room == roomStage2 or 
	room == roomStage3 ) {
	
	var camX = camera_get_view_x(view_camera[0]);
	
	if (layer_exists("BG2")) {
		layer_x("BG2", camX/4);
	}
	
	if (layer_exists("BG3")) {
		layer_x("BG3", camX/3);
	}
	
	if (layer_exists("BG4")) {
		layer_x("BG4", camX/2 + 256*5);
	}
		
}

// fire reset for stage 2: flame run
if (fireResetCheck and x <= 2240) {
	
	x = 2240;
	hspeed = 0;
	
	fireResetCheck = false;

	with (objPlayerDeath)
		alarm[1] = 5;
		
	with (objFireballSpawner)
		canCreate = true;
		
	instance_destroy(objFireball);
}

// shock reset for stage 3: shock run
else if (shockResetCheck and x <= 3500-64+4) {
	
	x = 3500-64+4;
	hspeed = 0;
	
	shockResetCheck = false;

	with (objPlayerDeath)
		alarm[1] = 5;
}

// space reset for stage 3: shock run
else if (spaceResetCheck and x <= 2848+64) {
	
	x = 2848+64;
	hspeed = 0;
	
	spaceResetCheck = false;
	
	if (instance_exists(objAsteroidSpawner)) {
		with (objAsteroidSpawner) {if (x >= 3328) {fireAsteroid = true;}}	
	}

	with (objPlayerDeath)
		alarm[1] = 5;
}

// spaceship reset for stage 3: shock run
else if (spaceshipResetCheck and x <= 4832) {
	
	x = 4832;
	hspeed = 0;
	
	spaceshipResetCheck = false;

	with (objPlayerDeath)
		alarm[1] = 5;
}

else if (portalMoveCheck) {
	
	if	(x >= portalX and hspeed >= 0) or 
		(x <= portalX and hspeed < 0) {
		
		
		// move objPlayer to new portal
		if (instance_exists(objPlayer)) { 
			
			objPlayer.x = portalX;
			objPlayer.y = portalY;
			
			with (objPlayer)
				alarm[2] = 10;
				
		}
		
		hspeed = 0;
		portalMoveCheck = false;
		
	}
	
}

// follow spaceship on final stage
else if (instance_exists(objPlayerSpaceship)) and (objPlayerSpaceship.image_index == 1) {
	
	if (objPlayerSpaceship.state != objPlayerSpaceship.start and objPlayerSpaceship.x+102 > x )
		x = objPlayerSpaceship.x+102;
}
// follow spaceship on final stage
else if (instance_exists(objSpaceshipFinal)) {
	
	if (objSpaceshipFinal.x > x)
		x = objSpaceshipFinal.x;
		
}

else {
	
	// camera follows player unless he moves backwards
	if instance_exists(objPlayer) and (!instance_exists(objPlayerDeath)) {
		if objPlayer.x > x {
			
			var finalX = room_width - 256 * 5/2;
			if (room == roomStageFinal) 
				if (x < finalX)
					x = objPlayer.x;
				else {
					x = finalX;
					finalReady = true
				};
				
			else
				x = objPlayer.x;
		}
		
		if objPlayer.y < y
			y = objPlayer.y; 
		if objPlayer.y > y
			y = objPlayer.y;

	}		
}