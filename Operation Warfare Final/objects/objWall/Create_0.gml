// create depth layer
if (!layer_exists(layer_get_id("Wall")))
	layer = layer_create(301, "Wall");
else
	layer = layer_get_id("Wall");