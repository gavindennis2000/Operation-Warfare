// Inherit the parent event
event_inherited();

// boss defeat
if (instance_exists(objStageController))
	objStageController.bossDefeat = true;