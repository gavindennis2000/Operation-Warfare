// position
x = room_width/2;
y = room_height/2 - 40;

// which text to display
image_speed = 0;

if (objStageController.roomVar == objStageController.stage2)
	image_index = 0;
else if (objStageController.roomVar == objStageController.stage3)
	image_index = 1;
else
	image_index = 2;

