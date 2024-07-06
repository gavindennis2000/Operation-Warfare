layID = layer_get_id("Player");
if (layer_exists(layID))
	layer = layID; 
else 
	layer = layer_create(-1000, "Player")
	
image_index = 0;
image_speed = 0;

alarm[0] = 240;

x = 0;
y = 0;