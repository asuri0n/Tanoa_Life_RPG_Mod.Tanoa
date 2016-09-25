/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{	case "oilu": {5};
	case "oilp": {4};
	case "heroinu": {5};
	case "heroinp": {4};
	case "cannabis": {5};
	case "marijuana": {4};
	case "diamond": {5};
	case "diamondc": {4};
	case "cocaine": {5};
	case "cocainep": {4};
	case "sand": {5};
	case "glass": {4};
	case "salt": {5};
	case "salt_r": {4};
	case "rock": {5};
	case "cement": {4};
	case "copperore": {5};
	case "copper_r": {4};
	case "ironore": {5};
	case "iron_r": {4};

	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {5};
	case "fishing": {2};
	case "turtlesoup": {4};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "spikeStrip": {10};
	case "goldbar": {12};

//AJOUTE PAR RAPPORT A LA VERSION DE BASE
	case "kitmeth": {5};
	case "poudrehydroxyde": {4};
	case "crystalmeth": {4};
	case "crystalmethpur": {4};
	case "archeologie": {4};
	case "archeologieillegale": {5};
	case "barriere": {10};
	case "barriereStop": {15};
	case "ziptie": {15};
	case "defibrilateur": {40};
	case "hamburger": {2};
	case "frites": {2};
	case "cheeseburger": {2};
	case "rye": {2};
	case "hops": {2};
	case "yeast": {2};
	case "cornmeal": {2};
	case "mash": {2};
	case "whiskey": {4};
	case "beerp": {4};
	case "bottledwhiskey": {5};
	case "bottledbeer": {5};
	case "bottledshine": {5};
	case "bottles": {1};
	case "machete": {1};
	case "conewithlight": {1};
	case "poison": {30};
	case "grapes": {5};
	case "grapejuice": {4};
	case "wine": {4};
	case "moonshine": {4};
	case "applecompote": {0.5};
	case "peachcompote": {0.5};
	case "masonry_kit" : {20};
	case "cargo_hemtt" : {450};

	case "puranium": {2}; // <--------You Can Change the Pound of the Item(s) in Game
	case "ipuranium": {2}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium1": {2}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium2": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium3": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium4": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium2b": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium3b": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium4b": {4}; // <--------You Can Change the Pound of the Item(s) in Game
	case "uranium5b": {4}; // <--------You Can Change the Pound of the Item(s) in Game

	case "fishp" : {1};
	case "boisp" : {5};
	case "planchep" : {3};
	case "linp" : {2};
	case "tissup" : {1};
	case "charbonp" : {1};
	case "poudrenoirp" : {1};
	case "briquep" : {3};
	case "clayp" : {5};
	case "souffrep" : {5};
	case "cocainp" : {5};
	case "cocainpurp" : {3};
	case "heroinpy" : {5};
	case "heroinpurp" : {3};
	case "marip" : {5};
	case "maripurp" : {3};
	case "uraniump" : {2};
	case "copperorep" : {5};
	case "goldp" : {5};
	case "goldbarp" : {3};
	case "ironorep" : {5};
	case "ironp" : {3};
	case "diamantp" : {5};
	case "diamantpurp" : {3};
	case "oilpy" : {5};
	case "plastiquep" : {3};

	case "uraniump2" : {3};
	case "uraniump3" : {3};
	case "uraniump4" : {3};

	case "organp" : {5};
	case "organ" : {5};

	case "osslp" : {5};
	case "ossillp" : {5};

	case "gpstracker": {25};

	default {1};
};
