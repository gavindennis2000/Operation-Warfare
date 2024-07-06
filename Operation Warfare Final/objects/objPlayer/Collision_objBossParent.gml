// you die when you get hit by the boss if you're not invincible
// and they aren't in their starting state
if (!invincible) and (other.state != other.start)
	playerDeath();