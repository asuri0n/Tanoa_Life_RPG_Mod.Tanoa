/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"life_liquide"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};

			case "rubanSecurite": {"life_inv_rubanSecurite"};
			case "cone": {"life_inv_cone"};
			case "barriere": {"life_inv_barriere"};
			case "barriereStop": {"life_inv_barriereStop"};
			case "hamburger": {"life_inv_hamburger"};
			case "frites": {"life_inv_frites"};
			case "cheeseburger": {"life_inv_cheeseburger"};
			case "cargoHq": {"life_inv_cargoHq"};
			case "ziptie": {"life_inv_ziptie"};
			case "defibrilateur": {"life_inv_defibrilateur"};
			case "kitmeth": {"life_inv_kitmeth"};
			case "crystalmeth": {"life_inv_crystalmeth"};
			case "poudrehydroxyde": {"life_inv_poudrehydroxyde"};
			case "crystalmethpur": {"life_inv_crystalmethpur"};
			case "archeologie": {"life_inv_archeologie"};
			case "archeologieillegale": {"life_inv_archeologieillegale"};
			case "rye": {"life_inv_rye"};
			case "hops": {"life_inv_hops"};
			case "yeast": {"life_inv_yeast"};
			case "cornmeal": {"life_inv_cornmeal"};
			case "bottles": {"life_inv_bottles"};
			case "bottledshine": {"life_inv_bottledshine"};
			case "bottledbeer": {"life_inv_bottledbeer"};
			case "bottledwhiskey": {"life_inv_bottledwhiskey"};
			case "beerp": {"life_inv_beerp"};
			case "whiskey": {"life_inv_whiskey"};
			case "mash": {"life_inv_mash"};
			case "hood": {"life_inv_hood"};
			case "machete": {"life_inv_machete"};
			case "conewithlight": {"life_inv_conewithlight"}; //added by komodo life_inv_conewithlight
			case "poison": {"life_inv_poison"}; //added by Serrat
			case "grapes": {"life_inv_grapes"}; //added by Komodo
			case "grapejuice": {"life_inv_grapejuice"};
			case "wine": {"life_inv_wine"};
			case "moonshine": {"life_inv_moonshine"};
			case "applecompote": {"life_inv_applecompote"};
			case "peachcompote": {"life_inv_peachcompote"};
			case "masonry_kit" : {"life_inv_masonry_kit"};
			case "cargo_hemtt" : {"life_inv_cargo_hemtt"};
			case "sake" : {"life_inv_sake"};
			case "nem" : {"life_inv_nem"};
			
			case "organp" : {"life_inv_organp"};
			case "organ" : {"life_inv_organ"};
			case "puranium": {"life_inv_puranium"};
			case "ipuranium": {"life_inv_ipuranium"};
			case "uranium1": {"life_inv_uranium1"};
			case "uranium2": {"life_inv_uranium2"};
			case "uranium3": {"life_inv_uranium3"};
			case "uranium4": {"life_inv_uranium4"};
			case "uranium": {"life_inv_uranium"};
			case "uranium2b": {"life_inv_uranium2b"};
			case "uranium3b": {"life_inv_uranium3b"};
			case "uranium4b": {"life_inv_uranium4b"};
			case "uranium5b": {"life_inv_uranium5b"};
			case "gpstracker": {"life_inv_gpstracker"};
	
			//**************************
			//********* NEW ************
			//**************************	
			case "goldp": {"life_inv_goldp"};	
			case "goldbarp": {"life_inv_goldbarp"};
			case "clayp": {"life_inv_clayp"};			
			case "briquep": {"life_inv_briquep"};
			case "diamantp": {"life_inv_diamantp"};	
			case "diamantpurp": {"life_inv_diamantpurp"};	
			case "ironorep": {"life_inv_ironorep"};	
			case "ironp": {"life_inv_ironp"};	
			case "charbonp": {"life_inv_charbonp"};	
			case "souffrep": {"life_inv_souffrep"};	
			case "poudrenoirp": {"life_inv_poudrenoirp"};			
			case "uraniump1": {"life_inv_uraniump1"};
			case "uraniump2": {"life_inv_uraniump2"};
			case "uraniump3": {"life_inv_uraniump3"};
			case "uraniump4": {"life_inv_uraniump4"};
			case "uraniump": {"life_inv_uraniumpurp"};
			case "oilpy": {"life_inv_oilpy"};	
			case "plastiquep": {"life_inv_plastiquep"};				
			case "boisp": {"life_inv_boisp"};				
			case "planchep": {"life_inv_planchep"};	
			case "linp": {"life_inv_linp"};	
			case "tissup": {"life_inv_tissup"};				
			case "cocainp": {"life_inv_cocainp"};	
			case "cocainpurp": {"life_inv_cocainpurp"};
			case "heroinpy": {"life_inv_heroinpy"};	
			case "heroinpurp": {"life_inv_heroinpurp"};
			case "marip": {"life_inv_marip"};
			case "maripurp": {"life_inv_maripurp"};	
			case "ossillp": {"life_inv_ossilp"};	
			case "osslp": {"life_inv_osslp"};	

			
			default {"";};
		};
	};

	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_liquide": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};

			case "life_inv_rubanSecurite": {"rubanSecurite"};
			case "life_inv_cone": {"cone"};
			case "life_inv_barriere": {"barriere"};
			case "life_inv_barriereStop": {"barriereStop"};
			case "life_inv_camonetLong": {"camonetLong"};
			case "life_inv_camonetLarge": {"camonetLarge"};
			case "life_inv_camonetRectangle": {"camonetRectangle"};
			case "life_inv_cargoHq": {"cargoHq"};
			case "life_inv_ziptie": {"ziptie"};
			case "life_inv_defibrilateur": {"defibrilateur"};
			case "life_inv_hamburger": {"hamburger"};
			case "life_inv_frites": {"frites"};
			case "life_inv_cheeseburger": {"cheeseburger"};
			case "life_inv_kitmeth": {"kitmeth"};
			case "life_inv_crystalmeth": {"crystalmeth"};
			case "life_inv_crystalmethpur": {"crystalmethpur"};
			case "life_inv_poudrehydroxyde": {"poudrehydroxyde"};
			case "life_inv_archeologieillegale": {"archeologieillegale"};
			case "life_inv_archeologie": {"archeologie"};
			case "life_inv_mash": {"mash"};
			case "life_inv_yeast": {"yeast"};
			case "life_inv_rye": {"rye"};
			case "life_inv_hops": {"hops"};
			case "life_inv_whiskey": {"whiskey"};
			case "life_inv_beerp": {"beerp"};
			case "life_inv_bottles": {"bottles"};
			case "life_inv_cornmeal": {"cornmeal"};
			case "life_inv_bottledwhiskey": {"bottledwhiskey"};
			case "life_inv_bottledbeer": {"bottledbeer"};
			case "life_inv_bottledshine": {"bottledshine"};
			case "life_inv_moonshine": {"moonshine"};
			case "life_inv_hood": {"hood"};
			case "life_inv_machete": {"machete"};
			case "life_inv_conewithlight": {"conewithlight"};
			case "life_inv_poison": {"poison"};
			case "life_inv_grapes": {"grapes"};
			case "life_inv_grapejuice": {"grapejuice"};
			case "life_inv_wine": {"wine"};
			case "life_inv_moonshine": {"moonshine"};
			case "life_inv_applecompote": {"applecompote"};
			case "life_inv_peachcompote": {"peachcompote"};
			case "life_inv_masonry_kit" : {"masonry_kit"};
			case "life_inv_cargo_hemtt" : {"cargo_hemtt"};
			case "life_inv_sake" : {"sake"};
			case "life_inv_nem" : {"nem"};
			
			case "life_inv_organp" : {"organp"};
			case "life_inv_organ" : {"organ"};	
			case "life_inv_ipuranium": {"ipuranium"};
			case "life_inv_uranium1": {"uranium1"};
			case "life_inv_uranium2": {"uranium2"};
			case "life_inv_uranium3": {"uranium3"};
			case "life_inv_uranium4": {"uranium4"};
			case "life_inv_uranium": {"uranium"};
			case "life_inv_uranium2b": {"uranium2b"};
			case "life_inv_uranium3b": {"uranium3b"};
			case "life_inv_uranium4b": {"uranium4b"};
			case "life_inv_uranium5b": {"uranium5b"}; 
			case "life_inv_gpstracker": {"gpstracker"};	
			
			//USED
			case "life_inv_puranium": {"puranium"};
			
			//**************************
			//********* NEW ************
			//**************************	
			case "life_inv_goldp": {"goldp"};	
			case "life_inv_goldbarp": {"goldbarp"};
			case "life_inv_clayp": {"clayp"};
			case "life_inv_briquep": {"briquep"};
			case "life_inv_diamantp": {"diamantp"};	
			case "life_inv_diamantpurp": {"diamantpurp"};	
			case "life_inv_ironorep": {"ironorep"};	
			case "life_inv_ironp": {"ironp"};	
			case "life_inv_charbonp": {"charbonp"};	
			case "life_inv_souffrep": {"souffrep"};	
			case "life_inv_poudrenoirp": {"poudrenoirp"};			
			case "life_inv_uraniump1": {"uraniump1"};
			case "life_inv_uraniump2": {"uraniump2"};
			case "life_inv_uraniump3": {"uraniump3"};
			case "life_inv_uraniump4": {"uraniump4"};
			case "life_inv_uraniumpurp": {"uraniump"};
			case "life_inv_oilpy": {"oilpy"};	
			case "life_inv_plastiquep": {"plastiquep"};				
			case "life_inv_boisp": {"boisp"};			
			case "life_inv_planchep": {"planchep"};	
			case "life_inv_linp": {"linp"};	
			case "life_inv_tissup": {"tissup"};			
			case "life_inv_cocainp": {"cocainp"};	
			case "life_inv_cocainpurp": {"cocainpurp"};			
			case "life_inv_heroinpy": {"heroinpy"};	
			case "life_inv_heroinpurp": {"heroinpurp"};			
			case "life_inv_marip": {"marip"};
			case "life_inv_maripurp": {"maripurp"};	
			
			default {"";};
		};
	};
};
