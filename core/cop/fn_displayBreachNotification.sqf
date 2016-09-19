/*
	File: fn_displayBreachNotification.sqf
	Author: S.Lambert

	Description:
	Display breach Notification for cops
*/

if (isServer && isDedicated) exitWith {};

["BorderBreach",["Une brèche a été detectée dans le mur de la frontière !"]] call BIS_fnc_showNotification;
["notification", "QG Frontière", "Brèche dans un mur","Le système d'alerte de la frontière vient de s'activer, une brèche a été faite dans le mur! Empechez les de passer !"] call INVO_fnc_addNotification;