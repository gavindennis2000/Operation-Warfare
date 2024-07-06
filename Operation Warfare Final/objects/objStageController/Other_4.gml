// set roomVarPlus for saving on the power up stage

switch(roomVar) {
	
	case stage1:
		roomVarPlus = stage2;
		break;
		
	case stage2:
		roomVarPlus = stage3;
		break;
		
	case stage3:
		roomVarPlus = finalStage;
		break;
}

// get score at start of stage
previousScore = 0;
switch (room) {
	
	case roomStage1:
	case roomStage2:
	case roomStage3:
	case roomStageFinal:
		if (instance_exists(objScore))
			previousScore = objScore.compileScore();
		break;
}

// set alarm for next room

if (room == roomStageSelect ) {
	
	// save game data
	if (roomVar != roomStageSpecial) {
		
		saveGame();
	}
	
	// prepare to go to next room
	alarm[0] = 120;
}

else if (room == roomPowerUp) {
	
	// save game data
	if (!instance_exists(objScore))
			instance_create_layer(x, y, layer, objScore);
			
	saveGamePlus(); 
	bossReadySave = true;
	
	audio_sound_loop_start(sndPowerUp, 7.55);
	audio_play_sound(sndPowerUp, 1, true);
	
}

// variable to check if boss is ready
bossReady = false;
bossReadyTemp = false;
bossDefeat = false;
bossDefeatTemp = false;
instance_create_layer(x, y, layer, objStageBG);  // create controller for stage bg color
