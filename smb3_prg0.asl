state("fceux")
{
	byte world : 0x0727
}

start
{
}

split
{

	return settings["worlds"] && old.world != current.world;
}

gameTime
{
}

init
{
}

startup
{
	settings.Add("worlds", false, "World Change");
	settings.SetToolTip("worlds", "Split on world changes");
}