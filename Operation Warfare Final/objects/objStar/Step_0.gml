ticker++;
if (ticker% 12 == 0) {
	
	if !slow	
		speed += 0.1;
	else
		speed -= 0.1;
}
	
if (speed > maxSpeed) {
	
	if room == roomPowerUp
		speed = maxSpeed;
		
	else {
		speed = maxSpeed
		slow = true;
	}
}
	
if (speed < minSpeed) {
	speed = minSpeed;
	slow = false;
}

	
if room == roomPowerUp
	exit;
	
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

while x < camX
	x += 256;
if y > room_height
	y = 0;
	
