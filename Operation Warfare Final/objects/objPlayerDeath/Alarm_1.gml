/// @description create new player after fire run
// if you die during the fire run, create new player
// after the camera moves


instance_create_layer(
	camera_get_view_x(view_camera[0]+16),
	camera_get_view_y(view_camera[0]+16),
	"Player", objPlayer);

instance_destroy();