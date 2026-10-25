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
                "grow in clusters at the Uldaman dig site and can be found in the early tunnels and deep " ..
                "within the less-explored areas. I want to study their potential use in alchemy, and " ..
                "that's where you come in.\n\nFind the magenta cap clusters and bring me a dozen caps. Be " ..
                "warned, the clusters may spew out poison spores if jostled.\n\nDo this for me, and I'll " ..
                "whip up a batch of one of my famous restorative elixirs for you!",
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
            rewardXP = 115,
        },
        [27] = {
            description = "<name>, I have been following your progress with much delight. You are most " ..
                "assuredly developing yourself into a valued protector of nature.\n\nThe time has come " ..
                "for you to learn more about one of the various animal aspects that Cenarius has blessed " ..
                "us with the ability to change into - one that affords you command and mastery of the " ..
                "water. For this, you must travel to the village of Nighthaven in Moonglade and speak " ..
                "with Dendrite Starblaze of the Cenarion Circle there. He will guide you further.",
            rewardXP = 115,
        },
        [28] = {
            description = "For your first trial, search the depths of Lake Elune'ara to locate a Shrine " ..
                "Bauble. It decays rapidly, so proceed with it to the Shrine of Remulos post haste. Use " ..
                "the bauble at the shrine, and then speak with Tajarri there; she is one of Moonglade's " ..
                "most trusted wardens.\n\nYou only have a set amount of time to complete the task, and " ..
                "you may be competing against other druids searching for baubles themselves. Mental and " ..
                "physical dexterity will be critical to your success.\n\nGood luck, <name>.",
            rewardXP = 880,
        },
        [29] = {
            description = "For your first trial, search the depths of Lake Elune'ara to locate a Shrine " ..
                "Bauble. It decays rapidly, so proceed with it to the Shrine of Remulos post haste. Use " ..
                "the bauble at the shrine, and then speak with Tajarri there; she is one of Moonglade's " ..
                "most trusted wardens.\n\nYou only have a set amount of time to complete the task, and " ..
                "you may be competing against other druids searching for baubles themselves. Mental and " ..
                "physical dexterity will be critical to your success.\n\nGood luck, <name>.",
            rewardXP = 880,
        },
        [30] = {
            description = "For the second trial, you'll need the two halves that make the Pendant of the " ..
                "Sea Lion. One half draws power from the agility of the sea lion aspect, gliding through " ..
                "water; the other draws power from the incredible endurance of the sea lion aspect. " ..
                "Druids draw on both these traits equally to embody the aspect of their aquatic " ..
                "form.\n\nSpeak with the locals of Moonglade to learn where the parts may lie, and bring " ..
                "both here to join them together. Once formed, take the pendant to Dendrite Starblaze.",
            rewardXP = 880,
        },
        [31] = {
            description = "You have completed the necessary lessons all young druids are taught before " ..
                "they can adopt an aquatic aspect. Go now back to your trainer, Turak Runetotem, in " ..
                "Thunder Bluff. Show him your pendant and prove to him you are ready to learn what he has " ..
                "to teach you. He will complete your training, allowing you to become one with the " ..
                "water.\n\nGoodbye, young druid. We shall speak again.",
            rewardItems = {{16608, 1}},
            rewardXP = 1150,
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
            rewardXP = 1150,
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
            rewardXP = 2350,
        },
        [7865] = {rewardItems = {{19152, 1}}},
        [7868] = {rewardItems = {{19153, 1}}},
        [8262] = {rewardItems = {{20231, 1}}, rewardXP = 1250},
        [8265] = {rewardItems = {{20228, 1}}, rewardXP = 1250},
        [9492] = {
            description = "The permanence of the orcish threat is one of the sad truths of Outland. There " ..
                "was a time when we Sons of Lothar believed we'd purchased Honor Hold's safety with our " ..
                "blood, but there was to be no peace.\n\nThe Sons will yield to no orc - green, brown, " ..
                "and now red - we will overcome them or die trying. If we are to have any expectation of " ..
                "victory, we must take the fight to them in Hellfire Citadel. Bring me the weapon of " ..
                "their self-styled 'Warchief' Kargath Bladefist and you will be well rewarded.",
            rewardChoices = {{25806, 1}, {25805, 1}, {25804, 1}, {25803, 1}},
            rewardMoney = 44000,
        },
        [9493] = {
            description = "We know precious little about the Fel Horde presence in Hellfire Citadel and " ..
                "our information has come at the cost of many lives.\n\nFel Horde troops under the " ..
                "command of Kargath Bladefist are a brutal, battle-hardened lot fortified by foul magics. " ..
                "The elite of this force, the Shattered Hand legionnaires, champions, and centurions are " ..
                "feared by the regulars and serve as an officer corps.\n\nTargeting and eliminating them " ..
                "is a necessary first step in any successful assault on the Fel Horde's leadership.",
            rewardMoney = 44000,
        },
        [9494] = {
            description = "The stuffy academics of Azeroth have cowered in their towers for too long and " ..
                "it's fallen to me to show them what cutting edge research is! They're afraid to play " ..
                "with fire and that's exactly what I intend to do, once I get my hands on the fire, that " ..
                "is.\n\nWithin Hellfire Citadel 's Shattered Halls, Grand Warlock Nethekurse performs " ..
                "unrivaled magical feats augmented by the powers of a pair of strange braziers. Using the " ..
                "vessel he uses to contain these fel embers, capture one and bring it back to me, <name>.",
            rewardChoices = {{25792, 1}, {25789, 1}, {25791, 1}, {25790, 1}, {25788, 1}},
            rewardMoney = 44000,
        },
        [9495] = {
            description = "The struggle to free the orcish people from our tainted blood has not been " ..
                "easy, <name>. Warchief Thrall has seen too many orcish heroes laid low by fate's hand. " ..
                "Now, it seems Kargath Bladefist numbers among them.\n\nIn the Shattered Halls of " ..
                "Hellfire Citadel, Kargath has claimed the title of 'Warchief' of the Fel Horde. With an " ..
                "army of crazed, bloodthirsty fel orcs at his back, he won't rest until Thrallmar is " ..
                "destroyed. Warchief Thrall has commanded us to defeat Kargath and his forces at all " ..
                "costs.",
            rewardChoices = {{25808, 1}, {25810, 1}, {25811, 1}, {25809, 1}},
            rewardMoney = 44000,
        },
        [9496] = {
            description = "Overlord Maimfist's insults aside, <name>, this Fel Horde is nothing to be " ..
                "trifled with.\n\nFrom what we know, Fel Horde troops under the command of Kargath " ..
                "Bladefist are a brutal, battle-hardened lot fortified by foul magics. The elite of this " ..
                "force, the Shattered Hand legionnaires, champions, and centurions are feared by the Fel " ..
                "Horde regulars and serve as an officer corps.\n\nTargeting and eliminating them is a " ..
                "necessary first step in any successful assault on the Fel Horde's leadership.",
            rewardMoney = 44000,
        },
        [9524] = {
            description = "Alliance, here?! Listen carefully, <class>.\n\nKargath has captured several of " ..
                "our soldiers. Captain Alina, an important officer is among them. You must try to save " ..
                "her before she is executed.\n\nDon't worry about me, I'll find a way out as soon as I " ..
                "catch my breath.",
            rewardMoney = 132000,
        },
        [9525] = {
            description = "I was fortunate to escape Kargath's prison today, <name>. Several prisoners " ..
                "are scheduled to be executed, an important officer among them.\n\nIt would be a huge " ..
                "blow against our forces if Captain Boneshatter was slain. You must do what you can to " ..
                "rescue him. I'm too weak to go on...",
            rewardMoney = 132000,
        },
        [9630] = {
            description = "Your name is getting around, <name>. You've made your way into and out of " ..
                "Karazhan - more than most mortals can claim.\n\nI need to ask a special favor of you. As " ..
                "part of our research, the Violet Eye has been trying to track down Medivh's own " ..
                "journal.\n\nUnfortunately, none of the agents we've sent inside have come out. Wravien " ..
                "was the last to be sent; see if you can find him and see about any leads on the journal.",
        },
        [9631] = {
            description = "There is a small detail I've forgotten to take into account. The residue of " ..
                "Medivh's essence contained in this bone fragment is completely devoid of life - just " ..
                "like Arcanagos.\n\nThere is a way, however. And I know just the person to help " ..
                "us.\n\nTravel to Area 52 in Netherstorm and show the bone fragment to Kalynna Lathred. " ..
                "She will know just what to do.",
        },
        [9637] = {
            description = "I left the Kirin Tor in pursuit of knowledge forbidden by those of my order; " ..
                "it is beyond ironic that I am now asked to assist them with that very same " ..
                "knowledge.\n\nIf I'm to perform this favor for you, you will have to do something for me " ..
                "first. I want you to obtain two of the tomes I've been searching for.\n\nThe first one " ..
                "is called the Tome of Dusk and is owned by the orc warlock known as Nethekurse. The " ..
                "second, known as the Book of Forgotten Names, belongs to the arakkoa known as Darkweaver " ..
                "Syth.",
        },
        [9638] = {
            description = "Was I supposed to be looking for this journal? It can't be... I don't quite " ..
                "recall...\n\nOf course! It is Gradav you're thinking of. He was looking for the book " ..
                "when I got here. Surely he must've found it by now; why don't you go ask him about " ..
                "it?\n\nI'd lend you a hand... but these books are just so... interesting!",
        },
        [9639] = {
            description = "Journal, what journal? You're thinking of Kamsis, surely.\n\nGo and ask her " ..
                "about it. I can't leave my project right now or all my work will be wasted!",
        },
        [9640] = {
            description = "Let me think for a second. The Violet Eye... Medivh's Journal... Why yes, it's " ..
                "all coming back to me now.\n\nI believe I had the journal you're looking for before I " ..
                "started to read these scrolls...\n\nAran... yes, Aran asked me for the book. So nicely " ..
                "too. I just had to give it to him. He's Medivh's father after all, did you know?",
        },
        [9644] = {
            description = "Our preparations are complete. I have put the materials you gathered into this " ..
                "urn. Take it to the Master's Terrace, where the fight took place, and set it on " ..
                "fire.\n\nThe energy released will bring life back to the charred remains of Arcanagos. " ..
                "Defeat the creature and retrieve its essence immediately! You will need to take it to " ..
                "Alturus.\n\nShould you fail, the stars predict you will have let a great terror loose " ..
                "upon the skies.\n\nA terror known as Nightbane!",
            rewardChoices = {{31118, 1}, {31117, 1}, {31116, 1}},
        },
        [9645] = {
            description = "Journal? What journal?\n\nOh, right. That journal! The Violet Eye sent me here " ..
                "for it. It's all coming back now.\n\n< Kamsis points to a page in the journal.>\n\nThis " ..
                "is the page that Alturus is interested in. Did you know that while other people's " ..
                "journals serve as a record of their memories, Medivh's is literally just that?\n\nTry " ..
                "it. Go to the Master's Terrace and read the page; you'll see just what I mean. Might as " ..
                "well report to Alturus while you're at it. I'm afraid I'll be here for a while.",
        },
        [9680] = {
            description = "Kamsis was right! This information is extremely important.\n\nIf Medivh weaved " ..
                "his own essence into the magic he used to defeat the dragon, it is quite possible we " ..
                "could retrieve even a faint residue of that essence from the dragon's remains. What " ..
                "great insight may lie beneath the ashes of Deadwind Pass, awaiting discovery.\n\nGo to " ..
                "the mountains south of Karazhan and bring me back a bone fragment of seemingly draconic " ..
                "origin.",
        },
        [9763] = {
            description = "There are benefits to hiding very, very quietly at the entrance of your " ..
                "enemy's hideout.\n\nJust hours ago I saw a group of naga go through the stone archway on " ..
                "the second tunnel from the left. I'm not well versed in their language, yet I clearly " ..
                "understood one word: Kalithresh.\n\nThat must be the entrance to the steam vaults, where " ..
                "Warlord Kalithresh has been commanding his troops from. You must find him and stop him. " ..
                "I am too weak to be of any assistance.",
            rewardChoices = {{28183, 1}, {28182, 1}, {28181, 1}, {28180, 1}},
            rewardMoney = 132000,
        },
        [9764] = {
            description = "This letter contains detailed orders to the Coilfang naga operating the steam " ..
                "vaults. It warns of the arrival of Cenarion druids into the region and orders them to be " ..
                "slain on sight. The rate of water redirection from other lakes into Coilfang Reservoir " ..
                "is to be doubled. The orders bear the seal of the infamous Lady Vashj.\n\nThis letter " ..
                "would be of great interest to the druids of the Cenarion Expedition. Take it to their " ..
                "leader, Ysiel Windsinger.",
        },
        [9765] = {
            description = "The Cenarion Expedition began as a peaceful venture, yet we now face the " ..
                "prospect of all out war with the naga.\n\nWe have many among us who are willing to fight " ..
                "but are ill equipped. Bring me the naga's own weapons so that we may reforge them into " ..
                "glaives and arrowheads.\n\nOnly the best armaments will have materials useful to us, " ..
                "<name>. You will have to seek out the naga of Coilfang Reservoir.",
        },
        [9824] = {
            description = "I'm trying to obtain an imprint of Karazhan 's energy... for a personal " ..
                "project, of course. Unfortunately, I'm not getting anything up here. If I could get near " ..
                "an underground water source, my crystal would pick up the signals much more " ..
                "clearly.\n\nI've heard of an underground pond as well as a well in a cellar below us. " ..
                "This whole place is crawling with ghosts however, and venturing there would be hazardous " ..
                "for someone my age. What do you say; will you help an old man and perform the scrying " ..
                "for me?",
            rewardMoney = 44000,
        },
        [9825] = {
            description = "As you may have noticed, the outside of Karazhan is crawling with ghostly " ..
                "beings. The reason for their existence is unknown and unknowns bother me!\n\nBring me " ..
                "their ghostly essence so that I may study their nature. Karazhan has many secrets, " ..
                "<name>. I'm determined to uncover all of them.",
            rewardMoney = 44000,
        },
        [9826] = {
            description = "These signs do not bode well for us, <name>. I've never been one for secrecy " ..
                "so I will tell you a bit about my organization, the Violet Eye.\n\nWe are agents of the " ..
                "Kirin Tor, the Magus Senate of Dalaran. We were assigned to keep an eye on Karazhan and " ..
                "Medivh, in case things got out of hand.\n\nWhich they did... very quickly, after Medivh " ..
                "disappeared.\n\nThis report details my findings. Take it to Archmage Cedric, also from " ..
                "the Violet Eye; you will find him in the outskirts of Dalaran.",
        },
        [9829] = {
            description = "Alturus's report is unsettling. We thought it was bad when Karazhan sealed " ..
                "itself off to the outside world. We had agents inside; we never heard from any of them " ..
                "again. Now this... demonic emanation. We must investigate it.\n\nThe only people who can " ..
                "reopen Karazhan were presumed dead: Khadgar and Medivh.\n\nWhile we hope that the latter " ..
                "is indeed gone, we recently learned that his apprentice, Khadgar, is alive and well in a " ..
                "place called Shattrath City. Find him and give him Alturus's report.",
        },
        [9831] = {
            description = "I am deeply troubled by the news in this report, <name>. Gaining entry into " ..
                "Karazhan will be difficult, however.\n\nYou see, when it became apparent that I was " ..
                "stranded here I split the key into three fragments.\n\nI placed the keys inside " ..
                "enchanted containers, and in turn placed those in places that were safe at the " ..
                "time.\n\nWith the dark changes Outland has endured this no longer is the case. The first " ..
                "fragment is in a section of Auchindoun taken over by the Shadow Council. Return this " ..
                "fragment to me.",
        },
        [9832] = {
            description = "I hid the second fragment at the bottom of Serpent Lake, long before it was " ..
                "called that. The giant drain installed there after the naga took over has likely pulled " ..
                "the container into the depths of Coilfang Reservoir.\n\nThe third fragment will prove " ..
                "the most trying, as I left it inside Tempest Keep back when it was controlled by the " ..
                "naaru. Kael'thas now rules it and the chamber where I left it has become a " ..
                "prison.\n\nBring me these remaining fragments, <name>. Much depends on your success.",
        },
        [9836] = {
            description = "I've put together the very key I used as an apprentice. It looks completely " ..
                "functional as far as keys go. In regards to opening Karazhan, however, this might as " ..
                "well be a piece of scrap metal.\n\nWithout Medivh 's consent, the key is worthless. Yes, " ..
                "of course I know Medivh is dead. This merely makes things difficult, not " ..
                "impossible.\n\nThere is a place in Azeroth called the Caverns of Time, guarded by the " ..
                "bronze dragonflight. Find a way inside, travel back in time and get Medivh to enable the " ..
                "key.",
        },
        [9837] = {
            description = "I seem to have memories about future events surrounding you and this key.\n\n< " ..
                "Medivh looks at you like he's just seen a ghost.>\n\nYou have trying times ahead of you, " ..
                "<name>. Let us hope your strength does not fail you.\n\nRegarding the key, I am to hand " ..
                "it to Khadgar when he's sent to me. I couldn't hope for a better apprentice.\n\nI " ..
                "suppose you will need a key of your own.\n\n< Medivh reaches into his robe and hands you " ..
                "his own key.>\n\nGo on then. And best of luck, <class>.",
            rewardItems = {{24490, 1}},
        },
        [9838] = {
            description = "A great responsibility has been bestowed upon you, <name>. If the signs that " ..
                "the Violet Eye has observed are to be trusted, then you must help them.\n\nFor all my " ..
                "disagreements with Cedric, the work that men like Alturus do is still important. Beware " ..
                "that they do not use you, however. Remember it is you who the key is bound to, not them. " ..
                "But if the danger in Karazhan is real, then it is they who are best prepared to guide " ..
                "you in dealing with it. Go back to Alturus and help him in any way that you can.",
        },
        [9840] = {
            description = "Now that we've found a way back into Medivh's Tower - or rather you have - the " ..
                "first thing we need to do is try to get a sense of what the situation inside is.\n\nOne " ..
                "of our agents who had managed to infiltrate Karazhan kept an encoded log of her " ..
                "observations. Unfortunately her death was confirmed shortly before Karazhan was shut " ..
                "down. Koren, Karazhan 's blacksmith, was under our pay. Though not a member of the " ..
                "Violet Eye, he should be able to help us find Keanna's log. Look for him inside.",
        },
        [9843] = {
            description = "Who did you say you were looking for again? Keanna?\n\nI once met someone with " ..
                "that name. She was staying up at the guest chambers. I was supposed to keep that a " ..
                "secret now, wasn't I?\n\nDid you say you were with the Violet Eye? No, I've never heard " ..
                "of them.\n\nI need to return to my work now, if you don't mind.\n\n< Koren seems to have " ..
                "forgotten about you already.>",
        },
        [9844] = {
            description = "Keanna's last few entries confirm our suspicions of a demonic presence inside " ..
                "Karazhan.\n\nShe detected the arrival of a Burning Legion agent whose location she " ..
                "describes as coming from the top of the tower.\n\nHer entries stop there.\n\nKarazhan is " ..
                "a very important place, <class>. It is a portal into the nether, a beacon shining into " ..
                "other worlds. The possible repercussions of it falling into the wrong hands are " ..
                "unthinkable. This demonic intrusion must be stopped. And you, <name>, are the only one " ..
                "with a key.",
            rewardMoney = 44000,
        },
        [9860] = {
            description = "Return to Cedric at once, <name>. The aid you've given the Violet Eye will not " ..
                "go unrewarded.\n\nThink what you want of us and our organization, <class>, but gaining " ..
                "the favor of the archmages of Dalaran will not be something you regret.",
            rewardItems = {{31113, 1}},
            rewardMoney = 132000,
        },
        [9884] = {rewardItems = {{25419, 1}}},
        [9885] = {rewardItems = {{25422, 1}}},
        [9886] = {rewardItems = {{25424, 1}}},
        [9887] = {rewardItems = {{25423, 1}}},
        [10091] = {
            description = "Gah! They've been torturing me, trying to get me to tell them everything that " ..
                "I know.\n\nI failed - they fed the others to Hellmaw, and I was to be next. But I told " ..
                "them nothing!\n\nThey're crazy! They're hell-bent on summoning demonic forces that they " ..
                "have no way of controlling!\n\nThey're using special devices to make their soul shards, " ..
                "and their summoning, more powerful. You must steal these devices!\n\nI would join you, " ..
                "but I must return to Shattrath City to report to the Lower City's spymistress.",
            rewardChoices = {{28174, 1}, {28171, 1}, {28170, 1}, {28167, 1}},
            rewardMoney = 88000,
        },
        [10094] = {
            description = "It has been two years since the Shadow Council summoning that resulted in the " ..
                "explosion of this once-great mausoleum, and the formation of the Bone Wastes.\n\nNow " ..
                "they are at war with an unbelievably powerful force on the inside.\n\n<name>, you must " ..
                "make your way into the Shadow Labyrinth to determine what they are up against, and to " ..
                "see if it poses a threat to us. Our spies speak of their use of a forbidden book of " ..
                "unholy summoning, known only as the Codex of Blood.\n\nSeek your answers within its " ..
                "pages.",
        },
        [10095] = {
            description = "The Shadow Council has lost control of the cosmic being that they summoned " ..
                "here almost two years ago! It is what caused the explosion of Auchindoun, and the " ..
                "creation of the Bone Wastes beyond.\n\nKnown only as Murmur, it threatens to overrun the " ..
                "Shadow Council and break free into the outside world!\n\nWith the grandmaster, and the " ..
                "rest of their leadership dead, you are Outland's last hope against this " ..
                "monstrosity!\n\n<name>, you know at the core of your being that you and your companions " ..
                "dare not fail!",
            rewardChoices = {{28179, 1}, {28178, 1}, {28177, 1}, {28176, 1}},
            rewardMoney = 132000,
        },
        [10177] = {
            description = "I have spies within Auchindoun and they have been sending me disturbing " ..
                "reports. That place has been nothing but trouble ever since it exploded a couple of " ..
                "years ago.\n\nSomething in there has gone horribly wrong - again - and the Shadow " ..
                "Council is now on a war footing. Though the reports were lacking on details, their " ..
                "preparations appear to be directed inward.\n\nYou must make your way to the entrance of " ..
                "the Shadow Labyrinth. My field commander, Mahfuun, will fill you in on what needs to be " ..
                "done.",
        },
        [10178] = {
            description = "To'gun, the fool! We're barely holding off the attacks here, and he goes back " ..
                "in to get more information and try to save the other spies!\n\nI don't know whether to " ..
                "love him or kill him!\n\nThe Shadow Council must have used magic to ferret us out, " ..
                "because all of our spies had to get out of there in a hurry. Most of us didn't make " ..
                "it.\n\nPlease, if you're brave enough to enter the Shadow Labyrinth, will you keep an " ..
                "eye peeled for To'gun? It's been a while, and I fear the worst.",
        },
        [10202] = {
            description = "We've recently been contacted by a Sunfury magister who wishes to join our " ..
                "ranks and swears he has information we're in need of. We've checked our informants to " ..
                "make sure he's not a double agent and he checks out.\n\nHe's stationed in Manaforge Ara " ..
                "which makes communication difficult. Talk to him and see what he knows. If he's half as " ..
                "useful as he claims to be, we'll be able to put him to good use.",
        },
        [10257] = {
            description = "It doesn't surprise me that Kael'thas has put the key to this ward in the " ..
                "hands of someone like Commander Sarannis. Prince Kael'thas is a great many things, but " ..
                "he is no simpleton.\n\nIn order to break this curse once and for all, you must enter " ..
                "Tempest Keep and claim the keystone.\n\nOnly once the keystone has been destroyed will I " ..
                "regain my freedom.",
            rewardMoney = 132000,
        },
        [10270] = {
            description = "From the look on your face, I can tell you're a <race> who appreciates a good " ..
                "profit.\n\nI've built a reputation as a dealer in exotic goods, and I'm about to launch " ..
                "a new venture.\n\nI need a reliable subcontractor to procure the goods from the " ..
                "Celestial Ridge.\n\nFirst, you'll need to re-energize a teleport pad. There is a spare " ..
                "power pack in Access Shaft Zeon, which is on the south side of Manaforge UItris. The " ..
                "Protectorate is operating in there, so you may be able to follow their tracers to your " ..
                "goal.",
            rewardMoney = 44000,
        },
        [10271] = {
            description = "As you've no doubt seen, the area is teeming with nether dragons in various " ..
                "stages of growth. All nether dragons, young and old, contain an essence that's highly " ..
                "desired by K -- err, by a client of mine.\n\nMost people aren't willing to risk their " ..
                "lives to gather it, so we've got the place to ourselves. You can start by gathering the " ..
                "essence from any of the creatures out here, but it's imperative that we start building a " ..
                "supply right away. Return to me once you have the first batch.",
            rewardMoney = 44000,
        },
        [10272] = {
            description = "We've come here to investigate rumors of a strange breed of dragons, perhaps " ..
                "even descendents of Deathwing himself. These are clearly not ordinary black dragons, " ..
                "though.\n\nWe'll know more once we've had a chance to examine their eggs. Their hatred " ..
                "for my flight runs deep, so I can't get close enough to gather the eggs. Will you agree " ..
                "to help?",
            rewardMoney = 44000,
        },
        [10273] = {
            description = "Your former employer, Wind Trader Marid, must've gotten wind that you're " ..
                "helping us now. Through my projection, I've seen his nether-stalkers entering the area, " ..
                "hoping to track us down.\n\nWe've been able evade them so far, but Marid must be dealt " ..
                "with before the problem grows more severe.\n\nIf your impressions of Marid are correct, " ..
                "he'll do just about anything to secure the supply of his product. Return to him and tell " ..
                "him you're prepared to offer a deal. Lure him away and slay him.",
            rewardMoney = 44000,
        },
        [10274] = {
            description = "The nether dragons have the same ferocious temperament as their black dragon " ..
                "forbears, but there is something entirely alien about them. They hatch and mature " ..
                "rapidly, harnessing the strange energies that forged their kind in the destruction of " ..
                "Draenor.\n\nThere is so much more I need to know about them, but I believe the powers " ..
                "may be of use to my own flight. If we can displace the leader of these drakes, Veraku, " ..
                "with a show of dominance, we can cow the rest of them into submission.",
            rewardChoices = {{29808, 1}, {29810, 1}, {29811, 1}, {29812, 1}},
            rewardMoney = 88000,
        },
        [10275] = {
            description = "I've recalibrated the triangulation device with the information that you " ..
                "provided from the first point. You'll use it in exactly the same manner to discover the " ..
                "second.\n\nAll that I can tell you is that the second point is somewhere far to the " ..
                "west.\n\nOnce you've located it, speak with Wind Trader Tuluman; another of the " ..
                "nexus-prince's agents. He's posing as a weapon merchant at a small trading post next to " ..
                "the bridge, which leads to the island that Manaforge Ara is on.",
            rewardMoney = 44000,
        },
        [10276] = {
            description = "With the data from both the first and second points, I'm now certain that the " ..
                "crystal is at the top of the Ruins of Farahlon to the northeast.\n\nUnfortunately, the " ..
                "data indicates that the crystal is moving, which means that it has already been " ..
                "discovered, probably by the Burning Legion!\n\nJust in case, I recommend that you take " ..
                "some friends along.\n\nSlay the demon that has the crystal and return it to Nexus-Prince " ..
                "Haramad.",
            rewardMoney = 44000,
        },
        [10280] = {
            description = "I am an ethereal of my word, <name>. You have truly inspired me.\n\nI am now " ..
                "going to give you the ata'mal crystal to hand over to the naaru. As it was your heroics " ..
                "that made this possible, I wish for you to deliver it.\n\nYou may use my personal " ..
                "teleporter to go directly to Shattrath City. Simply step through it and you will be " ..
                "transported there.\n\nGive the crystal to the naaru known as A'dal on the Terrace of " ..
                "Light. May the trade winds be at your back.",
            rewardChoices = {{30258, 1}, {30256, 1}, {30257, 1}},
            rewardMoney = 132000,
        },
        [10281] = {
            description = "Greetings, <name>. Do not be alarmed. This is merely a projection of my " ..
                "current form. It's the only way my companion and I could keep watch without revealing " ..
                "ourselves.\n\nThe ethereal who approached you, Marid, is little better than a swindler " ..
                "in the guise of a legitimate merchant. I'd like you to consider working with me instead. " ..
                "My purpose out here is to find out more about the unusual dragonkin on this ridge. Meet " ..
                "me at the north end of the ridge and we will discuss this further.",
        },
        [10290] = {
            description = "To the northeast is an area called the Netherstone, a landmark not seen when " ..
                "this was a lush, green land. Newly-exposed crystal formations have shown us a mineral " ..
                "we've called farahlite in honor of this land's former identity.\n\nThe tiny amount of " ..
                "farahlite we've mined has already proven popular with our clients. The highest grade of " ..
                "the mineral comes not from static deposits, but from the giants around the Netherstone. " ..
                "I can offer you a cut of the profits if you'll help supply the higher grade farahlite.",
            rewardMoney = 44000,
        },
        [10296] = {
            description = "The Infinite Dragonflight have abandoned all pretense of subtlety. They plot " ..
                "to destroy the Guardian, Medivh, and prevent the Dark Portal from ever opening. While " ..
                "outwardly, this may appear a boon to the forces of the Alliance, it is in actuality " ..
                "catastrophic and will result in your world ending.\n\nYou must venture through the " ..
                "timeway leading to the Black Morass. Go west and then south, past my future self, until " ..
                "you reach the tunnel that houses the swamp specimens. Cross over and speak with Sa'at.",
        },
        [10297] = {
            description = "Beyond this timeway, in the heart of the Black Morass, the Guardian, Medivh, " ..
                "feverishly works to open the Dark Portal, heralding in the age of orcs upon " ..
                "Azeroth.\n\nThe Infinite have sent their rift lords to stop this from " ..
                "happening.\n\nScattered across the morass, rifts will materialize. Infinite will pour " ..
                "out of the rifts and attempt to destroy Medivh's shields and, ultimately, " ..
                "Medivh.\n\nKill their rift lords and leaders! Do this until Medivh succeeds. Use this " ..
                "chrono-beacon should you require aid.",
        },
        [10298] = {
            description = "Return to the child, Andormu, <name>. He awaits you outside this pocket of " ..
                "time, in the master's lair.\n\nI hear flutterings. The Scale of Sands has shown interest " ..
                "in your abilities. Perhaps they too would like to speak with you.",
            rewardChoices = {{29320, 1}, {29322, 1}, {29321, 1}, {29323, 1}},
        },
        [10310] = {
            description = "With the Burning Legion nearby at the fel reaver scrap field, we must do what " ..
                "we can to stop the flow of demons into the area.\n\nThey have a warp-gate to the south " ..
                "in an area that they've cleverly named Invasion Point: Destroyer.\n\nI need you to go " ..
                "with me to the site and keep me safe while I sabotage it.\n\nAfterward, go to the " ..
                "Midrealm Post to the north inside Eco-Dome Midrealm and apprise Gahruj of our " ..
                "success.\n\nWe're going to need a friend or two of yours along to help with this.",
            rewardChoices = {{29978, 1}, {29980, 1}, {29979, 1}},
            rewardMoney = 88000,
        },
        [10311] = {
            description = "<class>, it is good to see a helpful face around here.\n\nThe Burning Legion " ..
                "at the nearby fel reaver heap has become more bold, and I am beginning to fear for our " ..
                "safety here. The demons are constantly receiving reinforcements from Invasion Point: " ..
                "Destroyer to the south.\n\nMy compatriot, Drijya, has gone down there to scout and see " ..
                "if he can do something about the Burning Legion's warp-gate.\n\nPlease find and assist " ..
                "him in any way that you can.",
        },
        [10315] = {
            description = "The blood elves are fools! I'm glad that our trade relations with them have " ..
                "fallen apart. In all of my travels throughout the cosmos, I have never encountered " ..
                "beings so selfish.\n\nThey continue to destroy the land around us with their manaforges, " ..
                "so let's see if we can put a dent in their operations across the bridge at Manaforge " ..
                "Ara.\n\nTheir nethermancers channel energy to and from the blood gems to stabilize the " ..
                "flow of power. Go over there and wipe them out!",
            rewardMoney = 44000,
        },
        [10317] = {
            description = "The blood elves call the mine underneath Manaforge Ara the Trelleum Mine. Ever " ..
                "since they lost the one underneath Manaforge Ultris, this is where their sole supply of " ..
                "material for running the forges is coming from.\n\nNeedless to say, it would be a boon " ..
                "for us to cripple their mining operation. Perhaps we'd even be able to move in and take " ..
                "it over for ourselves?\n\nWhatever the case, I want you to go in there and deal with " ..
                "Foreman Sundown. The mine is around the back of the island to the left.",
        },
        [10318] = {
            description = "I used to be the foreman here. But now that I've been demoted, I've come to " ..
                "realize our pilgrimage from Quel'Thalas to Outland was all a lie.\n\nA lie perpetrated " ..
                "by Kael'thas to strengthen his forces here in the Netherstorm.\n\nI've tried to convince " ..
                "my brethren that we should leave, especially with the Burning Legion here, but they are " ..
                "all too stubborn.\n\nDo me a favor? Kill Overmaster Grindgarr. Then return to your " ..
                "ethereal and tell him that I am no longer his enemy.",
            rewardChoices = {{30003, 1}, {30004, 1}, {30005, 1}, {30006, 1}},
            rewardMoney = 44000,
        },
        [10322] = {
            description = "We've received news from one of the two manaforges that remain operational. " ..
                "The Sunfury army is losing control of Manaforge Duro.\n\nDroves of errant mana creatures " ..
                "have been attracted to it by its increased energy production - the manaforge is in " ..
                "chaos.\n\nAn explosion at Duro has the potential to cause a chain reaction that would " ..
                "endanger all of Outland. Overseer Athanel is in possesion of the access crystal you need " ..
                "to safely disable the manaforge.",
        },
        [10323] = {
            description = "One manaforge is all that keeps Tempest Keep functional. After we bring " ..
                "Manaforge Ara down, Kael will have to resort to depleting whatever energy he's got " ..
                "stored up.\n\nTravel to Manaforge Ara, in the northwest, and deliver the final blow that " ..
                "we need by shutting it down.\n\nThe last access crystal is in the possession of Overseer " ..
                "Azarad. Be warned that we expect heavy opposition in the last of Kael's functional " ..
                "manaforges. You're likely to need the assistance of reliable friends.",
            rewardChoices = {{30377, 1}, {30365, 1}},
            rewardMoney = 44000,
        },
        [10328] = {
            description = "Something about these manaforges has been bothering me, <name>. Naaru " ..
                "technology is incredibly advanced; it should've taken Kael'thas years to even begin to " ..
                "understand it.\n\nInformation-gathering on the subject has been difficult as Kael's army " ..
                "is well disciplined and destroys all evidence of written communication.\n\nWe've been " ..
                "informed Manaforge Duro is under attack by mana creatures. It is possible that those " ..
                "defending it have not yet destroyed their briefings. Obtain them and bring them to me.",
        },
        [10335] = {
            description = "I have to get over to the Ruins of Farahlon to start my excavations! The " ..
                "problem is that the place has been infested by demons!\n\nMaybe you could do some " ..
                "preliminary work for me?\n\nThere are three locations within the ruins to the northeast " ..
                "where I want you to place surveying markers. Each is near a draenei banner.\n\nReturn to " ..
                "me when you've managed to place all three markers.",
            rewardChoices = {{30255, 1}, {30253, 1}, {30254, 1}},
            rewardMoney = 44000,
        },
        [10336] = {
            description = "A few weeks ago, the Burning Legion moved into the Ruins of Farahlon, " ..
                "thwarting our plans to excavate the site for its artifacts.\n\nThen earlier today, I " ..
                "learned that one of their dreadlords, Culuthas, somehow killed off all of the other " ..
                "Burning Legion. He has since summoned in demons that serve him.\n\n<class>, I want you " ..
                "to go up to those ruins to the northeast and rid them of their demon infestation.",
            rewardMoney = 44000,
        },
        [10338] = {
            description = "So Manaforge Duro is under attack and Sunfury forces have lost control? What a " ..
                "dilemma! If Duro goes down, then Tempest Keep goes down. Only drawback is... if Tempest " ..
                "Keep is destroyed, the explosion will probably take what little remains of this forsaken " ..
                "land with it.\n\nDead Kael'thas is good. Dead everyone else is... not that great, I " ..
                "suppose. It pains me to ask this of you, but go to Manaforge Duro and shut it down " ..
                "before it goes up in flames. The access crystal is held by Overseer Athanel.",
        },
        [10339] = {
            description = "Directly south of here you will find the Ethereum Staging Grounds. The " ..
                "Ethereum are there, preparing for something... Perhaps an assault on Ultris.\n\nWe can't " ..
                "take any chances, though, <class>. Break through their perimeter defenses and take out " ..
                "their training facility.\n\nOnce you've destroyed their soldiers and Captain Zovax, " ..
                "locate Ethereum transponder Zeta and use it to establish contact with me to get your " ..
                "next set of orders.",
        },
        [10341] = {
            description = "The news you've discovered is fortunate, <name>. Not only do you get to waltz " ..
                "into Manaforge Duro unfettered, this also presents a great opportunity to deal a blow to " ..
                "Kael's army.\n\nUse the mana creature assault to your advantage and pick off any Sunfury " ..
                "stragglers you run into.\n\nI do not take particular glee in the senseless slaughter of " ..
                "my own kin the way that Thalodien does, but the tactical advantage here is too high to " ..
                "pass up.",
            rewardChoices = {{30395, 1}, {30394, 1}, {30396, 1}, {30522, 1}},
        },
        [10345] = {
            description = "You see these corpses, <race>? Arconus is responsible for this slaughter. He's " ..
                "sucked them dry, leaving nothing more than a fleshy husk. But don't let the bodies fool " ..
                "you! Inside those corpses lie flesh beasts, waiting to pounce on the unsuspecting fool " ..
                "that gets too close.\n\nI've got my orders. I must remain here until backup arrives. " ..
                "That doesn't mean that you can't take my igniter and destroy the withered corpses that " ..
                "litter the mines. One way or another, the mission must be completed.",
            rewardChoices = {{30352, 1}, {30341, 1}, {30342, 1}, {30519, 1}},
        },
        [10353] = {
            description = "Araxes and I were deployed to Ultris 2 days ago. Our mission: Find and " ..
                "terminate the void lord Arconus. We tracked him to this mine and discovered that he'd " ..
                "been feeding off the energies of the creatures in the area.\n\nA fire-fight broke out " ..
                "which resulted in Araxes and I separating. Now I'm stuck here, badly injured. The " ..
                "mission is in shambles!\n\nIf you can take out Arconus, high command would be grateful. " ..
                "Should you accept this mission, I will assist by providing a reflection of myself as a " ..
                "guardian.",
            rewardChoices = {{30329, 1}, {30328, 1}, {30330, 1}, {30517, 1}},
            rewardMoney = 44000,
        },
        [10365] = {
            description = "You've done much better than any of us anticipated. Manaforge Ara is the last " ..
                "of Kael's working manaforges. You'll find it northwest of here, though you're likely to " ..
                "have to do some circumnavigating to get to it. We want you to shut it down.\n\nThe last " ..
                "access crystal is in the possession of Overseer Azarad. This is Kael's very last source " ..
                "of energy as far as we know, so expect heavy opposition. I'd bring a couple of friends " ..
                "along if I were you.\n\nHmm... Azarad. What an odd name for a sin'dorei.",
            rewardChoices = {{30366, 1}, {30378, 1}},
            rewardMoney = 44000,
        },
        [10380] = {
            description = "We've been so blind, <name>, that the alliance of two of our most dangerous " ..
                "enemies went completely unnoticed.\n\nI wouldn't be surprised if the Scryers had " ..
                "something to do with hiding this information from us, but we must now face the reality. " ..
                "The Burning Legion and Kael'thas' Sunfury army serve under the same banner.\n\nThese " ..
                "demons are the only reason Kael'thas was ever able to utilize the technology in Tempest " ..
                "Keep. Under Orelis's orders I must command you to destroy them.",
        },
        [10381] = {
            description = "My mission here is finished. I did what Orelis ordered me to - I've never " ..
                "failed to.\n\nNo more. I foresee a great carnage - a crusade, they'll call it - " ..
                "following the news of this alliance between Kael'thas and the Burning Legion.\n\nFirst " ..
                "they give our holiest city away to our enemies and then they ask us to die fighting " ..
                "their enemies. Go back to Orelis; tell him the naaru can fight their own fights from now " ..
                "on.",
            rewardChoices = {{30382, 1}, {30379, 1}, {30381, 1}, {30380, 1}},
        },
        [10384] = {
            description = "Look around you, fleshling. Very close to this transponder should be an " ..
                "Ethereum data cell. Locate that data cell, open it, and retrieve the contents.\n\nBring " ..
                "it back to this transponder at once!",
        },
        [10385] = {
            description = "They're using relays to transfer information around the staging " ..
                "grounds.\n\nThere is only one way for you to see these relays and extract the " ..
                "information they hold. Unfortunately, doing so may cause you irreparable brain " ..
                "damage.\n\nIf you're still interested, you'll need to slay Ethereum here at the staging " ..
                "grounds and take their essences. Once you have an essence, drink it down. It will " ..
                "temporarily allow you to see an Ethereum relay - giving you enough time to destroy a " ..
                "relay and extract its information.",
        },
        [10405] = {
            description = "We must destroy the machinery that is making these nexus-stalker aberrations " ..
                "possible. To strike at their proto-accelerator would be futile as it is an ethereal " ..
                "creation. We must instead destroy the manaforge energy tube that they are using as a " ..
                "conduit.\n\nI have all that I need to create a device to overload the conduit save for " ..
                "one item. I need a wrapping from an archon or overlord that might be transforming soon " ..
                "in order to calibrate the device.",
        },
        [10406] = {
            description = "I'm sending one of my demolitionists out to place the disruption device. Just " ..
                "make sure no harm comes to him as he's placing the disruptor.\n\nKeep him protected! He " ..
                "will not fight back if enemies attack him as he is only a holographic image but the " ..
                "image can be destroyed!\n\nReturn to me once the job is done.",
            rewardChoices = {{30335, 1}, {30337, 1}, {30336, 1}, {30518, 1}},
        },
        [10407] = {
            description = "The infamous eredar, Socrethar, leads the Burning Legion in Netherstorm. " ..
                "Mentioning his name is enough to make most draenei shudder. He gives orders from an " ..
                "island in the northwest that only his most trusted lieutenants can access.\n\nTo get " ..
                "there you will need to obtain a teleportation stone, which won't be an easy task. The " ..
                "first half of the stone is in the possession of Forgemaster Morug at Forge Base: " ..
                "Oblivion. The second half is held by Silroth at Forge Base: Gehenna.",
            rewardMoney = 44000,
        },
        [10408] = {
            description = "I have in my possession another disruptor, one capable of destroying the three " ..
                "conduits that surround Salhadaar. Once the conduits are destroyed, Salhadaar's " ..
                "protective force fields will be down. For this act, he will strike at you with a " ..
                "ferocity you have never before witnessed, <name>.\n\nIf you are willing to rid the world " ..
                "of Salhadaar, I will give you the disruptor.",
            rewardChoices = {{30011, 1}, {30012, 1}, {30010, 1}, {30013, 1}, {30009, 1}},
            rewardMoney = 132000,
        },
        [10409] = {
            description = "When facing eredar of great power, large armies are useless for the most part. " ..
                "Their corruptive powers over mortal souls are such that only the strongest-willed can " ..
                "even stand face to face with them.\n\nTake this stone to the Invasion Point: Overlord, " ..
                "between Forge Base: Oblivion and Gehenna and bring your closest, strongest friends with " ..
                "you. Orelis and Karja will meet you at Socrethar's Seat; I will send Adyen along with " ..
                "them.\n\nMay the Light prevail today, <name>. May Socrethar meet his end.",
            rewardChoices = {{30368, 1}, {30369, 1}, {30370, 1}, {30371, 1}, {30860, 1}},
            rewardMoney = 132000,
        },
        [10410] = {
            description = "The time has come to face Socrethar, <name>. Confronting an eredar leader " ..
                "isn't something that's taken lightly among us. A single mistake is likely to cost us our " ..
                "lives if we're ill-prepared.\n\nTake Socrethar's teleportation stone to High Priestess " ..
                "Ishanah at the Shrine of Unending Light in Shattrath City. She will determine how we " ..
                "need to handle the situation.",
        },
        [10411] = {
            description = "Around the ruined manaforge you will find the run-off of Dimensius's handy " ..
                "work. Seeping sludge occupies the pools that surround Ultris. Directly below those " ..
                "pools, where the Ethereum Staging Grounds now stand, you will find even more run-off in " ..
                "the form of void waste.\n\nThe best method of disposal is to use electro-shock to break " ..
                "slimes down to globules. Use this elixir to augment your attacks with electricity. The " ..
                "resultant discharge will break the slimes up into their raw form. Destroy the globules!",
            rewardMoney = 132000,
        },
        [10413] = {
            description = "You carefully fill a vial with the fallen void horror's ooze.\n\nResearcher " ..
                "Navuud at the Protectorate Watch Post would be quite interested in such a find! Take it " ..
                "to him at once!",
            rewardChoices = {{30338, 1}, {30339, 1}, {30340, 1}},
            rewardMoney = 88000,
        },
        [10416] = {
            description = "Arcane tomes are not ordinary books that happen to deal with arcane matters. " ..
                "There is intrinsic power in them - a power I've learned to synthesize into a single " ..
                "arcane rune.\n\nShould you find an arcane tome in your travels I will give you one such " ..
                "rune. Only the most powerful wielders of magic carry the books I need. In Outland this " ..
                "usually means Kael's blood elves - but you'd be surprised by where such tomes often turn " ..
                "up.",
            rewardItems = {{29736, 1}},
        },
        [10419] = {rewardItems = {{29736, 1}}},
        [10420] = {
            description = "This temple is one of the holiest places in all of Outland. The power of the " ..
                "Light here is so strong, that even items with the strongest fel taint can be cleansed of " ..
                "a worldly item.\n\nShould you run into any fel armaments in your confrontations with " ..
                "demonic enemies, bring them to me and I will demonstrate the cleansing power of the " ..
                "Light.",
            rewardItems = {{29735, 1}},
        },
        [10421] = {rewardItems = {{29735, 1}}},
        [10422] = {
            description = "Captain Tyralius took a platoon of soldiers south towards the Ethereum Staging " ..
                "Grounds 10 days ago. We haven't heard from him or his crew since.\n\nChances are good " ..
                "that they were ambushed and killed but I'm getting a curious reading from my " ..
                "instruments.\n\nI think it's a distress signal but these things have been wrong before. " ..
                "If Tyralius is still alive, they're keeping him in one of their prisons. You'll have to " ..
                "locate the prison and open it with a key, probably found on the warden.",
            rewardMoney = 132000,
        },
        [10425] = {
            description = "Thank K'aresh! He would have torn me apart!\n\nI'm a Protectorate soldier, " ..
                "fleshling. My platoon was sent on a recon mission about 10 days ago. As we were moving " ..
                "across the upper ledges of this island, a group of Ethereum jumped us. At least I think " ..
                "it was Ethereum. They had the same energy color but their wrappings looked void.\n\nOnly " ..
                "Tyralius was spared. I think they put him in a prison cell.\n\nI've got to get back to " ..
                "the Protectorate Watch Post! Can you escort me back?",
            rewardChoices = {{30331, 1}, {30332, 1}, {30333, 1}, {30334, 1}},
        },
        [10431] = {
            description = "The Sunfury briefings support the theory that Kael'thas has been receiving " ..
                "outside help in constructing and running these manaforges. Who this is remains a bit of " ..
                "a mystery, though we're likely to find out in Manaforge Ara.\n\nI've sent a group of my " ..
                "men to scout the surrounding area. Go to Tuluman's Landing, north of here, and speak to " ..
                "Kaylaan. See what he's discovered at Manaforge Ara. Find out who is assisting the " ..
                "Sunfury army and take care of them.",
        },
        [10432] = {
            description = "As you may have noticed, there are servants of the Burning Legion all over " ..
                "Manaforge Ara. Kael'thas has entered an alliance with the Burning Legion. He must've " ..
                "caught wind of Illidan's descent into insanity and switched paymasters " ..
                "accordingly.\n\nIf the Scryers get definite proof of this, it will give them a " ..
                "considerable political advantage. I know for a fact that the Legion forces at this " ..
                "manaforge have orders that bear Kael's seal.\n\nGet these orders and bring them to " ..
                "Thalodien.",
        },
        [10437] = {
            description = "Atop Manaforge Ultris lies the tear in the nether that the void lord, " ..
                "Dimensius, came through. That tear provides Dimensius with a link to the void, rendering " ..
                "him immune to physical harm. If we can get a lock on the conduit that Dimensius is using " ..
                "to keep himself phased out of this plane of existence, we can destroy it and then " ..
                "destroy Dimensius.\n\nTo do this, we're going to first need you to collect fragments of " ..
                "Dimensius from the void creatures that he sends out to do his dirty work.",
        },
        [10438] = {
            description = "Here it is, <name>. Take this phase disruptor and mount up! The Protecotrate " ..
                "nether drake will fly you close enough to Ultris so that you can drop the disruptor on " ..
                "top of the void conduit.\n\nDrop as many disruptor charges as possible to ensure " ..
                "complete annihilation!\n\nWhen you are ready, speak with the nether drake and he'll take " ..
                "you up.\n\nIf you miss the mark you will have to get more bombs from me before you can " ..
                "go up again.",
        },
        [10439] = {
            description = "Your brave actions have forced Ameer to react! He has deployed Captain Saeed " ..
                "and the Avengers!\n\nNow all that is left to do is destroy Dimensius.\n\nWhen you are " ..
                "ready, I will call for Saeed. If he is not currently fighting another battle, he will be " ..
                "awaiting orders from you - directly east of here.\n\nLet him know when you are ready to " ..
                "fight and he will put his troops in motion!\n\nI wish you luck, fleshling! We have " ..
                "hunted Dimensius for a thousand years!",
            rewardChoices = {{30297, 1}, {30300, 1}, {30299, 1}, {30298, 1}},
            rewardMoney = 132000,
        },
        [10445] = {
            description = "Seven vials were drawn from the Well of Eternity by Illidan. He poured three " ..
                "into the lake on top of Mount Hyjal and a second Well of Eternity was created. For years " ..
                "the rest were believed lost.\n\nWith the opening of the Dark Portal, we've come to know " ..
                "that he gave one each to his lieutenants Kael'thas and Vashj. Retrieve what remains of " ..
                "them; we will need them as foci to open a gateway to any events tied to Mount Hyjal, " ..
                "recent or ancient. The outcome of the Battle of Mount Hyjal must be preserved.",
            rewardMoney = 132000,
        },
        [10451] = {
            description = "Thank the Earthmother! I parted ways with the others several days ago. I was " ..
                "intent on discovering the source of the disturbance that the spirits of water were " ..
                "feeling. My search led me to Coilskar where I discovered that the naga were befouling " ..
                "the water supply of Shadowmoon Valley.\n\nUnfortunately, I was discovered and taken " ..
                "prisoner. There's no telling what ghastly things they had in store for me.\n\nWe must " ..
                "leave this place! Help me escape and then seek out Torlok at the Altar of Damnation.",
            rewardChoices = {{30927, 1}, {30952, 1}, {30937, 1}, {30968, 1}},
            rewardMoney = 132000,
        },
        [10458] = {
            description = "We must try and make amends. We must commune with the elements of this region " ..
                "and see if anything can be done!\n\nI grant you the totem of spirits, <race>. If you " ..
                "slay an enraged elemental spirit in close proximity of the totem, it will consume the " ..
                "elemental's soul. You must use the totem to consume many souls before you may return to " ..
                "me.\n\nDo this for the spirits of fire and earth first. Return to me when the totem is " ..
                "full.",
        },
        [10460] = {rewardItems = {{29294, 1}}},
        [10461] = {rewardItems = {{29307, 1}}},
        [10462] = {rewardItems = {{29298, 1}}},
        [10463] = {rewardItems = {{29302, 1}}},
        [10464] = {
            description = "You've made your pledge, <class>. Now it is up to you to see it " ..
                "through.\n\nServe the Scale of the Sands well and you will be rewarded.\n\nFail and the " ..
                "timeline as we know it will be unravelled!",
            rewardItems = {{29303, 1}},
        },
        [10465] = {
            description = "You've made your pledge, <class>. Now it is up to you to see it " ..
                "through.\n\nServe the Scale of the Sands well and you will be rewarded. Fail and the " ..
                "timeline as we know it will be unravelled!",
            rewardItems = {{29306, 1}},
        },
        [10466] = {
            description = "You've made your pledge, <class>. Now it is up to you to see it " ..
                "through.\n\nServe the Scale of the Sands well and you will be rewarded. Fail and the " ..
                "timeline as we know it will be unravelled!",
            rewardItems = {{29299, 1}},
        },
        [10467] = {
            description = "You've made your pledge, <class>. Now it is up to you to see it " ..
                "through.\n\nServe the Scale of the Sands well and you will be rewarded. Fail and the " ..
                "timeline as we know it will be unravelled!",
            rewardItems = {{29295, 1}},
        },
        [10468] = {
            description = "You've carried out the promise you made to us, <name>. And for that you've " ..
                "gained the recognition you deserve.\n\nAs you continue to become attuned with past " ..
                "events surrounding mount Hyjal, I can continue to tap into the power contained in your " ..
                "ring. It won't be long until it has reached its full potential.",
            rewardItems = {{29304, 1}},
        },
        [10469] = {
            description = "You've carried out the promise you made to us, <name>. And for that you've " ..
                "gained the recognition you deserve.\n\nAs you continue to become attuned with past " ..
                "events surrounding mount Hyjal, I can continue to tap into the power contained in your " ..
                "ring. It won't be long until it has reached its full potential.",
            rewardItems = {{29308, 1}},
        },
        [10470] = {
            description = "You've carried out the promise you made to us, <name>. And for that you've " ..
                "gained the recognition you deserve.\n\nAs you continue to become attuned with past " ..
                "events surrounding mount Hyjal, I can continue to tap into the power contained in your " ..
                "ring. It won't be long until it has reached its full potential.",
            rewardItems = {{29300, 1}},
        },
        [10471] = {
            description = "You've carried out the promise you made to us, <name>. And for that you've " ..
                "gained the recognition you deserve.\n\nAs you continue to become attuned with past " ..
                "events surrounding mount Hyjal, I can continue to tap into the power contained in your " ..
                "ring. It won't be long until it has reached its full potential.",
            rewardItems = {{29296, 1}},
        },
        [10472] = {
            description = "Your accomplishments have gone beyond my greatest expectations, <name>.\n\nYou " ..
                "step in and out of time as comfortably as any bronze dragon I've known. You are destined " ..
                "for great power and I am more than pleased to help you on your way there.\n\nContinue to " ..
                "serve the Scale of the Sands and I will unleash your gift's full potential.",
            rewardItems = {{29305, 1}},
        },
        [10473] = {
            description = "Your accomplishments have gone beyond my greatest expectations, <name>.\n\nYou " ..
                "step in and out of time as comfortably as any bronze dragon I've known. You are destined " ..
                "for great power and I am more than pleased to help you on your way there.\n\nContinue to " ..
                "serve the Scale of the Sands and I will unleash your gift's full potential.",
            rewardItems = {{29309, 1}},
        },
        [10474] = {
            description = "Your accomplishments have gone beyond my greatest expectations, <name>.\n\nYou " ..
                "step in and out of time as comfortably as any bronze dragon I've known. You are destined " ..
                "for great power and I am more than pleased to help you on your way there.\n\nContinue to " ..
                "serve the Scale of the Sands and I will unleash your gift's full potential.",
            rewardItems = {{29301, 1}},
        },
        [10475] = {
            description = "Your accomplishments have gone beyond my greatest expectations, <name>.\n\nYou " ..
                "step in and out of time as comfortably as any bronze dragon I've known. You are destined " ..
                "for great power and I am more than pleased to help you on your way there.\n\nContinue to " ..
                "serve the Scale of the Sands and I will unleash your gift's full potential.",
            rewardItems = {{29297, 1}},
        },
        [10480] = {
            description = "The Illidari naga of the region have taken control of the only clean water " ..
                "supply that exists in Shadowmoon Valley.\n\nDirectly north of here you will find the " ..
                "lair of the naga: Coilskar. Around Coilskar are pockets of agitated water that howl to " ..
                "the land in anguish. It is at those pockets that the enraged spirits of water now " ..
                "wander.\n\nTravel to Coilskar and use the totem of spirits to capture watery souls. You " ..
                "will find the largest concentration of these spirits near Coilskar Cistern.",
        },
        [10481] = {
            description = "Venture southeast, hero. When you see fields of gigantic blue crystals jutting " ..
                "out from the land, you will have reached your destination. It is there, at the " ..
                "Netherwing Fields, that you will find the enraged spirits of air. They roam the cliffs " ..
                "and mountain bases that surround the fields.\n\nDestroy their tortured forms and capture " ..
                "their souls with the totem of spirits. Return to me when this is done.",
            rewardChoices = {{30953, 1}, {30930, 1}, {30942, 1}, {30964, 1}},
        },
        [10507] = {
            description = "This is the chance we've been waiting for, <name>. Not only have we uncovered " ..
                "the evidence we need to show our people who Kael'thas is really working for, but we can " ..
                "prove our strength by defeating his new masters.\n\nMy frail health prevents me from " ..
                "aiding you in person with this endeavor, but I will offer you an object that will allow " ..
                "me to project my powers across the continent.",
            rewardChoices = {{30375, 1}, {30372, 1}, {30373, 1}, {30374, 1}, {30859, 1}},
            rewardMoney = 132000,
        },
        [10508] = {
            description = "I don't want to send you to Voren'thal empty-handed. It's not in my style to " ..
                "be underwhelming.\n\nTo gain access to Socrethar's Seat in the north, we'll need to use " ..
                "his own teleporters - locked by Socrethar's teleportation stone. The first half of the " ..
                "stone is in the possession of Forgemaster Morug at Forge Base Oblivion. The second half " ..
                "is held by the demon Silroth at Forge Base: Gehenna.\n\nObtain these and Voren'thal will " ..
                "be impressed beyond words.",
            rewardMoney = 44000,
        },
        [10509] = {
            description = "Now I can properly send you back to Shattrath City. You've uncovered evidence " ..
                "of Kael'thas making pacts with the Burning Legion and you've got the key to the " ..
                "overlord's back door.\n\nMake sure Voren'thal doesn't topple over with excitement from " ..
                "the news - the old man's getting a bit fragile, if you know what I mean. You'll find him " ..
                "inside the Seer's Library at the Scryer's Tier.",
        },
        [10513] = {
            description = "I do not know how we can acquire the spell that the spirits mentioned, <name>. " ..
                "Truth be told, I don't even know where we would start such a search.\n\n<Torlok stares " ..
                "off in the distance, lost in thought.>\n\nHrm... It is a long shot but it might be our " ..
                "only chance. There is an orc that I have seen visit this area before. I spoke to him " ..
                "briefly once. He is a hermit that claims to live above Coilskar Cistern to the " ..
                "northeast. Seek out this orc, Oronok Torn-heart.\n\nAs I said, it is a long shot.",
        },
        [10514] = {
            description = "I've been a lot of things, stranger, but what I once was isn't what's " ..
                "important. What I am now is what matters and what I am now is a farmer.\n\nI use trained " ..
                "felboars to dig up tubers from the hardened earth of the Shattered Plains. Recently, " ..
                "though, flayers from a nest to the northeast have been attacking my animals, preventing " ..
                "me from gathering tubers.\n\nWould you go to the area north of here and gather tubers " ..
                "for me? Use this whistle while standing on a tuber mound and a boar will come dig one up!",
            rewardChoices = {{30357, 20}, {30358, 20}, {30359, 20}, {30361, 20}},
        },
        [10515] = {
            description = "We need to show those flayers what happens when you mess with Oronok's " ..
                "business!\n\nI want you to go back to the Shattered Plains and destroy every flayer egg " ..
                "that you see. They'll be deep in flayer territory so keep your guard up.",
        },
        [10519] = {
            description = "<Oronok adjusts his posture and stands to his full height.>\n\nI had to be " ..
                "sure, <name>. And to be sure, I had to test you. Please excuse the little masquerade. I " ..
                "am as much a farmer as you are <female/male>. Which is to say, not at all.\n\nIf you are " ..
                "to recover the Cipher of Damnation, you will need to listen to what I have to tell you. " ..
                "When you are ready, let me know and I will tell you the story.",
        },
        [10521] = {
            description = "My first born, Grom'tor, left to search Coilskar Point - directly southwest of " ..
                "here.\n\nHe's the warrior in the family - ill-tempered and blood-thirsty... Traits he " ..
                "inherited from his mother. Search along the outskirts of Coilskar Point. If you see naga " ..
                "corpses, Grom'tor is sure to be close.\n\nWhen you find him, tell him this: \"We spill " ..
                "blood for just cause.\" It will let him know that you are a friend to Torn-heart and " ..
                "prevent your premature death.",
        },
        [10522] = {
            description = "This naga filth is the sixth one I've interrogated today. He's got the fancy " ..
                "armor so I figured he knew something. Those other ones were useless.\n\n<Grom'tor points " ..
                "to the corpses of the naga around him.>\n\nI only had to beat him once and he told me " ..
                "everything.\n\nThe first part of the cipher is hidden in a naga chest at Coilskar Point " ..
                "or Coilskar Cistern, east of here. He says naga carry the keys. Kill 'em, take their " ..
                "keys and use them to open the Coilskar chests. Return to me when you find the cipher.",
        },
        [10523] = {
            description = "<Grom'tor wraps the documents up and places them in a lockbox.>\n\nTake this " ..
                "box to father. He awaits your return at the farm, northeast of here.\n\nTell him that I " ..
                "will be home soon. As soon as I am done having my fun...",
            rewardChoices = {{30945, 1}, {30923, 1}, {30981, 1}, {30956, 1}},
        },
        [10527] = {
            description = "My youngest son, Ar'tor, left to search Illidari Point - far to the southwest, " ..
                "nestled between Legion Hold and Wildhammer Stronghold.\n\nWhile Ar'tor is a hunter of " ..
                "remarkable skill and an expert tracker, I fear that he may be in over his head this " ..
                "time. Illidari Point is the proving grounds for Illidan's demons. These are demons that " ..
                "left the Burning Legion to join the Betrayer!\n\nTravel to Illidari Point and find " ..
                "Ar'tor, <name>.",
        },
        [10528] = {
            description = "From assessing the scene, you note that Ar'tor is being held in place by " ..
                "energy beams emanating from the crystals hovering around the rune. Try as you might, " ..
                "Ar'tor is unmovable.\n\nYou note that the crystals have an empty slot at their base - " ..
                "perhaps for a key. It also seems as if succubi periodically perform some sort of ritual " ..
                "at the site.\n\nSearch Illidari Point for their leader. Perhaps she holds the key to " ..
                "releasing Ar'tor.",
        },
        [10537] = {
            description = "It is a sign, <name>. Even in death, I cannot be stopped. Recovering a part of " ..
                "the Cipher of Damnation is my destiny. With your help, that destiny will be " ..
                "fulfilled.\n\nBefore we embark on that journey, I must have my longbow, Lohn'goron. It " ..
                "is a family heirloom that has been handed down from Torn-heart to Torn-heart for " ..
                "generations.\n\nMy instinct tells me that a demon stole it from my corpse. Kill the " ..
                "demons here until you find my bow.",
        },
        [10540] = {
            description = "At last, we are ready. I will bestow a piece of my spirit upon you, hero. It " ..
                "will guard you and help you in your battle against evil.\n\nYou must then travel south " ..
                "of here towards the back of Illidari Point. Hidden in the ether is a vile creature known " ..
                "as Veneratus the Many. My spirit hunter will call him out when he is near.\n\nDestroy " ..
                "Veneratus and take from his corpse the second part of the Cipher of Damnation.",
        },
        [10541] = {
            description = "I thank you, hero. For without you, my spirit would forever remain in this " ..
                "cursed place.\n\n<Ar'tor hands you a spectral lockbox.>\n\nTake it and deliver it to my " ..
                "father at the farm, far to the northeast, above Coilskar Cistern... Inside are " ..
                "Lohn'goron and the second part of the cipher.\n\nHe will be sad to hear news of my " ..
                "death. Promise me that you will assure him that I died a free soul. Tell him that I see " ..
                "the hunting grounds and they are glorious. Tell him that I wait for him there...",
            rewardChoices = {{30936, 1}, {30931, 1}, {30957, 1}, {30971, 1}, {30959, 1}},
        },
        [10546] = {
            description = "While Ar'tor was off hunting and Grom'tor was off fighting, Borak studied. " ..
                "Eventually he took up a vocation as a scholar and left for the wilds of Draenor. He " ..
                "returned home a few years ago a changed orc.\n\nHis heightened sense of awareness and " ..
                "mental acuity had forged a silent assassin.\n\nNow a confident and powerful orc, he has " ..
                "taken to recovering the most guarded piece of the cipher.\n\nFind Borak hiding near " ..
                "Eclipse Point, far to the south. He watches from the shadows of the bridge.",
        },
        [10547] = {
            description = "I'd have given up had I not noticed... He's a Thistlehead. I couldn't place it " ..
                "at first but the signs are all there...\n\nNow if we could get our hands on some " ..
                "bloodthistle, we'd be in business.\n\nIn my travels, I met a shady Broken in Shattrath " ..
                "named Tobias.\n\nTobias made a business of trading bloodthistle to blood elves for " ..
                "rotten arakkoa eggs.\n\nDirectly west of here are arakkoa ruins. Search them for an egg " ..
                "and head to the lower city of Shattrath. That's where you'll find Tobias.",
        },
        [10550] = {
            description = "I wasn't lying. That egg was incredible. Where did you get it from?\n\nWell, " ..
                "if you ever need more bloodthistle, you know where I am and what I need.\n\nHere's a " ..
                "bundle of the stuff. Take it back to your benefactor.",
        },
        [10568] = {
            description = "Years ago, the dreaded warlock known as Gul'dan raised the volcano in the " ..
                "middle of Shadowmoon. The draenei village of Baa'ri, to the southwest, was buried under " ..
                "the lava along with its inhabitants and artifacts of religious importance.\n\nThe " ..
                "treacherous tribe of Broken known as the Ashtongue has been ordered by Illidan to " ..
                "excavate the area. We must use this opportunity to recover the Tablets of Baa'ri, an " ..
                "ancient text rumored to hold the secrets of the Temple of Karabor, now known as the " ..
                "Black Temple.",
        },
        [10570] = {
            description = "<Borak takes the bundle of bloodthistle from you and places it to his " ..
                "nose.>\n\nPungent...\n\nNow, take this bundle and place it at the other end of this " ..
                "bridge. When the envoy makes his daily rounds, he will be compelled to pick it up - " ..
                "without his bodyguard. You see, blood elves look down upon bloodthistle addicts. If any " ..
                "of his compatriots ever found out...\n\nAll you need to do is lie in wait for him to " ..
                "dismiss his bodyguard. When he is alone, make your strike! Kill him and take the missive.",
        },
        [10571] = {
            description = "According to the tablets, an artifact known as a Medallion of Karabor was kept " ..
                "at Baa'ri. Only the highest-ranking draenei priests were granted these, as they allowed " ..
                "unfettered access into the Temple of Karabor.\n\nWe must find out whether the Ashtongue " ..
                "have recovered the medallion that was kept at Baa'ri yet. Its power would provide great " ..
                "aid in our fight against Illidan.\n\nAkama's lieutenant at Baa'ri, Oronu the Elder, " ..
                "receives written orders from him daily. Obtain them and bring them to me.",
        },
        [10574] = {
            description = "According to Akama's letter, four fragments of the medallion were unearthed " ..
                "and given to the Ashtongue Corruptors. These dreaded Broken were once powerful shaman " ..
                "who now defile the very elements they revered.\n\nHaalum, Corruptor of Air, can be found " ..
                "at Netherwing Pass. Eykenen and Uylaru, Corruptors of Earth and Fire, were last seen at " ..
                "the Fel Pits near the Hand of Gul'dan. Lakaan, Corruptor of Water, is rumored to be near " ..
                "Coilskar Point.\n\nFind them and obtain the medallion fragments.",
        },
        [10575] = {
            description = "The fragments you obtained are only half of the medallion. The Ashtongue " ..
                "leader, Akama, must have kept the other half.\n\nI dread to ask this of you, as Akama is " ..
                "both evil and cunning.\n\nHe and the Ashtongue Deathsworn - the vilest and most brutal " ..
                "of the tribe - are rumored to run a torture chamber inside the Warden's Cage.\n\nI want " ..
                "you to find that dreaded prison, and find the whereabouts of Akama. His second in " ..
                "command at the location is a Broken known as Sanoru - interrogate him if you have to.",
        },
        [10576] = {
            description = "<Borak looks you up and down.>\n\nThis is going to be tricky, but I think I " ..
                "can make it work.\n\nI can disguise you as one of these Illidari blood elves, <name>. " ..
                "What I need first, though, are several pieces of their armor. It is imperative that the " ..
                "armor be clean. No blood stains! We want to avoid suspicion.\n\nBring me the gear and " ..
                "I'll take care of the rest of the disguise.\n\nOnce the disguise is assembled, you're " ..
                "going to deliver the message to the Grand Commander - in person.",
        },
        [10577] = {
            description = "Take this disguise and enter Eclipse Point. Once inside, use the disguise to " ..
                "cloak yourself. The Eclipsion blood elves will be unable to see through the disguise, " ..
                "thereby granting you safe passage to Grand Commander Ruusk.\n\nOnce you find Ruusk, tell " ..
                "him where next to move the cipher. You're going to have to act your heart out, <name>. " ..
                "Play it off as if you are his superior, delivering a message from his lord. That should " ..
                "do it!\n\nOh - watch out for the dragonhawks as they see through the disguise.",
        },
        [10578] = {
            description = "That Cipher fragment will never reach Zuluhed. You're going to ambush Ruul the " ..
                "Darkener and his transport before it has a chance to make the delivery.\n\nThe Dragonmaw " ..
                "Fortress is directly east of here, across the Netherwing Fields. Somewhere between " ..
                "Dragonmaw Fortress and the Sanctum of the Stars is where you'll find Ruul. Strike hard " ..
                "and strike fast! And <name>, from the sound of it, this Ruul is going to be tough. Keep " ..
                "your guard up.\n\nReturn the Cipher to me should you succeed.",
        },
        [10579] = {
            description = "Take this box to my father. He still resides at Oronok's Farm, far to the " ..
                "north, above Coilskar Cistern. When all three fragments are pieced together, the ancient " ..
                "words will be known once more.\n\nGood luck, <name>. Tell my father that I will be home " ..
                "soon.",
            rewardChoices = {{30951, 1}, {30962, 1}, {30939, 1}, {30925, 1}, {30967, 1}, {30944, 1}},
        },
        [10587] = {
            description = "Our scouts have reported a massive influx of Sunfury blood elf recruits " ..
                "heading to the Ruins of Karabor. Normally this would represent a purely military threat, " ..
                "however we believe something else is amiss.\n\nDescriptions of their attire and fighting " ..
                "style are suspiciously close to that of Illidan himself. I do not want to become alarmed " ..
                "without good reason, so I would like you to go there and bring me back their weapons. We " ..
                "will then determine whether my fears are unfounded or not.",
        },
        [10588] = {
            description = "How many times has this spell has been used in the history of our worlds? " ..
                "Undoubtedly, its power for destruction is unparalleled.\n\nWhat you must do now is take " ..
                "the cipher, now made whole, and read from it at the Altar of Damnation - where the " ..
                "memory of Gul'dan stands.\n\nWhat you will see once the words are uttered are the " ..
                "memories left imprinted upon the land. Stand your ground and await the coming of " ..
                "Cyrukh.\n\nYou must be victorious, <name>. This land can not withstand another " ..
                "shattering.",
            rewardChoices = {{31036, 1}, {31038, 1}, {31062, 1}, {31071, 1}, {31072, 1}, {31073, 1}},
            rewardItems = {{31074, 1}},
            rewardMoney = 132000,
            rewardXP = 19000,
        },
        [10619] = {
            description = "The Ashtongue tribe is feared among all Broken. It consists of the most " ..
                "vicious and bloodthirsty individuals, handpicked by Akama himself. They are as fierce " ..
                "and ruthless as any naga, demon or blood elf in Illidan's army and they have been " ..
                "deployed in large numbers at the Ruins of Baa'ri, southwest of here. Go there and put a " ..
                "dent in their numbers before they get a chance to mount an attack on us.",
        },
        [10622] = {
            description = "Akama has been tracking your progress quite closely, <name>.\n\nThe Ashtongue " ..
                "you've slain at the Ruins of Baa'ri are amongst the most evil Broken known among us... " ..
                "carefully hand-picked by Akama himself to maintain the facade we need to present to " ..
                "Illidan. The Deathsworn, however, know of Akama's true intentions.\n\nFirst things " ..
                "first. We need to know that you are not with Illidan. A Satyr known as Zandras watches " ..
                "over us from above the prison walls on his behalf. Slay him as proof of your allegiance.",
        },
        [10628] = {
            description = "You've proven what side you're on. I will reveal to you our leader's " ..
                "hideout.\n\nFollow the halls beyond; there will be an underground passage hidden by " ..
                "stagnant water on your right.\n\nI must warn you, <name>. You are not to speak to anyone " ..
                "of what you see there.",
        },
        [10633] = {
            description = "Stories abound about the life of Teron Gorefiend, but most are just that - " ..
                "stories. We do not know what happened to Gorefiend after he returned to Draenor.\n\nThe " ..
                "only thing we are certain of is that he has already died once.\n\nI have heard the " ..
                "scouts here speaking of an ancient orc spirit that resides at the Altar of Shadows, far " ..
                "to the southeast, across the Netherwing Fields and through Netherwing Pass. Take the " ..
                "Spectrecles and track this orc down. He will surely have more information on Gorefiend.",
        },
        [10634] = {
            description = "In life, Gorefiend was a bastard, but in death, Gorefiend was an unmitigated " ..
                "terror.\n\nTo the southeast you will find Netherwing Ledge. What was once part of the " ..
                "mainland of Shadowmoon is now a floating island in the sky.\n\nVhel'kur, spawn of " ..
                "Deathwing, once called it his home, but now knows it as his grave. He flies an endless " ..
                "circle above the island, seething at his defeat to Gorefiend.\n\nIf you are to recover " ..
                "the Gorefiend's armor, it is Vhel'kur that you must defeat.",
        },
        [10635] = {
            description = "Many a cruel act he committed but none so cold as the slaughter of the clerics " ..
                "of Karabor.\n\nAfter Gul'dan's Horde defeated the draenei of Karabor, the surviving " ..
                "clerics of Karabor were marched out, told that they were to be taken to Hellfire Citadel " ..
                "as prisoners of war.\n\nGorefiend, not yet a death knight, murdered each and every last " ..
                "one of them in cold blood. They now roam in front of the Black Temple with vengeance in " ..
                "their hearts.\n\nIt is the clerics of Karabor that hold the cloak of Gorefiend.",
        },
        [10636] = {
            description = "One by one they knelt before him, offering their lives as a show of " ..
                "allegiance. Gorefiend hoisted his sickle and cut clean their heads. Shortly after this " ..
                "slaughter, Gorefiend took his own life.\n\nBut this was no act of contrition! No, " ..
                "Gorefiend sought immortality! From the corpses of the fallen death knights rose the " ..
                "Ghostriders of Karabor.\n\nThey now ride the roads encircling the Hand of Guldan, " ..
                "awaiting the day that their master returns. It is they who hold the truncheon of " ..
                "Gorefiend. Retrieve it...",
        },
        [10637] = {
            description = "The weapons are authentic, as we feared. Illidan is training demon hunters at " ..
                "the Ruins of Karabor and we must put an end to it.\n\nDo not be fooled by their name, " ..
                "<name>, their power will be used against us as often as against any demon.\n\nTheir " ..
                "warlocks summon and subdue demons to be used as part of the initiates' training. A pit " ..
                "lord named Azaloth has proven too strong to be used in training and is kept banished. " ..
                "Find a way to let him loose on his captors. That should buy us the time we need.",
        },
    },
    npcs = {
        [19797] = {
            spawns = {[3520] = {{51.4, 72.4}, {51.4, 72.6}, {51.6, 72.4}, {51.6, 72.6}}},
            zoneID = 3520,
        },
        [20427] = {
            spawns = {
                [3520] = {
                    {28.4, 57.6}, {29.4, 55.8}, {29.4, 56.8}, {29.4, 58}, {29.4, 58.6}, {29.6, 57.8},
                    {30.2, 56.8}, {30.4, 56.4}, {30.6, 56.6}, {30.6, 58}, {30.8, 56.2}, {31.8, 56.4},
                    {31.8, 56.6},
                },
            },
            zoneID = 3520,
        },
        [21425] = {spawns = {[3523] = {{53.4, 42}, {53.6, 42.2}, {54, 42.6}}}, zoneID = 3523},
    },
    objects = {},
    items = {},
}
