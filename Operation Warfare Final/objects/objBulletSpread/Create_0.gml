reflect = false;
reflectTemp = true;

if	(instance_exists(objShockblast)) or 
	(instance_exists(objPlayer) and objPlayer.shockblast) {
		
	sprite_index = sprShockblast;
	image_speed = 1.5;
	
}