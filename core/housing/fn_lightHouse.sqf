/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells clients to either turn the lights on for that house
	or off.
*/

private["_light01","_light02","_light03","_light04","_light05","_light06","_light07","_light08","_light09","_light10","_exit"];
params [
	["_house",objNull,[objNull]],
	["_mode",false,[false]]
];

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

_exit = false;
if(_mode) then {
	_light01 = "#lightpoint" createVehicleLocal [0,0,0];
	_light02 = "#lightpoint" createVehicleLocal [0,0,0];
	_light03 = "#lightpoint" createVehicleLocal [0,0,0];
	_light04 = "#lightpoint" createVehicleLocal [0,0,0];
	_light05 = "#lightpoint" createVehicleLocal [0,0,0];
	_light06 = "#lightpoint" createVehicleLocal [0,0,0];
	_light07 = "#lightpoint" createVehicleLocal [0,0,0];
	_light08 = "#lightpoint" createVehicleLocal [0,0,0];
	_light09 = "#lightpoint" createVehicleLocal [0,0,0];
	_light10 = "#lightpoint" createVehicleLocal [0,0,0];
	
	switch(true) do {
	
		case ((typeOf _house) == "Land_School_01_F"): {
			_light01 lightAttachObject [_house,[-9.75,0.8,2.35]];
			_light02 lightAttachObject [_house,[-0.1,0.8,2.35]];
			_light03 lightAttachObject [_house,[9.63,0.8,2.35]];
			_light04 lightAttachObject [_house,[-9.75,-5.65,1.4]];
			_light05 lightAttachObject [_house,[-0.06,-5.65,1.4]];
			_light06 lightAttachObject [_house,[9.63,-5.65,1.4]];
		};
		
		case ((typeOf _house) == "Land_Shop_Town_01_F"): {
			_light01 lightAttachObject [_house,[0,-5.6,5.05]];
			_light02 lightAttachObject [_house,[-3.15,-6,-0.65]];
			_light03 lightAttachObject [_house,[0,-1,-0.08]];
			_light04 lightAttachObject [_house,[3.15,-6,-0.65]];
		};
		
		case ((typeOf _house) == "Land_Shop_Town_03_F"): {
			_light01 lightAttachObject [_house,[-4.2,-2.5,-0.17]];
			_light02 lightAttachObject [_house,[2.6,-2.5,-0.17]];
			_light03 lightAttachObject [_house,[-4.2,-8.34,-0.17]];
			_light04 lightAttachObject [_house,[4.2,-8.34,-0.17]];
		};
		
		case ((typeOf _house) == "Land_SM_01_shed_F"): {
			_light01 lightAttachObject [_house,[-1.65,3.5,4]];
			_light02 lightAttachObject [_house,[3.45,3.5,4]];
			_light03 lightAttachObject [_house,[8.55,3.5,4]];
			_light04 lightAttachObject [_house,[13.55,3.5,4]];
			_light05 lightAttachObject [_house,[-7,0.25,1.3]];
		};
		
		case ((typeOf _house) == "Land_i_Shed_Ind_F"): {
			_light01 lightAttachObject [_house,[-1.65,3.5,4]];
			_light02 lightAttachObject [_house,[3.45,3.5,4]];
			_light03 lightAttachObject [_house,[8.55,3.5,4]];
			_light04 lightAttachObject [_house,[13.55,3.5,4]];
			_light05 lightAttachObject [_house,[-7,0.25,1.3]];
		};		
		
		case ((typeOf _house) == "Land_Supermarket_01_F"): {
			_light01 lightAttachObject [_house,[-1.9,-2.9,1.4]];
			_light02 lightAttachObject [_house,[4.1,-2.9,1.4]];
			_light03 lightAttachObject [_house,[-2.9,-10.845,1.72]];
			_light04 lightAttachObject [_house,[1.15,-10.845,1.72]];
			_light05 lightAttachObject [_house,[5.1,-10.845,1.72]];
			_light06 lightAttachObject [_house,[-1.95,-13.9,2.18]];
			_light07 lightAttachObject [_house,[5.78,-13.9,2.35]];
		};
		
		case ((typeOf _house) == "Land_FuelStation_01_shop_F"): {
			_light01 lightAttachObject [_house,[-3.5,-2.5,1.1]];
			_light02 lightAttachObject [_house,[-1.8,2.97,1.1]];
			_light03 lightAttachObject [_house,[0.14,-2.5,1.1]];
			_light04 lightAttachObject [_house,[1.2,5.8,0.92]];
		};
		
		case ((typeOf _house) == "Land_FuelStation_02_workshop_F"): {
			_light01 lightAttachObject [_house,[-2.7,4,2.1]];
			_light02 lightAttachObject [_house,[2.5,4,2.1]];
			_light03 lightAttachObject [_house,[-2.6,-2.4,2]];
		};
		
		case ((typeOf _house) == "Land_Hotel_01_F"): {
			_light01 lightAttachObject [_house,[-1,0,-2]];
			_light02 lightAttachObject [_house,[-1,0.8,1.4]];
			_light03 lightAttachObject [_house,[-0.8,1,4.2]];
			_light04 lightAttachObject [_house,[-0.8,-3,7.2]];			
			_light05 lightAttachObject [_house,[-4.75,-5.92,-1.9]];
			_light06 lightAttachObject [_house,[3.1,-5.92,-1.9]];
			_light07 lightAttachObject [_house,[-0.8,-5.25,7.3]];
		};
		
		case ((typeOf _house) == "Land_Hotel_02_F"): {
			_light01 lightAttachObject [_house,[-2,-8,-0.6]];
			_light02 lightAttachObject [_house,[6,1.1,-0.3]];
			_light03 lightAttachObject [_house,[-2,9.9,-0.6]];
			_light04 lightAttachObject [_house,[-0.5,1.1,2.75]];			
			_light05 lightAttachObject [_house,[6,-10,-0.4]];
			_light06 lightAttachObject [_house,[10,1,0.9]];
			_light07 lightAttachObject [_house,[6,11.9,-0.4]];
		};
		
		case ((typeOf _house) == "Land_House_Big_03_F"): {
			_light01 lightAttachObject [_house,[5.5,0.5,2.64]];
			_light02 lightAttachObject [_house,[6,-3,-0.4]];			
			_light03 lightAttachObject [_house,[12,0.35,2.55]];
			_light04 lightAttachObject [_house,[11.73,2.14,-0.67]];
		};
		
		case ((typeOf _house) == "Land_House_Big_04_F"): {
			_light01 lightAttachObject [_house,[-0.69,2.9,3.1]];
			_light02 lightAttachObject [_house,[-1,-0.2,3.1]];			
			_light03 lightAttachObject [_house,[-1,-3.36,-0.3]];
			_light04 lightAttachObject [_house,[-6.97,-0.23,-0.36]];			
		};
		
		case ((typeOf _house) == "Land_House_Big_02_F"): {
			_light01 lightAttachObject [_house,[-8,1.5,1.4]];
			_light02 lightAttachObject [_house,[2.5,2.45,1.4]];			
			_light03 lightAttachObject [_house,[-2.5,7,1.9]];
			_light04 lightAttachObject [_house,[7.71,0.267,1.98]];			
		};
		
		case ((typeOf _house) == "Land_Addon_04_F"): {
			_light01 lightAttachObject [_house,[-0.6,0.5,3.35]];
			_light02 lightAttachObject [_house,[-1.8,-4.8,3.55]];			
			_light03 lightAttachObject [_house,[2.2,-4.5,3.55]];
			_light04 lightAttachObject [_house,[-5.5,3.57,-0.05]];
			_light05 lightAttachObject [_house,[5.3,2.96,-0.05]];			
		};
		
		case ((typeOf _house) == "Land_House_Big_01_F"): {
			_light01 lightAttachObject [_house,[-0.6,0.5,3.35]];
			_light02 lightAttachObject [_house,[-1.8,-4.8,3.55]];			
		};
		
		case ((typeOf _house) == "Land_House_Small_04_F"): {
			_light01 lightAttachObject [_house,[-0.65,1.8,2.3]];
			_light02 lightAttachObject [_house,[-5,-0.3,1.5]];
			_light03 lightAttachObject [_house,[1,-2.35,2.55]];
			_light04 lightAttachObject [_house,[1,-7,1.9]];
		};	
		
		case ((typeOf _house) == "Land_House_Small_06_F"): {
			_light01 lightAttachObject [_house,[-1.08,5.3,1.4]];
			_light02 lightAttachObject [_house,[-1.15,-1.5,2.7]];
		};
		
		case ((typeOf _house) == "Land_House_Small_05_F"): {
			_light01 lightAttachObject [_house,[-1.134,-4.8,1.49]];
			_light02 lightAttachObject [_house,[-1.12,1.93,2.55]];
		};
		
		case ((typeOf _house) == "Land_House_Small_03_F"): {
			_light01 lightAttachObject [_house,[-4,1.6,2.6]];
			_light02 lightAttachObject [_house,[-0.35,1.6,2.6]];
		};
		
		case ((typeOf _house) == "Land_House_Small_02_F"): {
			_light01 lightAttachObject [_house,[-1.88,3.3,2.32]];
			_light02 lightAttachObject [_house,[-1.88,-3.3,2.32]];
		};
		
		case ((typeOf _house) == "Land_Slum_03_F"): {
			_light01 lightAttachObject [_house,[-2.4,-3.03,2.05]];
			_light02 lightAttachObject [_house,[-2.4,4.5,2.05]];
			_light03 lightAttachObject [_house,[3.307,-3.03,2.05]];
			_light04 lightAttachObject [_house,[3.307,2.9,2.05]];
		};
		
		case ((typeOf _house) == "Land_GarageShelter_01_F"): {
			_light01 lightAttachObject [_house,[-2.37,0.4,1.5]];
			_light02 lightAttachObject [_house,[2.5,0.4,1.7]];
		};
		
		case ((typeOf _house) == "Land_Slum_01_F"): {
			_light01 lightAttachObject [_house,[1.95,-0.05,2.98]];
		};
		
		case ((typeOf _house) == "Land_Shed_05_F"): {
			_light01 lightAttachObject [_house,[0.03,-0.63,1.95]];
		};
		
		case ((typeOf _house) == "Land_Shed_02_F"): {
			_light01 lightAttachObject [_house,[0,0.75,1.6]];
		};		
		_exit = true;
	};
	
	if(_exit) exitWith {
		deleteVehicle _light01; 
		deleteVehicle _light02;
		deleteVehicle _light03;
		deleteVehicle _light04;
		deleteVehicle _light05;
		deleteVehicle _light06; 
		deleteVehicle _light07;
		deleteVehicle _light08;
		deleteVehicle _light09;
		deleteVehicle _light10;		
	};
	
	_light01 setLightColor [255,255,255];
	_light01 setLightAmbient [1,1,0.2];
	_light01 setLightAttenuation [1,0,0,0];
	_light01 setLightIntensity 0.5;
	_light01 setLightUseFlare true;
	_light01 setLightFlareSize 0.1;
	_light01 setLightFlareMaxDistance 50;
	_house setVariable["light01",_light01];
	
	_light02 setLightColor [255,255,255];
	_light02 setLightAmbient [1,1,0.2];
	_light02 setLightAttenuation [1,0,0,0];
	_light02 setLightIntensity 0.5;
	_light02 setLightUseFlare true;
	_light02 setLightFlareSize 0.1;
	_light02 setLightFlareMaxDistance 50;
	_house setVariable["light02",_light02];
	
	_light03 setLightColor [255,255,255];
	_light03 setLightAmbient [1,1,0.2];
	_light03 setLightAttenuation [1,0,0,0];
	_light03 setLightIntensity 0.5;
	_light03 setLightUseFlare true;
	_light03 setLightFlareSize 0.1;
	_light03 setLightFlareMaxDistance 50;
	_house setVariable["light03",_light03];
	
	_light04 setLightColor [255,255,255];
	_light04 setLightAmbient [1,1,0.2];
	_light04 setLightAttenuation [1,0,0,0];
	_light04 setLightIntensity 0.5;
	_light04 setLightUseFlare true;
	_light04 setLightFlareSize 0.1;
	_light04 setLightFlareMaxDistance 50;
	_house setVariable["light04",_light04];	
	
	_light05 setLightColor [255,255,255];
	_light05 setLightAmbient [1,1,0.2];
	_light05 setLightAttenuation [1,0,0,0];
	_light05 setLightIntensity 0.5;
	_light05 setLightUseFlare true;
	_light05 setLightFlareSize 0.1;
	_light05 setLightFlareMaxDistance 50;
	_house setVariable["light05",_light05];	
	
	_light06 setLightColor [255,255,255];
	_light06 setLightAmbient [1,1,0.2];
	_light06 setLightAttenuation [1,0,0,0];
	_light06 setLightIntensity 0.5;
	_light06 setLightUseFlare true;
	_light06 setLightFlareSize 0.1;
	_light06 setLightFlareMaxDistance 50;
	_house setVariable["light06",_light06];
	
	_light07 setLightColor [255,255,255];
	_light07 setLightAmbient [1,1,0.2];
	_light07 setLightAttenuation [1,0,0,0];
	_light07 setLightIntensity 0.5;
	_light07 setLightUseFlare true;
	_light07 setLightFlareSize 0.1;
	_light07 setLightFlareMaxDistance 50;
	_house setVariable["light07",_light07];
	
	_light08 setLightColor [255,255,255];
	_light08 setLightAmbient [1,1,0.2];
	_light08 setLightAttenuation [1,0,0,0];
	_light08 setLightIntensity 0.5;
	_light08 setLightUseFlare true;
	_light08 setLightFlareSize 0.1;
	_light08 setLightFlareMaxDistance 50;
	_house setVariable["light08",_light08];
	
	_light09 setLightColor [255,255,255];
	_light09 setLightAmbient [1,1,0.2];
	_light09 setLightAttenuation [1,0,0,0];
	_light09 setLightIntensity 0.5;
	_light09 setLightUseFlare true;
	_light09 setLightFlareSize 0.1;
	_light09 setLightFlareMaxDistance 50;
	_house setVariable["light09",_light09];
	
	_light10 setLightColor [255,255,255];
	_light10 setLightAmbient [1,1,0.2];
	_light10 setLightAttenuation [1,0,0,0];
	_light10 setLightIntensity 0.5;
	_light10 setLightUseFlare true;
	_light10 setLightFlareSize 0.1;
	_light10 setLightFlareMaxDistance 50;
	_house setVariable["light10",_light10];	
} else {
	if(isNull (_house getVariable["light01",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light02",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light03",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light04",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light05",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light06",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light07",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light08",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light09",ObjNull])) exitWith {};
	if(isNull (_house getVariable["light10",ObjNull])) exitWith {};	
	
	deleteVehicle (_house getVariable["light01",ObjNull]);
	deleteVehicle (_house getVariable["light02",ObjNull]);
	deleteVehicle (_house getVariable["light03",ObjNull]);
	deleteVehicle (_house getVariable["light04",ObjNull]);
	deleteVehicle (_house getVariable["light05",ObjNull]);
	deleteVehicle (_house getVariable["light06",ObjNull]);
	deleteVehicle (_house getVariable["light07",ObjNull]);
	deleteVehicle (_house getVariable["light08",ObjNull]);
	deleteVehicle (_house getVariable["light09",ObjNull]);
	deleteVehicle (_house getVariable["light10",ObjNull]);	
}; 