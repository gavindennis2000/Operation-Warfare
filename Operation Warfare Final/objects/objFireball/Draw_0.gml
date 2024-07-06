/// @description Insert description here
// You can write your code in this editor




var spr = sprFireballAttack;

if (attack)
	spr = sprFireballAttack;
else 
	spr = sprFireball;

image_speed = 2;
draw_sprite_ext(sprFireballFire, -1, x, y-3, fireXscale * face, fireYscale, image_angle, image_blend, image_alpha);

image_speed = 1/6
draw_sprite_ext(spr, -1, x, y, -face, 1, image_angle, image_blend, image_alpha);