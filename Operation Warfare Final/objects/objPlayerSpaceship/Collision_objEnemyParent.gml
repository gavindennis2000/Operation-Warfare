if (variable_global_exists("invincibilityCheat")) {
	if (global.invincibilityCheat)
		exit;
}

if (state == alive) and (invincible <= 0) {
	
	state = dead;
	if (variable_instance_exists(other, "eHealth"))
		other.eHealth--;
	spaceDeath();
	
}