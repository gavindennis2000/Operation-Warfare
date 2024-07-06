drawX = room_width;
i = 0;
ran = irandom_range(1, 5);

c1 = ["Extra Lives Cheat:","Up, Up, Down, Down,","Left, Right, Left, Right,", "SHOOT, JUMP"];
c2 = ["Spreadshot Cheat:","Up, Down, Left, Right,", "SHOOT, JUMP"];
c3 = ["Double Jump Cheat:","SHOOT, JUMP, SHOOT,", "SHOOT, JUMP, JUMP"];
c4 = ["Invincibility Cheat:","Left, Right, Select,", "SHOOT, JUMP, Select"];
c5 = ["Sound Test:","(During Pause Screen)","Up, Left, Down,", "Right, Select, Select"];

displayCheat = false;

switch (ran) {
	
	case 1:
		ran = c1;
		break;
	
	case 2:
		ran = c2;
		break;
	
	case 3:
		ran = c3; 
		break;
		
	case 4: 
		ran = c4;
		break;
		
	case 5:
		ran = c5;
		break;
		
	default:
		break;
}