#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Armurerie"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		switch(true) do
		{		
			case (__GETC__(life_copLevel)  == 1):{
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
			};
			
			case (__GETC__(life_copLevel)  == 2):{
				_ret pushBack["U_B_Wetsuit",nil,1000]; 	
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500]; 
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 



				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
			};
			
			case (__GETC__(life_copLevel)  == 3):{
				_ret pushBack["U_B_Wetsuit",nil,1000]; 
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500]; 
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 
				
				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
			};
			
			case (__GETC__(life_copLevel)  == 4):{
				_ret pushBack["U_B_Wetsuit",nil,1000]; 
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500]; 
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 

				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
			};
			
			case (__GETC__(life_copLevel)  == 5):{
				_ret pushBack["U_B_Wetsuit",nil,1000]; 
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500]; 
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 
				
				_ret pushBack["U_C_man_sport_3_F",nil,500]; 
				_ret pushBack["U_C_Man_casual_6_F",nil,500]; 
				_ret pushBack["U_IG_Guerilla3_2",nil,500]; 
				_ret pushBack["U_C_WorkerCoveralls",nil,500]; 
				_ret pushBack["U_OrestesBody",nil,500]; 

				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
			};
			
			case (__GETC__(life_copLevel)  == 6):{
				_ret pushBack["U_B_Wetsuit",nil,1000]; 
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500];
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 
				
				_ret pushBack["U_C_man_sport_3_F",nil,500]; 
				_ret pushBack["U_C_Man_casual_6_F",nil,500]; 
				_ret pushBack["U_IG_Guerilla3_2",nil,500]; 
				_ret pushBack["U_C_WorkerCoveralls",nil,500]; 
				_ret pushBack["U_OrestesBody",nil,500]; 

				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
				_ret pushBack["U_B_T_Sniper_F",nil,5000];
			};
			
			case (__GETC__(life_copLevel)  == 7):{
				_ret pushBack["U_O_V_Soldier_Viper_F",nil,1000]; 	
				_ret pushBack["U_O_T_Officer_F",nil,1000]; 	
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 
				
				_ret pushBack["U_B_HeliPilotCoveralls",nil,1000]; 
				_ret pushBack["U_B_Wetsuit",nil,1000]; 
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500]; 
				
				_ret pushBack["U_C_man_sport_3_F",nil,500]; 
				_ret pushBack["U_C_Man_casual_6_F",nil,500]; 
				_ret pushBack["U_IG_Guerilla3_2",nil,500]; 
				_ret pushBack["U_C_WorkerCoveralls",nil,500]; 
				_ret pushBack["U_OrestesBody",nil,500]; 

				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
				_ret pushBack["U_B_T_Sniper_F",nil,5000];
			};
			
			case (__GETC__(life_copLevel)  == 8):{
				_ret pushBack["U_O_V_Soldier_Viper_F",nil,1000]; 	

				_ret pushBack["U_B_Wetsuit",nil,1000]; 	
				_ret pushBack["U_Rangemaster","Uniforme gendarme ville",500]; 
				_ret pushBack["U_B_GEN_Soldier_F",nil,0]; 
				_ret pushBack["U_B_GEN_Commander_F","Uniforme de Gendarmerie",500]; 
				_ret pushBack["U_I_pilotCoveralls","Uniforme de Gendarmerie",500]; 
				
				_ret pushBack["U_C_man_sport_3_F",nil,500]; 
				_ret pushBack["U_C_Man_casual_6_F",nil,500]; 
				_ret pushBack["U_IG_Guerilla3_2",nil,500]; 
				_ret pushBack["U_C_WorkerCoveralls",nil,500]; 
				_ret pushBack["U_OrestesBody",nil,500]; 

				_ret pushBack["U_B_T_Soldier_F",nil,500];
				_ret pushBack["U_B_T_Soldier_AR_F",nil,500];
				_ret pushBack["U_B_T_Soldier_SL_F",nil,500];
				_ret pushBack["U_B_T_Sniper_F",nil,5000];
			};			
		};
	};

//Hats
	case 1:
	{ 
		switch(true) do
		{		
			case (__GETC__(life_copLevel)  == 1):{
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 2):{
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 3):{
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 4):{
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 5):{
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 6):{
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 7):{
				_ret pushBack["H_HelmetSpecO_ghex_F",nil,100];	

				_ret pushBack["H_Beret_gen_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
			
			case (__GETC__(life_copLevel)  == 8):{
				_ret pushBack["H_HelmetSpecO_ghex_F",nil,100];	
				_ret pushBack["H_RacingHelmet_1_blue_F",nil,100];	// A
				_ret pushBack["H_MilCap_gen_F",nil,100];	
				_ret pushBack["H_Booniehat_tna_F",nil,100];	 // A
				_ret pushBack["H_MilCap_tna_F",nil,100];	// A
				_ret pushBack["H_HelmetB_tna_F",nil,100];	// A
			};
		};
	};

	//Glasses
	case 2:
	{
		switch(true) do
		{		
			case (__GETC__(life_copLevel)  == 1):{
				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
			};
			
			case (__GETC__(life_copLevel)  == 2):{
				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};

			case (__GETC__(life_copLevel)  == 3):{
				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};
			
			case (__GETC__(life_copLevel)  == 4):{
				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};

			case (__GETC__(life_copLevel)  == 5):{
				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};
			
			case (__GETC__(life_copLevel)  == 6):{
				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};

			case (__GETC__(life_copLevel)  == 7):{
				_ret pushBack["G_Balaclava_TI_G_tna_F",nil,500];	

				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};

			case (__GETC__(life_copLevel)  == 8):{
				_ret pushBack["G_Balaclava_TI_G_tna_F",nil,500];	

				_ret pushBack["G_Tactical_Clear",nil,100];	
				_ret pushBack["G_Tactical_Black",nil,100];	
				_ret pushBack["G_Combat",nil,100];	
			};
		};
	};

	//Vests
	case 3:
	{
		switch(true) do
		{		
			case (__GETC__(life_copLevel)  == 1):{
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
			};			
			case (__GETC__(life_copLevel)  == 2):{
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
			};	
			case (__GETC__(life_copLevel)  == 3):{
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
			};	
			case (__GETC__(life_copLevel)  == 4):{
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
			};	
			case (__GETC__(life_copLevel)  == 5):{
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierSpec_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierGL_tna_F",nil,500]; 
			};	
			case (__GETC__(life_copLevel)  == 6):{
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierSpec_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierGL_tna_F",nil,500]; 
			};	
			case (__GETC__(life_copLevel)  == 7):{
				_ret pushBack["V_HarnessO_ghex_F",nil,1000]; 

				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierSpec_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierGL_tna_F",nil,500]; 
			};
			case (__GETC__(life_copLevel)  == 8):{
				_ret pushBack["V_HarnessO_ghex_F",nil,1000]; 
				
				_ret pushBack["V_TacVest_gen_F",nil,500]; 
				_ret pushBack["V_PlateCarrier1_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrier2_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierSpec_tna_F",nil,500]; 
				_ret pushBack["V_PlateCarrierGL_tna_F",nil,500]; 
			};				
		};
	};

	//Backpacks
	case 4:
	{
		switch(true) do
		{		
			case (__GETC__(life_copLevel)  == 1):{			
				_ret pushBack["B_FieldPack_blk",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};
			
			case (__GETC__(life_copLevel)  == 2):{			
				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};

			case (__GETC__(life_copLevel)  == 3):{			
				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};
			
			case (__GETC__(life_copLevel)  == 4):{			
				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};

			case (__GETC__(life_copLevel)  == 5):{			
				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};

			case (__GETC__(life_copLevel)  == 6):{			
				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};

			case (__GETC__(life_copLevel)  == 7):{			
				_ret pushBack["B_ViperHarness_ghex_F",nil,1000]; 

				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};

			case (__GETC__(life_copLevel)  == 8):{		
				_ret pushBack["B_ViperHarness_ghex_F",nil,1000]; 

				_ret pushBack["B_FieldPack_blk",nil,500]; 
				_ret pushBack["B_ViperLightHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_blk_F",nil,500]; 
				_ret pushBack["B_ViperHarness_oli_F",nil,500]; 
				_ret pushBack["B_Bergen_tna_F",nil,500]; 
				_ret pushBack["B_AssaultPack_tna_F",nil,500]; 
				
				_ret pushBack["tf_anprc155",nil,20000]; 
				_ret pushBack["tf_anprc155_coyote",nil,20000]; 
			};		
		};
	};
};

_ret;