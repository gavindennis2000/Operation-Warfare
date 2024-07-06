// dont draw the score if on the title, game over, or stage select
if (room == roomTitle or 
	room == roomStory or
	room == roomStageSelect or 
	room == roomGameOver or 
	room == roomPowerUp or 
	room == roomPractice or 
	room == roomEnding or
	room == roomCredits )
	
or (instance_exists(objPlayerStart))
	exit;
	
// draw the score
var scoreHeight = 11;
var camX =  camera_get_view_x(view_camera[0])+256-2;
var space = 14;
var drawScore = compileScore()

draw_set_font(fontScore);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_alpha(0.8);

if (drawScore >= 999999) {
	draw_text(camX, scoreHeight, gameScore);
	draw_text(camX-space*1, scoreHeight, gameScore10);
}

else {
	draw_text(camX, scoreHeight, 0);
	draw_text(camX-space*1, scoreHeight, 0);
}

draw_text(camX-space*2, scoreHeight, gameScore100);
draw_text(camX-space*3, scoreHeight, gameScore1000);
draw_text(camX-space*4, scoreHeight, gameScore10000);
draw_text(camX-space*5, scoreHeight, gameScore100000);

/* draw the score old
var scoreHeight = 6;

draw_sprite(sprNumbers, gameScore, camera_get_view_x(view_camera[0])+242, scoreHeight); // 1s
draw_sprite(sprNumbers, gameScore10, camera_get_view_x(view_camera[0])+228, scoreHeight); // 10s
draw_sprite(sprNumbers, gameScore100, camera_get_view_x(view_camera[0])+214, scoreHeight); // 100s
draw_sprite(sprNumbers, gameScore1000, camera_get_view_x(view_camera[0])+200, scoreHeight); // 1,000s
draw_sprite(sprNumbers, gameScore10000, camera_get_view_x(view_camera[0])+186, scoreHeight); // 10,000s
draw_sprite(sprNumbers, gameScore100000, camera_get_view_x(view_camera[0])+172, scoreHeight); // 100,000s