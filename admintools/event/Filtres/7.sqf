_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1, 1, 0.01, [-0.11, -0.65, -0.76, 0.015],[-5, 2.74, 0.09, 0.95],[-1.14, -0.73, 1.14, -0.09]];
_hndl ppEffectCommit 0;