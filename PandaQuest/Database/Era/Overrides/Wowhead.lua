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
        [81] = {
            description = "I have taken the extra step of securing not only Dran's packaged ripple in the " ..
                "barrel, but also the extra bottles of ripple he is purloining. While I may not hold Dran " ..
                "very highly, there is nothing worse than jostled ripple. You're welcome.\n\nNow, deliver " ..
                "yon barrel to Dran Droffers in his salvage emporium in Orgrimmar. Pray tell, please " ..
                "extend my warmest greetings to Malton; let him know that should he ever thirst for fine " ..
                "drink and finer drinking companions, we would be honored with his visit.",
            rewardMoney = 14000,
        },
        [82] = {
            description = "All right now, these reports about the bugs... what we know is that they are " ..
                "draining the water pools that used to be where the Noxious Lair is. What we DON'T know " ..
                "is, well, everything else.\n\nLet's figure out who our enemy is first! I want you to " ..
                "head into the Noxious Lair and get some parts off of those critters. Get five from the " ..
                "Centipaar there and bring them to Alchemist Pestlezugg for him to dink with. With him on " ..
                "the case, we'll figure out what they are!",
            rewardMoney = 5000,
        },
        [83] = {
            description = "The Defias gang in Northshire wears burlap masks, but the Defias in Elwynn " ..
                "wear linen which I can use to make fine linen goods.\n\nBring me red linen bandanas and " ..
                "I'll use them to fashion something for you.\n\nDefias gang members have camps pocketed " ..
                "throughout Elwynn.",
            rewardItems = {{2575, 1}, {983, 1}},
        },
        [84] = {
            description = "Here you go. And when you give this pie to that Billy, you tell him I hope he " ..
                "chokes on it!",
        },
        [85] = {
            description = "I lost my necklace, and think that guttersnipe Billy Maclure took it! He's " ..
                "usually scuttling like a rat around the Maclure vineyards east of here.\n\nGet my " ..
                "necklace back for me, and you'll warm an old widow's heart.",
        },
        [86] = {
            description = "Maybe if I got a pie, I could tell you who has that necklace. And you know, I " ..
                "think that old Bernice lady at that other farm makes great Pork Belly Pies...\n\nMaybe " ..
                "if you gave her some chunks of boar meat from the boars that hang around our farms, and " ..
                "told her what it was for, she'd bake up a pie for you.",
        },
        [87] = {
            description = "I was playing near the Fargodeep Mine, and I think I dropped, er...I mean I " ..
                "saw, the old lady's necklace. Don't ask me how it got there...it wasn't me!\n\nWell " ..
                "anyway, I saw this big, gold-toothed kobold pick up the necklace and run into the mine. " ..
                "Go find that kobold and you'll find the necklace, I swear!",
            rewardItems = {{1359, 1}},
        },
        [88] = {
            description = "The Brackwells have a prize-winning pig, Princess. The sow is HUGE, and she " ..
                "got that way from sneaking over here and eating my veggies!\n\nSo before she comes to " ..
                "our fields...Princess must die! Bring me her collar as proof of the deed and I'll give " ..
                "you something for your time!\n\nPrincess is usually over at the Brackwell Pumpkin Patch, " ..
                "to the east and beyond the Maclure farm. Get her before she gets hungry and comes back " ..
                "here!",
            rewardChoices = {{1173, 1}, {1182, 1}, {11191, 1}},
        },
        [89] = {
            description = "During the last orc invasion we were forced to smelt our iron down to make " ..
                "bullets, swords and armor. We sent word to Stormwind for a new shipment of materials but " ..
                "a band of Redridge gnolls hijacked the caravan and ran off into the hills behind " ..
                "Lakeshire.\n\nNow we're coming up short on supplies to get this bridge rebuilt. If you " ..
                "can bring me 5 iron pikes and 5 iron rivets, <name>, I'll make sure you're " ..
                "rewarded.\n\nNow let's get to work!",
            rewardChoices = {{1310, 1}, {1303, 1}, {1304, 1}},
        },
        [90] = {
            description = "Seasoned Wolf Kabobs are a house favorite! Sure, I can make you some. But " ..
                "first I'll need the supplies. Bring me 10 Lean Wolf Flanks as well as some Stormwind " ..
                "Seasoning Herbs. There are so many wolves here in the forest, I am sure finding the " ..
                "Flanks will be no problem. For the herbs, seek out Felicia Gump in her canal district " ..
                "flower shop in Stormwind.",
            rewardItems = {{1017, 4}, {2701, 1}},
            rewardMoney = 1800,
        },
        [91] = {
            description = "An enemy of Stormwind has taken up residence in the eastern foothills of " ..
                "Redridge. This wicked villain uses the Arcane to spread terror and misery upon our town " ..
                "and our people. Under the name, Morganth, he conducts his evil business.\n\nMorganth now " ..
                "controls the Shadowhide Gnoll Clan to perform his biddings. As stated by the Law of " ..
                "Lakeshire, aiding a criminal of the Kingdom is punishable by death.\n\nThese vile gnolls " ..
                "must be killed!\n\nTurn in 10 Shadowhide Pendants to me, and you shall be rewarded.",
            rewardMoney = 1500,
        },
        [92] = {
            description = "Nothing would please me more than to make you some Redridge Goulash. But " ..
                "there's a slight problem. During the recent orc uprising I fed the entire brigade of " ..
                "Stormwind troops. My cupboard is now bare. But if you can provide me with the " ..
                "ingredients, I'd be happy to oblige.\n\nJust bring me five pieces of Tough Condor Meat, " ..
                "five Great Goretusk Snouts and five helpings of Crisp Spider Meat.",
            rewardItems = {{1082, 5}, {2699, 1}},
            rewardMoney = 1000,
        },
        [93] = {
            description = "I'll let you in on a little secret - Dusky \"Crab\" Cakes are really made from " ..
                "spider legs! I know it's a bit disgusting, but the cakes have a nice, tangy flavor and " ..
                "make great snacks! Bring me Gooey Spider Legs and I'll whip you up a few of them.\n\nI " ..
                "hear Venom Web Spiders are a good source - they nest to the north, between the foothills " ..
                "and the river.",
            rewardItems = {{3683, 1}},
        },
        [94] = {
            description = "My rival, Morganth, is a vicious mage of great power who lives in the Tower of " ..
                "Ilgalar in Redridge. I have developed a means of spying on him, the Eye of Azora, and " ..
                "can now view him from afar.\n\nBut to study his thoughts... I require further aid.\n\nIf " ..
                "you are willing, then take my Glyph of Azora to the Tower of Ilgalar. Place it upon the " ..
                "Lion Statue near the Tower.\n\nWhen this is done, the power of Azora will grant visions " ..
                "of Morganth's future plans.",
        },
        [95] = {
            description = "I used to work one of the farms to the southeast...until Dark Riders from " ..
                "Deadwind Pass descended upon my farm and slaughtered my family when I was away!\n\nWhen " ..
                "I returned I saw a shadowy figure skulking near my barn, burying something. He fled " ..
                "before I could catch him, and I couldn't linger for I was hot on the heels of the Dark " ..
                "Riders. So I never discovered what was hidden.\n\nIf you can find what that shadowy " ..
                "figure buried, I would be grateful. The hiding spot is behind the old stump near my barn.",
        },
        [96] = {
            description = "Take shard. Take shard and give life.\n\nGive life and understand. Understand " ..
                "water is life... corruption stops life.\n\nYou protect and give life with water's power.",
            rewardItems = {{5177, 1}},
        },
        [97] = {
            description = "Let Commander Ebonlocke know immediately that the handwriting matched, <name>! " ..
                "Her suspicions were correct!",
        },
        [98] = {
            description = "Stalvan Mistmantle led a life of depravity. Innocent victims died by his hand. " ..
                "Undoubtedly he is guilty of countless crimes. Now the lunatic threatens Darkshire. The " ..
                "Light only knows what sordid acts he is plotting. Travel to his cottage just north of " ..
                "town, <class>, and execute Stalvan, once and for all.\n\nWhen the deed is done, travel " ..
                "to Madame Eva 's and show her his family ring. After all, it was her premonition that " ..
                "led to this gruesome discovery. But Darkshire is safer because of her.",
            rewardChoices = {{2044, 1}, {2043, 1}},
        },
        [99] = {
            description = "As my understanding of Arugal's magic grows so does my disdain for the hapless " ..
                "fool. I am close to completing my research on his so called remedy.\n\nMy knowledge will " ..
                "be complete when I learn what enchantment is causing the strange behavior going on in " ..
                "Pyrewood Village. By day, the peasants appear to be Human. But when the sun goes down " ..
                "the townsfolk turn into Moonrage Worgen.\n\nI need to draw energy from the enchanted " ..
                "shackles Arugal cast on them. Bring to me six enchanted Pyrewood Shackles, <name>.",
            rewardChoices = {{3586, 1}, {3570, 1}, {5242, 1}},
        },
        [100] = {
            description = "Light explodes as you finish the incantation. The sounds of the water drops " ..
                "hitting the flame have died down and your senses are overcome as the corrupt spirits " ..
                "around you are destroyed.",
        },
        [101] = {
            description = "As the mystical taint creeps through the forest, the need for self-protection " ..
                "is undeniable, <name>. The winds whisper to me and they speak of a great danger which " ..
                "waits patiently for you in the near future.\n\nIf you wish to protect yourself, noble " ..
                "<class>, bring to me 10 ghoul fangs, 10 skeleton fingers and 5 vials of spider venom. " ..
                "For you I shall enchant a Totem of Infliction which will harm those who attempt violent " ..
                "acts against you.",
            rewardItems = {{1131, 1}},
        },
        [102] = {
            description = "Stormwind has abandoned us. A foul wind of depravity rustles through the " ..
                "plains of Westfall. This was my homeland and I will not turn my back on the citizens who " ..
                "choose to remain here. We, the former farmers, shall make our stand.\n\nYour task, " ..
                "should you choose to accept, is to patrol the grasslands of Westfall. Track down and " ..
                "slay the vile Gnolls that seem to be working in conjunction with the Deadmines thieves. " ..
                "Bring me eight Gnoll Paws and I will reward your bravery.",
            rewardChoices = {{1154, 1}, {710, 1}},
        },
        [103] = {
            description = "The night the Lighthouse Keeper's family died was horrible. I watched, " ..
                "helpless, as Old Murk-Eye led the attack. But what's done is done and now my concern is " ..
                "for the lives of the sailors on The Great Sea whose ships come close to the perilous " ..
                "rocks of the coastline. With no one to keep watch on the flame the responsibility has " ..
                "fallen upon me.\n\nHelp me keep the torch lit by bringing me 5 flasks of oil from the " ..
                "Harvest Monsters.",
            rewardChoices = {{2455, 3}, {118, 3}},
            rewardItems = {{955, 1}, {1180, 1}},
            rewardMoney = 600,
        },
        [104] = {
            description = "When my life was ended upon the rocks, I had no clue what the afterlife held " ..
                "for me. The Lighthouse was black that night because Old Murk-Eye had scared the keeper's " ..
                "family off. They returned and re-lit the flame but Old Murk-Eye coerced the weaker " ..
                "minded murlocs to raid the Lighthouse with him once again. The second time the family " ..
                "was not so lucky and before my eyes they perished helplessly.\n\nSlay Old Murk-Eye if " ..
                "you see him along the shore and bring me one of his scales and I shall reward you.",
            rewardChoices = {{1172, 1}, {1557, 1}, {5240, 1}},
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
        [106] = {
            description = "Oh, I'm cursed! My heart belongs to Tommy Joe Stonefield, but our families are " ..
                "bitter enemies. So I can't see him, even though my eyes ache to gaze upon that handsome " ..
                "face!\n\nPlease, take this letter and give it to Tommy Joe. He's usually at the river to " ..
                "the west of the Stonefield Farm, which is due west of here.",
        },
        [107] = {
            description = "I bet William Pestle has a potion to unite our two young lovers!\n\nHere, take " ..
                "this note to William. He's staying at the Lion's Pride Inn in Goldshire.",
        },
        [109] = {
            description = "Looks to me you've seen quite a bit of combat in your time, <class>. If you " ..
                "haven't already, you should report to Gryan Stoutmantle. He heads up the People's " ..
                "Militia, aimed at protecting the farmlands of Westfall. I bet he could use your help. " ..
                "You can usually find him in the stone tower on Sentinel Hill, just off the road in the " ..
                "middle of Westfall.",
            rewardMoney = 250,
        },
        [110] = {
            description = "I'm going to spend some time taking a look at Scrimshank's surveying gear... " ..
                "as well as putting his personal effects in order. I get the sneaking feeling behind my " ..
                "ears that this isn't the last loss we'll be facing against these bugs.\n\nI'd like for " ..
                "you to check in with Alchemist Pestlezugg to see if he has had a chance to process the " ..
                "insect parts we sent him. If they're ready, bring them to me.",
        },
        [111] = {
            description = "Please, <name>, talk with my Gramma. If anyone can find a way to bring me " ..
                "together with Maybell, she can.\n\nShe's inside our house east of here.",
        },
        [112] = {
            description = "I can make an invisibility liquor for Maybell, so she can slip away from the " ..
                "Maclure Vineyards and go to Tommy Joe. But to make the Liquor, I need some crystal " ..
                "kelp.\n\nAlthough the kelp usually grows in the ocean... sometimes murlocs collect it. " ..
                "See if the murlocs near Crystal Lake have any. Crystal Lake is just east of Goldshire.",
        },
        [113] = {
            description = "Senior Surveyor Fizzledowser needs to see this report immediately. Actually... " ..
                "everyone who can read needs to see this report. We are facing a grave and serious threat " ..
                "to not only Tanaris and Gadgetzan, but if left unchecked, the entirety of southern " ..
                "Kalimdor. Heck, even quite possible the whole of Azeroth; this thing has given no " ..
                "indication it will subside.\n\nHave Fizzledowser make a duplicate of the report for you " ..
                "to distribute freely to your allegiance. Everyone must know about this threat!",
            rewardMoney = 7000,
        },
        [114] = {
            description = "Take this invisibility liquor to young Maybell. It should last long enough for " ..
                "her to visit Tommy Joe.",
            rewardItems = {{118, 5}},
        },
        [115] = {
            description = "The Blackrock orcs enlisted shadowcasters to aid their attacks in Redridge, " ..
                "and they have brought with them devices of dark power-- midnight orbs. These orbs have " ..
                "struck telling blows against Redridge's defenders, and it's imperative we remove the " ..
                "demon-tainted items from the conflict.\n\nFind and deliver to me midnight orbs from " ..
                "slain Blackrock shadowcasters. I will then have them disposed of, for this world would " ..
                "be a better place without them!",
            rewardMoney = 3000,
        },
        [116] = {
            description = "I find myself in quite a pinch here, <name>. The bottles are close to running " ..
                "dry. The latest booze shipment is long overdue. The orc invasion has been " ..
                "hell.\n\nPerhaps you can go to work for me?\n\nI need you to pick up a keg of " ..
                "Thunderbrew Lager from Grimbooze Thunderbrew in the Westfall hills, a cask of Merlot " ..
                "from Stormwind, a bottle of Moonshine from Darkshire and a skin of Sweet Rum from " ..
                "Goldshire. Bring those back to me and I will see to it you are rewarded.",
            rewardItems = {{1270, 1}, {10456, 1}},
        },
        [117] = {
            description = "Hurry, my friend, move with haste In order for our rich lager to taste More " ..
                "like beer and less like stew, Hops are needed to make the brew.",
            rewardItems = {{1262, 1}},
        },
        [118] = {
            description = "I've been using so much iron keeping the Stormwind Guards outfitted, I don't " ..
                "have enough to supply the stable's horses with shoes!\n\nTake this note to Blacksmith " ..
                "Argus in Goldshire. It explains to him my problem and requests a shipment of horseshoes.",
        },
        [119] = {
            description = "Ok, I'll give him his 50 horseshoes...\n\nHere they are, all boxed up and " ..
                "ready to go! Tell Verner it was a pleasure doing business, and be sure he reads the note " ..
                "attached to this crate!",
            rewardMoney = 500,
        },
        [120] = {
            description = "These are trying times, <class>. The township is under constant siege. Without " ..
                "reinforcements, we will certainly face defeat. The message I now entrust to you is of " ..
                "utmost importance. Get this report to General Marcus Jonathan of Stormwind immediately. " ..
                "Once your delivery is made, return to me at once with any news, be it good or " ..
                "bad.\n\nNow make haste!",
        },
        [121] = {
            description = "While I wait for a response from the King I want you to carry this letter to " ..
                "Magistrate Solomon.\n\nDismissed, <class>!",
            rewardMoney = 150,
        },
        [122] = {
            description = "I need some underbelly scales from black dragon whelps to pay for the shoes " ..
                "Argus sent me from Goldshire. If you can get 6 of them for me, then I can pay Argus with " ..
                "some... and have enough left to fashion something for you.\n\nBlack dragon whelps are " ..
                "often flying around south of Lakeshire, but they like to wander. You might have to just " ..
                "keep an eye out and hunt them when you see them.",
            rewardChoices = {{6092, 1}, {1302, 1}},
        },
        [123] = {
            description = "This note is a schedule with a list of days and times when a person -- " ..
                "described only as \"The Collector\" -- will receive a shipment of gold from the mines in " ..
                "Elwynn Forest.\n\nFrom the schedule, it looks as if the Collector resides near the " ..
                "Brackwell Pumpkin Patch in eastern Elwynn.\n\nThis sounds important. You should report " ..
                "it to Marshal Dughan in Goldshire.",
            rewardMoney = 85,
        },
        [124] = {
            description = "As if the attacking orcs weren't enough! Now I have gnoll brutes and mystics " ..
                "prowling along the ridge north of my stable, taking my horses when they stray...\n\nIf " ..
                "you can get rid of those gnolls, my horses and I would be very grateful.",
            rewardMoney = 900,
        },
        [125] = {
            description = "I could really use a hand here, <name>. With the town under siege, it's been " ..
                "hard to get supplies. My tools were being delivered from Goldshire by wagon but the " ..
                "bridge was blown out. We put the tools in a boat but the orcs hit it with a catapult. " ..
                "Just my luck, my toolbox sank right to the bottom of the lake.\n\nRetrieve my toolbox, " ..
                "<name>, and I'll make it worth your while.",
            rewardItems = {{2313, 2}},
        },
        [126] = {
            description = "<name>, the gnolls are still out there. I can hear their baying as they hunt " ..
                "in the hills above Lakeshire. And one cry is louder than the rest - Yowler, their " ..
                "leader.\n\nKill Yowler and send his pack scattering! Bring me his paw as proof.\n\nAnd " ..
                "be careful, this gnoll is their leader for a reason. He is no Mongrel...",
            rewardChoices = {{1319, 1}, {2910, 1}},
        },
        [127] = {
            description = "Lake Everstill is famous for its spotted sunfish. There's always demand for " ..
                "them...and I'm running low!\n\nBring me a batch of 10 and I'll barter well for them. If " ..
                "you can't fish yourself, then...maybe you can get them off the murlocs!",
            rewardItems = {{3663, 1}, {3680, 1}, {1322, 5}},
            rewardMoney = 1000,
        },
        [128] = {
            description = "The Blackrock Clan must be destroyed. The Enemy has invaded our lands. These " ..
                "mountains fall under the sovereign right of the King of Stormwind. Our sources tell us " ..
                "that the leaders of each unit within the Clan are known as Champions. You'll find them " ..
                "in their encampment to the north, just west of the road to the Burning " ..
                "Steppes.\n\nMagistrate Solomon wants these foul brutes dead. Slay 15 Blackrock Champions " ..
                "and return to me.",
            rewardMoney = 1800,
        },
        [129] = {
            description = "Can you do me a favor? I've prepared a lunch for Guard Parker, but he's out on " ..
                "patrol...he's a big, strong Stormwind guard who can defend himself, but it's much too " ..
                "dangerous out there for a townsperson like me.\n\nSo if you deliver his lunch for me, " ..
                "then come back here and I'll give you a free lunch! Parker patrols the stretch of road " ..
                "leading to Duskwood.",
        },
        [130] = {
            description = "Before you go back to Darcy, can you bring her some flowers for me? You can " ..
                "get them at the herbalist shop back in Lakeshire, at the west end of town.\n\nBut when " ..
                "you get the flowers...don't tell the herbalist, Martie, whom they're from, or whom " ..
                "they're for...",
        },
        [131] = {
            description = "Here is your bouquet. I chose Daffodils for you. They're my favorite!",
            rewardItems = {{1326, 10}},
        },
        [145] = {
            description = "I require your assistance once again. I have written to Lord Ebonlocke, " ..
                "requesting that he sends his trained guards, the Night Watch, to help with Lakeshire's " ..
                "defense. It is imperative this message makes it to him swiftly. You must exercise " ..
                "extreme caution. Ebonlocke is the mayor of Darkshire, in the heart of Duskwood. Do not " ..
                "stray from the roads.",
        },
        [150] = {
            description = "Murlocs are becoming a problem. Larger groups of the fishmen are dropping " ..
                "anchor along the shores of Lake Everstill and fishing up a storm! We need them gone " ..
                "before they eat all the fish in the lake!\n\nHunt murlocs! Bring me eight of their fins " ..
                "and I might have something for you...",
            rewardItems = {{3567, 1}},
        },
        [160] = {
            description = "Take this note to Ello Ebonlocke, the Mayor of Darkshire.\n\nHe and I are old " ..
                "friends...and when he reads it and discovers what you did for me...I'm sure he'll be " ..
                "just as happy as I am! Hahahaha!",
        },
        [162] = {
            description = "I urge you to take this report to someone who has working knowledge in this " ..
                "kind of thing.\n\nI know this night elf scholar named Gracina Spiritmight. She's spent a " ..
                "lot of time studying life forms that are unique to the ecology of Azeroth; she's a " ..
                "historian to boot! If you want someone to help figure out what exactly this threat is, " ..
                "and more importantly how to stop it, give her the report. We'll need the help.\n\nLast I " ..
                "heard, she was residing in the Temple of the Moon, located in Darnassus.",
        },
        [169] = {
            description = "Wanted! Gath'Ilzogg, Leader of the Blackrock attacks on Stonewatch Keep and " ..
                "raids against the township of Lakeshire.\n\nGath'Ilzogg is extremely dangerous. He is " ..
                "reportedly holed up in the recently conquered keep plotting the Blackrock clan's further " ..
                "crimes against humanity. The orc infestation must be quelled at all costs. A gracious " ..
                "reward will be given to whatever brave soul can deliver the head of Gath'Ilzogg to " ..
                "Magistrate Solomon.",
            rewardMoney = 4000,
        },
        [181] = {
            description = "Now there is just one more item needed to complete this device. Cog's " ..
                "blueprint calls for a lens of some sort. The only lens I know of that would be large " ..
                "enough will be very difficult to acquire.\n\nThere is an ogre by the name of Zzarc'Vul " ..
                "who resides in the mound in southern Duskwood. If you can, bring to me his monocle and I " ..
                "will use that as our lens!",
            rewardChoices = {{7106, 1}, {7107, 1}},
        },
        [183] = {
            description = "Nothing like a day of boar hunting, eh?\n\nThough, here in Coldridge Valley, " ..
                "there are so many boars it almost takes the fun out of it. No need to get them charging. " ..
                "They're all angry and ready without any help. In fact, recently, there've been so many " ..
                "boars in the area, it's become dangerous for me to do my daily hunting.\n\nLong story " ..
                "short, if you could help me kill some of the boars, I would appreciate it.",
            rewardChoices = {{79, 1}, {61, 1}},
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
        [216] = {
            description = "The Thistlefur furbolgs are threatening our expansion! Thistlefur Village to " ..
                "our east blocks the way between us here and the Splintertree Post. It's a path that " ..
                "would circumvent the village of Astranaar; without it, we give the Alliance an extra " ..
                "expansion path.\n\n<name>, we must not allow... an expansion path gap!\n\nProceed to " ..
                "Thistlefur Village and thin out the furbolgs. You will be given compensation for this " ..
                "task, but more importantly you will be doing your duty for the Horde!",
            rewardMoney = 1700,
        },
        [245] = {
            description = "Hail, <class>. Perhaps you've seen those spiders that have taken over the " ..
                "western border? The eight-legged menaces are too much for us to handle, and the " ..
                "Commander hasn't enough manpower to spare so far from Darkshire.\n\nI hate to ask this " ..
                "of you, but you seem like you might be able to handle them. I can't promise you anything " ..
                "of great value, but I can reward you if you can help root out the filthy bugs.\n\nOh, " ..
                "and a word of advice, you'll want to avoid their venom if you can.",
            rewardItems = {{3559, 1}},
        },
        [247] = {rewardItems = {{16658, 1}}},
        [261] = {
            description = "I will be frank. We are at war with the Scourge. It is an evil that corrupts " ..
                "our people and infects our land. It must be stopped before it overwhelms us and drags " ..
                "our world into shadow. We of the Scarlet Crusade have sworn to fight the Scourge with " ..
                "body and soul.\n\nIf you are with us, then gather your courage and prove your " ..
                "allegiance--destroy the undead ravagers of Desolace, in the Valley of Bones to the " ..
                "south.\n\nDo this, and the Crusade will embrace you.",
            rewardMoney = 4500,
        },
        [278] = {
            description = "Begin collecting the disarming materials immediately, <name>. Lurker Venom can " ..
                "be found on the indigenous spiders in Loch Modan. Crocolisk tears are found here in the " ..
                "Loch as well. But a Mo'Grosh crystal will be very difficult to procure. The ogres to the " ..
                "northeast mine them but the crystals are a very rare commodity.\n\nWe need to be " ..
                "prepared to defuse a Dark Iron attack! Return to me once you've collected the needed " ..
                "items and I will prepare the mixture.",
        },
        [281] = {
            description = "Not long ago a merchant vessel, the Blind Princess, was raided by Murlocs. " ..
                "Although the ship escaped intact, much of its cargo was dragged overboard by the " ..
                "creatures, including a very valuable statuette of Terenas Menethil. We want that " ..
                "statuette recovered.\n\nSearch the coastal Murloc hovels for crates, barrels and other " ..
                "evidence of lost cargo. Find the Menethil Statuette and return it to me.",
            rewardItems = {{929, 5}},
        },
        [317] = {
            description = "I'm preparing to start a mission for the Siege Brigade. It's a long one, and I " ..
                "need to stock Jetsteam with a month's worth of supplies. So while Steelgrill is working " ..
                "on my tank, can you do some hunting for me?\n\nI'll need some fur for bedding, and boar " ..
                "meat for food. You can get meat from boars and fur from the bears... you can find them " ..
                "both in the snow fields south of the Grizzled Den.",
            rewardMoney = 250,
        },
        [333] = {
            description = "We've been doing a lot of business lately. It seems like everyone is buying " ..
                "armor and sturdy clothes. Almost like they expect a cold, harsh season ahead...\n\nBut " ..
                "those are future worries. My worry today is that I'm running out of knitted clothing to " ..
                "sell. I need another load from our supplier.\n\nIf you can take this request to Rema " ..
                "Schneider at the Canal Tailor and Fit Shop, I'd be most grateful.",
            rewardMoney = 17,
        },
        [343] = {
            description = "I'm giving a speech on the Fortitude of the Spirit, and I'd like to recite " ..
                "passages from a particular book on metallurgy - \"The Stresses of Iron.\" A copy of this " ..
                "book should be in the Royal Library, within Stormwind Keep. Can you retrieve it for me? " ..
                "If so, then may the blessings of the Light be with you!\n\nThe Royal Library is very " ..
                "large, but the head librarian, Milton Sheaf, knows each shelf like it was his own son. " ..
                "Speak to him, he'll retrieve the book for you.",
        },
        [344] = {
            description = "The Stresses of Iron? Yes, I know the book. Quite a good one, written by the " ..
                "Dwarven miner Margulf Blaggon a few decades ago. He spent most his time deep in the " ..
                "mountains of Khaz Modan, digging ore. Smart fellow!\n\nBut where was I? Oh yes, the " ..
                "Stresses of Iron! I'm afraid the book was moved to the Northshire Abbey. The caretaker " ..
                "of the Abbey's library, Brother Paxton, wanted to make a copy of the book for his own " ..
                "shelves.\n\nBut that was months ago. I wonder why it's taking him so long...",
        },
        [345] = {
            description = "I've been meaning to finish my copy of The Stresses of Iron, but...\n\nWell " ..
                "you see, I make my own ink for books I copy. It's my own recipe; it doesn't run or " ..
                "smear, and it dries very quickly Unfortunately, it dries too quickly! My last batch " ..
                "dried up before I could finish the copying job, and I haven't had the chance to make " ..
                "more ink!\n\nTo make more I need Rethban Iron Ore from the Redridge Mountains. Foreman " ..
                "Oslow in Lakeshire is my usual supplier.",
        },
        [387] = {
            description = "The uprising must be quelled! I need your assistance. If word gets out that " ..
                "the prison is overrun I will lose my job! This is a case of foul play if I've ever seen " ..
                "one. But what's important now is forcing these prisoners into submission for the safety " ..
                "of Stormwind.\n\nThe punishment for insurgency is death. Kill some of these deviants! " ..
                "That ought to get things under control.",
            rewardMoney = 4000,
        },
        [391] = {
            description = "Let's get one thing straight, <name>: I don't trust you. But, with the " ..
                "situation as it is, you probably won't make a difference.\n\nSo here's how it's going to " ..
                "be: go down there and have your talk with Thredd. If you're really on our side, then " ..
                "kill him and bring me his head when the job's done. And if it turns out you're on his " ..
                "side, and don't come out... when we find you, you'll die along with the rest of the " ..
                "maggots.",
            rewardMoney = 2500,
        },
        [405] = {
            description = "Bethor Iceshard, a high-ranking and powerful mage in the Undercity to the " ..
                "south, commands me to send him an agent with proven worth against the Scourge. You, " ..
                "<name>, will be that agent.\n\nPresent these orders to Bethor. He will then instruct you " ..
                "on your mission. I don't know its details, but it deals with recruiting a wayward Lich. " ..
                "And it will be dangerous.\n\nSo ready yourself, <class>. You must not fail.\n\nYou may " ..
                "find Bethor in the Magic Quarter of the Undercity.",
        },
        [412] = {
            description = "Upon further analysis of the Gnomeregan situation, it would appear as though " ..
                "we not only failed to eradicate the troggs but we also happened to turn most of the " ..
                "gnomish race into horrific, mindless, evil-doing leper gnomes.\n\nOzzie and I plan to " ..
                "reverse the horrible leper effect with our latest invention: The Recombobulator. The " ..
                "machine is almost complete but we are in dire need of some Restabilization Cogs and " ..
                "Gyromechanic Gears. Retrieve some from the leper gnomes out front of Gnomeregan for us.",
            rewardChoices = {{3152, 1}, {3153, 1}},
        },
        [414] = {
            description = "I've been drinking more of that Shimmer Stout my brother made - it's great " ..
                "stuff! I want a fellow Mountaineer to try it. His name's Kadrell, and he's usually " ..
                "patrolling the road through Thelsamar in Loch Modan.\n\nTo get to Thelsamar, go " ..
                "southeast through the tunnel, then turn northeast when the path forks into a road. " ..
                "Follow that road straight into Thelsamar.\n\nGive Mountaineer Kadrell this cask of " ..
                "Shimmer Stout and see what he thinks!",
        },
        [415] = {
            description = "Rejold Barleybrew at Brewnall Village has been asking for you.\n\nHe wants to " ..
                "talk to you about a new drink he's been brewing...said something about you helping him " ..
                "with it. You might want to head back to Brewnall Village and see what he has to " ..
                "say.\n\nThere could be some free booze in it for you...",
            rewardItems = {{3087, 1}},
        },
        [417] = {
            description = "Hildelve wrote in his journal that he was attacked by Mangeclaw, a \"huge Ice " ..
                "Claw Bear.\" He drove off the beast, but not before it mauled him savagely.\n\nJudging " ..
                "from the state of Hildelve's body, Mangeclaw must have later returned and killed " ..
                "him.\n\nHowever, Hildelve wrote in his journal his one, final wish:\n\nRevenge against " ..
                "Mangeclaw.",
            rewardChoices = {{2218, 1}, {1009, 1}},
        },
        [442] = {
            description = "Now is the time to assault the Scourge's place of strength in Silverpine: " ..
                "Fenris Isle.\n\nYou must again go to the Isle and destroy Thule Ravenclaw. I want his " ..
                "head!\n\nThis mission is as dangerous as it is vital, <name>. You must not fail.",
            rewardChoices = {{3461, 1}, {3462, 1}},
        },
        [509] = {
            description = "Another day, another elixir to be made. If it were up to me, I'd just let the " ..
                "pathetic humans and Scourge fight it out. They seem bent on killing each other as " ..
                "is.\n\nAlas, our Dark Lady wants to help speed up the process a tad so why not pass " ..
                "these morbid days by spreading a little death and disease across the land?\n\nHere's the " ..
                "plan, <name>: you go out to Nethander Stead, south of Tarren Mill and east of the river " ..
                "and Southshore. Collect for me 6 Mudsnout Blossoms from the field for my next elixir.",
            rewardItems = {{2459, 3}, {929, 5}},
            rewardMoney = 2500,
        },
        [540] = {
            description = "Those beastly ogres now reside within Alterac's ruins, and I shudder to think " ..
                "what they're doing with the precious books still there. You must recover what you " ..
                "can!\n\nEnter the Ruins of Alterac and search for tomes looted by the ogres. Get " ..
                "whatever you can find and bring them to me, but also seek out one book in particular: " ..
                "The Arm of Gri'lek. It contains ancient troll lore that I must learn, and the Ruins of " ..
                "Alterac was the last known location of an intact copy of this book.",
        },
        [576] = {
            description = "Avast! Who goes there?\n\nArgh, I am but useless without me special enchanted " ..
                "eye. Bad enough to have lost me eyes in battle in the first place! But by some stroke o' " ..
                "luck we docked in Menethil and a traveling wizard enchanted a special glass eye that let " ..
                "me see again.\n\nLast night I ended up gettin' jumped by some Bloodsail Buccaneers on me " ..
                "way out. Took me eye, they did! Seems those blokes have found their way to Booty " ..
                "Bay.\n\nHelp an old sea dog out by gettin' me eye back?",
            rewardItems = {{4114, 1}},
        },
        [585] = {
            description = "<The head of Nezzliok speaks.>\n\nIt is true. I know where the child of the " ..
                "Darkspears was taken. You have bested me and bound my spirit, but I will say nothing " ..
                "without appeasement!\n\nThe Bloodscalps war with the Skullsplitters. To gain my favor, " ..
                "steal from the Skullsplitters 3 of their trophy skulls and place them here with us, so " ..
                "that my spirit will have slaves in the Nether. One skull must be from their trophy pile " ..
                "in Balia'mah, another from Ziata'jai, and the last from Zul'Mamwe.",
        },
        [628] = {
            description = "With the inside finished, all that's left is to add the outer layer. For this, " ..
                "I use only the best elder croc skins. They are more durable and a better canvas--if you " ..
                "will--for adding the designs and accents that make Drizzlik 's Excelsior line.\n\nIt's " ..
                "hard to find that perfect skin though, the only one that fits my plan is the skin of an " ..
                "elder saltwater crocolisk. The elders only come out to defend the other saltwater crocs, " ..
                "so you might need to kill a few to draw one out.",
            rewardItems = {{4109, 1}},
        },
        [639] = {
            description = "In ancient times, trolls fought against the Arathorian Empire and our most " ..
                "capable adversary, Lord Ignaeus of Strom, named Trollbane. He rode into battle wielding " ..
                "Trol'kalar--troll slayer, in their ancient tongue.\n\nBut now the sons of Trollbane are " ..
                "weakened, their stronghold brought to ruin.\n\nThe sword is protected by several sigils " ..
                "that were divided among the survivors of Stromgarde, and we must retrieve them.\n\nThe " ..
                "first was taken by the Syndicate, one of their men in Stromgarde should have it.",
            rewardMoney = 4000,
        },
        [641] = {
            description = "The reconstruction worked flawlessly. The sigil can now be used to unlock the " ..
                "seal on Trollbane's tomb. Return it to Zengu, no doubt he has additional tasks for you " ..
                "to complete.",
        },
        [643] = {
            description = "Though they can barely be said to control Stromgarde, let alone the whole of " ..
                "Arathi Highlands, the human prince trots the remnants of his cavalry over the " ..
                "countryside. I can't understand why he does it, but who understands the way the humans " ..
                "think, hm?\n\nWhatever his reasoning, more importantly, he has given one of the sigils " ..
                "to Lieutenant Valorcall, their cavalry leader. Locate him and bring his sigil back to me.",
            rewardMoney = 5500,
        },
        [644] = {
            description = "The final of the sigils needed to unlock the tomb of Thoras Trollbane is held " ..
                "by his son personally. He resides deep within Stromgarde, in a chapel in the " ..
                "militia-held districts. Prince Galen is well protected and no slouch of a warrior " ..
                "himself, so this task could prove most difficult.",
            rewardMoney = 5500,
        },
        [648] = {
            description = "The gnome's voice crackles once again from the robot:\n\n\"I need to move " ..
                "OOX-17/TN to an open, safe place so it can begin a lengthy take-off procedure. It has " ..
                "built-in cloaking, but I need time on my end to make it operational again. I need you to " ..
                "escort the robot from its current location to, let's say, Steamwheedle Port! That should " ..
                "be a perfect place, and long enough, to get things on line!\"\n\n\"Escort it safely to " ..
                "the port, and then come talk to me in Booty Bay! Oglethorpe Obnoticus - out!\"",
            rewardChoices = {{9643, 1}, {9644, 1}},
        },
        [701] = {
            description = "With some additional objects, I will be able to create an item that will imbue " ..
                "Gor'mul with the guile of the raptor! With the power of the raptor flowing through him, " ..
                "Gor'mul will know our new power and rediscover the warrior that lies dormant!\n\nI will " ..
                "require raptor hearts to fashion the item and spell.",
        },
        [702] = {
            description = "Take this orb and use its energy to give Gor'mul the essence of the raptor. " ..
                "Surely this will invigorate his spirit and give him new purpose in life. With him " ..
                "returned to normal, we can explain to him the current state of the Horde, and we will " ..
                "have a great warrior's assistance in our unceasing battles.",
        },
        [709] = {
            description = "Oh my! Oh my! There is a doom approaching. Mark me! A doom!\n\nNo, I cannot " ..
                "speak of it...cannot utter their names or they may hear me! But if we learn, yes, if we " ..
                "learn more of them...then maybe we can learn how to foil them!\n\nMaybe.\n\nGo into " ..
                "Uldaman. No! I said it! You must find...find the tablet of...Ryun'eh. Yes, find it! And " ..
                "don't make me speak that name again!\n\nIt is deep in that place, in an ancient chest. " ..
                "That's where it hides...in a chest crafted before the works of any dwarf.",
            rewardItems = {{4746, 1}},
        },
        [721] = {
            description = "<name>, can ye find him? Can you find Hammertoe in Uldaman?\n\nIf those dirty " ..
                "Shadowforge are holdin' him hostage to figure out what he knows about the titan " ..
                "excavations, then all of Ironforge could be in huge trouble.\n\nFor a long time now " ..
                "those Dark Irons have been lookin' for magics to make more powerful golems. Hammertoe " ..
                "was doin' the same, of course, but only to stop them.\n\nThey're probably keepin' him " ..
                "alive until they learn what he knows.Ye've got to hurry if you're gonna save him!",
        },
        [727] = {
            description = "The Tablet tells much. But not enough! Not nearly enough!\n\nThere is a book, " ..
                "a digest that Yagyin wrote in ages past. The... people I fled... they keep this book in " ..
                "many places. And their most learned study it. It holds vast knowledge. Knowledge to " ..
                "protect us!\n\nGo to Gerrig Bonegrip. He is in a shop in Ironforge, in the Forlorn " ..
                "Cavern. Show him this sigil and he'll think you one of them. Ask him for Yagyin's " ..
                "Digest... and bring it to me!",
        },
        [728] = {
            description = "The tablet tells much. But not enough! Not nearly enough!\n\nThere is a book, " ..
                "a digest that Yagyin wrote in ages past. The... people I fled from... they keep this " ..
                "book in many places. And their most learned study it. It holds vast knowledge. Knowledge " ..
                "to protect us!\n\nGo to Keeper Bel'dugur in the Undercity of Lordaeron. Show him this " ..
                "sigil and he'll think you one of them. Ask him for Yagin's Digest...and bring it to me!",
        },
        [730] = {
            description = "How nice it is to see a <class> interested in the great archeological wonders " ..
                "of our world.\n\nOftentimes our work is dismissed as mere hobby by our friends in the " ..
                "Alliance. But what many fail to realize is that recent discoveries in Khaz Modan have " ..
                "proven that a great and powerful force threatens all of Azeroth, from Lordaeron to " ..
                "Kalimdor.\n\nI am most worried about my crew that I sent to Darkshore. They haven't sent " ..
                "word in weeks.\n\nTravel to Auberdine and look for a clue as to their whereabouts.",
        },
        [744] = {
            description = "<name>, my brother soon stands before Chief Bloodhoof, and it is my honor to " ..
                "make his headdress for him.\n\nI want to ask a favor of you while I finish tanning these " ..
                "leather straps. There is not time for me to find enough feathers, and I was wondering, " ..
                "would you gather more for me?\n\nYou can find feathers of the correct size from the " ..
                "harpies residing far to the north and northwest of Thunder Bluff. I need only 6 azure " ..
                "and 6 bronze feathers to complete the design.",
            rewardChoices = {{4968, 1}, {4967, 1}},
        },
        [747] = {
            description = "You have a promising air about you, and will prove yourself to the tribe. " ..
                "Perhaps someday soon you will be welcomed into the great city of Thunder Bluff. But " ..
                "before that can happen you must prove yourself to my father, Chief Hawkwind.\n\nUp here " ..
                "on Red Cloud Mesa we pride ourselves on keen hunting skills. Tauren hunt out of " ..
                "necessity and for sport. Our supply of meats has run low and we require feathers for " ..
                "clothing. Hunt the nearby plainstriders and prove yourself by resupplying the village.",
            rewardChoices = {{4954, 1}, {4910, 1}},
        },
        [758] = {
            description = "The totem is ready, <name>. And again, it is your task to perform the ritual " ..
                "of cleansing.\n\nGo to the Thunderhorn Water Well, north of the village, and use the " ..
                "Thunderhorn Cleansing Totem in your ritual. After you do this, return to me.\n\nMay the " ..
                "spirits guide you.",
            rewardItems = {{4963, 1}},
        },
        [759] = {
            description = "There is but one water well left to cleanse, named after the Wildmane clan. " ..
                "For this well to be pure, the land must offer the teeth of a fierce predator, the " ..
                "prairie wolf alpha. Find the alphas to the north, then return to me when your hunt is " ..
                "finished.\n\nAlphas often wander around the base of our mighty city, Thunder Bluff.",
        },
        [762] = {
            description = "Ambassador Infernus was sent to Angor Fortress by Ragnaros himself to mind the " ..
                "Shadowforge seeking lost artifacts in Uldaman.\n\nIt has already meant tremendous " ..
                "casualties for our people, but it has obviously grown worse. I hesitate to guess how " ..
                "many artifacts they would be able to find and use against Ironforge.\n\nOur goal is " ..
                "simple, <class>. Return to the Badlands and destroy Ambassador Infernus. Once the threat " ..
                "is eliminated, return to Advisor Belgrum with proof of your victory.\n\nIt is in your " ..
                "hands now.",
            rewardItems = {{4987, 1}},
            rewardMoney = 12500,
        },
        [777] = {
            description = "Okay, here you go.\n\nI'm going to be over here... behind cover.\n\nFeel free " ..
                "to join me.",
        },
        [781] = {
            description = "After carefully evaluating the map, you realize that what you discovered are " ..
                "the plans made by the Bristleback warchief for an extended siege on Camp " ..
                "Narache.\n\nSurely Chief Hawkwind could use this information!",
            rewardItems = {{4911, 1}},
        },
        [783] = {
            description = "I hope you strapped your belt on tight, young <class>, because there is work " ..
                "to do here in Northshire.\n\nAnd I don't mean farming.\n\nThe Stormwind guards are hard " ..
                "pressed to keep the peace here, with so many of us in distant lands and so many threats " ..
                "pressing close. And so we're enlisting the aid of anyone willing to defend their home. " ..
                "And their alliance.\n\nIf you're here to answer the call, then speak with my superior, " ..
                "Marshal McBride. He's inside the abbey behind me.",
        },
        [809] = {
            description = "Since the last great war when the Burning Legion was defeated, I have searched " ..
                "for sources of demonic corruption in orc society. The collar you brought me confirms my " ..
                "fears.\n\nIt belongs to the Burning Blade, a cult that rallies around an item of demonic " ..
                "power. It is called the Demon Seed, and it resides in the Barrens atop Dreadmist Peak. " ..
                "It must be destroyed!\n\nGo to Far Watch Post, on the border of the Barrens to the west, " ..
                "and speak with my assistant, Ak'Zeloth. He will direct you further.",
        },
        [824] = {
            description = "The Earthen Ring is a shamanistic group dedicated to studying and preserving " ..
                "the elements. They have forgotten more about crazy old gods, ancient legends and lore " ..
                "than most scholars will ever know.\n\nLucky for you, I know someone in the Earthen Ring " ..
                "here in Ashenvale. Head over to Zoram'gar Outpost on the coast of the Zoram Strand; show " ..
                "Je'neu Sancrea what you found. If anyone can figure out that globe's significance, it'd " ..
                "be him.",
            rewardChoices = {{16659, 1}, {16660, 1}, {16661, 1}},
        },
        [845] = {
            description = "The zhevra, although not the fiercest beast in the Barrens, are a shade " ..
                "tougher than the plainstriders. Don't worry -- we'll send you against bigger prey in " ..
                "good time, but for now your teeth could use a little more cutting.\n\nHunt the zhevra to " ..
                "the north and south, and collect their hooves. Bring them to me and perhaps we'll next " ..
                "send you against something tougher.",
            rewardMoney = 600,
        },
        [851] = {
            description = "The centaur Verog the Dervish wanders the Barrens, and will be difficult to " ..
                "find. But he is based at the centaur command tent at the Stagnant Oasis to the " ..
                "southeast. It may be possible to draw him to you.\n\nTravel to the Stagnant Oasis to the " ..
                "southeast and attack centaur near the command tent. It will be dangerous, but if you can " ..
                "kill enough centaur then they should raise an alarm. And Verog will come.\n\nBring me " ..
                "his head and I will place it with Barak Kodobane's.",
            rewardMoney = 1000,
        },
        [881] = {
            description = "Whitemist, Echeyakee in the Tauren tongue, is the king of the savannah cats. " ..
                "He hunts with such stealth, they say he's like a thin, white mist on the earth. And he " ..
                "kills so fast his prey have no time for fear, or pain.\n\nThe Tauren say he is both " ..
                "mercy and death.\n\nYou will learn if that's true, for I now set you on the path to hunt " ..
                "Echeyakee. His lair is northeast of the Crossroads, among the bones of giant Kodo\n\nGo. " ..
                "Blow this horn when you reach his lair. Blow the horn, and he will come.",
        },
        [891] = {
            description = "Yet another ship from my fleet has been lost to those overzealous humans at " ..
                "Northwatch Hold!\n\nThose bastards must be dealt with. Their paranoia has them in a " ..
                "state of frenzy. Trigger happy, reckless louts are shooting at anything in their " ..
                "sights.\n\nTravel south along the Merchant Coast to the Hold and lay siege to their " ..
                "forces. Bring me the medals of their soldiers as proof. And for the love of my fleet, " ..
                "slay Captain Fairmount and her overzealous cannoneers!",
            rewardChoices = {{5309, 1}, {5310, 1}},
        },
        [896] = {
            description = "Being Wharfmaster of a busy port like Ratchet, I keep my finger on the pulse " ..
                "of information. I know all about the exchange of goods and money between here and Booty " ..
                "Bay.\n\nThe latest bit of news I've heard is about the Venture Company's Boulder Lode " ..
                "mine northeast of the Sludge Fen. One of the miners discovered an emerald the size of " ..
                "your fist. I know a few buyers who'd be interested in getting their hands on something " ..
                "like that, and I'd be willing to go half and half on its sale.",
            rewardItems = {{5335, 1}},
        },
        [902] = {
            description = "Pulling open the face of the control console reveals a dense jumble of wires, " ..
                "tubing and other strange mechanical objects--most of which seem to serve no practical " ..
                "purpose. Pushing them aside and digging deeper into the console, you find the " ..
                "samophlange. A tug removes it from its housing.",
            rewardChoices = {{5324, 1}, {5325, 1}},
        },
        [926] = {rewardItems = {{4986, 1}}},
        [932] = {
            description = "I must warn you, <name>, this matter must stay between us. The satyr are " ..
                "enough of an embarrassment to us already, and this one is much too close to home.\n\nHe " ..
                "is called Lord Melenas. He resides in the nearby cave of Fel Rock where he has gathered " ..
                "a large group of grell warriors. His heart is black as night, and he plots something " ..
                "most foul.\n\nYou must find him within his nearby cave just to the north of here, and " ..
                "bring me his head.",
            rewardChoices = {{5419, 1}, {2571, 1}},
        },
        [952] = {
            description = "If you had enough time to run messages for the Oracle Tree, then I'm sure that " ..
                "I can press you into service to deliver a message to the Grove of the Ancients in " ..
                "Darkshore, due south of Auberdine.\n\nYou will most likely have to secure transport on a " ..
                "hippogryph, but I have faith enough in you that you can manage that. Take this to Onu, " ..
                "the Ancient of Lore. He has been awaiting word from me, even as I waited for news from " ..
                "the Oracle Glade.",
        },
        [960] = {rewardItems = {{5251, 1}}},
        [969] = {
            description = "Ah, I can tell just by lookin' at ya -- you be wantin' to make a lucky charm. " ..
                "Mau'ari always knows!\n\nTo da south. you'll find a canyon, an' giants made a' solid " ..
                "ice. The giants sometimes be carryin' dem, but ya can always gather da shards yerself " ..
                "from da canyon. These shards have a powerful reflective quality.\n\nBring back 10 " ..
                "frostmaul shards, and my lucky charm will be yours.",
            rewardMoney = 9000,
        },
        [970] = {
            description = "Balthule's letter is dire. This Cult of the Dark Strand is a thorn in my side " ..
                "that must be removed. I have been dealing with some of the Dark Strand scum northeast of " ..
                "here at Ordil'Aran. One of their number possesses a soul gem that I believe holds the " ..
                "secret to the cult's power.\n\nBring it to me, and I will be able to decipher the " ..
                "secrets held within.",
        },
        [973] = {
            description = "Ilkrud Magthrull. Yes, I have knowledge of him. He is a powerful orc warlock " ..
                "that makes his residence at the Fire Scar Shrine, a place of great evil in southwestern " ..
                "Ashenvale.\n\nHe had been little more than an annoyance until now, and I had not dealt " ..
                "with him, but it seems that his time has come.",
            rewardChoices = {{5622, 1}, {5613, 1}},
        },
        [975] = {
            description = "Now, before I give ya dis charm, I better explain how ta use it.\n\nIf you " ..
                "carry da charm with ya, you'll find dat certain items will drop from creatures ya fight. " ..
                "If you don't have da charm with you, you won't find them. Understand?\n\nYou'll know " ..
                "these special items by the name -- they be called E'ko. If you find any of these items, " ..
                "just bring dem to ol' Mau'ari, and she help ya out.\n\nWait here while I fix your charm.",
            rewardItems = {{12384, 1}},
        },
        [976] = {
            description = "Delgren has asked me to deliver messages and supplies to Sentinel Starbreeze " ..
                "in Auberdine, but I am loathe to leave on my own. Dangerous foes operate in the forest, " ..
                "and I do not wish to risk letting these supplies and information fall into the wrong " ..
                "hands.\n\nIf you and others could act as my guards, I could leave now. With your " ..
                "protection, I have no doubt that we can see these goods safely to Auberdine.",
            rewardChoices = {{5323, 1}, {6721, 1}},
            rewardMoney = 5000,
        },
        [991] = {
            description = "<name>, a longtime friend of mine is also aiding the Sentinels here in " ..
                "Ashenvale, but he has yet to return.\n\nHe had leads on finding an item that he thought " ..
                "could slow the furbolg attacks on our people--a rod created by a now-dead, evil " ..
                "wizard.\n\nBefore he left here, he mentioned seeking out a gem for the rod.\n\nHe " ..
                "mentioned the gem possibly being hidden at the shrine in Lake Falathim at the base of " ..
                "the mountain to the west. The gem was being held there before it was overrun.\n\nFind my " ..
                "friend, <name>, please.",
        },
        [1000] = {
            description = "Attention, heroes!\n\nThe Cenarion Circle seeks able bodied individuals to " ..
                "assist them in exploring the vast new frontiers of Kalimdor! A forbidden wasteland of " ..
                "unimaginable dangers lies far to the west of Tanaris and Gadgetzan, and the Circle needs " ..
                "willing and honorable proxies to act in their stead.\n\nAll interested individuals " ..
                "should seek audience with the Cenarion Circle. Speak with the Arch Druid Hamuul " ..
                "Runetotem on the Elder's Rise of Thunder Bluff for more information!",
        },
        [1001] = {
            description = "A tiny voice crackles from deep within the machine.\n\n\"Wizbang here! The " ..
                "next Buzzbox is north of Auberdine, on the beach\n\nSo, that Buzzbox is number 411 and " ..
                "it needs 3 Thresher Eyes for its repairs. They're just off the coast! The darkshore " ..
                "threshers... *Hic*... Sorry about that...\n\nJust like last time, when you give the " ..
                "Buzzbox the goods, it'll spit out your reward. *Hic*... What? No, I'm fine!\"",
            rewardMoney = 1000,
        },
        [1003] = {
            description = "Over the boiling noises and dripping sounds coming from the machine, you hear " ..
                "Wizbang's wavering voice call out.\n\n\"Nexsht onesh far south down the road. Shouldn't " ..
                "be hard to find... jusht off to the shide... near a fensh. I think I hid it in shum " ..
                "bushesh... Bushessh. Hehehe... Yesh, Buzzbox 525 takes grizzled scalps from thoshe " ..
                "grizzled thistle bears. Boy thash a mouthful. Grizzshled... Hehehe...\"\n\nYou hear more " ..
                "gulping sounds as the machine cuts out. Then, suddenly, it bursts back to life.\n\n\"4!\"",
            rewardItems = {{2082, 1}, {11846, 5}},
            rewardMoney = 800,
        },
        [1007] = {
            description = "I would charge you with a task, <name>.\n\nI was on my small vessel, skimming " ..
                "over the submerged ruins of Zoram, when naga attacked me, surging from the water and " ..
                "tearing at me with their claws! I fled, carrying what supplies I could to make this " ..
                "meager camp.\n\nBut when I reached the shore and ran... my prized possession was " ..
                "lost.\n\nPlease, <name>, find the site of my ambush, along the coast to the north, and " ..
                "search for an ancient statuette. It is the reason I have braved the dangers of the Zoram " ..
                "Strand.",
            rewardMoney = 900,
        },
        [1008] = {
            description = "There is evil lurking on our northwestern coast, known as the Zoram " ..
                "Strand.\n\nIt is the resting place of the doomed city of Zoram, destroyed during the " ..
                "Sundering and submerged beneath the seas. It has been lost to the night elves for ages. " ..
                "Lost, and nearly forgotten.\n\nNow, the naga have returned, and for what reason we do " ..
                "not know. But reason matters little; we must slay these fiends and throw them back to " ..
                "the depths!\n\nReturn to me when your mission is complete.",
            rewardMoney = 1100,
        },
        [1009] = {
            description = "I fear the ancient statuette's secrets will remain forever hidden unless you " ..
                "find the key to its ancient lock.\n\nThat key is a ring, the Ring of Zoram. It belonged " ..
                "to the rulers of this city before the waves of the Sundering drowned it.\n\nFor years " ..
                "the ring was lost, but the naga have recently found it.\n\nTheir leader, Ruuzel, dwells " ..
                "on an isle on the northern edge of Zoram. Please, <name>, retrieve the ring for me!",
            rewardItems = {{5812, 1}},
        },
        [1010] = {
            description = "There is a plant that once grew in the old ruins of Bathran's Haunt to the " ..
                "north. The plant was called Bathran's Hair and was known to cure ailments of the " ..
                "spirit.\n\nThere is a sick child in the village, and I believe it is more than just a " ..
                "physical illness. Will you go to Bathran's Haunt and search it for Bathran's Hair? I may " ..
                "need it to properly treat the child.\n\nBathran's Haunt lies north of Maestra's Post and " ..
                "just south of the border to Darkshore.",
        },
        [1011] = {
            description = "The Forsaken, the undead arm of the Horde, have crept into Ashenvale, lurking " ..
                "at our ruins and our barrows. We believe their goal is to spread disease amongst the " ..
                "lands of the night elves. We must confirm this!\n\nThe Forsaken have a camp south of " ..
                "here, near the Dor'Danil Barrow Den, where they create poisons and diseases and place " ..
                "them in bottles. Fight your way into that camp and steal a bottle of disease. Return " ..
                "with such a bottle. I will test it and find its purpose.",
        },
        [1012] = {
            description = "When I struggled with the Forsaken's poisons, I had a vision. I had a vision " ..
                "of the druids in the Dor'danil Barrow Den, poisoned... murdered by the undead! They are " ..
                "now errant ghosts, severed from their bodies and driven mad.\n\nSo that the druids' " ..
                "spirits might some day find peace, you must enter the Dor'danil Barrow Den and destroy " ..
                "its once great leaders: Taneel Darkwood, Uthil Mooncall and Mavoris Cloudsbreak.\n\nDo " ..
                "this, then return to me.",
            rewardItems = {{5813, 1}},
        },
        [1014] = {
            description = "Arugal still resides in Shadowfang Keep. We cannot claim Silverpine as a " ..
                "strategic stronghold for the Dark Lady until Arugal is slain.\n\nI shall see to it that " ..
                "his magic is eradicated, <name>. But I leave it in your hands to see that Arugal meets " ..
                "the death he so deserves.\n\nTravel to Shadowfang Keep and put an end to Arugal's foul " ..
                "spells once and for all. Bring to me the vile wizard's head!",
            rewardItems = {{6414, 1}},
        },
        [1016] = {
            description = "Take this divining scroll --it can determine the creator of these elementals. " ..
                "But you will need something from them to use as a reagent to focus scroll's magic--their " ..
                "bracers should do nicely.\n\nA few intact bracers from the creatures should be enough. " ..
                "The other bracers will be useless for our purposes, but they may be worth something to a " ..
                "merchant if you wish to sell them. Once you have the intact bracers attempt to use the " ..
                "scroll. Return to me with the results and we shall proceed from there.",
        },
        [1017] = {
            description = "There's only one undead mage in the Barrens capable of defiling this many " ..
                "water elementals. He's also the only one foolish enough to try. Sarilus Foulborne is " ..
                "probably sitting at the top of Dreadmist Peak, laughing at me.\n\n<name>, you must go " ..
                "into enemy territory and destroy this miscreant. I have had enough of his idiocy and we " ..
                "must show him what happens to those who annoy the Sentinels.\n\nDestroy him and bring me " ..
                "his head. Be wary though, the Horde may be watching for you.",
            rewardItems = {{5816, 1}},
        },
        [1020] = {
            description = "<name>, I have created a cure that I believe will help the afflicted child. " ..
                "Take it to Astranaar and give it to the child's parent, Pelturas Whitemoon.\n\nTo reach " ..
                "Astranaar, follow the road south, then east.",
            rewardMoney = 2500,
        },
        [1021] = {
            description = "Listen, I don't know who you are, but I need your help. My sisters went to " ..
                "take back the Branch of Cenarius from the satyr. They said they'd be back soon, but it's " ..
                "been two whole days!\n\n<name>, you have to find them! They were looking for the ruins " ..
                "of a night elf temple in Xavian to the northeast. I don't know what to think. Look for " ..
                "Anilia, she was leading them on the search.",
        },
        [1022] = {
            description = "Though we have put many resources and much effort into driving the remaining " ..
                "demons from the Felwood to the north, our successes have been few. We have been able to " ..
                "keep much of the demonic presence from Ashenvale.\n\nTo the north, near the Felwood " ..
                "border, the ruined shrine of Mel'Thandris has been overtaken by mysterious wolf-men. " ..
                "Their chilling calls have led the area to be known as the Howling Vale. The Tome of " ..
                "Mel'Thandris kept at the shrine may shed some light on why these wolf-men have come.",
            rewardMoney = 2500,
        },
        [1023] = {
            description = "As you rummage through Teronis' belongings, you find a journal that is still " ..
                "in good condition.\n\nYou take the journal and leave Teronis' corpse as is.\n\nThe only " ..
                "thing left to do is find the gem Teronis was seeking. Raene mentioned it being in the " ..
                "area. Perhaps the murlocs have it...",
        },
        [1024] = {
            description = "You'll have to do the research yourself, but from what notes Teronis has made, " ..
                "it sounds like your next course of action is to find the other pieces of the rod Dartol " ..
                "created. I would start by heading to the moonwell east of Iris Lake. When you're ready, " ..
                "follow the road and turn north when you reach a small sitting area on your left.\n\nA " ..
                "dryad there named Shael'dryn is better suited to guide you. Seek her out.\n\nKeep the " ..
                "gem with you-- Shael'dryn will need it if she's to help you recreate the rod.",
        },
        [1025] = {
            description = "Before you travel to the moonwell I have another task that will aid the people " ..
                "of Ashenvale if you would like to test your skills.\n\nAlong the road heading east " ..
                "before the Falfarren River, furbolgs have been attacking travelers. Their tortured minds " ..
                "feeding upon fear, and their appetites satiated by the blood of innocents.\n\nAid the " ..
                "Sentinels in protecting the lands by showing those monsters the same mercy they have " ..
                "shown our kind.\n\nI believe their camps are south of the road... be careful.",
            rewardItems = {{4542, 10}, {1205, 10}},
            rewardMoney = 1700,
        },
        [1026] = {
            description = "I wish your tidings were better.\n\nRaene is correct, I know about Dartol's " ..
                "creation and the treants in the area--at least I did once. They've become corrupted now, " ..
                "their nature twisted.\n\nIf your goal is to find the next piece of the rod, then you'll " ..
                "have to find the key to open the chest it's in.\n\nThe wooden key is on one of the " ..
                "treants northeast of here, near Felwood. Once you have it, look for a small glade west " ..
                "of the road near the Felwood border... the chest should be hidden around there.",
        },
        [1027] = {
            description = "The final piece of the rod was given to the druids of Dor'danil for " ..
                "safekeeping. I have no idea where they hid it. I'm sorry I can't help you more than " ..
                "that.\n\nAll I can tell you is to follow the road that leads towards the Barrens. The " ..
                "druids took shelter to the east of that road, but they won't be of much help to you: " ..
                "they were killed recently... it's something I don't like to think about much.\n\nWhen " ..
                "you find the final piece, bring it to me and I will help you reconstruct the rod.",
        },
        [1028] = {
            description = "Here is the completed rod, <name>. Reconstructing it was simple... it's " ..
                "finding the shrine that has the power to recharge it that will be the hard part.\n\nWith " ..
                "some focus and effort it shouldn't be too hard for someone like you, who's already " ..
                "accomplished so much.\n\nHead southeast of here--there are very few paths, so be " ..
                "careful--and keep your eyes to the north. The shrine is hidden within the mountains that " ..
                "surround this glade.\n\nOnce there, place the rod within the shrine... the rest is " ..
                "magic. Hehe.",
            rewardItems = {{5462, 1}},
        },
        [1029] = {
            description = "I suggest you find Raene and let her know the rod is finished. I'm sure she'll " ..
                "know what your next course should be.\n\nGood luck, <name>.",
        },
        [1030] = {
            description = "Alas, I'm not completely certain what he had in mind next.\n\nIf what he said " ..
                "was true about the rod's power, then it will allow you to take on another form " ..
                "altogether. Which form, I do not know.\n\nPerhaps he meant to use its powers to get " ..
                "closer to the tainted furbolgs, but even the uncorrupted creatures would slaughter him " ..
                "were he not careful. Transformed by the rod, Dartol would have to speak to a furbolg who " ..
                "was safe from the effects of Fel Moss.\n\nI would start your search southeast of Mystral " ..
                "Lake.",
        },
        [1031] = {
            description = "Anilia puts her hands on your shoulders and draws you close. Gasping, she " ..
                "points towards the arch to the north, before her eyes close and her last wheezing breath " ..
                "leaves her body. \"He has taken it... Geltharis...\" You know in your heart that Anilia " ..
                "'s dying wish is to see the Branch of Cenarius back in dryad hands.",
            rewardChoices = {{5820, 1}, {11229, 1}},
        },
        [1032] = {
            description = "I can't believe that Anilia is gone... We used to play together in the forests " ..
                "all the time. I almost feel... sad.\n\nI know something that might make me feel better. " ..
                "Please, slay the satyrs that took Anilia from me! Bring me their horns as proof of your " ..
                "actions and you will forever have my gratitude.",
            rewardMoney = 3000,
        },
        [1033] = {
            description = "I had hoped Orendil's cure would save Relara, but I fear it only slowed the " ..
                "disease running through my child. We must find more powerful medicine! Thankfully, " ..
                "Orendil spoke to me of further remedies to try should his first one fail.\n\nElune's " ..
                "Tear is a type of stone that rests in only one place: the isle on Iris Lake, east of " ..
                "Astranaar. Orendil said the stone will wash away corruption... please, <name>, bring me " ..
                "Elune's Tear and pray it will end my child's sickness!",
            rewardMoney = 1400,
        },
        [1034] = {
            description = "Elune's Tear washed clear some of my daughter's sickness. Her nightmares are " ..
                "lessened and I thank the goddess for her blessing. But... fever still rages within " ..
                "her.\n\nOrendil told me of a frosted dust found among the Ruins of Stardust. Perhaps it " ..
                "will abate Relara's fever. Gather some of the dust, then please return to me.\n\nThe " ..
                "Ruins of Stardust lie to the south, <name>. May Elune speed your journey.",
            rewardMoney = 1500,
        },
        [1035] = {
            description = "Relara's fever has passed, but she is still very weak. I do not believe time " ..
                "alone will give her back the strength she has lost. I believe it will take the power of " ..
                "a moonstone.\n\nWe used to gather moonstones at Fallen Sky Lake to the southeast... " ..
                "until the Shadethickets came.\n\nTheir leader, a Shadethicket Oracle, gathered up all " ..
                "the fallen moonstones and hoards them. Now, you must retrieve a moonstone from the " ..
                "Oracle.\n\nAnd to do that, I fear that you must slay him.",
            rewardChoices = {{5814, 1}, {6722, 1}, {17047, 1}},
        },
        [1036] = {
            description = "<name>... yeah, I've heard of you. I've heard that you're no friend of Booty " ..
                "Bay - just like us Bloodsail Buccaneers. Fleet Master Firallon is looking for hale and " ..
                "hearty <men/women> just like you for a special mission.\n\nIf you're interested, head on " ..
                "out to the Crimson Veil and speak with him below decks. She's anchored off the Wild " ..
                "Coast east of here, next to the Riptide and the Damsel's Luck.",
        },
        [1037] = {
            description = "Velinde Starsong was my predecessor here in Ashenvale Forest. At first it " ..
                "seemed she had the situation in Felwood under control, but little by little her efforts " ..
                "faltered. One day, she simply disappeared.\n\nI was sent here to continue her work. I'm " ..
                "afraid I know nothing of the priestess, however. Perhaps Thyn'tel Bladeweaver, one of " ..
                "the commanders of the Sentinels, knows further details of her disappearance that I was " ..
                "not a party to.\n\nSurely she will understand the import of such information.",
        },
        [1045] = {
            description = "The night elves are as old as time, but their arrogance destroys their very " ..
                "world. And now it destroys our lives too. But that can no longer be controlled...\n\nI " ..
                "blame the elves for much, but we are still responsible for our actions. Even beyond the " ..
                "corruption, we are capable of great evil.\n\nRan Bloodtooth is one such evil. Power " ..
                "hungry, lusting... the corruption has only made him stronger. My hatred for the elves " ..
                "burns, but I do not wish ill upon their children, so we must police our own.",
        },
        [1046] = {
            description = "Return to your own tribe and let them know of your victory here.\n\nShow them " ..
                "your trophy, and bask in the glory...",
            rewardChoices = {{5815, 1}, {17046, 1}},
            rewardItems = {{1116, 1}},
        },
        [1047] = {
            description = "Attention, heroes!\n\nThe Cenarion Circle seeks able bodied individuals to " ..
                "assist them in exploring the vast new frontiers of Kalimdor! A forbidden wasteland of " ..
                "unimaginable dangers lies far to the west of Tanaris and Gadgetzan, and the Circle needs " ..
                "willing and honorable proxies to act in their stead.\n\nAll interested individuals " ..
                "should seek audience with the Cenarion Circle. Speak with the Arch Druid in Darnassus, " ..
                "Fandral Staghelm, for more information!",
        },
        [1052] = {
            description = "We of the Scarlet Crusade lay claim to strongholds from Hearthglen to Tirisfal " ..
                "Glades. We are quite proud of our bastions of cleansing throughout Lordaeron.\n\nYou " ..
                "have proven yourself against the undead in Desolace. But the true threat of the plague " ..
                "lies in Lordaeron.\n\nTravel to the town of Southshore, in the Eastern Kingdoms. Seek " ..
                "out a crusader named Raleigh the Devout. Give him this letter of commendation bearing my " ..
                "seal and he will escort you to a place of honor in our Scarlet Monastery.",
        },
        [1053] = {
            description = "I once served the Scarlet Crusade with honor, loyalty and pride. I believed " ..
                "their cause to be a noble one: to rid Azeroth of the undead.\n\nBut as I spent time at " ..
                "the Monastery in Tirisfal Glades I realized that their grasp on reality was slipping. " ..
                "They now think everyone is plagued who doesn't wear the tabard of the Crusade. Innocent " ..
                "men and women were tortured because they were supposedly plagued.\n\nThe Scarlet Crusade " ..
                "must be crushed in the name of the Light. You, <name>, must destroy the deranged regime.",
            rewardChoices = {{6829, 1}, {6830, 1}, {6831, 1}, {11262, 1}},
        },
        [1054] = {
            description = "Directly to the north of Astranaar are the Thistlefur furbolg. My scouts " ..
                "report that their numbers have grown greatly over the past few months. If they grow too " ..
                "great, they may find the courage to attack Astranaar directly.\n\nKill as many of their " ..
                "kind as you can, but bring me their chieftain's skull as proof that their efforts have " ..
                "been stifled... for now.\n\nI shall remain here in Astranaar and await word from you. " ..
                "Elune be with you.",
            rewardItems = {{1970, 2}},
            rewardMoney = 1800,
        },
        [1055] = {
            description = "The rod, now complete, lies in your hands. Shael'dryn will want to hear of " ..
                "your success.",
        },
        [1056] = {
            description = "The forest spirits tell me you are brave and willing to travel.\n\nTo the " ..
                "south, not far from Mystral Lake, there lies a tunnel named The Talondeep Path. Through " ..
                "this tunnel you will come to an area known as Windshear Crag in the Stonetalon " ..
                "Mountains. Once there, journey to the southwest past Cragpool Lake and then north, up " ..
                "the steep slope until you reach Stonetalon Peak.\n\nThere awaits Keeper Albagorm. Heed " ..
                "his bidding, <race>.\n\nThe journey will be perilous.",
        },
        [1063] = {
            description = "To truly tend the spirits of Stonetalon we must consult the tauren " ..
                "elders.\n\nI do not know many of their leaders' names, but I do know of one: Magatha. I " ..
                "have heard that she is very old, and she knows much. If anyone can marshal spiritual aid " ..
                "from the tauren, it is she.\n\nMagatha resides in the tauren capital of Thunder Bluff, " ..
                "on Elder Rise -- the city's northeastern bluff. Speak with Magatha, and tell her of the " ..
                "peril of Stonetalon Mountains.",
        },
        [1066] = {
            description = "I will create a toxin to bleed the violence from the Venture Company, " ..
                "rendering them weak and docile. That should fix the Horde's problem in Stonetalon, " ..
                "yes?\n\nBut to create the toxin, I will need the blood of innocents, a difficult " ..
                "ingredient to obtain.\n\nFortunately the Syndicate, a group of human brigands in this " ..
                "area, employ shadow mages... and those mages collect innocent blood for their own, " ..
                "unsavory purposes.\n\nYou can find the Syndicate shadow mages in Durnholde Keep to the " ..
                "southeast.",
        },
        [1067] = {
            description = "Here is the toxin. If you use it against the Venture Company it should produce " ..
                "favorable, perhaps even contagious, results. I must say, it is quite exciting to see my " ..
                "work applied in the field!\n\nBut before using it, take it to Apothecary Zamah. She must " ..
                "create a delivery method for the toxin to maximize its effect.",
        },
        [1070] = {
            description = "Hello, <name>.\n\nYou seem to be full of wanderlust by the looks of you. Have " ..
                "you been to the Stonetalon Mountains? It is a land plagued by the Venture Co. and other " ..
                "enemies of the night elves.\n\nRecently, Sentinel Wolfrunner sent my friend Kaela " ..
                "Shadowspear there to investigate what's happening to the land, but I have yet to hear " ..
                "word back from her. I'm even more concerned because the Alliance sent a gnome mage along " ..
                "with her... a sign of trouble for sure.\n\nWould you find her and report back to me?",
        },
        [1075] = {
            description = "Okay, now for the remote detonation part of my plan... oh, I haven't explained " ..
                "that yet, have I?\n\nOkay, so the short of it is this: with a little magic, I can make " ..
                "it so the explosives go off while you're not around. I'm putting together a device " ..
                "that'll allow you to push just one button and have the NG-5 explode when you're " ..
                "ready.\n\nBut I need a spell from a friend in Stormwind-- Collin Mauren is his name. You " ..
                "can find him in the mage quarter there. He's human, so he shouldn't be hard to miss.",
        },
        [1081] = {
            description = "<name>, I am sure Tyrande Whisperwind herself would like to thank you for " ..
                "taking part in this mission.\n\nIt may not appear so on the surface, but what you've " ..
                "helped start could very well strengthen our foothold in the Stonetalon Mountains.\n\nIf " ..
                "you consider yourself our ally against these atrocities, go see Tyrande in the Temple of " ..
                "the Moon in Darnassus.",
            rewardChoices = {{7334, 1}, {7335, 1}, {7336, 1}},
            rewardItems = {{6678, 1}},
        },
        [1086] = {
            description = "The toxin is ready. All that remains is its delivery. You, <name>, must make " ..
                "that delivery.\n\nThe Venture Company must have a means of sending messages and light " ..
                "cargo between its headquarters and its operations in Stonetalon. It is likely a small " ..
                "sky port -- not big enough for a zeppelin, but perhaps for a flying machine. You must " ..
                "search the areas in Stonetalon under control of the Venture Company and find this sky " ..
                "port, if it exists. If you find it, then place the toxin there.\n\nPlace it, and run.",
            rewardMoney = 3000,
        },
        [1106] = {
            description = "I'm developing a new engine that'll make the car go so fast! Fast enough to " ..
                "fly, I know it! I just need to make pistons that can handle very very heavy stress. All " ..
                "my trials have failed because I can't make pistons hard enough!\n\nBut there is someone " ..
                "who might know how.\n\nHis name is Martek the Exiled. He is a great smith and knows more " ..
                "about metal than anyone. Take him this letter, I know he can help!\n\nBut he's far far " ..
                "away -- in Azeroth, in the Badlands, in a camp, with a goblin!\n\nFind him!",
        },
        [1123] = {
            description = "For this task, Keeper Remulos' majordomo in Moonglade - Rabine Saturna - seeks " ..
                "aid in exploring the vast wastelands far to the west of Tanaris and Un'Goro. He is " ..
                "located in Nighthaven, the main village of Moonglade.\n\nI want to impart on you the " ..
                "importance of your presence. There are growing tensions between the night elves of " ..
                "Darnassus and the Cenarion Circle in Moonglade. Look beyond racial boundaries and tap " ..
                "into the wisdom of your ancestors in dealings with the Circle there, <name>. Good luck.",
        },
        [1126] = {
            description = "The hive needs to be addressed in Southwind Village, and I think I know a way " ..
                "to get at them. It's been my experience that the silithid hives are very sensitive to " ..
                "their environment; this explains their attacks when hearing the death wails of the " ..
                "spirits.\n\nThe silithid are strongest in the tower - the one with the mass of wasps " ..
                "circling it. Scale the tower and jostle the hive into activity. Report back what you " ..
                "learn, but be careful! If you uncover anything that might help, bring it to me.",
        },
        [1130] = {
            description = "<name>, Melor Stonehoof has heard of your deeds, and has set a path before " ..
                "you.\n\nIf you wish to take it, then go to Thunder Bluff and speak with Melor. You will " ..
                "find him on Hunter's Rise.",
        },
        [1131] = {
            description = "At times we hunt for food. At times we hunt for honor. And at times we hunt to " ..
                "earn the Earthmother's teachings.\n\nBut the hunt I now set upon you is none of these " ..
                "things. It is to slay a creature outside the Earthmother's blessing.\n\nThe hyena " ..
                "Steelsnap roams the Thousand Needles, south of the Barrens. He is a tyrant, attracting " ..
                "other hyenas to him and spreading fear and bloodshed among more peaceful beasts.\n\nFind " ..
                "Steelsnap, <name>. Find him, and defeat him.",
        },
        [1134] = {
            description = "We are not in open war with the Horde, but our peace is fragile. We often find " ..
                "their agents moving against us, but they do so covertly.\n\nOne such advance was " ..
                "revealed to us from hidden sources in Theramore, claiming that the orcs collect venom " ..
                "from the pridewings near Mirkfallon Lake, in the Stonetalon Mountains to the south. Orc " ..
                "assassins then use the venom on their secret death raids against the Alliance!\n\nIf " ..
                "this is true, then we must stop them, <name>. We must deny them their source of venom.",
            rewardMoney = 1300,
        },
        [1136] = {
            description = "<name>, it is now time for you to travel to far-off lands. You are " ..
                "ready.\n\nYou now hunt Frostmaw, a yeti in the Alterac Mountains. He is elusive, his " ..
                "white coat blending into the snows of his mountain home. He rarely shows himself.\n\nBut " ..
                "I will show you how to entice a creature such as he. Here, take this scroll. On it I " ..
                "have written how Frostmaw may be lured.\n\nNow go, <name>. Your journey is long and many " ..
                "challenges lay waiting. When you return with Frostmaw's mane, only then is your task " ..
                "complete.",
            rewardItems = {{6720, 1}},
        },
        [1140] = {
            description = "The writing of the orcs is little better than the scribblings of a child. Many " ..
                "of my order scoffed when I chose to learn their tongue, but I have found it beneficial " ..
                "to gain further understanding of my enemies.\n\nFrom Ilkrud's scribblings, it appears " ..
                "that Athrikus still possesses two soulgems, and they are being held in Night Run and " ..
                "Satyrnaar, satyr-held areas in northeast Ashenvale.\n\nBe careful out there, <name>, the " ..
                "satyrs' blood-soaked temples can be unsettling even for a seasoned <class> such as " ..
                "yourself.",
        },
        [1152] = {
            description = "Your time with me is just about finished. I am knowledgeable, but the Test of " ..
                "Lore is not mine to give. There are lessons to be learned and places to visit that " ..
                "others claim domain over.\n\nIf you are prepared, then seek out Braug Dimspirit --he is " ..
                "a shaman of great wisdom. He will test you further, so heed his words, <name>.\n\nWhen " ..
                "you are ready, find the tunnel that connects the Stonetalon Mountains with Ashenvale: " ..
                "Braug dwells near there. And be careful, <name>, the night elves may wish to impede your " ..
                "test.",
        },
        [1160] = {
            description = "I will tell you what you must seek, and I will even ask you my question, but " ..
                "not because you wish to prove yourself. Knowledge is far more important than strength. " ..
                "Even as others seem to pass you by in ability, your knowledge of the world will be more " ..
                "valuable.\n\nGo to the Monastery in the north of Tirisfal Glades. In the library there, " ..
                "a book called Beginnings of the Undead Threat resides. It was used by the now-corrupt " ..
                "paladins there to train them to fight my kind.\n\nBring it to me.",
        },
        [1167] = {
            description = "Before confronting Athrikus, it would probably be wise for you to consult with " ..
                "Balthule. I have no doubt he has been vigilant in his watch of the Tower, and he may " ..
                "have information about recent developments.",
        },
        [1178] = {
            description = "Our racing team is the pride of goblins everywhere. You'd be surprised at some " ..
                "of the people who contribute in one way or another to our team.\n\nYou know Gazlowe? He " ..
                "tracks down parts from around the world for us. He even came down to work on one of our " ..
                "rigs once!\n\nA few weeks ago, he said he'd send us a new prototype fuel regulator but " ..
                "it hasn't come yet. He's usually very prompt... Maybe you wouldn't mind going to Ratchet " ..
                "to ask him about it? I wouldn't be so pushy, but the gnomes are gaining on us!",
        },
        [1188] = {
            description = "But wait, what's this? Shreev left the safety on. That will limit the amount " ..
                "of power I can draw from the booster at any time. I told him I wanted it off! This is no " ..
                "good.\n\nYou have to take this to the Gadgetzan Gizmorium in the Tanaris Desert and have " ..
                "Shreev remove this.",
        },
        [1195] = {
            description = "The Galak centaur in the Thousand Needles are protecting an artifact from the " ..
                "time of the centaurs' creation.\n\nWe would like to retrieve it, but we require a phial " ..
                "of water from one of the night elves' moonwells.\n\nTo collect the water, you will first " ..
                "need to obtain one of the phials carried by the dryads near the Raynewood Retreat in the " ..
                "heart of Ashenvale Forest. There is a moonwell near the western bank of the Falfarren " ..
                "River, south of the main road, where you can fill the phial.",
            rewardMoney = 3500,
        },
        [1196] = {
            description = "Bring the filled phial to Rau Cliffrunner at the Freewind Post in southeastern " ..
                "Thousand Needles. You can get to the Thousand Needles by taking the Great Lift at the " ..
                "southern edge of the Barrens.\n\nI wouldn't be surprised if you can help us out further.",
        },
        [1197] = {
            description = "Using the water you brought, you will be able to temporarily douse the flame " ..
                "that holds the centaur relic. It will not work permanently, however, so you will have to " ..
                "be quick about it.\n\nYou will find Splithoof Crag, the centaurs' stronghold, to the " ..
                "north of here. The flame is kept in Splithoof Hold, a heavily guarded part of the " ..
                "crag.\n\nBe careful, though, the Galak centaur have great numbers here, and will be " ..
                "rather reluctant to surrender something so dear to them.",
            rewardChoices = {{6739, 1}, {6740, 1}},
        },
        [1204] = {
            description = "I'm working on a dish I call \"Mudrock Soup and Bugs.\" I still need the major " ..
                "ingredients, and... well, I don't think I'd last long trudging through Dustwallow " ..
                "Marsh!\n\nSo, <name>, can you do some hunting for me? First, I need the tongues of " ..
                "Mudrock turtles. You can find Mudrocks along the coast, mostly around the bay.\n\nBut I " ..
                "don't want just any tongues! I hear that the tongues of some Mudrocks are " ..
                "forked...\n\nThey say the forked tongues have a distinct flavor, and I want that flavor " ..
                "in my dish...",
        },
        [1221] = {
            description = "Blueleaf tubers are a delicacy around the world! But they're rare, very rare. " ..
                "The only place to find them is here in the Barrens, deep in the earth, in Razorfen " ..
                "Kraul.\n\nAnd even then, they're impossible to find unless you know just where to look! " ..
                "That's why I've trained these snufflenose gophers to find them for me. They have great " ..
                "noses and can smell a tuber from fifty paces away.\n\nIt won't be easy, but if you get " ..
                "me some tubers I'll pay you handsomely.",
            rewardItems = {{6755, 1}},
        },
        [1366] = {
            description = "Now that you scared the centaur clans, it's time to bleed them. When traveling " ..
                "Desolace, hunt centaur. I don't care which clan you hunt. Just gather ears. A hoard of " ..
                "ears.\n\nBy weakening their numbers you will weaken their resolve, and stamp out any " ..
                "thoughts of expansion.\n\nGood hunting, <name>.",
            rewardChoices = {{6780, 1}, {6784, 1}},
        },
        [1367] = {
            description = "To beat the centaur, we must use their hatred against them. We will ally with " ..
                "one of the clans and through them, we will learn how to defeat all the clans.\n\nIf you " ..
                "choose to ally with the Magram then slay their foes, the Gelkis. This will earn you " ..
                "respect among the Magram. When you earn enough, then meet with the Magram spokesman " ..
                "Warug, on the outskirts of the Magram Village, in southeast Desolace.",
        },
        [1369] = {
            description = "The Gelkis think our centaur mother, Theradras, protects us. They are stupid. " ..
                "No one protects the centaur. The Magram do not need protection! We are the " ..
                "strongest!\n\nShow the Gelkis they are stupid. Go to the cave in their village. They " ..
                "hoard crystals in that cave, the tears of Theradras. Destroy the tears and bring me the " ..
                "broken pieces!",
        },
        [1370] = {
            description = "When we are not at war, we hunt for meat. Meat gives us strength, and full " ..
                "bellies fight harder than empty ones.\n\nIt is the same with the Magram. They store " ..
                "extra meat so they may fight longer between hunts. If you raid their village to the east " ..
                "and take their stores of meat, then their strength will fail.",
            rewardChoices = {{3463, 200}, {3464, 200}, {3465, 200}},
        },
        [1371] = {
            description = "Long ago, a little gnome came to Desolace. He had horses and a cart, and the " ..
                "cart held strange things. Funny things. Things that burned different colors. Things that " ..
                "moved and weren't alive. I killed the little gnome, but before that... he made me " ..
                "laugh.\n\nI kept my favorite thing from his cart. It was a human made of wood and it " ..
                "waved at me until I hit it and broke it.\n\nI want a new one. Get me a new one!",
        },
        [1373] = {
            description = "You have more to prove, and your next task will take you far, so for now the " ..
                "Gelkis will fight the Magram without you.\n\nThe earth whispers many secrets to those " ..
                "who listen. One secret I hear is of a red crystal. It is called draenethyst, and it is " ..
                "new to our earth. It comes from a place where mountains fly, and where demons " ..
                "rule.\n\nBring me a shard of draenethyst, and it will make my magic strong! The shard is " ..
                "in a place called the Swamp of Sorrows, held by the lost one Ongeku.",
        },
        [1374] = {
            description = "The earth speaks to me, and it says that the Magram grow weak. Now it is time " ..
                "to kill their Khan!\n\nBring me the head of the Magram Khan, Jehn!",
        },
        [1375] = {
            description = "You help the Magram, and I like you. Now, kill the Khan of the Gelkis! He is " ..
                "Khan Shaka, and I want his head! I want to stare at his head and laugh at him!",
        },
        [1380] = {
            description = "<name>, you helped us against the Magram. Now, help us beat the Maraudine! " ..
                "Kill the head of their clan, Khan Hratha!\n\nTo face him, blow the Maraudine War Horn. " ..
                "It is atop a high bluff in the Valley of Spears.\n\nBut to blow the horn, you must gain " ..
                "a warhorn mouthpiece. These are rare, carried only by trusted Maraudine " ..
                "centaur.\n\nAfter the horn is blown, centaur will come. Kill them until Hratha " ..
                "appears.\n\nKhan Hratha holds the piece of... a key. Bring it to me...",
            rewardChoices = {{6773, 1}, {6774, 1}},
        },
        [1381] = {
            description = "The Gelkis Khan is dead, and now the Maraudine will fall! Kill the Maraudine " ..
                "Khan, Hratha!\n\nTo face him, blow the horn on the high bluff in the Valley of Spears. " ..
                "But to blow the horn, you need a mouthpiece. To get a mouthpiece, kill Maraudine " ..
                "centaur. Keep killing until you find a mouthpiece. Then blow the horn.\n\nDo this and " ..
                "Maraudine centaur will come to the tower. Kill them until Khan Hratha appears. Hratha " ..
                "holds the piece of a key. Give this piece to me...",
            rewardChoices = {{6788, 1}, {6789, 1}},
        },
        [1384] = {
            description = "The Kolkar centaurs think their magic is strong. They do not know magic! They " ..
                "would not know magic if it bit them!\n\nYou will show them their magic is weak. Go to " ..
                "the Kolkar to the northeast and kill them. Take their charms. Bring me the charms and I " ..
                "will throw them in the fire and laugh!",
        },
        [1385] = {
            description = "Desolace is a land at war. The centaurs wage war with each other, and we " ..
                "believe the victor among them will spill out and threaten our strongholds. That, we " ..
                "cannot allow\n\nWe must learn how to beat the centaurs, and to do that... we must ally " ..
                "with one of the clans. The Magram centaurs war with the Gelkis. If you fight the Gelkis " ..
                "then the Magram might consider an alliance.\n\nEarn the favor of the Magrams then speak " ..
                "with Warug, in the Magram village in southeastern Desolace.",
        },
        [1386] = {
            description = "The Kolkar think they are strong, but we laugh at them! We laugh and we kill " ..
                "them! You kill them too. Show me you can kill Kolkar like we do. Head north and slay " ..
                "them all!",
        },
        [1387] = {
            description = "Many clans make up the centaur race. Each has its own leader and agenda, but " ..
                "all the clans have one thing in common. Cruelty.\n\nIf we are to ever find peace, then " ..
                "the centaurs must be removed. And so I put you on the task to do just that.\n\nWhile " ..
                "wandering Desolace, hunt centaur and take their ears. Bring me many, many ears.\n\nDo " ..
                "this in service of the Alliance, <name>, and we will be one step closer to war's end.",
            rewardItems = {{6790, 1}},
        },
        [1389] = {
            description = "The lost ones who live in the Fallow Sanctuary look as we look, but they are " ..
                "monsters... driven mad by the rigors of our journey to Azeroth. Once our brethren, they " ..
                "now live in the Fallow Sanctuary to the east, catching or killing any who wander " ..
                "near.\n\nAnd they have stolen something sacred to us-- draenethyst crystals.\n\nWe lack " ..
                "the force to enter the Fallow Sanctuary and reclaim our stolen draenethyst from among " ..
                "their huts and campfires, but without those crystals... we too may lose our way.",
        },
        [1396] = {
            description = "My caravan was destined for the eastern coast, but we did not reach our goal. " ..
                "Lost Ones attacked us, killing guards and dashing supplies.\n\nI alone survived their " ..
                "assault. I have sworn to protect what supplies remain, but wild creatures skulk near. " ..
                "Please, help me defend my camp from the beasts!",
        },
        [1398] = {
            description = "I owe you greatly, <name>. An honorable heart beats within you. And now I have " ..
                "another task for which I humbly ask your aid.\n\nIf I'm ever to reach Nethergarde, then " ..
                "I must fix this wagon. And for that... I will need wood. Strong, dry wood--not the " ..
                "spongy, tangled wood of the swamp's trees.\n\n<name>, go east to the coast and search " ..
                "for driftwood that has been dried by the sun. Bring it to me.",
        },
        [1421] = {
            description = "I was stunned during the attack by the Lost Ones, but before my sight went " ..
                "black I spied one of our wagons being dragged to the Fallow Sanctuary, the lost one " ..
                "village to the north.\n\nA caravan chest with valuable reagents was in that wagon, " ..
                "reagents vital to the studies of the wizards of Nethergarde Keep. Find the chest and get " ..
                "those reagents, <name>. Get them and bring them to me.",
        },
        [1427] = {
            description = "Before you take rest, speak to Tok'Kar again. While you were gone I believe he " ..
                "finished a few weapons. For your help here, he would offer one of them to you. You would " ..
                "do well to test its strength against the fish men when you are ready... but only to " ..
                "please me further.",
            rewardChoices = {{9680, 1}, {9678, 1}, {9679, 1}},
        },
        [1437] = {
            description = "I am Vahlarriel, <name>. I've come here to discover the whereabouts of two " ..
                "missing nobles of a Darnassian merchant family--House Malem. The father of the house " ..
                "fears the worst, and I am to do everything I can to find his missing children. I have " ..
                "yet to start my search for Tyranis or Dalinda, but I am hopeful I shall not be here " ..
                "long.\n\nLast word tells of them passing through the Stonetalon Mountains a few weeks " ..
                "ago.\n\nIf you find their wagon, please, come find me immediately.",
        },
        [1440] = {
            description = "So, the time is now then? I appreciate your efforts, and if the situation does " ..
                "not lend itself, then allow me to thank you now for everything you've done for me and my " ..
                "family. If you're ready, then there is nothing else for me here--we can leave when you " ..
                "feel the time is right.",
            rewardChoices = {{9687, 1}, {9698, 1}, {9699, 1}, {11884, 1}},
        },
        [1445] = {
            description = "So he spoke of Jammal'an's prophecy?\n\nThe Atal'ai spiritual leader believes " ..
                "once Hakkar returns to Azeroth from the Nether, the god will grant the Atal'ai tribe " ..
                "immortality.\n\nFoolish trickery to bring about a premature doomsday if you ask " ..
                "me.\n\nBut you say the exile spoke of enchanted fetishes? This concerns me greatly. If " ..
                "these are in fact the key to the Atal'ai ritual which caused this mess, we must " ..
                "understand their intrinsic powers.\n\nVenture into the Temple, and seize the fetishes!",
            rewardItems = {{1490, 1}},
        },
        [1451] = {
            description = "Rhapsody took quite a liking to the booze. Now don't get me wrong -- all of us " ..
                "dwarves up here at the aviary love a good ale when the time is right.\n\nBut ol' " ..
                "Shindigger took to the liquor like a gryphon takes to the skies. And a damned shame it " ..
                "was, too. No one could fly like Rhapsody.\n\nFirst sign of trouble was when he came " ..
                "stumbling back from that mission with your buddy, Brohann. All went down hill quickly " ..
                "after that. Had to let him go.\n\nLast I heard, he's set up a brew camp to the east of " ..
                "here...",
        },
        [1453] = {
            description = "There's work to be done in Desolace, <name>. It's an atrocious place, befouled " ..
                "by centaur and other nasties. But if you're looking for a good week's honest work, then " ..
                "head there, meet with Kreldig Ungor, and tell him I sentcha.\n\nYou can find him holed " ..
                "up at Nijel's Point--it's a little cozy camp hidden in the mountains of northern " ..
                "Desolace. Just head east if you enter from the Stonetalon Mountains. It's easy to miss, " ..
                "so be on the lookout.",
        },
        [1457] = {
            description = "Take Karnitol's things back to Roetten in Ironforge and he'll pay you for a " ..
                "job well done.\n\nHaha, if you're not careful, he's gonna be so pleased with ya that " ..
                "he'll ask you to join us full time.\n\nAgain, great job, <name>.\n\nBe careful on your " ..
                "way back, and don't take too much time--Karnitol's not the most of patient of men, but " ..
                "he's very generous nonetheless.",
            rewardChoices = {{6791, 1}, {6792, 1}},
        },
        [1458] = {
            description = "One of my tasks out here involves picking up some reagents for Leftwitch, a " ..
                "gnome mage in Kharanos. Roetten seems to think it's easy coin in the bank since we're " ..
                "out here already. He doesn't really care that we're short-handed as is.\n\nThe first few " ..
                "items on his list should be easy enough to get, and it'd be a good chunk of coin for " ..
                "anyone helping me out.\n\nI need some horns and claws from the Hatefury satyr to the " ..
                "east of here. Bring 'em back to me and we'll get started on the rest of the list.",
            rewardMoney = 3500,
        },
        [1462] = {
            objectivesText = {"Speak to Seer Ravenfeather for another Earth Sapta."},
            rewardItems = {{6635, 1}},
        },
        [1465] = {
            description = "As you continue your search of the wagon you find not only a pendant, but also " ..
                "footprints leading off towards the south. In the distance you can see smoke rising from " ..
                "a large fort. The smoke is from a kept fire, not the burning of buildings, and your " ..
                "instincts tell you that the Malems, if still alive, were taken that direction.\n\nYou " ..
                "think Vahlarriel at Nijel's Point should not only see the pendant you've found, but also " ..
                "know about the signs of life to the south.",
        },
        [1476] = {
            description = "Coaxing a succubus will require the hearts of the pure. But is any mortal " ..
                "without vice?\n\nThrough bits of overheard stories, I found two humans that should " ..
                "do.\n\nThe first is Dalin Forgewright, who has dedicated himself to the care of the " ..
                "Lordaeron refuges, whom are refused by their kin at the Greymane Wall.\n\nThe other is " ..
                "Corma Villard, a woman who remains faithful to her lost love, wandering the Wetlands for " ..
                "a sign of her.\n\nDeliver their hearts to Carendin. But first, let me show you your " ..
                "quarry.",
        },
        [1480] = {
            description = "The torn skin smells rotten, and is remarkably pliable for something that " ..
                "appears to be dry and fragile.\n\nAs you unroll it, you can clearly see the red markings " ..
                "of some kind of language on one side. At the bottom of the skin is a very clear symbol " ..
                "that you guess is a signature of some kind.\n\nPerhaps it is something Maurin could tell " ..
                "you more about?",
        },
        [1481] = {
            description = "I believe I can find this demon lord given the proper reagents.\n\nIf he is " ..
                "indeed as powerful as I suspect, I will need items gathered from deadly creatures. But " ..
                "you act in the Warchief's name, so I am sure you will accept my task.\n\nFirst, I will " ..
                "have to break any wards he has against scrying. For this, I will need the scalp from a " ..
                "satyr--but not any satyr. The scalp must come from a Hatefury shadowstalker.\n\nSearch " ..
                "for them among the ancient ruins in the northeast of Desolace.",
        },
        [1485] = {
            description = "Those warlocks who came before us have earned the distrust of the Horde, and " ..
                "while we are tolerated, we are not loved.\n\nThis has not brought the warlocks closer " ..
                "together, however, as many choose to live reclusively, dabbling in their magics alone. I " ..
                "will not seek to lead you down one path or the other, but only help you in your " ..
                "maturation.\n\nBefore I teach you the art of summoning, bring me six heads of the vile " ..
                "familiars from the cave to the northeast.",
        },
        [1490] = {
            description = "I entered the land of dreams, and dreamed of a cult of druids who dwell in the " ..
                "Wailing Caverns. I saw that their goals were once noble, but they have lost their way. " ..
                "They are now servants of the taint seeping through the Barrens.\n\nI am old and my " ..
                "strength fails. I could not long dwell in that dreaming place and know little more of " ..
                "the tainted druids. But Nara is young and her spirit is fierce. She remained in the " ..
                "dreaming when I fled.\n\nSpeak with Nara. She is in the tent, over yonder.",
        },
        [1505] = {
            description = "The Horde honors its warriors because their strength is unquestioned. But the " ..
                "truly great warriors are great students as well.\n\nSeek out Uzzek. He is a veteran of " ..
                "many battles and now instructs young warriors in the ways of combat. You will find him " ..
                "south of Far Watch Post, the orc garrison on the border of the Barrens and Durotar to " ..
                "the east.",
        },
        [1506] = {
            description = "You there. <name>, right?\n\nI hope your schedule isn't busy, because Gan'rul " ..
                "wants to see you right away. You'll find him with the senior warlocks in the Cleft of " ..
                "Shadow.\n\nBased on my past dealings with Gan'rul, your summons is either a very good " ..
                "thing or a very bad thing.",
        },
        [1522] = {
            description = "Fire be witcha, mon. I see you be strong in da ways of earth already, an' me " ..
                "tinkin' you be ready to talk to Kranal.\n\nKranal live north of da Crossroads in da " ..
                "Barrens. He be strong in da ways of da elements and can teach ya da ways of fire... if " ..
                "you tink you be ready.\n\nHe be easy ta find, just don' go too far--ya go too far an' ya " ..
                "find yerself in da elves' lands.",
        },
        [1524] = {
            description = "You are powerful enough to wield the totem of fire, but that does not mean you " ..
                "are ready.\n\nAlong the Southfury River in Durotar, before the Great Sea, lies a hidden " ..
                "trail to one of the highest peaks in the land. Find your way to the top and you shall " ..
                "find one of our holy shrines watched over by Telf Joolam --the Shrine of the Dormant " ..
                "Flame.\n\nTake this torch to him--it marks that you attempt to tame fire. Return it to " ..
                "me aflame by the brazier at the shrine and I will see you are given the totem of fire.",
        },
        [1529] = {
            description = "Long has it been since you were last tested, <name>. You have shown patience " ..
                "thus far in your studies, but the time has come for you to learn more. The time has come " ..
                "for you to learn about the purity of water.\n\nSeek out Islen Waterseer in the Barrens. " ..
                "She is along the eastern coast, south of the Southfury River and Ratchet. You will find " ..
                "her there at her fishing hut. Good luck to you, <name>.",
        },
        [1559] = {rewardItems = {{6672, 1}}},
        [1578] = {
            description = "The mountaineers of Loch Modan are fighting troggs, and having a busy time of " ..
                "it! They need constant supplies of new armor and weapons if we're ever to get a handle " ..
                "on those troggs.\n\nThat's why my colleague Thorvald is there, trying to keep the " ..
                "mountaineers in good gear. So if you were to make some copper axes and copper chain " ..
                "belts and bring them to Thorvald, he would be obliged. He might even share his knowledge " ..
                "with you.\n\nThorvald is in Loch Modan's southern guard tower.",
            rewardItems = {{3609, 1}},
        },
        [1618] = {
            description = "We dwarves aren't the only ones fighting. Our human allies have their hands " ..
                "full too!\n\nRedridge is under periodic attack from blackrock orcs, and their supply of " ..
                "equipment is always low. If you were to help them out, I'm sure their resident " ..
                "blacksmith, Verner Osgood, would teach you a trick or two.",
            rewardItems = {{6735, 1}},
        },
        [1688] = {
            description = "I had a student named Surena Caledon. She stood where you stand now, eager to " ..
                "learn of warlock magic, and possessing no small bit of talent. More than that she was " ..
                "young and pleasing to the eye. Had I seen it then, the traitorous trollop!\n\nThe " ..
                "thieving wench ran off with one of the Defias, Erlan Drudgemoor. While her loss is of " ..
                "little importance, I gifted her a bloodstone choker that I must have.\n\nHer life means " ..
                "nothing to me now. You will find her at the Brackwell Pumpkin Patch. Retrieve what is " ..
                "mine.",
        },
        [1698] = {
            description = "Yorus Barleybrew has issued a challenge to all able warriors of the Alliance. " ..
                "He waits at the Lakeshire Inn, in Redridge, and pledges a grand reward to anyone able to " ..
                "pass his trial.",
        },
        [1714] = {rewardItems = {{6851, 1}}},
        [1716] = {
            description = "A sayaad is a devourer of souls, dominator of wills, and tempter of hearts. It " ..
                "knows nothing but evil.\n\nSalacious tales refer to the demon by its common name: " ..
                "succubus for females, incubus for males.\n\nA stimulus is required to beckon the " ..
                "creature. With a symbol of love as bait, it will surely answer your call. Defeat it, and " ..
                "make it your tool.\n\nIt will be hard to find a thing of this nature, though. You should " ..
                "speak with Takar the Seer. You will find him in the Barrens of Kalimdor near Camp " ..
                "Taurajo.",
        },
        [1718] = {
            description = "Your renown as a warrior grows, <name>. Now it is time to pit yourself against " ..
                "your peers and see where you stand.\n\nThere is an island off the coast of the Barrens, " ..
                "south of Ratchet. It is called Fray Island and it is a place where warriors " ..
                "meet.\n\nMeet, and fight.\n\nSpeak with the chief warrior of Fray Island, Klannoc " ..
                "Macleod. If he finds you worthy, then Klannoc will lead you further down the warrior's " ..
                "path.\n\nTo reach Fray Island, search for the sand bar shallows along the Merchant Coast.",
        },
        [1738] = {
            description = "In preparation for your coming, I used my sight to look over the world and " ..
                "through the mists of time. I have found what it is you seek.\n\nIn the War of the " ..
                "Ancients, two lovers fell together in battle. Where they took their last breaths, a tree " ..
                "known as the heartswood grew, a symbol of their undying love.\n\nThat should be enough " ..
                "to tempt a succubus. You will find it in the ruins of Ordil'Aran in the northwestern " ..
                "part of the forest of Ashenvale.",
        },
        [1739] = {
            description = "Using the heartswood core, you will be able to cast a spell at the summoning " ..
                "circle in the crypt below to open a portal for the succubus to pass through.\n\nBe " ..
                "careful, <name>, succubi have overrun even the strongest of minds.\n\nOnce you have " ..
                "bested and returned it to the void, return to me and I will show you how to call and " ..
                "control it.",
            rewardItems = {{22243, 1}},
        },
        [1740] = {
            description = "When demons of the Legion fall out of favor, their spirits are imprisoned " ..
                "within orbs and distributed to their mages and warlocks.\n\nMany were carried by their " ..
                "servants in Azeroth. Even fragmented, they still possess the powers of the demons " ..
                "trapped inside.\n\nThe orb of Soran'ruk was broken into two pieces, one was further " ..
                "broken to be used by the acolytes of the Twilight's Hammer in Blackfathom Deeps. The " ..
                "other, larger piece, was possessed by a wizard in Shadowfang Keep. Find them and I can " ..
                "reform it.",
            rewardChoices = {{6898, 1}, {15109, 1}},
        },
        [1823] = {
            description = "You are a warrior of skill and growing renown. Perhaps you are ready for Ruga " ..
                "Ragetotem 's trial? If so, then find Ruga in Camp Taurajo in the Barrens.\n\nHe awaits " ..
                "those warriors who answer his call.",
        },
        [1883] = {
            description = "Un'thuwa, tribal mage of Sen'jin Village, detects a disturbance in the magic " ..
                "currents of Durotar and asks for aid. Speak with Un'thuwa and do what you can to help " ..
                "him.\n\nDo this, and in time further secrets will be revealed to you.",
        },
        [1919] = {
            description = "Your knowledge of the craft grows, young <name>. Are you now ready to begin " ..
                "your true lessons? Are you ready to take your place in the secret war we wage?\n\nIf so, " ..
                "then speak with Jennea Cannon, in the wizard's sanctum in the mage district of " ..
                "Stormwind. She has a task for you which will open your first window into the invisible " ..
                "world.",
        },
        [1920] = {
            description = "A disturbance has been reported at the Blue Recluse tavern in the Mage " ..
                "Quarter. Strange, invisible creatures now wander the tavern, and I fear a mana rift has " ..
                "formed there.\n\nI want you to investigate the tavern and capture those creatures. Use " ..
                "the cantation of manifestation in the tavern to make the creatures visible, subdue them " ..
                "then use a containment coffer to capture them. When you have enough, return to me with " ..
                "your filled coffers, your empty coffers and the cantation.",
        },
        [1921] = {
            description = "You have served your fellow mages well, and now it is time to don your " ..
                "wizard's robe. Wynne Larson can make your robe, but you must bring her the needed " ..
                "materials\n\nThe robe will be made of linen which is easy to find, but you must also " ..
                "gain charged rift gems, and the only known location of the gems is in the Silver Stream " ..
                "Mine of Loch Modan, left in crates by the dwarven miners' league.\n\nGather the linen " ..
                "and the gems and bring them to Wynne Larson at the Larson Clothiers in the Mage District.",
        },
        [1939] = {
            description = "High Sorcerer Andromath wishes to speak with you, <name>. He is at the top of " ..
                "the wizard's sanctum, in the mage's district of Stormwind.\n\nIt would be wise to speak " ..
                "with him, for Andromath is one of the most powerful mages not locked away in Dalaran. " ..
                "Council with him is high council indeed.",
        },
        [1943] = {
            description = "The troll mage Deino has need of your assistance, <name>. She resides in " ..
                "Orgrimmar, in the Darkbriar Lodge.",
        },
        [1944] = {
            description = "The fabled city of Xavian lies nestled deep within eastern Ashenvale, and " ..
                "tales of its ancient knowledge are well known among the learned. It is said that the " ..
                "waters of Xavian hold vast magical powers.\n\nI would have a sample of those waters, " ..
                "from their source.\n\nTake this flask and go to Xavian. Gather water from the bottom of " ..
                "its highest waterfall, and return to me. And use care as you move through that ancient " ..
                "city--satyrs now hold the ruins and do not like mages prying into their affairs.",
        },
        [1945] = {
            description = "For your services, I have arranged for the creation of your new robes, " ..
                "provided you can gather the needed materials...\n\nFor these robes, you must return to " ..
                "Ashenvale for the locks of hair from laughing sisters--dryads who gather near the " ..
                "Raynewood Retreat.\n\nWhen you have their hair, bring it to Kil'hala, a troll tailor at " ..
                "the Crossroads in the Barrens. He will be expecting you, and will fashion your robes.",
        },
        [1947] = {
            description = "Now it is time for you to earn your mage's wand. To begin this quest, speak " ..
                "with the human hermit Tabetha in Dustwallow Marsh. You will find her shack deep in the " ..
                "marsh, west of Theramore.\n\nSpeak with her, for her knowledge is vast. You will find " ..
                "Tabetha 's cottage west of Theramore, and just north of the Stonemaul Ruins.",
        },
        [1948] = {
            description = "The building of a mage's wand is not easy. Rare substances are required, and a " ..
                "vessel must be made that can store great quantities of magical energy. You must gather " ..
                "these things and bring them to me.\n\nI have written onto this parchment that which you " ..
                "need, and instructions on how to get it. Bring me exactly what is on this list, and " ..
                "follow my written directions to the letter, for if you do not then when we make your " ..
                "wand things might go... badly.",
        },
        [1949] = {
            description = "To make your wand, there are key passages in a certain book that I must read. " ..
                "The book is called Rituals of Power, written by the Magus Tirth.\n\nI do not have a copy " ..
                "of his book, and none of the world's great libraries possess it. So you must speak with " ..
                "Tirth and gain it from him.\n\nGood luck. Tirth used to be a great mage and scholar, but " ..
                "now he spends his time at the gnome and goblin races in the Shimmering Flats, drinking " ..
                "and gambling.",
        },
        [1950] = {
            description = "I can help you with the book, but first you have to help me!\n\nThe tome you " ..
                "seek is in my magically locked strongbox. To open it a special phrase must be uttered, " ..
                "and I can't remember the phrase! Normally my assistant helps me remember these things " ..
                "but he's nowhere to be found.\n\nIf you want my book, then find my apprentice! Ask " ..
                "around the race track--if you're lucky then someone has seen him. Either drag him back " ..
                "here, or at least get my magic phrase from him so we can open my box!",
        },
        [1951] = {
            description = "Hm... now that I think about it, I don't have my book! You see, I had some " ..
                "gambling debts and to pay them off I sold the last copy of Rituals of Power to a member " ..
                "of the clergy....\n\nA member of the Scarlet Brotherhood. He must have taken it to their " ..
                "library in the Scarlet Monastery in Tirisfal Glades!\n\nIf you want that book, then " ..
                "you'll have to go to the monastery to find it. And sorry about all the trouble. I'm not " ..
                "myself these days...",
        },
        [1952] = {
            description = "I'll go make the wands now.",
            rewardChoices = {{7514, 1}, {11263, 1}, {7513, 1}},
        },
        [1953] = {
            description = "It is time, <name>, for you to speak with Tabetha... the hermit of Dustwallow " ..
                "Marsh. She will instruct you on the creation of a powerful mage's implement.\n\nTabetha " ..
                "'s shack lies deep in Dustwallow Marsh, west of Theramore.",
        },
        [1959] = {
            description = "The mages of the Undercity have noted a magical disturbance within the city, " ..
                "and have sent word for mages of the Horde to investigate.\n\nAnastasia Hartwell can tell " ..
                "you more. Speak with her in the Magic Quarter in the Undercity.",
        },
        [1960] = {
            description = "Algernon's alchemist shop in the Apothecarium is the locus of a strange " ..
                "disturbance. Invisible creatures, made solely of magic, wander the shop--there must be a " ..
                "reason, and we must find it!\n\nInvestigate the disturbance and capture those creatures. " ..
                "Take a chest of coffers and a scroll from behind me. Use the scroll at the shop to make " ..
                "the creatures visible, subdue them with your spells, then throw down a coffer to capture " ..
                "them. Return with the filled coffers, the empty coffers and the cantation.",
        },
        [1961] = {
            description = "It is time for you to don your first mage's robes, <name>. They are a sign of " ..
                "your station, and a testament to your worth.\n\nTo gain the robes, you must gather the " ..
                "mana gems from the Dalaran mages of Silverpine. Their beliefs are similar to ours and so " ..
                "killing them is somewhat distasteful, but if they lack the strength to resist us, then " ..
                "they do not deserve their lives.\n\nBring the gems and a supply of linen to Josef " ..
                "Gregorian at the Magic Quarter's tailor shop.",
        },
        [2038] = {
            description = "As if crashing into the Loch wasn't bad enough, troggs from the nearby island " ..
                "attacked me and stole my tools and special Blastenheimer Blastencapper explosives. With " ..
                "no gyrocopter and no explosives, the movement has no chance!\n\nGet my tools back and " ..
                "find my Blastencapper explosives, <name>. For Gnomeregan!",
            rewardItems = {{12522, 1}},
            rewardMoney = 700,
        },
        [2098] = {
            description = "A pirate's life ain't an easy one, landlubber. It ain't all about plunderin' " ..
                "and booze! Alas, me ship be sunk just off shore thanks to them pesky " ..
                "Threshadons.\n\nWhat I be needin' is me first mate back in workin' order!\n\nWhen I " ..
                "washed up'n shore, the key for me first mate broke on the rocks and was pilfered by the " ..
                "beasties of Darkshore. Out of the corner of me eyes I saw some of them Ragin' Crawlers, " ..
                "Ferocious Foreststrider, and murloc rummaging through the wreckage....",
            rewardMoney = 1200,
        },
        [2159] = {
            description = "Greetings, young <class>. Can you offer me aid? I have a package of herbs that " ..
                "I must deliver to the town of Dolanaar. But I still have business with the druids of " ..
                "Shadowglen and cannot yet leave.\n\nCan you deliver this package for me? It must be sent " ..
                "to Innkeeper Keldamyr, at the Dolanaar inn. It lies along the road, to the south.",
            rewardChoices = {{2070, 5}, {159, 5}},
        },
        [2161] = {
            description = "Excuse me? Can you help me?\n\nI have a load of food here. I walked along the " ..
                "road and braved scorpids and spiders and worse! I brought the food to the Valley of " ..
                "Trials because I thought they needed it and I like to help out. But they don't need any " ..
                "food! Now I have to take it back to Razor Hill and I'm afraid of all the beasts along " ..
                "the way...\n\nCan you take it for me? I'm just a peon, but you're a hero. You fear " ..
                "nothing!\n\nTake it to Innkeeper Grosk at the Razor Hill inn. Thank you!",
            rewardChoices = {{4540, 5}, {159, 5}},
        },
        [2280] = {
            description = "Touching the Discs of Norgannon once again makes your hand tingle. This time, " ..
                "however, a strange grinding noise is heard from inside the discs.\n\nYour backpack " ..
                "suddenly becomes heavier than it was before. Inside, you discover a miniature version of " ..
                "the discs!\n\nNo doubt, an item of this sort would be invaluable for someone interested " ..
                "in the ancient history of Azeroth. The sages of Thunder Bluff are such historians, known " ..
                "throughout the Horde; perhaps they can make good use of it.",
        },
        [2499] = {
            description = "In a cave along the southern bank of the lake, a timberling named Oakenscowl " ..
                "is spreading corruption to all the creatures that make Lake Al'Ameth their home.\n\nI " ..
                "dared not get too close, but even from a distance, it is obvious: Oakenscowl is being " ..
                "poisoned by the largest tumor I have ever seen... I would call it gargantuan, " ..
                "even.\n\n<name>, you have already done much to aid my efforts, but I ask of you one more " ..
                "task. Hunt down Oakenscowl and collect the tumor; remove this source of corruption from " ..
                "my home.",
            rewardChoices = {{5458, 1}, {5589, 1}},
            rewardMoney = 600,
        },
        [2518] = {
            description = "Lady Sathrah was once beloved of Elune. Graceful and pure, the spider spun her " ..
                "silver threads through the moonlight, catching the evening mist. The silvery dew had " ..
                "strong healing powers and was kept here in the temple.\n\nBut of late, Sathrah has " ..
                "descended into madness. Her future generations are now threatened as well.\n\nFind Lady " ..
                "Sathrah, <name>, and end her suffering. She dwells along the northern borders of " ..
                "Teldrassil, near Wellspring Lake. Gather her silvery spinnerets and bring them back to " ..
                "me.",
            rewardMoney = 1000,
        },
        [2519] = {
            description = "A once great creature of the forest is in need of help, <race>.\n\nThere is a " ..
                "difficult task that must be done.\n\nPlease seek out Priestess A'moora; she will explain " ..
                "things to you. Find her to the southeast of here, inside the Temple of the Moon.",
        },
        [2520] = {
            description = "Now you must finish the task to which you have been appointed. Take the " ..
                "spinnerets and offer Lady Sathrah's sacrifice to Elune; lay the great spider to " ..
                "rest.\n\nInside this temple, find the central fountain. There is where you may leave the " ..
                "sacrifice. The holy waters will purify and cleanse the corruption that drove Sathrah " ..
                "mad.\n\nWhen you have completed this, return to me.",
            rewardChoices = {{9600, 1}, {9601, 1}},
        },
        [2606] = {
            description = "Blech! This stuff tastes terrible! So much for that idea...\n\nWait, what's " ..
                "that? Oh, I know, I know, you think I shouldn't give up on this stuff. Well, okay " ..
                "then.\n\nUhhhh, I have an idea! Brilliant! Take this dew to my friend Sprinkle -- she's " ..
                "an excellent chef. Tell her what we're up to here and that we want to make it go down a " ..
                "little easier.\n\nI mean, if it's going to taste that bad, it at least should have some " ..
                "kick to it... And I'm just not feeling it...",
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
        [2751] = {
            description = "Twenty generations of Omosh have held this hammer, <name>. A hundred thousand " ..
                "tons of metal we have molded. Tragically, it all ends at Orokk, failure of the Omosh: " ..
                "Without kin and incapable of producing offspring.\n\nI cannot let the secret recipes of " ..
                "Omosh die with me! Someone must continue the legacy, Omosh or not!\n\nProve to Orokk you " ..
                "are capable, <name>. Bring for Orokk the following: Two patterned bronze bracers, two " ..
                "bronze greatswords, and two sharp claws. Bring them for Orokk and we shall continue.",
            rewardItems = {{7979, 1}},
        },
        [2758] = {
            description = "When I was about your age, a dwarf by the name of Galvan took me under his " ..
                "wing and trained me in the ways of the armorsmith. Before he left for Booty Bay, he made " ..
                "me promise to train all those with the desire and determination to advance in the craft " ..
                "of blacksmithing -- so here I am -- all these years later.\n\nSo, now it's time for you " ..
                "to learn a little something. Make me six golden scale bracers and you will learn where " ..
                "smithing comes from, <name>.",
            rewardItems = {{9367, 1}},
        },
        [2759] = {
            description = "Although Galvan left Booty Bay many years ago, members of the order still " ..
                "remain in town, hoping to one day find another worthy of Galvan's tutelage.\n\nTake this " ..
                "insignia and present it to McGavan in Booty Bay.\n\nIf you actually make it that far, " ..
                "he'll know that you are worthy. I have faith, <name>!",
        },
        [2760] = {
            description = "Most of our recruits never make it to Booty Bay, <name>. The shine of the " ..
                "insignia is enough to trigger the loot lust in even the staunchest of blacksmiths. Fools " ..
                "they be, as the insignia is a drop in the bucket compared to the wealth of items you'll " ..
                "see!\n\nFind Galvan the Ancient and show him this pin. His residence is far to the " ..
                "north, between Zul Gurub and the Mosh'Ogg ogre mound.",
        },
        [2762] = {
            description = "It is said that truesilver is stronger and more durable than mithril. Galvan " ..
                "does not disagree with this assessment of the minerals, but contrary to its name, " ..
                "truesilver is not true! Mithril is a far nobler mineral! HAH! Regardless, for this " ..
                "lesson you will need to find the great silver deceiver, <name>.\n\nBring me forty bars " ..
                "of mithril and five bars of truesilver. In exchange, you will be taught the secret of " ..
                "ornate mithril gloves and more importantly, learn that truesilver is a liar!",
            rewardItems = {{7984, 1}},
        },
        [2765] = {
            description = "When you first came to me, I knew that you would turn out to be one of my " ..
                "finest pupils! It was without hesitancy that you gave up a trinket of some power to " ..
                "McGavan. You did this only so that you could meet me. Such blind faith and devotion to " ..
                "the craft should be rewarded.\n\nYou have attained expertise over blacksmithing, <name>. " ..
                "Reap the rewards!",
            rewardItems = {{8703, 1}},
        },
        [2861] = {
            description = "Rumor is that Tabetha, a mage colleague who lives deep in Dustwallow Marsh, " ..
                "has a bone to pick with a certain sand troll in Zul'Farrak. If you speak with Tabetha " ..
                "she can tell you more.\n\nAnd bring some friends with you, <name>. If Tabetha has you go " ..
                "to Zul'Farrak then you're not going to want to go alone.\n\nYou will find Tabetha 's " ..
                "cottage west of Theramore, and just north of the Stonemaul Ruin.",
        },
        [2966] = {
            description = "Sage Truthseeker and I would like you to take the miniature discs you found to " ..
                "the sealed gates of Uldum. We... we aren't sure what will happen when you do " ..
                "this.\n\nThis sounds risky, sure, we acknowledge that. It might, however, do nothing. " ..
                "You might need to use the discs on something. Perhaps the doors unlock when you have the " ..
                "discs in your possession. Be open to try anything, and be ready for anything to " ..
                "happen.\n\nLearn what you can, then return to me. We will have much to discuss.",
        },
        [2967] = {
            description = "You access the pedestal again; the platinum discs suddenly appear once more in " ..
                "your backpack.\n\nWith the knowledge of the stone watcher learned and the discs returned " ..
                "to your possession, the time has come to return to Thunder Bluff and inform the Nara " ..
                "Wildmane of your discovery.",
        },
        [2968] = {
            description = "Well <name>... we seem to be at an unfortunate impasse. We know what we need - " ..
                "the Plates of Uldum - but we have no idea where they might be. We will research this, " ..
                "and then devise a solid plan of attack. I have a couple ideas where to start looking; I " ..
                "have high hopes that soon, we'll be asking you to rejoin our efforts to discover the " ..
                "truth.\n\nSage Truthseeker needs to be informed on this, <name>; no doubt, he also wants " ..
                "to thank you personally for once again heeding the call.",
            rewardMoney = 22000,
        },
        [2993] = {
            description = "Sharpbeak is held in a cage, high on a cliff at the top of Jintha'Alor in the " ..
                "Hinterlands. The key to this cage is possessed by the high priestess of the Vilebranch " ..
                "trolls, Vile Priestess Hexx.\n\nThere. I have done my part. I bid you fortune on your " ..
                "quest, <name>.",
        },
        [3082] = {
            description = "Ah, while you were gone a tablet came for you, <name>.\n\nRead it when you " ..
                "have time. If I'm not mistaken, it came from the hunter trainer Jen'shan. She would have " ..
                "words with you when you're ready.",
        },
        [3099] = {
            description = "Ah, while you were off dealing with the mindless Scourge, this scroll arrived " ..
                "for you. I would think it's some matter of importance as it seems it bears the seal of " ..
                "the warlock trainer Maximillion. I would take some time to read it before heading out " ..
                "again.",
        },
        [3101] = {
            description = "I was asked to bring this to your attention as soon as you returned from the " ..
                "kobold camps, <name>. It appears to be a letter sealed with the insignia of Brother " ..
                "Sammuel, our local paladin trainer. I wouldn't hesitate to read it before you go about " ..
                "any other business here in the Abbey.",
        },
        [3115] = {
            description = "While you were helping me out, this memorandum was given to me to pass on to " ..
                "you. Take some time to read it when you have a chance. I'm thinkin' it came from the " ..
                "warlock trainer Alamar. Take a gander at it and go find him inside Anvilmar when you've " ..
                "a chance.\n\nAnd watch yerself, <name>, your kind ain't too trusted 'round these parts.",
        },
        [3502] = {
            description = "Well, after that display of voracious greed, I feel nauseous.\n\nRegardless, I " ..
                "shall not dwell too long on your material addiction.\n\nFor each imperfect draenethyst " ..
                "fragment you turn in, I shall reward you with more junk. My junk heap gets smaller while " ..
                "your junk heap gets larger. On Draenor we call this a 'win-win' situation.",
            rewardItems = {{12122, 1}},
        },
        [3526] = {
            description = "Expert engineering yields two distinct disciplines: gnome and goblin. Clearly, " ..
                "goblin engineering is the choice of all brilliant engineers. Learn to master the world " ..
                "through the judicious use of high explosives and fantastic gear!\n\n<name>, read this " ..
                "manual. If you want to learn about goblin engineering, then take it to Nixx " ..
                "Sprocketspring in Gadgetzan. Remember - membership is permanent and prevents joining the " ..
                "other discipline, so make sure this is what you want before finishing his task.",
        },
        [3626] = {
            description = "The hour of redemption is near, <name>. You must return to the Blasted Lands " ..
                "with your new-found weaponry and speak with the Fallen Hero of the Horde to receive your " ..
                "final objective.",
        },
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
        [3629] = {
            description = "Expert engineering yields two distinct disciplines: gnome and goblin. I only " ..
                "bother to mention goblin engineering because I'm a fair trainer. They like to make " ..
                "things that blow up, and they rarely care what is in the way - even " ..
                "themselves.\n\n<name>, read this manual. If you want to learn how to blow yourself up, " ..
                "then take it to Nixx Sprocketspring in Gadgetzan. Remember - membership is permanent and " ..
                "prevents joining the other discipline, so make sure this is what you want before " ..
                "finishing his task.",
        },
        [3632] = {
            description = "Engineering at the expert level breaks into two disciplines: gnome and goblin. " ..
                "Gnome engineering represents by far the superior of the two! It's about the construction " ..
                "of wonderful gadgets and devices that make life better!\n\n<name>, read this manual. If " ..
                "you want to learn more on gnome engineering, then take that manual to Tinkmaster " ..
                "Overspark here in Ironforge. Remember - membership is permanent and prevents joining the " ..
                "other discipline, so make sure you are sure before finishing his task!",
        },
        [3635] = {
            description = "Engineering at the expert level breaks into two disciplines: gnome and goblin. " ..
                "While I think it is a waste, you should be aware of gnome specialization. They make " ..
                "items and gadgets that claim to change the world, but rarely work.\n\n<name>, read this " ..
                "manual. If you wish to learn how to make metal paper weights, then take the manual to " ..
                "Oglethorpe Obnoticus in Booty Bay. Remember - membership is permanent and prevents " ..
                "joining the other discipline, so make sure you are sure before finishing his task.",
        },
        [3638] = {
            description = "Goblin engineering is about practical uses for high profit and higher " ..
                "explosive power! Our schemata allow us to make powerful bombs and mighty weaponry; the " ..
                "manual you read covered this.\n\nThe manual also covered our ages old oath of secrecy on " ..
                "our schemata. Once you become a goblin engineer, that's that. There is no access to " ..
                "gnome engineering at all.\n\nIf you still want to become a goblin engineer, sign this " ..
                "document pledging life-long secrecy and speak with me again. Think about it carefully, " ..
                "<name>.",
        },
        [3643] = {
            description = "As your mentor, I want some samples of your work. You're a skilled engineer; " ..
                "there is no question of this, <name>. What I hope to do though is to analyze your work " ..
                "for ways to emphasize gnome-oriented techniques in your future efforts. I need the " ..
                "following samples: six mithril tubes, an accurate scope, and two advanced target " ..
                "dummies.\n\nSubmit these items to me and I will issue you your own Gnome Engineer " ..
                "Membership Card; it is required for access to all gnome engineering trainers!",
            rewardItems = {{10790, 1}},
        },
        [3761] = {
            description = "The soil of Un'Goro Crater is reportedly enriched with potent magical " ..
                "qualities. The Cenarion Circle wants to study this soil in large quantities; go into the " ..
                "wilds of Un'Goro and acquire enough of it for our continued research.\n\nThe rich soil " ..
                "will stick out in piles from time to time, and some of the beasts might have usable " ..
                "samples on their being. Take them all outside to Ghede; just look for the piles of dirt " ..
                "and the tauren barking orders. He means well, just don't get him riled up though!",
            rewardMoney = 14500,
        },
        [3763] = {
            description = "Excuse me <class>, but I'd like just a moment of your time if possible.\n\nThe " ..
                "Cenarion Circle in Darnassus is looking for seasoned adventurers such as yourself to " ..
                "lend them aid in a vital research project. While I do not know the specifics, I can " ..
                "inform you that none other than Arch Druid Fandral Staghelm is spearheading this " ..
                "research.\n\nPlease - if you are interested, speak with him directly in the Cenarion " ..
                "Enclave within Darnassus proper.",
        },
        [3764] = {
            description = "The soil of Un'Goro Crater is reportedly enriched with potent magical " ..
                "qualities. I want to know facts from falsehoods; go into the wilds of Un'Goro and " ..
                "acquire enough quality samples of soil for our continued study.\n\nYou may think that " ..
                "collection tasks are beneath you; that sort of attitude does not endear yourself to me " ..
                "or the Cenarion Circle. Bring the samples to Jenal, who is no doubt wasting time outside " ..
                "behind this tree; just look for the piles of dirt. He will handle the logistics - not I.",
            rewardMoney = 14500,
        },
        [3781] = {
            description = "With what we call an Evergreen Pouch, we have cultivated Tharlendris seeds in " ..
                "the soil from Un'Goro Crater. These seeds blossom into an array of random, potent herbs. " ..
                "One result is morrowgrain, a mysterious herb we know little about; I intend to unravel " ..
                "this mystery.\n\nTake this to Mathrengyl downstairs, and he will give you some seeds so " ..
                "you can get started. If you run out, you will need to purchase more from him.",
            rewardItems = {{11022, 20}},
        },
        [3785] = {
            description = "Here's your Evergreen Pouch that you'll need to use the Tharlendis seeds with. " ..
                "You also need to have Un'Goro soil samples on hand to use as fertilizer for the seeds. " ..
                "Just use the pouch when you have everything; the pouch will take care of the " ..
                "rest.\n\nWhen you have enough morrowgrain, bring them here to me in the enclave. Please " ..
                "don't bother the Arch Druid; he's a very busy man, and he doesn't need to be disturbed " ..
                "every time someone returns with another batch of morrowgrain!",
            rewardItems = {{11887, 1}},
        },
        [3786] = {
            description = "Here's your Evergreen Pouch that you'll need to use the Tharlendis seeds with. " ..
                "You also need to have Un'Goro soil samples on hand to use as fertilizer for the seeds. " ..
                "Just use the pouch when you have everything; the pouch will take care of the " ..
                "rest.\n\nWhen you have enough morrowgrain, bring them to me here on Elder Rise. Please " ..
                "don't bother the Arch Druid; he'll be very busy with the research, as well as the " ..
                "multitude of concerns he has!",
            rewardItems = {{11887, 1}},
        },
        [3803] = {rewardItems = {{11887, 1}}},
        [3804] = {rewardItems = {{11887, 1}}},
        [3821] = {
            description = "Sha'ni was sent to investigate reports of strange ritualistic activity coming " ..
                "from the Firegut ogres of the Burning Steppes over three weeks ago.\n\nGoretooth tells " ..
                "me that he hasn't heard from anyone in that platoon and that it's best that I move on " ..
                "and focus on the task at hand. Can you believe it? That's my wife!\n\nI can't leave my " ..
                "post, <name>, but I must know what became of Sha'ni. Travel to the Burning Steppes and " ..
                "search for her.",
        },
        [3822] = {
            description = "My whole platoon was captured, <name>. All were slain - except me.\n\nTheir " ..
                "leader, Krom'Grul, wanted to save me for some sort of ritual.\n\nI was chained to this " ..
                "altar and brutalized by the beast. My physical being ceased functioning after an hour of " ..
                "this torture. The beast then ripped my wedding nose-ring off of my face and stuck it on " ..
                "his finger. I had never seen such savagery!\n\nFind Krom'Grul and kill him! Take my ring " ..
                "back to Thal'trak.\n\nAnd <name>, tell him that we will meet again... in another life.",
            rewardItems = {{11869, 1}},
        },
        [3907] = {
            description = "I can taste the foulness in the air that surrounds you, <name>. There is " ..
                "another, hidden in the depths of Blackrock, who does control this foulness.\n\nThe wind " ..
                "and earth cry his name: Lord Incendius... but someone... something... commands this " ..
                "being. He is merely an emissary.\n\nFind him and discover where his master hides. Return " ..
                "to me when you have collected this information.",
            rewardChoices = {{12113, 1}, {12114, 1}, {12112, 1}, {12115, 1}},
            rewardMoney = 25500,
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
        [4005] = {
            description = "Take this bag of supplies with you to Tanaris. Travel to Lost Rigger Cove, and " ..
                "look for a circle of stones.\n\nThe eastmost peninsula is the secret...\n\nFrom this " ..
                "circle only, read from the book of Aquor; summon the only creature that can transform " ..
                "the items you collected into a totem to fight Blazerunner.\n\nAquementas will not be " ..
                "pleased to be awakened, but remember, you must remain in the circle for him to transform " ..
                "the items.",
        },
        [4023] = {description = "You seek out the Flight? Present to me proof of your worth, mortal."},
        [4024] = {
            description = "I wish to taste the searing flames of the mountain of fire. To let the molten " ..
                "fires of Blackrock cascade across my being. That essence, that searing heat, it is what " ..
                "I crave.\n\nBael'Gar resides in the Depths of Blackrock: A being of pure flame, born of " ..
                "the fires of Ragnaros. Slay Bael'Gar and from his smoldering remains bring for me a " ..
                "piece of his inner fire.\n\nUse the molt on his remains to safely extract the inner " ..
                "flame.\n\nSucceed and be rewarded.",
            rewardChoices = {{12066, 1}, {12082, 1}, {12083, 1}},
            rewardMoney = 26500,
        },
        [4061] = {
            description = "The machines made themselves known to us during our initial forays into the " ..
                "Searing Gorge. Upon further investigation we discovered that they were being imported " ..
                "from Burning Steppes, possibly Blackrock Depths. That is what we need you for, " ..
                "<name>.\n\nYour first task is to venture to the Burning Steppes and recover elemental " ..
                "shards from the rock automatons and lesser rock creations of the region. Once you have " ..
                "collected a sufficient amount, return to me and I shall determine their source of origin.",
            rewardMoney = 16500,
        },
        [4124] = {
            description = "An associate of mine, Ginro Hearthkindle, is looking for assistance concerning " ..
                "the location of a courier and the parcels he was carrying. It has been a week or so " ..
                "since the courier went missing; our own searches have proved fruitless, and we're at an " ..
                "impasse. Unfortunately, I have had to declare the courier as missing in action.\n\nIf " ..
                "you have the time and resources to spare, please speak with Ginro. He should be here in " ..
                "the Stronghold - perhaps in his quarters.",
        },
        [4143] = {
            description = "To tell you the truth, <name>, I've never seen any plants like this in my " ..
                "travels. Perhaps I should take a trip to this crater...\n\nAt any rate, I think I know " ..
                "just the thing Muigin 's looking for -- Atal'ai haze. It's horrid stuff, hard to " ..
                "collect, but it's just what he needs to control the little monsters.\n\nYou'll need to " ..
                "visit the temple of Atal'Hakkar in the Swamp of Sorrows. The Atal'ai haze can be " ..
                "collected from the deep lurkers, murk worms, or oozes found there. Good luck, <name>!",
            rewardMoney = 7500,
        },
        [4146] = {
            description = "You're in luck, <name>! I've been working on some of my own experiments while " ..
                "Marvon's been gone, and one of them is a short range bug zapper. With just a few " ..
                "adjustments, it should be great for ridding yourself of those Bloodpetal pests.\n\nI can " ..
                "let you have one of my zapper prototypes, but you'll still need to collect the fuel. You " ..
                "can get the necessary Atal'ai haze that the zapper needs in the temple of Atal'Hakkar. " ..
                "The deep lurkers, murk worms, or oozes are the ones you'll need to get it from.",
        },
        [4181] = {
            description = "Expert engineering yields two distinct disciplines: gnome and goblin. I only " ..
                "bother to mention goblin engineering because I'm a fair trainer. They like to make " ..
                "things that blow up, and they rarely care what is in the way - even " ..
                "themselves.\n\n<name>, read this manual. If you want to learn how to blow yourself up, " ..
                "then take it to Nixx Sprocketspring in Gadgetzan. Remember - membership is permanent and " ..
                "prevents joining the other discipline, so make sure this is what you want before " ..
                "finishing his task.",
        },
        [4184] = {
            description = "This is grim news, <name>. To discover that our mortal enemies are merely " ..
                "pawns of a much greater threat is disheartening. There is no possible way that Lakeshire " ..
                "could survive an attack from both the Blackrock orcs and the black dragonflight. Should " ..
                "Lakeshire fall to this menace, Darkshire would fall next, and then what? Goldshire? " ..
                "Stormwind itself?\n\nYou must take this information to Highlord Bolvar Fordragon in " ..
                "Stormwind at once! If this does not merit the aid of Stormwind, nothing will and all is " ..
                "lost.",
        },
        [4223] = {
            description = "< Magistrate Solomon sighs.>\n\nYou must return to the Burning Steppes, " ..
                "<name>. As a deputy of Stormwind, you will be required to report to Marshal Maxwell. " ..
                "Good luck.",
        },
        [4243] = {
            description = "Unfortunately, something's happened to one of my greatest inventions. You've " ..
                "seen mechanical squirrels, yes? Well, to get closer to the apes of Un'Goro Crater, I " ..
                "created a mechanical ape to blend in with their kind--I call her A-Me 01.\n\nShe has " ..
                "scrying gems for eyes so I could see everything she saw. She made it to Fungal Rock--the " ..
                "apes' lair--just east of here, and that's when I lost contact. The last thing I saw was " ..
                "one of their alpha males rushing up to say hello to her!\n\nCan you help me find her?",
        },
        [4245] = {
            description = "Checking to see if your prepared to lead A-Me 01 back to Karna Remtravel, you " ..
                "flip the switch to the \"Off\" position. Glancing around once again to make sure none of " ..
                "the gorillas are coming, you prepare to see what happens when you flip the switch back " ..
                "to the \"On\" position.\n\nThis is your last chance... are you sure this is what you " ..
                "want to do?",
            rewardMoney = 16000,
        },
        [4294] = {
            description = "Have you heard of the Un'Goro Crater, <name>? It is near the Tanaris desert, " ..
                "and it is a magnificent place: lush, vibrant, full of creatures and plant life.\n\nIt is " ..
                "there you must go. Word has reached me that the place seems completely untainted by " ..
                "outside hands. Explorers are just now discovering its secrets.\n\nI would like to test " ..
                "the slimes or oozes there. If it is true--that they are uncorrupt--then I would like to " ..
                "see how such creatures have evolved.",
            rewardMoney = 6500,
        },
        [4321] = {
            description = "The information you have given me about the pylons is very " ..
                "interesting...\n\nGive me a moment to do some calculations, <name>. Speak to me again in " ..
                "a moment and I should be able to give you the answer we have been looking for.",
            rewardItems = {{11482, 1}},
        },
        [4381] = {rewardItems = {{11562, 6}}},
        [4382] = {rewardItems = {{11563, 6}}},
        [4383] = {rewardItems = {{11564, 6}}},
        [4385] = {rewardItems = {{11566, 6}}},
        [4491] = {
            description = "Ugh... It's so hot...\n\nI was exploring this area, when all of a sudden, the " ..
                "heat just became unbearable. I must be suffering from heat exhaustion.\n\nPlease, help " ..
                "me get back to my friend Spraggle at Marshal's Refuge. I think I'm well enough to follow " ..
                "you there.\n\nI am feeling a little out of it, so if I do happen to faint again, just " ..
                "splash some water on me from Spraggle's canteen. That should work, I hope...",
            rewardChoices = {{11910, 1}, {11911, 1}, {11913, 1}},
        },
        [4492] = {
            description = "You've got to help me, <name>! My friend, Ringo left earlier to explore the " ..
                "volcano to the south of here, and he has been gone way too long. I am really worried " ..
                "about him.\n\nDo you think you could find him? Why don't you take my canteen with you -- " ..
                "if you do find Ringo, I'm sure he'll need it!",
        },
        [4493] = {
            description = "It would seem that the silithid's intent, nay - reason for being, is to devour " ..
                "everything in their path that is not of their ecology. Their focus is singular, and it " ..
                "is for this reason they are a grave threat to all life on Azeroth.\n\nWhat we've seen to " ..
                "date is but the first stages. I suspect that their strength comes from deeper in " ..
                "Kalimdor: Un'Goro Crater. Go to Gadgetzan in the Tanaris desert and speak to Alchemist " ..
                "Pestlezugg. Tell him of my theory; he will surely aid us in fighting the silithid.",
        },
        [4510] = {
            description = "<name>, your help has been immeasurable. The time will come, no doubt, when " ..
                "I'll ask for your assistance against the silithid once more. We must absorb what we have " ..
                "learned in Un'Goro; I fear that my assumptions that the silithid originated from Un'Goro " ..
                "are now wrong... that indeed there is a far stronger presence somewhere.\n\nTake this " ..
                "note to Idriana at the bank. She'll give you something from my vault that should be " ..
                "viewed as a token of my gratitude. Thank you for your assistance, brave <class>.",
            rewardChoices = {{11870, 1}, {11871, 1}, {11872, 1}},
        },
        [4581] = {
            description = "The druid Kayneth Stillwind sent word to me. He would like a report of the " ..
                "happenings along our coast and in the forests surrounding Astranaar. He fears there is a " ..
                "corruption moving through Ashenvale... and he may be right.\n\nHere, take my report to " ..
                "him. You will find him in the shrine of Forest Song, in the Nightsong Woods to the east.",
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
        [4701] = {
            description = "You have no doubt seen the worgs which the Blackrock orcs command.\n\nIt is " ..
                "curious - no matter how many we destroy, their numbers never dwindle. My scouts have " ..
                "reported that the worgs are bred, trained, and ultimately exported from Blackrock Spire: " ..
                "capital city of the Blackrock orcs. You must travel to Blackrock Spire and discover the " ..
                "source of this menace. Discover... and destroy.\n\nGood luck, <name>. May Cenarius " ..
                "protect you...",
            rewardChoices = {{15824, 1}, {15825, 1}, {15827, 1}},
            rewardMoney = 18000,
        },
        [4724] = {
            description = "Some say the worg controlled by the Blackrock orcs are the creation of a " ..
                "supernatural force. Others say they are not true worg but instead a breed of demon dog, " ..
                "granted to the orcs by a fallen pit lord.\n\nThe truth is far less contrived but every " ..
                "bit as frightening. The worg of Blackrock come from Halycon and her mate. Halycon is the " ..
                "gigantic den mother of the worg. Her mate? Nobody has ever lived to tell the tale of " ..
                "that one.\n\nStrike at the heart of the worg. Destroy Halycon... and <name>, watch your " ..
                "back.",
            rewardChoices = {{15824, 1}, {15825, 1}, {15827, 1}},
            rewardMoney = 18000,
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
        [4811] = {
            description = "Hostile moonkin roam in ever increasing numbers to our east. They once were " ..
                "thought to be gentle, almost mystical creatures. While some continue to hold reverence " ..
                "for them, the safety of Auberdine forces me to keep a more realistic view.\n\nI've " ..
                "received reports that moonkin are being drawn to a large red crystal along Darkshore 's " ..
                "eastern mountain range. No one has any idea what that crystal is, or even if it really " ..
                "exists. I want you to locate it over there and report back to me what you find.",
            rewardMoney = 600,
        },
        [4842] = {
            description = "To tell you the truth, although there are no volcanoes here in Winterspring, I " ..
                "believe that there are far more threatening reasons for these hot springs...\n\nWell, I " ..
                "think you'll want to see it for yourself. You'll need to travel the length of " ..
                "Winterspring, and head to the very south. When the air becomes thick and muggy, and the " ..
                "sky turns dark, you'll have found what I believe to be the source of the hot " ..
                "springs.\n\nHave a look. I'm sure you'll have many questions when you return.",
            rewardItems = {{15789, 1}},
        },
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
        [4901] = {
            description = "At the very top of the ridge lies what I believe to be an altar of the goddess " ..
                "Elune. From what I can tell, we need to light the five torches in each cave, and then we " ..
                "will be able to access the altar directly.\n\nI transcribed some incantations carved " ..
                "into the stone in the ancient ruins of Kel'Theril, which I believe are the secret to " ..
                "unlocking the altar. I'll need your help to light each torch, while I recite the " ..
                "spell.\n\nIf we are successful, you'll be able to report our findings to Erelas!",
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
        [4964] = {
            description = "I will get started immediately on crafting your orb and infusing your new " ..
                "demon into it. When done, you will have the choice of having it in the form of a staff " ..
                "or orb. I always felt it was important to cater to a warlock's chosen weapon... I see no " ..
                "reason not to continue that practice.",
            rewardChoices = {{15108, 1}, {15106, 1}},
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
        [5048] = {
            description = "She's a tad ornery, and quite possibly out of her gourd... but the records " ..
                "indicate that Ol' Emma does fit the framework of who Emma Felstone might be.\n\nPerhaps " ..
                "you've seen Ol' Emma wander the city - she talks to herself, most often in nonsensical " ..
                "jibber-jabber. Still, she doesn't hurt anything or anyone, so folks pretty much leave " ..
                "her be.\n\nAll things considered, I would say that Ol' Emma is in fact Emma Felstone. " ..
                "You might try asking if her last name is indeed Felstone.",
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
        [5087] = {
            description = "Very interesting, <name>...\n\nWhen this toxic substance is mixed with the " ..
                "water from the hot springs, it loses its toxicity, only retaining the ability to " ..
                "temporarily affect those that ingest it. This must be why the Winterfall protect the hot " ..
                "springs so fervently -- they need them to purify their firewater.\n\nWe need to stop " ..
                "this -- cut off contact between the Winterfall and the Deadwood. A group of runners " ..
                "walks the distance between their village and Felwood. Find and defeat them, and steal " ..
                "their shipment.",
        },
        [5089] = {
            description = "From the corpse of the defeated serpent you uncover what appears to be a note " ..
                "of some importance: A letter from his superior, General Drakkisath, concerning " ..
                "protocol.\n\nYour instinct tells you that you should take it to Marshal Maxwell.",
        },
        [5091] = {
            description = "Hear ye, hear ye! All heroes are called upon to heed these words!\n\nA call to " ..
                "arms has been issued by the Kingdom of Stormwind! All able bodied individuals are " ..
                "entreated to take up arms against the dark threat of the Scourge in the northern lands " ..
                "of the Eastern Kingdoms! Rumors fly of new threats rising from the ruins of the " ..
                "Plaguelands!\n\nHeroes of the realm - seek out Commander Ashlam Valorfist who has set up " ..
                "his base camp in Chillwind Camp, north of the Alterac Mountains!",
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
        [5125] = {rewardChoices = {{17044, 1}, {17045, 1}}},
        [5126] = {description = "The Satyr paces about and talks to himself. Do you wish to question him?"},
        [5127] = {
            description = "Lorax makes deals, he does not accept them from insignificant mortals.\n\nA " ..
                "deal I shall make with you, however... take this pike, it is imbued with powerful Fel " ..
                "energies. When you find Goraluk Anvilcrack, slay him and drive this pike through his " ..
                "dying heart. His soul he bartered, his soul I shall have. Return the pike and return the " ..
                "breastplate that the thief stole and I shall teach you what it is that he was to learn.",
            rewardItems = {{12696, 1}, {9224, 5}, {12849, 1}},
        },
        [5152] = {
            description = "Oh, I'm so lonely! Where is my family? Auntie Marlene told me to stay here, " ..
                "but then she left and never came back! And my dad... have you seen him?\n\nMaybe Auntie " ..
                "Marlene knows where he is. She lives near Andorhal, in a house to the south. I think it " ..
                "was on a hill... she said it was on a hill.\n\nPlease, <name>. You're my new friend! " ..
                "Will you talk to my Auntie for me?",
        },
        [5159] = {
            description = "Thank the spirits, <name>. They are the ones that have come to your aid, not " ..
                "me.\n\nI give this purified water to you now. Please give my regards to Greta and my " ..
                "best wishes. She is tackling something greater than many of us... as I'm sure she will " ..
                "soon find out.\n\nThe Shadow Council is not a force to be trifled with, <name>. Remember " ..
                "that.\n\nGo now. Take the water and return to Greta.",
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
        [5166] = {
            description = "The forging of a powerful breastplate to protect against the unrelenting " ..
                "attacks of the chromatic flight is one built upon irony.\n\nThe scales of the very " ..
                "beasts we battle must be sewn to the pristine carapace of an elder chromatic drake or " ..
                "dragon. None are known to exist at this time and we should hope that none will ever " ..
                "exist.\n\nLastly, perhaps the most difficult of all components: the blood of " ..
                "heroes.\n\nThe Sculptor must ultimately forge this creation.",
            rewardItems = {{12895, 1}},
        },
        [5167] = {
            description = "The carapace of a mature chromatic drake is needed to form the foundation of " ..
                "the leggings. Brilliant chromatic scales are then layered upon the wire frame and " ..
                "enchanted in the blood of heroes. Finally, the supple skin of shadow must be applied to " ..
                "the inner greaves.",
            rewardChoices = {{12903, 1}, {12945, 1}},
        },
        [5201] = {
            description = "My presence goes unnoticed by most, <name>. However, there is an annoyance " ..
                "that seems firmly rooted here in Winterspring: the Winterfall furbolg.\n\nAlthough I " ..
                "have never directly attacked the furbolg, they seem crazed, fearful of anything in their " ..
                "path. I have watched them slay countless creatures that had the misfortune to simply be " ..
                "in the wrong place at the wrong time.\n\nI am weary of their meddling -- please, help me " ..
                "by fighting back. Slay the furbolg and keep them away from Frostsaber Rock.",
        },
        [5206] = {
            description = "Chromie said the relics you gathered are reagents to a powerful spell, and one " ..
                "more is required: skulls from the scourge who took part in the battle of " ..
                "Darrowshire.\n\nTake this crystal and hunt scourge champions for their skulls. The " ..
                "crystal is enchanted; if a champion took part in the battle, then when you pass the " ..
                "crystal over its skull it will resonate. Bring me those resonating skulls.\n\nGo, " ..
                "<name>. You'll find scourge champions in the Noxious Glade to the north and the Fungal " ..
                "Vale to the west.",
        },
        [5211] = {
            description = "Many of the defenders fell at the battle of Darrowshire. And many roam again " ..
                "as the ghastly servants of the Scourge! Find these poor souls and end their " ..
                "misery!\n\nHunt cannibal ghouls, gibbering ghouls and diseased flayers. Many of these " ..
                "fiends were once the good folk of Darrowshire and destroying their forms now will set " ..
                "their souls free.\n\nYou will find them in Plaguewood and Corin's Crossing, and in other " ..
                "Scourge strongholds of Eastern Plaguelands.",
        },
        [5212] = {
            description = "The Forsaken apothecaries are not the only beings in this world schooled in " ..
                "the sciences.\n\nI have been studying the plague for years, <race>. We had previously " ..
                "thought that the potency of the plague was dwindling, but what I have discovered here in " ..
                "the Plaguelands is startling. The plague seems to be growing in strength!\n\nI need to " ..
                "run more tests! The most potent source of the plague is from the tainted flesh of the " ..
                "most recently infected. Travel to Stratholme and bring me samples, <name>.",
            rewardMoney = 18000,
        },
        [5213] = {
            description = "You will have to delve deeper into Stratholme, <name>.\n\nBeyond the first " ..
                "gates you will find the ziggurats. We know that the Scourge draws great power from these " ..
                "structures. Search the Ziggurats and return with any information that you may discover.",
            rewardChoices = {{13209, 1}, {19812, 1}},
        },
        [5214] = {
            description = "Terrible thing... what happened to Ezra. You see, the town was sacked and Ezra " ..
                "didn't want to leave his precious goods behind. The last thing I remember him saying " ..
                "was, 'I'll burn every last leaf before they get their damned, dirty hands on them!'\n\nI " ..
                "may love a good stogie but I'm no fool. I left Ezra and his delightful store that day. I " ..
                "assume he went down in flames but if there's a chance that even one box of his famous " ..
                "tobacco is still intact...\n\nWhat do you say, <name>? Find a box for ol' Smokey?",
            rewardItems = {{13171, 1}},
        },
        [5243] = {
            description = "I look at my undeath as a malady, <race>. An illness that merely requires " ..
                "treatment; however, it is also a great blessing for the Argent Dawn. What better vessel " ..
                "to smite the heathens of the Scourge than through the undead?\n\nI am revered by my " ..
                "colleagues because of the sacrifices I have made, but the accolades mean nothing to " ..
                "me.\n\nIf you are interested in assisting the Argent Dawn, then a job I can " ..
                "offer.\n\nVenture to Stratholme and recover our surplus of holy water. Search the supply " ..
                "crates.",
            rewardChoices = {{13216, 1}, {13217, 1}},
            rewardItems = {{3928, 5}, {6149, 5}},
            rewardMoney = 18000,
        },
        [5251] = {
            description = "Anything taken to an extreme is hazardous to our world, <name>. Take for " ..
                "example, the Scarlet Crusade. Do you believe that their blind zealotry serves a greater " ..
                "good? How many innocents have they destroyed in the name of the Light?\n\nBlasphemers, " ..
                "one and all!\n\nOne in particular interests me, though; the Archivist Galford of " ..
                "Stratholme: A man that watches over the Crusade's most valued documents. Destroy him and " ..
                "burn down his archives! Should you succeed, return to me and be rewarded.",
            rewardMoney = 18000,
        },
        [5261] = {
            description = "Eagan Peltskinner is looking for someone to hunt wolves for him. That's good " ..
                "news, because we're seeing a lot more wolves in Northshire Valley lately.\n\nIf you're " ..
                "interested then speak with Eagan. He's around the side of the abbey, to the left.",
        },
        [5262] = {
            description = "You try and gather your thoughts as the dust settles across the chamber. You " ..
                "go over the events that just transpired and still cannot comprehend the gravity of the " ..
                "situation.\n\nThe Grand Crusader of the Scarlet Crusade a demon? And not just any demon " ..
                "but brother to Varimathras, arch lord of the Undercity?\n\nYou carefully stow the " ..
                "severed head of the dreadlord into your pack. Surely, none would believe the tale you " ..
                "would tell without proof.\n\nDuke Nicholas Zverenhoff must be told at once!",
        },
        [5263] = {
            description = "You display a natural aptitude for destruction and you follow orders. It is " ..
                "rare to see the two coexist. I am beginning to think that you may make an excellent " ..
                "vehicle of divine justice.\n\n<Zverenhoff clasps his hands together in front of his " ..
                "face.>\n\nKel'Thuzad's errand boy rules over Stratholme. Prove to me that you are a " ..
                "champion - my champion. Destroy Baron Rivendare and return to me with his head.",
        },
        [5264] = {
            description = "I am about to bestow a great honor upon you, <name>.\n\nLord Maxwell wishes to " ..
                "reward you for your service to the Argent Dawn!\n\nIt has been years since Maxwell has " ..
                "granted audience to outsiders.",
        },
        [5265] = {
            description = "Through the years the Argent Hold has remained locked. None have been worthy " ..
                "to reach inside and take from it the power of the Argent Dawn - until today.\n\nthe " ..
                "Argent Hold is now open to you, <name>.",
            rewardChoices = {{13246, 1}, {13243, 1}, {13249, 1}},
            rewardMoney = 27000,
        },
        [5281] = {
            description = "There are those that died tragically in the fall of Stratholme. Many took " ..
                "their own lives, opting to hurl themselves into the myriad flames of the smoldering city " ..
                "rather than become one of the Scourge.\n\nThey now walk the streets of Stratholme as " ..
                "restless spirits.\n\nWe must aid them, <name>!\n\nI have an associate named Egan who has " ..
                "been doing miraculous work with ghosts and souls. Seek him out. He walks the eastern " ..
                "Plaguelands, near Stratholme, testing his innovations.",
        },
        [5282] = {
            description = "I draw my power - my will to continue living and breathing - from the " ..
                "unmitigated hatred I have for the Scourge and all that they have done. I am, however, no " ..
                "zealot. There are those, like the Scarlet Crusade, who would sooner destroy the innocent " ..
                "undead than lend them even an ounce of compassion.\n\nWhich brings me to this: My " ..
                "blaster. It will unchain the tortured souls from Stratholme.\n\nUse it on the ghosts " ..
                "that haunt the ransacked streets. Free their souls.",
            rewardItems = {{13315, 1}},
            rewardMoney = 18000,
        },
        [5302] = {
            description = "One day, I will create a legendary hammer. A hammer fit for a Warchief!\n\nIt " ..
                "is my life's work, <name>. My passion. I recognize that you have the potential to be " ..
                "among us, one of us - a weaponsmith. I am the one that can help you harness that " ..
                "potential.\n\nA simple task is all that you must complete. Simple for one of your " ..
                "exceptional skill.",
        },
        [5305] = {
            description = "Within the confines of the Scarlet Bastion lies sweet Serenity. The Crimson " ..
                "Hammersmith guards the recipe with his life. Defeat him and bring me his apron. For " ..
                "that, I shall train you to become a hammersmith.\n\nUnderstand this: Once you have " ..
                "chosen the path of the hammersmith, the paths of the swordsmith and axesmith will no " ..
                "longer be available.",
            rewardItems = {{12824, 1}},
        },
        [5306] = {
            description = "Don't let her beauty fool you, <class>. The shadow huntress, Vosh'gajin is " ..
                "deadly and deranged.\n\n< Kilram points to the scar on his face.>\n\nAye, she gave me " ..
                "that - a love tap, she called it.\n\nThe time for vengeance has finally come.\n\nYou can " ..
                "find Vosh'gajin in Blackrock Spire. Slay her and return to me with her snakestone. Do " ..
                "this and I will teach you the ways of the axesmith.",
            rewardItems = {{12821, 1}},
        },
        [5307] = {
            description = "If I am short with you, it is for a reason. The plans for the creation of the " ..
                "great blade, Corruption, have been stolen by the Black Guard: Elite skeletal units of " ..
                "Baron Rivendare.\n\nYes, Baron Rivendare of Stratholme.\n\nThe Black Guard swordsmith " ..
                "now guards those plans with his... undeath.\n\nSlay him and return proof of this deed " ..
                "and I shall train you in the ways of the swordsmith.",
            rewardItems = {{12825, 1}},
        },
        [5341] = {
            description = "Within the Scholomance lays the Barov family fortune. I, Alexi Barov, am one " ..
                "of the last two remaining heirs of the house Barov. My brother, Weldon, is the " ..
                "other.\n\nWeldon, the miserable coward, fled during the war and thus retained his " ..
                "worthless existence as a human.\n\nHe now searches for the deeds so that he may claim " ..
                "the fortune for his own. Recover the deeds before my brother does and I shall make you " ..
                "wealthy beyond your wildest dreams!",
            rewardMoney = 18000,
        },
        [5342] = {
            description = "Naturally, with my brother still alive, there may be some contention as to the " ..
                "primary beneficiary of the family's fortune. This cannot be.\n\nA low down guttersnipe " ..
                "like you isn't above a little cold-blooded murder, I hope.\n\nIt's a simple task and one " ..
                "that I expect you will complete; that is, if you wish to claim your reward.\n\nWeldon " ..
                "sits under Alliance protection at Chillwind Camp, to the east. Slay him, return his " ..
                "head.\n\n<Alexi yawns.>\n\nHurry along now.",
            rewardItems = {{14022, 1}},
            rewardMoney = 18000,
        },
        [5343] = {
            description = "My dear brother Alexi. What a fool I was to spare his life. I looked into the " ..
                "face of the enemy, one of the undead, and let him live.\n\n<Weldon spits.>\n\nHe now " ..
                "searches for MY inheritance. This simply cannot happen.\n\nFind my family's deeds before " ..
                "that vile retch gets his boney hands upon them and I shall reward you with vast riches. " ..
                "They lay in the ruins of the Scholomance. Make haste!",
            rewardMoney = 18000,
        },
        [5344] = {
            description = "With the deeds recovered, there is but one thing left to do. Alexi must be " ..
                "killed. With him dead, I need not ever worry about an unscrupulous gang of mercenaries " ..
                "seeking my head.\n\nIt's a simple task. Alexi hides under the protection of the Horde - " ..
                "at the Bulwark.\n\nNo, I do not expect you to just walk up and kill him, I want his " ..
                "head! How you get it... well, that part is up to you. That type of behavior is below one " ..
                "of my noble upbringing.",
            rewardItems = {{14023, 1}},
            rewardMoney = 18000,
        },
        [5382] = {
            description = "Krastinov is responsible for the deaths of thousands. He must be punished, " ..
                "justice must be meted out.\n\nFind him and exact upon him the agony he has inflicted " ..
                "upon countless innocents. Once he is destroyed, burn our remains. Turn them to ashes, " ..
                "<name>.",
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
        [5385] = {
            description = "You pick up the sack carefully and prepare to make your way back to Jessir " ..
                "Moonbow on the border of Felwood and Ashenvale. Hopefully the paladin will be given the " ..
                "proper respects once you've passed his remains on to his friends.",
            rewardChoices = {{15706, 1}, {15705, 1}},
            rewardMoney = 2200,
        },
        [5421] = {rewardItems = {{13546, 1}}},
        [5461] = {
            description = "The undead fear life just as the living fear death. It is not unusual for a " ..
                "sentient undead being to completely destroy all remnants of his or her previous life " ..
                "after having turned.\n\nUnfortunately, in order to create an artifact capable of " ..
                "reverting Ras Frostwhisper to a mortal, we must have a keepsake from his years among the " ..
                "living.\n\nYou must venture to the ruined city of Stromgarde, Frostwhisper's home, and " ..
                "search for such an item. May luck be with you, <name>.",
        },
        [5462] = {
            description = "Upon tainted soil, the keepsake must be attuned.\n\nIt is rumored that " ..
                "Stratholme is where Frostwhisper succumbed to the Lich King. Upon those bloodied grounds " ..
                "he gave his life - freely and with motive - to become one of the undying.\n\nIt is those " ..
                "grounds that must be found.\n\nThere is one, an undead dissenter of the Scourge, freed " ..
                "by the Banshee Queen but loyal to the cause of the Argent Dawn. Find him: Leonid " ..
                "Barthalomew the Revered. He may know more. Seek out Light's Hope, <name>.",
        },
        [5463] = {
            description = "I watched as the human, Ras Frostwhisper, pledged his undying soul to the Lich " ..
                "King. He drew the dagger to his own throat and with a smile, cut from ear to ear. His " ..
                "body collapsed inside the borders of the pentagram. The Lich King stood over the fallen " ..
                "mage and with a single motion, Ras Frostwhisper the lich, was born.\n\n<Leonid gazes at " ..
                "the ground and then looks up at you.>\n\nYes, <race>, I remember. What you seek has a " ..
                "name - Menethil's Gift: The ground blessed by the Lich King - holy ground to Scourge.",
        },
        [5464] = {
            description = "The soul of the fallen clings to that which represents its former life and " ..
                "transforms the item into a soulbound keepsake. You pick the item up and place it in your " ..
                "pack.",
        },
        [5465] = {
            description = "Return to Marduke with the keepsake, <name>. He will instruct you in its use.",
        },
        [5466] = {
            description = "There is but one task remaining, <name>. Confront the lich, Ras Frostwhisper, " ..
                "in his lair.\n\nUse the power of the keepsake against the beast - be unrelenting in your " ..
                "actions! Weather the blows that the flailing beast will surely bring down upon you. Do " ..
                "not give in to the pain!\n\nWhen the ritual is complete, Ras will be mortal once more. " ..
                "It is at that point that he must be slain. Strike him down and take his human head.",
            rewardChoices = {{13982, 1}, {13986, 1}, {13984, 1}},
            rewardItems = {{14002, 1}},
        },
        [5481] = {
            description = "Master want weeds. Us gots big hands and not good at picking. You help us and " ..
                "we not hurt you. Us need gloom weed. Many weeds around here and near road.\n\nWhen you " ..
                "have gloom weed you take to Master Holland in Brill graveyard.",
        },
        [5504] = {
            description = "Your service to the Argent Dawn is to be commended, <name>. You are truly " ..
                "revered amongst us. I have been authorized to make available for you to purchase one of " ..
                "the Dawn's most valued items - our magic resistance mantles.\n\nApplication of a mantle " ..
                "to your existing shoulder piece will enhance your resistance to the powers of magic in " ..
                "one of five potential ways. As a sign of continued dedication to our cause, I ask for no " ..
                "less than ten of our valor tokens in exchange for access to these mantles.",
        },
        [5505] = {rewardItems = {{13704, 1}}},
        [5507] = {
            description = "Your service to the Argent Dawn is to be commended, <name>. You are truly " ..
                "revered amongst us. I have been authorized to make available for you to purchase one of " ..
                "the Dawn's most valued items - our magic resistance mantles.\n\nApplication of a mantle " ..
                "to your existing shoulder piece will enhance your resistance to the powers of magic in " ..
                "one of five potential ways. As a sign of continued dedication to our cause, I ask for no " ..
                "less than ten of our valor tokens in exchange for access to these mantles.",
        },
        [5511] = {rewardItems = {{13704, 1}}},
        [5513] = {
            description = "Your service to the Argent Dawn is to be commended, <name>. You are truly " ..
                "revered amongst us. I have been authorized to make available for you to purchase one of " ..
                "the Dawn's most valued items - our magic resistance mantles.\n\nApplication of a mantle " ..
                "to your existing shoulder piece will enhance your resistance to the powers of magic in " ..
                "one of five potential ways. As a sign of continued dedication to our cause, I ask for no " ..
                "less than ten of our valor tokens in exchange for access to these mantles.",
        },
        [5515] = {
            description = "A great weight has been lifted from our hearts, <name>, but your task is not " ..
                "yet complete. Krastinov's master, Kirtonos, still lives.\n\nBefore you may face " ..
                "Kirtonos, however, you must first secure a method in which to summon him.\n\nIt is said " ..
                "that Jandice Barov stewards the blood of innocents from Krastinov to Kirtonos.\n\nFind " ..
                "her in the sunken catacombs of Scholomance and strike her down. Bring back any clues " ..
                "that you may find.",
        },
        [5517] = {
            description = "<Brother/Sister> <name> - your deeds on behalf of the Argent Dawn are far too " ..
                "numerous to be recounted easily. As a fitting tribute, I'll part with one of our special " ..
                "Chromatic Mantles of the Dawn - a version that protects the wearer from all forms of " ..
                "resistible magic simultaneously. Chromatic Mantles of the Dawn are reserved for only the " ..
                "mightiest of the Dawn's heroes!\n\nBring to me twenty-five valor tokens as a sign of " ..
                "tribute, and I'll give you the finest of all our mantles.",
            rewardItems = {{18182, 1}},
        },
        [5518] = {
            description = "If you're going to fight the king of this dump - and I think that's what " ..
                "you're bound to do - then you're going to need to get by Captain Kromcrush. Now, you can " ..
                "get by him by killing him, sure. You might actually want to leave him alive.\n\nHow, you " ..
                "ask? Since I've been here, I think I know how to make an ogre suit that will last just " ..
                "long enough to fool these bozos. The only problem is stability - ten minutes tops. Bring " ..
                "me what I need, and I'll make you one. I'm not going anywhere...",
            rewardItems = {{18258, 1}},
        },
        [5519] = {rewardItems = {{18258, 1}}},
        [5521] = {
            description = "<Brother/Sister> <name> - your deeds on behalf of the Argent Dawn are far too " ..
                "numerous to be recounted easily. As a fitting tribute, I'll part with one of our special " ..
                "Chromatic Mantles of the Dawn - a version that protects the wearer from all forms of " ..
                "resistible magic simultaneously. Chromatic Mantles of the Dawn are reserved for only the " ..
                "mightiest of the Dawn's heroes!\n\nBring to me twenty-five valor tokens as a sign of " ..
                "tribute, and I'll give you the finest of all our mantles.",
            rewardItems = {{18182, 1}},
        },
        [5522] = {
            description = "I received a message from my master, Vectus. Well, the message wasn't really " ..
                "from Vectus...it was from someone named Leonid Barthalomew. I don't know Leonid, but he " ..
                "knew my master, and no one knows my master unless he allows it.\n\nLeonid says Vectus " ..
                "wants the dragon eggs. He wants you to deliver them to him at the Light's Hope Chapel in " ..
                "the Eastern Plaguelands.\n\nThat hurts! Why you? Doesn't Vectus trust me? Oh, never " ..
                "mind... just take the eggs and tell Leonid that I did what our master commanded.",
        },
        [5524] = {
            description = "<Brother/Sister> <name> - your deeds on behalf of the Argent Dawn are far too " ..
                "numerous to be recounted easily. As a fitting tribute, I'll part with one of our special " ..
                "Chromatic Mantles of the Dawn - a version that protects the wearer from all forms of " ..
                "resistible magic simultaneously. Chromatic Mantles of the Dawn are reserved for only the " ..
                "mightiest of the Dawn's heroes!\n\nBring to me twenty-five valor tokens as a sign of " ..
                "tribute, and I'll give you the finest of all our mantles.",
            rewardItems = {{18182, 1}},
        },
        [5526] = {
            description = "Your knowledge of Eldre'Thalas - Dire Maul - in Feralas will now come into " ..
                "play, <name>. In the eastern part of the ruined city is where Alzzin the Wildshaper has " ..
                "exerted his corrupt dominion. Go there with all due haste and brave whatever challenges " ..
                "await you.\n\nThe Fruit of Fertility, now corrupted as the Felvine, should be close to " ..
                "Alzzin. When he falls, capture whatever essence of the Felvine you can. Seal it in the " ..
                "Reliquary, and bring it to me.\n\nGood luck, and Cenarion's speed.",
            rewardChoices = {{18535, 1}, {18536, 1}},
        },
        [5527] = {
            description = "The first step is to find a container capable of holding an extremely " ..
                "corruptible substance without the handler suffering ill effects. There is only one sort " ..
                "device I am aware of that could possibly contain something as vile as the Felvine: a " ..
                "Reliquary of Purity.\n\nDeep in the wasteland of Silithus is the remnants of the night " ..
                "elf village known as Southwind. I know one was there many, many years ago. If we are to " ..
                "succeed, I need you to scour those ruins in the hopes of reclaiming it.",
        },
        [5528] = {rewardItems = {{18269, 5}, {18284, 5}}},
        [5529] = {
            description = "The Argent Dawn recently learned that the Scourge are creating their own " ..
                "plagued dragonflight! We must stop them -- if the Scourge gain a force of dragons " ..
                "they'll sweep across Azeroth unchecked!\n\nTheir necromancers are breeding plagued " ..
                "dragons at the Scholomance, in the middle of Darrowmere Lake.\n\nGo to the Scholomance " ..
                "and kill as many hatchlings as you can... before they get any bigger!",
            rewardMoney = 9000,
        },
        [5531] = {
            description = "The eggs you brought were to be used in Scourge experiments to create a " ..
                "plagued dragonflight. These frozen black dragon eggs would have been invaluable in their " ..
                "studies, and would have assuredly quickened their timetable.\n\nNow, it is time we ended " ..
                "their research.\n\nTake the frozen eggs to Betina Bigglezink outside. She is " ..
                "well-learned in science and alchemy, and has produced a weapon we can use against the " ..
                "Scourge. With your help, we will deal them a heavy blow.",
        },
        [5542] = {
            description = "If you are going to remain here, I ask only that you earn your keep. We have " ..
                "many nuisances that could use some 'discipline.'\n\nYou can start with the Plaguehounds " ..
                "and their runts.\n\nI cannot offer much in return, but you are guaranteed a warm meal " ..
                "and some conversation should you succeed.",
        },
        [5543] = {
            description = "Woe to those that foolishly wander into the Plaguelands. All manner of " ..
                "foulness inhabit these woods - from the fanatical Scarlet Crusade, who will kill any " ..
                "that do not bear the mark of the Crusade, to the murderous Scourge, who only look to " ..
                "bolster their numbers by adding more undead to their ranks.\n\nEven the wildlife have " ..
                "been transformed into rapacious, man eating beasts. I ask that you destroy those that " ..
                "would strike from the skies: The Plaguebats.",
        },
        [5628] = {
            description = "Ah, yes, hello, <name>? I'm glad you stopped to talk for a moment. You are a " ..
                "far way from home at such a young age--I admire such ambition. I wish when I was younger " ..
                "I could have mustered the courage to travel the world.\n\nThere was a priestess of your " ..
                "order here looking for you not too long ago. She said it was very urgent you returned to " ..
                "the Temple of the Moon in Darnassus and speak to Priestess Alathea --it had something to " ..
                "do with your training. I wouldn't dally too long if you can help it.",
        },
        [5631] = {
            description = "A priestess recently visited our halls seeking you out, young <race>. She said " ..
                "that she was on a mission to find you and that you should return to the Temple of the " ..
                "Moon in Darnassus as soon as possible. When you arrive, seek out a Priestess Alathea " ..
                "--she will tell you more.\n\nThe Light be with you, <name>.",
        },
        [5636] = {
            description = "Elune bless you, good <race>. I hope your Light finds you and protects you " ..
                "well this day.\n\nOne of your priests was here not long ago looking for you. He " ..
                "mentioned you returning to the Cathedral of Light as soon as possible to speak with High " ..
                "Priestess Laurena. It seems you've done well to garner such attention. I wouldn't spend " ..
                "too much time here--your people have need of you.",
        },
        [5642] = {
            description = "Something important is up in Orgrimmar, <name>.\n\nThe normal messengers that " ..
                "come through here looking for troll priests usually are very casual. This time, they " ..
                "seemed to be in much more a hurry. Don't dally too long in Thunder Bluff. I'd return to " ..
                "the Valley of Spirits as soon as possible.",
        },
        [5647] = {
            description = "Your race is so very strong, <name>. We are proud to call you allies. And as " ..
                "each day's sun sets, you and your kin grow closer to not only finding your true origins, " ..
                "but find great confidence that you are on the right path in so many things. That feeling " ..
                "must make you feel so triumphant.\n\nWord came from Ironforge just recently. It asked " ..
                "that you return there and speak to High Priest Rohan in the Mystic Ward. I would not " ..
                "keep him waiting. May Elune guide your travels.",
        },
        [5651] = {
            description = "There are many lessons that the Forsaken have learned through " ..
                "experience--things that some races can only begin to fathom. And although our path lies " ..
                "in darkness, you will find that a great many things rely on both the light and the dark. " ..
                "Your lessons shall teach you to use both... and with discretion. But heed my words: " ..
                "never forget we were forged in corruption and left to rot like so much carrion. The " ..
                "Darkness is our home.\n\nSeek out Dark Cleric Beryl in Brill when you're ready to learn " ..
                "more.",
        },
        [5655] = {
            description = "I sent here to make sure that you not wander too far from home, <name>. They " ..
                "send me to make sure you return home because Ur'kyo, greatest of our priests, wish to " ..
                "speak to you. You go there. You go to the Valley of Spirits in the orc city and you " ..
                "speak to Ur'kyo. He wait for you now.",
        },
        [5656] = {
            description = "It always warms my undying heart to see priests from all cultures wander the " ..
                "world. To know that power exists that is not arcane and well within our grasp. That's " ..
                "why it is my honor to direct you home, <name>.\n\nUr'kyo, your great priest in " ..
                "Orgrimmar, has asked for your presence. You can find him in the Valley of Spirits.",
        },
        [5657] = {
            description = "Home. Return home, young <race>.\n\nYour spiritual leader Ur'kyo begs you to " ..
                "return to him and speak about the path you travel.\n\nGo to the Valley of Spirits in the " ..
                "great Horde city of Orgrimmar. You will find him there.",
        },
        [5660] = {
            description = "You be far from home, <class>. You be needed there, back in your city under " ..
                "the ground. Your mistress, the one you be callin' Aelthalyste be needin' you back there. " ..
                "Like my tribe, there things you must learn only from her. Don't be stayin' here too " ..
                "long. You should be headin' to the War Quarter as fast as a zeppelin can carry you.",
        },
        [5721] = {
            description = "Now, <name>, you will take part in battle of Darrowshire, and you will save " ..
                "Joseph Redpath.\n\nPlace this relic bundle in the Darrowshire town square, and the " ..
                "spirits of Darrowshire will rise. Join their battle and assure that these two things " ..
                "come to pass: Davil must survive beyond the death of Horgus, and Redpath must survive to " ..
                "be corrupted, then defeated.\n\nAfter defeating the corrupted Redpath, his spirit will " ..
                "be saved. Speak with him, then return to his daughter Pamela.",
            rewardItems = {{15723, 1}},
        },
        [5741] = {
            description = "The Burning Blade in Thunder Axe Fortress to the east is rumored to have " ..
                "acquired the Sceptre of Light from the Naga. Legend tells that the sceptre is able to " ..
                "sink entire cities under the great seas. The Burning Blade must not be allowed to " ..
                "possess such power.\n\nTo that end, you must retrieve the sceptre yourself! It is held " ..
                "by a Burning Blade seer, who studies the sceptre from atop one of the Thunder Axe " ..
                "watchtowers.",
            rewardMoney = 3500,
        },
        [5803] = {
            description = "Araj the Summoner lords over Andorhal from the ruined city's heart. We know " ..
                "that he was the former leader of Scholomance before claiming the city as his own. To " ..
                "finish the key, we will need his signet - called a scarab - mounted as the head of the " ..
                "key.\n\nMake your way into the heart of Andorhal, and break his hold on the city now " ..
                "that he is drawn into the open. Once destroyed, seize his scarab from his fallen " ..
                "phylactery!\n\nThe Key to Scholomance awaits, <name>!",
        },
        [5804] = {
            description = "Araj the Summoner lords over Andorhal from the ruined city's heart. We know " ..
                "that he was the former leader of Scholomance before claiming the city as his own. To " ..
                "finish the key, we will need his signet - called a scarab - mounted as the head of the " ..
                "key.\n\nMake your way into the heart of Andorhal, and break his hold on the city now " ..
                "that he is drawn into the open. Once destroyed, seize his scarab from his fallen " ..
                "phylactery!\n\nThe Key to Scholomance awaits, <name>!",
        },
        [5821] = {
            description = "Under normal circumstances, Rigger and I would lead our kodo past the Kolkar " ..
                "Centaur. Every now and then we hear the Centaur war drums, and when we hear those we " ..
                "stop. It's not good for business to be dead!\n\nI'll tell you what <class>, if you " ..
                "protect us past the Kolkar village we'll make it worth your while.\n\nIt's just a short " ..
                "distance, all you need to do is keep the caravan intact and you can pick up your reward " ..
                "from Smeed Scrabblescrew - he is down the road a bit. We do a little business together.",
            rewardItems = {{15689, 1}},
        },
        [5848] = {
            description = "The painting... It hung on the wall of my workshop - inside the Order's " ..
                "barracks - for years.\n\nAfter Tirion's trial was over, I knew that I could no longer " ..
                "keep the painting visible. I hid it in a place that they would never think to " ..
                "look.\n\nTravel to Stratholme and make your way deep inside what is now the Scarlet " ..
                "Bastion, search for a painting of our twin moons. Chip away at the paint until you " ..
                "uncover my master work, ' Of Love and Family.'\n\nMay the Light guide your actions.",
        },
        [5861] = {
            description = "<name>, you have done all that I have asked thus far. Only one step remains in " ..
                "your quest of redemption.\n\nYou must deliver the items you have collected to Taelan. " ..
                "Unfortunately, Taelan and his Scarlet Crusaders will attack you on sight.\n\nThere is " ..
                "only one way in which to deliver my message and that is through a guise of " ..
                "deception.\n\nTo the south you will find Uther's tomb. An old and trusted confidant of " ..
                "mine, Myranda, now resides there - seek her out. Show her the items and she will assist " ..
                "you.",
        },
        [5862] = {
            description = "I am what you would call, an illusionist. Though I may be able to create an " ..
                "illusion to allow you entry into Hearthglen, be warned; my powers have their " ..
                "limitations.\n\nShould you travel too far from these lands, the effects of the illusion " ..
                "will cease. The spell itself takes a great amount of concentration and power from me, " ..
                "and thus, I can only sustain the effect for a short time.\n\nSpeak to me again when you " ..
                "are ready.",
        },
        [5882] = {rewardItems = {{11516, 2}}},
        [5887] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
        [5888] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
        [5889] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
        [5890] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
        [5941] = {
            description = "You have gathered many relics of the battle of Darrowshire. Each time you " ..
                "returned with more, my heart yearned for my village... yearned to protect it from its " ..
                "fate.\n\nI know that cannot be, but Chromie, that strange gnome in Andorhal, tells me it " ..
                "is possible. She says you can save Darrowshire!\n\nShe asked me to gather together the " ..
                "relics, and to have you bring them to her. She said that she awaits you in the ruined " ..
                "inn of Andorhal.",
        },
        [5942] = {
            description = "Daddy told me to give you this key. He said it opens a chest out back behind " ..
                "the house.\n\nHe also wanted me to thank you. Did you do a favor for him? Did you tell " ..
                "him you found my doll?\n\nWell here's the key. And thank you <name>. Thank you! You're a " ..
                "very nice <man/lady>!",
            rewardItems = {{15855, 1}, {15856, 1}, {15857, 1}},
        },
        [5944] = {
            description = "For so long, I have been a puppet of the Grand Crusader. What reason was there " ..
                "to fight against what the Scarlet Crusade had become? It has been decades, yet the " ..
                "memories of my father; those precious memories, they are what have kept me alive.\n\nI " ..
                "have dreams, stranger. In these dreams my father is with me. He stands proudly at my " ..
                "side as I am inducted into the Order. We battle legion of Scourge, side by side. We " ..
                "bring honor to the Alliance, to Lordaeron.\n\nI want not to dream anymore.\n\nTake me to " ..
                "him.",
            rewardChoices = {{15411, 1}, {15413, 1}, {15418, 1}, {15421, 1}, {16058, 1}},
        },
        [5981] = {
            description = "Around 4,000 years ago, Tyrande Whisperwind saved the life of the frostsaber " ..
                "queen, at the hands of rampaging giants. Since then, the frostsabers have been allies of " ..
                "the night elves.\n\nThese same giants that once were a danger to the frostsabers, still " ..
                "exist not too far from here. They are called the frostmaul, and they have taken over the " ..
                "large valley to the south.\n\nProve your loyalty to the frostsabers; kill these giants " ..
                "in the name of the frostsaber queen, Shy-Rotam!",
        },
        [6024] = {
            description = "Kill me. Before it's too late.\n\nI am Hameya. While traveling to Zul'Mashar, " ..
                "my brethren and I ate some bad meat... and we changed. We are infected.\n\nI can feel " ..
                "the lich's words now, urging me to reach Zul'Mashar and infect more of my people. I " ..
                "cannot resist, and so I wrote this scroll before my will left me.\n\nI buried a chest in " ..
                "dirt next to a wagon behind this crypt, but only my key will open it. I have the key. If " ..
                "you want my treasure, then find me.\n\nKill me. Before it's too late.",
            rewardItems = {{15814, 1}, {15815, 1}},
            rewardMoney = 9000,
        },
        [6027] = {
            description = "<name>, I entrust you with the Gem of the Serpent. Place this gem on the " ..
                "Serpent Statue's hand on Ranazjar Isle, a small island northwest of here. Placing it " ..
                "will summon the one who protects the Book of the Ancients. This book contains the " ..
                "secrets of the naga, secrets that have been kept for centuries. Bring this book to me, " ..
                "and we will learn much about our scaled foes!",
            rewardChoices = {{16791, 1}, {16793, 1}},
            rewardMoney = 4500,
        },
        [6042] = {
            description = "You cannot take two steps off of this farm without running into one of those " ..
                "obnoxious bats. I want to be able to take the hounds out and slaughter Scourge without " ..
                "being accosted by any damned, dirty bats. Obviously, I have better things to do with my " ..
                "time than mindlessly kill bats day in and day out. You, however, do not.\n\nWhat? Your " ..
                "training? This is your training! Now get out of my sight and don't come back until " ..
                "you've killed a fair number of those winged demons. Don't disappoint me.",
            rewardMoney = 9000,
        },
        [6064] = {
            description = "Hi there, <lad/lass>! So, you'd be wanting to know how you can gain a pet of " ..
                "your own?\n\nWell, let's get started. There's nothing more important than yer equipment " ..
                "when it comes to hunting, but we can chat about my new Shrapnel Blaster some other time. " ..
                "Fer now, let's focus on something I'm sure you're quite interested in: a pet!\n\nThe " ..
                "best way to learn is for you to try out several creatures as companions and see what ya " ..
                "like. So, find a large crag boar, then use the taming rod to tame it.",
        },
        [6067] = {
            description = "Hello, young hunter. You look to me like you are skilled enough to handle a " ..
                "beast and train it as your companion.\n\nYou must see Yaw Sharpmane in Bloodhoof " ..
                "Village. He can put you on the path to earning a pet of your own.",
        },
        [6071] = {
            description = "Hello, young hunter. You look to me like you are skilled enough to handle a " ..
                "beast and train it as your companion.\n\nYou must see Dazalar in Dolanaar. He can put " ..
                "you on the path to earning a pet of your own.",
        },
        [6102] = {
            description = "You have tamed two creatures that inhabit the land, now you must tame one that " ..
                "soars the skies. Use the taming rod to tame a strigid screecher, found west of here. " ..
                "Practice your skills with this mighty owl at your side.\n\nWhen you return, I will " ..
                "bestow you with the skills you will need to tame an animal of your choosing to be your " ..
                "companion; this creature will face the challenges you face, and gain experience " ..
                "alongside you. I will also show you how to call it and dismiss it as you wish.",
        },
        [6133] = {
            description = "The high elves of the Quel'Lithien lodge possesses something that belongs to " ..
                "me, <class>: A document detailing my life as a mortal.\n\nBefore you ask; no, you most " ..
                "certainly are not privy to such information. Just do as I tell you, worm: Recover the " ..
                "registry.\n\nAnd imbecile, be sure to leave as much strife and grief as possible in your " ..
                "wake. Leave them suffering...",
            rewardMoney = 9000,
        },
        [6134] = {
            description = "There's a valley to the southeast, the Valley of Bones, haunted by Magram " ..
                "ghosts. Sounds scary, doesn't it? Well think how scary it is to the Magram! If we " ..
                "captured ghost energy from that place, I bet it'd be worth plenty to those " ..
                "centaurs.\n\nHere, take this crate of ghost magnets. If you place one between the two " ..
                "big skeletons in the valley, the Dead Goliaths, then ghosts will wander to it. Distance " ..
                "yourself, take out the ghosts and get their ghost-o-plasm --that's what we'll sell to " ..
                "the Magram.",
            rewardChoices = {{15864, 1}, {15865, 1}},
            rewardMoney = 4500,
        },
        [6135] = {
            description = "Up until now, you have completed the missions I have assigned; even if not in " ..
                "the most timely manner.\n\nI suppose you think that you are ready for a challenge. " ..
                "Yes... Yes, imbecile, perhaps you are ready for a more involved set of missions.\n\nThe " ..
                "albino demon bat, Duskwing, roams the countryside just north of here. Track him down and " ..
                "destroy him. Return to me with a patch of his white fur and you shall be rewarded.",
            rewardChoices = {{16994, 1}, {16995, 1}},
            rewardMoney = 9000,
        },
        [6136] = {
            description = "Past the Argent Dawn encampment of Light's Hope and west of Northdale, you " ..
                "will find the corpulent maggot beast, Borelgore.\n\nI've lost entire regiments to that " ..
                "monster. His size knows no bounds! The more he eats the greater his girth " ..
                "becomes...\n\nWhile I would not suffer any emotional harm should the beast devour you, I " ..
                "would prefer that you were the victor. I recommend you enlist the help of others for " ..
                "this mission. Borelgore has been known to devour small battalions foolish enough to " ..
                "attack him.",
            rewardChoices = {{17002, 1}, {17003, 1}, {17004, 1}},
            rewardMoney = 9000,
        },
        [6142] = {
            description = "You have the look of a fisherman, <class>! I love to fish - been fishing all " ..
                "my life. The best bait to use is soft-shelled clam meat; the fish just can't resist, you " ..
                "know what I mean?\n\nUp north you will find a wrecked ship off the coast. Soft-shelled " ..
                "clams are littered throughout the area. If you bring me back 10 pieces of soft-shelled " ..
                "clam meat, I will give you something in return.",
            rewardChoices = {{15585, 1}, {15587, 1}, {15588, 1}},
        },
        [6144] = {
            description = "The order has come down, <class>. Varimathras himself has requested that I " ..
                "send my most 'capable' agents back to the Undercity for a highly sensitive tactical " ..
                "operation.\n\nUnfortunately, my most capable agents were killed over three years ago. In " ..
                "their stead I have a collection of brain dead riff-raff.\n\n<Nathanos stares coldly at " ..
                "you.>\n\nTravel to the Undercity at once and report to Varimathras. Do not embarrass me, " ..
                "<class>!",
        },
        [6145] = {
            description = "Just as the body cannot survive without the head, the head cannot survive " ..
                "without the body. The defenses of the Scarlet Crusade's command inside Stratholme are " ..
                "almost impenetrable. We must, instead, cut the body out from under the head.\n\nMy " ..
                "Deathstalkers have been collecting data on the activity of the Crusade outside of " ..
                "Stratholme. Each day, a report is sent from their central command to Tyr's Hand. This " ..
                "report is the key, <race>! Find the Crimson Courier and recover that report. Return it " ..
                "to Nathanos.",
        },
        [6146] = {
            description = "I have made some adjustments to this command. Should our little ruse work, " ..
                "they will expose the Scarlet Oracle and we shall strike!\n\nNow pay attention, <class>. " ..
                "You are to deliver this command to the Crusader Lord, Valdelmar.\n\nHow? You are going " ..
                "to hand it to him, imbecile.\n\nTake the command and this rotten apple to Tyr's Hand. " ..
                "When you cross into the city, eat the apple. You will transform into something more... " ..
                "palatable to the humans. Take the command and hand it to the Crusader Lord, Valdelmar.",
        },
        [6147] = {
            description = "The Grand Crusader makes an unusual request. Hrm, regardless... what he asks " ..
                "will be done. Return to the Scarlet Bastion and notify him that the Oracle will be en " ..
                "route shortly.\n\nWe will take every precaution to ensure that she makes it to " ..
                "Stratholme unharmed.",
        },
        [6148] = {
            description = "Demetria is chief advisor to the Grand Crusader. She is called the Oracle due " ..
                "to her 'otherworldly' senses. She has successfully assisted the Crusade in several of " ..
                "their victories against the Scourge.\n\nWhile this ruse was successful in exposing her, " ..
                "if she truly does possess psychic powers, she will undoubtedly be expecting some sort of " ..
                "trouble. You are going to provide that 'trouble.'\n\nTrack down the Oracle and terminate " ..
                "her. They should be moving out of Tyr's Hand as we speak. Make me proud, worm.",
            rewardChoices = {{16996, 1}, {16997, 1}, {16998, 1}},
            rewardMoney = 18000,
        },
        [6163] = {
            description = "I was overwhelmed. On this very stead, I stood... held my ground in defense of " ..
                "Lordaeron. The farm and all on it were waylaid by a gigantic wave of Scourge.\n\nThe " ..
                "wretch. The filth. It hovered above me, entrails hanging from its gaping chest " ..
                "cavity.\n\nI woke as Scourge. For so long I was helpless. My mind had coalesced with the " ..
                "Lich King's.\n\nShe came for me... somewhere, somehow, I knew she would. Free.\n\nAnd " ..
                "now, I must have my vengeance - my vengeance on that which took from me my life. Destroy " ..
                "it.",
            rewardChoices = {{18022, 1}, {17001, 1}},
            rewardMoney = 18000,
        },
        [6182] = {
            description = "Nathanos Marris was the first and last of the human ranger lords. A disciple " ..
                "of Sylvanas Windrunner, now the Banshee Queen of the Forsaken.\n\nWe had thought that " ..
                "Nathanos had been killed in action in the defense of Lordaeron five years ago. Although " ..
                "his corpse was never recovered, it was assumed that he did not make it out of the " ..
                "Eastern Plaguelands.\n\nMathias Shaw has been investigating the disappearance and may " ..
                "have some new information. Report to him at once. He resides in Old Town, at the " ..
                "Barracks.",
        },
        [6183] = {
            description = "Five of my best field agents were assigned the Marris case. One returned, only " ..
                "to end up dead in his sleep three days later.\n\nWhat little information we did manage " ..
                "to get out of him was incoherent gibberish. We made out two words: \"Nathanos,\" and " ..
                "\"Blightcaller.\"\n\nI do not have the available manpower to continue this investigation " ..
                "and Ravenholdt will not assist us. We must get to the bottom of this; if only to provide " ..
                "closure to the families of the deceased. Will you help?",
        },
        [6184] = {
            description = "The only information we have thus far, then, is that Nathanos Marris may have " ..
                "been slain by this Blightcaller. We assume the Blightcaller is the same fiend that " ..
                "disposed of my agents.\n\nFlint Shadowmore, another SI:7 operative, is stationed at the " ..
                "Alliance encampment of Chillwind Point in the Western Plaguelands. Seek him out; he will " ..
                "debrief you on the current situation in the Plagues and give you an assignment.\n\nGood " ..
                "luck, <name>.",
        },
        [6185] = {
            description = "As I said, your first mission is one of reconnaissance. Nothing fancy, <name>. " ..
                "You must travel to the Eastern Plaguelands and look for any clues as to this " ..
                "Blightcaller.\n\nBe on the lookout for information about our missing operatives. We have " ..
                "to assume that they are dead and if they are dead, they must have a corpse... " ..
                "somewhere.\n\n<Flint swallows hard.>\n\nAll SI:7 agents carry this insignia.\n\n<Flint " ..
                "shows you his SI:7 insignia.>\n\nBring any of those that you may find back to me.",
        },
        [6186] = {
            description = "<The blood appears to have completely drained from Flint's face.>\n\nNa... " ..
                "Nathanos did this? Nathanos is the Blightcaller?\n\nWhy? He was... was so noble - a " ..
                "ranger lord respected by all. The only human ever allowed to train under the high elves. " ..
                "Now a ruthless agent of the Forsaken?\n\nI... I am sorry to ask this of you, <name>, but " ..
                "Highlord Fordragon must be informed of this turn of events at once. Please, return to " ..
                "Stormwind and deliver the news.",
        },
        [6187] = {
            description = "Do you know how many ranger lords exist in this world? How many human ranger " ..
                "lords have ever existed?\n\nNathanos' accomplishments were unprecedented. He was a " ..
                "tactical genius, responsible for Alliance victories spanning a decade of " ..
                "conflict.\n\nAnd now... the champion of the Forsaken.\n\nNo. This cannot be. Order must " ..
                "be restored.\n\nGather an army, <name>. Return to the Plagues with your army and destroy " ..
                "the Blightcaller.\n\nI wish you luck, <name>. Truly, you will need it for this battle.",
            rewardChoices = {{16996, 1}, {16997, 1}, {16998, 1}},
        },
        [6284] = {
            description = "Warning: Proceed into Sishir Canyon west of here at your own " ..
                "risk.\n\nBesseleth and her eight-legged children of the forest have claimed this canyon " ..
                "as their webbed lair.\n\nMaggran Earthbinder in Sun Rock Retreat has placed a bounty on " ..
                "Besseleth. Slay her and bring proof of your killing to Maggran; there you will receive " ..
                "your reward for disposing this eight-legged menace.",
            rewardChoices = {{16891, 1}, {16894, 1}},
        },
        [6344] = {
            description = "A friend of mine, Nessa Shadowsong, is a fishing merchant in Rut'theran " ..
                "Village. She needs a parcel taken to Darkshore, and is looking for someone to help " ..
                "her.\n\nIf you're interested, then to reach Nessa you must take the portal in Darnassus " ..
                "to Rut'theran Village. You will find the portal west of the Temple Gardens.",
        },
        [6385] = {
            description = "I've written a letter of thanks to Zargh. Will you deliver it for me? If " ..
                "you've already been to the Crossroads and spoken with their wind rider master, then you " ..
                "can fly a wind rider back there.\n\nTake my letter to Doras, the wind rider master of " ..
                "Orgrimmar, and speak with him about transport to the Crossroads.",
        },
        [6402] = {
            description = "You are to meet with Windsor at the gates of Stormwind.\n\nWhat Windsor is " ..
                "about to unveil will shake the very foundation of the kingdom!\n\nDo not attempt to " ..
                "venture there alone, <name>. You must amass an army! Gather your compatriots. To arms!",
        },
        [6403] = {
            description = "It has been quite the adventure, friend. I owe you a great debt of gratitude. " ..
                "Perhaps, when all is said and done...\n\nAs you have no doubt ascertained by now, Lady " ..
                "Prestor is Onyxia: Brood of Deathwing, twin to the tyrant of the Spire, Nefarian.\n\nFor " ..
                "too long she has held our kingdom in her captivating gaze. Even the Highlord is " ..
                "controlled by her trickery - a puppet. It all ends today... The spell will be " ..
                "broken.\n\nWorry not, for together, we shall be victorious!\n\nAre you ready?",
        },
        [6441] = {
            description = "Heya! I've been traveling through Ashenvale, heading towards Ratchet, and " ..
                "decided to make a stop here at Splintertree. I'm always looking for an opportunity, and " ..
                "it seems that satyr horns are in high demand in Ratchet these days.\n\nAfter asking " ..
                "around here, it seems that the satyrs in Night Run, Satyrnaar, and Xavian all have the " ..
                "type of horns I am looking for. I'm no match for those satyrs... but you look like you " ..
                "might be!\n\nTell you what, you collect the horns for me and I'll make it worth your " ..
                "time.",
            rewardMoney = 2000,
        },
        [6442] = {
            description = "There is evil lurking here along the coast, <race>.\n\nIt is the resting place " ..
                "of the doomed city of Zoram, long destroyed and submerged beneath the seas. Lost, and " ..
                "nearly forgotten.\n\nNow, the naga have returned, and for what reason we do not know. " ..
                "But reason matters little; we must defend the land we have worked so hard to claim as " ..
                "our own.\n\nReturn to me with 20 of their heads! Throw the naga back to the depths!",
        },
        [6462] = {
            description = "My kinfolk were traveling here with many sacred troll charms, but the " ..
                "Thistlefur furbolgs attacked and killed them before they reached Zoram'gar! Those vile " ..
                "Furbolgs!\n\nI miss my brothers and sisters who were killed, but we will meet again in " ..
                "the afterlife. However, their troll charms hold great value in this world. It is an " ..
                "outrage that the furbolgs have them!\n\n<name>, you must retrieve the charms! They are " ..
                "in chests in Thistlefur Hold, a cave at the end of Thistlefur Village, north of " ..
                "Astranaar.",
            rewardMoney = 1700,
        },
        [6482] = {
            description = "Eh? Who are you?\n\n<name>? You're no furbolg. They are cursed! They thought I " ..
                "was a bear and captured me, and now they starve me! My strength is failing...\n\nHelp me " ..
                "escape, then speak with my sister Yama at the Splintertree Post to the east.\n\n<name>! " ..
                "I must escape!",
            rewardMoney = 1700,
        },
        [6501] = {
            description = "A fragment of the shattered medallion is all that I can offer.\n\nYou must " ..
                "find another of dragon blood willing to assist you in forging a new key. Once you secure " ..
                "this key, you must travel to the Wyrmbog in Dustwallow Marsh. It is there that you will " ..
                "find her lair, <name>.\n\nWhere to find other flights willing to help? Sadly, I do not " ..
                "know... They are said to exist. Some may even work and live among us, disguised as one " ..
                "of the humanoid races. I wish you luck.",
        },
        [6502] = {
            description = "It is a piece of the dragon; a scale - enchanted and transformed. Whole, it " ..
                "could have granted access to the beast's lair. Shattered, it is useless.\n\nIt is " ..
                "possible to repair the item, but to do so would require the blood of a black dragon " ..
                "champion. There is one... He is known as General Drakkisath, ruler of the dragonspawn " ..
                "armies of Nefarian. Perhaps you have heard of him?\n\nReturn with his blood, <race>, and " ..
                "I shall enchant the fragment into something that will grant you access to Onyxia's lair.",
            rewardItems = {{16309, 1}},
        },
        [6503] = {
            description = "We received reports that Ashenvale outrunners left Silverwing Outpost not long " ..
                "ago, and now sneak near our territories in the forest. We don't want them gathering " ..
                "intelligence on our defenses!\n\nSneak through the forests south of our post here and " ..
                "east of the Alliance outpost of Silverwing. Find and slay the outrunners, then return to " ..
                "me.",
        },
        [6504] = {
            description = "I just picked up this shredder from Ratchet and I was on my way back to the " ..
                "Warsong Lumber Camp, where I am supposed to be on duty. I was given a manual on how to " ..
                "operate the shredder, but on the trip back, a huge gust of wind blew it from my hands. " ..
                "The pages went everywhere, and all I was left with was the cover.\n\nThe pages could be " ..
                "just about anywhere by now, I suppose... but I don't know how to use the shredder " ..
                "without them! Will you find them for me?",
            rewardChoices = {{16740, 1}, {16741, 1}},
        },
        [6521] = {
            description = "Malcin claims he is outside Razorfen Downs. This ambassador must be slain--his " ..
                "mission a failure in the eyes of the Lich King.\n\nHis presence there does explain much " ..
                "of what we've discovered about the area--some of the quilboar have grown frightfully " ..
                "powerful while showing signs of the Plague in their own way. Truly that must be a sign " ..
                "of some sort of deal they've struck.\n\nFind Malcin and slay him, <name>. Return to me " ..
                "after the deed is done.",
            rewardChoices = {{17039, 1}, {17042, 1}, {17043, 1}},
            rewardMoney = 2000,
        },
        [6523] = {
            description = "Thank you for rescuing me! We must leave quickly before they discover that I " ..
                "am free. Please escort me to Camp Aparaje. From there, I know my way.\n\nMy father, " ..
                "Makaba Flathoof, will be desperate to know that I am safe.",
            rewardMoney = 1000,
        },
        [6544] = {
            description = "Hey! <class>! Come here!\n\nMy raiders and I are about to attack the " ..
                "Silverwing Outpost to the west. Our target is its leader, Duriel Moonfire. Scouts report " ..
                "the outpost is defended heavily with sentinels and warriors. The battle will be " ..
                "glorious!\n\nDo you want to share in the glory, <name>, and aid us? If so, then when " ..
                "it's over you can report our success to my superior, Ertog Ragetusk in " ..
                "Splintertree.\n\nWhat do you say. Are you with us?",
            rewardChoices = {{16889, 1}, {16890, 1}},
            rewardMoney = 1700,
        },
        [6545] = {rewardItems = {{16763, 1}}},
        [6546] = {rewardItems = {{16765, 1}}},
        [6547] = {rewardItems = {{16764, 1}}},
        [6563] = {
            description = "Within the beginning tunnels of Blackfathom Deeps, large sapphire clusters can " ..
                "be found along the cave walls. Recently it was noted that the naga were harvesting the " ..
                "crystals. Until it can be discerned why, I sense we should stop the naga from " ..
                "succeeding. The crystals have great elemental power and if used inappropriately, could " ..
                "make for a powerful arcane component.\n\nWill you help me, <name>? Blackfathom Deeps can " ..
                "be found along Zoram Strand to the north of our outpost.",
            rewardMoney = 1400,
        },
        [6565] = {
            description = "This Twilight's Hammer follower cannot be allowed to complete his plan. The " ..
                "Twilight's Hammer do not understand the spirits of nature. They believe in the Old " ..
                "Gods--creatures of chaos and destruction that were long ago defeated. This Lorgus cannot " ..
                "be allowed to succeed. You must stop him, <name>. I cannot do it myself--I am too " ..
                "weak.\n\nGo into Blackfathom Deeps, find him, and kill him. Return to me here at " ..
                "Zoram'gar when it's done.",
            rewardChoices = {{17694, 1}, {17695, 1}},
            rewardMoney = 4000,
        },
        [6566] = {
            description = "It is good to see you again, <name>. The wind carries with it news from the " ..
                "Eastern Kingdom.\n\nSit, listen.",
        },
        [6567] = {
            description = "I have received word from one of my champions that a way into the lair of the " ..
                "dragon may exist. You are to seek him out.\n\nRexxar wanders the desert wasteland of " ..
                "Desolace, traveling between Stonetalon and Feralas. He awaits your arrival.",
        },
        [6568] = {
            description = "What do you know of illusions, <name>? For you see, it is an illusion that you " ..
                "must create in order to circumvent the Black Flight's defenses.\n\nI know of one that " ..
                "may be willing to assist you in your quest of deception. She has assisted our kind in " ..
                "the past when she has deemed the cause worthy.\n\nIn the Western Plaguelands you will " ..
                "find Myranda the Hag, master illusionist - an exile of the Lordaeron alliance. Travel " ..
                "there and take with you this message.",
        },
        [6569] = {
            description = "So the <race> wishes to become one of the Black Flight, eh?\n\nThe creation of " ..
                "the illusion you require is trivial, but the components required for the divination are " ..
                "quite difficult to obtain. Rexxar and the Warchief have entrusted you with this mission, " ..
                "so Myranda must assume you as capable.\n\nTravel to the upper citadel of Blackrock Spire " ..
                "and slay enough of the black dragonspawn to fill up one of your packs with their " ..
                "eyes.\n\nReturn to Myranda when you have gathered enough of the reagent.",
        },
        [6570] = {
            description = "I have attuned this medallion with the magic necessary to create and maintain " ..
                "an illusion within the bounds of the den of Emberstrife.\n\nEmberstrife is an ancient " ..
                "drake; an old gatekeeper of Nefarian, burdened with the duty to test those dragonspawn " ..
                "that would ascend to the rank of elite guard to Onyxia.\n\nTravel to the Wyrmbog of " ..
                "Dustwallow Marsh and enter the lair of Emberstrife. Once there, put on the amulet and " ..
                "follow where your destiny may lead!",
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
        [6581] = {rewardItems = {{16742, 1}}},
        [6582] = {
            description = "We are Deathwing's children, whelp. Our dominance over the lesser Aspects must " ..
                "be enforced.\n\nIf you are truly worthy of ascension, the lesser dragonflight will wilt " ..
                "in your presence.\n\nFind their champions and lay waste to them in the name of our " ..
                "Father!\n\nTravel to Winterspring and track down the mighty blue drake, Scryer. Crush " ..
                "him and any of the Blue Flight that stand in your path. Tear out his skull and return it " ..
                "to me.",
        },
        [6583] = {
            description = "Just as our Father crushes the Aspects themselves, so too must we strive to " ..
                "bring chaos and destruction to their children.\n\nYou must test your battle prowess " ..
                "against the sleepless dreamers: The children of the Green Flight.\n\nTravel to the Swamp " ..
                "of Sorrows and track down Somnus, drake champion of the Green Flight. Let flow your " ..
                "hatred; dominate the insect... Return to me with his skull...",
        },
        [6584] = {
            description = "The time watchers, children of Nozdormu - Lord of the Centuriesss...\n\nIt is " ..
                "three that guard the Caverns of Time, but only one that holds the interests of the Black " ..
                "Flight: The Time Shifter, Chronalis, favored drakeling of Nozdormu.\n\nSsstrike at this " ..
                "champion, a blow to make even the stoic sands of time weep. Return to me with his skull.",
        },
        [6585] = {
            description = "It was over the mountains of Grim Batol that our Father raged against the " ..
                "combined might of the Aspects. The cowardly act of the betrayer, Alexstrasza, bought the " ..
                "other Aspects enough time to escape from Father's wrath.\n\nSssuch a shameful " ..
                "act...\n\nThe Red Flight now guards Grim Batol, their lieutenant, Axtroz, must be " ..
                "destroyed. Return the skull of Axtroz to me. For Father, whelp!",
        },
        [6601] = {
            description = "From the skulls of our enemies is shaped a medallion. You know this medallion, " ..
                "yesss? You have no doubt seen it worn by your elders.\n\nTake it, whelp. Return to the " ..
                "Spire and present it to General Drakkisath. The General will place the final enchantment " ..
                "upon the medallion, attuning the trinket to your spirit.\n\nYou will wear the finished " ..
                "medallion as a badge of honor, symbolizing your ascension to one of our most guarded " ..
                "ranks: Guardian to the brood mother.\n\nGo!",
        },
        [6602] = {
            description = "You will pay the General a visit, yes, but not as one of the Black " ..
                "Dragonflight.\n\nYou see, a ceremony is merely another term for blood letting to the " ..
                "Black Flight.\n\nThe latent amulet merely needs the blood of the General in order to " ..
                "become active. One of their crude failsafe mechanisms.\n\nReturn to Blackrock Spire and " ..
                "destroy Drakkisath. Bring his blood back here and I shall activate the key to Onyxia's " ..
                "lair.",
            rewardItems = {{16309, 1}},
        },
        [6621] = {
            description = "<name>, another tribe of Furbolgs, the Foulweald, live southeast of Astranaar. " ..
                "They are not as many as the Thistlefur, but their ferocity poses a future threat. With a " ..
                "show of force, we can remove that threat.\n\nTake this banner, go to the Foulweald " ..
                "village and place it on their totem mound. They will try to destroy the banner, but hold " ..
                "your ground until their chief, Murgut, appears to save face for the tribe. Bring me the " ..
                "totem he carries.\n\nGather your allies, <name>. This is no task for a single <class>.",
            rewardChoices = {{17005, 1}, {17006, 1}},
            rewardMoney = 2000,
        },
        [6641] = {
            description = "Vorsha the Lasher... the fiendish hydra that roams the seas...\n\nShe has " ..
                "attacked our outpost, each time unprovoked, laying waste to anything that falls in her " ..
                "path.\n\nBut I am ready, <name>. I have prepared to best the hydra and end these attacks " ..
                "on Zoram'gar.\n\nThe naga honor the wicked nature of this beast with a brazier that " ..
                "remains lit on an island just off the coast. I believe that if we put it out, Vorsha " ..
                "will appear in anger.\n\nWe will need help, so be sure to bring some strong allies.",
            rewardItems = {{17692, 1}},
        },
        [6761] = {
            description = "I have relegated my second, Mathrengyl Bearwalker, to deal with Moonglade's " ..
                "call for aid. Speak to him on this matter - NOT me.\n\nLet me give you some... " ..
                "friendly... advice. It is I who led us out of the darkness - NOT the Cenarion Circle in " ..
                "Moonglade - when all was lost for our race. Teldrassil gives us all new life! They would " ..
                "have you believe otherwise, and to believe their propaganda would be a fool's " ..
                "task.\n\nI'll leave it to you to decide whether or not you're a fool.",
        },
        [6762] = {
            description = "For this task, Keeper Remulos' majordomo in Moonglade - Rabine Saturna - seeks " ..
                "aid in exploring the vast wastelands far to the west of Tanaris... and even further west " ..
                "of Un'Goro. You should find him in Nighthaven, the main village of Moonglade.\n\nWhile " ..
                "your work will no doubt be of tremendous benefit to us all, I advise you to tread " ..
                "gingerly. There are tensions between Darnassus and Moonglade... ones that may grow over " ..
                "the course of time.",
        },
        [6821] = {
            description = "You have shown me that you can defeat our enemies and perform missions to " ..
                "further the cause of the Waterlords. But until now you have only faced lesser foes... if " ..
                "pitted against a powerful enemy, can you prevail?\n\nThat is your new task.\n\nHigh up " ..
                "in Blackrock Spire the orcs have captured a servant of fire, the Pyroguard Emberseer. " ..
                "Find his place of imprisonment, slay his captors, and then slay the emberseer. Bring me " ..
                "his eye and it will show me your worth.",
        },
        [6822] = {
            description = "<name>, perhaps it is time to give you a real test. Are you ready?\n\nAt the " ..
                "bottom of Blackrock Depths is a passage to the Molten Core. This is a stronghold of our " ..
                "enemy, held by the most powerful servants of fire on this world.\n\nGo to the Molten " ..
                "Core, <name>. Show me you have the strength and the will to defeat what you find " ..
                "there.\n\nAnd if you have allies among your people, then rally them. Nothing short of an " ..
                "army can hope to enter the Molten Core and live.",
        },
        [6823] = {
            description = "If you truly wish an allegiance with us, then I invite you to wage war on our " ..
                "foes, the servants of air and earth and fire. Each defeat you heap upon them will weaken " ..
                "their foothold here, and further prove your adherence to our cause.\n\nThe campaign will " ..
                "be long, but if you persevere then your glory and honor will be great.",
        },
        [6824] = {
            description = "<name>, your service is of great value to us, so we are reluctant to send you " ..
                "on this last mission for we do not want to lose such a useful agent.\n\nBut its success " ..
                "would further our war efforts tremendously and... it was deemed worth risking you.\n\nWe " ..
                "want these captains in the Molten Core destroyed: Lucifron, Sulfuron, Gehennas and " ..
                "Shazzrah. Kill them and bring me their hands!\n\nThis task will take every resource you " ..
                "possess, <name>, but if can do it then the Firelords will be dealt a terrible blow.",
        },
        [6844] = {
            description = "There's plenty to do here still, but I think taking this back to the Circle " ..
                "for analysis is key. Trust me - the work will still be here once this is all said and " ..
                "done. If it's a journal inside this sticky chitin, then the Circle would finally have a " ..
                "window into the past!\n\nTake this to the Circle's archivist in Nighthaven. His name is " ..
                "Umber, and the man's brilliant. Touched, sure, but brilliant nonetheless! Umber 's " ..
                "salvaged tomes in far worse shape than this. If it can be saved, he can do it.",
        },
        [6921] = {
            description = "The Twilight's Hammer has moved into the Moonshrine Ruins of Blackfathom " ..
                "Deeps. Their presence can only serve to coerce the elements into working against us. If " ..
                "left unchecked, this region will be theirs for good.\n\n<name>, go into Blackfathom and " ..
                "find the ruin's fathom stone; it should be somewhere close in the water. In it is a " ..
                "fathom core - a device that when properly read it will relate a history of all elemental " ..
                "activity. If I have it, I and the Earthen Ring can maybe do something to stop them!",
            rewardMoney = 4500,
        },
        [7001] = {
            description = "The war in the valley has taken its toll on our soldiers. We must revitalize " ..
                "our forces!\n\nIf we can fill up the stables, the Wolf Riders will once more be able to " ..
                "ride out into the field of battle.\n\nTake this muzzle and track down the frostwolves " ..
                "that inhabit the nearby forest. Once you find a wolf, use the muzzle to tame the beast. " ..
                "Bring the tamed beast back to me so that I may place it in the stable.\n\nWhen we have " ..
                "enough wolves stabled, the Wolf Riders will rejoin their patrol on our front lines.",
        },
        [7027] = {
            description = "Just look at the stables, <name>! Empty! The Stormpike Brigade has no rams to " ..
                "ride - the cavalry is defunct.\n\nYou must help us, soldier. Take this training collar " ..
                "and enter the wilds of this valley. Locate the Alterac rams that roam throughout the " ..
                "area and use the collar to snare one. When you have captured a ram, return it to me and " ..
                "I shall place it in our stable.\n\nWhen we have enough rams, the ram rider commander " ..
                "will be notifed. With your help, the cavalry will be reborn!",
        },
        [7081] = {
            description = "The graveyards in Alterac Valley are prized territories. Both the Horde and " ..
                "the Alliance fight savagely for these sacred grounds. Are you, <name>, ready to join " ..
                "that fight?\n\nI want you to assault an enemy graveyard. Find a graveyard with a Horde " ..
                "banner in its midst, and pull it from the ground! Do that, and your task will be " ..
                "complete....\n\nBut if you can also hold the graveyard for a few minutes, then our " ..
                "troops will soon come to relieve you.",
            rewardMoney = 9000,
        },
        [7082] = {
            description = "The battle lines of Alterac Valley are ever shifting. Territories swing back " ..
                "and forth as we meet our opponents in deadly combat. And graveyards, <name>, are where " ..
                "battles rage most fierce.\n\nI want you to attack an Alliance held graveyard! Find a " ..
                "graveyard with an Alliance banner in its midst and pull it from the ground.\n\nDo that " ..
                "and your task for me will be complete, but... if you hold the graveyard for a few " ..
                "minutes, then it will be ours and troops will come and relieve you.",
            rewardMoney = 9000,
        },
        [7101] = {
            description = "Towers and bunkers are important positions, and we must capture and hold them " ..
                "all! So to that end, I want you to attack a bunker that is controlled by the " ..
                "enemy.\n\nTo do that, enter one with an Alliance banner. You will see another banner " ..
                "inside. Pull out that banner, and a white Horde banner will appear in its place. Well " ..
                "done!\n\nAt that point your task for me will be complete, but if you hold the place long " ..
                "enough, and if the Alliance doesn't take it back, then it will be destroyed!",
            rewardMoney = 9000,
        },
        [7102] = {
            description = "Towers and bunkers are key defensive positions, and so we must hold as many as " ..
                "possible! I want you to attack a tower or a bunker in Alterac Valley.\n\nTo do that, " ..
                "enter a tower with a Horde banner atop it. You will see another enemy banner inside. " ..
                "Pull out that banner, and a white Alliance banner will appear in its place. Well " ..
                "done!\n\nAt that point your mission for me will be complete, but hold the area long " ..
                "enough, and if the Horde doesn't take it back, then it will be destroyed!",
            rewardMoney = 9000,
        },
        [7121] = {
            description = "<name>, our quartermaster charged me to direct new recruits to him. He needs " ..
                "supplies from caches stored in the mines of Alterac, and he'll probably send you to get " ..
                "them.\n\nFollow the road. You'll find our quartermaster to the west.",
        },
        [7122] = {
            description = "The mines in Alterac Valley hold more than just minerals. Both the Frostwolf " ..
                "and Stormpike have cached excess supplies in the Irondeep and Coldtooth mines... that's " ..
                "not a bad idea, if we could only maintain control of them!\n\nCapture a mine, then " ..
                "return to me. To capture a mine, enter one that we do not control and kill its leader. " ..
                "When you do that, the mine will be ours, and we'll send troops to protect it!",
            rewardMoney = 9000,
        },
        [7123] = {
            description = "<name>, the Frostwolf Quartermaster is looking for recruits, for tasks that " ..
                "lead into the mines of Alterac Valley. Speak with him; he will tell you more.\n\nFollow " ..
                "the road west into the bunker, then take the west exit and you'll find our quartermaster.",
        },
        [7142] = {
            description = "The Stormpike dwarves and their allies have invaded Alterac Valley, and we " ..
                "must drive them out! To win the battle for Alterac, we must defeat their general, " ..
                "Vanndar Stormpike!\n\nYou will find Vanndar in Dun Baldar, in the north of Alterac " ..
                "Valley.\n\nDestroy him, <name>, and then return to me.",
            rewardMoney = 27000,
        },
        [7161] = {
            description = "Hail, <class>. It has been a long time since we have had the chance to answer " ..
                "the call of battle. The old feelings are slow to rise but once awakened, the blood does " ..
                "rush. The battle rage returns...\n\nAll newcomers to the Valley must first complete the " ..
                "rite of battle.\n\nDeep within the Wildpaw gnoll cave is a banner of the Frostwolf. " ..
                "Venture forth and recover the banner. Return it to me and I shall grant you the " ..
                "Frostwolf initiate's insignia.",
            rewardItems = {{17690, 1}, {19483, 1}},
        },
        [7162] = {
            description = "You've arrived just in time, <class>. These Frostwolf savages just won't give " ..
                "up! We must show them the might of the Stormpike. They must bow to our " ..
                "superiority.\n\nBefore you make your way to the field of battle, you will want to join " ..
                "the rank of Stormpike.\n\nSouthwest of Dun Baldar, you will find the Icewing Caverns. " ..
                "Planted deep within the caverns is a Stormpike Banner. Venture forth and recover that " ..
                "banner. Return it to me, and you will have earned a Stormpike initiate's insignia.",
            rewardItems = {{17691, 1}, {19484, 1}},
        },
        [7163] = {rewardItems = {{17905, 1}}},
        [7164] = {rewardItems = {{17906, 1}}},
        [7165] = {rewardItems = {{17907, 1}}},
        [7166] = {rewardItems = {{17908, 1}}},
        [7167] = {rewardItems = {{17909, 1}}},
        [7168] = {rewardItems = {{17900, 1}}},
        [7202] = {
            description = "The indigenous Winterax trolls of the region are ruthless savages that would " ..
                "love nothing more than to have our bones added to their foul stew.\n\nWe must show them " ..
                "our might!\n\nWe have recovered tomes from their caves that detail their leadership " ..
                "hierarchy. The artifacts indicate that their leader, Korrak the Bloodrager, tends to " ..
                "remain hidden until given a reason to make his presence known.\n\nDeath to Korrak would " ..
                "mean death to Winterax Clan! Slay him and return.",
            rewardChoices = {{19107, 1}, {19106, 1}, {19108, 1}},
            rewardItems = {{18150, 1}},
        },
        [7223] = {
            description = "Battles rage constantly in Alterac Valley, and the supplies we get from " ..
                "Ironforge are not enough to outfit our experienced troops.\n\nIf you find armor scraps " ..
                "from the battlefield, aid the war effort and bring those scraps to me!",
        },
        [7224] = {
            description = "When you fight the enemy, gather the scraps of their armor and bring them to " ..
                "me. I'll use those scraps to make armor for our own troops!",
        },
        [7241] = {
            description = "The drums of war sound off in a distant land, <class>. The favored clan of " ..
                "your Warchief is under attack from the nefarious Stormpike Guard of Ironforge.\n\nBy the " ..
                "looks of you, I can discern that you are indeed battle hardy and prepared to take on the " ..
                "cause of the Frostwolf.\n\nIt is you who must now take the next step in your " ..
                "evolution.\n\nNorth of Tarren Mill, in Alterac, you will find the entrance to Alterac " ..
                "Valley. It is there that you will find Warmaster Laggrond. Hurry <class>, for the battle " ..
                "is upon us!",
        },
        [7261] = {
            description = "We are fighting a brutal battle in the valleys of Alterac. The cannibalistic " ..
                "Winterax trolls attack us from one side and the savage Frostwolf Clan from the other. " ..
                "Both must be exterminated in the name of King Magni Bronzebeard! The taking, culling, " ..
                "and turning of that land is a sovereign and territorial imperative to the kingdom of " ..
                "Ironforge.\n\nAlas, soldiers do not grow on trees! Report to Lieutenant Haggerdin " ..
                "outside Alterac Valley to begin your tour of duty and honor amongst the Stormpike.",
        },
        [7341] = {rewardItems = {{18042, 200}}},
        [7342] = {rewardItems = {{18042, 200}}},
        [7361] = {
            description = "<Najak snarls.>\n\nBefore the night elves existed there was troll. It was from " ..
                "troll that the night elves came.\n\nTheir mutinous attacks against my people will not be " ..
                "tolerated. Staghelm seeks to wipe us out - to leave no trace of those that bore him and " ..
                "his ilk. It will not happen!\n\nFor every night elf that you slay and decapitate, Najak " ..
                "will grant you favor amongst the Darkspear. Word of your deeds will be spread across " ..
                "Kalimdor and the Eastern Kingdoms. Go now and serve the Darkspear!",
        },
        [7362] = {
            description = "The Elder Crone has sent me to this warzone to research the other races. More " ..
                "specifically, I am to collect gnome samples. Magatha is primarily interested in their " ..
                "survivability. Aye, the gnomes - while pitifully weak and miniscule - exude great " ..
                "resilience both in and out of combat.\n\nFortunately for you, I am looking for ruffians " ..
                "to do Magatha's bidding. Return to me with tufts of gnome hair and you shall be known to " ..
                "the tauren as an ally.",
        },
        [7363] = {
            description = "Humans are so utterly detestable.\n\n<Commander Philips grimaces.>\n\nWhile it " ..
                "is true that I am a soldier of Frostwolf, I remain a servant of Sylvanas.\n\nDuring my " ..
                "tour of duty, I do extra work on the side for the Dark Apothecaries of the " ..
                "Undercity.\n\nI have been tasked with collecting human bone chips that are to be used in " ..
                "curing the human condition.\n\nI am authorized to pass that task on to my " ..
                "subordinates.\n\nFind them. Kill them. Return their bone chips to me.",
        },
        [7366] = {
            description = "The Archbishop is as kind as he is wise. For a man to look mercifully on such " ..
                "a wretched lot...\n\n<Commander Philips shakes his head in disbelief.>\n\nToo kind... " ..
                "Just too kind.\n\nThe Archbishop asks that we take pity on the undead and grant them " ..
                "swift and permanent deaths. For this grand display of mercy, we merely require their " ..
                "black, disease ridden hearts.\n\nBring me the hearts of the Forsaken so that they may be " ..
                "ceremoniously incinerated at the Cathedral of Light. Make haste, <name>!",
        },
        [7381] = {
            description = "While it is true that Korrak has been slain, one question remains: Will he " ..
                "remain dead? Trolls are notorious for their other-worldly tribal magics. I would not be " ..
                "surprised if the fallen leader was raised from the dead to once more rule over his " ..
                "clan.\n\nYou know what to do should this ever occur.\n\n<Warmaster Laggrond makes a " ..
                "cutting motion across his neck with his index finger.>\n\nAnd this time, I want his " ..
                "skull. Just keep your eyes peeled, soldier.\n\nDismissed!",
            rewardItems = {{18149, 1}},
        },
        [7382] = {
            description = "There's something not quite right about all of this... Did anybody think to " ..
                "burn Korrak's corpse? Those trolls will stop at nothing to revive their fallen leader - " ..
                "as blue skinned pagan man-beasts often do.\n\nJust keep your eyes out, <name>. Don't be " ..
                "alarmed if Korrak makes a surprise appearance; and if he does, I want him executed - his " ..
                "corpse burned to ashes.\n\nFor good measure, lop off his head and bring me his skull " ..
                "before you ignite the lifeless mass.",
            rewardItems = {{18150, 1}},
        },
        [7429] = {rewardXP = 660},
        [7461] = {
            description = "Have you heard enough? Are you a <man/woman> of action?\n\nThis madness must " ..
                "come to an end. The age of the immortals has long since passed. Destroy the guardians " ..
                "surrounding the pylons to lower the force field. When this is done, destroy Immol'thar. " ..
                "With the Prince's power greatly reduced, attack and end him. Lay the spirits of this " ..
                "city to rest, adventurer.",
        },
        [7463] = {
            description = "A <race> mage! How wonderous. I have not seen one of your kind for... oh what " ..
                "is it going on now? 500 years!\n\nI have something that will quench your thirst, but " ..
                "first you must do a task for me.\n\n<Lydros snickers.>\n\nThere is an anomaly in " ..
                "Eldre'Thalas. A water elemental has taken residence in the east wing. His presence must " ..
                "be catalogued!\n\nVenture to the Warpwood Quarter and extract a portion of the elemental " ..
                "essence of the Hydrospawn. Return it to me and I shall teach you a useful cantrip.",
        },
        [7481] = {
            description = "Several years ago, a lone elven master named Telmius Dreamseeker fled the " ..
                "devastation of his homeland with several ancient elven artifacts in tow.\n\nOur search " ..
                "for this lost master lead us from the ruins of Quel'Thalas, through the Burning Steppes, " ..
                "across the great expanses of the sea, to Feralas.\n\nWe suspect that the elf sought " ..
                "sanctuary in the halls of Eldre'Thalas (what is now known as Dire Maul ).\n\nYou must " ..
                "find him, adventurer. Whether alive or dead, the knowledge he carried must be recovered!",
            rewardMoney = 18000,
        },
        [7482] = {
            description = "Several years ago, a lone elven master named Telmius Dreamseeker fled the " ..
                "devastation of his homeland with several ancient elven artifacts in tow.\n\nOur search " ..
                "for this lost master lead us from the ruins of Quel'Thalas, through the Burning Steppes, " ..
                "across the great expanses of the sea, to Feralas.\n\nWe suspect that the elf sought " ..
                "sanctuary in the halls of Eldre'Thalas (what is now known as Dire Maul ).\n\nYou must " ..
                "find him, adventurer. Whether alive or dead, the knowledge he carried must be recovered!",
            rewardMoney = 18000,
        },
        [7483] = {
            description = "Master Dreamseeker lost the Libram of Rapidity in the east wing. The Libram " ..
                "will allow for a minor haste cantrip to be placed upon your equipment. Parlor tricks, " ..
                "really...\n\nRegardless, if you are interested, you will need to present the Libram " ..
                "along with some basic reagents.\n\nHrm... I believe it also requires blood of heroes, a " ..
                "pristine black diamond, and large brilliant shards. I could be wrong!\n\n<Lydros shrugs.>",
            rewardItems = {{18329, 1}},
            rewardXP = 1650,
        },
        [7484] = {
            description = "This libram almost aroused interest in one of the younger Lorekeeper's " ..
                "familiars. Poor thing, it was only a few weeks old.\n\nThose among you who are more " ..
                "magically inclined might find this item interesting.\n\nThe Libram of Focus was lost in " ..
                "this wing. I can only assume one of the Highborne spirits holds it in their " ..
                "possession.\n\nBring the Libram along with some large brilliant shards, skin of shadow, " ..
                "and a pristine black diamond and I shall conjure the Arcanum.",
            rewardItems = {{18330, 1}},
            rewardXP = 1650,
        },
        [7485] = {
            description = "He wept like an infant at the loss of this libram. Mind you, I myself have " ..
                "wept over texts - there is no greater loss than that of knowledge and history - but to " ..
                "cry over this nearly useless jumbling of incantations? Preposterous! It left me to " ..
                "believe that the Prince was doing him a favor in flaying the flesh from his " ..
                "bones.\n\nBring the Libram along with a pristine black diamond, large brilliant shards, " ..
                "and a frayed abomination stitching and I shall recreate the Arcanum.\n\nOh, and check " ..
                "the north wing.",
            rewardItems = {{18331, 1}},
            rewardXP = 1650,
        },
        [7486] = {
            description = "<name>, your services to the Warlords surpassed all we could expect from the " ..
                "denizens of this world.\n\nWe do not understand your people's notions of gratitude, or " ..
                "rewarding good works, but in this case... perhaps a reward is warranted.\n\nUnder the " ..
                "surf at the southern base of this island, you will find a coffer. In it you will find " ..
                "your... reward.\n\nGo, <name>. Claim your reward.",
            rewardChoices = {{18399, 1}, {18398, 1}},
        },
        [7488] = {
            description = "The mage Lethtendris, a vicious blood elf whose brutality is matched only by " ..
                "her twisted addiction to magic, has fled into Dire Maul. She has created a device, a web " ..
                "to ensnare the magical energies of that place and we fear that, if left unchecked, she " ..
                "will cause irreparable damage to our world!\n\nStop her, <name>. Find her and retrieve " ..
                "her web. She is likely near the satyrs in Warpwood Quarter of Dire Maul. Bring the web " ..
                "to me so that its power may be released safely back into the wilds...",
            rewardItems = {{18491, 1}},
            rewardMoney = 17000,
        },
        [7490] = {
            description = "You have accomplished the impossible. The brood mother of the Black " ..
                "Dragonflight lies dead at your feet. Take her head and present it to your Warchief.",
        },
        [7491] = {
            description = "Overlord Runthak awaits your arrival in the Valley of Strength.\n\n< Thrall " ..
                "salutes you.>\n\nDo not keep your public waiting, hero.",
            rewardChoices = {{18406, 1}, {18403, 1}, {18404, 1}},
        },
        [7492] = {
            description = "Talo Thornhoof, a Tauren elder in Feralas, sends a request for aid. He offered " ..
                "few details, but he did say that he needs agents for a matter both delicate... and " ..
                "dire.\n\nServe the Horde, <name>. Go to Camp Mojache in Feralas and speak with Talo.",
        },
        [7494] = {
            description = "<name>! Your aid is needed in Feralas!\n\nAn outlaw mage, Lethtendris, has " ..
                "fled to the ancient elven ruins Eldre'thalas, now called Dire Maul. It is believed she " ..
                "has an item of dangerous magical energy which must be recovered.\n\nLatronicus Moonspear " ..
                "requests agents to enter Dire Maul and retrieve the item from Lethtendris.\n\nServe the " ..
                "Alliance! Seek out Latronicus at the Feathermoon Stronghold in Feralas.",
        },
        [7495] = {
            description = "You have accomplished the impossible. The brood mother of the Black " ..
                "Dragonflight lies dead at your feet. Take her head and present it to the Highlord.",
        },
        [7496] = {
            description = "Seek out Major Mattingly in the Valley of Heroes, <name>. He will be expecting " ..
                "you...",
            rewardChoices = {{18406, 1}, {18403, 1}, {18404, 1}},
        },
        [7498] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18465, 1}}},
        [7499] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18466, 1}}},
        [7500] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18468, 1}}},
        [7501] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18472, 1}}},
        [7502] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18467, 1}}},
        [7503] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18473, 1}}},
        [7504] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18469, 1}}},
        [7505] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18471, 1}}},
        [7506] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18470, 1}}},
        [7507] = {
            description = "You have uncovered something of great importance. This book is unlike any that " ..
                "you have seen.\n\nIt would appear as if someone or something has managed to shatter the " ..
                "seal of Athenaeum. The text within is garbled and barely legible.",
        },
        [7508] = {description = "If you wish to take on this task, present Lydros with the dull blade."},
        [7509] = {
            description = "Take the unfired ancient blade to the lair of Onyxia and engage her in " ..
                "battle.\n\nSome trickery must be utilized for the heating of the blade. While in combat, " ..
                "she will surely try to incinerate you with her fiery breath. You must plant the unfired " ..
                "ancient blade nearby and hope that the fiery breath heats the blade. If you live beyond " ..
                "this, pick up the now heated ancient blade and finish off the dragon.\n\nPlunge the " ..
                "heated ancient blade into her smoldering corpse to fashion the treated ancient blade.",
            rewardItems = {{18348, 1}},
        },
        [7562] = {
            description = "<name>, your delvings into the dark arts are deep. Your mastery over " ..
                "otherworldly denizens has grown so strong... perhaps you are ready to bind to you one of " ..
                "the infamous dreadsteeds.\n\nThe ritual to summon the beast from its home requires great " ..
                "power and resources, but if you desire to dominate that epic mount, then speak with " ..
                "Mor'zul Bloodbringer. He is camped near the Altar of Storms in the Burning " ..
                "Steppes.\n\nGo, <name>. This quest will be perilous, but a Warlock of your stature does " ..
                "not shy from danger!",
        },
        [7581] = {
            description = "You must retrieve bindings for the prison of the Doomguard from lesser " ..
                "demons.\n\nThe blood of the Wildspawn satyr that occupy Dire Maul should do nicely. The " ..
                "coagulated blood will bond the Hederine shards and power the crystal prison.",
        },
        [7582] = {
            description = "The Hederine demons that occupy the foothills of Mount Hyjal secrete powerful " ..
                "fel poisons, which if left to mature, harden into a dense anti-magic crystal. These " ..
                "crystals have come to be known as Tears of the Hederine.\n\nNot even the immense power " ..
                "of a Doomguard could break the walls of a prison constructed from this " ..
                "material.\n\nTravel to Darkwhisper Gorge in Winterspring and recover the Tears.",
        },
        [7583] = {
            description = "The prison is ready. Now for the most difficult portion of this task.\n\nYou " ..
                "must find and capture a Doomguard Commander within the Tainted Scar using this crystal " ..
                "prison.\n\nBe warned! A Doomguard is a cunning and lethal adversary and will seek to " ..
                "destroy you as you begin the ritual of imprisonment. It will flail wildly in its " ..
                "attempts to escape imprisonment.\n\nIt will focus on nothing but you, <name>. Because of " ..
                "this, I must recommend that you take companions capable of keeping you alive!",
            rewardItems = {{18602, 1}},
        },
        [7604] = {
            description = "The undersigned hereby declares that the Sulfuron ingot they are delivering to " ..
                "the Thorium Brotherhood (TB Ltd.) is genuine and not a facsimile thereof. The " ..
                "undersigned also acknowledges that any harm that should come to <him/her> as a result of " ..
                "attempting to build, forge, find, create, sell, or eat Sulfuras, is not the " ..
                "responsibility or fault of TB Ltd.\n\nBy signing this contract, you are agreeing to all " ..
                "terms listed herein.\n\n_________________\n\nSignature",
            rewardItems = {{18592, 1}},
            rewardXP = 6600,
        },
        [7622] = {
            description = "You must do what I could not: Save the peasants that were cut down while " ..
                "fleeing from Stratholme.\n\nThey will walk towards the light, you must ensure their " ..
                "survival. Should too many fall, our cursed existence shall continue - you will have " ..
                "failed.\n\nEvery ability, prayer, and spell that you have learned will be tested. May " ..
                "the Light protect you, <name>.",
            rewardItems = {{18659, 1}},
        },
        [7625] = {
            description = "So you come to me seeking Xorothian stardust? You wish to open a portal to " ..
                "Xoroth, the domain of Hel'nurath my rival? Perhaps you plan to steal from him one of his " ..
                "precious dreadsteeds?\n\nVery well. My servant Ur'dan has a supply of Xorothian " ..
                "stardust. You may obtain it from him... if you can pay the price.",
        },
        [7626] = {
            description = "A Bell of Dethmoora, named after the late warlock Dethmoora Darkeyes, is one " ..
                "of the three tools needed to create a Circle of Greater Summoning. When properly atuned " ..
                "with the Wheel and the Candle, these items conduct vast stores of arcane power.\n\nMy " ..
                "servant Gorzeeki can construct such a bell, but to do so he will need a large supply of " ..
                "elixirs of shadow power. Procure the elixirs from an alchemist and bring them to " ..
                "Gorzeeki.",
        },
        [7627] = {
            description = "A Wheel of the Black March contains and directs the violent energies required " ..
                "for the Circle of Greater Summoning. For Gozeeki to construct a wheel, he will need both " ..
                "large brilliant shards from an enchanter, and dark iron ore from a master " ..
                "miner.\n\nAcquire these and bring them to my servant.",
        },
        [7628] = {
            description = "A Doomsday Candle stores fire and directs it at those who would disrupt your " ..
                "ritual. When creating your Circle of Greater Summoning, if your candle is lit then any " ..
                "wayward demons will be burned by its flames!\n\nContaining that fire is not easy, and " ..
                "requires the essence within the scales of a black dragon. Acquire those scales from a " ..
                "skinner and bring them to Gorzeeki Wildeyes.",
        },
        [7629] = {
            description = "There is one more process required for Mor'zul's parchment; I need paper " ..
                "infused with Xorothian stardust. And... I'm afraid I can't do that here. I don't have " ..
                "the equipment!\n\nThere is an alchemy lab, however, with everything needed. It's in the " ..
                "Scholomance, on the isle of Caer Darrow in the Plaguelands.\n\nI can't make the trip, " ..
                "but here - take this jar. There's an imp inside who is quite clever. Let him out at the " ..
                "alchemy lab and he'll infuse the parchment.",
        },
        [7630] = {
            description = "Now that the Bell, Wheel and Candle are made, I should make a black lodestone. " ..
                "During your ritual, you'll need that lodestone to maintain the other ritual objects if " ..
                "they should fail.\n\nTo make the lodestone, I require arcanite. Do you have any? If not, " ..
                "then... you'll have to get the arcanite from an alchemist.\n\nReturn to me when you have " ..
                "the arcanite, and then I'll make the black lodestone.",
        },
        [7631] = {
            description = "All the preparations are made. Now, you must perform the ritual to create a " ..
                "Circle of Greater Summoning, then use the parchment infused with Xorothian stardust... " ..
                "to open a portal to Xoroth.\n\nI have written the instructions for the ritual onto a " ..
                "scroll. Study it closely, for you must perform each step exactly if you wish to " ..
                "succeed.\n\nFortune to you, <name>. And may the souls of your enemies swiftly find their " ..
                "way into your shard pouch.",
        },
        [7632] = {
            description = "The epidermis of the leaf glows a bright green. The surface is extremely " ..
                "rugose, exposing several veins and wrinkles.\n\nIf you had to take a guess, you would " ..
                "say this leaf came from something ancient and powerful.\n\nMaybe you should find the " ..
                "original owner of this leaf?",
        },
        [7634] = {
            description = "Greetings, <class>. I am Hastat, Ancient of Lore. I hold knowledge lost eons " ..
                "ago.\n\nWith the proper binding, one of my leaves can serve as a quiver the likes of " ..
                "which has not been seen in 10,000 years. A quiver that when accompanied by a bow of " ..
                "Ancients, could grant untold powers.\n\nReturn here with sinew from an adult blue dragon " ..
                "and this quiver shall be yours.",
            rewardItems = {{18714, 1}},
        },
        [7635] = {
            description = "Vartrus may offer you the stave to create a bow of Ancients but only I can " ..
                "enchant the string required to complete the bow.\n\nIt is a simple task, puny one. Slay " ..
                "a mature black dragon and remove the sinew from its bones. Return that sinew to me and I " ..
                "shall enchant the material into an almost indestructible bow string.",
            rewardItems = {{18724, 1}},
        },
        [7636] = {
            description = "Agents of the Burning Legion are still active in our world, <class>. These " ..
                "agents corrupt all that they touch. Nature wilts and weeps in their presence.\n\nYou " ..
                "must track down these demonic corrupters and destroy them, <name>. Be warned, you must " ..
                "engage them by yourself or they will flee. As long as you are alone, they will try and " ..
                "destroy you. You must strike at them, turning their arrogance into misery.\n\nI grant " ..
                "you a piece of my bark, the inscriptions shall lead you to your targets. Retrieve their " ..
                "heads.",
            rewardItems = {{18707, 1}},
        },
        [7637] = {
            description = "In order to prepare yourself for this task, you must first show due sacrifice " ..
                "and judgment... with an emphasis on sacrifice.\n\nYou must acquire High Priest Rohan 's " ..
                "exorcism censer for your task. Even though its use will be for good and just reasons, " ..
                "due compensation must be given for it.\n\nProceed to Ironforge and speak with the High " ..
                "Priest. By bringing ample coin with you to help offset the loss of his censer, it will " ..
                "show your due sacrifice.\n\nGo now <name>, time is of the essence.",
        },
        [7638] = {
            description = "The time has come, <name>, for you to learn about what it will take for you to " ..
                "acquire something you have no doubt waited on for some time... your charger.\n\nSpeak " ..
                "with Lord Grayson Shadowbreaker here in Stormwind's Cathedral District. It is he who " ..
                "will guide you not only though the legerdemain of a Paladin's most trusted mount, but " ..
                "the tasks before you to acquire one of your own.\n\nI wish you the best in this trial. " ..
                "For the Light, noble <brother/sister>!",
        },
        [7639] = {
            description = "With my blessings, take the censer. I myself have used it in several " ..
                "exorcisms, and it should serve you well for the arduous tasks that lie ahead.\n\nReturn " ..
                "now to Lord Grayson Shadowbreaker in Stormwind, <name>. Your quest continues with him.",
        },
        [7640] = {
            description = "I have added a pinch of dirt from the tainted ground of Terrordale in the " ..
                "Eastern Plaguelands to the censer. You will now use this censer to find areas there that " ..
                "show signs of spiritual turmoil and disturbance. Look for green auras that permeate the " ..
                "ground as the physical world buckles under the torment of the spirit realm and use the " ..
                "censer to drive out the evil spirits.\n\nWhen you have passed sufficient judgment on the " ..
                "spirits there, you will be ready to proceed.",
        },
        [7641] = {
            description = "A paladin's charger is nothing more than a pack animal without proper barding " ..
                "for it. The barding used by your charger not only needs to be of the finest materials " ..
                "possible, but because of the circumstances involved it must also be sufficiently attuned " ..
                "to the spirit realm.\n\nFirst things first, <name> - let's get your barding made. In " ..
                "Stormwind's Dwarven District is one of the finest craftsmen living today, Grimand " ..
                "Elmore. His work will not be cheap, but his quality is what we seek. Speak with him.",
        },
        [7642] = {
            description = "You'll need four things for the barding - runecloth for the lining, arcanite " ..
                "bars for the plating, Arthas' Tears for the spiritual attunement, and Stratholme holy " ..
                "water for the spiritual imbuement. Actually, you need five things... gold for my fee. " ..
                "That fee includes all labor as well as a handcrafted saddle and stirrups.\n\nOnce you've " ..
                "got all that, I'll be able to finish your barding. Until then, there are some things I " ..
                "can get started on for you while you assemble your collection of goods.",
        },
        [7643] = {
            description = "Your barding needs a special form of blessing, one from an appropriate spirit. " ..
                "In Dire Maul is such a spirit, the Ancient Equine Spirit. It is currently held by a " ..
                "corrupt treant, Tendris Warpwood. Pass judgment upon this foul beast, <name>.\n\nKnow " ..
                "this - freedom alone is not enough. You must soothe the spirit before receiving its " ..
                "blessing. For that, special horse feed is needed. Travel to Southshore first and speak " ..
                "with Merideth Carlson on this... and prepare for more sacrifice.",
        },
        [7644] = {
            description = "As the barding rests on the back of the Ancient Equine Spirit, it glows ever " ..
                "so slightly. The air is thick with power for a brief moment, and then the barding " ..
                "disappears from the back of the horse and is now secure in your backpack.\n\nIt would " ..
                "seem that the barding has been blessed. As per Lord Shadowbreaker's instructions, you " ..
                "should now return with it to him in Stormwind.",
            rewardXP = 8300,
        },
        [7645] = {
            description = "The Silver Hand thought me MAD when I told them that I could make a special " ..
                "horse feed that could nourish spiritual horses. EVERYONE thought I was mad! Well, now " ..
                "it's payback time!\n\nI'll make what you need, PALADIN... so-called CHAMPION... but it " ..
                "will cost you. I need special biscuits - Enriched Manna Biscuits sold only by the Argent " ..
                "Dawn - for this blend. I also demand, yes DEMAND gold as compensation for the misery I " ..
                "have endured!\n\nShow me the sacrifice you tout so much, PALADIN.",
            rewardItems = {{18775, 1}},
        },
        [7646] = {
            description = "We now must assemble a Divination Scryer - this will begin the trial that will " ..
                "allow you to redeem the fallen charger. Your scryer, actually, is almost done. The " ..
                "exorcism censer used in Terrordale is the catalyst for it, and I will fashion a suitable " ..
                "housing for the device.\n\nThe last components needed, though, are two diamonds. They " ..
                "must be as juxtaposed in brilliance as they are in purpose - an Azerothian and a " ..
                "Pristine Black. These two will be the beacon by which the scryer will pierce the shadows!",
        },
        [7647] = {
            description = "Take this satchel - in it are the items you will need for your task.\n\nUse " ..
                "the divination scryer in the heart of the Great Ossuary's basement to bring forth " ..
                "accursed spirits that must be judged. Use your judgments wisely during this trial - they " ..
                "will prove more potent than you realize. After the spirits, the death knight will " ..
                "appear; defeat him and reclaim the lost soul of the charger. Only then <name>, will you " ..
                "be able to redeem it and place your barding upon your new steed!\n\nGood luck!",
        },
        [7648] = {
            description = "<Grimand wipes sweat from his brow, beaming with a sense of pride.>\n\nThere " ..
                "you are, my friend. This is some of my finest work - as good as the barding I personally " ..
                "made for Lord Shadowbreaker when he went for his own charger. I thank you for your trust " ..
                "in me to provide for you the best.\n\nNo doubt Grayson will want to see the work for " ..
                "himself as well. Take your barding to him, and give him my thanks for his honorable " ..
                "business.",
        },
        [7649] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{12727, 1}}},
        [7650] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{12726, 1}}},
        [7651] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{12725, 1}}},
        [7653] = {rewardItems = {{12688, 1}}},
        [7654] = {rewardItems = {{12700, 1}}},
        [7655] = {rewardItems = {{12690, 1}}},
        [7656] = {rewardItems = {{12705, 1}}},
        [7657] = {rewardItems = {{12701, 1}}},
        [7658] = {rewardItems = {{12715, 1}}},
        [7659] = {rewardItems = {{12687, 1}}},
        [7666] = {rewardItems = {{18746, 1}}},
        [7667] = {
            description = "<name>, there is a pressing matter I hope you can help with... both materially " ..
                "and spiritually. Allow me to explain.\n\nWithin the depths of the Scholomance in " ..
                "Lordaeron is a chamber called the Great Ossuary. I need to complete a device that would " ..
                "pierce the shadows of this horrid room. To finish what I have started, I need two " ..
                "diamonds: an Azerothian and a Pristine Black. These are not trivial items, I know - I " ..
                "just don't have the resources myself.\n\nCould you provide me with one of each?",
        },
        [7669] = {rewardItems = {{18746, 1}}},
        [7670] = {
            description = "The time has come, <name>, for you to learn about what it will take for you to " ..
                "acquire something you have no doubt waited on for some time... your charger.\n\nSpeak " ..
                "with Lord Grayson Shadowbreaker in Stormwind's Cathedral District. It is he who will " ..
                "guide you not only though the legerdemain of a Paladin's most trusted mount, but the " ..
                "tasks before you to acquire one of your own.\n\nI wish you the best in this trial. For " ..
                "the Light, noble <brother/sister>!",
            rewardXP = 660,
        },
        [7703] = {
            description = "Now you da king, so maybe you get prized Gordok artifact back from creepy elf " ..
                "who calls himself Prince! Da king before you failed, just like all da other kings since " ..
                "Tortheldrin - da creepy elf - stole it from old timey Gordok king!\n\nArtifact is called " ..
                "da Gauntlet of Gordok Might. Old timey stories say only da one true king da Gordok can " ..
                "get it back. Old timey story also say creepy elf is still around here - you find it and " ..
                "it will become mighty gauntlet you wear forever! Yar, I show you!",
            rewardChoices = {{18366, 1}, {18367, 1}, {18368, 1}, {18369, 1}},
        },
        [7761] = {
            description = "Imbecile,\n\nI hold very little faith in your ability to prevent outsiders " ..
                "from accessing the master's lair. In the very likely event of your death, this orb has " ..
                "its own failsafe built in to prevent outsiders from teleporting directly into " ..
                "Blackwing.\n\nOnly those with the Mark of Drakkisath branded upon their hand may make " ..
                "use of this orb. Thankfully, Drakkisath is not nearly as incompetent as you, " ..
                "Quartermaster. He guards the brand himself!\n\n-Warchief Rend Blackhand\n\nP.S. Destroy " ..
                "this letter, idiot.",
        },
        [7781] = {
            description = "The old feeling returns. The welcome pangs of victory reverberate throughout " ..
                "your being. Before you lies the monolithic, battle scarred head of Nefarian. Return it " ..
                "to your Highlord, champion.",
        },
        [7782] = {
            description = "Go to the Valley of Heroes and speak with Field Marshal Stonebridge.",
            rewardChoices = {{19383, 1}, {19366, 1}, {19384, 1}},
        },
        [7783] = {
            description = "The old feeling returns. The welcome pangs of victory reverberate throughout " ..
                "your being. Before you lies the monolithic, battle scarred head of Nefarian. Return it " ..
                "to your Warchief, champion.",
        },
        [7785] = {
            description = "Examine the vessel of his rebirth, mortal. It is from this that the Windseeker " ..
                "shall be reborn!",
        },
        [7786] = {
            description = "I have told you all that I know, <name>. It is you who must find elementium. " ..
                "It is you who must destroy the Firelord's corporeal form.\n\nDo this and gain the " ..
                "blessing of Thunderaan.",
        },
        [7787] = {
            description = "You have defeated the Wind Seeker. Take the dormant blade and force the lying " ..
                "wretch, Demitrian, to use the materials you provided for his betrayal to wake " ..
                "Thunderfury.",
            rewardItems = {{19019, 1}},
        },
        [7848] = {
            description = "Rifts stir, tear, and collapse all around us, <race>. Not two paces from where " ..
                "I stand is a tear leading through the depths of Blackrock Mountain, into the maw of the " ..
                "Firelord.\n\nSurprised? Pity... The mortal races cannot comprehend that which they " ..
                "cannot see, touch, or feel.\n\nI assure you, the portal is there and access is " ..
                "possible.\n\nI've piqued your interest? Attunement is simple. Venture into Blackrock " ..
                "Depths and retrieve a core fragment. Return it to me and I shall attune your essence " ..
                "with the portal.",
        },
        [7863] = {rewardItems = {{19150, 1}}},
        [7864] = {rewardItems = {{19151, 1}}},
        [7865] = {rewardItems = {{19152, 1}}},
        [7866] = {rewardItems = {{19154, 1}}},
        [7907] = {
            description = "Now that you have gathered all of the Beast cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{19288, 1}},
        },
        [8051] = {rewardItems = {{19593, 1}}},
        [8052] = {rewardItems = {{19594, 1}}},
        [8116] = {rewardItems = {{19606, 1}}},
        [8120] = {
            description = "As you no doubt have heard, the League of Arathor is sending large numbers of " ..
                "troops into Arathi Basin. Eager for food and supplies, these Alliance fools are intent " ..
                "to take and control the rich resources there. We must show them that Arathi will never " ..
                "again be a home for humans!\n\nGo to Arathi Basin and assault the mine, the lumber mill, " ..
                "the blacksmith and the stables. Pull down the enemies' banners, declaring those " ..
                "territories for the Horde.\n\nGo, <name>. Report back to me when this task is complete.",
            rewardMoney = 16500,
        },
        [8151] = {
            description = "Ogtinc of Azshara has sent out a call for seasoned hunters such as yourself. " ..
                "He is a furbolg hunter who has left his tribe to aid the Cenarion Circle. His teachings " ..
                "are meant to enrich the wisdom of others who share his craft, and guide them toward " ..
                "maintaining a balance. You would do well to speak with him.\n\nOgtinc resides atop the " ..
                "cliffs of Azshara, northeast from the Ruins of Eldarath.",
        },
        [8153] = {
            description = "The courser wears the mightiest antlers in the known lands. Such antlers are " ..
                "used to defend the courser, goring an attacker and often damaging the points. Perfect, " ..
                "natural antlers are the sign of an animal spirit with supreme confidence.\n\nTo hold " ..
                "such antlers will bestow the same confidence in you.\n\nHunt the mosshoof courser, find " ..
                "the perfect antlers and bring them to me.",
        },
        [8169] = {
            description = "As you no doubt have heard, the League of Arathor is sending large numbers of " ..
                "troops into Arathi Basin. Eager for food and supplies, these Alliance fools are intent " ..
                "to take and control the rich resources there. We must show them that Arathi will never " ..
                "again be a home for humans!\n\nGo to Arathi Basin and assault the mine, the lumber mill, " ..
                "the blacksmith and the stables. Pull down the enemies' banners, declaring those " ..
                "territories for the Horde.\n\nGo, <name>. Report back to me when this task is complete.",
            rewardMoney = 13000,
        },
        [8191] = {rewardItems = {{19789, 1}}},
        [8233] = {
            description = "Lord Jorach Ravenholdt has requested your presence. The matter is secret, and " ..
                "I cannot say any more.\n\nRavenholdt Manor is located in the Hillsbrad Foothills -- look " ..
                "for a path in the mountains northwest of Durnhold Keep.",
        },
        [8240] = {
            description = "The destruction of the various Hakkari Bijous is of grave importance to us, so " ..
                "much so that we welcome outsiders of the tribe to do so for themselves!\n\nTake any one " ..
                "of the bijous that you find in Zul'Gurub to the Altar of Zanza and destroy it. For this " ..
                "one time alone, I will give you an additional Honor Token from our tribe; this is above " ..
                "and beyond what you would normally receive.\n\nWitness for yourself the blessings of " ..
                "Zanza!",
            rewardItems = {{19858, 1}},
            rewardMoney = 18000,
        },
        [8243] = {rewardChoices = {{20080, 1}, {20079, 1}, {20081, 1}}},
        [8250] = {
            description = "Archmage Xylem has been asking around lately... for someone of your " ..
                "experience.\n\nIf you wish to seek him out, you can find him in Azshara. His tower is " ..
                "built high atop the cliffs, and the only way up is a teleport spell invoked by his " ..
                "arrogant servant, Sanath Lim-yo.\n\nSanath makes camp below his master's tower. To find " ..
                "him, travel to where Azshara's main road forks at the entrance to the Ruins of Eldarath. " ..
                "From that spot, head directly north until you reach the cliffs.",
        },
        [8252] = {
            description = "Take a look around you. The ruins and beaches are overrun with spitelash. " ..
                "Recently, the wretched creatures have learned to recognize the rare components " ..
                "indigenous to Azshara.\n\nSpecifically, I speak of enchanted coral -- they are drawn to " ..
                "it by reasons unknown to me. Now there is little coral left in the bay, and it is vital " ..
                "to my research. I need you to separate some enchanted coral from the spitelash sirens " ..
                "and bring it to me.",
            rewardMoney = 7500,
        },
        [8254] = {
            description = "It is the way of the divine to help those in need. The how is insignificant -- " ..
                "only the why matters.\n\nThe Cenarion Circle has such a need. Speak with Ogtinc to lend " ..
                "aid to their plight. He resides atop the cliffs to the northeast of the Ruins of " ..
                "Eldarath in Azshara.",
        },
        [8255] = {
            description = "The mosshoof coursers of Azshara are magnificent animals who once lived in " ..
                "Felwood. They naturally resist disease and poison, and were unaffected by the corruption " ..
                "there. In their ancestral wisdom, they simply chose to leave that sickened place.\n\nIt " ..
                "saddens my heart, but I must ask you to hunt these mighty beasts for me. Gather four " ..
                "courser glands as the first ingredient for a restorative salve -- a salve we will use to " ..
                "heal Felwood.",
        },
        [8277] = {
            description = "Beetix Ficklespragg at your service! My cousin Noggle makes a living gathering " ..
                "rare herbs for Cenarion Hold alchemists. Or used to, anyway. He came back from his last " ..
                "trip with a strong poison running though his veins.\n\nI've managed to slow down the " ..
                "venom, but to fully neutralize it I need poison samples from whatever stung " ..
                "him.\n\nNoggle arrived from the north, so I'd bet my shirt stonelash scorpids or sand " ..
                "skitterers did it. Bring me some stingers and fangs and I'll try to make an antidote for " ..
                "him.",
            rewardMoney = 8500,
        },
        [8278] = {
            description = "Blasted! The antidote didn't work. Noggle must've been stung by one of the " ..
                "stronger creatures in the far south.\n\nI'm going to need you to go there and get me " ..
                "some more samples, <name>. The good news is that since their poison is stronger I won't " ..
                "require as many. The bad news is that there are more kinds of poisonous creatures " ..
                "crawling around the southern area so you'll have to draw from more sources.",
            rewardChoices = {{13446, 2}, {13444, 1}},
            rewardMoney = 6500,
        },
        [8280] = {
            description = "Cenarion Hold is a location of utmost strategic importance. I'm convinced that " ..
                "while we hold it our victory over the silithid is guaranteed. Provided our influx " ..
                "supplies can be maintained, that is.\n\nDesert worms have proven to be more of a threat " ..
                "to our supply caravans than even the silithid themselves. Just this morning, a large " ..
                "shipment of morrowgrain was ravaged by a group of dredge strikers. I need you to thin " ..
                "their numbers to ensure our supplies aren't jeopardized.",
            rewardMoney = 8500,
        },
        [8281] = {
            description = "Your performance has been truly exemplary so far, <name>. Our supply lines are " ..
                "not completely safe yet, however. In the absence of dredge strikers, their larger " ..
                "southern cousins will surely move in to take their place in the north.\n\nYou'll have to " ..
                "kill quite a few dredge crushers to keep them at bay, but we cannot leave the safety of " ..
                "our supply lines to chance.",
            rewardMoney = 17000,
        },
        [8283] = {
            description = "The terrible scorpid, Deathclasp, is believed to have retreated to the " ..
                "southern mountain range in the presence of increased silithid activity. She presents a " ..
                "great threat to patrols and expeditions in the southern regions. Individuals " ..
                "participating in her destruction will be remunerated handsomely. Inquire with Captain " ..
                "Vish Kozus, at the top of the Cenarion Hold Watchtower, regarding a reward.",
            rewardChoices = {{20646, 1}, {20647, 1}},
            rewardMoney = 18000,
        },
        [8284] = {
            description = "A camp of Twilight's Hammer cultists once thrived northwest of here. If you " ..
                "were to venture there now, you'd find the area swarming with elementals and nothing but " ..
                "scattered pieces of wood and canvas to mark the spot where the camp was.\n\nI've " ..
                "recovered a few fragments of a clay tablet from the site, but I have too few of them to " ..
                "piece together anything useful. See if you can find the remaining tablet fragments so we " ..
                "can shed some light into the Twilight's Hammer presence here in Silithus.",
            rewardMoney = 9000,
        },
        [8285] = {
            description = "There are rumors of a Twilight's Hammer member called Ortell having deserted " ..
                "his sect. Word has it he hid in the mountains south of Southwind Village, where he lives " ..
                "as a hermit. Perhaps you can enlist his help in deciphering the tablet.\n\nTake the " ..
                "restored tablet with you and seek out Ortell.",
        },
        [8288] = {
            description = "There is no time to waste! A hero must be found! The task I give will require " ..
                "an army to complete but only one may rise from the throng of would be champions to take " ..
                "on the burden and responsibility of an ally of the Brood.\n\nWithin the lair of the Lord " ..
                "of Blackrock is a most cruel beast. The Broodlord Lashlayer guards the Halls of Strife, " ..
                "blocking the way into Nefarian's inner sanctum. Slay the foul aberration and return his " ..
                "head to me. Do this and you may begin the next step of your journey.",
        },
        [8306] = {
            description = "I need you to venture into Hive'Regal and find what became of my dearest " ..
                "Natalia, <name>. This will be no easy task for you to do alone. I recommend that you " ..
                "bring some friends along. Before you dive headlong into the maw of madness, make sure " ..
                "that you go back and speak with those dwarves. They might be able to give you some tips " ..
                "on dealing with the silithid that inhabit that hive.\n\nAnd <name>, if she truly is as " ..
                "mad as they say... do what you must.\n\n< Commander Mar'alith turns away from you.>",
            rewardItems = {{20724, 1}},
            rewardMoney = 27000,
        },
        [8318] = {
            description = "Some of the Twilight's Hammer cultists carry around little papers with " ..
                "gibberish written on them. I want you to bring me a stack of them, <class>.\n\nI can't " ..
                "figure out what the gibberish means, but that's not the point! These papers are how " ..
                "their different groups communicate secretly. The more texts we take out of circulation, " ..
                "the less they can communicate!",
            rewardMoney = 18000,
        },
        [8323] = {
            description = "Now that I have the Twilight Lexicon in my possession, there is a small favor " ..
                "I'd like to ask of you.\n\nMy former organization has a secret encoded bulletin they " ..
                "circulate on a monthly basis.\n\nIf they make any progress searching for me or if they " ..
                "call off the search, word will be published on the True Believer.\n\nAlthough this " ..
                "information is obviously valuable to me, the publication contains other useful " ..
                "information that I can share. Bring me any encoded texts you find on Twilight's Hammer " ..
                "members.",
            rewardMoney = 9000,
        },
        [8324] = {rewardMoney = 4500},
        [8333] = {rewardItems = {{20422, 1}}},
        [8341] = {
            description = "Lords of the Abyssal Council can only be summoned through the greater wind " ..
                "stones, and only the top ranking members of the Twilight's Council may speak to them. " ..
                "But... I have found a way to upgrade your disguise and fool the Abyssal Lords!\n\nThe " ..
                "disguise calls for a ring of lordship, worn only by the highest members of the cult. I " ..
                "will craft one for you if you can bring me large brilliant shards and abyssal signets.",
            rewardItems = {{20451, 1}},
        },
        [8352] = {
            description = "Huum and I were just talking about you. He tells me you're just about ready to " ..
                "try your hand at fighting an Abyssal Lord!\n\nI must tell you this is a very dangerous " ..
                "endeavor. You'd better bring backup. And I don't mean one or two of your friends, I'm " ..
                "talking about a top-notch, battle-ready fighting force. If your friends are as good as " ..
                "you, you might even defeat it!\n\nIf you do - and I'll want evidence, as always - I'll " ..
                "give you a truly great reward.",
            rewardItems = {{20602, 1}},
            rewardMoney = 27000,
        },
        [8368] = {
            description = "The battle in Warsong Gulch against the Silverwing Sentinels is of great " ..
                "importance. Under the guise of protecting a forest that doesn't belong to them, the " ..
                "Alliance seeks to deny the Horde one of our largest sources for lumber.\n\nDo not let " ..
                "this happen, <name>! Come back to me with proof of serving the Horde in a worthy manner!",
            rewardMoney = 1100,
        },
        [8410] = {
            description = "Bath'rah the Windwatcher has sent out a summons for a shaman of your wisdom. " ..
                "He requests you bring a sample of each of the elements to show you are ready.\n\nTo find " ..
                "Bath'rah, go to the river east of Tarren Mill. Follow the river north until you come " ..
                "across the ruins where Bath'rah resides.",
        },
        [8413] = {
            description = "The spirit totem just isn't enough. We be needin' some voodoo magic to make it " ..
                "work jus' right.\n\nThe trolls in the sunken temple have feathers strong with voodoo " ..
                "magics. Go there and kill Gasher, Mijan, Zolo, Hukku, Zul'lor, and Loro. Then we have " ..
                "magic enough for a real spirit totem.",
            rewardChoices = {{20369, 1}, {20503, 1}, {20556, 1}},
            rewardMoney = 15500,
        },
        [8417] = {
            description = "In the Blasted Lands, there is a troubled spirit who was once a great hero of " ..
                "the horde. A warrior's honor does not die with the body, and it would serve you well to " ..
                "speak with him.",
        },
        [8419] = {
            description = "<name>, an imp in Felwood by the name of Impsy has requested your presence. It " ..
                "is somewhat strange, as he has asked that you bring a piece of felcloth as a sign of " ..
                "good faith. Considering the power you already wield as a warlock, I can only assume you " ..
                "know the satyrs of Felwood carry this felcloth.\n\nYou can find Impsy just north of the " ..
                "Bloodvenom Falls, which I've heard is quite lovely this time of year.",
        },
        [8428] = {
            description = "The battle in Warsong Gulch against the Silverwing Sentinels is of great " ..
                "importance. Under the guise of protecting a forest that doesn't belong to them, the " ..
                "Alliance seeks to deny the Horde one of our largest sources for lumber.\n\nDo not let " ..
                "this happen, <name>! Come back to me with proof of serving the Horde in a worthy manner!",
            rewardMoney = 7000,
        },
        [8461] = {
            description = "There is a camp of Deadwood furbolgs directly to our southwest. Corruption " ..
                "permeates the camp, and I wish to put an end to it before they become a problem.\n\nThe " ..
                "Deadwood tribe is evil, but it is the effects of the fel that pollutes their minds. " ..
                "Their hostility is not truly an innate quality, yet they cannot be helped. It saddens me " ..
                "that we must fight our own brethren.\n\nPlease, <name> - I ask you to do what must be " ..
                "done. Simply spare me the details; such troublesome images upset me far too much.",
            rewardChoices = {{21316, 1}, {21317, 1}},
        },
        [8462] = {
            description = "Perhaps you are capable of handling a larger threat that we Timbermaw face. " ..
                "You certainly have shown yourself capable here...\n\nAnother of my kind stands guard " ..
                "outside the entrance to Timbermaw Hold, along this road far to the north. His name is " ..
                "Nafien; while he may appear to be a feral and unsavory beast, fear him not. He only " ..
                "seeks aid against the malign forces that threaten our home.",
        },
        [8495] = {
            description = "Back so soon? Stop making me re-evaluate my low opinion of you <class>, you're " ..
                "making me feel all gooey inside. So, as you can tell we still don't have enough iron " ..
                "bars for all of the weapons, armor, steam tanks and whatnot that need building for the " ..
                "bug hunt. Think you have it in you to bring back another stack of twenty iron bars in " ..
                "between all of those trips to Zul'Gurub, or wherever it is that you kids hang out these " ..
                "days?",
            rewardItems = {{21436, 5}, {21511, 1}},
        },
        [8496] = {
            description = "Our supply of bandages in the battlefield is running dangerously low after the " ..
                "recent casualties we have incurred. Obtain a batch of first-aid supplies and deliver " ..
                "them to Windcaller Proudhorn in Cenarion Hold.",
            rewardItems = {{20800, 1}, {20805, 1}},
        },
        [8499] = {
            description = "It is very kind of you to inquire about the needs that the Alliance has. In " ..
                "addition to all of the other collection efforts underway, we are in need of a great " ..
                "quantity of thorium bars, which is the task that I am in charge of. The thorium will be " ..
                "used in the creation of many different things for the war, foremost of which is the " ..
                "construction of a battalion of steam tanks to be airlifted into Silithus as soon as they " ..
                "are completed. Can you aid us in this endeavor, <class>?",
            rewardItems = {{21436, 10}, {21513, 1}},
        },
        [8504] = {
            description = "Well hello again there... what was it? Ah yes, <name>! Come to see if I still " ..
                "need more stranglekelp have you? Well, it's your lucky day, because the answer to that " ..
                "very important question is a very affirmative YES! Think you could gather up twenty more?",
            rewardItems = {{21436, 3}, {21510, 1}},
        },
        [8507] = {
            description = "Greetings, <name>. Before I assign you to more involved tasks in the war, " ..
                "you'll need to do your share of field duty.\n\nYou will find Captain Blackanvil's " ..
                "Ironforge Brigade outside Hive'Zora.\n\nReport to him or his lieutenant, Janela " ..
                "Stouthammer and come back to me. I shall have a more advanced assignment for you " ..
                "ready.\n\nOh and please do us a favor and stay away from the Orgrimmar Legion. We've " ..
                "been forced to keep the two forces well apart from one another due to mutual animosity.",
            rewardChoices = {{20808, 1}, {21132, 1}, {20809, 1}},
        },
        [8508] = {rewardItems = {{20810, 1}}},
        [8510] = {
            description = "Ok, so it looks like I still need more Arthas' Tears. I would imagine that you " ..
                "will be able to find them in the general location that you gathered them up for me last " ..
                "time. The quicker we get these, the faster we can start up the offensive against the " ..
                "forces at Ahn'Qiraj.\n\nYou gonna help us out again <class>?",
            rewardItems = {{21436, 10}, {21513, 1}},
        },
        [8519] = {
            description = "As you regain your composure and focus your gaze, you notice that something " ..
                "stirs within the crystal. Upon closer inspection, you realize that you are looking into " ..
                "the past... a memory... long forgotten.",
        },
        [8521] = {
            description = "It is very kind of you to offer to help me again <class>. It looks like we've " ..
                "collected $2082w silk bandages, so we'll need more.",
            rewardItems = {{21436, 5}, {21511, 1}},
        },
        [8527] = {
            description = "Hi again <class>. I can tell you're very excited about all of this. So I " ..
                "suppose you want to bring me another twenty roast raptor. Great. Well you do that. I " ..
                "guess I'll see you when you get back.",
            rewardItems = {{21436, 5}, {21511, 1}},
        },
        [8534] = {
            description = "We've sent our best scouts deep into the silithid hives to gather " ..
                "intelligence. Scout Azenel has been watching the silithid movements at Hive'Zora for " ..
                "several days now. Find her and obtain a written report. We need to be able to act on " ..
                "that information as soon as possible, <name>.",
            rewardItems = {{20801, 1}, {21133, 1}},
        },
        [8535] = {
            description = "The Twilight's Hammer and the elemental nobles they worship present a " ..
                "formidable threat to our operations in Silithus. With the new enemies we're facing " ..
                "inside Ahn'Qiraj, we cannot afford to lower our guard to our enemies outside.\n\nFind a " ..
                "way to summon and destroy a Hoary Templar and report to Bor Wildmane.",
            rewardItems = {{20801, 1}, {20809, 1}},
        },
        [8538] = {
            description = "The links between the Twilight's Hammer and the Abyssal Council are proving to " ..
                "be more important than we had expected.\n\nWe believe the elemental nobles known as the " ..
                "Abyssal Dukes are one of the primary force organizing the Twilight's Hammer cultists. " ..
                "Find a way to lure the four Abyssal Dukes into our plane of existence and destroy " ..
                "them!\n\nYour dedication and prowess in past assignments have led us to choose you for " ..
                "this particular assignment. We are certain you will succeed in this endeavor.",
            rewardItems = {{21508, 1}},
        },
        [8539] = {
            description = "Reinforcements have been called on to join the assault on Hive'Zora. You have " ..
                "been selected to target Hive'Zora hive sisters. Report back to Commander Mar'alith after " ..
                "completing your task.",
            rewardItems = {{20802, 1}},
        },
        [8541] = {
            description = "The Cenarion Hold guard is in short supply of grinding stones. Procure a batch " ..
                "and deliver them immediately to Captain Vish Kozus in Cenarion Hold.",
            rewardItems = {{20800, 1}, {21132, 1}},
        },
        [8545] = {
            description = "<class>, the war it is comin' and the only thing we can do is prepare for it. " ..
                "That be where you and I can help each other, mon. Ya see, they put me in charge of " ..
                "collectin' all the mithril bars we be needin' ta build for all the things we gonna need. " ..
                "An I still be needin' more!\n\nSo, I be hopin' that you can get out there an mine us up " ..
                "some mithril, then smelt it into bars. Sound like something you can do for us?",
            rewardItems = {{21438, 10}, {21512, 1}},
        },
        [8546] = {rewardItems = {{21438, 7}, {21512, 1}}},
        [8574] = {
            description = "The badges you collect from performing combat, logistics and tactical " ..
                "assignments for Windcaller Proudhorn are more than just for show, <name>.\n\nYou'd be " ..
                "wise to hold on to them. As you prove your loyalty to our organization I can offer you " ..
                "some of the gear we reserve for our closest allies in exchange for those badges.",
            rewardChoices = {{21184, 1}, {21185, 1}, {21186, 1}, {21189, 1}},
        },
        [8575] = {
            description = "You cannot understand a single word on this ledger. You don't even know what " ..
                "language it is written in!",
        },
        [8586] = {
            description = "My recipe is complete! What I need from you now is some rocket fuel and " ..
                "deeprock salt. I'll handle the spices and the meat you brought me will cover the " ..
                "rest.\n\nAfter you bring me what I asked for, the chicken will be ready to take back to " ..
                "Narain.",
            rewardItems = {{21025, 1}, {21023, 20}},
            rewardMoney = 27000,
        },
        [8588] = {
            description = "Since we're preparing for war, it might be best if we get all of the goods we " ..
                "need first, don't you think, mon? One of the staples of the war materiel that we're " ..
                "producing is heavy leather. We'll use it for just about everything, from reinforcement " ..
                "to armor, and good old plain tarps too.\n\nBut first we need to get our hands on more of " ..
                "it. That's your job, <class>. Sharpen your knife and bring me back a bundle. Then we'll " ..
                "talk further.",
            rewardItems = {{21438, 10}, {21511, 1}},
        },
        [8589] = {rewardItems = {{21438, 5}, {21511, 1}}},
        [8593] = {
            description = "You seek to prove your worth to my kind, mortal? Very well, perhaps we can be " ..
                "of mutual assistance.\n\nThe ancient sandworm, Ouro, is a being of legendary power. He " ..
                "is rumored to have been created by the Old God himself as a mockery of life.\n\nHis skin " ..
                "is unnatural... thick, nearly impregnable, yet it's flexible and allows him to move with " ..
                "the speed and grace of a much smaller creature.\n\nBring me a sample of his skin along " ..
                "with other minor components and I shall craft you leggings of great power.",
            rewardItems = {{21352, 1}},
        },
        [8594] = {
            description = "It is said among us that the ornate shoulder armor worn by the mortal races " ..
                "started as an attempt to emulate the wings of a dragon.\n\nBring me the bindings worn by " ..
                "the highest Qiraji leaders and I shall shape them into a set of pauldrons more dreadful " ..
                "than even the wings of Nefarian himself!",
            rewardItems = {{21350, 1}},
        },
        [8605] = {rewardItems = {{21438, 3}, {21510, 1}}},
        [8608] = {rewardItems = {{21438, 7}, {21512, 1}}},
        [8613] = {
            description = "It be a nice day for fishin', don't'cha think mon? Good thing, cuz I be " ..
                "needin' a lot of fish it lookin' like. The Horde, they askin' me to be in charge of " ..
                "collectin' a ton of the spotted yellowtail for them. They say they needin' it for the " ..
                "war they getting' ready for at Ahn'Qiraj. I say to them I do the best I can. So I be " ..
                "needin' to get some help. You gonna be helpin' me, <class>?",
            rewardItems = {{21438, 10}, {21512, 1}},
        },
        [8614] = {rewardItems = {{21438, 7}, {21512, 1}}},
        [8696] = {
            description = "I'm glad to hear you're aiding us in our attack on Ahn'Qiraj, <name>. I can " ..
                "make you a protective item that'll be of assistance in the fight against our enemy, " ..
                "<class>.\n\nI shall need a Qiraji drape, which I'll resize for you of course. I'll also " ..
                "need idols and scarabs which I'll use to create a suitable clasp.\n\nI promise you won't " ..
                "be disappointed.",
            rewardItems = {{21403, 1}},
        },
        [8704] = {
            description = "The rings worn by the Qiraji lieutenants are rumored to grant them formidable " ..
                "abilities. The corrupted gems that adorn them could, in theory, be swapped out with more " ..
                "pure materials to create uncorrupted versions of the rings.\n\nThe gems that adorn " ..
                "Qiraji idols would work quite well, as their quality is superior.\n\nBring me the ring " ..
                "and idols and I'll create a powerful ring for you, <class>.",
            rewardItems = {{21402, 1}},
        },
        [8710] = {
            description = "The Qiraji and their servants wield items made with the rarest and finest " ..
                "materials: bones from gargantuan ancient creatures, gems from the depths of the earth, " ..
                "metals pure and strong.\n\nJust the sight of Qiraji artifacts fills me with an urge to " ..
                "practice my craft with their shattered and smelted pieces. Prove your allegiance to the " ..
                "Circle, <name>, and I will make you a powerful weapon from the finest Qiraji materials.",
            rewardItems = {{21416, 1}},
        },
        [8712] = {
            description = "The Qiraji and their servants wield items made with the rarest and finest " ..
                "materials: bones from gargantuan ancient creatures, gems from the depths of the earth, " ..
                "metals pure and strong.\n\nJust the sight of Qiraji artifacts fills me with an urge to " ..
                "practice my craft with their shattered and smelted pieces. Prove your allegiance to the " ..
                "Circle, <name>, and I will make you a powerful weapon from the finest Qiraji materials.",
            rewardItems = {{21401, 1}},
        },
        [8731] = {
            description = "Greetings, <name>. Before I assign you to more involved tasks in the war, " ..
                "you'll need to do your share of field duty.\n\nYou will find Captain Skullsplit's " ..
                "Orgrimmar Legion outside Hive'Regal.\n\nReport to him and come back to me with proof of " ..
                "your field service. I shall have a more advanced assignment ready for you.\n\nOh, please " ..
                "do your best to stay away from the Ironforge Brigade. Tensions are high among our " ..
                "Alliance and Horde volunteers.",
            rewardChoices = {{20808, 1}, {21266, 1}, {20809, 1}},
        },
        [8732] = {rewardItems = {{20810, 1}}},
        [8738] = {
            description = "We've sent our best scouts deep into the silithid hives to gather " ..
                "intelligence. Scout Landion has been watching the silithid movements at Hive'Regal for " ..
                "several days now. Find him and obtain a written report. We need to be able to act on " ..
                "that information as soon as possible, <name>.",
            rewardItems = {{20801, 1}, {21133, 1}},
        },
        [8772] = {
            description = "Reinforcements have been called on to join the assault on Hive'Zora. You have " ..
                "been selected to target Hive'Zora waywatchers. Report back to Commander Mar'alith after " ..
                "completing your task.",
            rewardItems = {{20802, 1}},
        },
        [8773] = {
            description = "Reinforcements have been called on to join the assault on Hive'Zora. You have " ..
                "been selected to target Hive'Zora reavers. Report back to Commander Mar'alith after " ..
                "completing your task.",
            rewardItems = {{20802, 1}},
        },
        [8774] = {
            description = "As the war effort mounts, the silithid presence in the area presents an ever " ..
                "increasing threat to our operations. You've been selected to partake on an assault on " ..
                "Hive'Regal where your primary target will consist of the Hive'Regal ambushers.\n\nReport " ..
                "back to Commander Mar'alith after your task is completed.",
            rewardItems = {{20802, 1}},
        },
        [8776] = {
            description = "As the war effort mounts, the silithid presence in the area presents an ever " ..
                "increasing threat to our operations. You've been selected to partake on an assault on " ..
                "Hive'Regal where your primary target will consist of the Hive'Regal " ..
                "slavemakers.\n\nReport back to Commander Mar'alith after your task is completed.",
            rewardItems = {{20802, 1}},
        },
        [8785] = {
            description = "The Orgrimmar Legion has put in a request for several unusual ingredients. " ..
                "Given their current performance in Silithus, we'd like to comply with their request as " ..
                "soon as possible. Gather the materials and bring them to the troll called Shai.",
            rewardItems = {{20800, 1}, {21386, 1}},
        },
        [8794] = {
            description = "Hello, I'm glad that you've decided to hear me out. The Horde needs all of the " ..
                "help that it can get to prepare for the Ahn'Qiraj War, and that means that we need you! " ..
                "Even now as we speak, official collectors are gathering the necessary material needed " ..
                "for the upcoming war, but we won't be able to meet our goals without your assistance, " ..
                "<name>!\n\nYou should go speak with the guy in charge, Warlord Gorchuk. What do you say, " ..
                "<class>? Will you help out with the vital preparations?",
        },
        [8796] = {
            description = "Hello, I'm glad that you've decided to hear me out. The Alliance needs all of " ..
                "the help that it can get to prepare for the Ahn'Qiraj War, and that means that we need " ..
                "you! Even now as we speak, official collectors are gathering the necessary material " ..
                "needed for the upcoming war, but we won't be able to meet our goals without your " ..
                "assistance, <name>!\n\nYou should go speak with the guy in charge, Field Marshal " ..
                "Snowfall. What do you say, <class>? Will you help out with the vital preparations?",
        },
        [8808] = {
            description = "The latest influx of volunteers has caused a shortage of uniforms. Procure a " ..
                "batch of uniform materials and bring them to Windcaller Proudhorn.",
            rewardItems = {{20800, 1}, {21266, 1}},
        },
        [8809] = {
            description = "Vargus, Cenarion Hold's blacksmith, has requested enchanted materials to be " ..
                "used in the crafting of powerful weapons for our forces. Obtain these and bring them " ..
                "directly to Vargus so that Cenarion Hold's troops may continue to be well equipped.",
            rewardItems = {{20800, 1}, {21266, 1}},
        },
        [8846] = {rewardItems = {{21509, 1}}},
        [8855] = {rewardItems = {{21513, 1}}},
        [8910] = {
            description = "Well met, <class>. I've something that might interest you.\n\nI have in my " ..
                "possession a set of armor much like the one worn by those of your profession, but of " ..
                "much higher quality. I'd be willing to trade the bracers for ordinary ones in exchange " ..
                "for a small favor.\n\nThe blood of the frostsabers and bears that inhabit Winterspring " ..
                "has properties I'm in need of at the moment. Bring me a sizeable sample of it along with " ..
                "the bracers and a small amount of gold. You shall find the effort worth your while.",
            rewardItems = {{22004, 1}},
        },
        [8928] = {
            description = "The core will provide us with enough juice to power our device; now we just " ..
                "have to build a rod that can channel that energy without melting.\n\nI met an imp in " ..
                "Winterspring that sold all manner of exotic goods. He had an elemental rod that would do " ..
                "perfectly. I'm kicking myself in the head right now for not having bought it.\n\nHe " ..
                "lives inside a cave in the entrance to Darkwhisper Gorge. Sneak in there and try to find " ..
                "him.\n\nMake sure he only charges you forty gold; that's the price he quoted me!",
        },
        [8932] = {
            description = "You kept your word and brought the device built by Mux. I believe a reward is " ..
                "in order if I'm to keep you interested in saving my skin. Bring me an ordinary belt and " ..
                "a set of gloves that you wish to upgrade.",
            rewardItems = {{22062, 1}, {22066, 1}},
        },
        [8947] = {
            description = "We didn't realize the importance of Valthalak's medallion, so it was divided " ..
                "along with the rest of the spoils. The first piece was taken by a dwarf named Theldren. " ..
                "I tried to retrieve it from him and he beat me within an inch of my life. You shall have " ..
                "to take the fragment by force.\n\nLast I heard of him, he'd become a gladiator for the " ..
                "Dark Iron dwarves. Getting him to fight you is going to present a bit of a challenge, " ..
                "though.\n\nGather the following materials for me. You're going to need them.",
        },
        [8962] = {
            description = "<class>, listen closely. Now that we have the brazier, and the means to light " ..
                "it, we still need another component to suffuse it with; something that will provide a " ..
                "focus strong enough to entice the spirit of my deceased, former comrade.\n\nMor " ..
                "Grayhoof, our most prominent druid, had many close friends amongst the Cenarion Circle, " ..
                "some of which have fallen to the silithid. I need you to retrieve some Druidical Remains " ..
                "from the silithid that inhabit the environs of Hive'Regal in southeastern Silithus.",
        },
        [8965] = {
            description = "<class>, listen closely. Now that we have the brazier, and the means to light " ..
                "it, we still need another component to suffuse it with; something that will provide a " ..
                "focus strong enough to entice the spirit of my deceased, former comrade.\n\nAn ogre " ..
                "necromancer that traveled with us, Kormok, delighted in summoning forth the souls of the " ..
                "banished dead of Purgation Isle, off the south coast of the Hillsbrad Foothills. Go " ..
                "there and retrieve some Soul Ashes of the Banished from their remains.",
        },
        [8969] = {
            description = "Now we have what we need, so it's time to discuss who it is that you'll be " ..
                "summoning.\n\nKormok was ok for an ogre, right up until he turned to necromancy. After " ..
                "that, things got creepy for just about everyone in the outfit. It was no surprise then " ..
                "when he took his piece of the amulet and returned to his new home, Scholomance.\n\nBut " ..
                "even there, or perhaps especially there, he was not safe from the spectral assassins. " ..
                "They slew him right in front of his master, Ras Frostwhisper.",
        },
        [8985] = {
            description = "<class>, listen closely. Now that we have the location of the last amulet " ..
                "piece, we still need another component to suffuse the brazier with; something that will " ..
                "provide a focus strong enough to entice the spirit of my deceased, former " ..
                "comrade.\n\nIsalien, our priestess, grew up in Winterspring at Starbreeze Village. I " ..
                "need you to gather a Starbreeze Village Relic from the Frostmaul giants of Frostwhisper " ..
                "Gorge in southern Winterspring, who are known for raiding to the north from time to time.",
            rewardChoices = {{22192, 3}, {22193, 3}},
        },
        [8987] = {
            description = "<class>, listen closely. Now that we have the location of the last amulet " ..
                "piece, we still need another component to suffuse the brazier with; something that will " ..
                "provide a focus strong enough to summon the remains of my deceased, former " ..
                "comrades.\n\nThe siblings, Jarien and Sothos, were believers in the way of the Scarlet " ..
                "Crusade. They aspired to knighthood within that vile organization. Go to Tyr's Hand in " ..
                "Eastern Plaguelands and retrieve a Brilliant Sword of Zealotry from the praetorians " ..
                "there.",
            rewardChoices = {{22192, 3}, {22193, 3}},
        },
        [8988] = {
            description = "<class>, listen closely. Now that we have the location of the last amulet " ..
                "piece, we still need another component to suffuse the brazier with; something that will " ..
                "provide a focus strong enough to entice the spirit of my deceased, former comrade.\n\nAn " ..
                "ogre necromancer that traveled with us, Kormok, delighted in summoning forth the souls " ..
                "of the banished dead of Purgation Isle, off the south coast of the Hillsbrad Foothills. " ..
                "Go there and retrieve some Soul Ashes of the Banished from their remains.",
            rewardChoices = {{22192, 3}, {22193, 3}},
        },
        [8991] = {
            description = "The siblings, Jarien and Sothos, decided to join the Scarlet Crusade upon the " ..
                "disbanding of our mercenary company. They took the Right Piece of Lord Valthalak's " ..
                "Amulet with them. Good riddance, I say, but we need that piece back.\n\nFrom what we " ..
                "could gather, they were actually slain by Grand Crusader Dathrohan himself for failing " ..
                "the initiation rites inside his chamber in the Scarlet Bastion.\n\nIn any case, we... " ..
                "meaning you, are still going to need to retrieve that piece of the amulet.",
        },
        [8992] = {
            description = "Now we have what we need, so it's time to discuss who it is that you'll be " ..
                "summoning next.\n\nKormok was ok for an ogre, right up until he turned to necromancy. " ..
                "After that, things got creepy for just about everyone in the outfit. It was no surprise " ..
                "then when he took his piece of the amulet and returned to his new home, " ..
                "Scholomance.\n\nBut even there, or perhaps especially there, he was not safe from the " ..
                "spectral assassins. They slew him right in front of his master, Ras Frostwhisper.",
        },
        [8994] = {
            description = "We're nearly there, <class>. All that is left is to retrieve a few more " ..
                "components so that I can attune the brazier and enable it to beckon forth Lord " ..
                "Valthalak.\n\nTo begin I must ask you to journey forth into Blackrock Spire and slay the " ..
                "orcs therein. They wear bracers that contain trace metals that I will need, so I'll need " ..
                "more than a few to extract the right amount out of them. Then, to complete the imbuing " ..
                "process, you'll need to bring me a Flask of Supreme Power.\n\nGood luck, <name>!",
        },
        [9001] = {
            description = "That's an amazing story, <name>! You have my thanks, and the heartfelt " ..
                "gratitude of all who were involved. Now maybe I'll be able to sleep at night with both " ..
                "eyes shut.\n\nAs to your reward, I believe I have a few things that you'll really enjoy.",
            rewardItems = {{22065, 1}, {22069, 1}},
        },
        [9003] = {
            description = "That's an amazing story, <name>! You have my thanks, and the heartfelt " ..
                "gratitude of all who were involved. Now maybe I'll be able to sleep at night with both " ..
                "eyes shut.\n\nAs to your reward, I believe I have a few things that you'll really enjoy.",
            rewardItems = {{22080, 1}, {22083, 1}},
        },
        [9004] = {
            description = "That's an amazing story, <name>! You have my thanks, and the heartfelt " ..
                "gratitude of all who were involved. Now maybe I'll be able to sleep at night with both " ..
                "eyes shut.\n\nAs to your reward, I believe I have a few things that you'll really enjoy.",
            rewardItems = {{22005, 1}, {22009, 1}},
        },
        [9013] = {
            description = "A truly amazing story, <name>! You have my thanks, and the heartfelt gratitude " ..
                "of all who were involved, I can assure you. Through your efforts we are delivered from " ..
                "the mistakes of our past.\n\nAs to your reward, I believe I have a few things that you " ..
                "have definitely earned and will truly enjoy.",
            rewardItems = {{21999, 1}, {21997, 1}},
        },
        [9019] = {
            description = "Valthalak's soul was stored in this amulet. In our greed we foolishly split it " ..
                "into three parts, not knowing the curse that would await us.\n\nThe only way to stop " ..
                "Valthalak's spell is to put the amulet back together. Return to Mokvar and tell him that " ..
                "Bodley is his only hope for finding the remaining pieces. Speak to him about any rewards " ..
                "you've arranged for.\n\nI, for once, shall rest in peace. I wish you the best of luck; " ..
                "you shall need every bit of it!",
            rewardItems = {{22084, 1}, {22085, 1}, {22082, 1}},
        },
        [9032] = {
            description = "The medallion contained Valthalak's soul? It's no surprise it was guarded by " ..
                "such a powerful curse.\n\nLocating Bodley presents a bit of a problem. Last time I heard " ..
                "of him, he was preparing to venture back into Blackrock Spire. He was never heard of " ..
                "again.\n\nSeek him out in Blackrock Mountain, though I'm afraid to say he's probably " ..
                "dead by now. I suggest taking the goblin's device with you, friend.",
        },
        [9040] = {
            description = "During your battles with the Scourge in Naxxramas, should you come across " ..
                "desecrated battlements and wartorn plate scraps, return them to me and I shall craft for " ..
                "you a piece of armor worn by heroes.",
            rewardItems = {{22421, 1}},
        },
        [9047] = {
            description = "You will find the remnants of our fallen heroes on the corpses of the Lords of " ..
                "Naxxramas. Bring those desecrated keepsakes to me along with wartorn plate scraps and " ..
                "crafting materials capable of revitalizing the cursed armor and I shall craft a fine " ..
                "piece of armor for you.",
            rewardItems = {{22430, 1}},
        },
        [9049] = {
            description = "You will find the remnants of our fallen heroes on the corpses of the Lords of " ..
                "Naxxramas. Bring those desecrated keepsakes to me along with wartorn plate scraps and " ..
                "crafting materials capable of revitalizing the cursed armor and I shall craft a fine " ..
                "piece of armor for you.",
            rewardItems = {{22431, 1}},
        },
        [9063] = {
            description = "A hunter by the name of Torwa Pathfinder has requested the help of a druid. He " ..
                "said only we would possess the necessary skills and respect for nature to help " ..
                "him.\n\nThere is a road that connects the Un'Goro Crater and the desert of Tanaris. As " ..
                "that road enters the crater, you will find Torwa close by.",
        },
        [9075] = {
            description = "Would you honor me by returning the armor of those that fell in the defense of " ..
                "these lands?\n\nThe armor has been desecrated and is undoubtedly being used for evil; " ..
                "however, with wartorn armor scraps, the desecrated armor can be renewed and worn for " ..
                "battle once more.\n\nBring me the remnants of the fallen along with purification " ..
                "materials and Earthshatter shall be yours to don.\n\nSearch Naxxramas.",
            rewardItems = {{22471, 1}},
        },
        [9090] = {
            description = "Many heroes fell in the last war and many continue to perish at the hands of " ..
                "the Scourge to this day. From the corpses of the fallen, the armor is stripped and taken " ..
                "back to Naxxramas to be used for unknown purposes.\n\nRecover the desecrated armor and " ..
                "wartorn armor scraps and supply to me the other material components I require and I will " ..
                "craft Dreamwalker armor.",
            rewardItems = {{22492, 1}},
        },
        [9103] = {
            description = "I make no pretenses, maggot. The darkness Plagueheart items hold could very " ..
                "well destroy the both of us. That is why the price is so high. If I'm going to die, it's " ..
                "going to be as a rich man.\n\nAnd I don't give an ounce of gnoll spit how you die, only " ..
                "that you do as I ask. Bring me what I require and we will both benefit - or die; but " ..
                "I've already explained this...",
            rewardItems = {{22504, 1}},
        },
        [9107] = {
            description = "I make no pretenses, maggot. The darkness Plagueheart items hold could very " ..
                "well destroy the both of us. That is why the price is so high. If I'm going to die, it's " ..
                "going to be as a rich man.\n\nAnd I don't give an ounce of gnoll spit how you die, only " ..
                "that you do as I ask. Bring me what I require and we will both benefit - or die; but " ..
                "I've already explained this...",
            rewardItems = {{22508, 1}},
        },
        [9112] = {
            description = "<Father Montoy makes some strange gestures in the air in front of " ..
                "you.>\n\nBlessed <boy/girl>, have you found the vestments of the fallen? The poor souls " ..
                "whose last breaths were taken on the field of battle - stripped of everything including " ..
                "their dignity.\n\nBring me the desecrated remnants of the departed along with reagents " ..
                "of purification and you shall know faith.",
            rewardItems = {{22513, 1}},
        },
        [9116] = {
            description = "<Father Montoy makes some strange gestures in the air in front of " ..
                "you.>\n\nBlessed <boy/girl>, have you found the vestments of the fallen? The poor souls " ..
                "whose last breaths were taken on the field of battle - stripped of everything including " ..
                "their dignity.\n\nBring me the desecrated remnants of the departed along with reagents " ..
                "of purification and you shall know faith.",
            rewardItems = {{22517, 1}},
        },
        [9118] = {
            description = "<Father Montoy makes some strange gestures in the air in front of " ..
                "you.>\n\nBlessed <boy/girl>, have you found the vestments of the fallen? The poor souls " ..
                "whose last breaths were taken on the field of battle - stripped of everything including " ..
                "their dignity.\n\nBring me the desecrated remnants of the departed along with reagents " ..
                "of purification and you shall know faith.",
            rewardItems = {{22519, 1}},
        },
        [9132] = {rewardItems = {{22523, 1}}, rewardMoney = 900},
        [9190] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order TR-635:\n\n8 " ..
                "Runecloth Boots.\n\nAll filled orders should be delivered to Packmaster Stonebruiser at " ..
                "Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and void if tampered " ..
                "with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9230] = {
            description = "Fixing this band may prove to be quite challenging, <name>. You see, it was " ..
                "made from the very runes that form inside Scourge structures - like Naxxramas. " ..
                "Additional materials are also required but your main concern should be getting those " ..
                "frozen runes. Bring me what I need and I will restore the ring to its former glory.",
            rewardItems = {{22707, 1}},
            rewardXP = 6600,
        },
        [9234] = {
            description = "Thanks to you and Omarion, may he rest in peace, I am now able to create " ..
                "Icebane gauntlets. All you need to do is bring me the materials and pay a small crafting " ..
                "fee.",
            rewardItems = {{22670, 1}},
        },
        [9235] = {
            description = "Thanks to you and Omarion (May he rest in peace), I am now able to create " ..
                "Icebane bracers. All you need to do is bring me the materials and pay a small crafting " ..
                "fee.",
            rewardItems = {{22671, 1}},
        },
        [9239] = {
            description = "Thanks to you and Omarion, may he rest in peace, I am now able to create " ..
                "Glacial gloves. All you need to do is bring me the materials and pay a small crafting " ..
                "fee.",
            rewardItems = {{22654, 1}},
        },
        [9240] = {
            description = "Thanks to you and Omarion, may he rest in peace, I am now able to create a " ..
                "Glacial vest. All you need to do is bring me the materials and pay a small crafting fee.",
            rewardItems = {{22652, 1}},
        },
        [9241] = {
            description = "Thanks to you and Omarion (May he rest in peace), I am now able to create " ..
                "Polar bracers. All you need to do is bring me the materials and pay a small crafting fee.",
            rewardItems = {{22663, 1}},
        },
        [9257] = {
            description = "This final task will be the most difficult of all, <name>. You have faced and " ..
                "defeated both an Old God and the Lich King's General, but now you must face the hand of " ..
                "Sargeras.\n\nTake the staff to Stratholme. It is there that you will find a piece of " ..
                "consecrated earth: ground where the greatest knights of Lordaeron were murdered. Place " ..
                "the befouled staff upon the holy ground and prepare for an entity of immense power to " ..
                "break from within... Defeat the demonic being that controls the staff and return to me.",
            rewardItems = {{22631, 1}},
        },
        [9271] = {
            description = "This final task will be the most difficult of all, <name>. You have faced and " ..
                "defeated both an Old God and the Lich King's General, but now you must face the hand of " ..
                "Sargeras.\n\nTake the staff to Stratholme. It is there that you will find a piece of " ..
                "consecrated earth: ground where the greatest knights of Lordaeron were murdered. Place " ..
                "the befouled staff upon the holy ground and prepare for an entity of immense power to " ..
                "break from within... Defeat the demonic being that controls the staff and return to me.",
            rewardItems = {{22630, 1}},
        },
        [9292] = {
            description = "On the corpse of the fallen abomination, you discover a cracked crystal, " ..
                "slowly pulsing with necrotic energy.",
            rewardChoices = {{23123, 1}, {23122, 1}},
        },
        [9301] = {
            description = "You found this letter on one of the many Scourge minions you've slain. From " ..
                "its appearance and smell, it has been with the undead for some time. Perhaps someone at " ..
                "Light's Hope Chapel would be interested in examining it further...",
            rewardXP = 3300,
        },
        [9304] = {
            description = "You found this letter on one of the many Scourge minions you've slain. From " ..
                "its appearance and smell, it has been with the undead for some time. Perhaps someone at " ..
                "Light's Hope Chapel would be interested in examining it further...",
            rewardXP = 3300,
        },
        [9317] = {rewardItems = {{23122, 1}}},
        [9333] = {rewardChoices = {{23084, 1}, {23081, 1}, {23082, 1}, {23078, 1}}},
        [9335] = {rewardItems = {{23122, 1}}},
        [9415] = {
            description = "Are you Marshal Bluewall 's new recruits? Of course you are.\n\nWhat are you " ..
                "waiting for? Good soldiers are dying in the desert. Aren't you excited to join " ..
                "them?\n\nNow, get going and don't dry out on the way.",
        },
        [9416] = {
            description = "You must be one of General Kirika 's new recruits. It's about time you showed " ..
                "up. Bodies wear down quick in the desert.\n\nThe dwarves have been getting " ..
                "reinforcements daily, and we can't afford to lose ground in our struggle for resources " ..
                "in Silithus.\n\nGet your instructions from the General. It's not my job to train you, " ..
                "just find you.",
        },
        [65603] = {
            description = "The time has come. Take the figurine and descend into the crypts below. A " ..
                "summoning circle has been prepared, and you must place the figurine at its " ..
                "center.\n\nThen the gateway will open, and the incubus will cross into our world.\n\nA " ..
                "sayaad is not to be underestimated. The demon will not hesitate to attack when it " ..
                "realizes your ruse. You must draw upon all you have been taught to defeat it.\n\nIf you " ..
                "succeed, return to me and I shall bind the creature to your will. Fail, and your soul is " ..
                "forfeit.",
            rewardItems = {{22243, 1}},
            rewardXP = 1150,
        },
    },
    npcs = {
        [4411] = {
            spawns = {
                [15] = {
                    {33.4, 45.6}, {34, 46}, {34.4, 41.4}, {34.4, 41.8}, {35.2, 45.6}, {35.4, 40.4},
                    {35.4, 45.2}, {35.6, 40.4}, {35.6, 45.2}, {35.8, 15}, {36.8, 45.2}, {37, 12.2},
                    {37.4, 25.8}, {37.4, 27.4}, {37.4, 38.4}, {37.4, 38.6}, {37.6, 27.4}, {37.6, 27.8},
                    {37.6, 38.6}, {37.6, 44.2}, {37.8, 25.8}, {38, 18.6}, {38, 40.8}, {38, 43}, {38.2, 23.4},
                    {38.2, 36.4}, {38.2, 40.4}, {38.4, 25}, {38.6, 25.8}, {38.6, 26.6}, {39, 19.4},
                    {39, 19.6}, {39.2, 14.4}, {39.2, 18.2}, {39.2, 39.6}, {39.4, 14.6}, {39.4, 22.6},
                    {39.6, 14.4}, {39.6, 18.4}, {39.6, 18.6},
                },
            },
            zoneID = 15,
        },
        [5470] = {
            spawns = {
                [440] = {
                    {32.4, 75.6}, {34.6, 77.8}, {36.2, 77.4}, {36.2, 78.4}, {36.2, 78.6}, {36.2, 80.4},
                    {36.4, 74.8}, {36.4, 76.4}, {36.4, 80.8}, {36.8, 76}, {36.8, 79}, {37, 78}, {37.2, 76.6},
                    {37.2, 81.4}, {37.4, 72.6}, {37.4, 79.6}, {37.4, 81.6}, {37.6, 76.8}, {37.6, 78},
                    {37.6, 78.6}, {37.6, 80.4}, {37.6, 81.4}, {37.6, 81.6}, {38.8, 80.4}, {39.4, 79},
                },
            },
            zoneID = 440,
        },
        [5677] = {
            spawns = {
                [1497] = {{86.4, 26.4}, {86.4, 26.6}, {86.6, 26.8}},
                [1519] = {{25.2, 77.4}, {25.2, 77.6}, {25.6, 77}},
                [1637] = {{49.4, 50}, {49.6, 50}},
            },
            zoneID = 1497,
        },
        [14435] = {
            spawns = {
                [1377] = {
                    {20.8, 10.6}, {20.8, 13}, {21.2, 54.6}, {21.4, 8.4}, {22.2, 8}, {22.2, 9.4}, {22.4, 10},
                    {22.4, 10.8}, {22.4, 11.8}, {22.6, 9.4}, {22.6, 10.4}, {23.2, 11.4}, {23.4, 11.8},
                    {23.4, 12.6}, {23.6, 10.4}, {23.6, 11.2}, {23.6, 11.8}, {23.8, 9.2}, {23.8, 12.6},
                    {25, 10.6}, {25.4, 10.2}, {39, 27}, {42, 12.2}, {43.4, 12.2}, {43.4, 20.2}, {50.2, 37},
                    {51.6, 37},
                },
            },
            zoneID = 1377,
        },
        [14697] = {
            spawns = {
                [139] = {
                    {15.2, 78.8}, {15.8, 71.4}, {16, 79.8}, {16.2, 77.8}, {16.4, 79}, {16.6, 75.4},
                    {17.2, 76.2}, {17.4, 77.2}, {17.6, 72.2}, {18, 80.2}, {18.2, 77.4}, {18.4, 78.4},
                    {18.6, 77.8}, {18.8, 75.4}, {18.8, 80}, {19.2, 85.2}, {19.6, 76.4}, {20.2, 85.6},
                    {20.6, 86}, {20.6, 86.8}, {21.4, 80.8}, {21.4, 87.6}, {21.8, 71.8}, {21.8, 81.6},
                    {21.8, 83.6}, {22, 85.2}, {22.4, 69.6}, {22.4, 87.2}, {23, 69.6}, {23, 74}, {23, 85.2},
                    {23.2, 70.6}, {23.2, 83.4}, {23.2, 84.4}, {23.6, 71.4}, {23.6, 72}, {23.8, 73.4},
                    {24, 70.2}, {24.4, 68.4}, {24.4, 69.2},
                },
            },
            zoneID = 139,
        },
        [16141] = {
            spawns = {
                [139] = {
                    {15.8, 79.6}, {16, 79.4}, {16.4, 76.2}, {16.4, 76.6}, {17, 76.4}, {17, 77.4},
                    {17.6, 78.6}, {18, 75.8}, {18.4, 77.6}, {18.6, 77.4}, {21, 86.8}, {21.4, 86},
                    {21.8, 83.2}, {21.8, 83.6}, {22, 85.6}, {22.4, 86.6}, {22.6, 86.8}, {22.8, 84.4},
                    {23.2, 70.2}, {23.2, 71.4}, {23.4, 71.6}, {23.4, 72.6}, {23.8, 70.4}, {23.8, 73.6},
                    {24.2, 70.8}, {24.6, 70.2}, {24.8, 69.4}, {24.8, 70.8}, {65.4, 70.6}, {65.4, 73},
                    {66.2, 71.4}, {66.4, 71.6}, {66.6, 69.6}, {66.6, 71.4}, {66.8, 73.8}, {67.4, 72.6},
                    {67.6, 72.6}, {68.6, 72.4}, {70.2, 58.6}, {70.4, 55.8},
                },
            },
            zoneID = 139,
        },
        [16298] = {
            spawns = {
                [139] = {
                    {14.2, 72.6}, {14.8, 72.4}, {14.8, 77.8}, {15, 79}, {15.4, 77.2}, {15.4, 80.4},
                    {15.8, 78}, {16, 79.6}, {16.2, 81}, {16.4, 75}, {16.4, 79.2}, {16.8, 75.4}, {16.8, 79.8},
                    {17, 72.4}, {17, 76.4}, {17, 77.4}, {17.2, 77.6}, {17.6, 73.4}, {17.8, 74}, {17.8, 79},
                    {18.2, 72.4}, {18.2, 77.4}, {18.4, 79.8}, {18.6, 74.2}, {18.6, 77.6}, {18.6, 78.6},
                    {18.8, 80}, {19, 75.4}, {19.6, 85.6}, {19.8, 76.6}, {20, 75.4}, {20, 76.2}, {20.2, 73.6},
                    {20.2, 87.6}, {20.6, 75.2}, {20.6, 79.8}, {20.8, 79.2}, {20.8, 87.6}, {21.2, 75.6},
                    {21.2, 78.4},
                },
            },
            zoneID = 139,
        },
        [16299] = {
            spawns = {
                [139] = {
                    {15.8, 79.6}, {16.2, 78}, {16.4, 76.6}, {16.4, 79.2}, {16.8, 75.4}, {17, 77.4},
                    {17.2, 77.6}, {17.6, 75.4}, {17.8, 78.8}, {18, 75.8}, {18.6, 77.4}, {18.6, 77.6},
                    {21.2, 86.6}, {21.4, 84.6}, {21.6, 81.4}, {21.8, 82.4}, {22, 84.2}, {22, 85.2},
                    {22.4, 86.8}, {22.6, 85.6}, {22.8, 84.2}, {22.8, 84.6}, {23.2, 70.4}, {23.4, 71.4},
                    {23.4, 72.8}, {23.4, 83.2}, {23.6, 71.6}, {23.8, 70.4}, {24.2, 72.6}, {24.6, 70.2},
                    {24.6, 72.6}, {25, 70.6}, {65.4, 70.6}, {65.4, 71.8}, {66, 70.2}, {66.2, 71.4},
                    {66.4, 72.8}, {66.6, 69.8}, {66.6, 72.2}, {66.8, 72.6},
                },
            },
            zoneID = 139,
        },
        [16379] = {
            spawns = {
                [139] = {
                    {16.2, 76.6}, {16.2, 78}, {16.4, 78.8}, {16.8, 75.8}, {17.2, 77.2}, {17.2, 79.2},
                    {17.4, 73}, {18, 77.6}, {18.2, 76.2}, {20.8, 87}, {21.4, 84.4}, {21.4, 84.8},
                    {21.8, 83.8}, {21.8, 85.6}, {22, 83.4}, {22.6, 71.4}, {22.6, 85.6}, {22.6, 86.8},
                    {23, 70.2}, {23.4, 69.2}, {23.4, 72.6}, {24, 72.6}, {24.4, 71.2}, {24.4, 72.2},
                    {66, 71.2}, {66.8, 70.2}, {67.4, 71.2}, {67.4, 72}, {67.6, 72.4}, {70, 56.4}, {70.4, 58},
                    {71.2, 56.8}, {71.4, 58}, {71.6, 56.8}, {74.8, 71.2}, {75.4, 72.2}, {75.6, 71.8},
                    {76.4, 70.8}, {77, 69.8}, {77.2, 72.4},
                },
            },
            zoneID = 139,
        },
        [16380] = {
            spawns = {
                [139] = {
                    {14.8, 73.6}, {15.2, 79.6}, {15.8, 77.8}, {16.2, 76.8}, {16.8, 76}, {17, 74.6},
                    {17.2, 74.4}, {17.2, 78}, {17.4, 73.2}, {17.6, 79}, {18.4, 75.6}, {18.4, 77.8},
                    {19.4, 76}, {19.4, 78}, {20.4, 85.8}, {20.6, 74.8}, {21.4, 86.4}, {21.6, 80.2},
                    {21.8, 74.6}, {21.8, 82.8}, {22, 83.8}, {22.2, 66.4}, {22.4, 67}, {22.6, 85}, {22.8, 78},
                    {23, 71.6}, {23, 84}, {23, 85.6}, {23.2, 86.8}, {23.4, 70.8}, {23.4, 77.2}, {23.6, 74},
                    {23.8, 70.4}, {23.8, 71.4}, {23.8, 73.4}, {23.8, 74.8}, {24, 82.8}, {24, 84.8},
                    {24.6, 74}, {24.8, 85.2},
                },
            },
            zoneID = 139,
        },
        [16383] = {
            spawns = {
                [1519] = {
                    {16.2, 52}, {17, 52.2}, {17.6, 50}, {17.6, 51.8}, {17.6, 54.2}, {17.8, 51}, {18.6, 49.2},
                    {18.6, 52.2}, {19.4, 50.4}, {19.4, 51}, {19.6, 50.2}, {20, 48.4}, {20.4, 51.2},
                    {20.4, 55.2}, {20.8, 50}, {21, 48.6}, {21, 57}, {21.6, 49.4}, {22, 57.6}, {22.2, 55.2},
                    {22.4, 50.2}, {22.4, 54.4}, {22.6, 54.4}, {22.6, 56.2}, {23, 57}, {23.2, 51.2},
                    {23.2, 53.4}, {23.2, 54.6}, {23.6, 55.8}, {23.8, 52.4}, {24.4, 51.2}, {24.6, 51.8},
                    {26.2, 49.8}, {26.4, 50.8}, {27, 51.6}, {27.2, 50.2}, {27.4, 49.2}, {27.6, 51.4},
                    {27.8, 49.8}, {28.6, 50.6},
                },
            },
            zoneID = 1519,
        },
        [16531] = {
            spawns = {
                [1497] = {
                    {45.2, 79}, {45.4, 76.2}, {45.4, 78}, {45.4, 80.2}, {45.6, 75.2}, {45.6, 75.8},
                    {45.6, 82}, {45.8, 80.6}, {46, 82.8}, {46.4, 72.6}, {46.6, 72.4}, {46.6, 84.6},
                    {46.8, 41}, {47, 44.6}, {47.6, 85.8}, {47.8, 70.4}, {48, 59.2}, {48.2, 45.8}, {49, 68.6},
                    {49.2, 30}, {49.6, 88.4}, {49.8, 43.6}, {50, 88.6}, {50.2, 67.4}, {51, 88.8}, {51.6, 47},
                    {51.8, 62.2}, {51.8, 64.4}, {52, 64.6}, {52, 89.2}, {52.6, 25.8}, {52.8, 63.4},
                    {53.2, 64}, {53.2, 64.6}, {54, 23.2}, {54, 90.8}, {54.2, 93.4}, {54.4, 65.4},
                    {54.8, 91.2}, {54.8, 93.8},
                },
                [1519] = {
                    {33.8, 65.4}, {38.6, 43.4}, {39.6, 28.2}, {39.6, 39.4}, {40.4, 30}, {40.6, 28.8},
                    {41.4, 49.8}, {41.8, 40}, {42.6, 31.8}, {42.8, 38}, {42.8, 41.2}, {42.8, 59.6},
                    {43.4, 34.8}, {43.6, 40.6}, {44, 39.2}, {44.2, 39.8}, {44.6, 63.8}, {44.8, 37.2},
                    {45, 38.6}, {45.4, 38.2}, {45.8, 50}, {46, 36.2}, {46.2, 37.4}, {46.2, 38.8},
                    {46.4, 41.2}, {46.4, 59.8}, {46.6, 41.6}, {47, 65}, {47.4, 40.8}, {47.4, 57.6},
                    {47.6, 41.6}, {47.6, 43}, {47.6, 64.6}, {47.8, 39.4}, {48.2, 49}, {48.2, 61.4},
                    {48.2, 63.6}, {48.4, 45}, {48.8, 47.6}, {49, 45.6},
                },
            },
            zoneID = 1497,
        },
        [185335] = {
            spawns = {
                [1497] = {
                    {83.2, 24.6}, {84.4, 25.6}, {85.4, 24.4}, {85.4, 24.6}, {85.6, 24.6}, {86.2, 27.6},
                    {86.4, 26.4}, {86.4, 26.6}, {86.6, 26.2}, {86.6, 27},
                },
                [1519] = {
                    {24.4, 76}, {24.4, 78.2}, {24.6, 78.6}, {25.2, 76.4}, {25.2, 77.4}, {25.2, 77.6},
                    {25.6, 76.8}, {25.8, 76.4}, {25.8, 78.2}, {26, 79},
                },
                [1637] = {
                    {48.4, 51.4}, {49.4, 50}, {49.6, 50}, {50.4, 50.8}, {50.8, 50.2}, {51.2, 50.6},
                    {51.6, 50.6},
                },
            },
            zoneID = 1497,
        },
    },
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
