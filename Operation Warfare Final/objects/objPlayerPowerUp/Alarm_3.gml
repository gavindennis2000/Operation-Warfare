// demonstrate spreadshot bullets

var spd = 5;

if (instance_exists(objShockblast))
	spd = 6;
	

	// top bullet
	with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		direction = 0+20;
		speed = spd;
		hspeed *= objPlayerPowerUp.face;
	}
	// second bullet
	with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		direction = 0+10;
		speed = spd;
		hspeed *= objPlayerPowerUp.face;
	}
		
	// middle bullet
	with (instance_create_layer(x,y-2, "Bullet", objBullet)) {
		direction = 0;
		speed = spd;
		hspeed *= objPlayerPowerUp.face;
	}
		
	// second to last bullet		
	with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		direction = 0-10;
		speed = spd;
		hspeed *= objPlayerPowerUp.face;
	}
			
	// last bullet				
	with (instance_create_layer(x,y-2, "Bullet", objBulletSpread)) {
		direction = 0-20;
		speed = spd;
		hspeed *= objPlayerPowerUp.face;
	}
	
if (shootCount < 3) {
	shootCount++;
	alarm[3] = 20;
}
else
	alarm[2] = 180;