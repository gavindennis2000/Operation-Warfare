if (variable_global_exists("invincibilityCheat")) {
	if (global.invincibilityCheat)
		exit;
}


if (state == alive) and (invincible <= 0) {
	
	state = dead;
	spaceDeath();
	
}