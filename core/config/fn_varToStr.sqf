/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Pétrole Brut"};
	case "life_inv_oilp": {"Pétrole Raffiné"};
	case "life_inv_heroinu": {"Graine blanche de Pavot"};
	case "life_inv_heroinp": {"Héroïne Pure"};
	case "life_inv_cannabis": {"Résine de Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Pomme"};
	case "life_inv_rabbit": {"Viande de Lapin"};
	case "life_inv_salema": {"Chaire de Saumon"};
	case "life_inv_ornate": {"Chaire de Rouget"};
	case "life_inv_mackerel": {"Chaire de Maquereau"};
	case "life_inv_tuna": {"Chaire de Thon"};
	case "life_inv_mullet": {"Chaire de Mullet"};
	case "life_inv_catshark": {"Chaire de Requin Tigre"};
	case "life_inv_turtle": {"Viande de tortue"};
	case "life_inv_fishingpoles": {"Canne à pêche"};
	case "life_inv_water": {"Bouteille d'Eau"};
	case "life_inv_coffee": {"Thermos de Café"};
	case "life_inv_turtlesoup": {"Soupe de Tortue"};
	case "life_inv_donuts": {"Beignets"};
	case "life_inv_fuelE": {"Jerrican Vide"};
	case "life_inv_fuelF": {"Jerrican d'Essence"};
	case "life_inv_pickaxe": {"Pioche"};
	case "life_inv_copperore": {"Minerai de Cuivre"};
	case "life_inv_ironore": {"Minerai de Fer"};
	case "life_inv_ironr": {"Lingot de Fer"};
	case "life_inv_copperr": {"Lingot de Cuivre"};
	case "life_inv_sand": {"Sable"};
	case "life_inv_salt": {"Sel"};
	case "life_inv_saltr": {"Sel Raffinné"};
	case "life_inv_glass": {"Verre"};
	case "life_inv_diamond": {"Diamant Brut"};
	case "life_inv_diamondr": {"Diamant Taillé"};
	case "life_inv_tbacon": {"Sandwich au Thon"};
	case "life_inv_redgull": {"Boisson Énergisante"};
	case "life_inv_lockpick": {"Outils de crochetage"};
	case "life_inv_peach": {"Pêche"};
	case "life_inv_coke": {"Feuille de Coca"};
	case "life_inv_cokep": {"Cocaïne Pure"};
	case "life_inv_spikeStrip": {"Herse"};
	case "life_inv_rock": {"Roche"};
	case "life_inv_cement": {"Bloc de Ciment"};
	case "life_inv_goldbar": {"Pépite d'Or"};
	case "life_inv_blastingcharge": {"Charges d'explosifs"};
	case "life_inv_boltcutter": {"Pince coupante"};
	case "life_inv_defusekit": {"Kit de désarmement"};
	case "life_inv_storagesmall": {"Petit container"};
	case "life_inv_storagebig": {"Grand container"};


	case "life_inv_hamburger": {"Hamburger"};
	case "life_inv_frites": {"Frites"};
	case "life_inv_cheeseburger": {"Cheeseburger"};
	case "life_inv_rubanSecurite": {"Ruban Sécurité"};
	case "life_inv_cone": {"Cône Sécurité"};
	case "life_inv_barriere": {"Barrière Sécurité"};
	case "life_inv_barriereStop": {"Barrière Stop"};
	case "life_inv_blocdesableCoin": {"Bloc de sable d'Angle"};
	case "life_inv_blocdesableCourt": {"Bloc de sable Court"};
	case "life_inv_blocdesableLong": {"Bloc de sable Long"};
	case "life_inv_blocdesableTourelle": {"Bloc de sable Tourelle"};
	case "life_inv_blocdesableBunker": {"Bloc de sable Bunker"};
	case "life_inv_camonetLong": {"Camouflage Long"};
	case "life_inv_camonetLarge": {"Camouflage Large"};
	case "life_inv_camonetRectangle": {"Camouflage Rectangulaire"};
	case "life_inv_cargoHq": {"Cargo HQ"};
	case "life_inv_ziptie": {"Menottes"};
	case "life_inv_defibrilateur": {"Défibrilateur"};
	case "life_inv_kitmeth": {"Kith De Meth"};
	case "life_inv_crystalmeth": {"Cristal Meth Non Purifie"};
	case "life_inv_crystalmethpur": {"Cristal Meth Purifie"};
	case "life_inv_poudrehydroxyde": {"Poudre d'Hydroxyde De Sodium Anhydre"};
	case "life_inv_archeologie": {"Ossement Légalisé"};
	case "life_inv_archeologieillegale": {"Ossement Illégal"};
	case "life_inv_mash": {"Mix de grain d'ethanol"};
	case "life_inv_yeast": {"Levure"};
	case "life_inv_rye": {"Seigle"};
	case "life_inv_hops": {"Houblon"};
	case "life_inv_whiskey": {"Whisky distillé"};
	case "life_inv_beerp": {"Biere fermenté"};
	case "life_inv_bottles": {"Bouteille de verre"};
	case "life_inv_cornmeal": {"Grains de Mais"};
	case "life_inv_bottledwhiskey": {"Whisky en bouteille"};
	case "life_inv_bottledbeer": {"Biere en bouteille"};
	case "life_inv_bottledshine": {"Moonshine en bouteille"};
	case "life_inv_machete": {"Machette"};
	case "life_inv_hood": {"Cagoule"};
	case "life_inv_conewithlight": {"Plot Lumineux"};
	case "life_inv_poison": {"Poison mortel"};
	case "life_inv_grapes": {"Raisin"};
	case "life_inv_grapejuice": {"Jus de Raisin"};
	case "life_inv_wine": {"Vin"};
	case "life_inv_moonshine": {"Alcool illégal"};
	case "life_inv_applecompote": {"Compote de Pommes"};
	case "life_inv_peachcompote": {"Compote de Pêches"};
	case "life_inv_masonry_kit" : {"Kit de maçonnerie"};
	case "life_inv_cargo_hemtt" : {"Cargaison HEMTT"};
	case "life_inv_sake" : {"Saké"}; //On oublie pas les asiatiques //Johnny
	case "life_inv_nem" : {"Nem au Porc"}; //On oublie pas les asiatiques //Johnny
	case "life_inv_ipuranium": {"Purificateur Uranium Illegal "}; //Product Illegal

	// By Pytha
	//**************************
	//********* NEW ************
	//**************************
	case "life_inv_goldp": {"Minerai d'or"};
	case "life_inv_goldbarp": {"Pépite d'or"};
	case "life_inv_clayp": {"Argile"};
	case "life_inv_briquep": {"Brique"};
	case "life_inv_diamantp": {"Minerai de diamant"};
	case "life_inv_diamantpurp": {"Diamant"};
	case "life_inv_ironorep": {"Minerai de fer"};
	case "life_inv_ironp": {"Lingot de fer"};
	case "life_inv_charbonp": {"Charbon"};
	case "life_inv_souffrep": {"Souffre"};
	case "life_inv_poudrenoirp": {"Poudre noire"};
	case "life_inv_puranium": {"Purificateur Uranium illégal"};
	case "life_inv_uraniump1": {"Minerai Uranium"};
	case "life_inv_uraniump2": {"Uranium Brut"};
	case "life_inv_uraniump3": {"Uranium Purifié"};
	case "life_inv_uraniump4": {"Uranium Concentré"};
	case "life_inv_uraniumpurp": {"Uranium"};
	case "life_inv_oilpy": {"Baril de pétrole"};
	case "life_inv_plastiquep": {"Plastique"};
	case "life_inv_boisp": {"Bois"};
	case "life_inv_planchep": {"Planche"};
	case "life_inv_linp": {"Lin"};
	case "life_inv_tissup": {"Tissu"};
	case "life_inv_cocainp": {"Feuilles de coca"};
	case "life_inv_cocainpurp": {"Cocaïne"};
	case "life_inv_heroinpy": {"Feuilles de pavot"};
	case "life_inv_heroinpurp": {"Heroïne"};
	case "life_inv_marip": {"Feuilles de chanvre"};
	case "life_inv_maripurp": {"Marijuana"};
	case "life_inv_organp" : {"Organes enpaquetés"};
	case "life_inv_organ" : {"Organes frais"};
	case "life_inv_ossillp" : {"Ossements illégaux"};
	case "life_inv_osslp" : {"Ossements légaux"};

	//License Block

	// new licences
	case "license_civ_bucheron": {"Licence de Bucheron"};
	case "license_civ_joaillier": {"Licence de Joaillier"};
	case "license_civ_brique": {"Licence de Briquetier"};
	case "license_civ_diamantaire": {"Licence de Diamantaire"};
	case "license_civ_iron": {"Licence de Forgeron"};
	case "license_civ_tissu": {"Licence de Designer Textile"};
	case "license_civ_plastique": {"Licence de Vendeur de légo"};
	case "license_civ_poudre": {"Licence de Vendeur de poudre"};
	case "license_civ_heroine": {"Licence de Producteur héroine"};
	case "license_civ_canabis": {"Licence de Producteur canabis"};
	case "license_civ_cocaine": {"Licence de Producteur cocaine"};
	case "license_civ_uranium": {"Licence de Producteur Uranium"};
	case "license_civ_archeologie": {"Licence de Formation Archeologie"};
	case "license_civ_organ": {"Licence de Vendeur d'organes"};


	//xp system
	//Prof Block
	case "Peche_Prof": {"Pecheur"};
	case "Bucheron_Prof": {"Bucheron"};
	case "Tissu_Prof": {"Vendeur de tissu"};
	case "Poudre_Prof": {"Vendeur de poudre"};
	case "Brique_Prof": {"Vendeur chez Gedimat"};
	case "Plastique_Prof": {"Vendeur chez Lego"};
	case "Joaillier_Prof": {"Joaillier"};
	case "Diamantaire_Prof": {"Diamantaire"};
	case "Heroine_Prof": {"Producteur d'héroine"};
	case "Canabis_Prof": {"Producteur de canabis"};
	case "Cocaine_Prof": {"Producteur de cocaine"};
	case "Uranium_Prof": {"Producteur d'uranium"};
	case "Forgeron_Prof": {"Forgeron"};


	case "license_civ_driver": {"Permis de conduire"};
	case "license_civ_truck": {"Permis Poids Lourd"};
	case "license_civ_air": {"Brevet de Pilote"};
	case "license_civ_heroin": {"Producteur d'Héroïne"};
	case "license_civ_gang": {"Wu Tang Gang"};
	case "license_civ_oil": {"Raffinage du Pétrole"};
	case "license_civ_dive": {"Diplôme de Plongée"};
	case "license_civ_boat": {"Permis Bateau"};
	case "license_civ_gun": {"Permis de port d'armes"};
	case "license_cop_air": {"Brevet de Pilote"};
	case "license_cop_swat": {"Diplôme des Forces Spéciales"};
	case "license_cop_cg": {"Garde Cote"};
	case "license_civ_rebel": {"Licence de rebellion"};
	case "license_civ_marijuana": {"Producteur de Marijuana"};
	case "license_civ_cement": {"Producteur de Ciment"};
    case "license_med_air": {"Brevet de Pilote du SAMU"};
    case "license_civ_home": {"Licence proprio"};

	//case "license_civ_meth": {"Formation De Meth."};
	//case "license_civ_depanneur": {"Brevet de Dépanneur"};
	//case "license_civ_papiers": {"Papiers d'identitées"};
	//case "license_civ_bornholm": {"Whitelist Bornholm"};
	//case "license_civ_stiller": {"Licence de distilleur"};
	//case "license_civ_liquor": {"Fabriquant de liqueur"};
	//case "license_civ_bottler": {"Licence de mise en bouteille"};
	//case "license_civ_wine": {"Licence de producteur de Vin"};
	//case "license_civ_pressjuice": {"Licence de producteur de Jus de Raisin"};
	//case "license_civ_moonshine": {"Licence de distilleur illégal"};
	//case "license_civ_applecompote": {"Producteur de Compote de Pommes"};
	//case "license_civ_peachcompote": {"Producteur de Compote de Pêches"};
	case "license_civ_gangster": {"Licence Gangster"};
	//case "license_civ_luxecar": {"Permis Véhicule Luxe"};
	//case "license_civ_bounty_hunter": {"Licence de chasseur de prime"};
	case "license_civ_permrebel": {"Permission licence rebelle"};
	//case "license_cop_fusiller_leger": {"Permission Fusiller léger"};
	//case "license_cop_medecin": {"Permission Medeçin"};
	//case "license_cop_fusiller_lourd": {"Permission Fusiller lourd"};
	//case "license_cop_tireur_precision": {"Permission Tireur de précision"};
	//case "license_cop_tireur_elite": {"Permission Tireur d'élite"};

	case "license_cop_bac": {"Membre de la Brigade Anti Criminalité"}; //Ajout Bac 11/10/14 Jo
	case "license_civ_busDriver": {"Licence de transport de personnes"};

	case "license_civ_transport": {"Licence de transport"};
	case "license_civ_bonbeur": {"Entreprise Bonbeur"};
	case "license_civ_natiosecuri": {"National Security"};

};