// general variables
if (room == roomStage1 && !instance_exists(objHard))
	eHealth = 1;
else 
	eHealth = 2;

healthScale = (100 / eHealth);
heExists = instance_exists(objPlayer);
dontShoot = true
dontMove = dontShoot;

// players coordinates
playerX = 0;
playerY = 0;
alarmCheck = true;
shootCheck = true;
firstShot = true;
aTime = 30;

// number of bullets
bullets = 2;
	
// move the player to the floor
while (!place_meeting(x, y+1, objWall))
	y++;