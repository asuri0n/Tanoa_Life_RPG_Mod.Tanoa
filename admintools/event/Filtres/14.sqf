_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [1, 1.04, -0.004, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.6, 0.5], [0.199, 0.587, 0.114, 0.0]];
_hndl ppEffectCommit 0;