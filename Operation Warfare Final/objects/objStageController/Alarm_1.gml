///@description enter the stage boss

switch(room) {
	
	case roomStage1:  // stage 1 boss
		instance_create_layer(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]),
			"Player", objBoss1);
		break;
				
	case roomStage2:  // stage 2 boss
		instance_create_layer(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]),
			"Player", objBoss2);
		break;
		
	case roomStage3:  // stage 3 boss
		instance_create_layer(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]),
			"Player", objBoss3);
		break;
		
	case roomStageFinal:  // stage Final boss
		instance_create_layer(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]),
			"Player", objBossFinal);
		break;
		
	default:  // default for error prevention
		instance_create_layer(
			camera_get_view_x(view_camera[0]),
			camera_get_view_y(view_camera[0]),
			"Player", objBoss1);
		break;
}

// menacing boss music
audio_stop_all();
audio_sound_loop_start(sndBoss, 5.35);
if (room == roomStageFinal) {
	audio_sound_gain(sndFinalBoss, 1.3, 0);
	audio_play_sound(sndFinalBoss, 1, true);
}

else {
	audio_sound_gain(sndBoss, 1.3, 0);
	audio_play_sound(sndBoss, 1, true);
	}