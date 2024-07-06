if (instance_exists(objEasy))
	instance_destroy();

else if (instance_exists(objHard)) {
	if (canCreate)
		instance_create_layer(x+256, y, layer, objAsteroidSpawner, {canCreate: false});
}
	
fireAsteroid = true;