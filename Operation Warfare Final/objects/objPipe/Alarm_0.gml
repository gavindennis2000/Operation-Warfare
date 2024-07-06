if (instance_exists(objPlayerVictory)) {
	instance_destroy(objPlayerVictory);
	alarm[0] = 60;
}

else {
	
	objStageController.roomVar = roomStageFinal;
	global.bossCheck = false;
	alarm[1] = 10;
	
}
	