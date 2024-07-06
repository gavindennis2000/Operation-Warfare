image_speed = 0;
image_index = 0;
image_alpha = 0.9;
ticker = 0;
maxFallSpeed = 7;

vspeed = 0;
hspeed = 1;
alarm[0] = 15;
alarm[1] = 200;

goDown = false;

audio_sound_gain(sndStage1, 1, 0); // reset the sound
audio_sound_gain(sndStage2, 1, 0); // reset the sound
audio_sound_gain(sndStage3, 0.875, 0); // reset the sound
audio_sound_gain(sndStageFinal, 0.925, 0); // reset the sound

// reset the sound effects
audio_sound_gain(sndFinalBoom, 1, 0);
audio_sound_gain(sndPlayerDeath, 1, 0);
audio_sound_gain(sndBossExplosion, 0.64, 0);
audio_sound_gain(sndEnemyHit, 1, 0);
audio_sound_gain(sndLaser, 0.7, 0);
audio_sound_gain(sndEnemyExplosion, 1, 0);

alarm[2] = 90;
audio_sound_gain(sndMeteorShower, 0, 1500);
