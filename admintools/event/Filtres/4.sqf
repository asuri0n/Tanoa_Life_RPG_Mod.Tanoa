_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ 1, 1, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.8],[1.43, 0.56, 3.69, 0.31]];
_hndl ppEffectCommit 0;