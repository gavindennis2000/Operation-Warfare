

angle = random_range(-5, 5)
eHealth = 6;
healthScale = 100 / eHealth;
dontMove = false;

if (instance_exists(objEasy))
	eHealth = 3;
	
if (instance_exists(objPlayerSpaceship)) {
	
	direction = point_direction(x, y, objPlayerSpaceship.x, objPlayerSpaceship.y);
	speed = 1.5;
	
}

else if (instance_exists(objPlayer)) {
	
	direction = point_direction(x, y, objPlayer.x, objPlayer.y);
	speed = 1.5;
	eHealth = 3;
	sprite_index = sprAsteroidBlue;
}

if (instance_exists(objHard))
	speed += 0.5;