i++;
if (i%4 == 0) image_alpha += 0.2;

if (instance_exists(objPlayer)) {
	if (place_meeting(x, y, objPlayer)) and (!place_meeting(x, y, objPlayerDeath)) {
		while (place_meeting(x, y, objPlayer))
			objPlayer.x--;
	}
}

if (flicker == 1) {
	f++;
	if (f%10 == 0)
		visible = false;
	else
		visible = true;
}

if (flicker == 2) {
	f++;
	if (f%5 == 0)
		visible = false;
	else
		visible = true;
}