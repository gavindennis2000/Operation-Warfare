// speed and direction
switch room {
	
	case roomStageFinal:
		maxSpeed = 4.75;
		minSpeed = 2.25
		break;
	
	case roomPowerUp:
		maxSpeed = 5.5;
		minSpeed = 1.5
		break;
		
	case roomPractice:
		maxSpeed = 5.5;
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

ticker = 0;
slow = false;

if room != roomPowerUp
	exit;
	
// lol
flashRectangle = false;


// image opacity
image_alpha = 0;
alarm[0] = 30;