/// @description create asteroids

var camX = camera_get_view_x(view_camera[0]);
var asteroid = objAsteroid;

if (instance_exists(objHard) and (aCounter % 3 == 0))
	asteroid = objAsteroidLarge;
else 
	asteroid = objAsteroid;
	
instance_create_layer(camX+256, aTicker, "Bullet", asteroid);

aTicker += 90;
aCounter++;

if (aTicker > room_height)
	aTicker -= room_height;

if (x < 6150)
	alarm[1] = 60;