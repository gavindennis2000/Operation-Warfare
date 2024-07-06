///@description change directions to face player

if (!dontMove and heExists and heNotDead) {
	
	if (objPlayer.x >= x) 
		face = right;
	else 
		face = left;
	
}
alarm[1] = 30;