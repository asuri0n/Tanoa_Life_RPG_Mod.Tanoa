// Construction script by IDEO - Copyright 2014
removeAllActions player;
(FindDisplay 46) displayRemoveEventHandler ["keydown",ChangeObjetHandler] ;

ScriptConstruction = "admintools\Objet\Construction\Change.sqf";
ScriptConstructionNull = "admintools\Objet\Construction\Null.sqf";
ScriptConstructionPauser = "admintools\Objet\Construction\Pauser.sqf";
ScriptConstructionMenu = "admintools\Objet\Construction\menu.sqf";
ScriptConstructionMenuMurs = "admintools\Objet\Construction\menu_Murs.sqf";
ScriptConstructionMenuInt = "admintools\Objet\Construction\menu_Int.sqf";
ScriptConstructionMenuInfo = "admintools\Objet\Construction\menu_Info.sqf";
ScriptConstructionMenuLampe = "admintools\Objet\Construction\menu_Lampe.sqf";
ScriptConstructionMenuAutres = "admintools\Objet\Construction\menu_Autres.sqf";
ScriptConstructionMenuPortes = "admintools\Objet\Construction\menu_Portes.sqf";
ScriptConstructionMenuBat = "admintools\Objet\Construction\menu_Bat.sqf";
ScriptConstructionMenuBoissons = "admintools\Objet\Construction\menu_Boissons.sqf";
/// Titre / Nom objet arma 3/ script ( 0 = null, 1 = chaise, 2 = radar, 3 = parking, 4 = skin, 5 = SimulationOFF, 6 = Entrainement (mouvements), 10 = Liqueur, 11 = Bière, 12 = Whisky, 13 = Vodka)

item01 = ["Shoot House - Wall","Land_Shoot_House_Wall_F",0];
item02 = ["Shoot House - Wall (Long)","Land_Shoot_House_Wall_Long_F",0];
item03 = ["Shoot House - Wall (Stand)","Land_Shoot_House_Wall_Stand_F",0];
item04 = ["Shoot House - Wall (Stand, Long)","Land_Shoot_House_Wall_Long_Stand_F",0];
item05 = ["Shoot House - Wall (Crouch)","Land_Shoot_House_Wall_Crouch_F",0];
item06 = ["Shoot House - Wall (Crouch, Long)","Land_Shoot_House_Wall_Long_Crouch_F",0];
item07 = ["Shoot House - Wall (Prone)","Land_Shoot_House_Wall_Prone_F",0];
item08 = ["Shoot House - Wall (Prone, Long)","Land_Shoot_House_Wall_Long_Prone_F",0];
item09 = ["Shoot House - Corner","Land_Shoot_House_Corner_F",0];
item10 = ["Shoot House - Corner (Stand)","Land_Shoot_House_Corner_Stand_F",0];

item11 = ["Shoot House - Corner (Crouch)","Land_Shoot_House_Corner_Crouch_F",0];
item12 = ["Shoot House - Corner (Prone)","Land_Shoot_House_Corner_Prone_F",0];
item13 = ["Shoot House - Panels","Land_Shoot_House_Panels_F",0];
item14 = ["Shoot House - Panels (Crouch)","Land_Shoot_House_Panels_Crouch_F",0];
item15 = ["Shoot House - Panels (Prone)","Land_Shoot_House_Panels_Prone_F",0];
item16 = ["Shoot House - Panels (Vault)","Land_Shoot_House_Panels_Vault_F",0];
item17 = ["Shoot House - Panels (Window)","Land_Shoot_House_Panels_Window_F",0];
item18 = ["Shoot House - Panels (Windows)","Land_Shoot_House_Panels_Windows_F",0];
item19 = ["Shoot House - Tunnel","Land_Shoot_House_Tunnel_F",0];
item20 = ["Shoot House - Tunnel (Stand)","Land_Shoot_House_Tunnel_Stand_F",0];

item21 = ["Shoot House - Tunnel (Crouch)","Land_Shoot_House_Tunnel_Crouch_F",0];
item22 = ["Shoot House - Tunnel (Prone)","Land_Shoot_House_Tunnel_Prone_F",0];
item23 = ["Concrete Wall (Long)","Land_Concrete_SmallWall_4m_F",0];
item24 = ["Concrete Wall (Small, Long)","Land_Concrete_SmallWall_8m_F",0];
item25 = ["Concrete Shelter","Land_CncShelter_F",0];
item26 = ["Pipe Fence (Long)","Land_Pipe_fence_4m_F",0];
item27 = ["Concrete Square Wall","Land_Wall_IndCnc_2deco_F",0];
item28 = ["Net Fence (Gate)","Land_Net_Fence_Gate_F",0];
item29 = ["Sink","Land_Sink_F",0];
item30 = ["Tree Base","Land_TreeBin_F",0];

item31 = ["Water Source","Land_Water_source_F",0];
item32 = ["Camping Lantern (Off)","Land_Camping_Light_off_F",0];
item33 = ["Folding Chair","Land_CampingChair_V1_F",1];
item34 = ["Camping Chair","Land_CampingChair_V2_F",1];
item35 = ["Camping Table","Land_CampingTable_F",0];
item36 = ["Echelle","Land_PierLadder_F",0];
item37 = ["Camping Table (Small)","Land_CampingTable_small_F",0];
item38 = ["Field Toilet","Land_FieldToilet_F",0];
item39 = ["Sleeping Mat","Land_Ground_sheet_F",0];
item40 = ["Escalier","Land_GH_Stairs_F",0];

item41 = ["Plateforme","Land_GH_Platform_F",0];
item42 = ["Device (Disassembled)","Land_Device_disassembled_F",0];
item43 = ["Device (Assembled)","Land_Device_assembled_F",0];
item44 = ["Pillow","Land_Pillow_F",0];
item45 = ["Pillow (Camo)","Land_Pillow_camouflage_F",0];
item46 = ["Pillow (Grey)","Land_Pillow_grey_F",0];
item47 = ["Pillow (Old)","Land_Pillow_old_F",0];
item48 = ["Sleeping Bag","Land_Sleeping_bag_F",0];
item49 = ["Sleeping Bag (Blue)","Land_Sleeping_bag_blue_F",0];
item50 = ["Sleeping Bag (Brown)","Land_Sleeping_bag_brown_F",0];

item51 = ["Cinder Blocks","Land_CinderBlocks_F",0];
item52 = ["Billboard","Land_Billboard_F",4];
item53 = ["Infostand (1 leg)","Land_InfoStand_V1_F",4];
item54 = ["Infostand (2 legs)","Land_InfoStand_V2_F",4];
item55 = ["Whiteboard (Empty)","Land_MapBoard_F",4];
item56 = ["Whiteboard (Map of Altis)","MapBoard_altis_F",0];
item57 = ["Whiteboard (Map of Stratis)","MapBoard_stratis_F",0];
item58 = ["Lamp (Shabby)","Land_LampShabby_F",0];
item59 = ["Lamp (Stadium)","Land_LampStadium_F",0];
item60 = ["Street Lamp (Small)","Land_LampStreet_small_F",0];

item61 = ["Street Lamp","Land_LampStreet_F",0];
item62 = ["Cashdesk","Land_CashDesk_F",0];
item63 = ["Icebox","Land_Icebox_F",0];
item64 = ["Desk","Land_TableDesk_F",0];
item65 = ["Stool","Land_Bench_F",0];
item66 = ["Heat pump","Land_HeatPump_F",5];
item67 = ["Chair (Plastic)","Land_ChairPlastic_F",1];
item68 = ["Chair (Wooden)","Land_ChairWood_F",1];
item69 = ["Metal Rack (4 shelves)","Land_Metal_rack_F",0];
item70 = ["Metal Rack (5 shelves)","Land_Metal_rack_Tall_F",0];

item71 = ["Metal-Wooden Rack","Land_Metal_wooden_rack_F",0];
item72 = ["Rack","Land_Rack_F",0];
item73 = ["Shelves (Metal)","Land_ShelvesMetal_F",0];
item74 = ["Shelves (Wooden, Blue)","Land_ShelvesWooden_blue_F",0];
item75 = ["Generateur","Land_PowerGenerator_F",2];
item76 = ["Parking","Land_Target_Oval_F",3];
item77 = ["Industrial Shed (Big)","Land_Shed_Big_F",0];
item78 = ["Industrial Shed","Land_i_Shed_Ind_F",0];
item79 = ["Military Offices","Land_MilOffices_V1_F",0];
item80 = ["Pier Box","Land_Pier_Box_F",0];

item81 = ["Pier (nav)","Land_nav_pier_m_F",0];
item82 = ["Pier","Land_Pier_F",0];
item83 = ["Obstacle (Bridge)","Land_Obstacle_Bridge_F",0];
item84 = ["Obstacle (Climbing)","Land_Obstacle_Climb_F",0];
item85 = ["Obstacle (Cross Over)","Land_Obstacle_Cross_F",0];
item86 = ["Obstacle (Passing)","Land_Obstacle_Pass_F",0];
item87 = ["Obstacle (Ramp)","Land_Obstacle_Ramp_F",0];
item88 = ["Obstacle (Run-around)","Land_Obstacle_RunAround_F",0];
item89 = ["Concrete Ramp","Land_RampConcrete_F",0];
item90 = ["Concrete Ramp (High)","Land_RampConcreteHigh_F",0];

item91 = ["Pop-Up Target 1 (Accuracy)","TargetP_Inf_Acc2_F",0];
item92 = ["Fuel Station (Shed)","Land_FuelStation_Shed_F",0];
item93 = ["Industrial Shed (Small)","Land_Shed_Small_F",0];
item94 = ["Pier Platform","Land_Pier_addon",0];
item95 = ["Concrete Block","BlockConcrete_F",0];
item96 = ["Stone Wall (Gate)","Land_Stone_Gate_F",0];
item97 = ["Sign (Sponsor)","SignAd_Sponsor_F",4];
item98 = ["Sign (Sponsor - Small)","SignAd_SponsorS_F",4];
item99 = ["Garden Table","Land_TablePlastic_01_F",0];
item100 = ["Rails (End)","Target_Rail_End_F",6];

item101 = ["Liqueur","Land_BottlePlastic_V1_F",10];
item102 = ["Bière","Land_Can_V1_F",11];
item103 = ["Whisky","Land_Can_V2_F",12];
item104 = ["Vodka","Land_Can_V2_F",13];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ActionContructionFermer = player addaction ["<t color='#55FF55'>Fermer le menu</t>",ScriptConstructionNull];
ActionContructionSupprimer = player addaction ["<t color='#FF0000'>Supprimer objet</t>",{deleteVehicle cursorTarget;}];
ActionContructionMurs = player addaction ["Murs",ScriptConstructionMenuMurs];
ActionContructionPortes = player addaction ["Portes",ScriptConstructionMenuPortes];
ActionContruction40 = player addaction [item40 select 0,ScriptConstruction,[item40 select 1,item40 select 0,item40 select 2]];
ActionContruction41 = player addaction [item41 select 0,ScriptConstruction,[item41 select 1,item41 select 0,item41 select 2]];
ActionContructionBat = player addaction ["Batiments",ScriptConstructionMenuBat];
ActionContructionInt = player addaction ["Intérieur",ScriptConstructionMenuInt];
ActionContructionInfo = player addaction ["Info",ScriptConstructionMenuInfo];
ActionContructionLampe = player addaction ["Lampe",ScriptConstructionMenuLampe];
ActionContructionBoissons = player addaction ["Boissons",ScriptConstructionMenuBoissons];
ActionContructionAutres = player addaction ["Autres",ScriptConstructionMenuAutres];