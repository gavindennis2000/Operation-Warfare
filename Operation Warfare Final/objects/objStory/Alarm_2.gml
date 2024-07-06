////@description fade out text
// change text if there's more to be read
if (text == 1 or text == 3 or text == 5) {
	
	alarm[3] = 1;
	
}

else if (textAlpha > 0) {
	
	textAlpha -= 0.25;
	alarm[2] = 10;
	
}



else {
	text++; 
	alarm[1] = 10;
}

