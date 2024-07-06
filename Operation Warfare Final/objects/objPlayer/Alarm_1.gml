/// @description Portal transport image fade out
if (portalTransport == 1) {
	
	imgAlphaPortal -= 0.25;
		alarm[1] = 6;
	
		if imgAlphaPortal <= 0 {
			portalTransport = 2;
			objCamera.portalMove(portalX, portalY);
		}
	
}