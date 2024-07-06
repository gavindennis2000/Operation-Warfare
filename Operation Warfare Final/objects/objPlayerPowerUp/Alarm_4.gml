// double jump demonstration





if (doubleJump == 4) {
	objStageController.roomVar = objStageController.stage3;
	alarm[2] = 120;
}

else if (doubleJump == 1 or doubleJump == 3) {
	vSpeed = -4;
	state = jump;
	image_speed = 0.5;
	instance_create_layer(x, y, "Controller", objDJFire);
	alarm[4] = 90;
	doubleJump++
	audio_play_sound(sndDoubleJump, 1, false);
}

else if (doubleJump == 0 or doubleJump == 2) {
	state = jump;
	image_speed = 0.4;
	vSpeed = -5;
	grav = 0.2;
	alarm[4] = 30;
	doubleJump++
}