// object slowly fades
counter++;
if (counter% 8 == 0)
	imgAlpha -= 0.3;
	
// delete object after it isn't visible
if (imgAlpha <= 0) {
	if (room != roomStageFinal)
		with (objFlash) {
			instance_destroy();
		}
	instance_destroy();
}

