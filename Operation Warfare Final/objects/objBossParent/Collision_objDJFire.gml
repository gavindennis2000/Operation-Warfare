// bullet collision

if (state == start)
	exit;

// reduce health
eHealth -= 1;

// increase the game score
if (instance_exists(objScore))
	objScore.gameScore += 1;

// flash to show that enemy is hit
imgAlpha = 0.2;
alarm[6] = 5;

// sound effect
if (audio_is_playing(sndEnemyHit))
	audio_stop_sound(sndEnemyHit);
audio_play_sound(sndEnemyHit,1,false);

// destroy the bullet
with (other) {
	fHealth--; }