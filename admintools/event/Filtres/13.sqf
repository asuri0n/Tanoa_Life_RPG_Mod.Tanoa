_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1.0, 1, -0.003, [0.2, 0.15, -0.0, 0.125],[-2, -1.5, -1, 0.55],[-0.54, -0.53, 0.4, -0.09]];
_hndl ppEffectCommit 0;