// generic enemy variables

// heli health
switch(room) {
	
		
	default:
		eHealth = 1;
		break;
}

healthScale = 100 / eHealth;
heExists = false;
heNotDead = true;
dontMove = true;
hSpeed = 0;
vSpeed = 0;
roomCamera = camera_get_view_x(view_camera[0]);

// enemy position

if room == roomStageFinal {
	y = 35;
	sprite_index = sprHeliFinal;
}
else {
	sprite_index = sprHeli;
	y = camera_get_view_y(view_camera[0])+70;
}

// enemy specific variables
goUp = 1;
goDown = -1;
heli = goUp;

left = -0.5;
right = 0.5;
face = left;

pX = 0;
dist = 64;

homing = false;
homingTimer = false;
playerX = 0;
playerY = 0;
clockTicks = 0;
changeDirection = false;

image_speed = 0.8; // set animation speed