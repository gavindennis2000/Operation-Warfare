// create more hellfire

if (dir == right) {
	if (x < camera_get_view_x(view_camera[0])+256-8)
		with (instance_create_layer(x+8, room_height+2, layer, objHellfire))
			dir = right;
}

else if (dir == left) {
	if (x > camera_get_view_x(view_camera[0]))
		with (instance_create_layer(x-8, room_height+2, layer, objHellfire))
			dir = left;
}