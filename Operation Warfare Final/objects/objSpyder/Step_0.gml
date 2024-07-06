
// calculate movement
var move = 1.5; // default spyder speed
if (room == roomStageFinal)  // final stage spyder speed
	move = 1.75;
	
if (instance_exists(objHard))
	move += 0.25;
	
hSpeed = move * facing; // horizontal
vSpeed += grav; // gravity

// check if enemy is in view
event_inherited()
if (dontMove) {
	while (!place_meeting(x,y+1,objWall))
		y+=1; }
	
if (heExists)  {
	if (objPlayer.x > x) and (place_meeting(x, y+1, objWall))
		facing = right;
	else if (objPlayer.x <= x) and (place_meeting(x, y+1, objWall))
		facing = left; }


if (vSpeed > maxFallSpeed)
	vSpeed = maxFallSpeed;

// check horizontal collision
if (place_meeting(x+hSpeed, y ,objWall)) {
	while (!place_meeting(x+sign(hSpeed), y, objWall)) {
		x += sign(hSpeed); }
	hSpeed = 0; }

// check vertical collision
if (place_meeting(x, y+vSpeed ,objWall)) {
	while (!place_meeting(x, y+sign(vSpeed), objWall)) {
		y += sign(vSpeed); }
	vSpeed = 0;
	hSpeed = 0; }

// move the enemy
x += hSpeed;
y += vSpeed;


// jump when you're on the ground
if (place_meeting(x, y+1 ,objWall)) and (vSpeed == 0) {
	vSpeed = -jumpHeight;
	jumpHeight++;
	i = 0;
	if (jumpHeight == 5)
		jumpHeight = 2;
}
	
// image animation
i++;
if (vSpeed >= 0) or (dontMove) {
	image_index = 0;
	image_speed = 0;
}
else if i < 8
	image_index = 1;
else 
	image_index = 2;