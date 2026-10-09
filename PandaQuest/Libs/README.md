# Embedded libraries

All libraries are embedded unmodified (upstream names and MAJOR versions). Versions are the
`MINOR` numbers found in each file. Load order is defined in `../embeds.xml`.

| Library | MAJOR | MINOR | Source | License |
|---|---|---|---|---|
| LibStub | `LibStub` | 2 | Ace3 distribution | Public Domain |
| CallbackHandler-1.0 | `CallbackHandler-1.0` | 8 | Ace3 distribution | BSD (Ace3 license, `LICENSE-Ace3.txt`) |
| AceAddon-3.0 | `AceAddon-3.0` | 13 | Ace3 distribution | BSD (Ace3) |
| AceEvent-3.0 | `AceEvent-3.0` | 4 | Ace3 distribution | BSD (Ace3) |
| AceTimer-3.0 | `AceTimer-3.0` | 17 | Ace3 distribution | BSD (Ace3) |
| AceBucket-3.0 | `AceBucket-3.0` | 4 | Ace3 distribution | BSD (Ace3) |
| AceDB-3.0 | `AceDB-3.0` | 33 | Ace3 distribution | BSD (Ace3) |
| AceDBOptions-3.0 | `AceDBOptions-3.0` | 15 | Ace3 distribution | BSD (Ace3) |
| AceConsole-3.0 | `AceConsole-3.0` | 7 | Ace3 distribution | BSD (Ace3) |
| AceGUI-3.0 (+ widgets) | `AceGUI-3.0` | 41 | Ace3 distribution (test file removed) | BSD (Ace3) |
| AceConfig-3.0 | `AceConfig-3.0` | 3 | Ace3 distribution | BSD (Ace3) |
| AceConfigRegistry-3.0 | `AceConfigRegistry-3.0` | 22 | (inside AceConfig-3.0) | BSD (Ace3) |
| AceConfigCmd-3.0 | `AceConfigCmd-3.0` | 14 | (inside AceConfig-3.0) | BSD (Ace3) |
| AceConfigDialog-3.0 | `AceConfigDialog-3.0` | 92 | (inside AceConfig-3.0) | BSD (Ace3) |
| AceLocale-3.0 | `AceLocale-3.0` | 6 | https://raw.githubusercontent.com/WoWUIDev/Ace3/master/AceLocale-3.0/ | BSD (Ace3) |
| LibDataBroker-1.1 | `LibDataBroker-1.1` | 4 | Ace3 distribution | Public Domain / WTFPL (see README.textile) |
| LibDBIcon-1.0 | `LibDBIcon-1.0` | 55 | Ace3 distribution | Public Domain (per upstream) |
| HereBeDragons-2.0 | `HereBeDragons-2.0` | 33 | HereBeDragons 2.16-release (Nevcairiel) | BSD |
| HereBeDragons-Pins-2.0 | `HereBeDragons-Pins-2.0` | 17 | HereBeDragons (Nevcairiel) | BSD |
| HereBeDragons-Migrate | `HereBeDragons-Migrate` | 2 | HereBeDragons (Nevcairiel) | BSD |

Notes
- HereBeDragons is embedded with its upstream MAJOR (`HereBeDragons-2.0`), not a renamed copy, so it is
  shared with other addons that embed the same library (LibStub keeps the newest MINOR).
- The Ace3 license text is in `LICENSE-Ace3.txt`.
