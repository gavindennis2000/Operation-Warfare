// create layer for stars
if (room != roomTitle)
	layer = layer_create(301, "Star");

// create a full room of stars
if (x == 0 and y == 0) {
	
	instance_create_layer(x, y+56, layer, objStar);
	instance_create_layer(x, y+112, layer, objStar);
	instance_create_layer(x, y+168, layer, objStar);
	
	for (i = 64; i < 64*4; i += 64) {
		instance_create_layer(x + i, y, layer, objStar);
		instance_create_layer(x + i, y+56, layer, objStar);
		instance_create_layer(x + i, y+112, layer, objStar);
		instance_create_layer(x + i, y+168, layer, objStar);
	}
}

// create a second layer of stars
instance_create_layer(x+16, y+20, layer, objStar2);

// speed and direction
switch room {
	
	case roomStageFinal:
	
	case roomPowerUp:
		maxSpeed = 4;
		minSpeed = 1.5
		break;
		
	
	case roomPractice:
		maxSpeed = 5;
		minSpeed = 2;
		break;
		
	default:
		maxSpeed = 8;
		minSpeed = 4;
		break;
}

direction = 190;
speed = minSpeed;
if room == roomStageFinal
	speed*=1.5;

// counters for slowing down/speeding up
ticker = 0;
slow = false;

if room!= roomPowerUp
	exit;

// alarm to flash the screen white
flashRectangle = 0;
alarm[1] = 450;


// image opacity
image_alpha = 0;
alarm[0] = 30;