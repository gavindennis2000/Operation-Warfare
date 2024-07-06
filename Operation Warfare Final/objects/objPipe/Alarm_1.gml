if (imageAlpha >= 1) {
	
	room_goto(roomStageSelect);
	
}
	
else {
	imageAlpha += 0.25;
	alarm[1] = 10;
}