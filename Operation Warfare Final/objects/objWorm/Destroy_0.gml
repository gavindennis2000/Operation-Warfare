/// @description Insert description here
// You can write your code in this editor

if (instance_exists(objEasy))
	exit;

if (variable_instance_exists(self, "eHealth")) {
	if (eHealth <= 0) {
	
		if (audio_is_playing(sndSpreadshot))
			audio_stop_sound(sndSpreadshot);
		audio_play_sound(sndSpreadshot, 1, false);
	
		for (i = 0; i < 360; i+= 45) {
			
			with(instance_create_layer(x, y, "Bullet", objBulletEnemy)) {
				
				if (instance_exists(objHard))
					speed = 4;
				else
					speed = 3;
					
				direction = other.i;
				
			}
		}
	
	}
}





// Inherit the parent event
event_inherited();

