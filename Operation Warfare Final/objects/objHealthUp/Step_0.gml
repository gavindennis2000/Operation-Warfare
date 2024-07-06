if place_meeting(x, y+vspeed, objWall) {
	vspeed = 0;
	grav = 0;
	while !place_meeting(x,y+vspeed,objWall)
		y+=1;
}
else grav = 0.2;

if place_meeting(x, y+1, objWall) {
	vspeed = 0;
	grav = 0;
}
	 
if (vspeed == 0) {
	while (place_meeting(x, y, objWall))
		y -=1;
}

if (place_meeting(x, y+1, objConveyerLeft))
	x--;
	
if (place_meeting(x, y+1, objConveyerRight))
	x++;

if (timeToDie) {
	
	if (flash >= 60) { // start flashing when about to disappear
		if (flash % 3 == 0)
			visible = false;
		else
			visible = true;
	}
	
	else {
		if (flash % 5 == 0)
			visible = false;
		else
			visible = true;
	}
		
	flash++;
	
	if (flash >= 75)
		instance_destroy();
}

if (upsideDown) 
	vspeed -= grav;
	
else
	vspeed += grav;