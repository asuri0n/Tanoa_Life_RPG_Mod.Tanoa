/*
    File: fn_sake.sqf
    Author: Johnny

    Description:
    Saké effects (dédicace à Jeong Su).
*/

closeDialog 0;

//Activate

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

for "_i" from 0 to 59 do
{
    "chromAberration" ppEffectAdjust [random 0.50,random 0.50,true];
    "chromAberration" ppEffectCommit 1;
    "radialBlur" ppEffectAdjust  [random 0.05,random 0.05,0.30,0.30];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 4, 1, random 4];
    sleep 1;
};

//Stop
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;