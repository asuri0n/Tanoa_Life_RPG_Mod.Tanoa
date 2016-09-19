////////////////////////////////////
//      Script Made By            //
//      Ideo for Altis-azura      //
////////////////////////////////////
			player removeAction comatage;
			comatage = player addaction ["<t color='#FFFF99'>Decuver</t>","admintools\Objet\Boissons\coma.sqf"];

			_ColCor = ppEffectCreate ["colorCorrections", 1501];
			_ColCor ppEffectEnable true; 			
			_ColCor ppEffectAdjust [1, 1.04, -0.004, [0.05, 0.1, 0.2, 0.0], [1, 0.8, 0.6, 0.5], [0.199, 0.587, 0.114, 0.0]]; 
			_ColCor ppEffectCommit 20;	
			
			_ChrAbe = ppEffectCreate ["chromAberration", 1502];
			_ChrAbe ppEffectEnable true;			
			_ChrAbe ppEffectAdjust [0.15,0.15,true]; 
			_ChrAbe ppEffectCommit 30;	
			

			
			5 fadeSound 0.1;
			player setFatigue 1;
			
			_RadBlu = ppEffectCreate ["radialBlur", 1503];
			_RadBlu ppEffectEnable true;					
			_RadBlu ppEffectAdjust [0.04,0.04,0.15,0.15]; 
			_RadBlu ppEffectCommit 30;	
			
			addCamShake [100, 800, 0.4];	
	
			addCamShake [80, 600, 0.3];	
			sleep (5); 					
			addCamShake [50, 600, 0.2];