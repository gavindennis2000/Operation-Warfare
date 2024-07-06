var camX = camera_get_view_x(view_camera[0])+128;
var camY = camera_get_view_y(view_camera[0])+112-40;

if (gamePause) {
	// dim the background
	draw_set_color(c_black);
	draw_set_alpha(.4);
	draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0])+256, camera_get_view_y(view_camera[0])+224, false);
	
	// draw the pause text
	draw_set_alpha(1);
	draw_set_font(font2);
	var c = c_white;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_color(camX, camY, "PAUSE", c, c, c, c, 1);
	//draw_sprite(sprPause, 0, camX, camY);
	
	// draw the 3 selections
	var int = 16;
	if (screen == 1) {
		
		// resume
		draw_text_color(camX, camY + int*2.5, "RESUME", b1, b1, b1, b1, 1);
		//draw_sprite_ext(sprPause, 1, camX, camY + int*2.5, image_xscale, image_yscale, image_angle, b1, 1);
		// retry
		draw_text_color(camX, camY + int*3.5, "RETRY", b2, b2, b2, b2, 1);
		//draw_sprite_ext(sprPause, 2, camX, camY + int*3.5, image_xscale, image_yscale, image_angle, b2, 1);
		// main menu
		draw_text_color(camX, camY + int*4.5, "MAIN MENU", b3, b3, b3, b3, 1);
		//draw_sprite_ext(sprPause, 3, camX, camY + int*4.5, image_xscale, image_yscale, image_angle, b3, 1);
	
	}
	
	else if (screen == 2) {
		
		var i = 25;
		
		// retry
		draw_text_color(camX, camY + int*3.5, "RETRY LEVEL?", c, c, c, c, 1);
		//draw_sprite_ext(sprPause, 2, camX, camY + int*3.5, image_xscale, image_yscale, image_angle, b2, 1);
		
		// no
		draw_text_color(camX - i, camY + int*4.5, "NO", b4, b4, b4, b4, 1);
		//draw_sprite_ext(sprPause, 4, camX - i, camY + int*4.5, image_xscale, image_yscale, image_angle, b4, 1);
	
		// yes
		draw_text_color(camX + i, camY + int*4.5, "YES", b5, b5, b5, b5, 1);
		//draw_sprite_ext(sprPause, 5, camX + i, camY + int*4.5, image_xscale, image_yscale, image_angle, b5, 1);
	
	}
	
	else if (screen == 3) {
		
		var i = 25;
		
		// retry
		draw_text_color(camX, camY + int*3.5, "GO TO THE MAIN MENU?", c, c, c, c, 1);
		//draw_sprite_ext(sprPause, 3, camX, camY + int*3.5, image_xscale, image_yscale, image_angle, b2, 1);
		
		// no
		draw_text_color(camX - i, camY + int*4.5, "NO", b4, b4, b4, b4, 1);
		//draw_sprite_ext(sprPause, 4, camX - i, camY + int*4.5, image_xscale, image_yscale, image_angle, b4, 1);
	
		// yes
		draw_text_color(camX + i, camY + int*4.5, "YES", b5, b5, b5, b5, 1);
		//draw_sprite_ext(sprPause, 5, camX + i, camY + int*4.5, image_xscale, image_yscale, image_angle, b5, 1);
	
	}
	
	// draw the remaining lives and stage name
	if (variable_global_exists("playerHealth") and room != roomPractice) {
		
		// HEALTH
		draw_set_valign(fa_bottom)
		draw_set_font(font3);
		draw_text_color(camX, room_height-5, "LIVES REMAINING: " + string(global.playerHealth), c, c, c, c, 1);
		
		// STAGE NAME
		var stage = "";
		switch (room) {
			
			case roomStage1:
				stage = "CYBER FOREST";
				break;
				
			case roomStage2:
				stage = "MAGMA CRATER";
				break;
				
			case roomStage3:
				stage = "ANTENNA CRADLE";
				break
				
			case roomStageFinal:
				stage = "EVENT HORIZON";
				break;
				
			default:
				stage = "";
				break;
				
		}
		draw_text_color(camX, room_height-15, stage, c, c, c, c, 1);
		
	}
}