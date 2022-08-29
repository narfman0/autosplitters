# autosplitters

This is a personal archive of autosplitters

## Usage

Unless otherwise specified, the patches will be distributed as ips files.
The patching program, Lunar IPS, will take the the original rom you backed
up and an ips file to produce a new patched rom file.

Steps:

* [Download](http://livesplit.github.io/downloads/) and run Livesplit
* Once your layout is loaded, go to "Edit Layout..."
* Select +
* Select Control / Scriptable Auto Splitter
* Select the target file you wish to autosplit :)

## Super Mario Bros 3 (PRG0 or PRG1)

### Compatibility

* FCEUX 2.2.3, 2.6.4
* nestopia 1.51.1

### Settings

`Worlds`: enable autosplit on world changes. e.g.: 1->2, 2->3, 1->warp zone, warp zone->8. Neither starting game nor door reveal
`Bowser Door`: enable autosplit after bowser's door 'poofs' and is enterable (for non-wrong warp)
`Princess`: enable autospplit on first frame of princess chamber when mario appears (for wrong warp)
`Start Enable`: enable starting splits upon pressing 'start' to begin a run (common standard for run categories)

### Video Autosplitter (Beta)

WIP: `smb3.vas` may be used as a video autosplitter targetting warpless and 100% categories.
It is not as configurable, but can be used across many systems, including o.g. nes setups.
See below section on Video Autosplitter Configuration.

Note: `smb3.vas` is an up to date version compiled from the src, also in this repository. The
two should always be in sync, but `smb3.vas` may be created by zipping the `smb` folder and
renaming `smb3.zip` to `smb3.vas`.

## Video Autosplitter Configuration

We need to configure OBS to output video, then livesplit to read that video.
We will need a `*.vas` file, which is the game profile. For example, `smb3.vas` is
the game profile for Super Mario Bros. 3.

### OBS

1. Install [OBS Virtualcam](https://obsproject.com/forum/resources/obs-virtualcam.949/)
2. Within OBS, in your "sources", right click your video input. This might be an elgato capture card, emulator, or other video feed.
3. Click "Filters"
4. In "Effect Filters", click Add, VirtualCam
5. Name it (anything) and click "start". Note: You must click start every time you start obs! This setting is not saved!

### Livesplit

* Download this repository and save the game profile somewhere reasonable (like in your livesplit directory)
* Follow the [Livesplit VideoAutoSplit Installation directions](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit?ts=2#installation)
  * During installation step 6 "the game profile you wish to use", select the `*.vas` game profile saved previously.
  * During installation step 7, select the component you named in OBS/step 5.
  * During installation step 8, you might need to restart livesplit.
  * During installation step 8, you MUST verify the "Scan Region" tab. It should show a uniquely colored output of your smb3 video feed.

## License

Please see included LICENSE file for more info