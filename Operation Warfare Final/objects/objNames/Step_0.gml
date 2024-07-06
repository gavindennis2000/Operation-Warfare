switch(name) {
	
	case 0:
		// boss1
		pIndex = sprBoss1Run;
		break;
		
	case 1:
		// boss 2
		pIndex = sprBoss2Run;
		break;
		
	case 2:
		// boss 3
		pIndex = sprBoss3Credits;
		break;
		
	case 3:
		// boss 4
		pIndex = sprBossFinalRun;
		break;
		
	case 4:
		// player
		pIndex = sprPlayerStandCredits;
		image_xscale = -1;
		break;
}
		


drawText = room_width - drawPlayer

if (go == right) {
	drawPlayer+=2;
}

if (go == left) {
	drawPlayer+=2;
}


if (go == right and drawPlayer >= room_width/2) {
	drawPlayer = room_width/2;
	go = dontMove;
	alarm[0] = 300;
}

if (go == left and drawPlayer >= room_width+120) {
	drawPlayer = -120;
	go = dontMove;
	alarm[0] = 150;
}
