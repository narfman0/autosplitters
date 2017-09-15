state("fceux")
{
	byte world : 0x3B1388, 0x727;
}

split
{
	return settings["worlds"] && old.world != current.world;
}

startup
{
	settings.Add("worlds", false, "World Change");
	settings.SetToolTip("worlds", "Split on world changes");
}