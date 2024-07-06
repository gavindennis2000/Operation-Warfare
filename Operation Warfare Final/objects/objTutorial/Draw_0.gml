var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

if image_index >= 4 and image_index != 5
	camY =  camera_get_view_y(view_camera[0])+ 224-48;

// draw hub
draw_set_alpha(0.55);
draw_set_color(c_black);
draw_rectangle(camX, camY, camX+256, camY+ 48, false);

// draw text
draw_set_font(font2);
draw_set_color(c_white);
draw_set_valign(fa_middle)
draw_set_halign(fa_center);
draw_set_alpha(0.9);

camX = camera_get_view_x(view_camera[0])+256/2;
camY += 24
var text = ""
switch(image_index) {
	
	case 0:
		text = ["welcome to the","tutorial stage."];
		break; 
	
	case 1:
		text = ["try shooting in all","eight directions."];
		break; 
		
	case 2:
		text = ["watch out for","disappearing walls","and hazards."];
		break; 
		
	case 3:
		text = ["try to find a","pattern with","reappearing walls."];
		break; 
	
	case 4:
		text = ["more challenging","obstacles lie in","stages ahead."];
		break; 
		
	case 5:
		text = ["defeat the final","enemy to progress","to the next stage."];
		break; 
		
	case 6:
		text = ["good luck on your journey!!"];
		break; 
}
var arrSize = array_length(text);
switch(arrSize) {
	
	case 1: 
		draw_text(camX, camY, string_upper(text[0]));
		break;
	
	case 2:
		draw_text(camX, camY-6, string_upper(text[0]));
		draw_text(camX, camY+6, string_upper(text[1]));
		break;
	
	case 3:
		draw_text(camX, camY - 12, string_upper(text[0]));
		draw_text(camX, camY, string_upper(text[1]));
		draw_text(camX, camY + 12, string_upper(text[2]));
		break;

}