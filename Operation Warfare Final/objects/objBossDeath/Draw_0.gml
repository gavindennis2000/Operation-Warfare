// draw silhouette of boss
switch (room) {
	
	case roomStage1:
		draw_sprite_ext(sprBoss1Run, 0, x, y, face, image_yscale, image_angle, c_black, imgAlpha);
		break;
		
	case roomStage2:
		draw_sprite_ext(sprBoss2Run, 0, x, y, face, image_yscale, image_angle, c_black, imgAlpha);
		break;
		
	case roomStage3:
		draw_sprite_ext(sprBoss3Run, 0, x, y, face, image_yscale, image_angle, c_black, imgAlpha);
		break;
		
	case roomStageFinal:
		draw_sprite_ext(sprBossFinalRun, 0, x, y, face, image_yscale, image_angle, #4428bc, imgAlpha);
		break;
	
}
