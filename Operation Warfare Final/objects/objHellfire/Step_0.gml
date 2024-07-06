vspeed += move;

if (y > room_height and vspeed > 1) {  // destroy when the fire goes off screen
	instance_destroy()
}