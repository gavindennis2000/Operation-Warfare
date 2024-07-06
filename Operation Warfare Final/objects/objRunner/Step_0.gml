// calculate movement

var move = 1.5; // default runner speed
if room == roomStageFinal
	move = 2;
	
if (instance_exists(objHard))
	move += 0.5;
	
hSpeed = move * face; // horizontal
vSpeed += grav; // gravity

// check if player exists
event_inherited()

if (vSpeed > maxFallSpeed)
	vSpeed = maxFallSpeed;

// check horizontal collision
if (place_meeting(x+hSpeed, y ,objWall)) {
	
	while (!place_meeting(x+sign(hSpeed), y, objWall)) {
		x += sign(hSpeed); }
	hSpeed = 0;
	
	
	if (vSpeed == 0) and (!dontMove) {  // change direction if on the ground
		if (face == left)
			face = right;
		else
			face = left;
	}
}

// check vertical collision
if (place_meeting(x, y+vSpeed ,objWall)) {
	while (!place_meeting(x, y+sign(vSpeed), objWall)) {
		y += sign(vSpeed); }
	vSpeed = 0; }

// don't walk if in the air
if (!airMove)
	hSpeed = 0;
	
// move the enemy
x += hSpeed;
y += vSpeed;

//image animation
if (place_meeting(x, y+1 ,objWall)) {
	image_speed = 0.6;
	if (!airMove)
		airMove = true; }
else
	image_speed = 0;

// jump if player jumps or shoots
if (heExists) and (heNotDead) {
	if (objPlayer.keyJump or objPlayer.keyShoot) and (objPlayer.startTemp) {
		if (alarm_get(1) == -1) and (vSpeed == 0) and (place_meeting(x,y+1, objWall))
			alarm[1] = 5;
	}
}