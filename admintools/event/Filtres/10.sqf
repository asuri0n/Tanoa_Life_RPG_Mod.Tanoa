_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1.2,0.85],[1,1,-2.5,0]];
_hndl ppEffectCommit 0;