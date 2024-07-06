// stage clear
audio_sound_gain(sndStageComplete, 0.8, 0); // change music volume;

if (room != roomPractice and room != roomStageFinal)
	audio_play_sound(sndStageComplete, 1, false);  // victory fanfare

if room == roomPractice
	alarm[4] = 60;
else
	alarm[4] = 360-40;