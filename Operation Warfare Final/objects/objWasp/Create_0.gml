/// @description initialize stats
// You can write your code in this editor



eHealth = 5;
dontMove = true;
heExists = true;
image_speed = 0.5;

// position and speed
vspeed = 0;
y = room_height;
start = true;
finish = false;

// fly back and forth
up = -1;
down = 1;
dir = up;

shootDir = 180;
shootDis = -30;

aTime = 20;
if (instance_exists(objHard))
	aTime = 15;