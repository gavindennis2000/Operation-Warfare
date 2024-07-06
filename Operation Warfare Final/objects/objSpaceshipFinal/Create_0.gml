image_speed = 0;
image_index = 0;
up = true
down = false;
vspeed = 0;
hspeed = 1;

fadeOut = false;
aTime = 16;
aTime2 = 8;
imgAlpha = 1;
imageAlpha = 0;
index = 0;

alarm[2] = aTime;
alarm[3] = aTime2;
alarm[4] = aTime2 * 1.5;

initX = camera_get_view_x(view_camera[0]);
audio_sound_gain(sndFinalBoom, 1, 0)
audio_play_sound(sndFinalBoom, 1, true);

y = room_height * 2 /3