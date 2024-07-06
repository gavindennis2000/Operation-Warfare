while (gameScore >= 100) {
	gameScore -= 100;
	gameScore100++;
}

while (gameScore100 >= 10) {
	gameScore100 -= 10;
	gameScore1000++;
}

while (gameScore1000 >= 10) {
	gameScore1000 -= 10;
	gameScore10000++;
}

while (gameScore10000 >= 10) {
	gameScore10000 -= 10;
	gameScore100000++;
}
while (gameScore100000 >= 10) {
	gameScore = 9;
	gameScore10 = 9;
	gameScore100 = 9;
	gameScore1000 = 9;
	gameScore10000 = 9;
	gameScore100000 = 9;
}

if variable_global_exists("cheat")
	if (global.invincibilityCheat or global.spreadshotCheat or global.doubleJumpCheat) {
		gameScore = 0;
		gameScore10 = 0;
		gameScore100 = 0;
		gameScore1000 = 0;
		gameScore10000 = 0;
		gameScore100000 = 0;
	}