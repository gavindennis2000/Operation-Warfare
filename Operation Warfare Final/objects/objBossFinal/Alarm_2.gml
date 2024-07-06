/// @description run attack

state = run;
var spd = 4.5;
var aTime = 30;

if jumpSet % 2 == 0
	jumps = 4;
else 
	jumps = 3;


if (objPtr.x >= x) {
	
	face = right;
	hSpeed = spd;
	
}

else {
	
	face = left;
	hSpeed = -spd;
	
	
}

if (jumpSet % 7 == 0) or 
	(jumpSet % 5 == 0 and instance_exists(objHard)) {  // initiate special attack; should be 7
	jumpSet = 0;
	alarm[3] = aTime;
}
else 
	alarm[1] = aTime;
	
	jumpSet++;
