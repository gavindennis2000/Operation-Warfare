if (goDown) 
	vspeed += 0.02;
	
if vspeed > maxFallSpeed 
	vspeed = maxFallSpeed
	
ticker++;
if (ticker % 4 == 0)
	image_alpha = 0.2;
else 
	image_alpha = 1;