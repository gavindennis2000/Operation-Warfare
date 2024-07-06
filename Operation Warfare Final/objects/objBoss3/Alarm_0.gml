// running for the first time
state = run;
imgAlpha = 1;
image_speed = 0.2;

// start up conveyer belts
with (objConveyerLeft)
	image_speed = 2;
with (objConveyerRight)
	image_speed = 2;

alarm[1] = alarmTime;