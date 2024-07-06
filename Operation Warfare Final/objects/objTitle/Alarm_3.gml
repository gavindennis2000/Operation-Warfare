///@description go to high score after timeout
if (instance_exists(objStart)) {
	
	if 
		objStart.displayOptions == "sound test" or 
		objStart.showCredits
			exit;
	else
		room_goto(roomHighScore);
}