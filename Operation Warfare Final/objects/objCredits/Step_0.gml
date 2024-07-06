// stops moving when at the top of the screen
if (y == 0) {
	if (!rollCredits) {
		rollCredits = true;
		vspeed = 0;
		flash = true;
		alarm[2] = 4;
	}
}