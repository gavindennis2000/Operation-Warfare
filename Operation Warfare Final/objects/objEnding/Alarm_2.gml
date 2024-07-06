////@description fade out text
if (textAlpha > 0) {
	
	textAlpha -= 0.25;
	alarm[2] = 10;
	
}

// change text if there's more to be read
else if (text < 2) {
	text++; 
	alarm[1] = 10;
}

else {
	
	alarm[3] = 10;
	
}