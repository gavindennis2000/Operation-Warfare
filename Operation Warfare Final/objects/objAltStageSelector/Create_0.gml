// create the stage controller if it doesn't already exist; then terminate
if (!instance_exists(objStageController)) and (layer_exists("Controller"))
	instance_create_layer(x, y, "Controller", objStageController);

instance_destroy();