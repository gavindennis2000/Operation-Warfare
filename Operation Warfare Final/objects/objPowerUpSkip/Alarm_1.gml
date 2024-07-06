/// @description skip to the next room
// quiet volume and draw rectangle

if (instance_exists(objPlayerPowerUp)) {
	
	with objPlayerPowerUp 
		dontGo = true;
}
if (rectAlpha >= 1) {
	// go to the next room when the fadeout is complete
	audio_stop_all();
	audio_sound_gain(sndPowerUp, 1, 0);
	room_goto(roomStageSelect);
}


if (rectAlpha == 0)
	audio_sound_gain(sndPowerUp, 0, 900);
	
rectAlpha += 0.2;

alarm[1] = 15;