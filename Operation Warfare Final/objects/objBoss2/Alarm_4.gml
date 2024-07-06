///@description special attack: hellfire

if (heExists) {
	if objPlayer.x >= x
		face = right;
	else
		face = left;
}

state = special;
image_speed = 0.8;

xTarget = cameraX + 256/2;
yTarget = 40;

direction = point_direction(x, y, xTarget, yTarget)
speed = 4.5;

