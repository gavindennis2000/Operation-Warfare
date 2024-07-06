// controller inputs
keyRight = input_check("right");
keyLeft = input_check("left");
keyUp = input_check("up");
key2 = input_check("jump");
keyDown = input_check("down");
key1 = input_check("shoot");
keySelect = input_check("select");
pressSelect = input_check_pressed("select");

keyStart = input_check("start");

keyAny = ( 
	keyRight or 
	keyLeft or 
	keyUp or 
	keyDown or 
	
	key1 or 
	key2 or 
	
	keySelect or 
	keyStart
);

if (pressSelect) {
	
	if (visible)
		visible = false; 
	else 
		visible = true;
	
}