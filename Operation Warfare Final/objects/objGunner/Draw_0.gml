/// @description sprite changes on final stage
if (room == roomStageFinal or room == roomTest)
	sprite_index = sprGunnerFinal;
else 
	sprite_index = sprGunner;
	
// Inherit the parent event
event_inherited();

