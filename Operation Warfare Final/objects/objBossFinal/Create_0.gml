// boss 3 create event
layer = layer_create(-10000, "FinalBoss");
audio_sound_gain(sndSpreadshot, 1, 1);

// generic variables
left = -1;
right = 1;
face = left;

start = 0;
stand = 1;
run = 2
jump = 3;
special = 4;
finish = 10;

dontMove = true;
heExists = false;
heNotDead = true;
alarmTemp = true;
tick = 0;

// specific variables
// boss health
if (instance_exists(objEasy))
	eHealth = 124;  
else if (!instance_exists(objHard))
	eHealth = 248;
else
	eHealth = 496;
eHealthInitial = eHealth;

imgAlpha = 1;  // translucence

hSpeed = 0;
vSpeed = 0;

jumps = 4;
fix = false;

cameraX = camera_get_view_x(view_camera[0]);
cameraY = camera_get_view_y(view_camera[0]);

startTemp = true;
grav = 0.3;
canShoot =true;
tempPX = 0;

maxFallSpeed = 5;
imgSpeed = 0.7;
animationSlow = false;
aniCounter = 0;
jumpSet = 1;
initX = x;
initY = y;

sp = 0;

up = false;
moveRight = false;
moveLeft = false;
flutter = 1;
hTime = 0;
changeDir = true;
homing = false;
hCount = 6;
hCountInit = hCount;
fall = 7;
falling = false;

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