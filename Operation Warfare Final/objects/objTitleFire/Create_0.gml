left = -1;
right = 1;

if (hspeed < 0)
	face = left;
if (hspeed > 0)
	face = right;
	
image_speed = 1.2;

if (audio_is_playing(sndFire))
	audio_stop_sound(sndFire);
audio_play_sound(sndFire, 1, false);