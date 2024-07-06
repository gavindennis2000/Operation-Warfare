if (x == xInitial + dist)
	face = left;
if x == xInitial
	face = right;
	
hspeed = face;

// check if player can jump through
if (instance_exists(objPlayer) and !instance_exists(objPlayerDeath) and !instance_exists(objPlayerVictory)) {
	
	if (!objPlayer.upsideDown) {  // if player is upright
		
		image_blend = c_blue;
		
		// set the right collision mask
		if (round(objPlayer.y + objPlayer.sprite_height/2) > y)
			sprite_index = -1;
		else
			sprite_index = sprMovingWall;
			
	}
	
	else  {  // if player is upside down
		
		image_blend = c_red;
		
		// set the right collision mask
		if (round(objPlayer.y + objPlayer.sprite_height/2)-7 < y) {
			sprite_index = -1;
			image_blend = c_aqua;}
		else
			sprite_index = sprMovingWall;
	}
	
	if place_meeting(x, y-objPlayer.image_yscale, objPlayer) {
		
		if hspeed == 1
			with (objPlayer) if !place_meeting(x+1, y, objWall)
				objPlayer.x++;
				
		if hspeed == -1
			with (objPlayer) if !place_meeting(x-1, y, objWall)
			objPlayer.x--;
	}
}

