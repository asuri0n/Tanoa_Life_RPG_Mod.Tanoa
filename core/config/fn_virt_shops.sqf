/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Marché",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","machete","fuelF","peach","planchep","boltcutter","storagesmall","storagebig","cornmeal","bottles","tissup"]]};
	case "hunter": {["Marché",["water","rabbit","apple","redgull","tbacon","pickaxe","machete","fuelF","peach","hood"]]};
	case "rebel": {["Marché Rebelle",["ziptie","boltcutter","blastingcharge","hood"]]};
	case "gang": {["Marché Gang", ["blastingcharge","boltcutter","hood"]]};
	case "wongs": {["Marché donateur", ["blastingcharge","boltcutter","hood"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Marchand de drogues",["cocainpurp","heroinpurp","maripurp"]]};
	case "oil": {["Marchand petrole",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Poissonnier",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Marchand de verre",["glass"]]};
	case "iron": {["Marchand de fer et cuivre",["iron_r","copper_r"]]};
	case "diamond": {["Diamantaire",["diamond","diamondc"]]};
	case "salt": {["Marchand de sel",["salt_r"]]};
	case "cop": {["Magasin poulet",["ziptie","donuts","coffee","spikeStrip","barriere","barriereStop","water","rabbit","apple","redgull","fuelF","defusekit","hood","bottledbeer","bottledwhiskey","lockpick","blastingcharge"]]};
	case "cement": {["Marchand de ciment",["cement"]]};
	case "med": {["Marché medecin",["barriere","barriereStop","bottledwhiskey","bottledbeer","water","rabbit","fuelF","redgull","lockpick","conewithlight","masonry_kit"]]};
	case "dep": {["Marché dépanneur",["water","rabbit","fuelF","redgull","barriere","barriereStop","lockpick","conewithlight","masonry_kit","bottledbeer","bottledwhiskey"]]};
	case "pharmacie": {["Pharmacie d'Altis",["kitmeth","puranium"]]};
	case "meth": {["Tuco",["crystalmeth","crystalmethpur"]]};
	case "archeologie": {["Vendeur d'archeologie",["archeologie"]]};
	case "redburger": {["RedBurger",["hamburger", "frites", "cheeseburger"]]};
	case "bar": {["The Lounge",["bottledbeer","bottledwhiskey"]]};
	case "speakeasy": {["Speakeasy's",["bottledwhiskey","bottledshine","moonshine"]]};
	case "turtle": {["Marchand Chinois",["turtle"]]};
	case "gold": {["Acheteur d'or",["goldbar"]]};
	case "juices": {["Acheteur de Jus",["grapejuice"]]};
	case "wine": {["Acheteur d'Alcool",["wine","bottledbeer","bottledwhiskey"]]};
	case "compote": {["Négociant en Compote",["applecompote","peachcompote"]]};
	case "organ": {["Acheteur d'organes",["organp"]]};
	case "mcuranium": {["Acheteur Uranium",["uraniump"]]};	
	case "iuranium": {["Marchant Purificateur",["puranium"]]};
	// Nouveaux by Pytha (28/08)
	case "joaillier": {["Joaillier",["goldbarp"]]};
	case "gedimat": {["Gedimat",["briquep"]]};
	case "forgeron": {["Forgeron",["ironp"]]};
	case "diamantaire": {["Diamantaire",["diamantpurp"]]};
	case "poudrenoir": {["Marchand de poudres",["poudrenoirp"]]};
	case "legogroup": {["LegoGroup",["plastiquep"]]};
	case "station": {["Station service",["water","rabbit","fuelF"]]};

};