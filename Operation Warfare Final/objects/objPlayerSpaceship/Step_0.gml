// start
if (state == start) {
	
	if y <= room_height/2 { 
	
		y = room_height/2;
		vspeed = 0;
	
	}
	
	if (objCamera.x <= x+ 102)
		objCamera.x+= 2;
	else
		objCamera.x = x+102;
	
	exit;
	
}

// invincibility frames
if (invincible > 0) {
	invincible--;
}
else 
	state = alive;
	
if (invincible % 5 == 0) and (invincible != 0)
	imgAlpha = 0.2;
else
	imgAlpha = 1;

// alive
if (state == alive) {
	
	
	// move the spaceship sprite up
	if (dir == up) {
	
		if (dirTicker > -1) {
			dirTicker -= 0.05;
		}
		
		else  {
			dirTicker = -1;
			dir = down;
		}
		
	}
	// move the spaceship sprite down
	else if (dir == down) {
		
		if (dirTicker < 1) {
			dirTicker += 0.05;
		}
		
		else  {
			dirTicker = 1;
			dir = up;
		}
		
	}
	
	vSpeed += dirTicker/2;
	
	// player controls
	var keyUp = input_check("up");
	var keyLeft = input_check("left");
	
	var keyDown = input_check("down");
	
	var keyRight = input_check("right");
	
	var keyShoot = false;
	if (rapidFire) {
		rfCounter++;
		if (rfCounter % 6 == 0)
			keyShoot = true;
		else 
			keyShoot = false;
	}
	else
		keyShoot = input_check_pressed("shoot");
	

	
	// move up
	if (keyUp) {
		vsp -= 0.35;
	}
	
	// move down
	else if (keyDown) {
		vsp += 0.35;
	}
	
	
	// shoot
	if (keyShoot and (instance_number(objBullet) < 2 or rapidFire) ) {
		
		// first bullet
		with (instance_create_layer(x, y, "Bullet", objBullet)) {
		
			direction = other.direc;
			speed = 6.5;
		
		}
		// second bullet
		with (instance_create_layer(x, y, "Bullet", objBulletSpread)) {
		
			direction = other.direc+10;
			speed = 6.5;
		
		}
		
		// third bullet
		if (!instance_exists(objEasy)) {
			with (instance_create_layer(x, y, "Bullet", objBulletSpread)) {
		
				direction = other.direc+20;
				speed = 6.5;
		
			}
		}
		
		// fourth bullet
		with (instance_create_layer(x, y, "Bullet", objBulletSpread)) {
		
			direction = other.direc-10;
			speed = 6.5;
		
		}
		
		// fifth bullet
		if (!instance_exists(objEasy)) {
			with (instance_create_layer(x, y, "Bullet", objBulletSpread)) {
		
				direction = other.direc-20;
				speed = 6.5;
		
			}
		}
	}
	
}

// friction mechanic
if vsp < 0
	vsp += 0.2;
else if vsp > 0
	vsp -= 0.2;
	
// max speed
var maxSpd = 5;  // used to be 4; changed on 3/26/24
if vsp > maxSpd
	vsp = maxSpd;
if vsp < -maxSpd
	vsp = -maxSpd;

// check that spaceship doesn't go off screen
var num = 4;
if y < num {
	y = num;
}
	
if y > room_height-num {
	y = room_height-num;
}

// advance the spaceship
hsp++;
if (hsp % 1 == 0)
	x++;
y += vsp;

// check for destination
var destination = room_width- (256*7/2)

if (x >= destination) and destTemp and (room == roomStageFinal) {
	
	destTemp = false;
	image_index = 0;
	
	// create new player object
	with (instance_create_layer(x, y, "Player", objPlayer)) {
		x = other.x;
		if (other.y < room_height/2)
			y = other.y;
		else
			y = room_height/2;
	}
	
	instance_change(objSpaceship2, true);
}