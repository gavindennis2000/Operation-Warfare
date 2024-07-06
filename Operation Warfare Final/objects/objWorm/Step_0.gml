
if (instance_exists(objEasy))
	instance_destroy();
	
// Inherit the parent event
event_inherited();

if (dontMove)
	exit;
	

if (place_meeting(x + face, y, objWall)) or (!place_meeting(x + face, y+1, objWall)) {
	face = -face;
}

inc++;
if (inc % 3 == 0)
	x += face;