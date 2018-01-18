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
	byte levelComplete : 0x7B1388, 0x5F2;
	byte largeChest : 0x7B1388, 0x5F2;
	byte smallChest : 0x7B1388, 0x5F2;
	byte menuReset : 0x7B1388, 0x5F2;
}

split
{
	return (settings["worlds"] && old.world != current.world) ||
		(settings["bowserDoor"] && old.bowserDoor1 == 0 && current.bowserDoor1 == 1 && old.bowserDoor2 == 58 && current.bowserDoor2 == 62) ||
		(settings["princess"] && old.princess1 == 77 && current.princess1 == 0 && old.princess2 == 176 && current.princess2 == 0 && old.princess3 == 152 && current.princess3 == 0) ||
		(settings["levelComplete"] && old.levelComplete == 0 && current.levelComplete == 33024) ||
		(settings["largeChest"] && old.largeChest == 256 && current.largeChest == 257) ||
		(settings["smallChest"] && old.smallChest == 0 && current.smallChest == 512);
}

start
{
	return settings["start"] && old.start1 == 0 && current.start1 == 255 && old.start2 == 0 && current.start2 == 34;
}

startup
{
	settings.Add("worlds", false, "World Change");
	settings.SetToolTip("worlds", "Split on world changes");
	settings.Add("start", true, "Start Enable");
	settings.SetToolTip("start", "Enable start button to start timer from main screen");
	settings.Add("bowserDoor", false, "Bowser Door Opens (non-WW finish)");
	settings.SetToolTip("bowserDoor", "Split after Bowser's chamber door opens and is enterable (before seeing Peach's chamber.)");
	settings.Add("princess", true, "Mario appears in princess chamber (WW finish)");
	settings.SetToolTip("princess", "Experimental: Split upon the first frame of mario in princess' chamber");
	settings.Add("levelComplete", true, "split upon lvl completion");
	settings.SetToolTip("levelComplete", "only when roulette box is hit");
	settings.Add("largeChest", true, "split when large chest opened in Toad house");
	settings.SetToolTip("levelComplete", "useful for 1-3 WW");
	settings.Add("smallChest", true, "split upon opening small chest");
	settings.SetToolTip("levelComplete", "useful for World 8 and 1-Tower WW");
}
