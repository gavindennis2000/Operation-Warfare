//draw_text(room_width/2, room_height/2-40, roomVar );
if (room != roomStageSelect)
	exit;

var text = ["",""];
draw_set_font(font1);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_text(room_width/2, room_height/2-20, alarm_get(0) );

// draw stage number
switch(roomVar) {
	case stage1:
		text = ["Stage One","Cyber Forest"]
		break;
		
	case stage2:
		text = ["Stage Two","magma Crater"]
		break;
		
	case stage3:
		text = ["Stage Three", "Antenna Cradle"]
		break;
		
	case finalStage:
		text = ["Final Stage", "Event Horizon"]
		break;
		
	case roomStageSpecial: 
		text = ["???",""];
	
	default:
		break; 
}


// secret special stage
if (roomVar == roomStageSpecial)
	draw_text(room_width/2, room_height/2, string_upper(text[0]));

else {
	draw_text(room_width/2, room_height/2-8, string_upper(text[0]));
	draw_text(room_width/2, room_height/2+8, string_upper(text[1]));
}

//draw remaining lives
if (variable_global_exists("playerHealth")) {
	draw_set_valign(fa_bottom);
	draw_set_font(font3);
	draw_text(room_width/2, room_height-5, "LIVES REMAINING: " + string(global.playerHealth));
}
