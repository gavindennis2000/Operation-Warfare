/// @description change letter on cursor 

if (!newHighScore or drawScore) {

	drawScore = true;
	dsTemp = true;
	exit;
	
}
	
var keyUp = input_check_pressed("up");
var keyDown = input_check_pressed("down");
var keyStart = input_check_pressed("start");
var keyRight = input_check_pressed("right");
var keyLeft = input_check_pressed("left");

var keyHoldUp = input_check("up");
if (keyHoldUp)
	holdUp++;
else 
	holdUp = 0;
if (holdUp > 25 and holdUp % 6 == 0)
	keyUp = true;
	
var keyHoldDown = input_check("down");
if (keyHoldDown)
	holdDown++;
else 
	holdDown = 0;
if (holdDown > 25 and holdDown % 6 == 0)
	keyDown = true;


// move the cursor left
if (keyLeft and !dsTemp) {
	
	// cursor sfx
	if (audio_is_playing(sndCursor))	
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
	
	// move the cursor left
	if (cursor > 1)
		cursor -= 2;
	else 
		cursor = 9;
		
}

// move the cursor right
if (keyRight and !dsTemp) {
	
	// cursor sfx
	if (audio_is_playing(sndCursor))	
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
	
	// move the cursor right
	if (cursor < 9)
		cursor += 2;
	else 
		cursor = 1;
	
}

// change the letter up
if (keyUp and !dsTemp) {
	
	// cursor sfx
	if (audio_is_playing(sndCursor))	
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
	
	var letter = string_lower(string_char_at(tempName, cursor));
	var temp = "";
	
	switch(letter) {
	
		case "a":
			temp = string_insert("b", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "b":
			temp = string_insert("c", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "c":
			temp = string_insert("d", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "d":
			temp = string_insert("e", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "e":
			temp = string_insert("f", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "f":
			temp = string_insert("g", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "g":
			temp = string_insert("h", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "h":
			temp = string_insert("i", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "i":
			temp = string_insert("j", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "j":
			temp = string_insert("k", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "k":
			temp = string_insert("l", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "l":
			temp = string_insert("m", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "m":
			temp = string_insert("n", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "n":
			temp = string_insert("o", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "o":
			temp = string_insert("p", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		case "p":
			temp = string_insert("q", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "q":
			temp = string_insert("r", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "r":
			temp = string_insert("s", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "s":
			temp = string_insert("t", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "t":
			temp = string_insert("u", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "u":
			temp = string_insert("v", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "v":
			temp = string_insert("w", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "w":
			temp = string_insert("x", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "x":
			temp = string_insert("y", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "y":
			temp = string_insert("z", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		case "z":
			temp = string_insert(" ", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		case " ":
			temp = string_insert("a", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		default:
			break;
	
	}
	tempName = temp;
	
}

// move down a letter at the cursor
if (keyDown and !dsTemp) {
	
	// cursor sfx
	if (audio_is_playing(sndCursor))	
		audio_stop_sound(sndCursor);
	audio_play_sound(sndCursor, 1, false);
	
	var letter = string_lower(string_char_at(tempName, cursor));
	var temp = "";
	
	switch(letter) {
	
		case "a":
			temp = string_insert(" ", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "b":
			temp = string_insert("a", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "c":
			temp = string_insert("b", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "d":
			temp = string_insert("c", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "e":
			temp = string_insert("d", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "f":
			temp = string_insert("e", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "g":
			temp = string_insert("f", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "h":
			temp = string_insert("g", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "i":
			temp = string_insert("h", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "j":
			temp = string_insert("i", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "k":
			temp = string_insert("j", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "l":
			temp = string_insert("k", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "m":
			temp = string_insert("l", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "n":
			temp = string_insert("m", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "o":
			temp = string_insert("n", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		case "p":
			temp = string_insert("o", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "q":
			temp = string_insert("p", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "r":
			temp = string_insert("q", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "s":
			temp = string_insert("r", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "t":
			temp = string_insert("s", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "u":
			temp = string_insert("t", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "v":
			temp = string_insert("u", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "w":
			temp = string_insert("v", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "x":
			temp = string_insert("w", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			
			break;
			
		case "y":
			temp = string_insert("x", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		case "z":
			temp = string_insert("y", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		case " ":
			temp = string_insert("z", tempName, cursor);
			temp = string_delete(temp, cursor+1, 1);
			break;
			
		default:
			break;
	
	}
	tempName = temp;
	
}

// confirm the player's name
if (keyStart and !dsTemp and alarm_get(1) == -1) {
	var temp = string_concat(
		string_char_at(tempName, 1), 
		string_char_at(tempName, 3), 
		string_char_at(tempName, 5),
		string_char_at(tempName, 7),
		string_char_at(tempName, 9)
	) 
	audio_play_sound(sndHealthUp, 1, false);
	highScores[newScorePos].name = string_upper(temp);
	dsTemp = true;
	alarm[1] = 60;
	updateScore();
}