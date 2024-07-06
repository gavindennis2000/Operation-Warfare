// create depth layer
layer = layer_create(301, "DWall");

dontMove = true;
alarmTime = 0;
ticker = 0;

inst = 0;

if room == roomStage2 {  // stage 2 code
	if (x == 1120)
		inst = 1;
	else if ( x == 2192) {
		inst = 2;
	};
}