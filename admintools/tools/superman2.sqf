// Superman script by IDEO - Copyright 2014
//edited by S.lambert (add protection for missclic :p)
//Johnny 14nov2014 : Rocco veut garder sa tenue
_action = [
	format["Vous êtes sur le point d'activer le mode Superman version Rocco sans tenue bleue..<br/><br/><t color='#8cff9b'>Etes vous sur de vous l'activer?</t>"],
	"Activer le mode Superman?",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if (_action) then
{
	(FindDisplay 46) displayRemoveEventHandler ["keydown",SupermanHandler];
	_Stxt = parseText format
	["
	<t color='#ffff00' size='2' shadow='1' shadowColor='#000000' align='center'>SUPERMAN</t><br/>
	<t color='#99D5FF' size='2' shadow='1' shadowColor='#000000' align='center'>MOD</t><br/>
	<t color='#FF3B3E' size='2' shadow='1' shadowColor='#000000' align='center'> By IDEO</t><br/>
	<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Z		: Avancer</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> S		: Reculer</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> Espace	: Monter</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> C		: Descendre</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> X		: Stabiliser</t><br/>
	<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> -		: Désactiver</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> *		: Activer</t><br/>
	<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> PAGEUP	: Power UP</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> DOWN		: Power DOWN</t><br/>
	<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> R	: Pousser cible</t><br/>
	<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> CAPS	: exploser cible</t><br/>
	<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>---------------------------</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> F1	: Gravity PUSH</t><br/>
	<t color='#FFFFFF' size='1' shadow='1' shadowColor='#000000' align='left'> F2	: Gravity PULL</t><br/>
	<t color='#99EEFF' size='0.8' shadow='1' shadowColor='#000000' align='right'>Copyright 2014 by Ideo and Serrat</t><br/>
	"];
	hintSilent _Stxt;

	if (isNull player) exitwith {} ;
	player allowDamage false;
	activateSuperman = 1 ;
	speedPower = 5; // Puissance
	speedPowerTemp = speedPower;
	dokeyUp={
	     private ["_r","_key_delay","_max_height"] ;
		 _keyCodeUp = 57; // Espace
		 _keyCodeDown = 46; // C
		 _keyCodeForward = 17; // Z
		 _keyCodeBackward = 31; // S
		 _keyCodeLeft = 16; // Q
		 _keyCodeRight = 18; // D
		 _keyCodeStop = 45; // X
		 _keyCodeSwitchOFF = 74; // -
		 _keyCodeSwitchON = 55; // *
		 _keyCodePowerUP = 201; // PAGEUP
		 _keyCodePowerDOWN = 209; // PAGEDOWN
		 _keyCodePUSH = 19 ; // R
		 _keyCodeFIREon = 59  ; // F1
		 _keyCodeFIREoff = 60   ; // F2
		 //_keyCodeKill = 58   ; // CAPS

	//////////////////////////////////////////////////////////////////////////////      UP
		if ((_this select 1)  == _keyCodeUp && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player) then
		   {
			_vel = velocity player;
			_dir = direction player;
			player setVelocity [(_vel select 0),(_vel select 1),(_vel select 2)+speedPower];
	   };
	};
	//////////////////////////////////////////////////////////////////////////////      DOWN
		if ((_this select 1)  == _keyCodeDown && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player  && !isTouchingGround player) then
		   {
			_vel = velocity player;
			_dir = direction player;
			player setVelocity [(_vel select 0),(_vel select 1),(_vel select 2)-speedPower];
	   };
	};
	//////////////////////////////////////////////////////////////////////////////      FORWARD
		if ((_this select 1)  == _keyCodeForward && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player && !isTouchingGround player) then
		   {
		   player playMove "AmovPpneMstpSnonWnonDnon";
			_vel = velocity player;
			_dir = direction player;
			player setVelocity [(_vel select 0)+(sin _dir*speedPower),(_vel select 1)+(cos _dir*speedPower),(_vel select 2)];
	   };
	};
	//////////////////////////////////////////////////////////////////////////////      BACK
		if ((_this select 1)  == _keyCodeBackward && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player  && !isTouchingGround player) then
		   {
			_vel = velocity player;
			_dir = direction player;
			player setVelocity [(_vel select 0)-(sin _dir*speedPower),(_vel select 1)-(cos _dir*speedPower),(_vel select 2)];
	   };
	};
	//////////////////////////////////////////////////////////////////////////////     Stop
		if ((_this select 1)  == _keyCodeStop && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player  && !isTouchingGround player) then
		    {

			_vel = velocity player;
			_dir = direction player;
			_pos = position player;
			if  (_pos select 2 < 1) then
		   {
		   hint format ["%1", _pos];
		   player switchMove "Stand" ;
		   };
			player setVelocity [(_vel select 0)/2,(_vel select 1)/2,(_vel select 2)/2];
			};
	};

	//////////////////////////////////////////////////////////////////////////////     Switch OFF
		if ((_this select 1)  == _keyCodeSwitchOFF  && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player) then
		    {
				hint format["Superman désactivé"];
				activateSuperman = 0;
				speedPower = 0;
			};
	};

	//////////////////////////////////////////////////////////////////////////////     Switch ON
		if ((_this select 1)  == _keyCodeSwitchON  && activateSuperman == 0 ) then
	{
	       if  (player == vehicle player) then
		    {
				hint format["Superman activé"];
				activateSuperman = 1;
				speedPower = speedPowerTemp;
			};
	};

	//////////////////////////////////////////////////////////////////////////////     POWER UP
		if ((_this select 1)  == _keyCodePowerUP && activateSuperman == 1 ) then
	{
	       //if  (player == vehicle player) then
		    //{
			if ( speedPower < 20) then{
				speedPower = speedPower + 1;};
				cutText[format["Puissance =  %1",speedPower],"PLAIN"];
			//};
	};

	//////////////////////////////////////////////////////////////////////////////     POWER DOWN
		if ((_this select 1)  == _keyCodePowerDOWN && activateSuperman == 1 ) then
	{
	       if  (player == vehicle player) then
		    {
			if ( speedPower > 0) then{
				speedPower = speedPower - 1;};
			cutText[format["Puissance =  %1",speedPower],"PLAIN"];
			};
	};

	//////////////////////////////////////////////////////////////////////////////     PUSH
		if ((_this select 1)  == _keyCodePUSH && activateSuperman == 1 ) then
	{
			_velC = velocity cursorTarget;
			_dir = direction player;
			cursorTarget setVelocity [(_velC select 0)+(sin _dir*speedPower),(_velC select 1)+(cos _dir*speedPower),(_velC select 2)+(speedPower/5)];
	};

	//////////////////////////////////////////////////////////////////////////////     SUPERSAYEN ON
		if ((_this select 1)  == _keyCodeFIREon && activateSuperman == 1 ) then
	{
		{
		if (_x != player) then {
			_dir = [_x, player] call BIS_fnc_dirTo;
			_x setVelocity [sin _dir * random 10, cos _dir * random 10, speedPower / 2];
		};
		} forEach (position player nearObjects 100);
	//_explosion = "test_EmptyObjectForFireBig";
	//vfire = _explosion createVehicle[0,0,0];
	//vfire attachTo [player,[0,0,0], ""];
	};

	//////////////////////////////////////////////////////////////////////////////     SUPERSAYEN OFF
		if ((_this select 1)  == _keyCodeFIREoff && activateSuperman == 1 ) then
	{
		{
		if (_x != player) then {
			_dir = [player, _x] call BIS_fnc_dirTo;
			_x setVelocity [sin _dir * speedPower, cos _dir * speedPower, speedPower / 10];
		};
	} forEach (position player nearObjects 100);
	//detach vfire;
	//{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach (vfire nearObjects 10);
	//deleteVehicle vfire;
	};

	//////////////////////////////////////////////////////////////////////////////     Explosion
	/*	if ((_this select 1)  == _keyCodeKill && activateSuperman == 1 ) then
	{
	_cible = cursorTarget;
	_bomb1 = "HelicopterExploSmall" createVehicle(position _cible);
	};*/
	};

	waituntil {!(IsNull (findDisplay 46))};
	SupermanHandler = (FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyUp"];
};