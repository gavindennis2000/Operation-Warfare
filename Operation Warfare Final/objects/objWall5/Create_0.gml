image_speed = 0.6;
image_index = 0;
spaceMove = true;


// set initial image index
switch(x % 64) {
	case 0: 
		image_index = 0;
		break;
		
	case 16:
		image_index = 1;
		break;
	
	case 32:
		image_index = 2;
		break;
		
	case 48:
		image_index = 3;
		break;
}


switch(y % 64) {
	case 0: 
		image_index += 0;
		break;
		
	case 16:
		image_index += 1;
		break;
	
	case 32:
		image_index += 2;
		break;
		
	case 48:
		image_index += 3;
		break;
}