angle = random_range(-5, 5)

if (instance_exists(objPlayerSpaceship)) {
	
	direction = point_direction(x, y, objPlayerSpaceship.x, objPlayerSpaceship.y);
	speed = 0.5;
	
}
	
eHealth = 3;
healthScale = 100 / eHealth;
dontMove = false;