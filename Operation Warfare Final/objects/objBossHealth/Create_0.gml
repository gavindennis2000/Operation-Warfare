var layID = layer_get_id("Health");
if layer_exists(layID)
	layer = layID;
else 
	layer = layer_create(0, "Health");

drawHealth = false;
eHealth = 0;

camX = 0
camY = 0;

b1 = false;
b2 = false;
b3 = false;
bf = false;