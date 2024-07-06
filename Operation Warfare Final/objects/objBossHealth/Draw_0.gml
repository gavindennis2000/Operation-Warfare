// set camera parameters
draw_set_alpha(1);
camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);

b1 = (instance_exists(objBoss1));
b2 = (instance_exists(objBoss2));
b3 = (instance_exists(objBoss3));
bf = (instance_exists(objBossFinal));

// rectangle dimensions
var hx1 = 80;
var hx2 = hx1+1;
var hy1 = 9;
var hy2 = hy1+1;

// draw boss health bar black
if (room == roomStageFinal or room == roomTest) {
	
	hx1 = 4;
	hx2 = 256-hx1;
	
	hy1 = 9+16 + 10 + 16;
	hy2 = hy1+1;
	
	draw_set_color(c_black);
	draw_rectangle(camX+hx1, camY+hy1, camX+ hx2, camY + hy1+4, false);
	
}

else {
	
	draw_set_color(c_black);
	draw_rectangle(camX+hx1, camY+hy1, camX+ hx1 + 82, camY + hy1+4, false);
	
}

// draw the bosses health

if (b1) {  // stage 1 boss health bar
	
	var b1health = objBoss1.eHealth;
	if (instance_exists(objEasy))
		b1health =  objBoss1.eHealth*2
	else if (instance_exists(objHard))
		b1health =  objBoss1.eHealth/2	
		
	draw_set_color(2097320);
	draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + b1health*4), camY+hy2+2, false);
}

else if (b2) {  // stage 2 boss health bar
	var b2health = objBoss2.eHealth;
	if (instance_exists(objEasy))
		b2health =  objBoss2.eHealth*2
	else if (instance_exists(objHard))
		b2health =  objBoss2.eHealth/2	
	
	var healthDraw1 = b2health-40;
	
	if (healthDraw1 > 0) {  // boss 2 has two sets of health; this is the first
		draw_set_color(2097320);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + 80), camY+hy2+2, false);
		
		draw_set_color(14155980);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + healthDraw1*2), camY+hy2+2, false);
	}
	
	else {  // the second
		draw_set_color(2097320);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + b2health*2), camY+hy2+2, false);
	}
	
	
}

else if (b3) {  // stage 3 boss health bar
	
	var b3health = objBoss3.eHealth;
	
	if (instance_exists(objEasy))
		b3health =  objBoss3.eHealth*2
		
	else if (instance_exists(objHard))
		b3health =  objBoss3.eHealth/2	
		
	var healthDraw1 = b3health-80;
	var healthDraw2 = b3health-40;
	
	if (healthDraw1 > 0) {  // boss 3 has three sets of health; this is the first
		draw_set_color(14155980);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + 80), camY+hy2+2, false);
		
		draw_set_color(#e40058);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + healthDraw1*2), camY+hy2+2, false);
	}
	
	else if (healthDraw2 > 0) {  // boss 3 has three sets of health; this is the first
		draw_set_color(2097320);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + 80), camY+hy2+2, false);
		
		draw_set_color(14155980);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + healthDraw2*2), camY+hy2+2, false);
	}
	
	else {  // the second
		draw_set_color(2097320);
		draw_rectangle(camX+hx2, camY+hy2, camX+(hx2 + b3health*2), camY+hy2+2, false);
	}
	
	
}

else if (bf) {  // stage final boss health bar
	
	if objBossFinal.eHealth <= 0 
		exit;
		
	var b4health = objBossFinal.eHealth;
	if (instance_exists(objEasy))
		b4health =  objBossFinal.eHealth*2
	else if (instance_exists(objHard))
		b4health =  objBossFinal.eHealth/2	
	
	if (b4health >= 124) {
		var healthDraw1 = b4health-124;
		
		draw_set_color(#4428bc);
		draw_rectangle(camX+hx1+1, camY+hy2, camX+(hx2)-1, camY+hy2+2, false);
		
		draw_set_color(#00fcfc);
		draw_rectangle(camX+hx1+1, camY+hy2, camX+(hx1 + healthDraw1*2)-1, camY+hy2+2, false);
	}
		
	else {
		draw_set_color(#4428bc);
		draw_rectangle(camX+hx1+1, camY+hy2, camX+(hx1 + b4health*2)-1, camY+hy2+2, false);
	
	}
}
