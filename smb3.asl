state("fceux")
{
	byte world : 0x3B1388, 0x727;
	byte bowserDoor1 : 0x3B1388, 0x2;
	byte bowserDoor2 : 0x3B1388, 0x71D;
	byte princess1 : 0x3B1388, 0x4D0;
	byte princess2 : 0x3B1388, 0x4D1;
	byte princess3 : 0x3B1388, 0x4D2;
	byte start1 : 0x3B1388, 0x1F4;
	byte start2 : 0x3B1388, 0x1F7;
}

split
{
	return (settings["worlds"] && ((settings["warp"] || current.world != 8) && old.world != current.world)) ||
		(settings["bowserDoor"] && old.bowserDoor1 == 0 && current.bowserDoor1 == 1 && old.bowserDoor2 == 58 && current.bowserDoor2 == 62) ||
		(settings["princess"] && old.princess1 == 77 && current.princess1 == 0 && old.princess2 == 176 && current.princess2 == 0 && old.princess3 == 152 && current.princess3 == 0);
}

start
{
	return settings["start"] && old.start1 == 0 && current.start1 == 255 && old.start2 == 0 && current.start2 == 34;
}

startup
{
	settings.Add("worlds", true, "World Change");
	settings.SetToolTip("worlds", "Split on world changes");
	settings.Add("start", false, "Start Enable");
	settings.SetToolTip("start", "Enable start button to start timer from main screen");
	settings.Add("bowserDoor", false, "Bowser Door Opens (non-WW finish)");
	settings.SetToolTip("bowserDoor", "Split after Bowser's chamber door opens and is enterable (before seeing Peach's chamber.)");
	settings.Add("warp", false, "Split upon entering warp world");
	settings.SetToolTip("warp", "Split upon entering warp world (only usable when splitting on world changes)");
	settings.Add("princess", false, "Mario appears in princess chamber (WW finish)");
	settings.SetToolTip("princess", "Experimental: Split upon the first frame of mario in princess' chamber");
}