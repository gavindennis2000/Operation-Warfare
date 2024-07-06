/// @description begin regular attack

// change the conveyer belts
if (instance_exists(objConveyerRight))
	with (objConveyerRight)
		instance_change(objConveyerLeft, true);
else if (instance_exists(objConveyerLeft))
	with (objConveyerLeft) {
		x -= 16;
		instance_change(objConveyerRight, true);
	}

// flash the screen
flash = true;
alarm[7] = 2;

// check if player is close by
if (heExists and heNotDead)
	if (abs(x - objPlayer.x) <= 90)
		hSpeed = 2.85 * face;
	
// jump and shoot
if (specialMove > 0) {
	specialMove--;
	vSpeed = -7;
	
	if (instance_exists(objHard) and eHealth <= eHealthInitial/3) {
		bullets = 4;
		alarm[2] = 15;
	}
	else {
		bullets = 3;
		alarm[2] = 20;	
	}
}

// special move
else {
	state = special;
	var xCenter = cameraX + 256/2;
	var yCenter = room_height/2-24;
	direction = point_direction(x, y, xCenter, yCenter)
	speed = 4.5;
}