class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class fondtablet: Life_RscPicture {
			idc = 9090909;
			//text = "textures\gang.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2629;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class GangMemberList : Life_RscListBox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;

			x = 0.11;
			y = 0.26;
			w = 0.350;
			h = 0.450;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangLeave";
			x = 0.47;
			y = 0.26;
			w = (9 / 40);
			h = (1 / 25);
		};

		/*
		class GangKick : Life_RscButtonMenu
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.47;
			y = 0.31;
			w = (9 / 40);
			h = (1 / 25);
		};
		*/

		class GroupLeader : Life_RscButtonMenu
		{
			idc = 2650;
			text = "Chef de Groupe";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_groupLeader;";
			x = 0.47;
			y = 0.31;
			w = (9 / 40);
			h = (1 / 25);
		};

		class GangGestion : Life_RscButtonMenu
		{
			idc = 2630;
			text = "Gestion Gang";
			onButtonClick = "createDialog 'Life_Group_Gang_Diag';";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.47;
			y = 0.36;
			w = (9 / 40);
			h = (1 / 25);
		};

		class AllianceMenu : Life_RscButtonMenu
		{
			idc = 2660;
			text = "Alliances";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.47;
			y = 0.41;
			w = (9 / 40);
			h = (1 / 25);
		};
/*
		class InviteMember : GangGestion
		{
			idc = 2637;
			text = "$STR_Invite_Player";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			y = .46;
		};


		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.47; y = 0.51;
			w = (9 / 40); h = 0.03;
		};


		class AugmenterGangTemp : GangGestion
		{
			idc = 2638;
			text = "Augmenter slots";
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			y = .58;
		};

		class DisbandGangTemp : GangGestion
		{
			idc = 2639;
			text = "Dissoudre Gang";
			onButtonClick = "[] spawn life_fnc_gangDisband";
			y = .64;
		};
*/

		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
		};
	};
};

class Life_Group_Gang_Diag {
	idd = 2720;
	name= "life_group_gang_diag";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_gangGestionLoading;";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.85;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.85;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2729;
			text = "Interface de Gestion du gang";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class LegendeJoueurs : Life_RscLine {
			idc = -1;
			style = 0;
			x = 0.11;
			y = 0.25;
			w = 0.350;
			h = 0.05;
			text = "Liste des joueurs du gang";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1.0};
		};

		class GangMemberList : Life_RscListBox
		{
			idc = 2721;
			text = "";
			sizeEx = 0.035;

			x = 0.11;
			y = 0.31;
			w = 0.350;
			h = 0.420;
		};

		class LegendeNbSlot : Life_RscLine {
			idc = -1;
			style = 0;
			x = 0.73;
			y = 0.26;
			w = 0.40;
			h = 0.05;
			text = "Nb utilisés/Nb Max";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1.0};
		};

		class ActualGangSlot : Life_RscStructuredText {
			idc = 2775;
			style = 0;
			x = 0.80;
			y = 0.30;
			w = 0.1;
			h = 0.05;
			text = "XXX";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 1.0};
		};

		class GangUpgrade : Life_RscButtonMenu {
			idc = 2722;
			text = "$STR_Gang_UpgradeSlots";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.72;
			y = 0.36;
			w = (9 / 40);
			h = (1 / 25);

			class Attributes
			{
				align = "center";
			};
		};

		class GangDisband : Life_RscButtonMenu
		{
			idc = 2724;
			text = "Dissoudre le gang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.51;
			y = 0.69;
			w = 0.400;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class GangPromote : Life_RscButtonMenu
		{
			idc = 2725;
			text = "Promouvoir";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangPromote";
			x = 0.72;
			y = 0.41;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class GroupDemote : GangPromote
		{
			idc = 2730;
			text = "Retrograder";
			onButtonClick = "[] spawn life_fnc_gangDemote";
			x = 0.72;
			y = .46;
		};

		class InviteMember : GangPromote
		{
			idc = 2737;
			text = "Inviter Joueur";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			x = 0.72;
			y = 0.51;
		};

		class KickerGangGestion : InviteMember
		{
			idc = 2731;
			text = "Kicker Joueur";
			onButtonClick = "[] spawn life_fnc_gangKickGestion";
			x = 0.72;
			y = .56;
		};

		class PromoteLeader : InviteMember
		{
			idc = 2738;
			text = "Mettre Leader";
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.72;
			y = .61;
		};

		class ColorList : Life_RscCombo
		{
			idc = 2732;
			x = 0.47; y = 0.27;
			w = (9 / 40); h = 0.03;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Retour";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_gangMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};



class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gangPrice)] call life_fnc_numberText]};";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};

	class controls {

		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5;
			h = 0.1;
		};

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";

			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};
