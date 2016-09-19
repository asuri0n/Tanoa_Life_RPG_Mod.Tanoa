_player = _this select 1;
_player removeAction ActionPompes;
_player removeAction ActionKarate;
ActionPompes = _player addaction ["<t color='#FFFF55'>Faire des pompes</t>","admintools\Objet\Construction\Pompes.sqf"];
ActionKarate = _player addaction ["<t color='#FFFF55'>Faire des kata</t>","admintools\Objet\Construction\Kata.sqf"];