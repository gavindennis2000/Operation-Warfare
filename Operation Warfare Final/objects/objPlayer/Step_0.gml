// DEVELOPER TOOLS
if (devTools) {
	spreadshot = true;
	doubleJump = true;
	shockblast = true;
	/* restart the game with "P"
	if (keyboard_check_pressed(ord("P")))
		game_restart();
		*/
	// when you press "U", restart the room
	if keyboard_check_pressed(ord("H")) {
		global.playerHealth = 16;
		//instance_create_layer(x,y,"Controller",objSpreadshot);
		//instance_create_layer(x,y,"Controller",objDoubleJump);
		//instance_create_layer(x,y,"Controller",objShockblast);
		
		instance_create_layer(x,y,"Controller",objHard);
		room_restart();
		//instance_create_layer(x,y,"Controller",objShockblast);
	}
	
	// when you press "U", restart the room
	else if keyboard_check_pressed(ord("E")) {
		global.playerHealth = 16;
		//instance_create_layer(x,y,"Controller",objSpreadshot);
		//instance_create_layer(x,y,"Controller",objDoubleJump);
		//instance_create_layer(x,y,"Controller",objShockblast);
		
		instance_create_layer(x,y,"Controller",objEasy);
		room_restart();
		//instance_create_layer(x,y,"Controller",objShockblast);
	}
	
	// when you press "Q", go to the boss
	if keyboard_check_pressed(ord("Q")) {
		 if (x < (room_width-300)) {
			if (room == roomStage1) x = room_width - 300;
			else if (room == roomStage2) x = 1856;
			else if (room == roomStage3) x = 3298;
			else if (room == roomStageFinal) x = 2741;
			else x = 2512;
			y = room_height/4;
		}
		else if (instance_exists(objStageController)) {
			objStageController.bossDefeat = true;
		}
	}
}
//////////////////////////////////////////////////
// ACTUAL STEP EVENT CODE


// player inputs
keyRight = input_check("right");
keyLeft = input_check("left");
keyUp = input_check("up");
keyJump = input_check_pressed("jump");
jumpRelease =  input_check_released("jump")
keyCrouch = input_check("down");
if (rapidFire) {
	rfCounter++;
	if (rfCounter % 6 == 0)
		keyShoot = true;
	else 
		keyShoot = false;
}
else 
	keyShoot = input_check_pressed("shoot");
keySelect = input_check_pressed("select");
keyStart = input_check_pressed("start");


// check if upside down
upsideDown = (image_yscale == -1);
if upsideDown {  // change the controls for up and down if upside down
	keyUp =  
		input_check("down");
	keyCrouch = 
		input_check("up")
}


// change the music with Select ("R" or Circle on PlayStation)
if variable_global_exists("soundTest") {
	if (keySelect and global.soundTest)
		{
			if (audio_is_playing(sndStage1)) {
				audio_stop_sound(sndStage1);
				audio_play_sound(sndStage2, 1, true);
				exit; 
			}
			
			if (audio_is_playing(sndStage2)) {
				audio_stop_sound(sndStage2);
				audio_play_sound(sndStage3, 1, true);
				exit;
			}
			
			if (audio_is_playing(sndStage3)) {
				audio_stop_sound(sndStage3);
				audio_play_sound(sndStageFinal, 1, true);
				exit;
			}
			
			if (audio_is_playing(sndStageFinal)) {
				audio_stop_sound(sndStageFinal);
				audio_play_sound(sndStage1, 1, true);
				audio_sound_loop_start(sndStage1, 32);
				exit;
			}
			
			else {
				audio_play_sound(sndStage1, 1, true);
				audio_sound_loop_start(sndStage1, 32);
				exit;
			}
	}
}
	
// player start
if (invincibleCounter > 0) {
	invincibleCounter--;
}
	
if (invincibleCounter % 5 == 0) and (invincibleCounter != 0)
	imgAlpha = 0.2;
else
	imgAlpha = 1;
	
if (invincibleCounter == 0)
	invincible = false;
	
while (!startTemp) {
	if 
		(room == roomStageFinal) and 
		((x > 1616 and x < 1776) or (x > 4064 and x < 4064+256)) {
		y = 8;
	}
	
	else if 
		(room == roomStage2) and 
		((x >= 1888) and (x <= 2040 )) {
		y = 172;
		}
	
	else
		while (place_meeting(x, y, objWall)) {
			y += image_yscale;
		}
	
	exit;
}

// portal movement
if (portalTransport != 0) {
	invincible = true;
	exit;
	
}

// invincible cheat code
if (variable_global_exists("cheat")) {
	if (global.invincibilityCheat) {
		invincible = true;
		imgAlpha = 0.5;
	}
}

// calculate movement
var move = keyRight - keyLeft; // cancels out if player is pressing both or neither
hSpeed = move * 2; // horizontal

// change gravity on stage 3
if upsideDown 
	grav = -0.2;
else
	grav = 0.2;
	
if !(room == roomStageFinal)
	vSpeed += grav; // gravity on every other stage
else
	vSpeed += grav/1.5;  // gravity on final stage

// double jump cheat
if variable_global_exists("cheat") {
	if (global.doubleJumpCheat)
		doubleJump = true;
}

// jumping
if (place_meeting(x, y+image_yscale, objWall)) {
		doubleJumpTemp = true;
		if (keyJump) {
			if !upsideDown
				vSpeed = -5
			else
				vSpeed = 5;
				
			doubleJumpTemp = true;
		}
}
		
// double jump
else if (doubleJump = true) and (doubleJumpTemp = true) and (keyJump) {
	
	// play flame shield sound effect
	if audio_is_playing(sndDoubleJump)
		audio_stop_sound(sndDoubleJump);
	audio_play_sound(sndDoubleJump, 1, false);
	
	if (instance_exists(objDJFire))  // destroy any existing flame shields
		instance_destroy(objDJFire, true);
	instance_create_layer(x, y, "Bullet", objDJFire); // create flame shield
	
	// the actual second jump
	vSpeed = image_yscale * -4;
		
	doubleJumpTemp = false; 
}

// stop jump early if you release the button
if (jumpRelease) {
	if (vSpeed < 0 and doubleJumpTemp and !upsideDown) or (vSpeed > 0 and doubleJumpTemp and upsideDown) {	
		vSpeed /= 3;
	}
}
	
// check max fall speed
if upsideDown {
	maxFallSpeed = -5;
	if (vSpeed < maxFallSpeed) vSpeed = maxFallSpeed;
}

else {
	maxFallSpeed = 5;
	if (vSpeed > maxFallSpeed) vSpeed = maxFallSpeed;
}

// check horizontal collision
if (place_meeting(x+hSpeed, y ,objWall)) {
	while (!place_meeting(x+sign(hSpeed), y, objWall)) {
		x += sign(hSpeed);
	}
	hSpeed = 0;
}

// check vertical collision with regular wall
if (place_meeting(x, y+vSpeed ,objWall)) {
	while (!place_meeting(x, y+sign(vSpeed), objWall)) {
		y += sign(vSpeed);
	}
	vSpeed = 0;
}

// check diagonal collision with wall
if (place_meeting(x+hSpeed, y+vSpeed ,objWall)) {
	while (!place_meeting(x+sign(hSpeed), y+sign(vSpeed), objWall)) {
		x += sign(hSpeed);
		y += sign(vSpeed);
	}
	hSpeed = 0;
	vSpeed = 0;
}

// check if stuck in wall
if (place_meeting(x, y, objWall)) {
	while (place_meeting(x, y, objWall))
		y -= image_yscale;
}

// check for hazard death
if (place_meeting(x,y+image_yscale, objHazard) and (!invincible))
	playerDeath();
else if (place_meeting(x,y-image_yscale, objSpikeDown) and (!invincible))
	playerDeath();


// actual player movement
x += hSpeed;
y += vSpeed;
		
		
// states for sprite drawing
if (keyLeft) {
	face = left;
	if (vSpeed == 0) state = run; }
if (keyRight) {
	face = right;
	if (vSpeed == 0) state = run; }
if (hSpeed == 0) and (vSpeed == 0) and (!keyLeft) and (!keyRight) {
	state = stand; }
	
if (!keyLeft) and (!keyRight) {
	if (keyCrouch)
		state = crouch;
	else if (keyUp)
		state = up;
}

// if player is running and also facing up/down
if (keyLeft and keyUp) or (keyRight and keyUp) {
	runUp = true;
}
else runUp = false;

if (keyLeft and keyCrouch) or (keyRight and keyCrouch) {
	runDown = true;
}
else
	runDown = false;
	
// if player is in the air, have the jump animation
if !upsideDown {
	if (!place_meeting(x, y+1, objWall))
		state = jump;
}

else {
	if (!place_meeting(x, y-1, objWall))
		state = jump;
}

// spreadshot cheat
if variable_global_exists("cheat") {
	if (global.spreadshotCheat)
		spreadshot = true;
}
	
// shooting bullets -- shoot bullets

var shootSpeed = 5;
if (shockblast) {
	
	if (instance_exists(objEasy))
		shootSpeed = 5.5
	else
		shootSpeed = 6.5;
	
}
	
if (keyShoot) {
	if 
	(!spreadshot and instance_number(objBullet) < 3) or
	(spreadshot and instance_number(objBullet) < 2) or
	(rapidFire) {
		with (instance_create_layer(x, y-2, "Bullet", objBullet)) {
		
			// bullet trajectory is dependent on player state
		
		
			// if player is running and looking up
			if (objPlayer.runUp) {
				direction = 40;
				speed = shootSpeed;
				hspeed *= objPlayer.face;
				if objPlayer.upsideDown
					vspeed = -vspeed;
			}
		
			// if player is running and looking down
			else if (objPlayer.runDown) {
				direction = -40;
				speed = shootSpeed;
				hspeed *= objPlayer.face;
				if objPlayer.upsideDown
					vspeed = -vspeed;
			}
		
			// if player is looking straight up
			else if (objPlayer.keyUp) {
				direction = 90;
				speed = shootSpeed;
				if (objPlayer.upsideDown)
					vspeed = -vspeed;
			}
		
			// if player is looking straight down
			else if (objPlayer.keyCrouch) {
				direction = 270;
				speed = shootSpeed;
				if (objPlayer.upsideDown)
					vspeed = -vspeed;
			}
		
			// if all else is false, shoot a bullet straight ahead
			else {
				direction = 0;
				speed = shootSpeed;
				hspeed *= objPlayer.face;
			}
			
			// move the bullet closer to the gun if not pointing up;	
			if (objPlayer.state == objPlayer.up) {
				y -= 3;
				if objPlayer.upsideDown
					y += 6;
			}
			
			else if (objPlayer.state == objPlayer.crouch) {
				y += 6;
				if objPlayer.upsideDown
					y -= 6*2;
			}
			
			else
				x += (objPlayer.face * 3);
			
		}
	
	
		// create the spreadshot bullets if it is activated
		if (spreadshot) {
			// top bullet
			if (!instance_exists(objEasy)) {
				with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		
					// if player is running and looking up
					if (objPlayer.runUp) {
						direction = 40+20;
						speed = shootSpeed;
						hspeed *= objPlayer.face;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if player is running and looking down
					else if (objPlayer.runDown) {
						direction = -40+20;
						speed = shootSpeed;
						hspeed *= objPlayer.face;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if player is looking straight up
					else if (objPlayer.keyUp) {
						direction = 90+20;
						speed = shootSpeed;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if player is looking straight down
					else if (objPlayer.keyCrouch) {
						direction = 270+20;
						speed = shootSpeed;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if all else is false, shoot a bullet straight ahead
					else {
						direction = 0+20;
						speed = shootSpeed;
						hspeed *= objPlayer.face;
					}
				}
			}
			
			// second bullet
			with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		
				// if player is running and looking up
				if (objPlayer.runUp) {
					direction = 40+10;
					speed = shootSpeed;
					hspeed *= objPlayer.face;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if player is running and looking down
				else if (objPlayer.runDown) {
					direction = -40+10;
					speed = shootSpeed;
					hspeed *= objPlayer.face;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if player is looking straight up
				else if (objPlayer.keyUp) {
					direction = 90+10;
					speed = shootSpeed;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if player is looking straight down
				else if (objPlayer.keyCrouch) {
					direction = 270+10;
					speed = shootSpeed;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if all else is false, shoot a bullet straight ahead
				else {
					direction = 0+10;
					speed = shootSpeed;
					hspeed *= objPlayer.face;
				}
			}
		
			// middle bullet is already created
		
			// second to last bullet		
			with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
				
				// if player is running and looking up
				if (objPlayer.runUp) {
					direction = 40-10;
					speed = shootSpeed;
					hspeed *= objPlayer.face;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if player is running and looking down
				else if (objPlayer.runDown) {
					direction = -40-10;
					speed = shootSpeed;
					hspeed *= objPlayer.face;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if player is looking straight up
				else if (objPlayer.keyUp) {
					direction = 90-10;
					speed = shootSpeed;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if player is looking straight down
				else if (objPlayer.keyCrouch) {
					direction = 270-10;
					speed = shootSpeed;
					if objPlayer.upsideDown
						vspeed = -vspeed;
				}
		
				// if all else is false, shoot a bullet straight ahead
				else {
					direction = 0-10;
					speed = shootSpeed;
					hspeed *= objPlayer.face;
				}
			}
			
			// last bullet	
			if (!instance_exists(objEasy)) {
				with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		
					// if player is running and looking up
					if (objPlayer.runUp) {
						direction = 40-20;
						speed = shootSpeed;
						hspeed *= objPlayer.face;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if player is running and looking down
					else if (objPlayer.runDown) {
						direction = -40-20;
						speed = shootSpeed;
						hspeed *= objPlayer.face;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if player is looking straight up
					else if (objPlayer.keyUp) {
						direction = 90-20;
						speed = shootSpeed;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if player is looking straight down
					else if (objPlayer.keyCrouch) {
						direction = 270-20;
						speed = shootSpeed;
						if objPlayer.upsideDown
							vspeed = -vspeed;
					}
		
					// if all else is false, shoot a bullet straight ahead
					else {
						direction = 0-20;
						speed = shootSpeed;
						hspeed *= objPlayer.face;
					}
				}		
			}
		}
	}
}

// move on conveyer belt
if (place_meeting(x, y+image_yscale, objConveyerRight) and  objConveyerRight.image_speed != 0)
	x+=1
else if (place_meeting(x, y+image_yscale, objConveyerLeft)  and objConveyerLeft.image_speed != 0)
	x-=1
	
			
// prevent walking left off screen
if (x <= camera_get_view_x(view_camera[0])+16) {
	x = camera_get_view_x(view_camera[0])+16; }
	
// prevent walking right off screen
if (x >= camera_get_view_x(view_camera[0])+(256-16)) {
	x = camera_get_view_x(view_camera[0])+(256-16); }

// you die when you fall off the cliff
var fall = abs(sprite_height/2);

if (y >= room_height + fall) and !upsideDown
	playerDeath();
	
else if (y <= -fall) and upsideDown
	playerDeath();
	
