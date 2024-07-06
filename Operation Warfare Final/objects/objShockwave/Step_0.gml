if image_alpha < 1
	image_alpha += 0.01;

if (!instance_exists(objBoss3))
	instance_destroy();
	
if changeDirection != 0 {
	
	inc += 0.0325;
	direction += inc * changeDirection;
	
}
	
image_angle = direction-90;

if (changeAlpha) {
	
	changeDirection = 0;
	
	if image_alpha > 0
		image_alpha -= 0.1;
	else
		instance_destroy();
	
}