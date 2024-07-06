i++;
drawX--;
	
if (i >= 600) and (!instance_exists(objPipe)) {
	
	instance_create_layer(x, y, "Wall", objPipe);
	
}