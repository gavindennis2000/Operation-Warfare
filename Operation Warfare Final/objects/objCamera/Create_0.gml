// fire reset for stage 2: flame run
fireResetCheck = false;
shockResetCheck = false;
spaceResetCheck = false;
spaceshipResetCheck = false;
portalMoveCheck = false;
finalReady = false;

// portals on final stage
portalX = 0;
portalY = 0;

// screen shake
shakePower = 5;
shakeValue = 0;

function fireReset() {
	hspeed = -6;
	fireResetCheck = true;
}

function shockReset() {
	hspeed = -6;
	shockResetCheck = true;
}

function spaceReset() {
	hspeed = -6;
	spaceResetCheck = true;
}

function spaceshipReset() {
	hspeed = -6;
	spaceshipResetCheck = true;
}

function portalMove(pX, pY) {
	
	if (instance_exists(objPlayer)) {

		portalX = pX;
		portalY = pY;
	
		portal = true;
	
		if objPlayer.x < pX 
			hspeed = 3;
		
		else if objPlayer.x > pX 
			hspeed = -3;
	
		portalMoveCheck = true;
	
	}
	
}