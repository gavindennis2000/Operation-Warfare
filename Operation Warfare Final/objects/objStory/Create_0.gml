screenAlpha = 0; 
textAlpha = 0;
enemyAlpha = 0;
alarm[0] = 10;
i = 0;

screen = 0;
text = 0;
aTime = 375;

image_speed = 0;
image_index = 0;
nextRoom = false;
explosions = 25;

audio_stop_all();
audio_sound_gain(sndStory, 1, 0);
audio_play_sound(sndStory, 1, false);

if (!instance_exists(objController))	
	instance_create_layer(x, y, "Controller", objController);

canSkip = false;
in = 1; 
out = 0;
move = out;
skip = false;
skipAlpha = 0;

count = 0;
sec = 0;