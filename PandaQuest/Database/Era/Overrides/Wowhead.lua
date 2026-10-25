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
        [160] = {
            description = "Take this note to Ello Ebonlocke, the Mayor of Darkshire.\n\nHe and I are old " ..
                "friends...and when he reads it and discovers what you did for me...I'm sure he'll be " ..
                "just as happy as I am! Hahahaha!",
        },
        [181] = {
            description = "Now there is just one more item needed to complete this device. Cog's " ..
                "blueprint calls for a lens of some sort. The only lens I know of that would be large " ..
                "enough will be very difficult to acquire.\n\nThere is an ogre by the name of Zzarc'Vul " ..
                "who resides in the mound in southern Duskwood. If you can, bring to me his monocle and I " ..
                "will use that as our lens!",
            rewardChoices = {{7106, 1}, {7107, 1}},
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
        [758] = {
            description = "The totem is ready, <name>. And again, it is your task to perform the ritual " ..
                "of cleansing.\n\nGo to the Thunderhorn Water Well, north of the village, and use the " ..
                "Thunderhorn Cleansing Totem in your ritual. After you do this, return to me.\n\nMay the " ..
                "spirits guide you.",
            rewardItems = {{4963, 1}},
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
        [851] = {
            description = "The centaur Verog the Dervish wanders the Barrens, and will be difficult to " ..
                "find. But he is based at the centaur command tent at the Stagnant Oasis to the " ..
                "southeast. It may be possible to draw him to you.\n\nTravel to the Stagnant Oasis to the " ..
                "southeast and attack centaur near the command tent. It will be dangerous, but if you can " ..
                "kill enough centaur then they should raise an alarm. And Verog will come.\n\nBring me " ..
                "his head and I will place it with Barak Kodobane's.",
            rewardMoney = 1000,
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
        [960] = {rewardItems = {{5251, 1}}},
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
        [1036] = {
            description = "<name>... yeah, I've heard of you. I've heard that you're no friend of Booty " ..
                "Bay - just like us Bloodsail Buccaneers. Fleet Master Firallon is looking for hale and " ..
                "hearty <men/women> just like you for a special mission.\n\nIf you're interested, head on " ..
                "out to the Crimson Veil and speak with him below decks. She's anchored off the Wild " ..
                "Coast east of here, next to the Riptide and the Damsel's Luck.",
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
        [1427] = {
            description = "Before you take rest, speak to Tok'Kar again. While you were gone I believe he " ..
                "finished a few weapons. For your help here, he would offer one of them to you. You would " ..
                "do well to test its strength against the fish men when you are ready... but only to " ..
                "please me further.",
            rewardChoices = {{9680, 1}, {9678, 1}, {9679, 1}},
        },
        [1462] = {
            objectivesText = {"Speak to Seer Ravenfeather for another Earth Sapta."},
            rewardItems = {{6635, 1}},
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
        [2161] = {
            description = "Excuse me? Can you help me?\n\nI have a load of food here. I walked along the " ..
                "road and braved scorpids and spiders and worse! I brought the food to the Valley of " ..
                "Trials because I thought they needed it and I like to help out. But they don't need any " ..
                "food! Now I have to take it back to Razor Hill and I'm afraid of all the beasts along " ..
                "the way...\n\nCan you take it for me? I'm just a peon, but you're a hero. You fear " ..
                "nothing!\n\nTake it to Innkeeper Grosk at the Razor Hill inn. Thank you!",
            rewardChoices = {{4540, 5}, {159, 5}},
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
        [3821] = {
            description = "Sha'ni was sent to investigate reports of strange ritualistic activity coming " ..
                "from the Firegut ogres of the Burning Steppes over three weeks ago.\n\nGoretooth tells " ..
                "me that he hasn't heard from anyone in that platoon and that it's best that I move on " ..
                "and focus on the task at hand. Can you believe it? That's my wife!\n\nI can't leave my " ..
                "post, <name>, but I must know what became of Sha'ni. Travel to the Burning Steppes and " ..
                "search for her.",
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
        [4124] = {
            description = "An associate of mine, Ginro Hearthkindle, is looking for assistance concerning " ..
                "the location of a courier and the parcels he was carrying. It has been a week or so " ..
                "since the courier went missing; our own searches have proved fruitless, and we're at an " ..
                "impasse. Unfortunately, I have had to declare the courier as missing in action.\n\nIf " ..
                "you have the time and resources to spare, please speak with Ginro. He should be here in " ..
                "the Stronghold - perhaps in his quarters.",
        },
        [4146] = {
            description = "You're in luck, <name>! I've been working on some of my own experiments while " ..
                "Marvon's been gone, and one of them is a short range bug zapper. With just a few " ..
                "adjustments, it should be great for ridding yourself of those Bloodpetal pests.\n\nI can " ..
                "let you have one of my zapper prototypes, but you'll still need to collect the fuel. You " ..
                "can get the necessary Atal'ai haze that the zapper needs in the temple of Atal'Hakkar. " ..
                "The deep lurkers, murk worms, or oozes are the ones you'll need to get it from.",
        },
        [4243] = {
            description = "Unfortunately, something's happened to one of my greatest inventions. You've " ..
                "seen mechanical squirrels, yes? Well, to get closer to the apes of Un'Goro Crater, I " ..
                "created a mechanical ape to blend in with their kind--I call her A-Me 01.\n\nShe has " ..
                "scrying gems for eyes so I could see everything she saw. She made it to Fungal Rock--the " ..
                "apes' lair--just east of here, and that's when I lost contact. The last thing I saw was " ..
                "one of their alpha males rushing up to say hello to her!\n\nCan you help me find her?",
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
        [5655] = {
            description = "I sent here to make sure that you not wander too far from home, <name>. They " ..
                "send me to make sure you return home because Ur'kyo, greatest of our priests, wish to " ..
                "speak to you. You go there. You go to the Valley of Spirits in the orc city and you " ..
                "speak to Ur'kyo. He wait for you now.",
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
        [5887] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
        [5888] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
        [5889] = {rewardItems = {{11516, 2}}, rewardXP = 4200},
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
        [6071] = {
            description = "Hello, young hunter. You look to me like you are skilled enough to handle a " ..
                "beast and train it as your companion.\n\nYou must see Dazalar in Dolanaar. He can put " ..
                "you on the path to earning a pet of your own.",
        },
        [6133] = {
            description = "The high elves of the Quel'Lithien lodge possesses something that belongs to " ..
                "me, <class>: A document detailing my life as a mortal.\n\nBefore you ask; no, you most " ..
                "certainly are not privy to such information. Just do as I tell you, worm: Recover the " ..
                "registry.\n\nAnd imbecile, be sure to leave as much strife and grief as possible in your " ..
                "wake. Leave them suffering...",
            rewardMoney = 9000,
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
        [6523] = {
            description = "Thank you for rescuing me! We must leave quickly before they discover that I " ..
                "am free. Please escort me to Camp Aparaje. From there, I know my way.\n\nMy father, " ..
                "Makaba Flathoof, will be desperate to know that I am safe.",
            rewardMoney = 1000,
        },
        [6547] = {rewardItems = {{16764, 1}}},
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
        [7490] = {
            description = "You have accomplished the impossible. The brood mother of the Black " ..
                "Dragonflight lies dead at your feet. Take her head and present it to your Warchief.",
        },
        [7491] = {
            description = "Overlord Runthak awaits your arrival in the Valley of Strength.\n\n< Thrall " ..
                "salutes you.>\n\nDo not keep your public waiting, hero.",
            rewardChoices = {{18406, 1}, {18403, 1}, {18404, 1}},
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
        [7865] = {rewardItems = {{19152, 1}}},
        [7907] = {
            description = "Now that you have gathered all of the Beast cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{19288, 1}},
        },
        [8052] = {rewardItems = {{19594, 1}}},
        [8116] = {rewardItems = {{19606, 1}}},
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
        [8255] = {
            description = "The mosshoof coursers of Azshara are magnificent animals who once lived in " ..
                "Felwood. They naturally resist disease and poison, and were unaffected by the corruption " ..
                "there. In their ancestral wisdom, they simply chose to leave that sickened place.\n\nIt " ..
                "saddens my heart, but I must ask you to hunt these mighty beasts for me. Gather four " ..
                "courser glands as the first ingredient for a restorative salve -- a salve we will use to " ..
                "heal Felwood.",
        },
        [8413] = {
            description = "The spirit totem just isn't enough. We be needin' some voodoo magic to make it " ..
                "work jus' right.\n\nThe trolls in the sunken temple have feathers strong with voodoo " ..
                "magics. Go there and kill Gasher, Mijan, Zolo, Hukku, Zul'lor, and Loro. Then we have " ..
                "magic enough for a real spirit totem.",
            rewardChoices = {{20369, 1}, {20503, 1}, {20556, 1}},
            rewardMoney = 15500,
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
        [8545] = {
            description = "<class>, the war it is comin' and the only thing we can do is prepare for it. " ..
                "That be where you and I can help each other, mon. Ya see, they put me in charge of " ..
                "collectin' all the mithril bars we be needin' ta build for all the things we gonna need. " ..
                "An I still be needin' more!\n\nSo, I be hopin' that you can get out there an mine us up " ..
                "some mithril, then smelt it into bars. Sound like something you can do for us?",
            rewardItems = {{21438, 10}, {21512, 1}},
        },
        [8546] = {rewardItems = {{21438, 7}, {21512, 1}}},
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
        [8846] = {rewardItems = {{21509, 1}}},
        [8855] = {rewardItems = {{21513, 1}}},
        [8947] = {
            description = "We didn't realize the importance of Valthalak's medallion, so it was divided " ..
                "along with the rest of the spoils. The first piece was taken by a dwarf named Theldren. " ..
                "I tried to retrieve it from him and he beat me within an inch of my life. You shall have " ..
                "to take the fragment by force.\n\nLast I heard of him, he'd become a gladiator for the " ..
                "Dark Iron dwarves. Getting him to fight you is going to present a bit of a challenge, " ..
                "though.\n\nGather the following materials for me. You're going to need them.",
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
        [9132] = {rewardItems = {{22523, 1}}, rewardMoney = 900},
        [9190] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order TR-635:\n\n8 " ..
                "Runecloth Boots.\n\nAll filled orders should be delivered to Packmaster Stonebruiser at " ..
                "Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and void if tampered " ..
                "with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9240] = {
            description = "Thanks to you and Omarion, may he rest in peace, I am now able to create a " ..
                "Glacial vest. All you need to do is bring me the materials and pay a small crafting fee.",
            rewardItems = {{22652, 1}},
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
        [9333] = {rewardChoices = {{23084, 1}, {23081, 1}, {23082, 1}, {23078, 1}}},
    },
    npcs = {
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
