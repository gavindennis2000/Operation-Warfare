if (room == roomStage2) {
	if (instance_exists(objEasy)) {
		// ez mode platforms
		if (inst == 1) {
			instance_create_layer(x, y, layer, objPlatform);
			instance_create_layer(x+96*3+16, y-65, layer, objPlatform);
				
			instance_create_layer(x+96, y, layer, objPlatform);
			instance_create_layer(x+96*4, y-65, layer, objPlatform);
				
			instance_create_layer(x+96*2, y, layer, objPlatform);
			instance_create_layer(x+96*5, y, layer, objPlatform);
				
			instance_create_layer(x+96*3, y, layer, objPlatform);
			instance_create_layer(x+96*5, y-65, layer, objPlatform);
		}		
		else if (inst == 2) {
			instance_create_layer(x, y-16*0, layer, objPlatform);
			instance_create_layer(x+108*4, y-16*4, layer, objPlatform);
				
			instance_create_layer(x+108*1, y-16*1, layer, objPlatform);
			instance_create_layer(x+108*5, y-16*5, layer, objPlatform);
				
			instance_create_layer(x+108*2, y-16*2, layer, objPlatform);
			instance_create_layer(x+108*6, y-16*0, layer, objPlatform);
				
			instance_create_layer(x+108*3, y-16*3, layer, objPlatform);
			instance_create_layer(x+108*7, y-16*1, layer, objPlatform);
		}
		exit;
	}
	
	else if (inst == 1) {
		
		switch (ticker) {
	
			case 0:
				instance_create_layer(x, y, layer, objDWallTemp);
				instance_create_layer(x+96*3+16, y-65, layer, objDWallTemp);
				break;
		
			case 1:
				instance_create_layer(x+96, y, layer, objDWallTemp);
				instance_create_layer(x+96*4, y-65, layer, objDWallTemp);
				break;
		
			case 2:
				instance_create_layer(x+96*2, y, layer, objDWallTemp);
				instance_create_layer(x+96*5, y, layer, objDWallTemp);
				break;
		
			case 3:
				instance_create_layer(x+96*3, y, layer, objDWallTemp);
				instance_create_layer(x+96*5, y-65, layer, objDWallTemp);
				break;
		
			default:
				instance_create_layer(x, y, layer, objDWallTemp);
				instance_create_layer(x+96*3+16, y-65, layer, objDWallTemp);
				ticker = 0;
				break;
		}
	}

	else if (inst == 2) {
	
		switch (ticker) {
	
			case 0:
				instance_create_layer(x, y-16*0, layer, objDWallTemp);
				instance_create_layer(x+108*4, y-16*4, layer, objDWallTemp);
				break;
			
			case 1:
				instance_create_layer(x+108*1, y-16*1, layer, objDWallTemp);
				instance_create_layer(x+108*5, y-16*5, layer, objDWallTemp);
				break;
			
			case 2:
				instance_create_layer(x+108*2, y-16*2, layer, objDWallTemp);
				instance_create_layer(x+108*6, y-16*0, layer, objDWallTemp);
				break;
			
			case 3:
				instance_create_layer(x+108*3, y-16*3, layer, objDWallTemp);
				instance_create_layer(x+108*7, y-16*1, layer, objDWallTemp);
				ticker = -1;
				break;
			
		}
	}
}

else if (room == roomPractice) {
	switch (ticker) {
	
		case 0:
			instance_create_layer(x, y, layer, objDWallTemp);
			break;
		
		case 1:
			instance_create_layer(x+32, y-48, layer, objDWallTemp);
			ticker = -1;
			break;
	}
}

else if (room == roomStageFinal) {
	if (instance_exists(objEasy)) {
		
		instance_create_layer(x, y, layer, objPlatform);
		instance_create_layer(x + 16 * 20, y + 16, layer, objPlatform);
		instance_create_layer(x + 16 * 40, y + 32, layer, objPlatform);
			
		instance_create_layer(x + 16 * 5, y, layer, objPlatform);
		instance_create_layer(x + 16 * 25, y + 16, layer, objPlatform);
		instance_create_layer(x + 16 * 45, y + 48, layer, objPlatform);
			
		instance_create_layer(x + 16 * 10, y, layer, objPlatform);
		instance_create_layer(x + 16 * 30, y + 16, layer, objPlatform);
		instance_create_layer(x + 16 * 50, y + 64, layer, objPlatform);
			
		instance_create_layer(x + 16 * 10, y + 16 * 7, layer, objPlatform);
		instance_create_layer(x + 16 * 35, y + 16, layer, objPlatform);
		instance_create_layer(x + 16 * 55, y + 80, layer, objPlatform);		
		
		exit;
	}
	else {
		switch (ticker) {
	
			case 0:
				instance_create_layer(x, y, layer, objDWallTemp);
				instance_create_layer(x + 16 * 20, y + 16, layer, objDWallTemp);
				instance_create_layer(x + 16 * 40, y + 32, layer, objDWallTemp);
				break;
			
			case 1:
				instance_create_layer(x + 16 * 5, y, layer, objDWallTemp);
				instance_create_layer(x + 16 * 25, y + 16, layer, objDWallTemp);
				instance_create_layer(x + 16 * 45, y + 48, layer, objDWallTemp);
				break;
			
			case 2:
				instance_create_layer(x + 16 * 10, y, layer, objDWallTemp);
				instance_create_layer(x + 16 * 30, y + 16, layer, objDWallTemp);
				instance_create_layer(x + 16 * 50, y + 64, layer, objDWallTemp);
				break;
		
			case 3:
				instance_create_layer(x + 16 * 10, y + 16 * 7, layer, objDWallTemp);
				instance_create_layer(x + 16 * 35, y + 16, layer, objDWallTemp);
				instance_create_layer(x + 16 * 55, y + 80, layer, objDWallTemp);
				break;
			
			case 4:
				ticker = -1;
				break;
		}
	}
}


alarm[0]= alarmTime;
ticker++;