// shoot three bullets at enemy; first
if (instance_exists(objPlayer)) and (!instance_exists(objPlayerStart)) {
	
	with (instance_create_layer(x, y, "Bullet", objBulletEnemy)) {
		direction = point_direction(x, y, other.playerX, other.playerY);
		speed = 3; }
	
	shootCheck = true; }