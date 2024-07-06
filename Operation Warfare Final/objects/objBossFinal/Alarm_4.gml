/// @description special attack homing 

if (hCount == 0) {
		
	state = fall;
	hCount = hCountInit;
	
	vspeed = 0;
	hspeed = 0;
	
		
	exit;
		
}
		
flutter = 0;
homing = true; 
tempPX = objPtr.x; 
tempPY = room_height-64;
direction = point_direction(x, y, tempPX, tempPY); 

initX = x;
initY = y;