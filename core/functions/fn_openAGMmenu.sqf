/*
	Author: Komodo
	Filename: fn_openAGMmenu.sqf

	Description: Opens AGM menu and throw corresponding events.
	0: 0 for target, 1 for selft interaction menu.
*/

switch (_this select 0) do {
    case 0:
    {
    	[0, cursorTarget, ""] call AGM_Interaction_fnc_showMenu;
    	[player, "interactionMenuOpened", [player, cursorTarget, 0]] call AGM_Core_fnc_callCustomEventHandlers;
    };
    case 1:
    {
    	[1, AGM_player, ""] call AGM_Interaction_fnc_showMenu;
    	[player, "interactionMenuOpened", [player, cursorTarget, 1]] call AGM_Core_fnc_callCustomEventHandlers;
	};
};

