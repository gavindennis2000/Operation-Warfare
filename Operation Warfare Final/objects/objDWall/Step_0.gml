var cameraX = camera_get_view_x(view_camera[0]);

if room == roomStage2 {  // stage 2 code
	if (cameraX+16 >= x-256) and !instance_exists(objPlayerStart)
		dontMove = false;
	else
		dontMove = true;

	if (dontMove)
		exit;

	if (alarmTime == 0) {
	
		if (inst == 1)
			alarmTime = 80;
		
		else if (inst == 2)
			alarmTime = 50;
		
		alarm[0] = alarmTime/5;
	}
}

if room == roomPractice {  // practice stage code
	if (cameraX+16 >= x-256) and !instance_exists(objPlayerStart)
		dontMove = false;
	else
		dontMove = true;

	if (dontMove)
		exit;

	if (alarmTime == 0) {
	
		alarmTime = 120;
		alarm[0] = alarmTime/5;
	}
}

if room == roomStageFinal {  // stage final code
	if (cameraX+16 >= x-256) and !instance_exists(objPlayerStart)
		dontMove = false;
	else
		dontMove = true;

	if (dontMove)
		exit;

	if (alarmTime == 0) {
	
		alarmTime = 60;
		alarm[0] = alarmTime/5;
	}
}