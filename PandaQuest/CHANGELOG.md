# Changelog

All notable changes to PandaQuest are documented here.

## [0.2.196] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,975 quests, 24 NPCs, 1 object
- quest 27952 - The Explorers - updated
- quest 27953 - The Reliquary - updated
- quest 27954 - The Eyes Have It - updated
- quest 27955 - Eye Spy - updated
- quest 27956 - Lunk's Task - updated
- quest 27957 - Lunk No Kill - updated
- quest 27958 - A Proper Antivenom - updated
- quest 27959 - Lunk's Adventure: Spider Rider - updated
- quest 27960 - The Fewer, the Better - updated
- quest 27961 - Out of Place - updated
- quest 27962 - A Lumbering Relic - updated
- quest 27963 - A New Master... But Who? - updated
- quest 27964 - Dig-Boss Dinwhisker - updated
- quest 27965 - Thorium Point: The Seat of the Brotherhood - updated
- quest 27966 - Salvaging the Remains - updated
- quest 27967 - First Lieutenant Connor - updated
- quest 27968 - Fury of the Pack - updated
- quest 27969 - Make Yourself Useful - updated
- quest 27970 - Captain P. Harris - updated
- quest 27971 - Rattling Their Cages - updated
- quest - and 50 more quests updated

## [0.2.195] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,905 quests, 24 NPCs, 1 object
- quest 27880 - Half-Ton Holdouts - updated
- quest 27881 - Bloodwatcher Point - updated
- quest 27882 - It's Not About History, It's About Power - updated
- quest 27883 - The Warden's Pawn - updated
- quest 27884 - The Sentinel's Pawn - updated
- quest 27885 - The Warden's Game - updated
- quest 27886 - The Sentinel's Game - updated
- quest 27887 - Ancient Protectors - updated
- quest 27888 - Return to Blam - updated
- quest 27889 - New Kargath - updated
- quest 27890 - The Bad Dogs - updated
- quest 27891 - Amakkar, Jack of All Trades - updated
- quest 27892 - Jurrix the Striker - updated
- quest 27893 - Gargal, the Behemoth - updated
- quest 27894 - The Wrath of a Dragonflight - updated
- quest 27895 - Their Hunt Continues - updated
- quest 27896 - The Sorrow and the Fury - updated
- quest 27897 - The Hidden Clutch - updated
- quest 27898 - Rheastrasza's Gift - updated
- quest 27899 - That Gleam in his Eye - updated
- quest - and 50 more quests updated

## [0.2.194] - 2026-10-20

Groundwork for a second game (WoW Forever). In Mists of Pandaria Classic nothing a player sees
changes.

### Added
- `Core/Game.lua`, the first file the addon loads, tells which game the client is: Mists of Pandaria
  Classic (5.5.x, interface 505xx) or WoW Forever (interface 16000-16999, or project id 18). Other
  clients are "unknown". The answer is `ns.Game.id`: `mop`, `forever` or `unknown`.
- The quest database says which game it was built for: `ns.Data.game = "mop"` in
  `Database/Data/Meta.lua`. A database that does not say is MoP's, as every database so far is. If it
  is not the game being played, PandaQuest does not load it -- no quest, NPC or object of it reaches
  the arrow, the map or a tooltip -- and prints one line naming both games.
- Every saved variable (`PandaQuestDB`, `PandaQuestSync`, `PandaQuestAH`, `PandaQuestProf`) gets a
  `game` key the first time this version loads it. Nothing else in it is changed, removed or
  re-shaped: the saved file is what it was, plus one line in each.
- Saved data written in another game -- for example a `WTF` folder copied from another install -- is
  never deleted. It is moved, whole and unchanged, under `foreign.<game>` in the same saved variable
  (`foreign.<game>-2` if that name is taken), this game starts with its own, and one chat line says so.

### Changed
- Release tooling, not part of the addon: every TOC is written from one template
  (`.github/release/PandaQuest.toc.template`, with `games.py`), and the CurseForge upload maps every
  TOC the package carries to a game version and its CurseForge game version type. The package is
  unchanged: Mists of Pandaria Classic is the only game it carries.

## [0.2.193] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,835 quests, 24 NPCs, 1 object
- quest 27803 - Welcome Relief - updated
- quest 27804 - The Only Homes We Have - updated
- quest 27805 - Small Comforts - updated
- quest 27806 - Honorable Bearing - updated
- quest 27807 - Clan Mullan - updated
- quest 27808 - Stubborn as a Doyle - updated
- quest 27809 - Firebeard Bellows - updated
- quest 27810 - The Fighting Spirit - updated
- quest 27811 - The Scent of Battle - updated
- quest 27812 - The Loyalty of Clan Mullan - updated
- quest 27813 - Death Worthy of a Dragonmaw - updated
- quest 27814 - Anything We Can Get - updated
- quest 27815 - Somethin' for the Boys - updated
- quest 27816 - Personal Request - updated
- quest 27817 - Dropping the Hammer - updated
- quest 27818 - Slithering Signs - updated
- quest 27821 - Orcs and Humans - updated
- quest 27822 - Lumbering Oafs - updated
- quest 27823 - A Dwarf's Got Needs - updated
- quest 27824 - The Good Stuff - updated
- quest - and 49 more quests updated

## [0.2.192] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,766 quests, 24 NPCs, 1 object
- quest 11014 - Enter the Taskmaster - updated
- quest 24469 - Hold the Line! - updated
- quest 27724 - Hero's Call: Vashj'ir! - updated
- quest 27725 - Quel'Danil Lodge - updated
- quest 27726 - Hero's Call: Mount Hyjal! - updated
- quest 27727 - Hero's Call: Deepholm! - updated
- quest 27729 - Once More, With Eeling - updated
- quest 27733 - The Good Ol' Switcheroo - updated
- quest 27737 - By Fire Be Saved! - updated
- quest 27738 - The Pit of Scales - updated
- quest 27739 - The Gnoll King - updated
- quest 27740 - Baba Bogbrew - updated
- quest 27742 - A Little on the Side - updated
- quest 27743 - While We're Here - updated
- quest 27744 - Rune Ruination - updated
- quest 27745 - A Fiery Reunion - updated
- quest 27746 - Empire of Dirt - updated
- quest 27747 - Total War - updated
- quest 27748 - Fortune and Glory - updated
- quest 27750 - War Forage - updated
- quest - and 46 more quests updated

## [0.2.191] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,702 quests, 24 NPCs, 1 object
- quest 27641 - While Meeting The Family - updated
- quest 27642 - Sifting Through The Wreckage - updated
- quest 27643 - Donnelly Dunwald - updated
- quest 27644 - Eoin Dunwald - updated
- quest 27645 - Cayden Dunwald - updated
- quest 27646 - Finding Beak - updated
- quest 27647 - Anything But Water - updated
- quest 27648 - Once More Into The Fire - updated
- quest 27649 - A Steady Supply - updated
- quest 27650 - Home Again - updated
- quest 27651 - Doing It Like a Dunwald - updated
- quest 27652 - Dark Assassins - updated
- quest 27653 - Dark Assassins - updated
- quest 27654 - Bring the Hammer Down - updated
- quest 27655 - Bring the Hammer Down - updated
- quest 27656 - Croc-Out - updated
- quest 27657 - Help from the Earthcaller - updated
- quest 27658 - Help from the Earthcaller - updated
- quest 27659 - Portal Overload - updated
- quest 27660 - Spirit of the Loch - updated
- quest - and 50 more quests updated

## [0.2.190] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,632 quests, 24 NPCs, 1 object
- quest 27564 - In Defense of the Redoubt - updated
- quest 27565 - Into the Prison - updated
- quest 27567 - Twilight?! No! - updated
- quest 27568 - Infiltrating Shadowforge City - updated
- quest 27569 - Dark Iron Tacticians - updated
- quest 27571 - The Grim Guzzler - updated
- quest 27573 - The Dark Iron Pact - updated
- quest 27574 - I Never Forget a Face - updated
- quest 27575 - From the Belly of the Beast - updated
- quest 27576 - Patchwork Command - updated
- quest 27577 - 7th Legion Battle Plans - updated
- quest 27578 - Morgan's Fruition - updated
- quest 27580 - Sowing Discord - updated
- quest 27581 - Twilight?! No! - updated
- quest 27583 - The Northern Flank - updated
- quest 27584 - Blood in the Surf - updated
- quest 27585 - The 109th Division - updated
- quest 27586 - Shells on the Sea Shore - updated
- quest 27587 - Maliciously Delicious - updated
- quest 27588 - Signal the Attack - updated
- quest - and 48 more quests updated

## [0.2.189] - 2026-10-20

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,564 quests, 24 NPCs, 1 object
- quest 27477 - The Corpulent One - updated
- quest 27478 - Relios the Relic Keeper - updated
- quest 27479 - Righteous Indignation - updated
- quest 27480 - Ley Energies - updated
- quest 27481 - Out of the Ziggurat - updated
- quest 27482 - Into the Flames - updated
- quest 27483 - Practical Vengeance - updated
- quest 27484 - Only One May Enter - updated
- quest 27485 - Warm Welcome - updated
- quest 27486 - Warm Welcome - updated
- quest 27487 - Ix'lar the Underlord - updated
- quest 27488 - Impatience - updated
- quest 27489 - Nobody to Blame but Myself - updated
- quest 27490 - SI:7 Drop - updated
- quest 27491 - Kor'kron Drop - updated
- quest 27492 - Ogres & Ettins - updated
- quest 27493 - Ogres & Ettins - updated
- quest 27494 - Move the Mountain - updated
- quest 27495 - Move the Mountain - updated
- quest 27496 - Call in the Artillery - updated
- quest - and 52 more quests updated

## [0.2.188] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,492 quests, 24 NPCs, 1 object
- quest 27401 - What Tomorrow Brings - updated
- quest 27402 - Token of Power - updated
- quest 27403 - A True Sunwalker - updated
- quest 27404 - The Circle's Future - updated
- quest 27405 - Fall Back! - updated
- quest 27406 - A Man Named Godfrey - updated
- quest 27420 - Postponing the Inevitable - updated
- quest 27421 - Amidst Death, Life - updated
- quest 27422 - A City Under Siege - updated
- quest 27423 - Resistance is Futile - updated
- quest 27425 - A Grim Connection - updated
- quest 27426 - Confirming the Suspicion - updated
- quest 27427 - Arms of the Grimtotems - updated
- quest 27428 - Tabetha's Assistance - updated
- quest 27429 - Raze Direhorn Post! - updated
- quest 27430 - Justice for the Hyals - updated
- quest 27431 - Tipping the Balance - updated
- quest 27432 - Zaeldarr the Outcast - updated
- npc 12262 - Ziggurat Protector - updated
- npc 45610 - Daschla - updated
- quest - and 44 more quests updated

## [0.2.187] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,430 quests, 22 NPCs, 1 object
- quest 27291 - Peace at Last - updated
- quest 27298 - Seek Out Master Pyreanor - updated
- quest 27299 - Torn Ground - updated
- quest 27300 - Pushing Back - updated
- quest 27301 - Unbroken - updated
- quest 27302 - Simple Solutions - updated
- quest 27303 - Mercy for the Bound - updated
- quest 27304 - Follow the Sun - updated
- quest 27305 - Of Love and Family - updated
- quest 27310 - No Weapons For You! - updated
- quest 27312 - Darkcloud Grimtotem - updated
- quest 27314 - Grimtotem Chiefs: Isha Gloomaxe - updated
- quest 27316 - The Rattle of Bones - updated
- quest 27318 - Grimtotem Chiefs: Elder Stormhoof - updated
- quest 27320 - The Writ of History - updated
- quest 27322 - Korok the Colossus - updated
- quest 27323 - Grimtotem Chiefs: Grundig Darkcloud - updated
- quest 27325 - The Drums of War - updated
- quest 27327 - Grimtotem Chiefs: The Chief of Chiefs - updated
- npc 23768 - Lynn Hyal - updated
- quest - and 55 more quests updated

## [0.2.186] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,356 quests, 21 NPCs, 1 object
- quest 27195 - Nowhere to Run - updated
- quest 27196 - On to Something - updated
- quest 27197 - The Battle Resumes! - updated
- quest 27198 - Supporting the Troops - updated
- quest 27199 - Ashes to Ashes - updated
- quest 27200 - Siren's Song - updated
- quest 27201 - Val'kyr Incursion - updated
- quest 27202 - Brother Against Brother - updated
- quest 27203 - The Maelstrom - updated
- quest 27204 - Aradne - updated
- quest 27205 - The Depravity of the Forsaken - updated
- quest 27206 - Alas, Andorhal - updated
- quest 27208 - The Dreadlord Balnazzar - updated
- quest 27210 - Traitors Among Us - updated
- quest 27211 - Propaganda War - updated
- quest 27212 - Discrediting the Deserters - updated
- quest 27213 - The End of the Deserters - updated
- quest 27214 - A Disturbing Development - updated
- quest 27215 - The Hermit of Swamplight Manor - updated
- quest 27216 - This Old Lighthouse - updated
- quest - and 53 more quests updated

## [0.2.185] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,283 quests, 21 NPCs, 1 object
- quest 27095 - Skitterweb Menace - updated
- quest 27096 - Orcs are in Order - updated
- quest 27097 - Rise, Forsaken - updated
- quest 27098 - Lordaeron - updated
- quest 27099 - No Escape - updated
- quest 27100 - Twilight Research - updated
- quest 27101 - Maziel's Revelation - updated
- quest 27102 - Maziel's Ascendancy - updated
- quest 27103 - Shards of the Felvine - updated
- quest 27104 - Alzzin the Wildshaper - updated
- quest 27106 - A Villain Unmasked - updated
- quest 27109 - The Warped Defender - updated
- quest 27110 - The Madness Within - updated
- quest 27111 - The Treasure of the Shen'dralar - updated
- quest 27112 - The Cursed Remains - updated
- quest 27113 - The Shen'dralar Ancient - updated
- quest 27114 - The Gordok Taste Test - updated
- quest 27115 - Ando's Call - updated
- quest 27116 - The Winds of Loch Modan - updated
- quest 27119 - The Gordok Ogre Suit - updated
- quest - and 46 more quests updated

## [0.2.184] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,217 quests, 21 NPCs, 1 object
- quest 26975 - Rallying the Fleet - updated
- quest 26977 - Twilight Investigation - updated
- quest 26980 - Swiftgear Station - updated
- quest 26981 - Whelgar's Retreat - updated
- quest 26989 - The Gilneas Liberation Front - updated
- quest 26992 - Agony Abounds - updated
- quest 26995 - Guts and Gore - updated
- quest 26997 - The Usual Suspects - updated
- quest 26998 - Iterating Upon Success - updated
- quest 27003 - Easy Money - updated
- quest 27004 - The Twilight Plot - updated
- quest 27005 - The Twilight Plot - updated
- quest 27006 - Fly Over - updated
- quest 27007 - Silvermarsh Rendezvous - updated
- quest 27008 - Fly Over - updated
- quest 27009 - The Coldbringer - updated
- quest 27010 - Quicksilver Submersion - updated
- quest 27014 - Hallowed Note - updated
- quest 27015 - Consecrated Note - updated
- object 207381 - Deep Alabaster Crystal Chunk - updated
- quest - and 58 more quests updated

## [0.2.183] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,140 quests, 21 NPCs
- quest 768 - Gathering Leather - updated
- quest 8228 - Could I get a Fishing Flier? - updated
- quest 8229 - Could I get a Fishing Flier? - updated
- quest 11531 - Strange Engine Part - updated
- quest 11665 - Crocolisks in the City - updated
- quest 11666 - Bait Bandits - updated
- quest 13830 - The Ghostfish - updated
- quest 13832 - Jewel Of The Sewers - updated
- quest 13834 - Dangerously Delicious - updated
- quest 26842 - Out of Gnoll-where - updated
- quest 26843 - A Tiny, Clever Commander - updated
- quest 26844 - Kobold and Kobolder - updated
- quest 26845 - Who's In Charge Here? - updated
- quest 26846 - A Nasty Exploit - updated
- quest 26854 - The Lost Pilot - updated
- quest 26855 - A Pilot's Revenge - updated
- quest 26857 - Abyssion's Minions - updated
- quest 26860 - Thelsamar Blood Sausages - updated
- quest 26861 - Block the Gates - updated
- npc 1393 - Berserk Trogg - updated
- quest - and 68 more quests updated

## [0.2.182] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 5,057 quests, 20 NPCs
- quest 26762 - Reactivate the Constructs - updated
- quest 26763 - Venture Company Mining - updated
- quest 26765 - Return to Corporal Kaleb - updated
- quest 26766 - Big Game, Big Bait - updated
- quest 26768 - To Catch a Dragon - updated
- quest 26769 - Raging River Ride - updated
- quest 26770 - Mystic Masters - updated
- quest 26771 - Testing the Trap - updated
- quest 26772 - Mind Vision - updated
- quest 26773 - See Raptor - updated
- quest 26774 - Mind Control - updated
- quest 26775 - Be Raptor - updated
- quest 26776 - Ghaliri - updated
- quest 26777 - Soothing Spirits - updated
- quest 26778 - The Cries of the Dead - updated
- quest 26779 - Zul'Mamwe Mambo - updated
- quest 26780 - Nighttime in the Jungle - updated
- npc 1506 - Scarlet Convert - updated
- npc 1507 - Scarlet Initiate - updated
- npc 1667 - Meven Korgal - updated
- quest - and 55 more quests updated

## [0.2.181] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,985 quests, 17 NPCs
- quest 26671 - The Fate of Stalvan Mistmantle - updated
- quest 26672 - Clawing at the Truth - updated
- quest 26674 - Mistmantle's Revenge - updated
- quest 26676 - Juice Delivery - updated
- quest 26677 - Ghoulish Effigy - updated
- quest 26680 - Ogre Thieves - updated
- quest 26681 - Note to the Mayor - updated
- quest 26683 - Look To The Stars - updated
- quest 26684 - The Insane Ghoul - updated
- quest 26685 - Classy Glass - updated
- quest 26686 - Bones That Walk - updated
- quest 26687 - Reinforcements From Theramore - updated
- quest 26688 - Worgen in the Woods - updated
- quest 26689 - The Rotting Orchard - updated
- quest 26690 - Vile and Tainted - updated
- quest 26691 - Worgen in the Woods - updated
- quest 26692 - Shadowhide Extinction - updated
- quest 26693 - The Dark Tower - updated
- quest 26694 - The Grand Magus Doane - updated
- quest 26702 - Flight to Theramore - updated
- quest - and 49 more quests updated

## [0.2.180] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,916 quests, 17 NPCs
- quest 26549 - Madness - updated
- quest 26556 - No Dumping Allowed - updated
- quest 26557 - A Staggering Effort - updated
- quest 26560 - Jorgensen - updated
- quest 26561 - Krakauer - updated
- quest 26562 - And Last But Not Least... Danforth - updated
- quest 26563 - Return of the Bravo Company - updated
- quest 26564 - Fixer Upper - updated
- quest 26567 - John J. Keeshan - updated
- quest 26568 - This Ain't My War - updated
- quest 26569 - Surveying Equipment - updated
- quest 26570 - Render's Army - updated
- quest 26571 - Weapons of War - updated
- quest 26572 - A Golden Opportunity - updated
- quest 26573 - His Heart Must Be In It - updated
- quest 26574 - Adella's Covert Camp - updated
- quest 26575 - Rock Bottom - updated
- quest 26576 - Steady Hand - updated
- quest 26577 - Rocky Upheaval - updated
- npc 565 - Rabid Dire Wolf - updated
- quest - and 54 more quests updated

## [0.2.179] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,843 quests, 16 NPCs
- quest 26453 - A Helping Hand - updated
- quest 26454 - A Shameful Waste - updated
- quest 26455 - The Lost Chalice - updated
- quest 26456 - Report from the Northern Front - updated
- quest 26457 - Agents of Destruction - updated
- quest 26462 - The Wicked Revantusk - updated
- quest 26463 - Finding Teronis - updated
- quest 26464 - The Lost Gem - updated
- quest 26465 - The Ancient Statuettes - updated
- quest 26466 - Ruuzel - updated
- quest 26467 - Vile Satyr! Dryads in Danger! - updated
- quest 26468 - The Branch of Cenarius - updated
- quest 26469 - Satyr Slaying! - updated
- quest 26470 - Retaking Mystral Lake - updated
- quest 26472 - Insane Druids - updated
- quest 26473 - Bathran's Hair - updated
- quest 26474 - Orendil's Cure - updated
- quest 26475 - Elune's Tear - updated
- quest 26476 - Dryad Delivery - updated
- quest 26477 - Search the Bole - updated
- quest - and 61 more quests updated

## [0.2.178] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,762 quests, 16 NPCs
- quest 2752 - On Iron Pauldrons - updated
- quest 26347 - Keeper of the Flame - updated
- quest 26348 - The Coast Isn't Clear - updated
- quest 26349 - The Coastal Menace - updated
- quest 26353 - Captain Sanders' Hidden Treasure - updated
- quest 26354 - Captain Sanders' Hidden Treasure - updated
- quest 26355 - Captain Sanders' Hidden Treasure - updated
- quest 26356 - Captain Sanders' Hidden Treasure - updated
- quest 26358 - Ready the Air Force - updated
- quest 26361 - Smoot's Samophlange - updated
- quest 26365 - Hero's Call: Redridge Mountains! - updated
- quest 26370 - Return to Sentinel Hill - updated
- quest 26371 - The Legend of Captain Grayson - updated
- quest 26372 - Pre-Flight Checklist - updated
- quest 26373 - On to Kharanos - updated
- quest 26374 - Ready the Ground Troops - updated
- quest 26375 - Loose Stones - updated
- quest 26376 - Hatred Runs Deep - updated
- quest 26377 - Unsolid Ground - updated
- quest 26378 - Hero's Call: Westfall! - updated
- quest - and 44 more quests updated

## [0.2.177] - 2026-10-19

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,698 quests, 16 NPCs
- quest 26204 - The Arts of a Warrior - updated
- quest 26206 - The Future of Gnomeregan - updated
- quest 26209 - Murder Was The Case That They Gave Me - updated
- quest 26213 - Hot On the Trail: The Riverpaw Clan - updated
- quest 26214 - Hot On the Trail: Murlocs - updated
- quest 26215 - Meet Two-Shoed Lou - updated
- quest 26219 - Full Circle - updated
- quest 26220 - Everything Is Better with Bacon - updated
- quest 26221 - Full Circle - updated
- quest 26226 - Crawfish Creole - updated
- quest 26227 - Careful, This Fruit Bites Back - updated
- quest 26228 - Livin' the Life - updated
- quest 26229 - "I TAKE Candle!" - updated
- quest 26230 - Feast or Famine - updated
- quest 26232 - Lou's Parting Thoughts - updated
- quest 26233 - Stealing From Our Own - updated
- quest 26234 - Stealing From Our Own - updated
- quest 26235 - Even Thieves Get Hungry - updated
- quest 26236 - Shakedown at the Saldean's - updated
- quest 26237 - Times are Tough - updated
- quest - and 61 more quests updated

## [0.2.176] - 2026-10-18

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,617 quests, 16 NPCs
- quest 9852 - The Ultimate Bloodsport - updated
- quest 14457 - The Sunreaver Plan - updated
- quest 26127 - The Twilight's Hammer Revealed - updated
- quest 26128 - The Battle of Thandol Span - updated
- quest 26129 - Brothers In Arms - updated
- quest 26130 - Unplug L'ghorek - updated
- quest 26131 - Reinforcements for Loch Modan - updated
- quest 26132 - Fiends from the Netherworld - updated
- quest 26133 - Fiends from the Netherworld - updated
- quest 26135 - Visions of the Past: Rise from the Deep - updated
- quest 26137 - Checking on the Boys - updated
- quest 26139 - Into Arathi - updated
- quest 26140 - Communing with the Ancient - updated
- quest 26141 - Runestones of Binding - updated
- npc 1163 - Stonesplinter Skullthumper - updated
- npc 1166 - Stonesplinter Seer - updated
- npc 7665 - Grol the Destroyer - updated
- npc 7666 - Archmage Allistarj - updated
- npc 7667 - Lady Sevine - updated
- npc 44490 - Captain Taylor - updated
- quest - and 58 more quests updated

## [0.2.175] - 2026-10-18

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,548 quests, 10 NPCs
- quest 9859 - Talbuk Mastery - updated
- quest 26049 - The Princess Unleashed - updated
- quest 26056 - The Wavespeaker - updated
- quest 26057 - The Wavespeaker - updated
- quest 26065 - Free Wil'hai - updated
- quest 26070 - Clearing the Defiled - updated
- quest 26071 - Clearing the Defiled - updated
- quest 26072 - Into the Totem - updated
- quest 26078 - Extinguish the Fires - updated
- quest 26079 - Wanted! Otto and Falconcrest - updated
- quest 26080 - One Last Favor - updated
- quest 26085 - Rallying the Defenders - updated
- quest 26086 - Orako - updated
- quest 26087 - "Glow-Juice" - updated
- quest 26088 - Here Fishie Fishie - updated
- quest 26089 - Die Fishman Die - updated
- quest 26090 - I Brought You This Egg - updated
- quest 26091 - Here Fishie Fishie 2: Eel-Egg-Trick Boogaloo - updated
- quest 26092 - Orako's Report - updated
- quest 26093 - Northfold Manor - updated
- quest - and 22 more quests updated

## [0.2.174] - 2026-10-18

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 4,507 quests, 10 NPCs
- quest 2 - Sharptalon's Claw - updated
- quest 23 - Ursangous's Paw - updated
- quest 24 - Shadumbra's Head - updated
- quest 25 - Simmer Down Now - updated
- quest 47 - Gold Dust Exchange - updated
- quest 52 - Protect the Frontier - updated
- quest 60 - Kobold Candles - updated
- quest 62 - The Fargodeep Mine - updated
- quest 76 - The Jasperlode Mine - updated
- quest 123 - The Collector - updated
- npc 1160 - Captain Halyndor - updated
- npc 1748 - Highlord Bolvar Fordragon - updated
- npc 3231 - Corrupted Dreadmaw Crocolisk - updated
- npc 5296 - Rage Scar Yeti - updated
- npc 5297 - Elder Rage Scar - updated
- npc 9165 - Fledgling Pterrordax - updated
- npc 14527 - Simone the Inconspicuous - updated
- npc 39926 - Twilight Inciter - updated
- npc 41009 - Krom'gar Hot Air Balloon - updated
- npc 41098 - Gnaws - updated
- quest - and 4,496 more quests updated

## [0.2.173] - 2026-10-18

### Added
- The addon now uses what the PandaQuest portal read off Wowhead, carried in
  `Database/Overrides/Wowhead.lua` by the portal's data sync. From this version that file holds, only
  where the generated (Questie) database has nothing of its own:
  - for quests: the money (`rewardMoney`, copper), the reward items with their counts, given
    (`rewardItems`) and "choose one of" (`rewardChoices`), the quest giver's text (`description`), the
    experience where Questie's table has no figure (`rewardXP`), the zone or category (`zoneOrSort`),
    and map points for objectives the database cannot place (`extraObjectives`), besides the givers,
    hand-ins and objective line it already carried;
  - for NPCs and objects: where they stand (`spawns`, `zoneID`) when the database has no place for
    them -- so the arrow and the map pins reach them -- and a whole row for one a quest names that
    the database lacks; for NPCs, the level range, rank and title from their own Wowhead page.
- `DB.GetQuestRewards(questID)` (experience, money, items, choices) and `DB.GetQuestDescription(questID)`
  read the new quest fields; `DB.GetExtra` documents them. A moderator's correction in
  `Database/Overrides/Portal.lua` with the same field name wins.
- The quest browser's page lists the money and the reward items in its Rewards line, with the whole
  list ("You will receive", "Choose one of") on hover, and shows the quest giver's text under the
  objectives on the parchment (`<name>`, `<race>` and `<class>` filled in). The XP column takes the
  portal's figure for a quest Questie has none for.
- A quest you can pick up shows its rewards -- money, experience, items -- under it on its giver's
  tooltip ("Starts: ...") and on its map pin; an NPC's map pin shows its title under the name.
- Four switches, all on by default: General > "Quest text in the quest browser" and "Reward items and
  money in the quest browser"; Tooltips > "Show quest rewards" and "Show NPC titles".

### Changed
- The Wowhead set (`Wowhead.lua`) is applied gap-only when the database loads: it fills a field the
  row has nothing in (nil, 0, blank) and never replaces a value of Questie's, also when the QuestieDB
  bridge filled it first. The community guide and the moderators' corrections are applied after it,
  as before. `Util.FormatMoney` is shared by the auction tooltip and the quest rewards.

## [0.2.172] - 2026-10-18

Data from the PandaQuest portal.

- quest 25802 - Reclaiming Goods - updated
- quest 25803 - The Search Continues - updated
- quest 30772 - Seeing Red - updated
- quest 30893 - The Endless Swarm - updated

## [0.2.171] - 2026-10-18

Data from the PandaQuest portal.

- quest 30975 - The Taking of Dusklight Bridge - updated

## [0.2.170] - 2026-10-18

Data from the PandaQuest portal.

- quest 31138 - The Arts of a Monk - updated
- item 21360 - Deathdealer's Helm - updated
- item 85574 - Darkspear Monk's Staff - updated
- item 89564 - Red Belt of Gentle Persuasion - updated
- item 89565 - Red Belt of Unspoken Warning - updated
- item - More items filled in - updated

## [0.2.169] - 2026-10-18

Data from the PandaQuest portal.

- item 4907 - Woodland Tunic - updated
- item 5395 - Woodland Shield - updated
- item 11189 - Woodland Robes - updated
- item 21359 - Deathdealer's Boots - updated
- item 21362 - Deathdealer's Leggings - updated
- item 25878 - Dusksteel Throwing Knife - updated
- item 29280 - Violet Signet - updated
- item 29288 - Violet Signet - updated
- item 29291 - Violet Signet - updated
- item 57254 - Runner's Boots - updated
- item 73208 - Trainee's Dagger - updated
- item 73212 - Trainee's Dagger - updated

## [0.2.168] - 2026-10-18

Data from the PandaQuest portal.

- item 29277 - Violet Signet - updated
- item 29279 - Violet Signet of the Great Protector - updated
- item 29283 - Violet Signet of the Master Assassin - updated
- item 52879 - Sea Witch's Bracers - updated
- item 52884 - Footsteps of the Fallen Friend - updated
- item 52887 - Zuni's Family Heirloom - updated
- item 57387 - Spymaster's Legs - updated
- item 60260 - Sea Witch's Bag - updated
- item 65624 - SI:7 Special Issue Facemask - updated

## [0.2.167] - 2026-10-17

Data from the PandaQuest portal.

- quest 31140 - Lions for Lambs - updated
- item 29278 - Violet Signet - updated
- item 52889 - Blooded Darkspear Dagger - updated
- item - More items filled in - updated

## [0.2.166] - 2026-10-17

Data from the PandaQuest portal.

- item 21364 - Deathdealer's Vest - updated
- item 21405 - Band of Veiled Shadows - updated
- item 59047 - Free Body Belt - updated
- item 59048 - Torque-Applying Gloves - updated
- item 59049 - Inertial Bracers - updated

## [0.2.165] - 2026-10-17

Data from the PandaQuest portal.

- npc 23003 - Joe Rumsey - updated

## [0.2.164] - 2026-10-17

Data from the PandaQuest portal.

- database - Wowhead fill-ins as on the PandaQuest portal: 1 quest
- quest 24702 - Here Lies Dadanga - updated
- item 25505 - Carinda's Wedding Band - updated
- item 25512 - Tribal Hauberk - updated
- item 25567 - Cord of the Ring - updated
- item 25575 - Thunderbringer's Guard - updated
- item 25592 - Clefthoof Wristguards - updated
- item 25776 - Ogre Slayer's Pendant - updated
- item 27436 - Iron Band of the Unbreakable - updated
- item 28041 - Bladefist's Breadth - updated
- item 30019 - Area 52 Defender's Pants - updated
- item 30364 - Resonating Axe - updated
- item 35601 - Drakonid Arm Blade - updated
- item 36559 - Prized Handscythes - updated
- item 38221 - Shroud of Fluid Strikes - updated
- item 42763 - Bindings of Sabotage - updated
- item 42766 - Spiked Treads of Mutation - updated
- item 43183 - Tundra Tracker's Shoulderguards - updated
- item 64884 - Bilgewater Cartel Tabard - updated
- item 65286 - Ancient Seed Casing - updated

## [0.2.163] - 2026-10-17

### Added
- The gear snapshot (telemetry, `GEAR`, payload version 2) carries the character's sex (`UnitSex`)
  and the barber's choices for its face, skin colour, hair and the race's other features, so the
  PandaQuest portal can draw the character as a 3D figure the way it looks in game. This client
  answers what a face is only while the barber UI is open, so the choices are read when you take the
  barber's chair and again when a change is paid for -- never while you only preview one -- and kept
  with the character in the saved variable until the next visit. A character that has not visited a
  barber since this version sends its sex alone, and the portal draws the default face and hair.
  Nothing is read or kept while telemetry is off.

## [0.2.161] - 2026-10-17

Data from the PandaQuest portal.

- quest 13914 - Searing Roc Feathers - updated
- quest 13915 - Hungry, Hungry Hatchling - updated
- quest 13916 - Poached, Scrambled, Or Raw? - updated
- quest 13917 - Gorishi Grub - updated

## [0.2.160] - 2026-10-16

Data from the PandaQuest portal.

- database - rebuilt from Questie 12.1.0+v1.0.6 (was 11.37.1)
- database - Wowhead fill-ins as on the PandaQuest portal: 0 quests
- quest 216 - Between a Rock and a Thistlefur - fixed
- quest 488 - Zenn's Bidding - fixed
- quest 876 - Serena Bloodfeather - fixed
- quest 1222 - Stinky's Escape - fixed
- quest 2751 - Barbaric Battlements - fixed
- quest 2752 - On Iron Pauldrons - fixed
- quest 2753 - Trampled Under Foot - fixed
- quest 2754 - Horns of Frenzy - fixed
- quest 7141 - The Battle of Alterac - fixed
- quest 7142 - The Battle for Alterac - fixed
- quest 7161 - Proving Grounds - fixed
- quest 7162 - Proving Grounds - fixed
- quest 7163 - Rise and Be Recognized - fixed
- quest 7164 - Honored Amongst the Clan - fixed
- quest 7165 - Earned Reverence - fixed
- quest 7166 - Legendary Heroes - fixed
- quest 7168 - Rise and Be Recognized - fixed
- quest 7169 - Honored Amongst the Guard - fixed
- quest 7170 - Earned Reverence - fixed
- quest 7171 - Legendary Heroes - fixed
- data - and 53 more fixed: 52 quests, 1 object
- quest 6861 - Zinfizzlex's Portable Shredder Unit - removed
- quest 6862 - Zinfizzlex's Portable Shredder Unit - removed
- quest 6901 - Launch the Attack! - removed
- quest 7281 - Brotherly Love - removed
- quest 7282 - Brotherly Love - removed
- quest 7301 - Fallen Sky Lords - removed
- quest 7302 - Fallen Sky Lords - removed

## [0.2] - unreleased

### Added
- Overrides can hide a quest, an NPC, an object or an item with `hidden = true`, which the addon then
  treats exactly like an entry on Questie's blacklist (`DB.IsQuestHidden`, `DB.IsNpcHidden`,
  `DB.IsItemHidden`, and the new `DB.IsObjectHidden`); `hidden = false` shows one the blacklist hides.
  When two override sets disagree, the one applied last wins.
- `Database/Overrides/Portal.lua`: corrections from the PandaQuest portal (<https://pd.zroot.it>) that
  its moderators and admins made or approved. It is generated by the portal's data sync and applied
  after `Wowhead.lua` and `Community.lua`, so a moderator's decision has the last word.

### Changed
- TOC: the package carries `PandaQuest_Mists.toc` beside `PandaQuest.toc` (the Mists client reads it
  first) and the TOC declares `## AllowLoadGameType: mists` and `## X-License: GPL-3.0`.
- Licence: PandaQuest is GPLv3 (`LICENSE`, `## X-License` in the TOC). Questie, whose Mists of
  Pandaria data the database is built from, is published under the same licence.
- The repository is only the addon: references to anything outside it were removed from the
  documentation, comments and generated-file headers.
- CurseForge preparation: avatar at 400x400, upload only by hand, changelog taken from the commits
  since the previous release (nothing in the addon itself changed).
- Synchronisation is optional: nothing is asked at login any more. It stays off until you turn it on
  in the options or type `/pq consent`, and the options say the addon works fully without it.
- The objective-text pattern converter is written from scratch (same results); comments no longer
  describe code as following another addon.
- Documentation rewritten for players: features, roadmap, the PandaQuest portal at
  <https://pd.zroot.it>, and credits.

The addon moved into its own repository, <https://github.com/vem882/pandaquest>, which
packages and publishes it. The shipped version is now `0.2.<commits in that repository>`, computed
at packaging time; the series bumped from 0.1 to 0.2 because the commit counter changed meaning
when the addon moved. That repository's `README.md`, "The version", is the argument.

## [0.1.0] - unreleased

First working version: the whole chain from login to a moving arrow runs end to end.

### Added
- Addon skeleton: TOC (Interface 50504), embedded libraries (Ace3, LibDataBroker, LibDBIcon, HereBeDragons 2.0).
- Core: constants and defaults, utilities (distance/time formatting, GUID parsing), levelled logging with
  rate-limited errors, C_* compatibility wrappers, coroutine driver with an 8 ms per-frame budget.
- AceAddon/AceDB initialisation, module lifecycle (Init/Enable/OnDataReady/OnProfileChanged), slash commands.
- Locales: enUS (default, 223 keys) and fiFI (complete translation).
- Database: positional Questie-derived data for 17 693 quests, 60 224 NPCs, 20 326 objects and 80 049 items,
  decoded in a background coroutine (~0.5 s) with reverse indexes, name lookup, zone/area resolution,
  dungeon entrances and Wowhead/community overrides.
- Quest layer: quest log scanning with the 5.5.4 API, objective text parsing, target building per objective,
  turn-in and pickup targets, and full availability evaluation (level, race, class, prerequisites,
  exclusivity, reputation, skill, spell).
- Navigation: target collection with pfQuest-style spawn clustering, a router that weighs priority against
  real world distance, distance/bearing/ETA through HereBeDragons, and arrival detection.
- Arrow: `PandaQuestArrow` with rotation, red-to-green gradient, quest title in difficulty colour, action
  text, `123 m • ~1 min 20 s` status line, arrival flash, drag-to-move, tooltip and right-click menu.
- Map: world map and minimap pins (HereBeDragons-Pins-2.0) with per-frame draw budget, layer toggles,
  tooltips, a right-click menu and highlighting of the current target; NPC/item tooltip lines.
- UI: AceConfig options panel, minimap button (LibDataBroker/LibDBIcon), Wowhead links with a copy dialog,
  Blizzard tracker enhancement and centre-screen notifications.
- Sync: optional local telemetry in `PandaQuestSync` and a reader for companion-written community data.
- TomTom bridge: optional mirroring of the current target as a TomTom waypoint.
- Textures: generated arrow, glow, addon icon and quest pins, plus MIT-licensed icons from Questie/pfQuest.
- Tooling: WoW API stub harness for lupa (Lua 5.1), 282 pytest tests including an end-to-end integration
  suite, a luacheck runner with a generated 5.5.4 global list, and the database builder.

### Fixed during integration
- Each module now listens through its own AceEvent object. CallbackHandler keeps exactly one callback per
  (object, message), so registering on the shared `ns.PQ` silently replaced another module's handler:
  `PQ_SETTING_CHANGED` never reached the arrow and `PLAYER_ENTERING_WORLD` never reached the router.
- `/pq sync` printed a hard-coded zero; it now prints `Telemetry.GetStatusLines()`.
- The options applier for the telemetry group did nothing; it now calls `Telemetry.ApplySettings()`.
- Community timings and hotspots are applied to every target, so the arrow's community line can appear.
- A community override for a quest the database does not know no longer creates an empty, nameless quest row.
- The arrow status line uses the separator the module contract specifies (`123 m • ~1 min 20 s`).
- Dropped the dead `GetAddOnMetadata` fallback in `Core/Const.lua`; the bare global does not exist on 5.5.4.
