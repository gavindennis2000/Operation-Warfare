// boss 2 create event

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
	eHealth = 40;  
else if (instance_exists(objHard))
	eHealth = 160;
else
	eHealth = 80;
	
eHealthInitial = eHealth;
	
imgAlpha = 1;  // translucence

hSpeed = 0;
vSpeed = 0;

cameraX = camera_get_view_x(view_camera[0]);
cameraY = camera_get_view_y(view_camera[0]);

startTemp = true;
grav = 0.2;
maxFallSpeed = 5;

alarmTime = 40;
alarmTimeInitial = alarmTime;
specialMove = 6;
smStart = specialMove;
animationSlow = false;
aniCounter = 0;

makeHellFire = true;
hellFireAgain = 3
alarm5Time = 120;
alarm5TimeInitial = alarm5Time;

// starting position
state = start;
x = camera_get_view_x(view_camera[0]) + 226;
y = -32;
vspeed = 0.5;
counter = 0;  // counter for sprite flicker

// create object for boss health
instance_create_layer(x, y, "Controller", objBossHealth);