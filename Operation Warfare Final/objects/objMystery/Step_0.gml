// if player gets stuck in the wall
event_inherited();

if (instance_exists(objPlayer)) {
	dist = abs(
	sqrt((power(objPlayer.x - x, 2) + power(objPlayer.y - y, 2)))
	) - 25;
	image_alpha = 1 - dist/16;
}