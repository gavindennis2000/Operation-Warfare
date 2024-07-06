if (variable_global_exists("bossCheck")) {
	if (!global.bossCheck)
		stay = true;
	else 
		instance_destroy();
}