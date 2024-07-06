if (
	room == roomEnding or 
	room == roomStageSelect	
)
	instance_destroy();
	
alarmTemp = true;
rectAlpha = 0;
if (room == roomStageFinal)
	inc = 0.05