_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]];
_hndl ppEffectCommit 0;