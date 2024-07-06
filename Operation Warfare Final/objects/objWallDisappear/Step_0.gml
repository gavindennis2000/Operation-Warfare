// make the wall disappear if player is walking on it
if (place_meeting(x, y-1, objPlayer)) and (!place_meeting(x, y-1, objPlayerDeath)) and (alarmTemp) {
	alarmTemp = false;
	alarm[0] = 20; }