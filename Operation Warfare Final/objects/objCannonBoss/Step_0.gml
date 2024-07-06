var cameraX = camera_get_view_x(view_camera[0]);
var cameraY = camera_get_view_y(view_camera[0]);

if (cameraX+16 >= x-256) and !instance_exists(objPlayerStart)
	dontShoot = false;
else
	dontShoot = true;
	
dontMove = dontShoot; // this will be used for the draw event
	
// get coordinates for player for arm cannon
if (alarmCheck == true) {
	alarm[1] = 10;
	alarmCheck = false; }
	
if (!dontShoot) and (shootCheck) {
	shootCheck = false;
	if (firstShot) {
		alarm[2] = 30;
		firstShot = false
	}
	else
		alarm[2] = 120; }