x = room_width/2;
y = room_height+50;
alarm[0] = 15;

image_speed = 0;

playAgain = false;
playAgain2 = false;
selection = 0;
sPrev = selection;
next = true;

yes = 1;
no = 0;
cursor = no;

b1 = c_white;
b2 = c_white;
b3 = c_white;
b4 = c_white; 
b5 = c_white;

audio_stop_all();
audio_play_sound(sndGameOver, 1, true);

// assign new lives to the player
global.playerHealth = 6;
if (variable_global_exists("infiniteLives")) {
	if (global.infiniteLives)
		global.playerHealth = 30;
}

// reset the game score
if instance_exists(objScore) {
	objScore.zeroScore();
}