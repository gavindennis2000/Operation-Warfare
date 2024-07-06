if (imageAlpha >= 1) {
		audio_stop_all();
		if (room == roomPractice)
				game_restart();
				
		else if (room == roomStageFinal)
			room_goto(roomCredits);	
			
		else if (room == roomStage2 and objStageController.special) {
			with (objStageController) {
				special = false;
				roomVar = roomStageSpecial;
			}
			room_goto(roomStageSelect);		
		}
			
		else
			room_goto(roomPowerUp);
}
	
else {
	imageAlpha += 0.25;
	alarm[1] = 10;
}