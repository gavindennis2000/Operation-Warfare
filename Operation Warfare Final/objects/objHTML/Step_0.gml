var pressAny = ( 
	input_check_pressed("up") or
	input_check_pressed("down") or
	input_check_pressed("left") or
	input_check_pressed("right") or
	input_check_pressed("jump") or
	input_check_pressed("shoot") or
	input_check_pressed("select") or
	input_check_pressed("start") or 
	keyboard_check_pressed(vk_anykey)
)

if (keyboard_check_pressed(ord("F"))) {
	if (window_get_fullscreen() == true)
		window_set_fullscreen(true)
	else 
		window_set_fullscreen(true);
}

else if (pressAny and room == roomHTML) {
	room_goto(roomTitle);
}