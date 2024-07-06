function saveGame(){
	
	// save the game data
	var _gameDataStruct = {
	
		gameHealth: global.playerHealth,
		gameScore: objScore.compileScore(),
		gameRoom: roomVar,
		gameSS: (instance_exists(objSpreadshot)),
		gameDJ: (instance_exists(objDoubleJump)),
		gameSB: (instance_exists(objShockblast)),
		gameEasy: (instance_exists(objEasy)),
		gameHard: (instance_exists(objHard)),
		gameBossReady: global.bossCheck,
		checkpoint: global.checkpoint
	}
	
	var _gameData = json_stringify(_gameDataStruct);
	var _file = file_text_open_write("save.txt");
	file_text_write_string(_file, _gameData);
	file_text_close(_file);

}

function saveGamePlus(){
	
	// save the game data on the powerup screen
	var _gameDataStruct = {
	
		gameHealth: global.playerHealth,
		gameScore: objScore.compileScore(),
		gameRoom: roomVarPlus,
		gameSS: (instance_exists(objSpreadshot)),
		gameDJ: (instance_exists(objDoubleJump)),
		gameSB: (instance_exists(objShockblast)),
		gameEasy: (instance_exists(objEasy)),
		gameHard: (instance_exists(objHard)),
		gameBossReady: false,
		checkpoint: false
		
	}
	
	var _gameData = json_stringify(_gameDataStruct);
	var _file = file_text_open_write("save.txt");
	file_text_write_string(_file, _gameData);
	file_text_close(_file);

}

function loadGame() {
	
	// load the game data
	if (file_exists("save.txt")) {
		
		var _file = file_text_open_read("save.txt");
		var _json = file_text_read_string(_file);
		var _saveData = json_parse(_json);
		
		// set the right health, score, and room
		objScore.gameScore =  _saveData.gameScore;
		global.playerHealth = _saveData.gameHealth;
		objStageController.roomVar = _saveData.gameRoom; 
		
		// check for powerups
		if ( _saveData.gameSS) 
			instance_create_layer(0, 0, "Controller", objSpreadshot);
		if ( _saveData.gameDJ) 
			instance_create_layer(0, 0, "Controller", objDoubleJump);	
		if ( _saveData.gameSB) 
			instance_create_layer(0, 0, "Controller", objShockblast);
			
		// game difficulty
		if ( _saveData.gameEasy) 
			instance_create_layer(0, 0, "Controller", objEasy);
		if ( _saveData.gameHard) 
			instance_create_layer(0, 0, "Controller", objHard);
			
		// check if player is at boss
		global.bossCheck =  _saveData.gameBossReady;
		global.checkpoint = _saveData.checkpoint;
		
	}
	
}