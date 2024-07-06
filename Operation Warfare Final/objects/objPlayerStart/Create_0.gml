instance_create_layer(x, y, layer, objFade);
if (variable_global_exists("bossCheck")) {  
	// go to boss after game over if you were there before
	if (global.bossCheck) {
	
		if (room == roomStageFinal)
			x = room_width - 256 * 7/2;
		else
			x = room_width - 300;
	}
	else if (global.checkpoint) {
	
		if (room == roomStageFinal)
			x = 4774;
	}
}

t= 40;
alarm[0] = 100 + t
alarm[1] = t;
canSee = false;
visible = false;
fadeAlpha = 1; 
alarm[1] = 10;

i = 0; // "ready player one" flashes on screen
j = 0;

// play the music depending on the stage
audio_stop_all();

// reset the sound gain
audio_sound_gain(sndPractice, 1, 0); // reset the sound
audio_sound_gain(sndStage1, 1, 0); // reset the sound
audio_sound_gain(sndStage2, 1, 0); // reset the sound
audio_sound_gain(sndStage3, 0.875, 0); // reset the sound
audio_sound_gain(sndStageFinal, 0.925, 0); // reset the sound

// find the right song

switch(room) {
	
	case roomPractice:
		audio_sound_loop_start(sndPractice, 1.567);
		audio_play_sound(sndPractice, 1, true);
		break;
	
	case roomStage1:
		audio_sound_loop_start(sndStage1, 32);
		audio_play_sound(sndStage1, 1, true);
		break;
	
	case roomStage2:
		audio_play_sound(sndStage2, 1, true);
		break;
	
	
	case roomStage3:
		audio_play_sound(sndStage3, 1, true);
		break;
	
	
	case roomStageFinal:
		audio_play_sound(sndStageFinal, 1, true);
		break;
		
	case roomStageSpecial: 
		audio_play_sound(sndPause, 1, true);
		break;
	
	default:
		break;
}

