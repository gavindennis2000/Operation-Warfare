y = room_height+8;

vspeed = -2;

image_speed = 0;
image_index = 3;

left = -1;
right = 1;
dir = right;

up = -0.05;
down = 0.05;
move = up;

alarm[1] = 4;  // go down
alarm[0] = 1;  // create new

if (!audio_is_playing(sndFire))
		audio_play_sound(sndFire, 1, false);