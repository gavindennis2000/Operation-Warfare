image_alpha -= 0.015;

if image_alpha < 1
	mask_index = -1;
else 
	mask_index = sprite_index;

if image_alpha < 0
	instance_destroy();