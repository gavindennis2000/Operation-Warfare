/// @description create explosions


var camX = camera_get_view_x(view_camera[0]);
var ranX = irandom_range(0, 256);
var ranY = irandom_range(0, room_height);
instance_create_layer(camX+ranX, ranY, layer, objExplosion);

alarm[3] = aTime2;