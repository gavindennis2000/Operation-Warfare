/// @description attack
if (alarm_get(3) <= 0) {
	if fireXscale > 0 {
		if (!audio_is_playing(sndShockwave))
			audio_play_sound(sndShockwave, 1, false);
		
		if (instance_exists(objHard))
			alarm[3] = 135;
		else
			alarm[3] = 150;
	}
	else  {
		if (instance_exists(objHard))
			alarm[3] = 85;
		else
			alarm[3] = 100;
	}
}

attack = true;

hspeed = 0;
vspeed = 0;


if (heExists and heNotDead) {
	
	pX = objPlayer.x; 
	pY = objPlayer.y;
	
}

if (fireXscale > 0) {
	
	fireXscale -= 0.05
	fireYscale -= 0.05;
	
	alarm[2] = 3;
	
}

else {
	
	var pDir = point_direction(x, y, pX, pY);
	var spd = 2.5;
	if (instance_exists(objHard))
		spd += 0.5;
	if (pX < x) 
		face = left;
	else 
		face = right;
		
	with instance_create_layer(x, y, "Bullet", objFireballBall, {speed: spd, direction: pDir}) {
		parent = instance_id_get(other);	
	}
	if (!audio_is_playing(sndFireball))
		audio_play_sound(sndFireball, 1, false);
		audio_stop_sound(sndShockwave);
		
	alarm[2] = 2;
}
