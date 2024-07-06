///@description special move initiate

var roomX = camera_get_view_x(view_camera[0])+128;  // width of room's current camera view

hSpeed = 0;
vSpeed = 0;
speed = 0;
state = special;

if (x > roomX)
	face = left;
else
	face = right;
	
direction = point_direction(x, y, roomX, 40);
speed = 5.5;