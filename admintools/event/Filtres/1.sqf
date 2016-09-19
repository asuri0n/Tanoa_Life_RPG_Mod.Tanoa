_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1, 1, 0, [0, 0, 0, -0.31],[1.9, 1.9, 1.73, 0.7],[0.2, 1.1, -1.5, 1.64]];
_hndl ppEffectCommit 0;