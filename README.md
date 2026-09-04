# Questie-335

A backport of the WoW Classic [Questie](https://github.com/Questie/Questie) addon, aiming to provide compatibility with the Wrath of the Lich King 3.3.5a client (build 12340).

# Installation

- [Download](https://github.com/Javilico92/Questie-335/releases) the archive.
- Extract it into your `Interface/AddOns/` directory. The addon folder should be named `Questie-335`.
- If you are playing on a custom server that emulates an earlier expansion using the 3.3.5 client, you can add `-Classic` or `-TBC` to the addon folder name to load only the files required for that expansion.
- If your server does not provide a world map patch, enable the following in-game option: `Options/Advanced/Use WotLK map data`.

> [!IMPORTANT]
> There are many different 3.3.5 servers, and not all of them handle addons, `CHAT_MSG_ADDON`, and related systems in the same way. </br></br>
>
> For **WARMANE** users, there are two important things to keep in mind:</br></br>
>
> **Whispers** only work for players at **level 10 or above**, so some parts of **QuestieComms** may not work as expected below that level. For example, full quest log synchronization when joining a group may fail.</br></br>
>
> Also, **QuestieComms** uses an encoding format that does not work correctly on Warmane by default. **Questie-335 10.23.2 or newer is required** to fix this issue:
> https://github.com/Javilico92/Questie-335/commit/4c5304698183ea3675e9cb9851d71e4f527b9d59
> </br></br>
>
> I also play on UltimoWoW and Nelwy, and there do not appear to be any known issues there at the moment.

## Language version
- [English](README.md)
- [Español](README_ES.md)


# Questie

[![Questie official Discord (not mine)](https://img.shields.io/badge/discord-Questie-738bd7)](https://discord.gg/s33MAYKeZd)
[![Stars](https://img.shields.io/github/stars/Javilico92/Questie-335)](https://img.shields.io/github/stars/Javilico92/Questie-335)

[![Downloads](https://img.shields.io/github/downloads/Javilico92/Questie-335/total.svg)](https://github.com/Javilico92/Questie-335/releases/)
[![Downloads Latest](https://img.shields.io/github/downloads/Javilico92/Questie-335/v11.0.1/total.svg)](https://github.com/Javilico92/Questie-335/releases/latest)
[![Latest Release Date](https://img.shields.io/github/release-date/Javilico92/Questie-335.svg)](https://github.com/Javilico92/Questie-335/releases/latest)
[![Commits Since Latest](https://img.shields.io/github/commits-since/Javilico92/Questie-335/latest.svg)](https://github.com/Javilico92/Questie-335/commits/master)


## Download

[The latest release can be found here](https://github.com/Javilico92/Questie-335/releases).

At the moment, there is no other official way to download or update the Questie-335 addon.


## Information

- [Frequently Asked Questions](https://github.com/Questie/Questie/wiki/FAQ)
- You can chat with the Questie community on the [official Discord server](https://discord.gg/s33MAYKeZd).
- You can use the [issue tracker](https://github.com/Javilico92/Questie-335/issues) to report bugs and submit feature requests (requires a GitHub account).
- When creating an issue, please follow the provided issue template to help speed up investigation and fixes.
- If you receive a Lua error from the WoW client, please include the **complete** error message or a screenshot in your report.
    - You need to enter `/console scriptErrors 1` once in the in-game chat to enable Lua error messages. You can disable them again later with `/console scriptErrors 0`.

Trust us, it's (Good)!


## Languages

Questie includes translations for all officially supported WoW Classic languages:

English, German, French, Spanish, Portuguese, Russian, Simplified Chinese, Traditional Chinese, and Korean.

If you want to help with translations, check the [Translation folder](https://github.com/Questie/Questie/tree/master/Localization/Translations) and search for missing translations using:

> `["<yourLanguage>"] = false`  
> For example: `["deDE"] = false`

Then replace `false` with the translated string:

> `["<yourLanguage>"] = "YourTranslation"`

There is also support for Ukrainian ([through another addon](https://www.curseforge.com/wow/addons/questie-translation-ukrainian)).

Following [this guide](https://github.com/Questie/Questie/wiki/Localization-to-more-languages), you can add support for additional languages.


## Contribution

- We appreciate every contribution, so feel free to submit a Pull Request on GitHub.


### Installing Lua

1. Install [Lua](https://www.lua.org/download.html) (version 5.1, since the WoW client uses Lua 5.1).
   - On macOS: `brew install lua@5.1`
2. Install [LuaRocks](https://luarocks.org/).
   - On macOS: `brew install luarocks`
3. Configure LuaRocks to use the correct Lua version. By default, LuaRocks uses the latest installed Lua version.
   - `luarocks config lua_version 5.1`
4. Install [busted](https://github.com/lunarmodules/busted).
   - `luarocks install busted`
5. Install `bit32`.
   - `luarocks install bit32`
6. Install [luacheck](https://github.com/lunarmodules/luacheck).
   - `luarocks install luacheck`


### luacheck

Questie uses `luacheck` for linting.

You can run it locally with:

`luacheck -q Database Localization Modules Questie.lua`


### Unit Tests

1. Run `busted -p ".test.lua" .` in the root directory of the project.
2. When adding new tests, make sure to name them `<module>.test.lua` and place them next to the corresponding module.


## Donation

If you'd like to support the development of the original Questie project (**not me**) by donating, you can do so via PayPal:

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JCUBJWKT395ME&source=url"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif"/></a>


## Features


### Show quests on the map

- Shows quest start points, turn-in points, and objective locations.
- Shows NPC movement paths using waypoint lines.

![Questie Quest Givers](https://i.imgur.com/4abi5yu.png)
![Questie Complete](https://i.imgur.com/DgvBHyh.png)
![Questie Tooltip](https://i.imgur.com/uPykHKC.png)


### Quest Tracker

- Automatically tracks quests when they are accepted.
- Can display all quests from the quest log at once instead of the default limit of 5.
- Left-click a quest to open the quest log (configurable).
- Right-click for additional options, such as:
    - Focus quest, making other quest icons translucent.
    - Point an arrow towards an objective (requires the [TomTom addon](https://www.curseforge.com/wow/addons/tomtom)).

![QuestieTracker](https://user-images.githubusercontent.com/8838573/67285596-24dbab00-f4d8-11e9-9ae1-7dd6206b5e48.png)


### Quest Communication

- You can see party members' quest progress in tooltips.


### Tooltips

- Shows additional information on map notes and quest-related NPCs/objects.
- Holding Shift while hovering over a map icon displays more information, such as quest XP.


### Journey Log

- Questie records the steps of your journey in the **"My Journey"** window. Left-click the minimap button and select **"My Journey"**, or type `/questie journey`.

![Journey](https://user-images.githubusercontent.com/8838573/67285651-3cb32f00-f4d8-11e9-95d8-e8ceb2a8d871.png)


### Quests by Zone

- Questie lists all quests in a zone, divided into completed and available quests. Gotta complete 'em all! Left-click the minimap button and select **"Quests by Zone"**.

![QuestsByZone](https://user-images.githubusercontent.com/8838573/67285665-450b6a00-f4d8-11e9-9283-325d26c7c70d.png)


### Search

- Questie's database can be searched. Right-click the minimap button to open the search window.

![Search](https://user-images.githubusercontent.com/8838573/67285691-4f2d6880-f4d8-11e9-8656-b3e37dce2f05.png)


### Configuration

- Extensive configuration options. Right-click the minimap button to open them, or type `/questie`.