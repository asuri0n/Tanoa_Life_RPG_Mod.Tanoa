_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1, 0.75, 0, [-3.16, 5, 5, 0],[-4.3, 5, 5, 1.28],[-2.96, 5, 5, 5]];
_hndl ppEffectCommit 0;