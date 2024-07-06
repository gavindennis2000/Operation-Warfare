if (!instance_exists(objScore))
	instance_create_layer(x, y, layer, objScore);
	
names = [
	["GAME PROGRAMMER", "GAVIN DENNIS"], 
	["CHARACTER DESIGNER", "GAVIN DENNIS"], 
	["LEVEL DESIGNER", "GAVIN DENNIS"], 
	["MUSIC COMPOSER", "GAVIN DENNIS"], 
	["QUALITY ASSURANCE", "ARI FERRARI"],
	["CREATIVE ASSISTANCE", "BRANDON DENNIS"],
	["PUBLIC PIXEL FONT", "BY GGBOTNET"],
	["INPUT6 EXTENSION", "BY JUJU ADAMS, ALYNNE KEITH"],
	["SPECIAL THANKS", "KARL HARDY"],
	["CHARACTER INSPIRATION", "JAMES SCHRADER"],
	["YOU HAVE UNLOCKED", "HARD MODE!!"],
	["THANKS FOR PLAYING", ""],
	["YOUR SKILLS PAY THE BILLS",""],
]

image_speed = 0;

finished = 0;
create = true;

if image_index == 0
	x = -150;

y = room_height - 32;

hspeed = 1;

dist = 300;

if (image_index == 0) {
	for (i = 1; i <= 10; i++) {
		instance_create_layer(x-(dist*i), y, layer, objCreditsText,  {image_index: i})
	}
}


else if (image_index == 10) {
	
	if (instance_exists(objHard))
		image_index = 12;
		
	else if (instance_exists(objUnlock)) {
		
		image_index = 10;
		with (objUnlock)
			instance_destroy();
	}
	
	else 
		image_index = 11;
	
}