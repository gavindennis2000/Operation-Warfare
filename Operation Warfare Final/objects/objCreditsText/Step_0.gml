// check if text is finished scrolling
if (x > room_width+150) {
	
	instance_destroy();

}

if (image_index >= 10 and x >= room_width/2) {
	
	x = room_width/2;
	hspeed = 0;
	if (finished == 0) {
		
		finished = 1;
		alarm[0] = 300;
	}
	
}
// check gamepad button
var anyKey = (
	input_check_pressed("left") +
	input_check_pressed("right") +
	input_check_pressed("up") +
	input_check_pressed("down") +
	input_check_pressed("shoot") +
	input_check_pressed("jump") +
	input_check_pressed("select") +
	input_check_pressed("start")
)

if (finished == 2) {
	
	if (anyKey)
		room_goto(roomHighScore);
		
}