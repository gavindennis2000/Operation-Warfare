if !layer_exists(layer_get_id("MWall"))
	layer = layer_create(1, "MWall");
layer = layer_get_id("MWall");

left = -1;
right = 1;

dist = 16*10

face = right;

if room == roomStageFinal
	hspeed *= 4;
	
hspeed = face;
xInitial = x;
checkSpeed = hspeed;
