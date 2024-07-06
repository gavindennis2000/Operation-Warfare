image_angle += angle * 2;

/* wrap the screen vertically
if (y < 0-sprite_height/2 and vspeed < 0)
	y = room_height+sprite_height/2;
else if (y > room_height+sprite_height/2 and vspeed > 0)
	y = 0-sprite_height/2;
	
