// flash ready player one sprite

if (!instance_exists(objStageController))
	instance_create_layer(x, y, "Controller", objStageController);
	
instance_change(objPlayerStart,true);