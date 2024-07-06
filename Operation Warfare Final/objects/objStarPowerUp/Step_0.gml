if (instance_exists(objStar)) {
	if (objStar.flashRectangle == 2) and (!createPlayer) {
		
		createPlayer = true;
		alarm[0] = 120;
		instance_create_layer(x, y, "Controller", objPowerUpText);
		
		for(var i = 0; i < room_width; i+=16) {  // create walls along the floor
			instance_create_layer(i, room_height/2 + 56, "Wall", objWall4);
		}
		for(var i = 0; i < room_width; i+=16) {  // create walls along the floor 2
			with(instance_create_layer(i, room_height/2 + 56+16, "Wall", objWall4))
				image_index++;
		}
		
	}
}