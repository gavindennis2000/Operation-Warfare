// draw names
draw_set_font(font3);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

myYT = myY-50;
sep = 12;
//draw_sprite(sprNames, name, drawText, myY+50);
draw_text(drawText, myYT, nameText[name, 0]);
draw_text(drawText, myYT+sep*1, nameText[name, 1]);
draw_text(drawText, myYT+sep*2, nameText[name, 2]);
draw_text(drawText, myYT+sep*3, nameText[name, 3]);

// draw characters
draw_sprite_ext(pIndex, 0, drawPlayer, myY+20, image_xscale, image_yscale, image_angle, image_blend, image_alpha);