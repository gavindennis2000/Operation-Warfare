// boss defeat
if (instance_exists(objStageController))
	objStageController.bossDefeat = true;

// death animation
with (instance_create_layer(x, y, layer, objBossDeath)) {
	face = other.face*-1;
}

// increase game score

if (variable_global_exists("infiniteLives")) {
	if (global.infiniteLives) {
		
		if (instance_exists(objScore)) {
			
			if (instance_exists(objEasy))
				objScore.gameScore += 1000;
			else if (instance_exists(objHard))
				objScore.gameScore += 1000;
			else
				objScore.gameScore += 1000;
		}
	}
	
	else {
		if (instance_exists(objScore)) {
			
			if (instance_exists(objEasy))
				objScore.gameScore += 2500;
			else if (instance_exists(objHard))
				objScore.gameScore += 10000;
			else
				objScore.gameScore += 5000;
				
		}
	
	}
}