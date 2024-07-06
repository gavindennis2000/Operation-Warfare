image_angle += angle;

// wrap the screen vertically
if !(sprite_index == sprAsteroidBlue) {
	
	if (y < 0-sprite_height/2 and vspeed < 0)
		y = room_height+sprite_height/2;
		
	else if (y > room_height+sprite_height/2 and vspeed > 0)
		y = 0-sprite_height/2;

}