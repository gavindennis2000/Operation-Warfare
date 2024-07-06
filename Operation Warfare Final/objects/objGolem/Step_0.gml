if (instance_exists(objEasy))
	instance_destroy();
	
if (instance_exists(objStageController))
	if (global.bossCheck)
		instance_destroy();

// calculate movement
var move = 0.5; // default spyder speed
hSpeed = move * facing; // horizontal
vSpeed += grav*.75; // gravity

// check if enemy is in view
event_inherited()
if (dontMove)
	exit;

if (vSpeed > maxFallSpeed)
	vSpeed = maxFallSpeed;

// check horizontal collision
if (place_meeting(x+hSpeed, y ,objWall)) {
	while (!place_meeting(x+sign(hSpeed), y, objWall)) {
		x += sign(hSpeed); }
	hSpeed = 0; }

// check vertical collision
if (place_meeting(x, y+vSpeed ,objWall)) {
	while (!place_meeting(x, y+sign(vSpeed), objWall)) {
		y += sign(vSpeed); }
	vSpeed = 0;
	hSpeed = 0; 
	if (instance_exists(objCamera)) {
		if (objCamera.shakeValue == 0) 
			objCamera.shakeValue = 1;
	}
}

// move the enemy
x += hSpeed;
y += vSpeed;


// jump when you're on the ground
if (place_meeting(x, y+1 ,objWall)) and (vSpeed == 0) {
	if (!audio_is_playing(sndGolemLand))
		audio_play_sound(sndGolemLand, 1, false);
	vSpeed = -jumpHeight;
	jumpHeight += 0.25;
	var heNotDead = (instance_exists(objPlayer) and !instance_exists(objPlayerDeath))
	if (heNotDead and i != 0 and objPlayer.x < x) {
		with (objPlayer) {
			if (place_meeting(x, y+1, objWall))	{
				with (other) {
					if (audio_is_playing(sndEnemyBullet))
						audio_stop_sound(sndGolem);
					audio_play_sound(sndGolem, 1, false);
					with (instance_create_layer(x-5, y-5, "Bullet", objBulletEnemy)) {
						direction = point_direction(x, y, objPlayer.x, objPlayer.y-80);
						speed = 4;
						var dist = abs(x - objPlayer.x);
						if dist > 60
							gravity = 0.15;
						else 
							gravity = 0.2;
					}
				};
		
			}
		}
	}
	
	i = 0;
	
	if (jumpHeight == 2.5 and instance_exists(objHard))
		jumpHeight = 2;
	else if (jumpHeight == 3)
		jumpHeight = 2.5;
		
}
	
// image animation
i++;

if (vSpeed >= 2.5) or (dontMove) {
	image_index = 0;
	image_speed = 0;
}

else if i < 8
	image_index = 1;
else 
	image_index = 2;