state("fceux"){}
state("retroarch"){}

init
{
    int fceuxBaseAddress = 0x3B1388; // 2.2.3
    int retroarchBaseAddress = 0x4B2850; // 1.7.3 nestopia 1.5.0
	int emuOffset = memory.ProcessName.ToLower().Contains("fceux") ? fceuxBaseAddress : retroarchBaseAddress;

	vars.watchers = new MemoryWatcherList
	{
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x727) { Name = "world" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x2) { Name = "bowserDoor1" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x71D) { Name = "bowserDoor2" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x4D0) { Name = "princess1" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x4D1) { Name = "princess2" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x4D2) { Name = "princess3" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x1F4) { Name = "start1" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x1F7) { Name = "start2" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x5F2) { Name = "levelComplete" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x5F2) { Name = "largeChest" },
		new MemoryWatcher<byte>((IntPtr)emuOffset + 0x5F2) { Name = "smallChest" },
	};
	
	print("Attached to process: " + memory.ProcessName.ToLower());
}

split
{
	return (settings["worlds"] && ((settings["warp"] || vars.watchers["world"].Current != 8) && vars.watchers["world"].Old != vars.watchers["world"].Current)) ||
		(settings["bowserDoor"] && vars.watchers["bowserDoor1"].Old == 0 && vars.watchers["bowserDoor1"].Current == 1 && vars.watchers["bowserDoor2"].Old == 58 && vars.watchers["bowserDoor2"].Current == 62) ||
		(settings["princess"] && vars.watchers["princess1"].Old == 77 && vars.watchers["princess1"].Current == 0 && vars.watchers["princess2"].Old == 176 && vars.watchers["princess2"].Current == 0 && vars.watchers["princess3"].Old == 152 && vars.watchers["princess3"].Current == 0) ||
		(settings["levelComplete"] && vars.watchers["levelComplete"].Old == 0 && vars.watchers["levelComplete"].Current == 33024) ||
		(settings["largeChest"] && vars.watchers["largeChest"].Old == 256 && vars.watchers["largeChest"].Current == 257) ||
		(settings["smallChest"] && vars.watchers["smallChest"].Old == 0 && vars.watchers["smallChest"].Current == 512);
}

start
{
	return settings["start"] && vars.watchers["start1"].Old == 0 && vars.watchers["start1"].Current == 255 && vars.watchers["start2"].Old == 0 && vars.watchers["start2"].Current == 34;
}

startup
{
	settings.Add("worlds", true, "World Change");
	settings.SetToolTip("worlds", "Split on world changes");
	settings.Add("start", false, "Start Enable");
	settings.SetToolTip("start", "Enable start button to start timer from main screen");
	settings.Add("bowserDoor", false, "Bowser Door Opens (non-WW finish)");
	settings.SetToolTip("bowserDoor", "Split after Bowser's chamber door opens and is enterable (before seeing Peach's chamber, inconsistent.)");
	settings.Add("warp", false, "Split upon entering warp world");
	settings.SetToolTip("warp", "Split upon entering warp world (only usable when splitting on world changes)");
	settings.Add("princess", false, "Mario appears in princess chamber (WW finish)");
	settings.SetToolTip("princess", "Experimental: Split upon the first frame of mario in princess' chamber (inconsistent)");
	settings.Add("levelComplete", false, "Split upon level completion");
	settings.SetToolTip("levelComplete", "Level complete upon hitting roulette box only");
	settings.Add("largeChest", false, "Toad house chests");
	settings.SetToolTip("largeChest", "Useful for 1-3 WW");
	settings.Add("smallChest", false, "Split upon opening small chest");
	settings.SetToolTip("smallChest", "Useful for World 8 and 1-Tower WW");

	Action<string> DebugOutput = (text) => {
		print("[Super Mario Bros 3. Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
}

update
{
	vars.watchers.UpdateAll(game);
}