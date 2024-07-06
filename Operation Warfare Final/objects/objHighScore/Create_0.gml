// stop all the music
audio_stop_all();
dsTemp = false;

// get current score from player
if (instance_exists(objScore)) {
	currentScore = objScore.compileScore();
}
else
	currentScore = 200;
currentName = "player";
current = {name: currentName, hscore: currentScore};

highScores = [	
	{name:"GAVIN", hscore: 100000}, 
	{name:"WALTER JR", hscore: 001750}, 
	{name:"JESSE", hscore: 002100}, 
	{name:"GUS", hscore: 001000}, 
	{name:"HEISENBERG", hscore: 000100} ];
		
// make high score leaderboard if it doesn't exist
if (!file_exists("high.txt")) {
	
	var _high = [	
	{name:"GAVIN", hscore: 100000}, 
	{name:"WALT JR", hscore: 017500}, 
	{name:"JESSE", hscore: 002100}, 
	{name:"SKINNYP", hscore: 001000}, 
	{name:"BADGER", hscore: 000300} ];
		
	var _json = json_stringify(_high);
	var _scoreFile = file_text_open_write("high.txt");
	file_text_write_string(_scoreFile, _json);
	file_text_close(_scoreFile);
	
}

// load high scores
if (file_exists("high.txt")) {
	
	var _file = file_text_open_read("high.txt");
	var _json = file_text_read_string(_file);
	var _scoreData = json_parse(_json);
	
	for (i = 0; i < 5; i++) {
	
		highScores[i].name = _scoreData[i].name;
		highScores[i].hscore = _scoreData[i].hscore;
	
	}
	
}

// check for new high score
newHighScore = false; 
newScorePos = 0;
for (i = 0; i < 5; i++) {
	
	if (current.hscore > highScores[i].hscore) and (!newHighScore) {
		
		newHighScore = true;
		array_insert(highScores, i, current);
		newScorePos = i;
		
	}
	
}

with (objHealth)
	instance_destroy();
with (objStageController) 
	instance_destroy(); 
with (objScore)
	instance_destroy();

holdUp = false;
holdDown = false;

if (newHighScore) {
	
	drawScore = false;
	tempName = "A A A A A"
	cursor = 1;
	
}

else {
	drawScore = true;
	alarm[1] = 60;
	alarm[0] = 400;
	exit;
}

function updateScore() {
	
	// update the document for the high score
	if (file_exists("high.txt")) {
	
		
	var _json = json_stringify(highScores);
	var _scoreFile = file_text_open_write("high.txt");
	file_text_write_string(_scoreFile, _json);
	file_text_close(_scoreFile);
	
	}
	
	// restart the game
	alarm[0] = 400;
}