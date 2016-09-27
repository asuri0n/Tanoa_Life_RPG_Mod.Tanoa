////////////////////////////////////
//      Script Made By            //
//      Ideo for Altis-azura      //
////////////////////////////////////

			player removeAction comatage;

			_ColCor = ppEffectCreate ["colorCorrections", 1501];
			_ChrAbe = ppEffectCreate ["chromAberration", 1502];
			_RadBlu = ppEffectCreate ["radialBlur", 1503];

			player playActionNow "PlayerProne";			
			player playMoveNow "Incapacitated";
			_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
			_obj setPosATL (getPosATL player);
			player attachTo [_obj,[0,0,0]];
			
            cutText["Vous faites un coma ethylique","BLACK OUT",4];
			sleep 10;
			player switchMove "KIA_gunner_static_low01";		
			cutText["","BLACK IN",4];
			
			resetCamShake;
			_ColCor ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [1,1,1,1]]; 
			_ColCor ppEffectCommit 10;

			_ChrAbe ppEffectAdjust [0,0,true]; 
			_ChrAbe ppEffectCommit 10;	

			_RadBlu ppEffectAdjust [0,0,0.15,0.15]; 
			_RadBlu ppEffectCommit 20;
		
			sleep (20); 	
			ppEffectDestroy _ColCor;
			ppEffectDestroy _ChrAbe;
			ppEffectDestroy _RadBlu ;		
			20 fadeSound 1; //fades the sound back to normal
			
			player switchMove "AmovPpneMrunSnonWbinDf";			

			player playMoveNow "amovppnemstpsraswrfldnon";
			detach player;
			deleteVehicle _obj;		
