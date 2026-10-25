# Changelog

All notable changes to PandaQuest are documented here.

Older data syncs: see each version's GitHub release notes and https://pd.zroot.it/changelog

## [0.2.268] - 2026-10-26

### Changed
- **The shared character row says which guild the character is in.** While quest data sharing is
  on, the character row in `PandaQuestSync` also keeps the guild's name, the rank name, the rank
  index (0 = Guild Master) and the guild's home realm when it differs from the character's, so the
  PandaQuest hub can show guild members once the sync app uploads it. Out of a guild the name is
  empty; a guild the game has not loaded yet is never forgotten.
  - refreshed at login, on `PLAYER_GUILD_UPDATE` and `GUILD_ROSTER_UPDATE`, and at logout
  - the privacy line in the options names the guild name and rank

## [0.2.267] - 2026-10-26

### Added
- **Quest chains in the quest browser.** A quest's page has a new *Chain* line: which step of its
  chain the quest is ("Step 3 of 7") and the quest that comes next. Hover it for the whole chain,
  with the steps you have done in green and the ones in your quest log in gold; click it to open the
  next step's page, right-click for the step before. The chain is worked out from the quest
  database's prerequisites and follow-up quests, for the quest's own side.
- **Where an item comes from, on its tooltip.** Item tooltips list the creatures that drop the item,
  the objects it is found in, the containers it comes out of and the vendors who sell it (the first
  three names and how many more). *Options > Tooltips > Show where items come from* switches it off.
- **Find a quest by its ID.** Typing a quest ID in the quest browser's name box finds that quest.

## [0.2.266] - 2026-10-26

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,333 quests, 115 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 651 quests, 10 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 647 quests, 11 NPCs
- quest 2751 - Barbaric Battlements - updated
  - description added
  - reward items: +1
- quest 8325 - Reclaiming Sunstrider Isle - updated
  - reward money removed (30c)
- quest 9369 - Replenishing the Healing Crystals - updated
  - reward money removed (15c)
- quest 11668 - Shrimpin' Ain't Easy - updated
  - description added
  - reward items: +1
- quest 25159 - The Latest Fashion! - updated
  - description removed
- quest 29944 - Leaders Among Breeders - updated
  - description removed
  - reward money removed (10g 20s)
  - reward items: -1
- quest 30038 - The Lesson of the Iron Bough - updated
  - description removed
  - reward money removed (15c)
- quest 30257 - Learn and Grow V: Halfhill Market - updated
  - description removed
  - reward money removed (5g 10s)
- quest 30507 - Admiral Taylor has Awakened - updated
  - description removed
  - reward money removed (1g 2s)
- quest 31011 - Enemies At Our Door - updated
  - description removed
  - reward money removed (10g 60s)
- quest 31021 - Living Amber - updated
  - description removed
  - reward money removed (11g 40s)
- quest 31244 - Guo-Lai Encampment - updated
  - description removed
  - reward money removed (5g 70s)
- quest 31245 - Mistfall Village - updated
  - description removed
  - reward money removed (5g 70s)
- quest 31256 - Round 'Em Up - updated
  - description removed
  - reward money removed (10g 20s)
  - reward choices: -9
- quest 31587 - Got one! - updated
  - description added
  - reward money added (90s)
- quest 31730 - A Not So Friendly Request - updated
  - description removed
  - reward money removed (1g 14s)
- quest 32009 - Varzok - updated
  - description added
  - reward money added (90s)

## [0.2.265] - 2026-10-26

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,342 quests, 115 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 646 quests, 9 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 643 quests, 11 NPCs
- quest 8479 - Zul'Marosh - updated
  - description added
  - reward choices: +2
- quest 9636 - The Zapthrottle Mote Extractor! - updated
  - description added
  - reward items: +1
- quest 13223 - Defend the Siege - updated
  - description added
  - reward money added (11g 40s)
- quest 13224 - Orgrim's Hammer - updated
  - description added
- quest 13225 - The Skybreaker - updated
  - description added
- quest 13226 - Judgment Day Comes! - updated
  - description added
- quest 13227 - Judgment Day Comes! - updated
  - description added
- quest 13228 - The Broken Front - updated
  - description added
  - reward money added (7g 40s)
- quest 13229 - I'm Not Dead Yet! - updated
  - description added
  - reward money added (7g 40s)
- quest 13230 - Avenge Me! - updated
  - description added
  - reward money added (7g 40s)
- quest 13276 - That's Abominable! - updated
  - description added
- quest 13277 - Against the Giants - updated
  - description added
- quest 13278 - Coprous the Defiled - updated
  - description added
- quest 13280 - King of the Mountain - updated
  - description added
- quest 13281 - Neutralizing the Plague - updated
  - description added
- quest 13282 - Return to the Surface - updated
  - description added
- quest 13283 - King of the Mountain - updated
  - description added
- quest 13289 - That's Abominable! - updated
  - description added
- quest 13290 - Your Attention, Please - updated
  - description added
- quest 13292 - The Solution Solution - updated
  - description added
- quest 13294 - Against the Giants - updated
  - description added
- quest 13296 - Get to Ymirheim! - updated
  - description added
- quest 13297 - Neutralizing the Plague - updated
  - description added
- quest 13298 - Coprous the Defiled - updated
  - description added
- quest 13300 - Slaves to Saronite - updated
  - description added
- quest 13301 - Assault by Ground - updated
  - description added
- quest 13302 - Slaves to Saronite - updated
  - reward money removed (7g 40s)
- quest 13304 - Field Repairs - updated
  - reward money removed (7g 40s)
- quest 13306 - Raise the Barricades - updated
  - reward money removed (7g 40s)
- quest 13307 - Bloodspattered Banners - updated
  - reward money removed (7g 40s)
- quest 13309 - Assault by Air - updated
  - reward money removed (7g 40s)
- quest 13310 - Assault by Air - updated
  - reward money removed (7g 40s)
- quest 13312 - The Ironwall Rampart - updated
  - reward money removed (14g 80s)
- quest 13313 - Blinding the Eyes in the Sky - updated
  - reward money removed (7g 40s)
- quest 13314 - Get the Message - updated
  - reward money removed (7g 40s)
- quest 13315 - Sneak Preview - updated
  - reward money removed (5g 80s)
- quest 13316 - The Guardians of Corp'rethar - updated
  - reward money removed (14g 80s)
- quest 13318 - Drag and Drop - updated
  - reward money removed (7g 40s)
- quest 13320 - Cannot Reproduce - updated
  - reward money removed (7g 40s)
- quest 13322 - Retest Now - updated
  - reward money removed (7g 40s)
- quest 13323 - Drag and Drop - updated
  - reward money removed (7g 40s)
- quest 13328 - Shatter the Shards - updated
  - reward money removed (7g 40s)
- quest 13329 - Before the Gate of Horror - updated
  - reward money removed (7g 40s)
- quest 13330 - Blood of the Chosen - updated
  - reward money removed (7g 40s)
- quest 13331 - Keeping the Alliance Blind - updated
  - reward money removed (7g 40s)
- quest 13332 - Raise the Barricades - updated
  - reward money removed (7g 40s)
- quest 13333 - Capture More Dispatches - updated
  - reward money removed (7g 40s)
- quest 13334 - Bloodspattered Banners - updated
  - reward money removed (7g 40s)
- quest 13335 - Before the Gate of Horror - updated
  - reward money removed (7g 40s)
- quest 13336 - Blood of the Chosen - updated
  - reward money removed (7g 40s)
- quest 13337 - The Ironwall Rampart - updated
  - reward money removed (14g 80s)
- quest 13338 - The Guardians of Corp'rethar - updated
  - reward money removed (14g 80s)
- quest 13339 - Shatter the Shards - updated
  - reward money removed (7g 40s)
- quest 13340 - Joining the Assault - updated
  - reward money removed (1g 90s)
- quest 13341 - Joining the Assault - updated
  - reward money removed (1g 90s)
- quest 13344 - Not a Bug - updated
  - reward money removed (7g 40s)
- quest 13345 - Need More Info - updated
  - reward money removed (7g 40s)
- quest 13348 - Futility - updated
  - reward money removed (3g 70s)
- quest 13349 - Cradle of the Frostbrood - updated
  - description added
  - reward choices: +5
- quest 13350 - No Rest For The Wicked - updated
  - reward money removed (22g 20s)
- quest 13351 - Sneak Preview - updated
  - reward money removed (5g 80s)
- quest 13352 - Drag and Drop - updated
  - reward money removed (7g 40s)
- quest 13353 - Drag and Drop - updated
  - reward money removed (7g 40s)
- quest 13355 - Cannot Reproduce - updated
  - reward money removed (7g 40s)
- quest 13357 - Retest Now - updated
  - reward money removed (7g 40s)
- quest 13359 - Where Dragons Fell - updated
  - reward money removed (7g 40s)
- quest 13360 - Time for Answers - updated
  - reward money removed (1g 90s)
- quest 13365 - Not a Bug - updated
  - reward money removed (7g 40s)
- quest 13366 - Need More Info - updated
  - reward money removed (7g 40s)
- quest 13368 - No Rest For The Wicked - updated
  - reward money removed (22g 20s)
- quest 13373 - Fringe Science Benefits - updated
  - reward money removed (7g 40s)
- quest 13376 - Total Ohmage: The Valley of Lost Hope! - updated
  - reward money removed (14g 80s)
- quest 13378 - Chief Engineer Copperclaw - updated
  - reward money removed (74s)
- quest 13379 - Green Technology - updated
  - reward money removed (74s)
- quest 13380 - Leading the Charge - updated
  - reward money removed (7g 40s)
- quest 13382 - Putting the Hertz: The Valley of Lost Hope - updated
  - reward money removed (14g 80s)
- quest 13383 - Killohertz - updated
  - reward money removed (74s)
- quest 13388 - Set it Off! - updated
  - reward money removed (74s)
- quest 13389 - A Short Fuse - updated
  - reward money removed (74s)
- quest 13392 - Return to the Surface - updated
  - reward money removed (3g 70s)
- quest 13393 - Field Repairs - updated
  - reward money removed (7g 40s)
- quest 13398 - Where Dragons Fell - updated
  - reward money removed (7g 40s)
- quest 13399 - Time for Answers - updated
  - reward money removed (1g 90s)
- quest 13404 - Static Shock Troops: the Bombardment - updated
  - reward money removed (7g 40s)
- quest 13406 - Riding the Wavelength: The Bombardment - updated
  - reward money removed (7g 40s)
- quest 13415 - The Library Console - updated
  - reward money removed (3g 70s)
- quest 13418 - Preparations for War - updated
  - reward money removed (1g 90s)
- quest 13419 - Preparations for War - updated
  - reward money removed (1g 90s)
- quest 13420 - Everfrost - updated
  - reward money removed (6g 50s)
- quest 13421 - Remember Everfrost! - updated
  - reward money removed (6g 50s)
- quest 13426 - Xarantaur, the Witness - updated
  - reward money removed (74s)
- quest 13432 - The Vials of Eternity - updated
  - reward money removed (13g 20s)
- quest 13481 - Let's Get Out of Here! - updated
  - reward money removed (7g 40s)
- quest 13482 - Let's Get Out of Here - updated
  - reward money removed (7g 40s)
- quest 13504 - Shatterspear Laborers - updated
  - reward money removed (6s)
- quest 13505 - Remnants of the Highborne - updated
  - reward money removed (6s)
- quest 13508 - Swift Response - updated
  - reward money removed (6s)
- quest 13509 - War Supplies - updated
  - reward money removed (6s)
- quest 13511 - One Bitter Wish - updated
  - reward money removed (6s)
- quest 13513 - On the Brink - updated
  - reward money removed (6s)
- quest 13514 - The Ancients' Ire - updated
  - reward money removed (13s)
- quest 13515 - Ending the Threat - updated
  - reward money removed (13s)
- quest 13518 - The Last Wave of Survivors - updated
  - reward money removed (3s 50c)
- quest 13522 - Threat from the Water - updated
  - reward money removed (3s 50c)
- quest 13526 - The Bear's Paw - updated
  - reward money removed (11s)
- quest 13527 - No Accounting for Taste - updated
  - reward money removed (4s)
- quest 13528 - Buzzbox 723 - updated
  - reward money removed (4s)
- quest 13538 - Southern Sabotage - updated
  - reward money removed (11g 40s)
- quest 13544 - The Bear's Blessing - updated
  - reward money removed (11s)
- quest 13545 - Cleansing the Afflicted - updated
  - reward money removed (11s)
- quest 13549 - Tails Up - updated
  - reward money removed (6g 50s)
- quest 13557 - Bearer of Good Fortune - updated
  - reward money removed (4s)
- quest 13561 - Solace for the Highborne - updated
  - reward money removed (4s)
- quest 13562 - The Final Flame of Bashal'Aran - updated
  - reward money removed (4s)
- quest 13564 - A Lost Companion - updated
  - reward money removed (4s)
- quest 13566 - Ritual Materials - updated
  - reward money removed (5s)
- quest 13579 - Protector of Ameth'Aran - updated
  - reward money removed (70c)
- quest 13582 - Elune's Fire - updated
  - reward money removed (7s)
- quest 13589 - The Shatterspear Invaders - updated
  - reward money removed (4s)
- quest 13590 - The Front Line - updated
  - reward money removed (6s)
- quest 13596 - Twilight Plans - updated
  - reward money removed (6s)
- quest 13599 - Grimclaw's Return - updated
  - reward money removed (3s 50c)
- quest 13606 - Freya's Sigil - updated
  - reward money removed (29g 60s)
- quest 13607 - The Celestial Planetarium - updated
  - reward money removed (14g 80s)
- quest 13609 - Hodir's Sigil - updated
  - reward money removed (29g 60s)
- quest 13610 - Thorim's Sigil - updated
  - reward money removed (29g 60s)
- quest 13611 - Mimiron's Sigil - updated
  - reward money removed (29g 60s)
- quest 13622 - Ancient History - updated
  - description added
- quest 13633 - The Black Knight of Westfall? - updated
  - reward money removed (7g 40s)
- quest 13634 - The Black Knight of Silverpine? - updated
  - reward money removed (7g 40s)
- quest 13635 - South Gate Status Report - updated
  - reward money removed (3s)
- quest 13636 - Stormpike's Orders - updated
  - reward money removed (4s)
- quest 13639 - Resupplying the Excavation - updated
  - reward money removed (6s)
- quest 13641 - The Seer's Crystal - updated
  - reward money removed (7g 40s)
- quest 13643 - The Stories Dead Men Tell - updated
  - reward money removed (7g 40s)
- quest 13647 - Joining the Hunt - updated
  - reward money removed (6s)
- quest 13650 - Keep Your Hands Off The Goods! - updated
  - reward money removed (8s)
- quest 13654 - There's Something About the Squire - updated
  - reward money removed (7g 40s)
- quest 13655 - Explorers' League Document (2 of 6) - updated
  - reward money removed (16s)
- quest 13656 - Explorers' League Document (1 of 6) - updated
  - reward money removed (16s)
- quest 13657 - Explorers' League Document (3 of 6) - updated
  - reward money removed (16s)
- quest 13658 - Explorers' League Document (4 of 6) - updated
  - reward money removed (16s)
- quest 13659 - Explorers' League Document (6 of 6) - updated
  - reward money removed (18s)
- quest 13660 - Explorers' League Document (5 of 6) - updated
  - reward money removed (16s)
- quest 13661 - Heartfelt Appreciation - updated
  - reward money removed (20s)
- quest 13663 - The Black Knight's Orders - updated
  - reward money removed (7g 40s)
- quest 13664 - The Black Knight's Fall - updated
  - reward money removed (14g 80s)
- quest 13667 - The Argent Tournament - updated
  - reward money removed (74s)
- quest 13668 - The Argent Tournament - updated
  - reward money removed (74s)
- quest 13672 - Up To The Challenge - updated
  - reward money removed (74s)
- quest 13678 - Up To The Challenge - updated
  - reward money removed (74s)
- quest 13679 - The Aspirant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13680 - The Aspirant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13684 - A Valiant Of Stormwind - updated
  - reward money removed (74s)
- quest 13685 - A Valiant Of Ironforge - updated
  - reward money removed (74s)
- quest 13689 - A Valiant Of Darnassus - updated
  - reward money removed (74s)
- quest 13690 - A Valiant Of The Exodar - updated
  - reward money removed (74s)
- quest 13691 - A Valiant Of Orgrimmar - updated
  - reward money removed (74s)
- quest 13693 - A Valiant Of Sen'jin - updated
  - reward money removed (74s)
- quest 13694 - A Valiant Of Thunder Bluff - updated
  - reward money removed (74s)
- quest 13695 - A Valiant Of Undercity - updated
  - reward money removed (74s)
- quest 13696 - A Valiant Of Silvermoon - updated
  - reward money removed (74s)
- quest 13697 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13699 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13713 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13714 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13715 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13717 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13718 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13719 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13720 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13721 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13722 - The Valiant's Charge - updated
  - reward money removed (7g 40s)
- quest 13723 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13724 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13725 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13726 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 13728 - The Valiant's Challenge - updated
  - reward money removed (7g 40s)
- quest 26022 - First Blood - updated
  - reward money removed (22s)
- quest 26023 - The Forsaken Trollbane - updated
  - reward money removed (2s 25c)
- quest 26030 - Sigil of Strom - updated
  - reward money removed (22s)
- quest 26031 - Sigil of Thoradin - updated
  - reward money removed (22s)
- quest 26032 - Sigil of Arathor - updated
  - reward money removed (22s)
- quest 26039 - The Princess Trapped - updated
  - reward money removed (25s)
- quest 26041 - Stones of Binding - updated
  - reward money removed (50s)
- quest 26050 - Goggle Boggle - updated
  - reward money removed (25s)
- quest 26053 - Clearing the Highlands - updated
  - reward money removed (22s)
- quest 26083 - Hello Lolo - updated
  - reward money removed (11s)
- quest 26084 - Hammerfall - updated
  - reward money removed (11s)
- quest 26107 - Raising Spirits - updated
  - reward money removed (25s)
- quest 26223 - Stalking the Stalkers - updated
  - reward money removed (30s)
- quest 26224 - Hunt the Savages - updated
  - reward money removed (65s)
- quest 26225 - Pupellyverbos Port - updated
  - reward money removed (30s)
- quest 26240 - Stomp To My Beat - updated
  - reward money removed (30s)
- quest 26267 - Skulk Rock Clean-Up - updated
  - reward money removed (30s)
- quest 26268 - Skulk Rock Supplies - updated
  - reward money removed (30s)
- quest 26306 - Start Taking Back - updated
  - reward money removed (35s)
- quest 26307 - Death to the Vilebranch - updated
  - reward money removed (35s)
- quest 26310 - All That Skitters - updated
  - reward money removed (35s)
- quest 26363 - Summit of Fate - updated
  - reward money removed (35s)
- quest 26366 - Heads Up - updated
  - reward money removed (35s)
- quest 26367 - Ongo'longo's Revenge - updated
  - reward money removed (35s)
- quest 26368 - Venomous Secrets - updated
  - reward money removed (35s)
- quest 26381 - The Eye of Shadra - updated
  - reward money removed (35s)
- quest 26384 - Darkcleric Marnal - updated
  - reward money removed (17s)
- quest 26387 - Starvation Diet - updated
  - reward money removed (35s)
- quest 26406 - The Fang of Shadra - updated
  - reward money removed (35s)
- quest 26429 - Crush the Witherbark - updated
  - reward money removed (25s)
- quest 26430 - Revantusk Village - updated
  - reward money removed (22s)
- quest 26432 - The Fall of Jintha'Alor - updated
  - reward money removed (17s)
- quest 26891 - Amongst the Ruins - updated
  - reward money removed (80s)
- quest 26899 - The Enemy of My Enemy - updated
  - reward money removed (93s)
- quest 26907 - Take Them Down! - updated
  - reward money removed (1g 47s)
- quest 26908 - Feeling Thorny - updated
  - reward money removed (3s 50c)
- quest 26911 - Myzrael's Tale - updated
  - reward money removed (11s)
- quest 26920 - The Battle for Andorhal - updated
  - reward money removed (9s)
- quest 26921 - Scourge First... Alliance Later - updated
  - reward money removed (35s)
- quest 26922 - The Endless Flow - updated
  - reward money removed (35s)
- quest 26925 - Araj the Summoner - updated
  - reward money removed (75s)
- quest 26926 - Victory, For Now - updated
  - reward money removed (3s 50c)
- quest 26930 - After the Crusade - updated
  - reward money removed (30s)
- quest 26933 - Foes Before Hoes - updated
  - reward money removed (40s)
- quest 26935 - Northridge Lumber Mill - updated
  - reward money removed (4s)
- quest 26936 - Lower the Boom - updated
  - reward money removed (20s)
- quest 26952 - The Menders' Stead - updated
  - reward money removed (4s)
- quest 26953 - Zen'Kiki, the Druid - updated
  - reward money removed (80s)
- quest 26954 - A Different Approach - updated
  - reward money removed (40s)
- quest 26955 - Zen'Kiki and the Cultists - updated
  - description added
  - reward choices: +3
- quest 26956 - I Ain't Sayin' You a Gourd-Digger... - updated
  - reward money removed (40s)
- quest 26957 - The Long Trip Home - updated
  - reward money removed (11s)
- quest 26979 - Strange New Faces - updated
  - reward money removed (20s)
- quest 26999 - A New Era for the Plaguelands - updated
  - description added
  - reward choices: +3
- quest 27000 - Learning the Ropes - updated
  - reward money removed (40s)
- quest 27002 - An Audience with the Highlord - updated
  - reward money removed (30s)
- quest 27011 - Redpine Thievery - updated
  - reward money removed (40s)
- quest 27013 - Too Close for Comfort - updated
  - reward money removed (40s)
- quest 27053 - Gahrron's Withering Cauldron - updated
  - reward money removed (20s)
- quest 27057 - Return to the Stead - updated
  - reward money removed (45s)
- quest 27083 - The Battle Resumes! - updated
  - reward money removed (5s)
- quest 27084 - The Farmers' Militia - updated
  - reward money removed (50s)
- quest 27086 - Ashes to Ashes - updated
  - reward money removed (50s)
- quest 27087 - Lindsay Ravensun, Revealed - updated
  - reward money removed (5s)
- quest 27090 - Andorhal, Once and For All - updated
  - reward money removed (1g 50s)
- quest 27107 - Pusillin The Thief - updated
  - reward money removed (2g)
- quest 27108 - Lethtendris's Web - updated
  - reward money removed (2g)
- quest 27117 - Brute Strength - updated
  - reward money removed (1g 10s)
- quest 27151 - Taelan Fordring's Legacy - updated
  - reward money removed (40s)
- quest 27154 - Bagging Bisp - updated
  - reward money removed (40s)
- quest 27155 - Turning Yourself In - updated
  - reward money removed (40s)
- quest 27156 - It's About Time! - updated
  - reward money removed (40s)
- quest 27157 - Drudges... <Sigh> - updated
  - reward money removed (40s)
- quest 27228 - Man Against Abomination - updated
  - reward money removed (2g 93s)
- quest 27230 - Weapons for War - updated
  - reward money removed (2g 93s)
- quest 27352 - Liquid Gold - updated
  - reward money removed (2g 93s)
- quest 27359 - Argent Reinforcements - updated
  - reward money removed (2g 93s)
- quest 27367 - Gidwin Goldbraids - updated
  - reward money removed (5s)
- quest 27368 - Just Encased - updated
  - reward money removed (50s)
- quest 27370 - Tarenar Sunstrike - updated
  - reward money removed (5s)
- quest 27371 - What I Do Best - updated
  - reward money removed (50s)
- quest 27373 - Onward, to Light's Hope Chapel - updated
  - reward money removed (25s)
- quest 27680 - Archaedas, The Ancient Stone Watcher - updated
  - reward money removed (2g)
- quest 27683 - Into the Woods - updated
  - reward money removed (5s)
- quest 27684 - Visitors - updated
  - reward money removed (5s)
- quest 28508 - The Battle for Andorhal - updated
  - reward money removed (9s)
- quest 28750 - The Battle for Andorhal - updated
  - reward money removed (9s)
- quest 28798 - Waters of Elune - updated
  - reward money removed (11g 40s)
- quest 28799 - Might of the Earthen - updated
  - reward money removed (7g 40s)
- quest 28800 - Whispers of the Djinn - updated
  - reward money removed (9g 40s)
- quest 28801 - Tol'vir Heiroglyphics - updated
  - reward money removed (11g 40s)
- quest 28802 - Map of the Architects - updated
  - reward money removed (90s)
- quest 28804 - Dark Iron Contingency Plan - updated
  - reward money removed (11g 40s)
- quest 29261 - Zul'Aman Voodoo - updated
  - reward money removed (11g 40s)
- quest 29262 - Zul'Gurub Voodoo - updated
  - reward money removed (11g 40s)
- quest 29410 - Aysa of the Tushui - updated
  - reward money removed (8c)
- quest 29482 - Transmutation Master - updated
  - description added
- quest 29542 - Invading the Citadel - updated
  - reward money removed (28s)
- quest 29566 - Checking Up - updated
  - reward money removed (34s)
- quest 29571 - Defending the Wilds - updated
  - reward money removed (34s)
- quest 30147 - Fragments of the Past - updated
  - reward money removed (11g 40s)
- quest 30597 - Strange Spherical Stone - updated
  - XP removed (69,400)
- quest 30896 - Thieves and Troublemakers - updated
  - reward items: counts corrected
- quest 31288 - Research Project: The Mogu Dynasties - updated
  - reward money removed (11g 40s)
- quest 31490 - Rank and File - updated
  - reward money removed (1g 20s)
- quest 31493 - Just for Safekeeping, Of Course - updated
  - reward money removed (1g 20s)
- quest 31514 - Unto Dust Thou Shalt Return - updated
  - reward money removed (1g 40s)
- quest 31540 - Staves for Tian Monastery - updated
  - reward items: counts corrected
- quest 31585 - Learning the Ropes - updated
  - description added
- quest 31586 - On The Mend - updated
  - description added
- quest 31587 - Got one! - updated
  - reward money removed (90s)
- quest 31815 - Zonya the Sadist - updated
  - description added
  - reward items: +1
- quest 32009 - Varzok - updated
  - reward money removed (90s)
- quest 32686 - Pristine Banner of the Mantid Empire - updated
  - reward items: counts corrected
- npc 3421 - Feegly the Exiled (Old) - updated
  - coordinates: 1 spawn point added in The Barrens
- npc 3430 - Mangletooth - updated
  - coordinates: 2 spawn points added in The Barrens
- npc 3663 - [Deprecated for 4.x]Delgren the Purifier - updated
  - coordinates: 2 spawn points added in Ashenvale
- npc 5353 - Itharius - updated
  - coordinates: 2 spawn points added in Swamp of Sorrows
- npc 5908 - Grunt Dogran - updated
  - coordinates: 1 spawn point added in The Barrens
- npc 68492 - "Dusty" Brandom - updated
  - NPC title added (Tallstrider Handler)
- npc 70678 - Grandpa Grumplefloot - updated
  - NPC level added (92)
- npc 70751 - Card Trader Ami - updated
  - NPC level added (90)

## [0.2.264] - 2026-10-25

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,583 quests, 107 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 599 quests, 7 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 621 quests, 9 NPCs
- quest 13143 - New Recruit - updated
  - description added
- quest 13146 - Generosity Abounds - updated
  - description added
- quest 13147 - Matchmaker - updated
  - description added
- quest 13148 - Necklace Repair - updated
  - description added
- quest 13149 - Dispelling Illusions - updated
  - description added
- quest 13152 - A Visit to the Doctor - updated
  - description added
- quest 13153 - Warding the Warriors - updated
  - quest giver added: Sorceress Kaylana
  - description added
- quest 13154 - Bones and Arrows - updated
  - quest giver added: Bowyer Randolph
  - description added
- quest 13155 - Vereth the Cunning - updated
  - description added
- quest 13156 - A Rare Herb - updated
  - quest giver added: Anchorite Tessa
  - description added
- quest 13160 - Stunning View - updated
  - description added
- quest 13165 - Taking Back Acherus - updated
  - description added
- quest 13166 - The Battle For The Ebon Hold - updated
  - description added
- quest 13168 - Parting Gifts - updated
  - description added
- quest 13169 - An Undead's Best Friend - updated
  - description added
- quest 13170 - Honor is for the Weak - updated
  - description added
- quest 13174 - Amidst the Confusion - updated
  - description added
- quest 13178 - Slay them all! - updated
  - quest giver added: Commander Dardosh
  - description added
- quest 13179 - No Mercy for the Merciless - updated
  - description added
- quest 13181 - Victory in Wintergrasp - updated
  - description added
- quest 13183 - Victory in Wintergrasp - updated
  - description added
- quest 13188 - Where Kings Walk - updated
  - description added
- quest 13191 - Fueling the Demolishers - updated
  - quest giver added: Siegesmith Stronghoof
  - description added
- quest 13193 - Bones and Arrows - updated
  - quest giver added: Vieron Blazefeather
  - description added
- quest 13194 - Healing with Roses - updated
  - quest giver added: Primalist Mulfort
  - description added
- quest 13195 - A Rare Herb - updated
  - description added
- quest 13196 - Bones and Arrows - updated
  - description added
- quest 13197 - Fueling the Demolishers - updated
  - description added
- quest 13199 - Bones and Arrows - updated
  - description added
- quest 13200 - Fueling the Demolishers - updated
  - description added
- quest 13201 - Healing with Roses - updated
  - description added
- quest 13202 - Jinxing the Walls - updated
  - description added
- quest 13213 - Battle at Valhalas - updated
  - description added
- quest 13214 - Battle at Valhalas: Fallen Heroes - updated
  - description added
- quest 13215 - Battle at Valhalas: Khit'rix the Dark Master - updated
  - description added
- quest 13217 - Battle at Valhalas: Carnage! - updated
  - description added
- quest 13220 - Putting Olakin Back Together Again - updated
  - description added
- quest 13221 - I'm Not Dead Yet! - updated
  - description added
- quest 13222 - Defend the Siege - updated
  - description added
- quest 13223 - Defend the Siege - updated
  - reward money removed (11g 40s)
- quest 13228 - The Broken Front - updated
  - reward money removed (7g 40s)
- quest 13229 - I'm Not Dead Yet! - updated
  - reward money removed (7g 40s)
- quest 13230 - Avenge Me! - updated
  - reward money removed (7g 40s)
- quest 13231 - The Broken Front - updated
  - description added
- quest 13232 - Finish Me! - updated
  - description added
- quest 13233 - No Mercy! - updated
  - description added
- quest 13234 - Make Them Pay! - updated
  - description added
- quest 13236 - Army of the Damned - updated
  - description added
- quest 13238 - Good For Something? - updated
  - description added
- quest 13258 - Opportunity - updated
  - description added
- quest 13260 - Takes One to Know One - updated
  - description added
- quest 13261 - Volatility - updated
  - description added
- quest 13262 - Blow it Up! - updated
  - description added
- quest 13271 - A Voice in the Dark - updated
  - description added
- quest 13273 - Going After the Core - updated
  - description added
- quest 13274 - The Core's Keeper - updated
  - description added
- npc 5397 - Uthek the Wise - updated
  - coordinates: 1 spawn point added in Desolace
- npc 5398 - Warug - updated
  - coordinates: 1 spawn point added in Desolace
- npc 5644 - Dalinda Malem - updated
  - coordinates: 10 spawn points added in Desolace
- npc 11863 - Azore Aldamort - updated
  - coordinates: 1 spawn point added in Desolace

## [0.2.263] - 2026-10-25

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,580 quests, 103 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 538 quests, 7 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 557 quests, 8 NPCs
- quest 12980 - The Armor's Secrets - updated
  - description added
  - reward money added (7g 40s)
- quest 12981 - Hot and Cold - updated
  - description added
  - reward money added (7g 40s)
- quest 12983 - The Last of Her Kind - updated
  - description added
- quest 12985 - Forging a Head - updated
  - description added
  - reward money added (7g 40s)
- quest 12987 - Placing Hodir's Helm - updated
  - description added
  - reward money added (1g 90s)
- quest 12988 - Destroy the Forges! - updated
  - description added
  - reward money added (7g 40s)
- quest 12991 - Hit Them Where it Hurts - updated
  - description added
  - reward money added (7g 40s)
- quest 12993 - A Colossal Threat - updated
  - description added
- quest 12994 - Spy Hunter - updated
  - description added
- quest 12995 - Leave Our Mark - updated
  - description added
- quest 12996 - The Warm-Up - updated
  - description added
- quest 12999 - The Bone Witch - updated
  - description added
- quest 13001 - Forging Hodir's Spear - updated
  - description added
- quest 13003 - How To Slay Your Dragon - updated
  - description added
- quest 13006 - A Viscous Cleaning - updated
  - description added
- quest 13008 - Scourge Tactics - updated
  - description added
- quest 13009 - A New Beginning - updated
  - description added
- quest 13011 - Culling Jorcuttar - updated
  - description added
- quest 13034 - The Witness and the Hero - updated
  - description added
- quest 13035 - Loken's Lackeys - updated
  - description added
- quest 13037 - Memories of Stormhoof - updated
  - description added
- quest 13038 - Distortions in Time - updated
  - description added
- quest 13041 - Finish the Shipment - updated
  - description added
- quest 13042 - Deep in the Bowels of The Underhalls - updated
  - description added
- quest 13044 - If There Are Survivors... - updated
  - description added
- quest 13045 - Into The Wild Green Yonder - updated
  - description added
- quest 13046 - Feeding Arngrim - updated
  - description added
- quest 13048 - Where Time Went Wrong - updated
  - description added
- quest 13049 - The Hero's Arms - updated
  - description added
- quest 13050 - Veranus - updated
  - description added
- quest 13054 - The Missing Tracker - updated
  - description added
- quest 13055 - Cave Medicine - updated
  - description added
- quest 13057 - The Terrace of the Makers - updated
  - description added
- quest 13060 - When All Else Fails - updated
  - description added
- quest 13061 - Prepare for Glory - updated
  - description added
- quest 13062 - Lok'lira's Parting Gift - updated
  - description added
- quest 13063 - Deemed Worthy - updated
  - description added
- quest 13064 - Sibling Rivalry - updated
  - description added
- quest 13068 - A Tale of Valor - updated
  - description added
- quest 13069 - Shoot 'Em Up - updated
  - description added
- quest 13070 - A Cold Front Approaches - updated
  - description added
- quest 13071 - Vile Like Fire! - updated
  - description added
- quest 13072 - A Hero Remains - updated
  - description added
- quest 13073 - The Keeper's Favor - updated
  - description added
- quest 13075 - The Boon of Remulos - updated
  - description added
- quest 13076 - Time Yet Remains - updated
  - description added
- quest 13079 - The Boon of Alexstrasza - updated
  - description added
- quest 13080 - Hope Yet Remains - updated
  - description added
- quest 13081 - The Will of the Naaru - updated
  - description added
- quest 13082 - The Boon of A'dal - updated
  - description added
- quest 13084 - Vandalizing Jotunheim - updated
  - description added
- quest 13085 - Vaelen Has Returned - updated
  - description added
- quest 13093 - Reading the Bones - updated
  - reward choices: +5
- quest 13106 - Blackwatch - updated
  - description added
- quest 13118 - The Purging Of Scourgeholme - updated
  - description added
- quest 13119 - Destroying the Altars - updated
  - description added
- quest 13120 - Death's Gaze - updated
  - description added
- quest 13121 - Through the Eye - updated
  - description added
- quest 13122 - The Scourgestone - updated
  - description added
- quest 13124 - The Struggle Persists - updated
  - quest giver added: Raelorasz
  - description added
  - reward choices: +4
- quest 13126 - A Unified Front - updated
  - description added
- quest 13127 - Mage-Lord Urom - updated
  - description added
- quest 13133 - Find the Ancient Hero - updated
  - description added
- quest 13134 - Spill Their Blood - updated
  - description added
- quest 13135 - It Could Kill Us All - updated
  - description added
- quest 13136 - Jagged Shards - updated
  - description added
- quest 13138 - I'm Smelting... Smelting! - updated
  - description added
- quest 13139 - Into The Frozen Heart Of Northrend - updated
  - description added
- quest 13140 - The Runesmiths of Malykriss - updated
  - description added
- quest 13141 - The Battle For Crusaders' Pinnacle - updated
  - description added
- quest 26558 - Summoning Shadra - updated
  - description added
- quest 31291 - Uncovering the Past - updated
  - description added
- npc 30208 - Stormforged Ambusher - updated
  - coordinates: 23 spawn points added in The Storm Peaks
- npc 68715 - Magister Hathorel - updated
  - NPC title added (The Sunreavers)
- npc 68716 - Magister Surdiel - updated
  - NPC title added (Wintergrasp Battle-Mage)
- npc 68717 - Magistrix Vesara - updated
  - NPC title added (Legacy Justice Quartermaster)

## [0.2.262] - 2026-10-25

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,563 quests, 99 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 525 quests, 7 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 526 quests, 8 NPCs
- quest 9452 - Red Snapper - Very Tasty! - updated
  - description added
  - reward items: +2
- quest 12907 - Examples to be Made - updated
  - description added
- quest 12908 - A Certain Prisoner - updated
  - description added
- quest 12909 - The Nose Knows - updated
  - description added
- quest 12910 - Sniffing Out the Perpetrator - updated
  - description added
- quest 12912 - A Great Storm Approaches - updated
  - description added
- quest 12913 - Speak Orcish, Man! - updated
  - description added
- quest 12914 - Gymer's Salvation - updated
  - description added
- quest 12915 - Mending Fences - updated
  - description added
- quest 12917 - Speaking with the Wind's Voice - updated
  - description added
- quest 12920 - Catching up with Brann - updated
  - description added
- quest 12921 - A Change of Scenery - updated
  - description added
- quest 12922 - The Refiner's Fire - updated
  - description added
- quest 12925 - Aberrations - updated
  - description added
- quest 12926 - Pieces of the Puzzle - updated
  - description added
- quest 12927 - Data Mining - updated
  - description added
- quest 12929 - The Earthen of Ulduar - updated
  - description added
- quest 12930 - Rare Earth - updated
  - description added
- quest 12931 - Fighting Back - updated
  - description added
- quest 12932 - The Amphitheater of Anguish: Yggdras! - updated
  - description added
  - reward items: +1
- quest 12933 - The Amphitheater of Anguish: Magnataur! - updated
  - description added
  - reward items: +1
- quest 12934 - The Amphitheater of Anguish: From Beyond! - updated
  - description added
  - reward items: +1
- quest 12936 - The Amphitheater of Anguish: Korrak the Bloodrager! - updated
  - description added
  - reward items: +1
- quest 12938 - The Duke - updated
  - description added
- quest 12939 - Honor Challenge - updated
  - description added
- quest 12949 - Get the Key - updated
  - description added
- quest 12951 - Let the Baron Know - updated
  - description added
- quest 12954 - The Amphitheater of Anguish: Yggdras! - updated
  - description added
  - reward items: +1
- quest 12956 - A Spark of Hope - updated
  - description added
- quest 12957 - Slaves of the Stormforged - updated
  - description added
- quest 12958 - Shipment: Blood Jade Amulet - updated
  - description added
- quest 12959 - Shipment: Glowing Ivory Figurine - updated
  - description added
- quest 12960 - Shipment: Wicked Sun Brooch - updated
  - description added
- quest 12961 - Shipment: Intricate Bone Figurine - updated
  - description added
- quest 12962 - Shipment: Bright Armor Relic - updated
  - description added
- quest 12963 - Shipment: Shifting Sun Curio - updated
  - description added
- quest 12964 - The Dark Ore - updated
  - description added
- quest 12966 - You Can't Miss Him - updated
  - description added
- quest 12967 - Battling the Elements - updated
  - description added
- quest 12968 - Yulda's Folly - updated
  - description added
- quest 12969 - Is That Your Goblin? - updated
  - description added
- quest 12970 - The Hyldsmeet - updated
  - description added
- quest 12972 - You'll Need a Bear - updated
  - description added
- quest 12974 - The Champion's Call! - updated
  - description added
  - reward items: +1
- quest 12975 - In Memoriam - updated
  - description added
- quest 12976 - A Monument to the Fallen - updated
  - description added
- quest 12977 - Hodir's Call - updated
  - description added
- quest 12978 - Facing the Storm - updated
  - description added
- quest 12979 - Armor of Darkness - updated
  - description added
- quest 12980 - The Armor's Secrets - updated
  - reward money removed (7g 40s)
- quest 12981 - Hot and Cold - updated
  - reward money removed (7g 40s)
- quest 12985 - Forging a Head - updated
  - reward money removed (7g 40s)
- quest 12987 - Placing Hodir's Helm - updated
  - reward money removed (1g 90s)
- quest 12988 - Destroy the Forges! - updated
  - reward money removed (7g 40s)
- quest 12991 - Hit Them Where it Hurts - updated
  - reward money removed (7g 40s)

## [0.2.261] - 2026-10-25

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,558 quests, 99 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 516 quests, 7 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 499 quests, 7 NPCs
- quest 2561 - Druid of the Claw - updated
  - description added
  - reward choices: +2
- quest 12819 - Just Around the Corner - updated
  - description added
- quest 12821 - Cell Block Tango - updated
  - description added
- quest 12822 - Know No Fear - updated
  - description added
- quest 12823 - A Flawless Plan - updated
  - description added
- quest 12826 - Slightly Unstable - updated
  - description added
- quest 12827 - Reclaimed Rations - updated
  - description added
- quest 12829 - Moving In - updated
  - description added
- quest 12830 - Ore Repossession - updated
  - description added
- quest 12831 - Only Partly Forgotten - updated
  - description added
- quest 12833 - Overstock - updated
  - description added
- quest 12836 - Expression of Gratitude - updated
  - description added
- quest 12838 - Intelligence Gathering - updated
  - description added
- quest 12839 - The Grand (Admiral's) Plan - updated
  - description added
- quest 12841 - The Crone's Bargain - updated
  - description added
- quest 12842 - Runeforging: Preparation For Battle - updated
  - description added
- quest 12844 - Equipment Recovery - updated
  - description added
- quest 12846 - Leave No Goblin Behind - updated
  - description added
- quest 12847 - Second Chances - updated
  - description added
- quest 12848 - The Endless Hunger - updated
  - description added
- quest 12850 - Report To Scourge Commander Thalanor - updated
  - description added
- quest 12851 - Bearly Hanging On - updated
  - description added
- quest 12853 - Luxurious Getaway! - updated
  - description added
- quest 12854 - On Brann's Trail - updated
  - description added
- quest 12855 - Sniffing Out the Perpetrator - updated
  - description added
- quest 12856 - Cold Hearted - updated
  - description added
- quest 12858 - Pieces to the Puzzle - updated
  - description added
- quest 12860 - Data Mining - updated
  - description added
- quest 12862 - When All Else Fails - updated
  - description added
- quest 12863 - Offering Thanks - updated
  - description added
- quest 12864 - Missing Scouts - updated
  - description added
- quest 12866 - Stemming the Aggressors - updated
  - description added
- quest 12867 - Baby Stealers - updated
  - description added
- quest 12869 - Pushed Too Far - updated
  - description added
- quest 12873 - The Frostborn King - updated
  - description added
- quest 12875 - An Experienced Guide - updated
  - description added
- quest 12876 - Unwelcome Guests - updated
  - description added
- quest 12877 - The Lonesome Watcher - updated
  - description added
- quest 12878 - The Hidden Relic - updated
  - description added
- quest 12879 - Fury of the Frostborn King - updated
  - description added
- quest 12880 - The Master Explorer - updated
  - description added
- quest 12883 - Orders From Drakuru - updated
  - description added
  - reward items: +1
- quest 12884 - The Ebon Watch - updated
  - description added
- quest 12885 - The Exiles of Ulduar - updated
  - description added
- quest 12887 - It's All Fun and Games - updated
  - description added
- quest 12888 - SCRAP-E - updated
  - description added
- quest 12889 - The Prototype Console - updated
  - description added
- quest 12891 - I Have an Idea, But First... - updated
  - description added
- quest 12892 - It's All Fun and Games - updated
  - description added
- quest 12894 - Crusader Forward Camp - updated
  - description added
- quest 12896 - If He Cannot Be Turned - updated
  - description added
- quest 12897 - If He Cannot Be Turned - updated
  - description added
- quest 12901 - Making Something Out Of Nothing - updated
  - description added
  - reward items: +1
- quest 12902 - In Search Of Answers - updated
  - description added
- quest 12904 - Light Won't Grant Me Vengeance - updated
  - description added
  - reward items: +1
- quest 12905 - Mildred the Cruel - updated
  - description added

## [0.2.260] - 2026-10-25

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,548 quests, 99 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 514 quests, 7 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 483 quests, 6 NPCs
- quest 12712 - The Key of Warlord Zol'Maz - updated
  - description added
- quest 12714 - The Will Of The Lich King - updated
  - description added
- quest 12715 - The Crypt of Remembrance - updated
  - description added
- quest 12723 - Behind Scarlet Lines - updated
  - description added
- quest 12725 - Brothers In Death - updated
  - description added
- quest 12726 - Song of Wind and Water - updated
  - description added
- quest 12729 - The Gods Have Spoken - updated
  - description added
  - reward items: +1
- quest 12732 - The Heartblood's Strength - updated
  - description added
- quest 12734 - Rejek: First Blood - updated
  - description added
- quest 12735 - A Cleansing Song - updated
  - description added
- quest 12736 - Song of Reflection - updated
  - description added
- quest 12737 - Song of Fecundity - updated
  - description added
- quest 12738 - A Cry For Vengeance! - updated
  - description added
- quest 12739 - A Special Surprise - updated
  - description added
- quest 12741 - Strength of the Tempest - updated
  - description added
- quest 12742 - A Special Surprise - updated
  - description added
- quest 12743 - A Special Surprise - updated
  - description added
- quest 12744 - A Special Surprise - updated
  - description added
- quest 12745 - A Special Surprise - updated
  - description added
- quest 12746 - A Special Surprise - updated
  - description added
- quest 12747 - A Special Surprise - updated
  - description added
- quest 12748 - A Special Surprise - updated
  - description added
- quest 12749 - A Special Surprise - updated
  - description added
- quest 12750 - A Special Surprise - updated
  - description added
- quest 12754 - Ambush At The Overlook - updated
  - description added
- quest 12755 - A Meeting With Fate - updated
  - description added
- quest 12756 - The Scarlet Onslaught Emerges - updated
  - description added
- quest 12759 - Tools of War - updated
  - description added
- quest 12760 - Secret Strength of the Frenzyheart - updated
  - description added
- quest 12762 - Power of the Great Ones - updated
  - description added
- quest 12771 - Ironforge - updated
  - quest giver added: Bishop Lazaril
  - description added
- quest 12773 - Darnassus - updated
  - quest giver added: Bishop Lazaril
  - description added
- quest 12774 - Stormwind - updated
  - quest giver added: Bishop Lazaril
  - description added
- quest 12776 - The Exodar - updated
  - quest giver added: Bishop Lazaril
  - description added
- quest 12778 - The Scarlet Apocalypse - updated
  - description added
- quest 12785 - Orgrimmar - updated
  - quest giver added: Grand Apothecary Putress
  - description added
- quest 12787 - The Undercity - updated
  - quest giver added: Grand Apothecary Putress
  - description added
- quest 12788 - Silvermoon - updated
  - quest giver added: Grand Apothecary Putress
  - description added
- quest 12789 - Into the Breach! - updated
  - description added
- quest 12792 - First Things First - updated
  - description added
- quest 12793 - Smoke on the Horizon - updated
  - description added
- quest 12795 - Taking a Stand - updated
  - description added
- quest 12797 - Back Through the Waygate - updated
  - description added
- quest 12799 - Siphoning the Spirits - updated
  - description added
- quest 12800 - The Lich King's Command - updated
  - description added
- quest 12803 - Force of Nature - updated
  - description added
- quest 12805 - Salvaging Life's Strength - updated
  - description added
  - reward items: +1
- quest 12806 - To the Rise with all Due Haste! - updated
  - description added
- quest 12807 - The Story Thus Far... - updated
  - description added
- quest 12809 - Ironforge - updated
  - quest giver added: Bishop Lazaril
  - description added
- quest 12810 - Blood in the Water - updated
  - description added
- quest 12812 - Orgrimmar - updated
  - quest giver added: Grand Apothecary Putress
  - description added
- quest 12813 - From Their Corpses, Rise! - updated
  - description added
- quest 12815 - No Fly Zone - updated
  - description added
- quest 12818 - Clean Up - updated
  - description added
- quest 14093 - All Hell Breaks Loose - updated
  - description added
- npc 2784 - King Magni Bronzebeard - updated
  - coordinates: 4 spawn points added in Ironforge
- npc 7937 - High Tinker Mekkatorque - updated
  - coordinates: 2 spawn points added in Ironforge

## [0.2.259] - 2026-10-25

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 10,535 quests, 97 NPCs, 5 objects
- database - Classic Era: data from the PandaQuest portal: 512 quests, 7 NPCs, 1 object
- database - TBC Anniversary: data from the PandaQuest portal: 476 quests, 6 NPCs
- quest 12604 - Congratulations! - updated
  - reward items: +1
- quest 12605 - Securing the Bait - updated
  - description added
- quest 12606 - Cocooned! - updated
  - description added
- quest 12607 - A Mammoth Undertaking - updated
  - description added
- quest 12608 - Cultist Incursion - updated
  - description added
- quest 12612 - The Fallen Pillar - updated
  - description added
- quest 12613 - Powering the Waygate - The Makers' Overlook - updated
  - description added
- quest 12615 - The Blessing of Zim'Torga - updated
  - description added
- quest 12620 - The Lifewarden's Wrath - updated
  - description added
- quest 12621 - Freya's Pact - updated
  - description added
- quest 12623 - To the Witch Doctor - updated
  - description added
- quest 12627 - Breaking Through Jin'Alai - updated
  - description added
- quest 12628 - To Speak With Har'koa - updated
  - description added
- quest 12629 - You Can Run, But You Can't Hide - updated
  - description added
- quest 12631 - An Invitation, of Sorts... - updated
  - description added
- quest 12633 - Darkness Calling - updated
  - description added
- quest 12634 - Some Make Lemonade, Some Make Liquor - updated
  - description added
- quest 12635 - Relics of the Snow Leopard Goddess - updated
  - description added
- quest 12636 - The Eye Of Acherus - updated
  - description added
- quest 12638 - Close Call - updated
  - description added
- quest 12640 - Sealing the Rifts - updated
  - description added
- quest 12641 - Death Comes From On High - updated
  - description added
- quest 12642 - Spirit of Rhunok - updated
  - description added
- quest 12643 - Silver Lining - updated
  - description added
- quest 12644 - Still At It - updated
  - description added
- quest 12646 - My Prophet, My Enemy - updated
  - description added
- quest 12648 - Dressing Down - updated
  - description added
- quest 12649 - Suit Up! - updated
  - description added
- quest 12650 - Plundering Their Own - updated
  - description added
- quest 12651 - Lakeside Landing - updated
  - description added
- quest 12653 - Back to Har'koa - updated
  - description added
- quest 12654 - The Part-time Hunter - updated
  - description added
- quest 12655 - The Blessing of Zim'Rhuk - updated
  - description added
- quest 12658 - My Pet Roc - updated
  - description added
- quest 12659 - Scalps! - updated
  - description added
- quest 12660 - Weapons of Destruction - updated
  - description added
- quest 12663 - Reunited - updated
  - description added
- quest 12664 - Dark Horizon - updated
  - description added
- quest 12666 - Preparations for the Underworld - updated
  - description added
- quest 12667 - Seek the Wind Serpent Goddess - updated
  - description added
- quest 12668 - Foundation for Revenge - updated
  - description added
- quest 12670 - The Scarlet Harvest - updated
  - description added
- quest 12671 - Reconnaissance Flight - updated
  - description added
- quest 12672 - Setting the Stage - updated
  - description added
- quest 12673 - It Rolls Downhill - updated
  - description added
- quest 12675 - One Last Thing - updated
  - description added
- quest 12680 - Grand Theft Palomino - updated
  - description added
- quest 12683 - Burning to Help - updated
  - description added
- quest 12684 - Blood of a Dead God - updated
  - description added
- quest 12688 - Engineering a Disaster - updated
  - description added
- quest 12692 - Return of the Lich Hunter - updated
  - description added
- quest 12695 - Return of the Friendly Dryskin - updated
  - description added
- quest 12696 - Aerial Surveillance - updated
  - description added
- quest 12699 - An Embarassing Incident - updated
  - description added
- quest 12700 - An Attack Of Opportunity - updated
  - description added
- quest 12702 - Chicken Party! - updated
  - description added
- quest 12703 - Kartak's Rampage - updated
  - description added
- quest 12704 - Appeasing the Great Rain Stone - updated
  - description added
- quest 12705 - Will of the Titans - updated
  - description added
- quest 12708 - Enchanted Tiki Warriors - updated
  - description added
- quest 12710 - Disclosure - updated
  - description added

## [0.2.246] - 2026-10-24

### Changed
- **The CurseForge package made from the repository carries every game again.** CurseForge's own
  packaging (the repository webhook) now gets the TOCs of all four games and their databases, so a
  file it makes runs in Mists of Pandaria Classic, Classic Era, TBC Anniversary and WoW Forever, like
  the GitHub release.
  - every game's TOC is kept in the repository, written from one template by `build.py tocs`, and the checks fail if one is missing or differs
  - `.pkgmeta` no longer leaves the Classic Era, TBC Anniversary and Forever databases out

## [0.2.242] - 2026-10-23

### Fixed
- **Flight times and quest mobs missing after an update.** The game reads an addon's file list when
  it starts, not on `/reload`, so an update installed while the game ran loaded its changed files but
  not its new ones: after 0.2.236 the flight bar showed only the time in the air on a grey bar, the
  flight master showed no flight times and no quest mob was marked. PandaQuest now notices files that
  did not load and says once in chat to quit the game completely and start it again.
- **Quest mobs: the right NPCs for kill-credit objectives.** An objective named after a group
  ("Muckscale tribe members slain") was matched by position among all of the quest's creatures,
  counting the ones other objectives had already claimed by name, so the group was never marked and
  another creature was marked twice. It now picks only from the creatures no other objective names.

### Added
- **More quest NPCs marked on nameplates and tooltips**, each with its own switch under Quest mobs:
  - the NPC a talk-to objective names (a speech mark);
  - the NPC a quest in your log is turned in to: a yellow "?" when it is complete, a grey one before;
  - quest givers with a quest you can pick up now: a "!".
  - The kill mark is now PandaQuest's kill pin by default, so it is not mistaken for a quest giver's
    "!". Friendly NPCs need friendly nameplates (Shift-V) to show their marks.

## [0.2.241] - 2026-10-23

PandaQuest now runs in four games: Mists of Pandaria Classic, WoW Classic Era, The Burning Crusade
Classic Anniversary and WoW Forever.

### Added
- **Classic Era and TBC Anniversary.** One download carries a TOC per game (`PandaQuest_Vanilla.toc`,
  `PandaQuest_TBC.toc`), and each game loads only its own quest database (`Database/Era/`,
  `Database/Anniversary/`), built by the PandaQuest portal from the same Questie release as MoP's.
  - Era and TBC use their own zone maps; TBC Anniversary follows Questie's content phase 3.
  - Respawn timers, drop rates and gathering nodes from pfQuest's vanilla and TBC data work there too.
- **WoW Forever** (`PandaQuest_Forever.toc` and `PandaQuest_Camelot.toc`). The addon loads in Forever;
  its quest database comes with the game's launch on 4 November 2026 (no beta data), and until then
  one line in chat says so instead of a reinstall message.
  - Forever is a modern-engine client: the quest log, spells, reputation, quest tags, tooltips and the
    super-tracked quest are read through its own API.
  - Skyborne quests (race-mask bits 32 and 33) are matched correctly.

### Changed
- Features a game does not have stay off there, without touching your settings: archaeology and the
  dig-site bar are MoP's; the quest tracker distances use MoP's tracker; in WoW Forever the recipe
  scanner and kill counts from the combat log are off for now.
- The community file the sync app writes is MoP's; in another game it is kept aside, never applied.

### Unchanged
- The MoP Classic TOC and database are byte for byte what they were.
- Saved data: each game's WTF folder keeps its own. MoP data copied into another game's folder is set
  aside whole (`foreign.mop`), never deleted.

## [0.2.240] - 2026-10-23

### Removed
- **The auction house.** The price scan (the Scan prices button and `/pq scan`), the mailbox sales
  record, the auction prices on item tooltips, their three switches under Options > Modules and the
  Auction options page are gone.
  - Your saved auction data is kept: `PandaQuestAH` stays declared in the TOC, because WoW deletes a
    saved variable that is no longer declared at the next logout. Nothing reads or writes it any more.
  - `/pq scan` on its own now says to open a profession window; `/pq scan professions` and
    `/pq scan archaeology` work as before.

## [0.2.239] - 2026-10-23

Documentation only.

### Changed
- **README brought up to date.** Flight times before the first flight, quest-mob icons, links to
  the PandaQuest site instead of Wowhead, the Wago app, the PandaQuest Sync app and the privacy
  statement.

## [0.2.236] - 2026-10-23

The flight bar knows how long the flight takes, and quest mobs are marked on their nameplates.

### Added
- **Flight time before the first flight.** The bar shows "1 min 30 s left" and fills from takeoff on
  routes you have never flown. The expected time is, in order: your own median (two flights or more);
  the median all players measured, from the PandaQuest portal (the whole multi-hop flight when the
  portal has it, else the sum of its legs); the portal's estimate from the path's length; one flight
  of your own; the straight line between the flight masters. Everything but the first two reads
  "~... left (estimated)". Hover the bar for the arrival time on the clock.
  - The flight master's tooltip shows the same expected time for every destination before you click.
  - Your own flights are still timed and uploaded as before.
  - New data file `Database/Overrides/Flights.lua`, written by the portal's data sync.
- **Quest mobs.** NPCs that your active, unfinished quests need you to kill -- kill objectives,
  kill-credit groups and the NPCs that drop a quest item -- get a small quest mark on their nameplate
  and a "Quest: <title> (3/8)" line on their tooltip. The mark goes as soon as the objective is done.
  - Options > Navigation > **Quest mobs**: the icon (the quest "!", crossed swords or PandaQuest's
    kill pin), its size, an optional gold tint on the health bar (off by default) and the tooltip line.
    Options > Modules switches the whole thing off.
  - Works with Blizzard's nameplates and leaves Plater, KUI and others alone: the mark is a frame of
    its own on top of the plate. Enemy nameplates must be shown (V).

## [0.2.235] - 2026-10-23

One PandaQuest window, in the layout the owner asked for: tabs along the top, a category list with
icons, the settings as rows.

### Added
- **The PandaQuest window** (`/pq`, the minimap button): a dark window with a gold edge, the round
  PandaQuest logo over its top left corner, and five tabs -- **Quests** (the quest browser, the
  default), **Status** (synchronisation, the last upload the portal confirmed, the database and its
  counts), **Options**, **About & Help** (what the addon does, the portal's address, credits and
  licences, and the chat commands folded away) and **Performance** (the addon's memory, every module
  on or off and how many events, messages, timers and buckets it holds; nothing needs script
  profiling).
- **Options as categories**: Navigation, Map & Minimap, Tooltips, Flight, Professions & Gathering,
  Auction, Notifications, Sync & Privacy, Appearance, Language & Units, Modules, Profiles, Release notes
  and Advanced, each with an icon. A category with several groups has sub-tabs. Every setting is a row:
  its name in white, a line in grey under it, and its control on the right -- a check box, a slider
  with its range and a number box, a list, a button or a text box.
- **Search all settings**, a box above the categories: every setting whose name or description has
  the words in it, under the category it belongs to.
- **Reset Settings** per category, after a yes: only that category's settings go back to their
  defaults.
- Appearance > **Window**: the window's size on top of the game's UI scale, and putting it back.
- Options > **Release notes**: the feature releases, quoted from this changelog.

### Changed
- The window can be moved and resized (from the corner, down to the quest browser's size), and
  remembers its place, size and scale per profile (`profile.window`, a new key). It never grows past
  the screen at any UI scale. Escape closes it.
- The Settings button and `/pq options` open the window's Options tab. The same options are still in
  the game's own Settings panel and in `/pq config`: all three read the one options table.
- The window and each page are built the first time they are opened, only the rows on screen exist,
  and nothing runs while the window is hidden.

## [0.2.234] - 2026-10-23

Fewer commands to remember: `/pq` opens PandaQuest, and everything else is in its Settings.

### Changed
- **`/pq` (and `/pandaquest`) opens the quest browser**, every quest in the database, instead of the
  options. A **Settings** button with a gear in its header opens all the settings in their own window.
  `/pq options` still opens them directly.
- **A quest's page** has four buttons: *Navigate* (the arrow and the pins follow it), *Hide from the
  navigator* / *Show in the navigator*, *Show on map* (the world map, where the quest starts) and
  *PandaQuest link*. Right-clicking a quest in the list offers the same four.
- `/pq help` prints one line: "/pq opens PandaQuest; everything else is in its Settings." Every old
  command still works, for macros; `/pq help all` and Settings > Advanced list them.

### Added
- Settings > **Status**: what `/pq status` and `/pq sync` print, on a page.
- Settings > **Hidden quests**: every quest hidden from the navigator, and buttons to show one or all of
  them again.
- Settings > **Moving frames**: *Unlock frames to move them* (the arrow, the flight bar and the dig site
  bar, with the two bars shown for a moment) and *Reset positions*.
- Settings > **Synchronisation and privacy** says what is recorded and what never is, and has the data
  sharing question as a button.
- Settings > **Advanced**: print a database entry (quest, NPC, object or item), and the list of every
  chat command.

## [0.2.233] - 2026-10-23

PandaQuest uses its Ace3 libraries fully. In the game it looks and plays as before, with one new
options section.

### Added
- **Options > Modules.** Fifteen parts of PandaQuest can be switched off completely: the arrow, map
  and minimap pins, quest info in tooltips, respawn timers, gathering nodes, the quest tracker
  additions, notifications, the dig site bar, the auction house scan, auction sales from the mailbox,
  auction prices in tooltips, the recipe reader, the archaeology reader, quest data recording and gear
  recording. A part that is off stops listening to the game, its timers stop and it shows nothing.
  The switch is stored in the profile (`profile.modules.<Name>`, on by default) and follows a profile
  switch, copy or reset. What the rest is built on (quest log, targets, database, options) always runs.
- **`/pq config [section] [option] [value]`** changes any setting from chat: AceConfigCmd-3.0 on the
  same options table the panel draws. `/pq config` lists the sections; a section that is not also a
  command works without the word, e.g. `/pq map showOnMinimap off`. Every other command is unchanged.

### Changed
- Every subsystem is an AceAddon-3.0 module of one addon object, created in the lifecycle order and
  enabled one by one in that order at login, before the database starts loading -- the same order as
  before. `ns.<Name>` is still the module, so nothing that reads it changed.
- Each module is its own AceEvent/AceTimer/AceBucket target, so switching it off drops all of its
  events, messages, timers and buckets at once.
- Timers that were frames counting every frame are AceTimers that fire only when due: the minimap pin
  re-ranking (4 per second, only while needed), the node tooltip respawn countdown, the auction scan
  poll and the telemetry breadcrumb sampler. The pin redraw, the notification hold and the mailbox read
  were `C_Timer` calls; they are AceTimers on their module now. The combat log is an AceEvent
  registration, made only while quest data is recorded.
- Bursty events go through AceBucket: `MAIL_INBOX_UPDATE` (one read per burst) and
  `TRADE_SKILL_UPDATE` / `TRADE_SKILL_LIST_UPDATE` (one look at the window per burst), beside the
  `QUEST_LOG_UPDATE` bucket that was there.
- `Telemetry.IsEnabled`, `CharacterSheet.IsEnabled` and `Professions.IsEnabled` are renamed
  `IsRecording`, `IsRecording` and `IsLayerEnabled`: `IsEnabled` is AceAddon's own on every module.

### Fixed
- Choosing a language now puts every text back to English before it applies the new one, so a text that
  language does not translate reads in English -- not in the game's language or the language chosen
  before it (`/pq lang enUS` on a German client gave German until a reload).

### Saved data
- Nothing in `PandaQuestDB`, `PandaQuestSync`, `PandaQuestAH` or `PandaQuestProf` is moved, renamed
  or dropped. The only new keys are the module switches, and AceDB writes them only when one is off.

## [0.2.230] - 2026-10-23

Fixes to a quest's page in the quest browser, from the owner's screenshot of "Magic" Mushrooms (29362).

### Fixed
- **The map showed for a moment and then disappeared**, leaving its brown ground and the pins. The zone
  art's tiles and the brown ground were textures in the same draw layer and sub-level, which the client
  draws in no fixed order and re-sorts when the page changes (the crossfade, a pin popping in). The
  ground is now at sub-level -8 and the tiles at 1, so the art is always on top.
- **Level "-1"**: a quest whose level follows the player's (Questie's -1) reads *Scales* in the list
  and on the page, its colour and difficulty are taken at the player's level, and the line under the
  title says it scales with your level.
- **Rewards "+5 81"**: the reputation is written with the faction's name, "+5 The Tillers" (the
  faction id when the client does not know it), and money is shown in gold, silver and copper coins.
- **Wowhead link** is now **PandaQuest link**: the copy box holds the quest's page on the PandaQuest
  portal, https://pd.zroot.it/quests/<id>. Every other link the addon hands out (the arrow's and the
  map pins' menus, `/pq wh`) goes to the portal too.

## [0.2.226] - 2026-10-23

### Fixed
- Flights are recorded again. The recorder started a measurement only on `PLAYER_CONTROL_LOST`, and
  only if `UnitOnTaxi("player")` was already true at that moment. On the 5.5.4 client the taxi flag
  is set a moment after the flight master's button is pressed, so that never matched: no flight was
  measured, no route time was stored and the flight bar never appeared. Takeoff and landing are now
  read from `UnitOnTaxi` itself -- an AceTimer checks it for up to 10 seconds after the click, and
  every half second in the air -- with the control and unit-flag events only making the check
  sooner. This is the approach InFlight uses on this client, reimplemented.
- A click the server refuses (a taxi error message) is dropped at once, so it cannot name a quest
  taxi taken a few seconds later. A summon, a battleground or dungeon port, an early landing or a
  loading screen in the air end the flight elsewhere and are not filed.

### Added
- A `/reload` in the air keeps the flight: it is kept in `PandaQuestDB.char.flightInAir` with the
  server's clock and picked up after the reload. A login in the air (after a disconnect) is shown on
  the bar but not filed, because the time logged out was not seen in the air.
- Each flight keeps its route as node ids with every stop, the seconds in the air, the fare (the
  money that left your purse, else the flight master's price) and the landing time.
- With synchronisation on, every finished flight from a flight master is added to
  `PandaQuestSync.flights` (`id`, `src`, `dst`, `hops`, `s`, `cost`, `t`, `char`, `build`, and
  `speed` for a character with Ride Like the Wind) for the companion app to take to the PandaQuest
  site, which can then show flight routes, their times and their prices. The newest 300 are kept.
  When the site's community file carries `flightsAckedAt`, the flights it covers are dropped, the way
  `ackUploadedThrough` drops uploaded sessions. Existing saved data is not changed.

## [0.2.225] - 2026-10-23

### Changed
- Left-click on the minimap button now opens and closes the quest browser, the general list of
  quests. Shift-click shows or hides the arrow (what left-click used to do); right-click still opens
  the options. The tooltip and the options say so in every language.

### Added
- The minimap button is a LibDataBroker data source rather than a plain launcher, so Titan Panel,
  ChocolateBar and every other broker display can show it. Its text follows the flight in progress
  (destination and time left, in the flight bar's own words), else the current target and its
  distance, else how many quests you track; the icon turns into the taxi pin while you fly. The text
  is rebuilt on events and by a one-second AceTimer only while a target or a flight is shown, never
  per frame, and a burst of events is one rebuild.
- The button's tooltip adds the flight in progress and, when the addon knows it, the last time the
  PandaQuest site confirmed a sync.
- Options: lock the minimap button in place. The button's settings live in the AceDB profile, and a
  profile switch, copy or reset moves the button to the new profile's table.
- The add-on compartment (`LibDBIcon:AddButtonToCompartment`) behind LibDBIcon's own feature check,
  with a switch in the options. The Mists Classic 5.5.4 client has no add-on compartment, so there
  the switch is hidden and nothing is registered.

## [0.2.201] - 2026-10-20

The changelog says what changed in every data sync, all of it.

### Changed
- `changelog.txt` may carry indented lines under a data change, one per thing that changed for that
  quest, NPC, object or item (`  - coordinates: 3 spawn points added in Badlands`). The checks
  allow them as `  - <what changed>`, at most 100 characters, under a change line.
- The GitHub release notes now end with the version's own section of `changelog.txt`, every line
  of it. Past GitHub's 125,000-character limit for a release body they carry the section's summary
  lines and links to `changelog.txt` at the release's tag, which always holds the whole list.
- A CurseForge upload (`publish-curseforge.yml`) sends the section whole up to 30,000 characters
  and, past that, its summary and the links to the full list. CurseForge documents no limit; 30,000
  stays under the largest changelog this project has seen accepted.
- `changelog.txt` and `CHANGELOG.md` keep the newest data syncs in full; older ones are in their
  GitHub releases and on https://pd.zroot.it/changelog.

## [0.2.198] - 2026-10-20

Waypoints you see in the world, as far as Mists of Pandaria Classic lets an addon show them.

### Added
- **Pinpoint.** When the waypoint is an NPC -- the quest's hand-in NPC, or its giver -- and the NPC's
  nameplate is on screen, the quest's name and what to do there ("Ready for turn-in") float over it in
  a framed label, with three chevrons pointing down at the NPC. It appears within the Pinpoint
  distance (20 yards; Options → Waypoints).
- **Beam.** Further out, a column of light rises from the same nameplate, with a badge and the
  distance at its foot. It fades as you close in and gives way to the Pinpoint label.
- **Card.** The badge, the distance and the travel time to the waypoint ride on the arrow.
- **Which place.** The waypoint follows the quest you track on the map (or else the arrow's target):
  once the quest is complete, its hand-in NPC, at that NPC's nearest spot in the zone you are in.
  Objectives of unfinished quests are marked only when you switch that on. `Waypoint:SetQuest(questID)`,
  `Waypoint:SetPoint(uiMapID, x, y, label)` and `Waypoint:Clear()` let other parts of the addon choose
  it (`ns.Waypoint`).
- **`/way [zone] x y [label]`**, TomTom's syntax (`35 79`, `35, 79`, decimal commas, a zone name or
  `#uiMapID`, `/way clear`), registered only when no other addon owns `/way`. The point is a flag on
  the map and the arrow follows it; it is forgotten when you walk up to it (an option), and a pin you
  had made yourself comes back when it goes.
- **TomTom.** With TomTom installed, `/way` stays TomTom's, and the waypoint TomTom's arrow follows is
  shown in PandaQuest's style (`TomTomBridge.WatchCrazyArrow`, post-hooks only).
- **Options → Waypoints**: every part on or off, the Pinpoint distance, beam colour, size, forgetting a
  `/way` point on arrival, and a button for friendly NPC nameplates, which the NPC marker needs.
  PandaQuest never changes that game setting on its own.
- `Textures/Waypoint/`: the beam, the badge, the chevrons and the label's plate -- original art,
  drawn by a script, under the addon's licence.

### Not possible in this client
- Mists of Pandaria Classic 5.5.4 has no `C_Navigation`, no `C_SuperTrack` and no
  `C_Map.SetUserWaypoint`, and the camera cannot be read, so nothing can be drawn at a spot in the 3D
  world. There is no beam over a bare map coordinate or over an object (objects have no nameplate);
  the arrow and the card show the way there. Friendly nameplates reach addons outdoors only.

### Saved data
- New keys only: `waypoint` in the profile (the options) and `waypoint` under the character (the point
  or quest you chose). Nothing saved before is moved or changed.

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
