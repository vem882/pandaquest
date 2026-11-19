-- TBC Anniversary: Generated from https://www.wowhead.com/tbc/ as the PandaQuest portal read it - DO NOT EDIT BY HAND.
-- Only what the generated database lacks: it fills gaps and adds fields, never replaces Questie's values.
-- Quests: givers (startedBy), hand-ins (finishedBy), the objective line (objectivesText), the zone
-- (zoneOrSort), map points for objectives the database cannot place (extraObjectives); and as extras
-- (DB.GetQuestRewards, DB.GetQuestDescription): rewardMoney (copper), rewardXP, rewardItems and
-- rewardChoices ({itemId, count[, name]}), description. NPCs and objects: spawns and zoneID where the
-- database has none, a name for one it lacks; NPCs' minLevel, maxLevel, rank and subName.
-- Database/DB.lua applies it gap-only, before Community.lua and Portal.lua (Schema key names).
local _, ns = ...
ns.Overrides = ns.Overrides or {}
ns.Overrides.wowhead = {
    quests = {
        [321] = {
            description = "The shipwrecks off the shore here are the doomed Third Fleet of Kul'Tiras, " ..
                "burned and sunk by Red Dragons during the last Great War.\n\nThe Fleet hailed from " ..
                "Lordaeron, but one ship, an Elvish Destroyer: Flying Osprey, was with it. It was " ..
                "shipping a load of Lightforge Iron and joined the Third Fleet for protection. Ironic " ..
                "that it sunk to the same dragons...\n\nEnough history. The Flying Osprey is wrecked to " ..
                "the south of Menethil Harbor. If you find the Lightforge Iron there, bring it to me.",
            rewardItems = {{2702, 1}},
        },
        [531] = {
            description = "Light! Don't bring things like that into the Lodge... it's unsanitary, " ..
                "unspeakable, un... un... unsanitary!\n\nJust get it out of here, will you? No one wants " ..
                "to see your bloody little trophy, really!",
            rewardChoices = {{3574, 1}, {3573, 1}},
        },
        [831] = {
            description = "Humans cannot be trusted. We fought alongside them with a weary heart, knowing " ..
                "they would betray us one day.\n\nAdmiral Proudmoore's death was not enough to stop his " ..
                "legacy of deceit. The human scum had his plans well laid out before he ever met his " ..
                "demise.\n\nHis reign won't even die with Benedict it seems. Who knows how long it will " ..
                "be before the next waves of Proudmoore's men land upon our shores.\n\nWe need to get " ..
                "these orders to Vol'jin in Orgrimmar immediately! He can be found in Thrall's chamber.",
            rewardMoney = 175,
        },
        [1219] = {
            description = "Sifting through the loose dirt, the severed hand of an orc is found. And " ..
                "clutched in the hand is a bone-carved tube. And in the tube is a dirt-stained " ..
                "parchment.\n\nThe parchment is written in orcish... and it looks important.",
        },
        [2937] = {
            description = "Take his parchment, and read it at the altar of Shadra'Alor, deep within the " ..
                "witherbark realm in the Hinterlands. This will summon Shadra the spider god.",
        },
        [3524] = {
            description = "Majestic sea creatures are known to launch themselves at the Darkshore " ..
                "coastline, beached there until they die. Lately, these beasts have been washing ashore " ..
                "in ever-increasing numbers. I've been sent here by the Temple of the Moon to " ..
                "investigate, but the presence of murlocs along the water has made my research " ..
                "difficult.\n\nThere is a giant creature washed ashore just south of Auberdine that is " ..
                "ringed by the foul Greymist murlocs. Could you go there and retrieve bones from the " ..
                "creature for our study?",
            rewardMoney = 400,
        },
        [3784] = {
            description = "Excuse me <class>, but I'd like just a moment of your time if possible.\n\nThe " ..
                "Cenarion Circle in Thunder Bluff is most interested in seasoned adventurers such as " ..
                "yourself to lend them aid in a vital research project. While I do not know the " ..
                "specifics, I can inform you that none other than Hamuul Runetotem is spearheading this " ..
                "research.\n\nPlease - if you are interested, speak with him directly on the Elder Rise " ..
                "within Thunder Bluff proper.",
        },
        [3884] = {
            description = "You have uncovered a mangled journal. Parts of it remain legible, with a " ..
                "Williden Marshal claiming ownership over the contents therein. If the journal is " ..
                "accurate, then Williden may be found somewhere in the northern part of the Crater; " ..
                "according to the journal, he and his companions sought higher ground from the savage " ..
                "beasts of the Crater once their base camps were overrun.",
        },
        [4186] = {
            description = "I am going to empower you as an acting deputy of Stormwind, <name>.\n\nReturn " ..
                "to Magistrate Solomon in Lakeshire and deliver this decree.",
        },
        [5384] = {
            description = "This is it, <name>.\n\n<Eva points to the vial inside the bag.>\n\nThe blood " ..
                "of innocents. The purest blood, used to appease Krastinov's master.\n\nIt is with this " ..
                "blood that Kirtonos may be summoned. It is with this blood, then, that Kirtonos must be " ..
                "destroyed.\n\nTake the blood to the porch. Place it upon the brazier. Kirtonos will come " ..
                "- he cannot resist. When he appears, unleash the fury and wrath of a thousand innocent " ..
                "deaths upon him.\n\nShould you succeed, you will earn more than just our gratitude.",
            rewardChoices = {{15805, 1}, {15806, 1}},
            rewardItems = {{13544, 1}},
        },
        [5421] = {rewardItems = {{13546, 1}}},
        [6064] = {
            description = "Hi there, <lad/lass>! So, you'd be wanting to know how you can gain a pet of " ..
                "your own?\n\nWell, let's get started. There's nothing more important than yer equipment " ..
                "when it comes to hunting, but we can chat about my new Shrapnel Blaster some other time. " ..
                "Fer now, let's focus on something I'm sure you're quite interested in: a pet!\n\nThe " ..
                "best way to learn is for you to try out several creatures as companions and see what ya " ..
                "like. So, find a large crag boar, then use the taming rod to tame it.",
            rewardXP = 840,
        },
        [7624] = {
            description = "You wish to enter my good graces? Then kill for me.\n\nMy servant, Ulathek, is " ..
                "pathetic how he grovels before me, all the while plotting with Lord Hel'nurath on " ..
                "Xoroth. Hel'nurath plans to usurp my power here, and Ulathek is his spy...\n\nProve that " ..
                "you serve me and not my rivals. Confront Ulathek in his quarters, in the Shadow Hold to " ..
                "the west. Tell him that I know his secret and watch as fear grips him. Then, bring me " ..
                "the traitor's heart!",
            rewardXP = 9550,
        },
        [8056] = {
            description = "The augurs of our tribe are revered for their gifts of the divine sight, ya " ..
                "mon. They ain't a witch doctor; they spend their time castin' bones or readin' the " ..
                "leaves for insight - not hexin' people. As a shaman, you already know somethin' about " ..
                "the power of augury; we Zandalar prize the insight they give to the tribe.\n\nBring me " ..
                "an offerin' of the Paragons of Power from inside Zul'Gurub and prove your worth to us. " ..
                "Do this for us, and I'll give ya some bracers that our augurs prize above all others!",
            rewardItems = {{19830, 1}},
        },
        [8112] = {rewardItems = {{19612, 1}}},
        [8184] = {rewardItems = {{19782, 1}}},
        [8592] = {
            description = "The Twin Emperors... their incessant whispers are slowly taking a toll on my " ..
                "sanity. They mock me, knowing I cannot step further into their domain to save my brother " ..
                "Arygos.\n\nIn my visions I see their monstrous faces adorned by powerful crowns. But I " ..
                "will have my revenge... I will transmute these symbols of Qiraji power to ones better " ..
                "suited to our needs.\n\nBring me the components I require, <name>. I will give you a " ..
                "headpiece of unmatched power.",
            rewardItems = {{21348, 1}},
        },
        [8992] = {
            description = "Now we have what we need, so it's time to discuss who it is that you'll be " ..
                "summoning next.\n\nKormok was ok for an ogre, right up until he turned to necromancy. " ..
                "After that, things got creepy for just about everyone in the outfit. It was no surprise " ..
                "then when he took his piece of the amulet and returned to his new home, " ..
                "Scholomance.\n\nBut even there, or perhaps especially there, he was not safe from the " ..
                "spectral assassins. They slew him right in front of his master, Ras Frostwhisper.",
        },
        [9167] = {
            description = "Everything we've done in the Ghostlands has been done with the goal of taking " ..
                "back what is rightfully ours. The Scourge have maintained their chokehold on the region " ..
                "for far too long.\n\nThe time has come for payback, <name>. Thanks to your help and the " ..
                "help of our new allies, the Forsaken, vengeance will soon be ours.\n\nHe who sought to " ..
                "steal the power of the Sunwell must die. Go to Deatholme, the Scourge stronghold south " ..
                "of the Dead Scar. Bring me Dar'Khan's head and your deeds will go down in history!",
            rewardChoices = {{22980, 1}, {22982, 1}, {22984, 1}, {22995, 1}},
            rewardMoney = 4000,
        },
        [9245] = {
            description = "Thanks to you and Omarion (May he rest in peace), I am now able to create Icy " ..
                "Scale gauntlets. All you need to do is bring me the materials and pay a small crafting " ..
                "fee.",
            rewardItems = {{22666, 1}},
        },
        [9558] = {
            description = "We were having a problem with arakkoa bandits raiding many of our supply " ..
                "caravans, so I hired some dwarves to take care of them.\n\nThey were brothers; Gremni " ..
                "Longbeard was the oldest.\n\nI'm a little worried about them. Those crazy dwarves packed " ..
                "more ale than food or ammunition! Maybe you can go check up on them?\n\nThe arakkoa's " ..
                "hideout, the Den of Haal'esh, can be found to the far west of here - beyond the Great " ..
                "Fissure. They set up camp northwest of there, south of Dustquill Ravine.",
        },
        [10162] = {
            description = "Now that you've got your wings, perhaps you'd be interested in running another " ..
                "bombing mission?\n\nThis time we've isolated the Legion's main production area, behind " ..
                "the forge camps to the north. I need you to get on a wyvern and destroy the whole damned " ..
                "thing!\n\nHere are your bombs - now, talk to Wing Commander Brack when you're ready for " ..
                "takeoff.",
            rewardChoices = {{29926, 1}, {29940, 1}, {29933, 1}, {29936, 1}},
        },
        [10494] = {
            description = "You kept your word and brought the device built by Mux. I believe a reward is " ..
                "in order if I'm to keep you interested in saving my skin. Bring me the belt and set of " ..
                "gloves that you wish to upgrade. I promise the ones I give you in return will be far " ..
                "superior.",
            rewardItems = {{22098, 1}, {22099, 1}},
        },
        [10530] = {
            description = "Lieutenant Dawnrunner at Farstrider Retreat has requested an audience with all " ..
                "able hunters. It would greatly benefit you to seek her out, <name>. She is a beacon of " ..
                "wisdom for those of our calling.\n\nFarstrider Retreat lies south of Silvermoon City.",
            rewardXP = 85,
        },
        [10581] = {
            description = "VERY WELL, I AM HEREBY WARNING YOU THAT YOU WILL FIND NOTHING UP ON THE " ..
                "RIDGE.\n\nDO NOT FOLLOW THE TRAIL OF SPARE PARTS THAT LEAD TO TOSHLEY 'S STATION! YOU " ..
                "WILL NOT FIND TOSHLEY, NOR ANY OTHER GNOME THERE.",
        },
        [10776] = {
            description = "Gnomus was kind enough to put this concoction together for the final strike. I " ..
                "merely pour it upon this tabard that you have provided for me and the item is imbued " ..
                "with the essence of the Illidari filth.\n\nTake the enchanted tabard and travel to the " ..
                "Eclipsion Fields, southwest of Eclipse Point. Once there, use the tabard to transform " ..
                "into an agent of Illidan. While in disguise, slay the crazed colossi that wander the " ..
                "field. They will think it an attack by the Eclipsion and sever all ties!",
            rewardChoices = {{31075, 1}, {31077, 1}, {31076, 1}, {31078, 1}},
            rewardMoney = 132000,
        },
        [11014] = {
            description = "<Mor'ghor crumples up the service letter and tosses it aside.>\n\nAlright " ..
                "grunt, first things first. If you're gonna join my beloved Dragonmaw army, you'll need " ..
                "to work. Everyone works up here on the ledge. Get a job and don't screw it up and I'll " ..
                "see if there might be something more interesting for you to do later.\n\nGo talk to " ..
                "Taskmaster Varkule Dragonbreath. He's standin' in the middle of town. He'll assess your " ..
                "skills and assign work as he sees fit.\n\nNow get out of my face!",
        },
    },
    npcs = {},
    objects = {},
    items = {},
}
