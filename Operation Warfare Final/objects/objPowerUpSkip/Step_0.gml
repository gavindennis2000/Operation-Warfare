/// @description press start to skip 



if (canSkip) {
	
	i++;
	if (move == in) {
		if (skipAlpha < in) {
			if (i % 5 == 0)
				skipAlpha += 0.2;
		}
		else 
			move = out; 
	}
	
	else if (move == out) {
		if (skipAlpha > out) {
			if (i % 5 == 0)
				skipAlpha -= 0.2 ;
		}
		else 
			move = in; 
	}
	
	
	if (input_check_pressed("start")) {
		if (canSkip and !skip) {
	
		skip = true; 
		canSkip = false;
		/*
		// stop all the alarms
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[3] = -1;
		alarm[4] = -1;
		alarm[5] = -1;
		alarm[7] = -1;
	*/
		// fade out the screen and text and go to next room
		alarm[1] = 1;
		next = true;
	
		}
	}
			
}


else if (objController.keyAny and alarm_get(8) == -1) {
	if (!canSkip and !skip) {
	
		alarm[8] = 5;
		alarm[7] = 155;
	
	}
}

count++; 
if (count % 60 == 0) 
	sec++;