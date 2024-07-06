// draw the current screen
draw_sprite_ext(sprStory, screen, 0, 0, image_xscale, image_yscale, image_angle, image_blend, screenAlpha);


// draw the enemy
draw_sprite_ext(sprStory, 1, 0, 0, image_xscale, image_yscale, image_angle, image_blend, enemyAlpha*0.8);

// draw the can skip 
var c = c_white;
if (canSkip) {
	
	draw_set_font(font4);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_color(room_width/2, 3, "PUSH START TO SKIP", c, c, c, c, skipAlpha);
	
}

// draw the current text
var storyText = "";
var textX = room_width/2;
var textY = 0;

switch (text) {
	
	case 0:
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		textY = room_height/2;
		storyText = ["IN THE YEAR 3014, THE WORLD","IS A PEACEFUL PLACE THANKS","TO THE POWER OF MODERN","ARTIFICIAL INTELLIGENCE."];
		break; 
		
	case 1: 
		draw_set_valign(fa_middle);
		textY = room_height/2;
		storyText = ["THIS ALL CHANGED WHEN A","POWERFUL CYBORG WAS","MYSTERIOUSLY REPROGRAMMED","TO DESTROY ALL HUMAN LIFE."];
		break; 
		
	case 2: 
		draw_set_valign(fa_top);
		textY = 2;
		storyText = ["IN A STATE OF PANIC, THE","WORLD GOVERNMENT HAS USED","THE LAST OF THEIR RESOURCES","TO CREATE THE ULTIMATE","WARRIOR CYBORG."];
		break; 
		
	case 3: 
		draw_set_valign(fa_top);
		textY = 2;
		storyText = ["IN A TOP SECRET GOVERNMENT","PROJECT NAMED","OPERATION WARFARE,","JAMES SHREDDER WAS CREATED"," USING HIGH END CYBERNETICS","AND THE DNA OF THE","WORLD'S GREATEST SOLDIERS."];
		break; 
		
	case 4: 
		draw_set_valign(fa_bottom);
		textY = room_height - 2;
		storyText = ["ARMED WITH THE STRENGTH OF","TEN GORILLAS, THE","INTELLIGENCE OF EINSTEIN,","AND ENOUGH CAFFEINE TO MAKE","AN OLYMPIC SWIM TEAM FAIL","A DRUG TEST, OUR HERO IS","THE ONLY HOPE FOR MANKIND."];
		break; 
		
	case 5: 
		draw_set_valign(fa_bottom);
		textY = room_height - 2;
		storyText = ["HE MUST ROAM THE FORESTS,","CLIMB THE VOLCANOES,","TRAVERSE THE SKIES, AND","EVEN VENTURE THE STARS","TO FIGHT OUR HIDDEN FOES."];
		break; 
		
	case 6: 
		draw_set_valign(fa_middle);
		textY = room_height/2;
		storyText = ["ONLY YOU CAN SAVE THE DAY","FROM THE A.I. OVERLORDS.","GOOD LUCK ON YOUR JOURNEY!!"];
		break; 
	
}
	


draw_set_font(fontStory)
var aLength = array_length(storyText)

if (draw_get_valign() == fa_bottom) {
	for (j=aLength-1; j >= 0; j--)
		draw_text_color(textX, textY - j*11, storyText[aLength-1-j], c, c, c, c, textAlpha);
}

else if (draw_get_valign() == fa_top){
	for (j=0; j < aLength; j++)
		draw_text_color(textX, textY + j*11, storyText[j], c, c, c, c, textAlpha);
}

else {
	for (j=0; j < aLength; j++)
		draw_text_color(textX, textY + j*11 - 11, storyText[j], c, c, c, c, textAlpha);
}