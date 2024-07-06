stand = 0;
run = 1;
jump = 2;

right = 1;
face = right;

x = -32;
y = room_height/2+40;

state = run;

hspeed = 2;
vSpeed = 0;
grav = 0;

continueVar = false;
next = false;
shootCount = 0;
doubleJump = 0;
rectAlpha = 0;

layer = layer_create(-1000, "JoeMama");

dontGo = false;