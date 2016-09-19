private ["_objs"];
_objs = [
	["Land_Castle_01_tower_F",[11517.9,21610,0],0,[[0,1,0],[0,0,1]],false],
	["Land_Church_01_V1_F",[11621.8,21524.5,0.0292969],254.091,[[-0.961698,-0.274112,0],[-0,0,1]],false],
	["Land_Grave_V2_F",[11596.1,21496.5,0],243.182,[[-0.892443,-0.45116,0],[-0,0,1]],false],
	["Land_Grave_memorial_F",[11604.5,21499.7,-0.0725746],153.636,[[0.444066,-0.895994,0],[0,-0,1]],false],
	["Land_Sun_chair_green_F",[11587.7,21495.4,0.28529],332.635,[[-0.459653,0.888098,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11589.3,21496.2,0.322144],332.635,[[-0.459653,0.888098,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11591.4,21497.4,0.339344],332.635,[[-0.459653,0.888098,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11593.1,21498.2,0.376183],332.635,[[-0.459653,0.888098,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11595.4,21499.2,0.393578],332.635,[[-0.459653,0.888098,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11597.2,21500.2,0.426575],332.635,[[-0.459653,0.888098,0],[0,0,1]],false],
	["Land_MilOffices_V1_F",[11593.5,21503.1,-0.167645],332.727,[[-0.458226,0.888836,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11577.4,21499.1,0.198303],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11578.9,21499.9,0.259289],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11574.8,21504.2,0.656235],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11576.4,21505,0.872471],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11580.2,21507,0.849365],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11581.8,21507.9,0.945415],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11584.6,21508.7,0.544876],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11586.4,21509.5,0.206612],333.09,[[-0.452593,0.891717,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11592.1,21513.8,0.259472],63.5443,[[0.895279,0.445506,0],[0,0,1]],false],
	["Land_Sun_chair_green_F",[11593.3,21511.4,0.153454],63.5443,[[0.895279,0.445506,0],[0,0,1]],false]
];

{
	private ["_obj"];
	_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
	if (_x select 4) then {
		_obj setDir (_x select 2);
		_obj setPos (_x select 1);
	} else {
		_obj setPosATL (_x select 1);
		_obj setVectorDirAndUp (_x select 3);
	};
} foreach _objs;