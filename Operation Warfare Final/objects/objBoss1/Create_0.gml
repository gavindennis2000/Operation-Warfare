// Boss 1 Create event

// generic variables
left = -1;
right = 1;
face = left;

start = 0;
stand = 1;
jump = 2;
special = 3;

dontMove = true;
heExists = false;
heNotDead = true;

// specific variables
// boss health

eHealth = 20; 
if (instance_exists(objEasy))
	eHealth = 10; 
	
else if (instance_exists(objHard))
	eHealth = 40; 
	
eHealthInitial = eHealth;
	
imgAlpha = 1;  // translucence

hSpeed = 0;
vSpeed = 0;

jHeight = 3.5;  // jump height
jHeightOriginal = jHeight;
jHeightMax = jHeight + 2.5;

startTemp = true;
grav = 0.2  // gravity
maxFallSpeed = 5;  // terminal velocity
canJump = true;  // lets boss jump after he lands

specialMove = 10  // counter for special attack
smStart = specialMove;  // used to reset specialMove counter
smCounter = 0;  // counter for special attack bullets

// animation speed for special attack
animationSlow = false;  // slows down special attack animation
aniCounter = 0;
image_speed = 0.7;

// starting position
state = start;
x = camera_get_view_x(view_camera[0]) + 226;
y = -32;
vspeed = 0.5;
counter = 0;

// create object for boss health
instance_create_layer(x, y, "Controller", objBossHealth);

// pointer for homing attack
instance_create_layer(camera_get_view_x(view_camera[0])+(256/2), room_height/2, layer, objPtr);