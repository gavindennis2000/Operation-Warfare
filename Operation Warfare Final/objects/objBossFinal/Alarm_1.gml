/// @description jump attack

if (jumps > 0) {
	
	state = jump;
	var dp = objPtr.x - x;
	
	if (objPtr.x < x)
		face = left; 
	else 
		face = right;
		
	canShoot = true;
	
	vSpeed = -jumps*2 - 2;
	hSpeed = dp / 80;
	hSpeed *= (1 + 3 / abs(vSpeed))
	
	
	jumps--;
	
}
else
	alarm[2] = 1;