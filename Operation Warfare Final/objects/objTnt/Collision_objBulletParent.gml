if (visible == true) {
	
	visible = false;
	alarm[0] = 1;
	
	with (other)
		instance_destroy();
	
}
