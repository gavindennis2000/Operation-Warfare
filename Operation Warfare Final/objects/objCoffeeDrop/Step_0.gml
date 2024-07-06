var camX = camera_get_view_x(view_camera[0]);
if (camX >= x - 240 and drop) {
	
	drop = false; 
	instance_create_layer(x, 0, "Player", objCoffee);
	instance_destroy();
}