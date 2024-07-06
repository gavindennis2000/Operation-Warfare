// general variables

if (room != roomStageFinal && !instance_exists(objHard))
	eHealth = 2;
else 
	eHealth = 3;

healthScale = (100 / eHealth); // eHealth / 100; used for drawing the healthbar
heExists = instance_exists(objPlayer);
dontShoot = true
dontMove = dontShoot;

// players coordinates
playerX = 0;
playerY = 0;
alarmCheck = true;
shootCheck = true;
firstShot = true;

var wall = layer_get_id("Wall")
if (layer_exists(wall))
	layer = wall;