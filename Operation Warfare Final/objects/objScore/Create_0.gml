layer = layer_create(0, "score");

gameScore = 0;
gameScore10 = 0;
gameScore100 = 0;
gameScore1000 = 0;
gameScore10000 = 0;
gameScore100000 = 0;

function compileScore() {
	
	// compiles score for save data 
	var tempScore = 
		gameScore + 
		gameScore10 * 10 +
		gameScore100 * 100 + 
		gameScore1000 * 1000 + 
		gameScore10000 * 10000 + 
		gameScore100000 * 100000;
		
	return tempScore;
	
}

function zeroScore() {
	
	gameScore = 0;
	gameScore10 = 0;
	gameScore100 = 0;
	gameScore1000 = 0;
	gameScore10000 = 0;
	gameScore100000 = 0;

}