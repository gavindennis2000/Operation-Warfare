/// @description end special
if (!animationSlow) {
	
	with (objShockwave) {
		changeAlpha = true;
	}
		
	animationSlow = true;
	alarm[4] = 120;
} 

else {

	goBack = true;
	state = jump;
	hSpeed = 0;
	face = left;
	image_yscale = -1;
	grav = - grav;

}