var i = 1
x = camera_get_view_x(view_camera[0])+256 - sprite_width * i;
y = camera_get_view_y(view_camera[0])+room_height - sprite_height * i;

image_alpha = 0.3;
draw_self();

if (keyLeft) 
	draw_sprite_ext(sprControllerButtons, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (keyUp) 
	draw_sprite_ext(sprControllerButtons, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (keyRight) 
	draw_sprite_ext(sprControllerButtons, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (keyDown) 
	draw_sprite_ext(sprControllerButtons, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (keySelect) 
	draw_sprite_ext(sprControllerButtons, 4, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (keyStart) 
	draw_sprite_ext(sprControllerButtons, 5, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (key1) 
	draw_sprite_ext(sprControllerButtons, 6, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
if (key2) 
	draw_sprite_ext(sprControllerButtons, 7, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
