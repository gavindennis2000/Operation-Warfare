// draw the text on screen
draw_set_font(font2);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center)

var text = ["",""];
switch(image_index) {
	
	case 0:
		text = ["you have unlocked","the spreadshot!!"];
		break;
		
	case 1:
		text = ["you have unlocked","the double jump!!"];
		break;
		
	case 2:
		text = ["you have unlocked","the shockblast!!"];
		break;
	
}
var i = 8;
draw_text(x, y - 6, string_upper(text[0]));
draw_text(x, y + 6, string_upper(text[1]));