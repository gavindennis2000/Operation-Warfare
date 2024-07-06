// stop the conveyer belts
with (objConveyerLeft)
	image_speed = 0;
with (objConveyerRight)
	image_speed = 0;
	
	
// Inherit the parent event
event_inherited();

