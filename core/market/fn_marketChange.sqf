/*
	filename: fn_marketChange.sqf
	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference","_line","_startTime"];

_startTime = diag_ticktime;
_rand = [0,106] call life_fnc_randomRound; //0-200

/*

	HINWEIS: obige Zahl in random erhöhen, um alle ereignisse seltener zu machen!

*/

diag_log format["MARKET LOG: %1",life_market_log];

//Partie Systématique: retour des valeurs à l'origine
//diag_log format["[MARKET] marketChange did nothing. Rand=%1", _rand];
{
	//Get default price
	_defaultprice = _x select 2;
	_shortname = _x select 1;
	_price = _x select 3;
	_globalchange = _x select 9;


	if(_defaultprice > 0) then
	{

		//Get difference
		_difference = _defaultprice - _price; //Defaultprice - current price

		_modifier = _difference * (random 0.3);
		_modifier = round _modifier;

		//Protecting hard caps
		diag_log format["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];

		_price = _price + _modifier;
		_globalchange = _globalchange + _modifier;

		//New price arr
		_line = life_market_prices_V2 select _forEachIndex;
		_line set [3, _price];
		_line set [8, true];
		_line set [9, _globalchange];
		_line set [10, _modifier];
		life_market_prices_V2 set [_forEachIndex, _line]; //set raw values

	}
	else
	{
		diag_log format["+Market+ Cannot correct market value of %1", _shortname];
	};
}
foreach life_market_prices_V2;
publicVariable "life_market_prices_V2";

// Komodo: Partie aléatoire
switch(true) do
{
	//Augmentation du prix des drogues (6%)
	case (_rand <= 6):
	{
		/*
		[[0,"News: Rapeurs louches en vacances sur l'ile, les prix des drogues sont en hausse!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		*/

		[["notification", "Market System", "[News]","Rapeurs louches en vacances sur l'ile, les prix des drogues sont en hausse!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["cocainpurp", [2000,4000] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["maripurp", [1000,3000] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["heroinpurp", [3000,10000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event drugp";
	};

	//Baisse des prix des drogues (6%)
	case (_rand <= 12):
	{
		/*
		[[0,"News:Légalisation des drogues au Pérou, les prix vont baisser!",true,false] spawn life_fnc_MP;
		*/

		[["notification", "Market System", "[News]","Légalisation des drogues au Pérou, les prix vont baisser!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["cocainpurp", [500,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["maripurp", [500,1000] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["heroinpurp", [1000,6000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event drugm";
	};
	//Augmentation du prix de la tortue (6%)
	case (_rand <= 18):
	{
		[["notification", "Market System", "[News]","Il y a apparement de moins en moins de morts par balles. Augmentation du prix de la poudre!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["turtle", [3000,10000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event turtlep Buy";
	};
	//Baisse du prix de la tortue (6%)
	case (_rand <= 24):
	{
		[["notification", "Market System", "[News]","Le nouveau gouvernement ne plait pas a la rebellion... Diminution du prix de la poudre"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["turtle", [100,10000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event turtlep Sell";
	};
	//Augmentation du prix du pétrole (6%)
	case (_rand <= 30):
	{
		[["notification", "Market System", "[News]","Pénurie de SP 95 !! Augmentation du prix du pétrole!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["oilpy", [1000,3000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event oilpy";
	};
	//Baisse du prix du pétrole (6%)
	case (_rand <= 36):
	{
		[["notification", "Market System", "[News]","L'OPEP rouvre les vannes, baisse du prix du pétrole!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["oilpy", [500,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event oilpy";
	};
	//Augmentation du prix des matériaux (6%)
	case (_rand <= 42):
	{
		[["notification", "Market System", "[News]","Attentat sur l'usine de compote des MT, augmentation du prix des matières de construction!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["briquep", [500,1500] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["ironp", [500,1500] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event wcc";
	};
	//Baisse du prix des matériaux (6%)
	case (_rand <= 48):
	{
		[["notification", "Market System", "[News]","Attentat sur l'usine de compote des MT, augmentation du prix des matières de construction!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["briquep", [500,1000] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["ironp", [500,1000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event wcc";
	};
	case (_rand <= 54): //6% Archéologie
	{
		[["notification", "Market System", "[News]","Disparition d'Indiana Jones, les prix de l'archéologie sont en hausse!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["archeologie", [500,3000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event archeo";
	};
	case (_rand <= 60): //6% Archéologie
	{
		[["notification", "Market System", "[News]","Vol de musées, le marché est saturé, les prix de l'archéologie sont en baisse!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["archeologie", [500,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event archeo";
	};
	case (_rand <= 66): //6% Diamant
	{
		[["notification", "Market System", "[News]","Visite d'un Prince Saoudien, le prix du diamant est en hausse!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["diamantpurp", [1000,3000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event archeo";
	};
	case (_rand <= 72): //6% Diamant
	{
		[["notification", "Market System", "[News]","Vol de musées, le marché est saturé, les prix de l'archéologie sont en baisse!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["diamantpurp", [1000,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event archeo";
	};
	case (_rand <= 78): //6% uraniump
	{
		[["notification", "Market System", "[News]","L'uranium se fait rare ... Augmentation du prix !"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["uraniump", [1000,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event uraniump";
	};
	case (_rand <= 84): //6% uraniump
	{
		[["notification", "Market System", "[News]","Un gisement d'uranium a été trouvé ! Diminution du prix"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["uraniump", [1000,2000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event uraniump";
	};
	case (_rand <= 90): //6% tissup
	{
		[["notification", "Market System", "[News]","Les chinois en grève! Le prix du textile monte !"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["tissup", [1000,2000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event tissup";
	};
	case (_rand <= 96): //6% tissup
	{
		[["notification", "Market System", "[News]","Les chinois on enfin repris le travail! Le prix du textile baisse !"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["tissup", [1000,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event tissup";
	};
	case (_rand <= 102): 
	{
		[["notification", "Market System", "[News]","Les pompes funébres ont fermés, augmentation du prix des organes!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["organp", [1000,2000] call life_fnc_randomRound, true] call life_fnc_marketBuy;

		diag_log "+Market+ Event organ";
	};
	case (_rand <= 108): 
	{
		[["notification", "Market System", "[News]","L'hiver a été trés froid, beaucoups de vieux sont décédés, diminution du prix des organes!"],"INVO_fnc_addNotification",civilian,false] spawn life_fnc_MP;

		["organp", [500,2000] call life_fnc_randomRound, true] call life_fnc_marketSell;

		diag_log "+Market+ Event organ";
	};
};

diag_log format ["INVO MARKET CHANGE duration: %1", diag_ticktime - _startTime];
