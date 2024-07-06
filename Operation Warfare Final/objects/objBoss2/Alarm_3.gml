///@description shoot second flame every third time

with (instance_create_layer(x, y, "Bullet", objFlame)) {
	x += other.face*12;
	hSpeed = other.face*5;
	image_xscale = other.face*-1;
}