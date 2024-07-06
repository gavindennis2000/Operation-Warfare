/// @description shoot five bullets

shootDir = 180;
if (heExists and heNotDead)
	shootDir = point_direction(x, y, objPlayer.x, objPlayer.y);
	
if (audio_is_playing(sndShockblast)) {audio_stop_sound(sndShockblast)}
audio_play_sound(sndShockblast, 1, false);
instance_create_layer(x, y, "Bullet", objBulletEnemy, {speed: 3.5, direction: other.shootDir + other.shootDis, sprite_index: sprShockblast});
if (shootDis = 30) {
	alarm[2] = 60;
}
	
else {
	shootDis += 15;
	alarm[1] = aTime;
}