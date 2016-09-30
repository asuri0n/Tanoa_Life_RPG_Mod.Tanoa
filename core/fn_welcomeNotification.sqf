/*
    File: fn_welcomeNotification.sqf
    Author:

    Description:
    Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

_message = "

    <t size='1.2'>Rendez-vous sur <a color='#FD9801' href='http://www.vacationgaming.fr/'>le site</a> pour plus d'informations </t>
    <br/><br/>

    <t size='1.30' font='puristaMedium' color='#594BD5'>IMPORTANT</t><br/>
    - <t color='#FF0000'>Il vous faut une machette pour récolter certaines ressources, notament les pommes et le bois !</t><br/>
    - <t color='#b67e2a'>Touche Y</t> pour accéder au menu joueur<br/>
    - Un bouton <t color='#b67e2a'>AIDE</t> vous permettra de connaitre l'ensemble des raccourcis!<br/>
    - L'argent <t color='#b67e2a'>ne reste pas</t> sur vous quand vous vous déconnectez<br/>
    - Votre <t color='#b67e2a'>position est sauvegardé</t> sauf après les reboots<br/>
    - Utilisez la <t color='#b67e2a'>machette</t> ou la <t color='#b67e2a'>pioche</t> pour récolter<br/>

    <br />
    <br />

    <t size='1.30' font='puristaMedium' color='#594BD5'>Rappel des touches spéciales</t><br/>
    <t color='#b67e2a'>H</t> pour interagir avec le véhicule/personne etc<br/>
    <t color='#b67e2a'>T</t> pour le contenu des véhicules / caisses<br/>
    <t color='#b67e2a'>Alt + G</t> sur personne menottée, assommée,... pour démasquer une personne<br/>
    <t color='#b67e2a'>Alt + R</t> sur personne menottée, assommée,... pour récuperer les moyens de communications<br/>
    <t color='#b67e2a'>Alt + J</t> pour se rendre<br/>
    <t color='#b67e2a'>Shift + H</t> pour ranger une arme<br/>
    <t color='#b67e2a'>CTRL + H</t> pour la sortir<br/>
    <t color='#b67e2a'>Shift + G</t> Assomme une personne si l'on possède une arma<br/>
    <t color='#b67e2a'>Shift + R</t> Menotter une personne si l'on possède des menottes

    <br/>
    <br/>

    <t size='1.30' font='puristaMedium' color='#594BD5'>TEAMSPEAK:</t> <a color='#FD9801' href='ts3server://ts.vacationgaming.com'>ts.vacationgaming.com</a>
    ";


//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
