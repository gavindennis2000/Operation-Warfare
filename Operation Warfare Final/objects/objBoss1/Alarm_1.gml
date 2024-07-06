///@description jump after landing on floor

state = jump;
vSpeed = -jHeight;
jHeight += 1.25;
hSpeed = face/2;
canJump = true;
specialMove--;  // increment special move counter

// create bullets
alarm[2] = 10 + (jHeight*1.5);