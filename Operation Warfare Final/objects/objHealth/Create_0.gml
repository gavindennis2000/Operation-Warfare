if (!variable_global_exists("playerHealth")) {
	global.playerHealth = 5;
	if variable_global_exists("cheat") {
		if (global.infiniteLives)
			global.playerHealth = 35;
	}
}

// set drawing depth
layer = layer_create(0, "Health");