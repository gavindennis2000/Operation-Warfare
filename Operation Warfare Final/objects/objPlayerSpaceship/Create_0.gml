// destroy all enemies
rapidFire = false;
rfCounter = 0;

global.checkpoint = true;
with (objEnemyParent) {
	if x < other.x +256
		instance_destroy();
}

// fade the music
audio_sound_gain(sndStage1, 0, 3000);
audio_sound_gain(sndStage2, 0, 3000);
audio_sound_gain(sndStage3, 0, 3000);
audio_sound_gain(sndStageFinal, 0, 3000);
/*
// quiet the sound effects 
audio_sound_gain(sndFinalBoom, 0.6, 0);
audio_sound_gain(sndPlayerDeath, 0.6, 0);
audio_sound_gain(sndBossExplosion, 0.4, 0);
audio_sound_gain(sndEnemyHit, 0.6, 0);
audio_sound_gain(sndLaser, 0.4, 0);
audio_sound_gain(sndEnemyExplosion, 0.4, 0);
*/
alarm[4] = 200;
	
hSpeed = 0;
vSpeed = 0;
grav = 0;
image_speed = 0;
image_index = 1;

alarm[0] = 51;
destTemp = true;
hsp = 0;
vsp = 0;
invincible = 0;
direc = 0;

start = 0;
alive = 1;
dead = 2;

state = start;
vspeed = -1;

up = 1;
down = -1;
dir = up;
dirTicker = 0;

ticker = 0;
aCounter = 1;
imgAlpha = 1;

// variables for asteroid creation
aTicker = 0;

function spaceDeath() {
	
	if (global.playerHealth == 1)
		playerDeath();
		
	else {		
		
		audio_play_sound(sndPlayerDeath, 1, false);
		global.playerHealth--;
		invincible = 80;
		alarm[3] = invincible/2;
		
	}
	
}