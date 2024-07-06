///@description fade out both
if (screenAlpha > 0 and textAlpha > 0) {
	
	screenAlpha -= 0.25; 
	textAlpha -= 0.25;
	
	alarm[4] = 10;
	
}
else {
	audio_stop_all();
	room_goto(roomCredits);
}