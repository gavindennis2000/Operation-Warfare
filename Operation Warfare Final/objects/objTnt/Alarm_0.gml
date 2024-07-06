switch(i) {
	
	case 0:
		instance_create_layer(x, y, layer, objExplosion);
		break;
		
	case 1:
		instance_create_layer(x+16, y+16, layer, objExplosion);
		break;	
		
	case 2:
		instance_create_layer(x+16, y, layer, objExplosion);
		break;
		
	case 3:
		instance_create_layer(x, y+16, layer, objExplosion);
		break;
		
	case 4:
		instance_destroy();
		break;

}
if (audio_is_playing(sndFinalBoom))
	audio_stop_sound(sndFinalBoom);
audio_sound_gain(sndFinalBoom, 0.7, 0);
audio_play_sound(sndFinalBoom, 1, false);
i++;
alarm[0] = 10;