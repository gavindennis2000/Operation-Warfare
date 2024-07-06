////@description fade out screen
if (screenAlpha > 0) {
	
	screenAlpha -= 0.25;
	textAlpha -= 0.25;
	alarm[3] = 10;
	
	if (enemyAlpha > 0) {
		enemyAlpha -= 0.25;
}
	
}
else {
	
	
	if (screen == 0)
		screen += 2;
	else 
		screen++;
	
	text++
	alarm[0] = aTime/4;
	
}