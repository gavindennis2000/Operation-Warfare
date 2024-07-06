////@description fade in text
// show the enemy on the second slide


if (textAlpha < 1) {
		
	textAlpha += 0.25;
	alarm[1] = 10;
	
	if (text == 1) {
		enemyAlpha += 0.25;
	// alarm for explosions
	if (enemyAlpha == 1)
		alarm[5] = 1;
	}

}
else {
	
	if (text == 6)
		alarm[4] = aTime * 1.5;
	else
		alarm[2] = aTime;
	
}