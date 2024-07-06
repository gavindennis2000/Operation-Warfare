////@description fade in text
if (textAlpha < 1) {
	
	if (instance_exists(objHard) and text == 3)		
		text = 4; 
		
	textAlpha += 0.25;
	alarm[1] = 10;
	
}
else {
	
	if (text > 2)
		alarm[4] = aTime * 1.5;
	else
		alarm[2] = aTime;
	
}