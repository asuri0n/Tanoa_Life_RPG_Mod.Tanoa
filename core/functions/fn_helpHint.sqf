/*
	File: fn_helpHint.sqf

	Description:
	Hint d'aide.





	NOT USED -> [] call life_fnc_welcomeNotification;






*/
_rappelToucheInteraction = parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Rappel des touches spéciales</t><br/>
	<br/>
	<t size='1.30' font='puristaMedium' color='#0D82DF' align='left'>Pour tous</t><br/>
	<t align='left'><t color='#b67e2a'>Touche H</t> pour interagir avec le véhicule/personne etc</t><br/>
	<t align='left'><t color='#b67e2a'>Touche T</t> pour aux contenus des véhicules / caisses</t><br/>
	<t align='left'><t color='#b67e2a'>Alt+G</t> sur personne menottée, assommée,... pour demasquer une personne</t><br/>
	<t align='left'><t color='#b67e2a'>Alt + R</t> sur personne menottée, assommée,... pour recuperer les moyens de communications<t align='left'><br/>
	<t align='left'><t color='#b67e2a'>Shift + J</t> sur personne menottée ou rendue, pour prendre ses clés de véhicules à proximité.<t align='left'><br/>
	<t align='left'><t color='#b67e2a'>Shift + C</t> sur une personne, pour pouvoir cagouler et aveugler quelqu'un.<t align='left'><br/>
	<t color='#b67e2a'>Shift +H</t> pour ranger une arme, <t color='#b67e2a'>CTRL + H</t> pour la sortir</t><br/>
	<t color='#b67e2a'>Ctrl + N</t> Pour accéder au menu de notification<br/>
	<t color='#b67e2a'>Windows Gauche</t> Pour utiliser le nouveau menu interaction déroulant - Vous pouvez rebinder la touche en changeant la touche custom 10 dans vos controles( EN TEST, merci de report les bugs rencontrés )<br/>
	<t size='1.30' font='puristaMedium' color='#0D82DF'  align='left'>Rebelles</t><br/>
	<t align='left'><t color='#b67e2a'>Shift + G :</t> Assome une personne</t><br/>
	<t align='left'><t color='#b67e2a'>Shift + R :</t> Menotter une personne si l'on possède des menottes</t><br/><br/>
	<t size='1.30' font='puristaMedium' color='#d06228'>STAFF ARMA3:</t><br/>
	<t align='left'> Asuri0n, Pytha</t><br/><br/><t size='1.30' font='puristaMedium' color='#d06228'>SITE WEB:</t> <a color='#0D82DF' href='www.vacationgaming.fr'>www.vacationgaming.fr</a>"];

	hint _rappelToucheInteraction;