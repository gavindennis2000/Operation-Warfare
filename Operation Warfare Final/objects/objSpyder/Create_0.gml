// declare variables for movement and gravity
hSpeed = 0;
vSpeed = 0;
grav = 0.1

while (!place_meeting(x, y+1, objWall))
	y += 1

left = -1;
right = 1;
facing = left;

maxFallSpeed = 7;
move = 0;
moveSpeed = 1.5;
dontMove = true;

heExists = (instance_exists(objPlayer));

// spyder health
switch(room) {
	
	case roomStageFinal:
		eHealth = 2;
		sprite_index = sprSpyderFinal;
		break;
		
	default:
		eHealth = 2;
		break;
		
}
healthScale = 100 / eHealth;
i = 0;

// jump height
jumpHeight = 2;

image_speed = 0;
image_index = 0;