// generic enemy variables

eHealth = 10;
heExists = false;
heNotDead = true;
dontMove = true;
hSpeed = 0;
vSpeed = 0;
roomCamera = camera_get_view_x(view_camera[0]);
start = true;

// enemy specific variables
goUp = 1;
goDown = -1;
heli = goUp;

left = -1;
right = 1;
face = left;

pX = 0;
pY = 0;

dist = 64;

homing = false;
homingTimer = false;
playerX = 0;
playerY = 0;
clockTicks = 0;
counter = 0;
changeDirection = false;
attack = false;

fireXscale = 1;
fireYscale = 1;

image_speed = 1; // set animation speed
alarm[1] = 30;