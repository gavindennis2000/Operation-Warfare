// declare variables for movement and gravity
hSpeed = 0;
vSpeed = 0;
grav = 0.2;
maxFallSpeed = 5;
move = false;
moveSpeed = 1.5;
dontMove = true;
airMove = false;

// check if player exists
heExists = (instance_exists(objPlayer));
heNotDead = (!instance_exists(objPlayerDeath));

// runner1 has 3 health
switch(room) {
		
	case roomStage1:	
		eHealth = 3;
		break;
		
	default:	
		eHealth = 6;
		break;
}

if (instance_exists(objHard))
	eHealth = 6;
	
healthScale = 100/eHealth;

// direction of the runner
left = -1;
right = 1;
face = left;

// camera variables
y = camera_get_view_y(view_camera[0])
cameraX = camera_get_view_x(view_camera[0]);

// animation is static when enemy is in the air
image_speed = 0;
image_index = 0;

while(place_meeting(x, y, objWall))
	y++;