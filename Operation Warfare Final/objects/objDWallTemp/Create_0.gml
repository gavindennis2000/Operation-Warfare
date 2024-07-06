// create depth layer
var layID = layer_get_id("DWall");
if (layer_exists(layID))
	layer = layID;
else
	layer = layer_create(301, "DWall");

if room == roomStage2 {
	if (x > 2000) {
		aTime = 110;
		
		if (instance_exists(objEasy))
			aTime += 20;
		else if (instance_exists(objHard))
			aTime -= 20;
			
		alarm[0] = aTime;
		alarm[1] = aTime - 20;
	}
	
	else {
		aTime = 200;
		
		if (instance_exists(objEasy))
			aTime += 20;
		else if (instance_exists(objHard))
			aTime -= 20;
			
		alarm[0] = aTime;
		alarm[1] = aTime - 30;
	}
}

if room == roomPractice {
	aTime = 100;
	
	if (instance_exists(objEasy))
		aTime += 20;
	else if (instance_exists(objHard))
		aTime -= 20;
			
	alarm[0] = aTime;
	alarm[1] = aTime - 30;
}

if room == roomStageFinal {
	
	sprite_index = sprWall4;
	image_speed = 0.5;
	
	aTime = 105;
	
	if (instance_exists(objEasy))
		aTime += 20;
	else if (instance_exists(objHard))
		aTime -= 20;
			
	alarm[0] = aTime;
	alarm[1] = aTime - 30;
}

flicker = 0;
f = 0;

var cameraX = camera_get_view_x(view_camera[0]);

if ((cameraX+300 >= x) and  (cameraX <= x)) and !instance_exists(objPlayerStart) {
	if (audio_is_playing(sndDWall))
		audio_stop_sound(sndDWall);
	audio_play_sound(sndDWall, 1, false);
}


i = 0;  // counter for image_alpha
image_alpha = 0.2;