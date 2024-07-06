///@description go to the next room

// stop the music
audio_stop_all(); 
layer = layer_create(-10000, "bloatLord");

// dim the screen
if (screenAlpha < 1) {
	
	screenAlpha += 0.25; 
	alarm[1] = 10;
}

// if the screen is black, move to the next room
else {
	
	if (roomGoto == practice) {
		global.playerHealth = -1;
		room_goto(roomPractice);
	}


	else if (roomGoto == play) {
	
		if (global.infiniteLives) // assign player lives
			global.playerHealth = 30;
		else
			global.playerHealth = 6;

		instance_create_layer(x, y, "Controller", objScore); // create the object that takes care of the score
		room_goto(roomStory);

	}
	
	else if (roomGoto == load) {
	
		
		instance_create_layer(x, y, "Controller", objScore); // create the object that takes care of the score
		instance_create_layer(x, y, "Controller", objStageController); // create stage controller 
		loadGame();
		room_goto(roomStageSelect);
	
	}
}

