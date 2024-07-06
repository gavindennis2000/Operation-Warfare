/// @description make walls fall from the sky

for (i = -16; i > 0 - 16*25; i -= 16) {
	index = i;
	with (instance_create_layer(initX, i, "Wall", objWall5)) {
		image_index -= other.index/16
		vspeed = 2;
		
	}
}


initX += 16;
alarm[2] = aTime;
