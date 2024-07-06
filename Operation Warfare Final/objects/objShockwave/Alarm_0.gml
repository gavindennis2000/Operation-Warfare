if (point_direction(x, y, objPtr.x, objPtr.y) > direction)
	changeDirection = 1;
else if (point_direction(x, y, objPtr.x, objPtr.y) <= direction)
	changeDirection = -1;