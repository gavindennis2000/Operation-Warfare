if (instance_exists(objEasy) and room != roomStage2)
	instance_destroy();

if layer_exists(layer_get_id("Wall"))
	layer = layer_get_id("Wall");

vspeed = 0;
image_speed = 0.3
move = false;
moveTemp = true;

up = 1;
down = -1;
dir = up;
wrap = false;
sfx = true;

playerExists = false;
