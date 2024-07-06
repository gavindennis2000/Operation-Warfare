/// @description  stuff for can skip
canSkip = false;
in = 1;
out = 0;
move = out;
skip = false;
skipAlpha = 0;
count = 0;
sec = 0;
next = false;
rectAlpha = 0;

layer = layer_create(-1001, "check");

var roomVar = objStageController.roomVar;
switch(roomVar) {
	
	case roomStage1:
		objStageController.roomVar = roomStage2;
		instance_create_layer(x, y, "Controller", objSpreadshot);
		break;
	
	case roomStage2:
		objStageController.roomVar = roomStage3;
		instance_create_layer(x, y, "Controller", objDoubleJump);
		break;
	
	case roomStage3:
		objStageController.roomVar = roomStageFinal;
		instance_create_layer(x, y, "Controller", objShockblast);
		break;
}