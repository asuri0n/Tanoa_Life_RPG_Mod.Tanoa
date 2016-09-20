#include <macro.h>
/*
    File: fn_antiAFK.sqf
    Author: Ladislas
    Date : 18/10/2014

    Description:
    Anti-AFK which kick player after x minutes

    https://community.bistudio.com/wiki/DIK_KeyCodes
*/

private ["_idletime, _tps, _actuPos, _dist, _distAparcour, _tpsDepuisRespawn, _tpsRest"];

while{true} do
{

    _idletime = 60*30; //60 sec * 30 = 30 minutes
    _tps = time;
    _actuPos = getPosATL player;
    _distAparcour = 2; //10m
    _dist = 0;

    while{true} do
    {
        sleep 5;

        if(player getvariable["FAR_isUnconscious",0] == 1 OR (player getVariable "restrained")) exitwith{}; //si une personne est menottée elle ne rentre pas dans la boucle
        if (license_civ_presse) exitWith {}; //False si journaliste
        if (__GETC__(life_adminlevel) != 0) exitWith {}; //False if admin

        _tpsDepuisRespawn = round abs (time - _tps);
        _tpsRest = _idletime - _tpsDepuisRespawn;
        _dist = _actuPos distance getPosATL player;

        if(_tpsDepuisRespawn > _idletime) then { failMission "LOSER"; };
        if(_dist > _distAparcour) exitwith{};
    };
    sleep 15; //fonction appelée toutes les 15 secondes
};
