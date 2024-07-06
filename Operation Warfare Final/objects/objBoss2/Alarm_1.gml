///@description flame attack

if (!place_meeting(x, y+1, objWall)) {
	alarm[1] = 5;
	exit;
}

state = stand;

// set direction
if heExists {
	if objPlayer.x > x
		face = right;
	else
		face = left;
}

with (instance_create_layer(x, y, "Bullet", objFlame)) {
	x += other.face*12;
	hSpeed = other.face*5;
	image_xscale = other.face*-1;
}

if (specialMove % 3 == 1) or (instance_exists(objHard) and eHealth <= eHealthInitial/2)
	alarm[3] = 10;

specialMove--;

hSpeed = 0;

// set alarm to start running again
if (specialMove != 0)
	alarm[2] = alarmTime;
else
	alarm[4] = alarmTime;