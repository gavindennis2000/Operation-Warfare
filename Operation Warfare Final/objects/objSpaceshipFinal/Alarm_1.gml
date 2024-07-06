///@description go to the ending scene
if (imageAlpha >= 1) {
	
	if (room == roomStageFinal)
			room_goto(roomEnding);	
}
	
else {
	imageAlpha += 0.25;
	alarm[1] = 10;
}