angle = random_range(-5, 5)

if (instance_exists(objPlayerSpaceship)) {
	
	speed = 3;
	
}
	
if (instance_exists(objHard))
	speed += 0.5;
eHealth = 1;
healthScale = 100 / eHealth;
dontMove = false;