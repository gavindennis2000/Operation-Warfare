layer = layer_create(-1000, "topdog");
image_speed = 0;
image_index = 0;
y+=8;
aTime = 10;

selection = 0;
setting = "controls";
csetting = 0;

b1 = c_white;
b2 = c_white;
b3 = c_white;
b4 = c_white;
b5 = c_white;
b6 = c_white;
b11 = c_white;
b22 = c_white;
b33 = b22;
b44 = b33;

c1 = b1; 
c2 = b2; 
c3 = b3; 
c4 = b4

// color for selected text
c = #a4e4fc;
w = c_white;
gray =  #787878;

flicker = false;
i = 0;
j = 0;
imgA = 1;

flicker2 = false;
imgB = 1;

flicker3 = false; 
imgC = 1;

flicker4 = false; 
imgD = 1;

flicker5 = false; 
imgE = 1;

flicker6 = false; 
imgF = 1;

next = true;
displayOptions = "start";

rw = room_width/2;
rh = room_height/2 + 10;

easy = 0; 
normal = 1; 
hard = 2; 
diff = easy;

easyComp = false;
normalComp = false; 
hardComp = false;

// check if game has been beaten
if (!file_exists("complete.txt")) {
	
	// if the file does not exist, create it and assign false to every variable
	var _completeStruct = {
		
		easy: false,
		normal: false,
		hard: false
		
	}
	
	var _completeData = json_stringify(_completeStruct);
	var _file = file_text_open_write("complete.txt");
	file_text_write_string(_file, _completeData);
	file_text_close(_file);
	
	
	
}

else {
	
	// if the file exists, load it and read its variables
	var _file = file_text_open_read("complete.txt");
	var _json = file_text_read_string(_file);
	var _completeData = json_parse(_json);
	
	easyComp = _completeData.easy; 
	normalComp = _completeData.normal;
	hardComp = _completeData.hard;
	
	file_text_close(_file);
}

showCredits = false;
creditsNames = [
	["GAME PROGRAMMER", "GAVIN DENNIS"], 
	["CHARACTER DESIGNER", "GAVIN DENNIS"], 
	["LEVEL DESIGNER", "GAVIN DENNIS"], 
	["MUSIC COMPOSER", "GAVIN DENNIS"], 
	["QUALITY ASSURANCE", "ARI FERRARI"],
	["CREATIVE ASSISTANCE", "BRANDON DENNIS"],
	["PUBLIC PIXEL FONT", "BY GGBOTNET"],
	["INPUT6", "JUJU ADAMS, ALYNNE KEITH"],
	["SPECIAL THANKS", "KARL HARDY"],
	["CHARACTER INSPIRATION", "JAMES SCHRADER"]
];

soundtest = "OPERATION WARFARE";

function closeVid() {

	video_close() 
	audio_resume_all();
	alarm[0] = aTime;
	with (objStar) {image_alpha = 1};
	
}

