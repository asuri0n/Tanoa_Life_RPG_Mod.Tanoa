while {true} do
{
  waitUntil {alive vehicle player};
 [] execVM "admintools\activate.sqf";
  waitUntil {!alive player};
};