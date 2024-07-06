layer = layer_create(-1000, "Pause");
shake = 0;

image_speed = 0;

// three total selections: resume, retry, and main menu
selection = 0;
screen = 1;

// image blend for each selection
b1 = c_white;
b2 = c_white;
b3 = c_white;
b4 = c_white;
b5 = c_white;

gamePause = false;
cheatTempST = 0;

yes = 1;
no = 0;
cursor = yes;
next = true;
aTime = 10;