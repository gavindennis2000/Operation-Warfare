// boss 3 create event

// generic variables
left = -1;
right = 1;
face = left;

start = 0;
stand = 1;
run = 2
jump = 3;
special = 4;

dontMove = true;
heExists = false;
heNotDead = true;
alarmTemp = true;

// specific variables
// boss health
if (instance_exists(objEasy))
	eHealth = 60;  
else if (instance_exists(objHard))
	eHealth = 240;
else
	eHealth = 120;
eHealthInitial = eHealth;

imgAlpha = 1;  // translucence

hSpeed = 0;
vSpeed = 0;

bullets = 3;
flash = false;
glow = false;
glowTicker = 0;

cameraX = camera_get_view_x(view_camera[0]);
cameraY = camera_get_view_y(view_camera[0]);

startTemp = true;
grav = 0.2;
maxFallSpeed = 5;

alarmTime = 80;
alarmTimeInitial = alarmTime;

specialMove = 6;
smStart = specialMove;
smTemp = true;
swDirection = 0;
pLocation = 0;
goBack = false;

imgSpeed = 0.7;
animationSlow = false;
aniCounter = 0;

// starting position
state = start;
x = camera_get_view_x(view_camera[0]) + 226;
y = -32;
vspeed = 0.5;
counter = 0;  // counter for sprite flicker


// create object for boss health
instance_create_layer(x, y, "Controller", objBossHealth);

// create pointer for player
instance_create_layer(x, y, "Player", objPtr);

// stop the conveyer belts
with (objConveyerLeft)
	image_speed = 0;
with (objConveyerRight)
	image_speed = 0;