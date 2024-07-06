

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
if (instance_exists(objSpreadshot))
	eHealth = 80;
else 
	eHealth = 20;
	
	
healthScale = 100 / eHealth;
i = 0;

// jump height
if (instance_exists(objHard))
	jumpHeight = 2;
else 
	jumpHeight = 2.5;
image_speed = 0;

while (!place_meeting(x,y+1,objWall))
	y+=1;
	
image_index = 0;
