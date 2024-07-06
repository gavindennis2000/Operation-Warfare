/// @description regular attack; jump and shoot

if (bullets > 0) {
	
	bullets--;
	
	// create shock blast
	
	//sfx
	if audio_is_playing(sndShockblast)
		audio_stop_sound(sndShockblast);
	audio_play_sound(sndShockblast, 1, false);
	
	// create the bullet
	with (instance_create_layer(x, y, "Bullet", objShockEnemy)) {
		
		direction = point_direction(x, y, objPtr.x, objPtr.y)
		speed = 6;
		
	}
	
	alarm[2] = 20;  //restart attack
	if (instance_exists(objHard) and eHealth <= eHealth/3)
		alarm[2] = 15;
}

else
	alarm[1] = alarmTime;