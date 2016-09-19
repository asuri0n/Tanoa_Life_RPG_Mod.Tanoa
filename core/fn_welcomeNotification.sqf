/*
	File: fn_welcomeNotification.sqf

	Description:
	Called upon first spawn selection and welcomes our player.
*/

14 cutRsc ["logo","PLAIN"];
15 cutRsc ["banner","PLAIN"];

_rappelImportant = parseText format ["
	<br/>
	<t size='1.30' font='puristaMedium' color='#594BD5' align='left'>IMPORTANT</t><br/>
	<t align='left'><t color='#b67e2a'>Touche Y</t> pour accéder au menu joueur</t><br/>
	<t align='left'><t color='#b67e2a'></t>Un bouton AIDE vous permettra de connaitre l'ensemble des raccourcis!</t><br/>
	<t align='left'>L'argent ne reste pas sur vous quand vous vous déconnectez</t><br/>
	<t align='left'>Votre position est sauvegardé sauf après les reboots</t><br/>
	<t align='left'>Utilisez la machette ou la pioche pour récolter</t><br/>
	<t align='left'>La zone pour acheter les licences pour les ressources illégales est cachée sur la carte. Demandez à des rebelles de vous donner l'endroit !</t><br/>
	
	Rendez-vous sur <a color='#FD9801' href='http://www.vacationgaming.fr/'>Site Web</a> pour plus d'informations concernant le serveur</t></t><br/>
	"];


_rappelToucheInteraction = parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#594BD5'>Rappel des touches spéciales</t><br/>
	<br/>
	<t size='1.30' font='puristaMedium' color='#FD9801' align='left'>Pour tous</t><br/>
	<t align='left'><t color='#b67e2a'>Touche H</t> pour interagir avec le véhicule/personne etc</t><br/>
	<t align='left'><t color='#b67e2a'>Touche T</t> pour le contenu des véhicules / caisses</t><br/>
	<t align='left'><t color='#b67e2a'>Alt+G</t> sur personne menottée, assommée,... pour démasquer une personne</t><br/>
	<t align='left'><t color='#b67e2a'>Alt + R</t> sur personne menottée, assommée,... pour récuperer les moyens de communications<t align='left'><br/>
	<t align='left'><t color='#b67e2a'>Alt + J</t> pour se rendre<t align='left'><br/>
	<t color='#b67e2a'>Shift +H</t> pour ranger une arme, <t color='#b67e2a'>CTRL + H</t> pour la sortir</t><br/>
	<t size='1.30' font='puristaMedium' color='#FD9801'  align='left'>Rebelles</t><br/>
	<t align='left'><t color='#b67e2a'>Shift + G :</t> Assomme une personne</t><br/>
	<t align='left'><t color='#b67e2a'>Shift + R :</t> Menotter une personne si l'on possède des menottes</t><br/>"];


_ts = parseText format ["<t size='1.30' font='puristaMedium' color='#594BD5'>TEAMSPEAK:</t> <a color='#FD9801' href='ts.vacationgaming.com'>ts.vacationgaming.com</a>"];

_donateurs = parseText format ["<t size='1.30' font='puristaMedium' color='#594BD5'>DONATEURS:</t> <br/>Salaire plus élevé<br/>Pourcentage de réduiction<br/>Plusieurs maisons achetables<br/>Tenues spéciales."];

format["Bienvenue %1",name player] hintC
[
	_rappelImportant,
	_rappelToucheInteraction,
	_ts,
	_donateurs
];
