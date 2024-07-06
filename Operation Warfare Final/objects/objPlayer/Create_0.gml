devTools = false;
// constants
start = 0;
stand = 1;
run = 2;
	// running variables
	runUp = false; runDown = false;
jump = 3;
crouch = 4;
up = 5;

// check if inside portal on final stage
portalTransport = 0;

left = -1;
right = 1;

// camera variables
cameraX = camera_get_view_x(view_camera[0]);
cameraY = camera_get_view_y(view_camera[0]);

// create camera object
if (!instance_exists(objCamera))
	instance_create_layer(x, y, "Controller", objCamera);

// create camera object
if (!instance_exists(objController))
	instance_create_layer(x, y, "Controller", objController);
	
// create pause object
if (!instance_exists(objPause))
	instance_create_layer(x,y, "Controller", objPause);
	
// create health object
if (!instance_exists(objHealth))
	instance_create_layer(x,y, "Controller", objHealth);
	
// create score object
if (!instance_exists(objScore))
	instance_create_layer(x,y, "Controller", objScore);

// initial states when object is created
state = start; 
face = right;
invincible = true;
invincibleCounter = 120;
alarm[0] = 60; // for startTemp
x = cameraX+16;

rapidFire = false;
rfCounter = 0;

if image_yscale == 1
	y = cameraY+38;
if image_yscale == -1
	y = cameraY+room_height-38;
	
imgAlpha = image_alpha;
imgAlphaPortal = 1;

// variables for controller input
keyLeft = false;
keyRight = false;
keyCrouch = false;
keyUp = false;
keyJump = false;
jumpRelease = false;
keyShoot = false;
keySelect = false;
keyStart = false;

// variables for player movement
hSpeed = 0;
vSpeed = 0;
grav = 0.2;
maxFallSpeed = 5;
if room == roomStageFinal 
	maxFallSpeed = 3;

upsideDown = false;

// variables for power-ups
doubleJumpTemp = false;
if (instance_exists(objDoubleJump))  // double jump
	doubleJump = true;
else
	doubleJump = false;
	

// check if player has unlocked spreadshot powerup	
if (instance_exists(objSpreadshot)) // spreadshot
	spreadshot = true;
else
	spreadshot = false;
	
// check if player has unlocked shockblast powerup	
if (instance_exists(objShockblast)) // spreadshot
	shockblast = true;
else
	shockblast = false;

// variables for invincibility frames during object create
startTemp = false;

// variables for save states
saveBuff = 0;

// function for when player gets hit or falls off cliff
function playerDeath() {
	
	if image_yscale == 1 {
		with (instance_create_layer(x, y, "Player", objPlayerDeath)) {
			vspeed = -5;
			hspeed = -objPlayer.face*2;
			gravity = 0.2;
			image_yscale = 1;
		}
	}
	
	else {
		with (instance_create_layer(x, y, "Player", objPlayerDeath)) {
			vspeed = 5;
			hspeed = -objPlayer.face*2;
			gravity = -0.2;
			image_yscale = -1;
		}
	}
	
	instance_destroy(); 
}

// for portals on final stage
portalX = 0;
portalY = 0;


