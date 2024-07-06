camX = camera_get_view_x(view_camera[0]);
if (x <= camX+256 and canCreate and !instance_exists(objFireball)) {
	
	canCreate = false
	instance_create_layer(x, y, "Player", objFireball);
	
}