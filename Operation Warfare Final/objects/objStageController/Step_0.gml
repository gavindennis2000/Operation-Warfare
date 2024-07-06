
if (room == roomStageSpecial)
	exit;
	
// check if practice stage
if (room == roomPractice) {
	if (bossDefeat and !bossDefeatTemp) {
		bossDefeatTemp = true;
	
		audio_stop_all();  // stop all the music
		audio_sound_gain(sndBossExplosion, 1.0, 0);
		audio_play_sound(sndBossExplosion, 1, false); // boss death sound fx

		// change player into victory formation so he cant move or shoot (or die)
		if (instance_exists(objPlayer)) {
			with (objPlayer) {
				instance_change(objPlayerVictory, true);
			}
		}

		alarm[3] = 1;  // prepare victory fanfare
	}
	exit;
}

// check if stage is ready for the boss
if (!bossReady) {
	if (instance_exists(objPlayer) and !instance_exists(objPlayerDeath)	and !instance_exists(objPlayerStart)) {
		if (camera_get_view_x(view_camera[0]) == room_width - 256) or 
			(room == roomStageFinal and objCamera.finalReady) {
			bossReady = true;
			global.bossCheck = true;
			
			
			// save the game data
			if (bossReadySave) {
				saveGame();
				bossReadySave = false; 
			}
			
		}
	}
}

// if the stage is ready for the boss, do these things
else if (!bossReadyTemp) {
	bossReadyTemp = true;
	// fade the music
	audio_sound_gain(sndStage1, 0, 3000);
	audio_sound_gain(sndStage2, 0, 3000);
	audio_sound_gain(sndStage3, 0, 3000);
	audio_sound_gain(sndStageFinal, 0, 3000);
	alarm[1] = 200;
}

// if the boss is defeated:
if (bossDefeat and !bossDefeatTemp) {
	bossDefeatTemp = true;
	
	// boss clear
	if (room != roomStageFinal)	{
		audio_stop_all();  // stop all the music
		audio_sound_gain(sndBossExplosion, 1.0, 0);
	}
	
	else 
		audio_sound_gain(sndBossExplosion, 0.5, 0);
	audio_play_sound(sndBossExplosion, 1, false); // boss death sound fx

	// change player into victory formation so he cant move or shoot (or die)
	if (instance_exists(objPlayer) and !instance_exists(objPlayerDeath) and (global.playerHealth > 0 or global.playerHealth == -1)) {
		
		with (objPlayer) {
			
			instance_change(objPlayerVictory, true);
			
		}
		alarm[3] = 200;  // prepare victory fanfare

	}
	
	
}