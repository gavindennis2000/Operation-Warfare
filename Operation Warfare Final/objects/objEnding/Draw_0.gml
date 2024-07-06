// draw the current screen
draw_sprite_ext(sprEnding, screen, 0, 0, image_xscale, image_yscale, image_angle, image_blend, screenAlpha);

// text formatting
var c = c_white;
draw_set_font(fontStory);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var textX = room_width/2; 
var textY = room_height/2; 

switch(text) {
	
	case 0:
	case 1:
	case 2:
		textY += 30;
		break;
		
	case 3:
		textY -= 35;
	case 4:
		textY += 50;
		break;
		
	default: 
		textY = room_height/2; 
		
}

// draw the text
aLength = array_length(endingText[text])
for (i = 0; i < aLength; i++)
	draw_text_color(textX, textY + i*11, string_upper(endingText[text][i]), c, c, c, c, textAlpha);