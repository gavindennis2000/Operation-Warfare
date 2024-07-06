if room == roomTest
	instance_destroy();

if room == roomStageFinal
	layer = layer_create(501, "BGColor");
else if room == roomStage3
	layer = layer_create(450, "BGColor");
else
	layer = layer_create(401, "BGColor");

alarmTemp = true;
alarmTime = 15;

inc = 0.15;
rectAlpha = 0;