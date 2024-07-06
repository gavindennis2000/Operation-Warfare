// destroy instance if objPlayer isn't in view
if (instance_exists(objPlayer)) {
	if (objPlayer.x > x + 148)
		instance_destroy(); }
else
	instance_destroy();