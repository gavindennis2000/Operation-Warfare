x = 0;
y = room_height;
vspeed = -1;

// don't animate
image_index = 0;
image_speed = 0;

flash = false;
rollCredits = false;

// play the credits music
alarm[0] = 165;

// tell the save data that you have beat the game
if (instance_exists(objEasy)) {
	
	easyComp = true; 
	if (file_exists("complete.txt")) {
	
		// open complete file to find what you've already completed
		var _rfile = file_text_open_read("complete.txt");
		var _json = file_text_read_string(_rfile);
		var _completeData = json_parse(_json);
	
		normalComp = _completeData.normal;
		hardComp = _completeData.hard;
		file_text_close(_rfile);
		
		// write new data to complete file
		var _completeStruct = {
			
			easy: easyComp,
			normal: normalComp,
			hard: hardComp
			
		}
		_completeData = json_stringify(_completeStruct);
		var _wfile = file_text_open_write("complete.txt");
		file_text_write_string(_wfile, _completeData);
		file_text_close(_wfile);
		
	
	}
}

else if (instance_exists(objHard)) {
	
	hardComp = true; 
	if (file_exists("complete.txt")) {
	
		// open complete file to find what you've already completed
		var _rfile = file_text_open_read("complete.txt");
		var _json = file_text_read_string(_rfile);
		var _completeData = json_parse(_json);
	
		normalComp = _completeData.normal;
		easyComp = _completeData.easy;
		file_text_close(_rfile);
		
		// write new data to complete file
		var _completeStruct = {
			
			easy: easyComp,
			normal: normalComp,
			hard: hardComp
			
		}
		_completeData = json_stringify(_completeStruct);
		var _wfile = file_text_open_write("complete.txt");
		file_text_write_string(_wfile, _completeData);
		file_text_close(_wfile);
		
	
	}
}
else {
	
	normalComp = true; 
	if (file_exists("complete.txt")) {
	
		// open complete file to find what you've already completed
		var _rfile = file_text_open_read("complete.txt");
		var _json = file_text_read_string(_rfile);
		var _completeData = json_parse(_json);
	
		easyComp = _completeData.easy;
		hardComp = _completeData.hard;
		
		file_text_close(_rfile);
		
		// write new data to complete file
		var _completeStruct = {
			
			easy: easyComp,
			normal: normalComp,
			hard: hardComp
			
		}
		_completeData = json_stringify(_completeStruct);
		var _wfile = file_text_open_write("complete.txt");
		file_text_write_string(_wfile, _completeData);
		file_text_close(_wfile);
		
	
	}
}
