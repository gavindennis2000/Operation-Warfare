///@description first jump
state = jump;
vSpeed = -jHeight;
jHeight += 1.25;
hSpeed = face/2;
imgAlpha = 1;
specialMove--;  // increment special move counter

// create bullets
alarm[2] = 10 + (jHeight*1.5);