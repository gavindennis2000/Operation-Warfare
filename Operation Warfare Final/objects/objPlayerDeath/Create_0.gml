deathTemp = false;
spreadshot = false;
invincible = true;

xInitial = x;

if (room != roomPractice)
	global.playerHealth -=1;
	
audio_play_sound(sndPlayerDeath, 1, false);


function death() {
	if (
		(y > room_height + 20 and image_yscale == 1) or (y < -20 and image_yscale == -1))
		and (deathTemp == false) {
			
			alarm[0] = 30;
			deathTemp = true; 
			
		} 
}
		
function gameOver() {
	room_goto(roomGameOver); }