if (x >= room_width/2) and (!continueVar) {
	state = stand;
	hspeed = 0;
	x = room_width/2;
	continueVar = true;
	alarm[0] = 60;
}

if (y > room_height/2+40) {
	vSpeed = 0;
	grav = 0;
	y = room_height/2+40;
	if (hspeed == 0)
		state = stand;
}

vSpeed += grav;
y += vSpeed;

