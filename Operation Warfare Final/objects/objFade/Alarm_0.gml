if (fadeAlpha > 0) {
	
	fadeAlpha -= 0.25; 
	alarm[0] = 3;
	 
}
else {
	layer_destroy(layer);
	draw_set_alpha(0);
	instance_destroy();
}