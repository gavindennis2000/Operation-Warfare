counter++;
draw_self();
var factor = random_range(1, 3) * 2;
draw_sprite_ext(sprite_index, 0, x + hspeed * factor, y + vspeed * factor, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 2/3)
factor *= 2;
draw_sprite_ext(sprite_index, 0, x + hspeed * factor, y + vspeed * factor, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 1/3)