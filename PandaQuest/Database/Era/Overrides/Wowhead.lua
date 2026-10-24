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
        [2] = {
            description = "The mighty hippogryph Sharptalon has been slain, with the claw of the felled " ..
                "beast serving as a testament to your victory. Senani Thunderheart at the Splintertree " ..
                "Post will no doubt be interested in seeing this trophy as proof of your deeds.",
        },
        [5] = {
            description = "I've been stuck hiding in this ghost town for weeks, and I haven't eaten " ..
                "anything but grubs and weeds! I need some decent food, and I'm willing to trade well for " ..
                "it.\n\nBring me a feast and I'll pay you handsomely.\n\nI heard Chef Grual at the " ..
                "Scarlet Raven Tavern in Darkshire makes very good Dusky Crab Cakes...",
        },
        [6] = {
            description = "Garrick Padfoot - a cutthroat who's plagued our farmers and merchants for " ..
                "weeks - was seen at a shack near the vineyards, which lies east of the Abbey and across " ..
                "the bridge. Bring me the villain's head, and earn his bounty!\n\nBut be wary, <name>. " ..
                "Garrick has gathered a gang of thugs around him. He will not be an easy man to reach.",
            rewardChoices = {{6076, 1}, {60, 1}, {3070, 1}},
        },
        [7] = {
            description = "Your first task is one of cleansing, <name>. A clan of kobolds have infested " ..
                "the woods to the north. Go there and fight the kobold vermin you find. Reduce their " ..
                "numbers so that we may one day drive them from Northshire.",
            rewardMoney = 25,
        },
        [8] = {
            description = "Hey, mate! Do a favor for a young man who's been fighting more than his fair " ..
                "share of mindless zombies and spiders?\n\nI got this here letter that needs to go to " ..
                "Brill... to an innkeeper named Renee something-or-other. Don't really matter none what " ..
                "her last name is.\n\nAnyway, it's a nice cozy little place full of victims of the plague " ..
                "trying to make their way in the world. And it be a great spot for you to rest too if the " ..
                "need arises. You should check it out... you do and I'll pay you well.",
            rewardChoices = {{4604, 5}, {159, 5}},
        },
        [9] = {
            description = "Look at what has happened to this place! These lands were once occupied by " ..
                "good farm folk. But the damned thieves have driven them all off. Not me, though! But it " ..
                "seems some Harvest Watchers have taken over the fields.\n\nIf you're up for the work, " ..
                "I'd like you to go out and kill twenty of them. Come back when you're done for your pay. " ..
                "If you finish up with the ones in my field, clear them from the neighboring fields as " ..
                "well.",
            rewardChoices = {{3578, 1}, {1561, 1}},
        },
        [10] = {
            description = "Oh, this is just terrible! I sent out my top assistant, Junior Surveyor " ..
                "Scrimshank, into the desert southeast of here. That's an area we call the Gaping Chasm. " ..
                "Well, he's gone missing, and his last report had more of those weird bugs where he was. " ..
                "Could it be that they've infested two major regions of the desert now?\n\nI need you to " ..
                "head into the Gaping Chasm and look for Scrimshank, please! That... or at least find his " ..
                "surveying equipment. I fear that may be all that is left of the poor sod.",
        },
        [11] = {
            description = "Gnolls, brutish creatures with no decent business in these lands, have been " ..
                "seen along the borders of Elwynn Forest. A large pack of them, many more than we can " ..
                "handle alone, have infested the woods south of the guard tower yonder. Another group has " ..
                "infested the areas near Stone Cairn Lake to the east.\n\nThe Stormwind Army will commend " ..
                "whomever helps kill them. Bring me their painted gnoll armbands as proof of your deed.",
            rewardChoices = {{2249, 1}, {2238, 1}},
        },
        [12] = {
            description = "The People's Militia has but one goal: To defend the lands of Westfall and " ..
                "return peace to our surroundings. Unfortunately, the price of peace is often " ..
                "blood.\n\nOne of my scouts has brought word of a band of Defias Trappers wreaking havoc " ..
                "nearby. I have reports of Defias Trapper sightings near the Jangolode Mine to the " ..
                "Northwest as well as at the Molsen Farm and Furlbrow's Pumpkin Farm. If you seek to join " ..
                "our ranks, slay 15 Defias Trappers and 15 Defias Smugglers then return to me.",
            rewardMoney = 500,
        },
        [13] = {
            description = "A band of vicious Defias Pillagers has been seen plundering the Gold Coast " ..
                "Quarry, Moonbrook and the Alexston Farmstead. The People's Militia will not stand for " ..
                "such behavior. Dispatch immediately, <name>, and make the Light's presence known in " ..
                "Westfall.\n\nThe Gold Coast Quarry is near the shore, to the West of the tower. As the " ..
                "next step of your training, I want you to kill 15 of those foul Defias Pillagers and 15 " ..
                "Defias Looters.",
            rewardMoney = 600,
        },
        [14] = {
            description = "Some Defias have eluded us. My most trusted scout reports that these Defias " ..
                "have been looting and pillaging the countryside, all the way into Southern Westfall. We " ..
                "believe they are hiding out in the Dagger Hills, plotting their next move. Slay the " ..
                "wretches in the name of The People's Militia.",
            rewardChoices = {{1566, 1}, {1480, 1}, {12296, 1}},
        },
        [15] = {
            description = "<name>, my scouts tell me that the kobold infestation is larger than we had " ..
                "thought. A group of kobold workers has camped near the Echo Ridge Mine to the " ..
                "north.\n\nGo to the mine and remove them. We know there are at least 10. Kill them, see " ..
                "if there are more, then report back to me.",
            rewardMoney = 40,
        },
        [16] = {rewardItems = {{4536, 1}}},
        [17] = {
            description = "I've heard about a newly discovered plant called the magenta fungus caps. They " ..
                "grow in clusters, deep in the Uldaman dig site; they may be elsewhere, but for now " ..
                "that's the only place I know they're at. I want to study their potential use in alchemy, " ..
                "and that's where you come in.\n\nFind the magenta cap clusters and bring me a dozen " ..
                "caps. Be warned, the clusters may spew out poison spores if jostled.\n\nDo this for me, " ..
                "and I'll whip up a batch of one of my famous restorative elixirs for you!",
            rewardItems = {{9030, 5}},
            rewardMoney = 5500,
        },
        [18] = {
            description = "Recently, a new group of thieves has been hanging around Northshire. They call " ..
                "themselves the Defias Brotherhood, and have been seen across the river to the east.\n\nI " ..
                "don't know what they're up to, but I'm sure it's not good! Bring me the bandanas they " ..
                "wear, and I'll reward you with a weapon.",
            rewardChoices = {{2224, 1}, {5580, 1}, {1161, 1}, {5579, 1}, {1159, 1}},
        },
        [19] = {
            description = "Blackrock Outrunners and Renegades are running ambushes between here and " ..
                "Stonewatch Keep. The leader of the Outrunners is an orc named Tharil'zun--we want this " ..
                "orc. Bring me the head of Tharil'zun!",
            rewardChoices = {{1276, 1}, {6093, 1}},
        },
        [20] = {
            description = "The Blackrock orcs have travelled from the Burning Steppes and claimed " ..
                "Stonewatch Keep to the north. From there they maraud the areas north of Lakeshire and " ..
                "keep its citizens in town, penned like cattle.\n\nHelp rid Lakeshire of this menace. " ..
                "Kill these Blackrock orcs and bring me ten of their Battleworn Axes as proof.\n\nAnd " ..
                "although Blackrocks threaten us from the north, we've received reports of more in the " ..
                "southeastern pocket of Redridge. If you find any there, then they too should be hunted.",
            rewardMoney = 1300,
        },
        [21] = {
            description = "Your previous investigations are proof that the Echo Ridge Mine needs purging. " ..
                "Return to the mine and help clear it of kobolds.\n\nWaste no time, <name>. The longer " ..
                "the kobolds are left unmolested in the mine, the deeper a foothold they gain in " ..
                "Northshire.",
            rewardChoices = {{2186, 1}, {2691, 1}, {11192, 1}},
        },
        [22] = {
            description = "The onions are peeled. The garlic is minced. The rosemary is crushed. The " ..
                "crust has been baked. The dill weed is chopped. The gravy is simmering. Now all I need " ..
                "for my famous meat pie are 8 Goretusk Livers!",
            rewardItems = {{724, 3}, {2697, 1}},
        },
        [23] = {
            description = "The paw of the mighty bear Ursangous is your trophy for this part of the " ..
                "Ashenvale Hunt. On the paw is a small quarter-crescent emblem; the significance of the " ..
                "emblem remains a mystery.\n\nThe paw should be brought to Senani Thunderheart in " ..
                "Splintertree Post to prove that you have bested the mighty creature and completed this " ..
                "portion of the hunt.",
        },
        [24] = {
            description = "The once swift Shadumbra now lies still as you claim victory over it. The head " ..
                "of the slain nightsaber is a fitting trophy for this fight of the Ashenvale Hunt. Senani " ..
                "Thunderheart at Splintertree Post will want to see such a trophy to award you credit for " ..
                "this part of the Ashenvale Hunt.",
        },
        [25] = {
            description = "If you want to be useful, then why don't you do something about the situation " ..
                "near Talondeep Path?\n\nThe transports between Ashenvale and Stonetalon are at a " ..
                "standstill because of the lake coming alive and attacking anything that gets close... " ..
                "which means anyone on the path. What'd be even more useful than just putting the hammer " ..
                "down on the water elementals there is someone scouting the gazebo on Mystral Lake - the " ..
                "one that has a solid view of the Alliance outpost there.\n\nYou up for being useful?",
            rewardMoney = 1800,
        },
        [26] = {
            description = "<name>, I have been following your progress with much delight. You are most " ..
                "assuredly developing yourself into a valued protector of nature.\n\nThe time has come " ..
                "for you to learn more about one of the various animal aspects that Cenarius has blessed " ..
                "us with the ability to change into - one that affords you command and mastery of the " ..
                "water. For this, you must travel to the village of Nighthaven in Moonglade and speak " ..
                "with Dendrite Starblaze of the Cenarion Circle there. He will guide you further.",
        },
        [27] = {
            description = "<name>, I have been following your progress with much delight. You are most " ..
                "assuredly developing yourself into a valued protector of nature.\n\nThe time has come " ..
                "for you to learn more about one of the various animal aspects that Cenarius has blessed " ..
                "us with the ability to change into - one that affords you command and mastery of the " ..
                "water. For this, you must travel to the village of Nighthaven in Moonglade and speak " ..
                "with Dendrite Starblaze of the Cenarion Circle there. He will guide you further.",
        },
        [28] = {
            description = "For your first trial, search the depths of Lake Elune'ara to locate a Shrine " ..
                "Bauble. It decays rapidly, so proceed with it to the Shrine of Remulos post haste. Use " ..
                "the bauble at the shrine, and then speak with Tajarri there; she is one of Moonglade's " ..
                "most trusted wardens.\n\nYou only have a set amount of time to complete the task, and " ..
                "you may be competing against other druids searching for baubles themselves. Mental and " ..
                "physical dexterity will be critical to your success.\n\nGood luck, <name>.",
        },
        [29] = {
            description = "For your first trial, search the depths of Lake Elune'ara to locate a Shrine " ..
                "Bauble. It decays rapidly, so proceed with it to the Shrine of Remulos post haste. Use " ..
                "the bauble at the shrine, and then speak with Tajarri there; she is one of Moonglade's " ..
                "most trusted wardens.\n\nYou only have a set amount of time to complete the task, and " ..
                "you may be competing against other druids searching for baubles themselves. Mental and " ..
                "physical dexterity will be critical to your success.\n\nGood luck, <name>.",
        },
        [30] = {
            description = "For the second trial, you'll need the two halves that make the Pendant of the " ..
                "Sea Lion. One half draws power from the agility of the sea lion aspect, gliding through " ..
                "water; the other draws power from the incredible endurance of the sea lion aspect. " ..
                "Druids draw on both these traits equally to embody the aspect of their aquatic " ..
                "form.\n\nSpeak with the locals of Moonglade to learn where the parts may lie, and bring " ..
                "both here to join them together. Once formed, take the pendant to Dendrite Starblaze.",
        },
        [31] = {
            description = "You have completed the necessary lessons all young druids are taught before " ..
                "they can adopt an aquatic aspect. Go now back to your trainer, Turak Runetotem, in " ..
                "Thunder Bluff. Show him your pendant and prove to him you are ready to learn what he has " ..
                "to teach you. He will complete your training, allowing you to become one with the " ..
                "water.\n\nGoodbye, young druid. We shall speak again.",
            rewardItems = {{16608, 1}},
        },
        [32] = {
            description = "Here's your report. I urge you to take it to someone who might have working " ..
                "knowledge in this kind of thing.\n\nI know this troll scholar named Zilzibin Drumlore. " ..
                "He's spent a lot of time studying life forms that are unique to the ecology of Azeroth; " ..
                "he's a historian to boot! If you want someone to help figure out what exactly this " ..
                "threat is and how to stop it, give this report to him. We're going to need all the help " ..
                "we can get.\n\nZil lives in a house on the second tier of the Drag in Orgrimmar.",
        },
        [33] = {
            description = "I hate those nasty timber wolves! But I sure like eating wolf steaks... Bring " ..
                "me tough wolf meat and I will exchange it for something you'll find useful.\n\ntough " ..
                "wolf meat is gathered from hunting the timber wolves and young wolves wandering the " ..
                "Northshire countryside.",
            rewardChoices = {{80, 1}, {6070, 1}},
        },
        [34] = {
            description = "Once again my garden was trampled and pillaged. And I know the brute who is " ..
                "doing it. It's that forsaken boar, the one Marshal Marris has taken to calling " ..
                "Bellygrub.\n\nI won't be able to re-plant the daffodils until next season now. Ruined! " ..
                "All ruined by that one menacing boar. Put an end to that pest! Show me his tusk and I'd " ..
                "be happy to reward you. He seems to spend his time foraging in the field southwest of " ..
                "Lakeshire but occasionally he roams over here and into my garden.",
            rewardItems = {{2562, 1}},
            rewardMoney = 1700,
        },
        [35] = {
            description = "If you are concerned that the rumors of murlocs are true, then do this -- " ..
                "travel to the eastern Elwynn bridge and speak with Guard Thomas. He has been stationed " ..
                "at the bridge for the past week and will know the state of the area.\n\nBring me his " ..
                "report.",
        },
        [36] = {
            description = "I never thought the day would come when I'd leave the farm. But the fields are " ..
                "overrun with thieves and it's far too dangerous for us here now. As soon as Farmer " ..
                "Furlbrow gets the wagon fixed, we'll be on our way.\n\nMaybe you could do me a favor? " ..
                "Let me scribble down my recipe for Westfall stew. Please take it to Salma Saldean over " ..
                "on the farm yonder. The Saldean's farm is just beyond the fork in the road.",
        },
        [37] = {
            description = "A few days ago we sent two Guards, Rolf and Malakai, to investigate along the " ..
                "river, and they have not yet returned. To complete my report, I must know what happened " ..
                "to those men.\n\nTravel north along the river and find the guards... or their remains.",
        },
        [38] = {
            description = "Help me make some Westfall Stew! Come back with the following " ..
                "ingredients:\n\n3 Stringy Vulture Meat 3 Goretusk Snouts 3 Murloc Eyes 3 Okra",
            rewardItems = {{733, 3}, {728, 1}, {1479, 1}, {2225, 1}},
        },
        [39] = {
            description = "Tell Marshal Dughan of Malakai and Rolf's deaths, and report to him that the " ..
                "Murlocs in eastern Elwynn cannot be contained by our current troop presence.\n\nI know " ..
                "we don't have many troops to spare, but hopefully Dughan can find someone.",
            rewardMoney = 700,
        },
        [40] = {
            description = "<name>, there's a new threat in Elwynn Forest! Murlocs are swimming up the " ..
                "streams of eastern Elwynn, scaring away fish and attacking gentle folk!\n\nI warned " ..
                "Marshal Dughan, but he's more worried about the gnolls and the bandits. He's not " ..
                "convinced that the murlocs are a danger.\n\nPlease, <name>, speak to Dughan and persuade " ..
                "him to send more troops to the east!",
        },
        [45] = {
            description = "Upon further searching the area, you find webbed footprints leading east along " ..
                "the shore of Stone Cairn Lake. In the distance to the east, you can just barely see a " ..
                "Murloc village.\n\nPerhaps Rolf's fate ended there...",
        },
        [46] = {
            description = "The Stormwind Army has placed a bounty on murloc lurkers and foragers in " ..
                "Elwynn. Slaughter them and bring me their torn murloc fins, and the Stormwind Army will " ..
                "reward you well.\n\nThe murlocs have built a village at Stone Cairn Lake north of here, " ..
                "and another to the south where the stream forks.",
            rewardChoices = {{4840, 1}, {1158, 1}, {1008, 1}},
        },
        [47] = {
            description = "The Kobolds in these parts sometimes carry Gold Dust on them. I could really " ..
                "use the stuff - bring me a load of it and I'll give you the best price in town...best " ..
                "price in town!\n\nYou can find kobolds in the Fargodeep Mine to the south, and around " ..
                "the Jasperlode Mine to the northeast.",
            rewardItems = {{1191, 1}},
            rewardMoney = 175,
        },
        [48] = {
            description = "In the land to the south where vines twist and creep Lies a hidden well where " ..
                "the water runs deep Pure as the Light's sacred Daughter Bring to me now some Holy Spring " ..
                "Water.",
            rewardMoney = 6500,
        },
        [49] = {
            description = "Amber is the hue of my life's longest love Like the last embers of dusk in the " ..
                "sky above Retrieve for me so that my love shall be born One sack of each: barley, rye " ..
                "and corn.",
            rewardMoney = 12500,
        },
        [50] = {
            description = "I'll mix and mix till we have a mash For this will be our own private stash A " ..
                "still must be fashioned of metal strong Bring me some Truesilver so I can finish this " ..
                "song.",
            rewardMoney = 12500,
        },
        [51] = {
            description = "Not yet filtered but freshly distilled Like unseeded land waiting there " ..
                "tilled. Next I will fashion our pile of charcoal Deliver a sycamore branch, that is your " ..
                "next goal.",
            rewardMoney = 12500,
        },
        [52] = {
            description = "Hail, <name>. Wild animals are growing more and more aggressive the farther we " ..
                "get from Goldshire, and the Eastvale Logging Camp suffers nearly constant attacks from " ..
                "wolves and bears!\n\nWe could use your help out here.",
            rewardItems = {{858, 2}},
            rewardMoney = 250,
        },
        [53] = {
            description = "Mellifluous liquid clear as a baby's tears Turns a lovely deep amber over the " ..
                "years But before we proceed to get lit to the hilt A barrel of charred oak must be built.",
            rewardItems = {{744, 1}},
        },
        [54] = {
            description = "<name>, you are a <class> with proven interest in the security of Northshire. " ..
                "You are now tasked with the protection of the surrounding Elwynn Forest.\n\nIf you " ..
                "accept this duty, then I have prepared papers that must be delivered to Marshal Dughan " ..
                "in Goldshire. Goldshire lies along the southern road, past the border gates.",
            rewardItems = {{6078, 1}},
        },
        [55] = {
            description = "Morbent Fel hides in his lair, the house perched atop the hill to the east " ..
                "overlooking the Raven Hill cemetery. His time in this land is drawing to an " ..
                "end...\n\nUse Morbent's Bane against him. It will render his protective magics " ..
                "powerless.\n\nSlay him. Slay him, and save us from his wickedness. Be the instrument of " ..
                "my revenge, and a hero of Duskwood!",
            rewardChoices = {{2954, 1}, {2953, 1}, {1282, 1}},
            rewardItems = {{7344, 1}},
        },
        [56] = {
            description = "As Commander of The Night Watch it is my sworn duty to protect the citizens of " ..
                "Darkshire. Stormwind has retracted their commissioned guards from their posts here, " ..
                "leaving us to our own devices.\n\nIf you feel worthy of the task, we need your help! " ..
                "Assist The Night Watch by venturing forth into Tranquil Gardens, just south of " ..
                "Darkshire, and slaying 8 Skeletal Warriors and 6 Skeletal Mages. The undead threat must " ..
                "be thwarted!",
            rewardMoney = 1700,
        },
        [57] = {
            description = "<name>, I'm getting reports of an undead infestation in the forest! If you're " ..
                "up to the job, journey to the Raven Hill graveyard and slay 15 of those vile Skeletal " ..
                "Fiends and 15 Skeletal Horrors. There are also reports of skeletons just south of " ..
                "Darkshire, in and around Tranquil Gardens Cemetery. The undead must be driven from " ..
                "Duskwood!",
            rewardMoney = 2000,
        },
        [58] = {
            description = "The situation in Raven Hill is still grim. The safety of Darkshire is in your " ..
                "hands, <name>. I don't have enough Watchers to keep the town safe. We need you to " ..
                "dispatch for Raven Hill yet again and rid the eastern mausoleum of 20 Plague Spreaders!",
            rewardChoices = {{3604, 1}, {3605, 1}, {1729, 1}},
            rewardMoney = 2500,
        },
        [59] = {
            description = "For your shrewdness and valor, I have a marker here that is good for one piece " ..
                "of armor. I want you to take it to Sara Timberlain at the Eastvale Logging Camp. Give " ..
                "her the marker, and she will fashion the armor for you. And after you receive it, " ..
                "<name>, use it in the defense of Elwynn.\n\nThe Eastvale Logging Camp is beyond Guard " ..
                "Thomas' post to the east.",
            rewardChoices = {{1171, 1}, {2237, 1}},
        },
        [60] = {
            description = "Hello, <good sir/my lady>! Do you have a moment?\n\nMy brother and I run an " ..
                "apothecary in Stormwind, and I'm here to gather large candles for their wax. Can you " ..
                "help me?\n\nYou can get large candles from kobolds, and I hear rumors that kobolds are " ..
                "infesting the Elwynn mines... the Fargodeep mine to the south and Jasperlode Mine to the " ..
                "east. I suggest looking for candles in one of those places.",
            rewardItems = {{1434, 5}},
            rewardMoney = 125,
        },
        [61] = {
            description = "My brother Morgan is waiting in Stormwind for my shipment of candles. I don't " ..
                "have enough time to make the trip myself, but if you'd like to take him the shipment, " ..
                "he'll pay you well.\n\nI've packed up the candles, and you can find Morgan in our shop, " ..
                "Pestle's Apothecary, in the Stormwind Trade District.",
            rewardChoices = {{1178, 15}, {1177, 5}, {2454, 2}},
            rewardMoney = 350,
        },
        [62] = {
            description = "The mine in Northshire isn't the only one with problems! I have reports that " ..
                "the Fargodeep Mine in Elwynn has also become a haven for Kobolds.\n\nExplore the mine " ..
                "and confirm these reports, then return to me. The mine is almost due south of Goldshire, " ..
                "between the Stonefield and Maclure homesteads.",
            rewardMoney = 125,
        },
        [63] = {
            description = "Along the coast of Silverpine, west of the Sepulcher, you will find a shrine " ..
                "that has become tainted by the plague. The spirits there no longer speak to our people " ..
                "and it will be up to you to defeat the manifestation and cleanse the pool.\n\nTake the " ..
                "elemental's bracers, along with the remaining drops of Brine's potion, and place them on " ..
                "the brazier. The ritual should be enough to summon a pure spirit for you to communicate " ..
                "with.\n\nBring me proof the task is done, and I will reward you with your totem.",
        },
        [64] = {
            description = "It was horrible! Verna woke me when she heard a ruckus in the fields. The " ..
                "fields were full of hooligans. We left in a rush and I forgot to pack my pocket watch. " ..
                "Verna's pa gave me that watch on our wedding day and I feel just sick knowing those " ..
                "thieves have it. I left the pocket watch in the wardrobe at the farmhouse. Look for the " ..
                "field of pumpkins to the West -- you can't miss it. If you bring it back to me, I'd sure " ..
                "be grateful!",
            rewardItems = {{4541, 10}, {1179, 10}},
        },
        [65] = {
            description = "The band of wretches responsible for driving the good people of Westfall from " ..
                "the land call themselves The Defias Brotherhood. I need you to infiltrate this clan of " ..
                "thugs. We need to know who heads up the cartel and where they are hiding out. In " ..
                "Lakeshire, in the inn, there is a rogue by the name of Wiley who owes me a " ..
                "favor.\n\nTravel to Lakeshire in the Redridge Mountains, east of Elwynn, and find out " ..
                "what you can.",
        },
        [66] = {
            description = "Last night a horrible disturbance rippled through my veins. I sensed that my " ..
                "granddaughter, Alyssa, was in great danger. I consulted the cards and Death stared up at " ..
                "me from the table.\n\nAfter taking a long journey through a dark trance I was able to " ..
                "uncover a clue to this terrifying mystery. A name came to me, the name of " ..
                "Stalvan.\n\nSeek out the Clerk in the Town Hall and see if you can find out more about " ..
                "this character. I fear for us all.",
        },
        [67] = {
            description = "Stalvan, eh? Let me check the town registry.\n\nStalvan...Stalvan...let's see. " ..
                "Ah, here we go! I have a record of a Mr. Stalvan Mistmantle. The last recorded address " ..
                "is the Moonbrook Schoolhouse. My, talk about outdated!\n\nDo me a favor will you, " ..
                "friend? If you happen to go out to Moonbrook, let me know if you get any update on this " ..
                "fellow. I like to keep the records clean.",
        },
        [68] = {description = "You find a Dusty Unsent Letter in the old footlocker."},
        [69] = {
            description = "Oh my! Must have missed this the first time. In the registry, right beneath " ..
                "the first address for Stalvan there's another one listed, only partially scratched out. " ..
                "Looks like he was headed to The Lion's Pride Inn over in Goldshire. Might want to check " ..
                "there, <name>.",
        },
        [70] = {
            description = "The name Stalvan rings a bell. I remember now.\n\nMany years back, on a stormy " ..
                "night, a messenger came in, seeking refuge for the night. Near the stroke of midnight, " ..
                "the man ran down the stairs screaming, his face pale with fear. Still wearing his " ..
                "bedclothes, he disappeared into the downpour.\n\nIn his haste he forgot his letters in " ..
                "the chest upstairs. He never returned for them. One remains from that Stalvan fellow, " ..
                "intended for the Canal District in Stormwind. Help yourself to it.",
        },
        [71] = {
            description = "Now that you have both medallions, deliver them to Guard Thomas at the bridge " ..
                "so that he might know the fate of his murdered guards.",
        },
        [72] = {
            description = "My father was the caretaker of the estate long before I was. He had to mop the " ..
                "blood up after the massacre. But that's neither here nor there.\n\nThe last funds of the " ..
                "Flintridge trust have dried up. Now the last of the family possessions are headed for " ..
                "auction. Blame the tax vultures. I guess if you're really itching to learn more you're " ..
                "free to look through this junk. Who knows what you might find.",
        },
        [74] = {
            description = "Inside the crate you find various objects: musty heirlooms, a family portrait, " ..
                "a few hunting trophies and some old books. Near the bottom, underneath a ceramic vase, " ..
                "you uncover A Torn Journal Page.",
        },
        [75] = {
            description = "There was a bundle of parchments in the chest upstairs when I moved into this " ..
                "place. I looked at them once when I first arrived but I gave up once the fog hazed over " ..
                "my peepers.\n\nDo an old, nearly-blind man a favor and check the chest upstairs for " ..
                "anything that might help you in your quest to discover more about this Stalvan " ..
                "character. I'm pretty sure there's a faded journal page that might be of interest to " ..
                "you. Bring it to me and I'll help in anyway I can.",
        },
        [76] = {
            description = "Thanks to you we know the Fargodeep Mine is infested with kobolds. Now we need " ..
                "a scout to investigate the more distant Jasperlode Mine.\n\nExplore Jasperlode and " ..
                "confirm any kobold presence. To reach the mine, travel east along the road until you " ..
                "reach the Tower of Azora. From the tower, head north and you'll find the mine in the " ..
                "foothills.",
            rewardMoney = 350,
        },
        [77] = {
            description = "I possess original packaging materials for the ripple Dran Droffers seeks. I " ..
                "will assist you in packaging the ripple for Malton's abrasive father... for a fee of two " ..
                "additional bottles of said ripple. They are located in crates found in the abandoned " ..
                "Horde base near Skulk Rock.\n\nIt will be an arduous task, to wit; foul slimes and oozes " ..
                "will be found sticking to the ruins; rumor has it they are led by some sort of master " ..
                "ooze. Regardless, procure the ripple and return to me here for packaging.",
        },
        [78] = {
            description = "I know of someone who might be able to assist you. Back when I was leading the " ..
                "Stormwind Guard, we used to get drinks at the Scarlet Raven Tavern in Darkshire. The " ..
                "Innkeeper there, Smitts, was quite an expert on the local lore. Show him this page and " ..
                "see what he has to say about it.",
        },
        [79] = {
            description = "I followed the legend of that Stalvan character for years. When those visiting " ..
                "nobles were slaughtered a few years back I went with Haggard to investigate. I found " ..
                "these muddy pages but we were never able to link the handwriting to that crazy man in " ..
                "the woods. Your trail of evidence proves his guilt. Take this to Commander Ebonlocke " ..
                "immediately and fill her in on what you've discovered!",
            rewardItems = {{939, 1}},
        },
        [80] = {
            description = "I have had my eye on that creep, Stalvan, for quite sometime. But if this page " ..
                "was written by the same hand it proves his guilt beyond a shadow of a doubt.\n\nIn all " ..
                "his days keeping the Town Registry, Clerk Daltry has become an expert at identifying " ..
                "handwriting. Show him this page and see if the writing matches that of the registry " ..
                "signature.",
        },
        [105] = {
            description = "Alas, the time to attack Andorhal and drive out the lich that controls it is " ..
                "upon us!\n\nInside the ruins of the city is where the lich - Araj the Summoner - holds " ..
                "dominion. He is guarded by numerous Scourge surrounding the remains of city's center, " ..
                "and his personal retinue of guardians attached to him directly is formidable. You will " ..
                "need numerous allies to even stand a chance of facing him successfully.\n\nDestroy Araj, " ..
                "<name>, and bring me a shard from his phylactery as proof!",
            rewardItems = {{17759, 1}},
        },
        [211] = {
            description = "Alas, the time to attack Andorhal and drive out the lich that controls it is " ..
                "upon us!\n\nInside the ruins of the city is where the lich - Araj the Summoner - holds " ..
                "dominion. He is guarded by numerous Scourge surrounding the remains of city's center, " ..
                "and his personal retinue of guardians attached to him directly is formidable. You will " ..
                "need numerous allies to even stand a chance of facing him successfully.\n\nDestroy Araj, " ..
                "<name>, and bring me a shard from his phylactery as proof!",
            rewardItems = {{17759, 1}},
        },
        [969] = {
            description = "Ah, I can tell just by lookin' at ya -- you be wantin' to make a lucky charm. " ..
                "Mau'ari always knows!\n\nTo da south. you'll find a canyon, an' giants made a' solid " ..
                "ice. The giants sometimes be carryin' dem, but ya can always gather da shards yerself " ..
                "from da canyon. These shards have a powerful reflective quality.\n\nBring back 10 " ..
                "frostmaul shards, and my lucky charm will be yours.",
            rewardMoney = 9000,
        },
        [975] = {
            description = "Now, before I give ya dis charm, I better explain how ta use it.\n\nIf you " ..
                "carry da charm with ya, you'll find dat certain items will drop from creatures ya fight. " ..
                "If you don't have da charm with you, you won't find them. Understand?\n\nYou'll know " ..
                "these special items by the name -- they be called E'ko. If you find any of these items, " ..
                "just bring dem to ol' Mau'ari, and she help ya out.\n\nWait here while I fix your charm.",
            rewardItems = {{12384, 1}},
        },
        [1036] = {
            description = "<name>... yeah, I've heard of you. I've heard that you're no friend of Booty " ..
                "Bay - just like us Bloodsail Buccaneers. Fleet Master Firallon is looking for hale and " ..
                "hearty <men/women> just like you for a special mission.\n\nIf you're interested, head on " ..
                "out to the Crimson Veil and speak with him below decks. She's anchored off the Wild " ..
                "Coast east of here, next to the Riptide and the Damsel's Luck.",
        },
        [2741] = {rewardItems = {{8647, 1}}},
        [2743] = {
            description = "Let us not mince words, <race>; my time here is limited.\n\nYou must destroy " ..
                "the triad of power which protects the demon lord, Razelikh. Doing so will not be as " ..
                "simple a task as freeing a damned soul.\n\n<Kirith grins.>\n\nYou see, each of " ..
                "Razelikh's underlings wears a third of an amulet of Razelikh's creation around their " ..
                "neck. The very same amulet you will need in order to summon the arch demon.\n\nReturn to " ..
                "Trebor and tell him what is required to summon Razelikh. He will be able to instruct you " ..
                "further.",
        },
        [2744] = {
            description = "The triad is protected by Razelikh.\n\nIn exchange for their servitude, " ..
                "Razelikh granted each of them nearly unlimited power within the Blasted Lands. The " ..
                "amulet pieces are each attuned to the lifeforce of their owner, granting them " ..
                "immortality. As long as they remain within the Blasted Lands, they cannot be slain, " ..
                "their life spans extended until the end of days.\n\nThere is one who may be able to " ..
                "assist you further, <name>. Travel to Azshara and find the demon hunter, Loramus " ..
                "Thalipedes. Search the islands.",
        },
        [2747] = {rewardItems = {{9541, 1}}},
        [2748] = {rewardItems = {{9540, 1}}},
        [2749] = {rewardItems = {{9539, 1}}},
        [3627] = {
            description = "To reach the Defiler, you must first destroy the triad of power and recover " ..
                "the amulet pieces. When you recover all three pieces, return to me and I shall give you " ..
                "further instruction.\n\nGo <name>! To the Blasted Lands! Sevine, Allistarj, and Grol " ..
                "must fall!",
        },
        [3628] = {
            description = "Razelikh's lair is atop the highest mountain in the Blasted Lands. The only " ..
                "way to the lair is through the use of the teleport runes near the mountain. As long as " ..
                "you hold the amulet, you can freely transport up to the lair. Once you reach the lair, " ..
                "you must conjure the beast. The amulet is your key, <name>. Use it on the Altar of the " ..
                "Defiler.\n\nShould you defeat the Defiler, bring back his horn. It will become a symbol " ..
                "of hope for all that view it - proof that heroes do exist in this war torn world.",
            rewardItems = {{10778, 1}, {10779, 1}, {10959, 1}},
            rewardMoney = 27000,
        },
        [4004] = {
            description = "You have slain my husband, <race>! My child will be born into this world " ..
                "without a father.\n\n<Princess Moira points directly at you.>\n\nI assure you, this " ..
                "child will be the next ruler of the kingdom of Ironforge. You and your kind shall be " ..
                "hunted down until the end of days for this wrongful act.\n\n<You think that Princess " ..
                "Moira may be suffering from the residual effect of Thaurissan's spell.>\n\nLeave me be, " ..
                "<race>. I am certain your warchief will be eager to hear the results of his meddling.",
            rewardChoices = {{12544, 1}, {12545, 1}},
            rewardMoney = 27000,
        },
        [4621] = {
            description = "Listen close, sea dawg... the powers of Booty Bay is what keeps us Bloodsail " ..
                "from sailing wheres we like and taking whats we want as rights o' plunder. Were ye to " ..
                "put a knife to Fleet Master Seahorn, we'd ne'er run afoul of a Booty Bay 's vessel. Were " ..
                "ye to put a knife to Baron Revilgaz, we'd ne'er face the law on their terms.\n\nIf ye " ..
                "are to be an honorary admiral amongst us - yes, ADMIRAL, you'll puts a knife to both of " ..
                "'em as I've says. Go now <lad/lass>, and return to me once ye does the deeds.",
            rewardItems = {{12185, 1}},
        },
        [4734] = {
            description = "<name>, I've been working hard on a new device, the eggscilloscope! It's " ..
                "designed to project a burst of cold energy at the egg of a black dragon... and freeze it " ..
                "solid! Can you test it for me?\n\nI heard that high up in Blackrock Spire, the dragons " ..
                "have a rookery where they hatch their eggs. That's where you'll have to go to test the " ..
                "eggscilloscope, and then let me know how it worked!\n\nAnd don't worry. Frozen dragon " ..
                "eggs should be harmless. It's the unfrozen ones you have to worry about!",
            rewardItems = {{12144, 1}},
            rewardMoney = 18000,
        },
        [4735] = {
            description = "<name>, I'm finally ready for real samples of dragon eggs! Here, take this " ..
                "collectronic module. It's designed to extract a dragon egg and prepare it for transport. " ..
                "Go back to the Rookery and use the module to collect eggs.\n\nAnd don't forget to freeze " ..
                "them first, or they might hatch before you can collect them!\n\nWhen you have enough " ..
                "eggs, bring them to me!",
            rewardMoney = 27000,
        },
        [4742] = {
            description = "As you can see, the unadorned seal has three empty sockets. Each of those " ..
                "sockets must be filled with a gemstone representing the leadership's command. Finally, " ..
                "Overlord Wyrmthalak, master of the lower citadel, must forge the seal in the flames of " ..
                "the Black Dragonflight.\n\nUnderstand this, mortal: the chance that one of the three " ..
                "generals of the lower citadel would carry a gemstone at any given time is rare. You must " ..
                "be vigilant in your quest. Remain determined!",
        },
        [4743] = {
            description = "Few of the black dragonkin, outside of those in the upper citadel, have the " ..
                "ability to forge the seal with their own flaming breath. Wyrmthalak is one such " ..
                "dragonkin, but his will is unbreakable.\n\nYou must travel to the Wyrmbog in Dustwallow " ..
                "Marsh. It is there that you will find an ancient drake known as Emberstrife. You must " ..
                "break his will, <name>. Break it and use this orb on his weakened form. You will have " ..
                "scant seconds to control his mind and fan the flames that will forge the seal.",
            rewardItems = {{12344, 1}},
        },
        [4764] = {
            description = "There is a chamber, high in Blackrock Spire, that was once called the Hall of " ..
                "Fortune. It was where the Dark Iron dwarves kept their relics, trophies and objects of " ..
                "art.\n\nThat was long ago. It is said the hall has collapsed and is now used for... less " ..
                "savory tasks. But I believe some old dwarven relics may still be found there.\n\nOne " ..
                "such relic is Doomrigger's clasp, with a surface so encrusted with rare gems that it was " ..
                "said to make weep any dwarf who gazes upon it.\n\nThat clasp, <name>, is your goal.",
        },
        [4765] = {
            description = "I have packaged Doomriggers Clasp into a crate, suitable for shipment to " ..
                "Stormwind. <name>, you have been extremely helpful -- can I ask you for one last " ..
                "favor?\n\nDeliver the crate to Count Remington Ridgewell. You will find him in the Keep " ..
                "of Stormwind. I am sure he'll be very pleased to see what you have for him.",
            rewardChoices = {{15861, 1}, {15860, 1}},
            rewardMoney = 27000,
        },
        [4766] = {
            description = "An agent of mine, Mayara Brightwing, was sent to the Burning Steppes to scout " ..
                "the ruined city of Thaurissan. That destroyed city of the Dark Iron dwarves may hide " ..
                "objects of great value... objects that would fit nicely into our family " ..
                "museum.\n\nMayara says she found something and will need aid in retrieving it, but it is " ..
                "not in Thaurissan. Instead, a foray into Blackrock Spire will be required.\n\nI do not " ..
                "know the details, but if interested then speak with Mayara in the Burning Steppes.",
        },
        [4768] = {
            description = "The Darkstone Tablet holds the writings of the long-dead dwarf Urheld " ..
                "Darkstone. An alchemist of great skill, he was thought insane by his contemporaries and, " ..
                "hence, did not share his research.\n\nBut he did etch it onto tablets, and I believe one " ..
                "such tablet lies in Blackrock Spire, in a chamber once named the Hall of Fortune. I know " ..
                "not what it is now called, for few enter Blackrock and return.\n\nBut if you are willing " ..
                "to brave its dangers and return to me with the tablet, your reward will be great.",
            rewardChoices = {{15861, 1}, {15860, 1}},
            rewardMoney = 27000,
        },
        [4769] = {
            description = "Vivian Lagrave sent me word from Kargath, in the Badlands. Through her " ..
                "studies, she believes there is an ancient text within Blackrock Spire that would benefit " ..
                "our research. To confirm this, she will need someone to extract the text from the spire. " ..
                "No easy task.\n\nIf interested, then speak with Vivian in Kargath.",
        },
        [4771] = {
            description = "I've placed Dawn's Gambit in the container you brought to us, the one that " ..
                "held the dragon eggs. Your job is to bring it deep within the Scholomance.\n\nThe undead " ..
                "mage Vectus leads a team of scourge scholars... place Dawn's Gambit in their chamber, " ..
                "called the \"viewing room.\" It will then react with the undead found there and, with a " ..
                "little luck, destroy them!\n\nAfter that, defeating Vectus shouldn't be a problem. Right?",
            rewardChoices = {{15853, 1}, {15854, 1}},
            rewardMoney = 27000,
        },
        [4801] = {rewardItems = {{12450, 3}}},
        [4802] = {rewardItems = {{12451, 3}}},
        [4803] = {rewardItems = {{12455, 3}}},
        [4804] = {rewardItems = {{12457, 3}}},
        [4805] = {rewardItems = {{12459, 3}}},
        [4806] = {rewardItems = {{12460, 3}}},
        [4807] = {rewardItems = {{12458, 3}}},
        [4866] = {
            description = "It's probably one of the most potent poisons in the world, <race>!\n\nI've " ..
                "overheard the Blackrock speaking about its lethality in my jaunts into the Spire. They " ..
                "call it 'Mother's Milk', named after Mother Smolderweb, the big nasty spider in the " ..
                "Skitterweb cave.\n\nNow here's what I need from you: A live sample of the Milk, flowing " ..
                "through YOUR veins. Just bringing me the gland won't be enough! Get her to poison you " ..
                "and come back to me!\n\nThen... I get to milk ya!\n\n<Rubs his hands together in " ..
                "anticipation.>",
            rewardItems = {{15873, 1}},
            rewardMoney = 18000,
        },
        [4867] = {
            description = "Argh! So hard to speak!\n\nTake this note! Get me my mojo!",
            rewardItems = {{15867, 1}},
        },
        [4903] = {
            description = "By order of Warlord Goretooth, the following inhabitants of Blackrock Spire " ..
                "must be destroyed:\n\nThe rotund menace, Highlord Omokk.\n\nThe cruel and ruthless " ..
                "troll, War Master Voone.\n\nOverlord Wyrmthalak, taskmaster of the lesser city.\n\nYou " ..
                "will also be required to return any important documents that you may find.\n\nSucceed " ..
                "and be honored.\n\nFail and be forgotten.",
            rewardChoices = {{13958, 1}, {13959, 1}, {13961, 1}, {13962, 1}, {13963, 1}},
            rewardMoney = 18000,
        },
        [4907] = {
            description = "Hi, <name>. Remember Tinkee Steamboil? Well, she remembers you! She sent me a " ..
                "message to keep an eye out for you, because... she needs your help again. I think it has " ..
                "something to do with her studies on dragons.\n\nYou should speak to her in the Burning " ..
                "Steppes, at the Flame Crest.",
        },
        [4941] = {
            description = "Rend lives?\n\nImpossible!\n\nIt had been thought that Rend was slain decades " ..
                "ago.\n\nSeek out the wisdom of Eitrigg, <name>. None know the workings of the Blackrock " ..
                "better than he and if what is written here bares truth, Eitrigg should be informed. No " ..
                "person should be denied the right of vengeance.\n\nYou will find him in " ..
                "Orgrimmar.\n\nOnce you have spoken with Eitrigg, confer with the Warchief to find out " ..
                "what he wishes to do about this problem.",
        },
        [4970] = {
            description = "If you wish to prove yourself, you may begin by doing a very simple, but very " ..
                "important task.\n\nGather meat from the chimaera and from the shardtooth bears in the " ..
                "area. Bring it to me so that I may use it to feed the frostsabers that are being trained.",
        },
        [4974] = {
            description = "Rend dares make such grand claims because of the protection he is afforded by " ..
                "the black flight.\n\nYou, <name>, will find a way to pass through the Halls of " ..
                "Ascension. You will then find 'Warchief' Rend Blackhand and you will destroy him - FOR " ..
                "THE HORDE!\n\n< Thrall slams a fist down upon his throne.>\n\nThe next time you return " ..
                "to my chambers, you will hold his head high in triumph and then you shall present it to " ..
                "your Warchief. Do this and be honored as a hero of the Horde.",
            rewardChoices = {{13966, 1}, {13968, 1}, {13965, 1}},
            rewardMoney = 27000,
        },
        [5047] = {
            description = "You'll find Malyfous Darkhammer in Everlook, <class>. Tell him that 'Pip is " ..
                "A-OK' and that the suit works perfectly.\n\nThen hand him this:\n\n<Pip hands you a " ..
                "glowing piece of flesh.>\n\nI snatched it from the beast's innards during my " ..
                "'vacation.'\n\nI bet Malyfous could give you a fairly accurate assessment of what he can " ..
                "do with parts from a monster like this!\n\nOh, I suppose you don't know where Everlook " ..
                "is, do you? To Winterspring, <fella/lady>!",
        },
        [5056] = {
            description = "In northern Winterspring, great cats assemble around a large landmark called " ..
                "Frostsaber Rock. The leader of these cats is known by the name Shy-Rotam. Defeating the " ..
                "matriarch of the frostsabers would grant you much respect in the eyes of your fellow " ..
                "<race>.\n\nGo again to the harsh wilds, and once there, gather sacred meat from the " ..
                "frostsabers. Find the stone of Shy-Rotam, and place it there. Placing the meat of her " ..
                "kin before her will summon Shy-Rotam, in anger.\n\nBe ready for her fury, and defeat her.",
            rewardChoices = {{15783, 1}, {15782, 1}},
        },
        [5057] = {
            description = "Before you spoke to me, <name>, I had heard of your endeavors... that you had " ..
                "an unyielding desire to prove yourself, that you had an exceptional ability as a " ..
                "<class>, and I now know these things to be the truth.\n\nThose that excel as you do are " ..
                "worthy of recognition. Take this marker to a friend of mine in Thunder Bluff named Melor " ..
                "Stonehoof. I'm sure he will remember you, and what you accomplished so long ago. Speak " ..
                "to him of you recent victories, and do not ever forget what you have accomplished today.",
            objectivesText = {"Bring Storm Shadowhoof 's Marker to Melor Stonehoof in Thunder Bluff."},
            rewardItems = {{15704, 1}},
        },
        [5063] = {
            description = "A finer cap you may never see. From the pristine hide of the beast, our expert " ..
                "crafters will create the most phenomenal hat a prestidigitator could ever hope to " ..
                "don!\n\nFifty gold pieces along with the listed items and your head shall be graced with " ..
                "the Cap of the Scarlet Savant:\n\n*The pristine hide of the beast.\n\n* Frayed " ..
                "abomination stitchings.\n\n* Arcane crystals.\n\n* Enchanted scarlet thread.\n\nBEHOLD!",
            rewardItems = {{12752, 1}},
        },
        [5067] = {
            description = "While the crafting of such an item has never successfully been accomplished, " ..
                "it is thought to be possible - under the right circumstance.\n\nShould the seeker of " ..
                "arcanum desire to imbue leggings with immense power, the following they must find:\n\n* " ..
                "The pristine hide of the Beast.\n\n* Frayed abomination stitchings.\n\n* Arcanite " ..
                "Bars.\n\n* Frostwhisper's embalming fluid.\n\nBEHOLD!",
            rewardItems = {{12756, 1}},
        },
        [5068] = {
            description = "It is said that only one Breastplate of Bloodthirst has ever been created and " ..
                "that it was made for the legendary assassin, Garona. Whether this world will ever see " ..
                "another is doubtful.\n\nRegardless! Our master crafters can reproduce the item given the " ..
                "necessary components:\n\n*The pristine hide of the Beast.\n\n* Frayed abomination " ..
                "stitchings.\n\n* Arcanite bars.\n\n*The skin of shadow.\n\nBEHOLD!",
            rewardItems = {{12757, 1}},
        },
        [5081] = {
            description = "This information fills in the gaps to our otherwise impeccable intelligence of " ..
                "Blackrock Spire.\n\nThe attack must be decisive, <name>.\n\nFirst their war master, the " ..
                "troll Voone, must be destroyed. Without his battle plans, the Blackrock orcs will be " ..
                "thrown into chaos.\n\nYou must then take out the ogre Highlord, Omokk. The cowardly " ..
                "ogres of Blackrock are powerless without his leadership.\n\nLastly, the overlord of the " ..
                "citadel: Wyrmthalak. With Wyrmthalak dead, their central command unit is without a " ..
                "conduit.",
            rewardChoices = {{13958, 1}, {13959, 1}, {13961, 1}, {13962, 1}, {13963, 1}},
            rewardMoney = 18000,
        },
        [5089] = {
            description = "From the corpse of the defeated serpent you uncover what appears to be a note " ..
                "of some importance: A letter from his superior, General Drakkisath, concerning " ..
                "protocol.\n\nYour instinct tells you that you should take it to Marshal Maxwell.",
        },
        [5102] = {
            description = "We battle against these beasts on two fronts: From our capital of Stormwind we " ..
                "fight them from the inside out and here, in the Burning Steppes, we take the battle to " ..
                "their doorstep. We must be vigilant, <name>. None should be spared our wrath as none of " ..
                "our own were spared when they struck at our homes and families.\n\nFind this General " ..
                "Drakkisath and destroy him!\n\nThe task certainly will not be a simple one, but the " ..
                "rewards shall be extravagant.",
            rewardChoices = {{13966, 1}, {13968, 1}, {13965, 1}},
            rewardMoney = 27000,
        },
        [5103] = {
            description = "The only thing that remains of this human are some charred bones. He seems to " ..
                "have died within arms reach of what he was after - unfired plate gauntlets.\n\nPerhaps " ..
                "you should grab the gauntlets and get out of the fire?",
        },
        [5124] = {
            description = "By Thaurissan's beard!\n\nWhere did you find them?\n\nMore importantly, are " ..
                "you willing to part with them? Naturally, I would pay you for such a noble " ..
                "gesture.\n\nI'll tell you what, <name>. If you give me those unfired gauntlets, I will " ..
                "teach you how to make a set all your own. All you need to do is collect the parts for me " ..
                "so that I may narrow down the exact recipe.\n\nDo we have a deal??\n\nHere's the list of " ..
                "what I need, I'll front the non-enchanted thorium myself since you're supplying the " ..
                "gauntlets.",
            rewardItems = {{12699, 1}, {12631, 1}},
        },
        [5126] = {description = "The Satyr paces about and talks to himself. Do you wish to question him?"},
        [5127] = {
            description = "Lorax makes deals, he does not accept them from insignificant mortals.\n\nA " ..
                "deal I shall make with you, however... take this pike, it is imbued with powerful Fel " ..
                "energies. When you find Goraluk Anvilcrack, slay him and drive this pike through his " ..
                "dying heart. His soul he bartered, his soul I shall have. Return the pike and return the " ..
                "breastplate that the thief stole and I shall teach you what it is that he was to learn.",
            rewardItems = {{12696, 1}, {9224, 5}, {12849, 1}},
        },
        [5160] = {
            description = "Travel to Kalimdor, <race>. Our flight makes its home in the frigid landscape " ..
                "of Winterspring. Once you reach Winterspring, find the caves of Mazthoril.\n\nUpon the " ..
                "icy floors of Mazthoril you will find cobalt runes. Hold one of my scales and stand upon " ..
                "a rune and you shall be transported to Haleh, our matron protectorate.\n\nGive her the " ..
                "scale so that she may scry what it is I have seen and felt, here in this doomed place.",
        },
        [5161] = {
            description = "We understand what the cursed brood of Deathwing attempts to do and we know " ..
                "that it cannot be allowed.\n\nBecause of the protection Blackrock mountain affords " ..
                "Nefarian, it has become increasingly difficult for us to intercede.\n\nWe can, however, " ..
                "empower you, mortal - should you so choose.\n\nThe path before you is one full of peril. " ..
                "You must decide whether to accept our help. Ponder this and speak with me again when a " ..
                "decision has been made.",
        },
        [5162] = {
            description = "It is the arcane that I control and the arcane which will send you to your " ..
                "next destination.\n\nWhen you are ready, the journey will begin. To the Plaguelands you " ..
                "will go and to Jeziba you will speak.\n\nHe is a mortal as wise as the ancients and as " ..
                "patient as the immovable earth. Find him in Andorhal.",
        },
        [5164] = {
            description = "A finer instrument of justice, Haleh could not have chosen. Read from the " ..
                "catalogue of the wayward and be enlightened.\n\nShould you persist... should you do what " ..
                "is asked of you... should you survive... a hero you will make.",
        },
    },
    npcs = {},
    objects = {
        [105570] = {
            spawns = {
                [36] = {
                    {11.7, 73.8}, {12.3, 79.4}, {12.4, 79.5}, {12.6, 79.4}, {14.9, 75.3}, {17.7, 56.4},
                    {17.7, 56.5}, {18, 77.2}, {19.9, 57.6}, {20, 57.3}, {21.3, 62.6}, {21.4, 62.3},
                    {21.7, 59.4}, {21.7, 59.5},
                },
            },
            zoneID = 36,
        },
    },
    items = {},
}
