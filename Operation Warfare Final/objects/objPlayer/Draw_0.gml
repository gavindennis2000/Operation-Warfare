// image blend during rapidfire
image_blend = c_white;
if (rapidFire) {
	var rfC2 = floor(rfCounter/3);
	if (rfC2 % 2 == 0 and rfCounter >= 240)
		image_blend = #f83800
	else if (rfC2 % 3 == 0) 
		image_blend = #f83800
	else 
		image_blend = c_white;
}

// image alpha during portal
if (variable_instance_exists(self, "portalTransport")) {
	if (portalTransport != 0)
		imgAlpha = imgAlphaPortal;
}

// animation speed
if (state == run) image_speed = 0.2;
if (state == jump) {
	
		sprite_index = sprPlayerJump;
		if variable_instance_exists(self, "doubleJumpTemp") {
			if (doubleJumpTemp)
				image_speed = 1;
			else
				image_speed = 1.25;
		}
		else
			image_speed = 1;
			
		if room == roomStageFinal
			image_speed -= 0.25
}
	
// which sprite to use
if (state == stand) or (state == start)
	draw_sprite_ext(sprPlayerStand,0,x,y,face, image_yscale, image_angle, image_blend, imgAlpha);
	
if (state = run) {
	sprite_index = sprPlayerRun;
	if (runUp)
		draw_sprite_ext(sprPlayerRunUp,-1,x,y,face, image_yscale, image_angle, image_blend, imgAlpha);
	else if (runDown)
		draw_sprite_ext(sprPlayerRunDown,-1,x,y,face, image_yscale, image_angle, image_blend, imgAlpha);
	else
		draw_sprite_ext(sprPlayerRun,-1,x,y,face, image_yscale, image_angle, image_blend, imgAlpha); 
}

if (state == jump)
	draw_sprite_ext(sprPlayerJump,-1,x,y, face, image_yscale, image_angle, image_blend, imgAlpha);
if (state == crouch) 
	draw_sprite_ext(sprPlayerDown,0,x,y, image_xscale, image_yscale, image_angle, image_blend, imgAlpha);
if (state == up)
	draw_sprite_ext(sprPlayerUp,0,x,y,image_xscale, image_yscale, image_angle, image_blend, imgAlpha);

if (room == roomStageFinal) {
	var tempX = x;
	var tempY = y;
	if (state == jump)
		draw_sprite_ext(sprPlayerHelmetJump, -1, x, y, face, image_yscale, image_angle, image_blend, imgAlpha);
	
	else if (state == run) {
		draw_sprite_ext(sprPlayerHelmet, -1, x, y-1, face, image_yscale, image_angle, image_blend, imgAlpha);
	}
	
	else {
		if state == crouch {
			draw_sprite_ext(sprPlayerHelmet, 0, x-face, y+1, face, image_yscale, image_angle, image_blend, imgAlpha);
		}
	
		else if state == up {
			draw_sprite_ext(sprPlayerHelmet, 0, x-face, y-1, face, image_yscale, image_angle, image_blend, imgAlpha);
		}
		else {
			draw_sprite_ext(sprPlayerHelmet, 0, x, y, face, image_yscale, image_angle, image_blend, imgAlpha);
		}	
	}
	
	
	
}