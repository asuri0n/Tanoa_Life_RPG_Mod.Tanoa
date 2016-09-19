/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],

	["oilp", 3700, 500, 6500, 6, 1,
		[
			["diamondc",1],
			["iron_r",1],
			["salt_r",1],
			["glass",1]
		]
	],

	["iron_r", 2300, 500, 5000, 6, 1,
		[
			["oilp",1],
			["copper_r",1],
			["archeologie",1],
			["cement",1]
		]
	],
	["archeologie", 3000, 500, 6000, 10, 1,
		[
			["diamondc",1],
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["iron_r",1],
			["cement",1],
			["glass",1]
		]
	],
	["diamondc", 4000, 5000, 8000, 6, 1,
		[
			["oilp",1],
			["salt_r",1],
			["archeologie",1],
			["cement",1],
			["glass",1]
		]
	],

	["copper_r", 2300, 5000, 5000, 6, 1,
		[
			["oilp",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		]
	],

	["salt_r", 2500, 500, 7500, 6, 1,
		[
			["diamondc",1],
			["oilp",1],
			["iron_r",1],
			["archeologie",1],
			["copper_r",1],
			["cement",1],
			["glass",1]
		]
	],

	["glass", 2300, 500, 7500, 5, 1,
		[

			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1]
		]
	],

	["cement", 1550, 500, 6500, 5, 1,
		[
			["diamondc",1],
			["oilp",1],
			["archeologie",1],
			["iron_r",1],
			["copper_r",1]
		]
	],

	///////////////////////////////////

	["turtle", 12500, 0, 30000, 50, 12,
		[
			["marijuana",1],
			["cocainep",1],
			["crystalmethpur",1],
			["heroinp",1]
		]
	],

	["marijuana", 3800, 0, 9000, 30, 7,
		[
			["turtle",1],
			["cocainep",1],
			["crystalmethpur",1],
			["heroinp",1]
		]
	],

	["cocainep", 5900, 0, 15000, 30, 7,
		[
			["marijuana",1],
			["turtle",1],
			["crystalmethpur",1],
			["heroinp",1]
		]
	],
	["crystalmethpur", 9750, 0, 28000, 100, 30,
		[
			["marijuana",1],
			["turtle",1],
			["cocainep",1],
			["heroinp",1]
		]
	],
	["heroinp", 4800, 0, 13500, 25, 5,
		[
			["marijuana",1],
			["cocainep",1],
			["crystalmethpur",1],
			["turtle",1]
		]
	]
];
publicVariable "life_market_resources";

/*
////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
*/
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{

		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;

	publicVariable "life_market_prices";

	systemChat "Market Prices Generated!";
//};

//Market loging system by Komodo
life_market_log = [
	//Schema: Shortname, Total base quantity, Number of transactions, Average Players
	//["gold", 1500, 450, 2300, 8, 5],

	["oilp", 0, 0, 0],
	["iron_r", 0, 0, 0],
	["archeologie", 0, 0, 0],
	["diamondc", 0, 0, 0],
	["copper_r", 0, 0, 0],
	["salt_r", 0, 0, 0],
	["glass", 0, 0, 0],
	["cement", 0, 0, 0],

	///////////////////////////////////

	["turtle", 0, 0, 0],
	["marijuana", 0, 0, 0],
	["cocainep", 0, 0, 0],
	["crystalmethpur", 0, 0, 0],
	["heroinp", 0, 0, 0]
];
publicVariable "life_market_log";