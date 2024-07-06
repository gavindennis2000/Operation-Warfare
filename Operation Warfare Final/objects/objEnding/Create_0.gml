screenAlpha = 0; 
textAlpha = 0;
alarm[0] = 10;
endingText = [
	["after a hard fought battle,","our hero has finally","defeated the evil cyborgs."], 
	["narrowly escaping, he has","returned home to once again","enjoy the wonders of","cigars and coffee."],
	["although the planet is","finally safe from","corrupt a.i. a new challenge","lays threat to humanity...","record high interest rates."],
	["will our hero survive the","perils of economic collapse?","play hard mode to find out!!"],
	["corporate greed is no match","for our hero who has","received a bonus for","completing hard mode!!"]
];

screen = 0;
text = 0;
aTime = 390;

image_speed = 0;
image_index = 0;
nextRoom = false;

audio_stop_all();
audio_play_sound(sndEnding, 1, false);

// unlock hard mode
if (!file_exists("hard.txt")) {
	
	var _file = file_text_open_write("hard.txt");
	file_text_write_string(_file, "You have unlocked hard mode");
	file_text_close(_file);
	
	instance_create_layer(x, y, layer, objUnlock);
}