if instance_exists(objPlayer) {
	
	if objPlayer.x >= 112 and image_index < 2
		image_index = 2;
		
	if objPlayer.x >= 400 and image_index < 3
		image_index = 3;
		
	if objPlayer.x >= 500 and image_index < 4
		image_index = 4;
		
	if objPlayer.x >= 800 and image_index < 5
		image_index = 5;
		
}
if !(instance_exists(objCannonBoss))
	image_index = 6;