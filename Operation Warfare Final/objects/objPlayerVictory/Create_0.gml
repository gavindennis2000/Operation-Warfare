layer = layer_create(-1000, "Victory");
stand = 1;
run = 2;
jump = 3;

grav = 0.2

left = -1;
right = 1;
image_yscale = 1;

hSpeed = 0;
vSpeed = 0;

proceed = false;  // player walks off screen when this is true
fadeOut = false;  // used to draw black rectangle
imageAlpha = 1;

state = jump;
nextRoom = false;
portalTransport = false;
image_alpha = 1;
image_yscale = 1;

instance_destroy(objEnemyParent);