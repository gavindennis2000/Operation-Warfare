/* Test to see if camera is working *
draw_text(objPlayer.x,objPlayer.y,camera_get_view_x(view_camera[0]))
draw_text(camera_get_view_x(view_camera[0])+100, camera_get_view_y(view_camera[0])+100, objPlayer.x)