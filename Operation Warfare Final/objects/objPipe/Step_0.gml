if (y <= room_height - sprite_height) {
	vspeed = 0;
	y = room_height - sprite_height;
	ready = true;
}

var downPress = input_check("down");
	

if (instance_exists(objPlayer))
	var dist = abs(objPlayer.x - x);
	
if (downPress and ready and place_meeting(x, y-1, objPlayer) and dist <= 7 and !instance_exists(objPlayerVictory)) {
	
	
	layer = layer_create(-10000, "Pipe");
	
	with (objPlayer) {
		instance_change(objPlayerVictory, true);
		x = other.x;
		vspeed = 1;
	}
	
	audio_stop_all();
	audio_play_sound(sndPipeWarp, 1, false);
	alarm[0] = 30;
	
}
