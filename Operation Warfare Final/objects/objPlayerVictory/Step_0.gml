if image_alpha != 1
	image_alpha = 1;

// calculate movement
vSpeed += grav; // gravity

// check vertical collision with regular wall
if (place_meeting(x, y+vSpeed ,objWall)) {
	while (!place_meeting(x, y+sign(vSpeed), objWall)) {
		y += sign(vSpeed);
	}
	vSpeed = 0;
}

if (proceed) {
	hSpeed = 2;
	state = run;
	face = right;
}

// movement
x += hSpeed;
y += vSpeed;

// if player is in the air, have the jump animation
if (!place_meeting(x, y+1, objWall)) {
	state = jump; }
else if (!proceed)
	state = stand;