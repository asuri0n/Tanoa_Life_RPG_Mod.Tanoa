_dir = direction player;

player SwitchMove "GetInHemttBack"; 
waitUntil { ((animationState player) != "GetInHemttBack") };
player setPos [(sin _dir)* 2 + (getPos player select 0),(cos _dir)* 2 + (getPos player select 1), (getPos player select 2) +2];
player SwitchMove "GetOutHelicopterCargo";