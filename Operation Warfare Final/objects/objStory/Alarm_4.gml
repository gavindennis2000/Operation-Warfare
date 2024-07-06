///@description fade out both
if (screenAlpha > 0 or textAlpha > 0) {
	
	screenAlpha -= 0.25; 
	textAlpha -= 0.25;
	enemyAlpha -= 0.25;
	
	alarm[4] = 10;
	
}
else {
	audio_sound_gain(sndStory, 0, 2000);
	audio_sound_gain(sndFinalBoom, 1, 0);
	alarm[6] = 120;
}