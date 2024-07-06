global.checkpoint = false;
if (room == roomTest or room == roomEnding)  // destroy this controller if in the wrong room
	instance_destroy();

stage1 = roomStage1;
stage2 = roomStage2;
stage3 = roomStage3;
finalStage = roomStageFinal;

roomVar = stage1;
roomVarPlus = stage2;

global.bossCheck = false;
global.checkpoint = false;

bossReadySave = true;


if !variable_global_exists("playerHealth") { // for testing and to catch a potential error
	global.playerHealth = 6;
} 

function goToSpecial() {
	
	alarm[5] = 60;
	
	if (audio_is_playing(sndHealthUp))
		audio_stop_sound(sndHealthUp);
	audio_play_sound(sndHealthUp, 1, false);
	
	with (objPlayer)
		instance_change(objPlayerVictory, true);
}
special = false;