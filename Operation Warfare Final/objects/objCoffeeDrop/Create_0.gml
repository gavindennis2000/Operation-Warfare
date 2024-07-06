/// @description drop powerup when player walks into view
drop = true;

if (variable_global_exists("bossCheck")) {
	
	if (global.bossCheck) or (!instance_exists(objEasy))
		instance_destroy();
		
}

else 
	instance_destroy();