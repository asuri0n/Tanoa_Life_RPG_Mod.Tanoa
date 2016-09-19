life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	1 fadeSound 0.1;
	hint "Casque anti-bruit active";
}
else
{
	1 fadeSound 1;
	hint "Casque anti-bruit desactive";
};