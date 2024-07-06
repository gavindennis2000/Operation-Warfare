// general variables

// starting health
switch(room) {
	
	default:
		eHealth = 3;
		break;
}

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