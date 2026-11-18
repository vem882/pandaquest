-- Classic Era: Generated from https://www.wowhead.com/classic/ as the PandaQuest portal read it - DO NOT EDIT BY HAND.
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
        [117] = {
            description = "Hurry, my friend, move with haste In order for our rich lager to taste More " ..
                "like beer and less like stew, Hops are needed to make the brew.",
            rewardItems = {{1262, 1}},
        },
        [123] = {
            description = "This note is a schedule with a list of days and times when a person -- " ..
                "described only as \"The Collector\" -- will receive a shipment of gold from the mines in " ..
                "Elwynn Forest.\n\nFrom the schedule, it looks as if the Collector resides near the " ..
                "Brackwell Pumpkin Patch in eastern Elwynn.\n\nThis sounds important. You should report " ..
                "it to Marshal Dughan in Goldshire.",
            rewardMoney = 85,
        },
        [336] = {
            description = "Lord Wishock, like all men, has his weaknesses. His happens to be a fondness " ..
                "for liquor. The hypocrisy is astounding. The trite fool spends his days trying to shut " ..
                "down our little \"tavern\" while his nights are spent upstairs, running up a bill he " ..
                "never pays. Well, let's see how Wishock likes this special brew I have prepared for him: " ..
                "Black Claw stout. It's got quite a kick, <name>.\n\nTake it to him and see how he likes " ..
                "it. Most likely the old fool is milling about the Hall of Petitioners.",
            rewardMoney = 2500,
        },
        [374] = {
            description = "Executor Zygand tells me you've been out killing Scarlet Crusaders. Tirisfal " ..
                "Glades is crawling with them.\n\nVarimathras, lieutenant to The Dark Lady, is seeing to " ..
                "it personally that the scum of Azeroth, the Human race, gets wiped into oblivion. Here " ..
                "in Tirisfal Glades we face a particularly annoying breed of humans: The Scarlet " ..
                "Crusade.\n\nVenture forth and wage an offensive on the Scarlet Crusade, <class>. Bring " ..
                "me back 10 Scarlet Insignia Rings as proof of your loyalty to Varimathras and The Dark " ..
                "Lady.",
            rewardChoices = {{3435, 1}, {3437, 1}, {12299, 1}},
            rewardMoney = 175,
        },
        [943] = {
            description = "Prospector Whelgar now holds the original fossil at his site in the Wetlands. " ..
                "When I discovered the Stone of Relu, I believed it to be the key to unlocking the " ..
                "mystery of the fossil.\n\nWhile I traveled on the road to meet Whelgar, I was attacked " ..
                "by raptors and the relic was lost. I don't know which one of the mottled beasts " ..
                "swallowed the relic but if you can retrieve it, I can unleash the power of these " ..
                "artifacts.\n\nBring me both the Stone of Relu, and the original fossil he holds.",
            rewardChoices = {{5627, 1}, {5626, 1}},
        },
        [4381] = {rewardItems = {{11562, 6}}},
        [4489] = {
            description = "You, <race>! Come here!\n\nYou're the one they call <name>, yes?\n\nI thought " ..
                "as much. I will keep this short: you're growing in power, and it has been acknowledged. " ..
                "And now, the time has come that you are rewarded for your efforts.\n\nGo to the Barrens. " ..
                "There, above Ratchet, you'll find Strahad Farsan --perhaps you remember him? He would " ..
                "have words with you. I wouldn't take long.",
            rewardXP = 315,
        },
        [4802] = {rewardItems = {{12451, 3}}},
        [4904] = {
            description = "Arnak thinks we're going to be married... but after I declined his offer he " ..
                "came back that night and kidnapped me. My brother tried to stop him, but Arnak was too " ..
                "strong. He... he slew my brother and then brought me here. My poor brother...\n\n<name>, " ..
                "could you escort me out of the Darkcloud Pinnacle? Please... I need to get back to " ..
                "Thalia! She must be worried sick about me.",
            rewardChoices = {{15469, 1}, {15468, 1}},
        },
        [6571] = {
            description = "We are in short supply of a few items at the Warsong lumber camp!\n\nPixel at " ..
                "Splintertree Post has our shipment of saw blades. It'll take a trip to Booty Bay to pick " ..
                "up a crate of axes from Wharfmaster Lozgil.\n\nOur shipment of oil and rope will be more " ..
                "difficult. The rope was pilfered by the Thistlefur and Foulweald furbolgs, and the " ..
                "satyrs intercepted the delivery of the oil and are now using it for detestable rituals " ..
                "in Night Run, Satyrnaar, and Xavian!\n\nCan you help me?",
            rewardChoices = {{16975, 1}, {16977, 1}, {16978, 1}},
        },
        [8737] = {
            description = "The Twilight's Hammer and the elemental nobles they worship present a " ..
                "formidable threat to our operations in Silithus. With the new enemies we're facing " ..
                "inside Ahn'Qiraj, we cannot afford to lower our guard to our enemies outside.\n\nFind a " ..
                "way to summon and destroy an Azure Templar and report to Bor Wildmane.",
            rewardItems = {{20801, 1}, {21133, 1}},
        },
        [9422] = {
            description = "For some time now, we have been tapping the crystal resources of the Silithus " ..
                "desert. The only dangers we faced were from the creatures that made this place their " ..
                "home and the oppressive sand and dust and heat.\n\nBut now the Alliance seems to have " ..
                "caught on to what we have found here. It is now a race between us to capture the natural " ..
                "resources, and keep them from the other.\n\nI need every set of hands that is available. " ..
                "I hope I have yours.",
            rewardChoices = {{13446, 2}, {13444, 2}},
        },
    },
    npcs = {},
    objects = {},
    items = {},
}
