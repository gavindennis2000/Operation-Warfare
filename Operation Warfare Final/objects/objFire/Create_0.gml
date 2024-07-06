if layer_exists(layer_get_id("Wall"))
	layer = layer_get_id("Wall");

if (room == roomStage3 or room == roomStageFinal) {
	if (instance_exists(objEasy))
		instance_destroy();
	y = room_height;
}
ystart = y;

vspeed = 0;
image_speed = 0.3
move = false;
moveTemp = true;

if (!instance_exists(objEasy) or room == roomStage2)
	instance_create_layer(x+8, y, layer, objFire2);

up = 1;
down = -1;
dir = up;
wrap = false;
sfx = true;

playerExists = false;
wrap = false;
