# Changelog

All notable changes to PandaQuest are documented here.

Older data syncs: see each version's GitHub release notes and https://pd.zroot.it/changelog

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

## [0.2.229] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,371 quests, 51 NPCs, 4 objects
- quest 8486 - Arcane Instability - updated
  - description added
  - reward choices: +2
- quest 8561 - Conqueror's Crown - updated
  - description added
  - reward items: +1
- quest 9911 - The Count of the Marshes - updated
  - description added
- quest 10457 - Protecting Our Own - updated
  - description added
  - reward choices: +4
- quest 10504 - The Bladespire Ogres - updated
  - description added
  - reward choices: +4
- quest 10922 - Digging Through Bones - updated
  - description added
- quest 11793 - Further Investigation - updated
  - description added
- quest 13563 - A Love Eternal - updated
  - description added
  - reward choices: +2
- quest 13898 - The Tides Turn Against Us - updated
  - description added
- quest 14075 - Trouble in the Mines - updated
  - description added
- quest 27152 - Unusual Behavior... Even For Gnolls - updated
  - description added
- quest 28837 - Altered Beasts - updated
  - description added
- quest 31735 - The Right Tool For The Job - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +9
- quest 31736 - Envoy of the Alliance - updated
  - description added
  - reward money added (9g 80s)
- quest 31737 - The Cost of War - updated
  - description added
  - reward money added (9g 80s)
- quest 31738 - Pillaging Peons - updated
  - description added
  - reward money added (9g 80s)
- quest 31739 - Priorities! - updated
  - description added
  - reward money added (9g 80s)
- quest 31740 - Koukou's Rampage - updated
  - description added
  - reward money added (9g 80s)
- quest 31741 - Twinspire Keep - updated
  - description added
  - reward money added (9g 80s)
- quest 31742 - Fractured Forces - updated
  - description added
  - reward money added (9g 80s)
- quest 31743 - Smoke Before Fire - updated
  - description added
  - reward money added (9g 80s)
- quest 31744 - Unfair Trade - updated
  - description added
  - reward money added (9g 80s)
- quest 31745 - Onward and Inward - updated
  - description added
  - reward money added (9g 80s)
- quest 31752 - Blingtron 4000 - updated
  - reward items: +1
- quest 31754 - Cannonfire - updated
  - description added
  - reward money added (11g 40s)
- quest 31755 - Acts of Cruelty - updated
  - description added
  - reward money added (11g 40s)
- quest 31757 - Unleashed Spirits - updated
  - description added
  - reward money added (11g 40s)
- quest 31758 - Laosy Scouting - updated
  - description added
  - reward money added (11g 40s)
- quest 31760 - Striking First - updated
  - description added
  - reward money added (11g 40s)
- quest 31762 - Crumbling Behemoth - updated
  - description added
  - reward money added (11g 40s)
- quest 31765 - Paint it Red! - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +9
- quest 31766 - Touching Ground - updated
  - description added
  - reward money added (9g 80s)
- quest 31767 - Finish Them! - updated
  - description added
  - reward money added (9g 80s)
- quest 31768 - Fire Is Always the Answer - updated
  - description added
  - reward money added (9g 80s)
- quest 31769 - The Final Blow! - updated
  - description added
  - reward money added (9g 80s)
- quest 31770 - You're Either With Us Or... - updated
  - description added
  - reward money added (9g 80s)
- quest 31772 - Priorities! - updated
  - description added
  - reward money added (9g 80s)
- quest 31773 - Prowler Problems - updated
  - description added
  - reward money added (9g 80s)
- quest 31774 - Seeking Zin'jun - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +9
- quest 31775 - Assault on the Airstrip - updated
  - description added
  - reward money added (9g 80s)
- quest 31776 - Strongarm Tactics - updated
  - description added
  - reward money added (9g 80s)
- quest 31777 - Choppertunity - updated
  - description added
  - reward money added (9g 80s)
- quest 31778 - Unreliable Allies - updated
  - description added
  - reward money added (9g 80s)
- quest 31779 - The Darkness Within - updated
  - description added
  - reward money added (19g 60s)
- quest 31780 - Old MacDonald - updated
  - description added
  - reward money added (70s)
- quest 31781 - Lindsay - updated
  - description added
  - reward money added (35s)
- quest 31782 - Overthrone - updated
  - description added
  - reward money added (11g 40s)
  - reward choices: +9
- quest 31785 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31787 - Pristine Mogu Runestone - updated
  - description added
  - reward items: +2
- quest 31788 - Pristine Terracotta Arm - updated
  - description added
  - reward items: +2
- quest 31789 - Pristine Petrified Bone Whip - updated
  - description added
  - reward items: +2
- quest 31790 - Pristine Thunder King Insignia - updated
  - description added
  - reward items: +2
- quest 31791 - Pristine Edicts of the Thunder King - updated
  - description added
  - reward items: +2
- quest 31792 - Pristine Iron Amulet - updated
  - description added
  - reward items: +2
- quest 31793 - Pristine Branding Iron - updated
  - description added
  - reward items: +2
- quest 31794 - Pristine Mogu Coin - updated
  - description added
  - reward items: +2
- quest 31795 - Pristine Pandaren Tea Set - updated
  - description added
  - reward items: +2
- quest 31796 - Pristine Game Board - updated
  - description added
  - reward items: +2
- quest 31797 - Pristine Twin Stein Set - updated
  - description added
  - reward items: +2
- quest 31798 - Pristine Walking Cane - updated
  - description added
  - reward items: +2
- quest 31799 - Pristine Empty Keg - updated
  - description added
  - reward items: +2
- quest 31800 - Pristine Carved Bronze Mirror - updated
  - description added
  - reward items: +2
- quest 31801 - Pristine Gold-Inlaid Figurine - updated
  - description added
  - reward items: +2
- quest 31802 - Pristine Apothecary Tins - updated
  - description added
  - reward items: +2
- quest 31803 - Pristine Pearl of Yu'lon - updated
  - description added
  - reward items: +2
- quest 31804 - Pristine Standard of Niuzao - updated
  - description added
  - reward items: +2
- quest 31808 - Rampage Against the Machine - updated
  - description added
  - reward money added (11g 40s)
- quest 31809 - Remnants of Anger - updated
  - description added
  - reward money added (45g 60s)
  - reward choices: +9
- quest 31810 - Riding the Skies - updated
  - quest giver added: Elder Anli
  - description added
  - reward money added (5g 70s)
  - reward choices: +1
- quest 31811 - Riding the Skies - updated
  - quest giver added: Elder Anli
  - description added
  - reward money added (5g 70s)
  - reward choices: +1
- quest 31818 - Zunta - updated
  - description added
  - reward money added (1s 75c)
- quest 31819 - Dagra the Fierce - updated
  - description added
  - reward money added (2s 25c)
- quest 31820 - A Present for Teacher - updated
  - description added
  - reward money added (34g 20s)
  - reward items: +1
  - reward choices: +3
- quest 31821 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31822 - Level Up! - updated
  - description added
  - reward money added (2s 25c)
- quest 31823 - Level Up! - updated
  - description added
  - reward money added (11g 40s)
- quest 31824 - Level Up! - updated
  - description added
  - reward money added (90s)
- quest 31825 - Level Up! - updated
  - description added
  - reward money added (11g)
- quest 31826 - Level Up! - updated
  - description added
  - reward money added (10g 60s)
- quest 31827 - Level Up! - updated
  - description added
  - reward money added (11g 40s)
- quest 31842 - Practice Makes Perfect: Master Kistane - updated
  - description added
- quest 32561 - Competing Magic - updated
  - description added
  - reward money added (22g 80s)
  - reward items: +1
- quest 32686 - Pristine Banner of the Mantid Empire - updated
  - description added
  - reward items: +2
- quest 92336 - Potion Master - updated
  - description added
- npc 3667 - Anaya Dawnrunner - updated
  - coordinates: 16 spawn points added in Darkshore
- npc 43929 - Blingtron 4000 - updated
  - coordinates: 26 spawn points added in The Jade Forest
  - coordinates: 20 spawn points added in Orgrimmar
  - coordinates: 19 spawn points added in Krasarang Wilds
  - coordinates: 16 spawn points added in Kun-Lai Summit
  - coordinates: also changed in 7 more zones
- npc 65804 - Golden Lotus Guard - updated
  - coordinates: 28 spawn points added in Vale of Eternal Blossoms

## [0.2.228] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,296 quests, 48 NPCs, 4 objects
- quest 3361 - A Refugee's Quandary - updated
  - description added
- quest 7162 - Proving Grounds - updated
  - description added
  - reward items: +2
- quest 7171 - Legendary Heroes - updated
  - reward items: +1
- quest 11569 - Keymaster Urmgrgl - updated
  - description added
  - reward items: +1
- quest 11967 - Mustering the Reds - updated
  - description added
- quest 12728 - Monitoring the Rift: Winterfin Cavern - updated
  - description added
  - reward items: +1
  - reward choices: +4
- quest 12871 - Aid from the Explorers' League - updated
  - coordinates: 2 objective points added in The Storm Peaks
  - description added
- quest 13506 - Reason to Worry - updated
  - description added
- quest 13520 - The Boon of the Seas - updated
  - description added
  - reward items: +1
- quest 13583 - The Wildkin's Oath - updated
  - description added
- quest 13604 - Archivum Data Disc - updated
  - description added
- quest 13897 - The Battle for Darkshore - updated
  - description added
- quest 13900 - The Offering to Azshara - updated
  - description added
- quest 14078 - Lockdown! - updated
  - description added
- quest 24491 - Follow that Gyro-Copter! - updated
  - description added
- quest 26428 - To Steal From Thieves - updated
  - description added
  - reward choices: +5
- quest 27105 - An Unwelcome Guest - updated
  - description added
- quest 31639 - Shado-Pan Monastery Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31640 - Siege of Niuzao Temple Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31641 - Mogu'shan Palace Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31642 - Scholomance Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31643 - Scarlet Halls Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31644 - Scarlet Monastery Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31645 - Gate of the Setting Sun Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31646 - Shado-Pan Monastery Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31647 - Siege of Niuzao Temple Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31648 - Mogu'shan Palace Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31649 - Scholomance Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31650 - Scarlet Halls Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31651 - Scarlet Monastery Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31656 - The Threat in the South - updated
  - description added
  - reward money added (1g 14s)
- quest 31660 - Not Fit to Swarm - updated
  - description added
  - reward money added (11g 40s)
- quest 31661 - A Source of Terrifying Power - updated
  - description added
  - reward money added (11g 40s)
- quest 31669 - The Cabbage Test - updated
  - description added
  - reward money added (5g 70s)
- quest 31670 - That Dangling Carrot - updated
  - description added
  - reward money added (5g 70s)
- quest 31671 - Why Not Scallions? - updated
  - description added
  - reward money added (5g 70s)
- quest 31672 - A Pumpkin-y Perfume - updated
  - description added
  - reward money added (5g 70s)
- quest 31673 - Red Blossom Leeks, You Make the Croc-in' World Go Down - updated
  - description added
  - reward money added (5g 70s)
- quest 31674 - The Pink Turnip Challenge - updated
  - description added
  - reward money added (5g 70s)
- quest 31675 - The White Turnip Treatment - updated
  - description added
  - reward money added (5g 70s)
- quest 31676 - Ancient Vengeance - updated
  - description added
  - reward money added (11g 40s)
- quest 31677 - The Warlord's Ashes - updated
  - description added
  - reward money added (22g 80s)
- quest 31679 - Extending Our Coverage - updated
  - description added
  - reward money added (11g 40s)
- quest 31680 - Crime and Punishment - updated
  - description added
  - reward money added (11g 40s)
- quest 31681 - Better With Age - updated
  - description added
  - reward money added (11g 40s)
  - reward choices: +5
- quest 31682 - By the Sea, Nevermore - updated
  - description added
  - reward money added (11g 40s)
- quest 31687 - Thinning the Sik'thik - updated
  - description added
  - reward money added (11g)
  - reward choices: +5
- quest 31688 - The Search for Restless Leng - updated
  - description added
  - reward money added (11g)
- quest 31689 - The Dreadsworn - updated
  - description added
  - reward money added (11g 40s)
- quest 31693 - Julia Stevens - updated
  - description added
  - reward money added (10g 60s)
- quest 31694 - Hisingen Blues - updated
  - objectives text added
  - description added
- quest 31698 - Thinning The Pack - updated
  - description added
  - reward money added (11g 40s)
- quest 31699 - Sprite Fright - updated
  - description added
  - reward money added (11g 40s)
- quest 31700 - The Shoe Is On The Other Foot - updated
  - description added
  - reward money added (11g 40s)
- quest 31701 - Dark Huntress - updated
  - description added
  - reward money added (11g 40s)
- quest 31702 - On The Prowl - updated
  - description added
  - reward money added (11g 40s)
- quest 31703 - Madcap Mayhem - updated
  - description added
  - reward money added (11g 40s)
- quest 31704 - Pooped - updated
  - description added
  - reward money added (11g 40s)
- quest 31705 - Needle Me Not - updated
  - description added
  - reward money added (11g 40s)
- quest 31706 - Weeping Widows - updated
  - description added
  - reward money added (11g 40s)
- quest 31707 - A Tangled Web - updated
  - description added
  - reward money added (11g 40s)
- quest 31708 - Serpent's Scale - updated
  - description added
  - reward money added (11g 40s)
- quest 31709 - Lingering Doubt - updated
  - description added
  - reward money added (11g 40s)
- quest 31710 - Tiny Treats - updated
  - description added
  - reward money added (11g 40s)
- quest 31711 - The Seed of Doubt - updated
  - description added
  - reward money added (11g 40s)
- quest 31712 - Monkey Mischief - updated
  - description added
  - reward money added (11g 40s)
- quest 31713 - The Big Brew-haha - updated
  - description added
  - reward money added (11g 40s)
- quest 31714 - Saving the Serpents - updated
  - description added
  - reward money added (11g 40s)
- quest 31715 - The Big Kah-Oona - updated
  - description added
  - reward money added (11g 40s)
- quest 31716 - Pooped - updated
  - description added
  - reward money added (11g 40s)
- quest 31717 - The Trainer's Challenge: Ace Longpaw - updated
  - description added
  - reward money added (11g 40s)
- quest 31718 - The Trainer's Challenge: Big Bao - updated
  - description added
  - reward money added (11g 40s)
- quest 31719 - The Trainer's Challenge: Ningna Darkwheel - updated
  - description added
  - reward money added (11g 40s)
- quest 31720 - The Trainer's Challenge: Suchi the Sweet - updated
  - description added
  - reward money added (11g 40s)
- quest 31721 - The Trainer's Challenge: Qua-Ro Whitebrow - updated
  - description added
  - reward money added (11g 40s)
- quest 31724 - Old MacDonald - updated
  - description added
  - reward money added (3s)
  - reward items: +1
- quest 31725 - Lindsay - updated
  - description added
  - reward money added (90s)
  - reward items: +1
- quest 31726 - Eric Davidson - updated
  - description added
  - reward money added (3g 10s)
  - reward items: +1
- quest 31727 - Gambling Problem - updated
  - description added
  - reward money added (1g 14s)
- quest 31728 - Bill Buckler - updated
  - description added
  - reward money added (8g 20s)
  - reward items: +1
- quest 31729 - Steven Lisbane - updated
  - description added
  - reward money added (11g 40s)
  - reward items: +1
- quest 31730 - A Not So Friendly Request - updated
  - description added
  - reward money added (1g 14s)
- quest 31732 - Unleash Hell - updated
  - description added
  - reward money added (9g 80s)
  - reward choices: +10
- quest 31733 - Touching Ground - updated
  - description added
  - reward money added (9g 80s)
- quest 31734 - Welcome Wagons - updated
  - description added
  - reward money added (9g 80s)
- quest 31756 - High Chance of Rain - updated
  - description added
  - reward money added (11g 40s)
- quest 31771 - Face to Face With Consequence - updated
  - description added
  - reward money added (9g 80s)
- quest 31904 - Cassandra Kaboom - updated
  - description added
  - reward money added (11g 40s)
- quest 31908 - Elena Flutterfly - updated
  - description added
  - reward money added (12s)
- quest 32299 - Just Some Light Clean-Up Work - updated
  - description added
  - reward money added (11g 40s)
- quest 32539 - Dark Offerings - updated
  - description added
  - reward money added (11g 40s)
- quest 32607 - Extended Shore Leave - updated
  - description added
  - reward money added (45g 60s)
- quest 32693 - Pristine Kypari Sap Container - updated
  - description added
  - reward items: +2
- quest 33161 - A Timeless Tour - updated
  - description added
  - XP added (236,000)
- object 214862 - Hatchling Poop - updated
  - coordinates: 29 spawn points added in The Jade Forest
- object 214863 - Hatchling Poop - updated
  - coordinates: 24 spawn points added in The Jade Forest

## [0.2.227] - 2026-10-23

Data from the PandaQuest portal.

- database - Wowhead data as the PandaQuest portal read it: 8,216 quests, 48 NPCs, 2 objects
- quest 5892 - Irondeep Supplies - updated
  - description added
- quest 8764 - The Changing of Paths - Protector No More - updated
  - reward choices: +2
- quest 9280 - Replenishing the Healing Crystals - updated
  - description added
  - reward choices: +3
- quest 10704 - How to Break Into the Arcatraz - updated
  - description added
  - reward items: +1
  - reward choices: +5
- quest 10735 - Down the Violet Path - updated
  - description added
  - reward items: +1
- quest 11212 - Tabetha's Farm - updated
  - description added
- quest 24471 - Aid for the Wounded - updated
  - description added
- quest 24475 - All the Other Stuff - updated
  - description added
- quest 28121 - Forces of Jaedenar - updated
  - description added
- quest 28609 - Hammer Time - updated
  - description added
- quest 31542 - Incarnadine Ink - updated
  - description added
  - reward money added (11g 40s)
  - XP added (236,000)
  - reward items: +1
- quest 31543 - Portrait of a Lady - updated
  - description added
  - reward money added (11g 40s)
  - XP added (236,000)
  - reward items: +1
- quest 31544 - A Tribute to the Dead - updated
  - description added
  - reward money added (11g 40s)
  - XP added (236,000)
  - reward items: +1
- quest 31545 - The Finer Things - updated
  - description added
- quest 31548 - Learning the Ropes - updated
  - description added
  - reward money added (90s)
- quest 31549 - On The Mend - updated
  - description added
  - reward money added (4g 10s)
- quest 31550 - Got one! - updated
  - description added
  - reward money added (10g 60s)
- quest 31551 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31552 - Learning the Ropes - updated
  - description added
  - reward money added (10g 60s)
- quest 31553 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31555 - Got one! - updated
  - description added
  - reward money added (10g 60s)
- quest 31556 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31557 - The Finer Things - updated
  - description added
- quest 31558 - The Finer Things - updated
  - description added
- quest 31559 - The Finer Things - updated
  - description added
- quest 31560 - The Finer Things - updated
  - description added
- quest 31561 - The Finer Things - updated
  - description added
- quest 31562 - The Finer Things - updated
  - description added
- quest 31563 - The Finer Things - updated
  - description added
- quest 31564 - The Finer Things - updated
  - description added
- quest 31565 - The Finer Things - updated
  - description added
- quest 31566 - The Finer Things - updated
  - description added
- quest 31567 - The Finer Things - updated
  - description added
- quest 31568 - On The Mend - updated
  - description added
  - reward money added (90s)
- quest 31569 - Got one! - updated
  - description added
  - reward money added (90s)
- quest 31570 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31571 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31572 - On The Mend - updated
  - description added
  - reward money added (90s)
- quest 31573 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31574 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31575 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31576 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31577 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31578 - Got one! - updated
  - description added
  - reward money added (9g)
- quest 31579 - Learning the Ropes - updated
  - description added
  - reward money added (90s)
- quest 31580 - On The Mend - updated
  - description added
  - reward money added (90s)
- quest 31581 - Got one! - updated
  - description added
  - reward money added (90s)
- quest 31582 - Learning the Ropes - updated
  - description added
  - reward money added (10g 60s)
- quest 31583 - On The Mend - updated
  - description added
  - reward money added (11g 40s)
- quest 31584 - Got one! - updated
  - description added
  - reward money added (10g 60s)
- quest 31588 - Learning the Ropes - updated
  - description added
  - reward money added (11g 40s)
- quest 31589 - On The Mend - updated
  - description added
  - reward money added (65s)
- quest 31590 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31591 - Learning the Ropes - updated
  - description added
  - reward money added (10g 60s)
- quest 31592 - On The Mend - updated
  - description added
  - reward money added (10g 60s)
- quest 31593 - Got one! - updated
  - description added
  - reward money added (11g 40s)
- quest 31598 - Kypa'rak's Core - updated
  - description added
  - reward money added (22g 80s)
- quest 31599 - The Matriarch's Maw - updated
  - description added
  - reward money added (22g 80s)
- quest 31603 - Seeds of Fear - updated
  - reward money added (1g 14s)
- quest 31605 - The Zan'thik Dig - updated
  - description added
  - reward money added (1g 14s)
- quest 31606 - The Dissector Wakens - updated
  - description added
  - reward money added (11g 40s)
  - reward choices: +9
- quest 31609 - The Wrath of Shek'zeer - updated
  - description added
  - reward money added (22g 80s)
- quest 31611 - The Kun-Lai Kicker - updated
  - description added
  - reward money added (45g 60s)
- quest 31612 - Shadow of the Empire - updated
  - description added
  - reward money added (22g 80s)
  - reward choices: +5
- quest 31614 - LFGDungeons - Mists - Heroic Random - 1st - updated
  - reward money added (22g 80s)
  - XP added (294,000)
- quest 31615 - LFGDungeons - Mists - Heroic Random - Nth - updated
  - reward money added (22g 80s)
  - XP added (294,000)
- quest 31616 - LFGDungeons - Mists - Scenario - Normal Random - 1st - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31617 - LFGDungeons - Mists - Scenario - Normal Random - Nth - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31618 - LFGDungeons - Mists - Normal Random - 1st - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31619 - LFGDungeons - Mists - Normal Random - Nth - updated
  - reward money added (11g 40s)
  - XP added (236,000)
- quest 31620 - Stormstout Brewery Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31621 - Stormstout Brewery Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31622 - Stormstout Brewery Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31623 - Stormstout Brewery Challenge Mode - Gold Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31624 - Gate of the Setting Sun Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31625 - Shado-Pan Monastery Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31626 - Siege of Niuzao Temple Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31627 - Mogu'shan Palace Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31628 - Scholomance Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31629 - Scarlet Monastery Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31630 - Scarlet Halls Challenge Mode - Consolation (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31631 - Gate of the Setting Sun Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31632 - Shado-Pan Monastery Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31633 - Siege of Niuzao Temple Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31634 - Mogu'shan Palace Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31635 - Scholomance Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31636 - Scarlet Halls Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31637 - Scarlet Monastery Challenge Mode - Bronze Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 31638 - Gate of the Setting Sun Challenge Mode - Silver Addition (Nth) - updated
  - reward money added (11g 40s)
  - XP added (177,000)
- quest 32627 - Charged Moganite - updated
  - description added
  - reward money added (11g 40s)
- quest 33027 - The Secret Ingredient Is... - updated
  - description added
  - reward money added (22g 80s)
- quest 33230 - A Flash of Bronze... - updated
  - description added
  - reward money added (2g 85s)
- quest 33338 - Empowering the Hourglass - updated
  - description added

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
