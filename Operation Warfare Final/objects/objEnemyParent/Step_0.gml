heExists = instance_exists(objPlayer);
heNotDead = (!instance_exists(objPlayerDeath));

var cameraX = camera_get_view_x(view_camera[0]);
var cameraY = camera_get_view_y(view_camera[0]);

if (cameraX+16 < x-256) or (dontMove) {
	vSpeed = 0;
	hSpeed = 0;
	hspeed = 0;
	vspeed = 0; }
		
if (cameraX+16 >= x-256) and !instance_exists(objPlayerStart)
	dontMove = false;