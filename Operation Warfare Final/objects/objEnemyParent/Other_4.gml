var layID = layer_get_id("Player")
if (layer_exists(layID))
	layer = layID;
else 
	layer = layer_create(0, "Player");
	
if (variable_global_exists("bossCheck")) {
	if (global.bossCheck)
		instance_destroy();
}