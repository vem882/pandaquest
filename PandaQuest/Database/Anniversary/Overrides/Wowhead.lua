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
            rewardMoney = 1500,
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
        [132] = {
            description = "What I am about to tell you could cost me my life. The Defias gang is up to " ..
                "something big. Last I heard they were working in conjunction with various gnolls, " ..
                "kobolds and even goblins.\n\nTake this note to Stoutmantle. It explains as much as I " ..
                "know on the subject.",
        },
        [133] = {
            description = "I live so far from the protection of town, it's a wonder the ghouls and the " ..
                "walking dead haven't eaten me! In fact, just yesterday a pack of Bone Chewers was " ..
                "pounding on the walls of my house!\n\nI want to make an effigy - a kind of \"scarecrow\" " ..
                "for Ghouls. To do that I need some Ghoul Ribs. You can get them from Flesh Eaters, Bone " ..
                "Chewers, Brain Eaters, Rotted Ones and Plague Spreaders.\n\nGet the ribs for me, and I " ..
                "will repay you with some coin.",
            rewardMoney = 2200,
        },
        [134] = {
            description = "A few weeks ago I was picking herbs far from my house, and a band of ogres " ..
                "attacked me! I ran, and I was forced to leave behind a crate of precious tools and " ..
                "herbs.\n\nAfter they chased me off, the ogres swaggered back to the ogre mound in " ..
                "southern Duskwood. I'm sure my crate is somewhere near the mound.\n\nPlease, <name>, " ..
                "retrieve this crate for me for I miss it sorely.",
            rewardMoney = 1400,
        },
        [135] = {
            description = "I wonder what Wiley meant when he mentioned the Stonemasons. Perhaps that was " ..
                "a slip of tongue. Could the Defias gang be related to the Stonemasons? Only one man " ..
                "would know for sure: Mathias Shaw, head of SI:7. Show him Wiley's Note and see if he has " ..
                "anything to add to this growing mystery. If you have trouble finding Shaw, check the " ..
                "Barracks in Old Town.",
        },
        [136] = {
            description = "If ye be readin' this, it means that Ol' Captain Sanders is in a watery grave. " ..
                "So my treasure is yours now, ye jest need to follow the clues.\n\nFirst ye need to find " ..
                "me footlocker. It's probably half-buried in sand by now, along the Western Coast of " ..
                "Westfall near the shipwreck. There be lots of shipwrecks but only one rusty anchor on " ..
                "the coast. Find that anchor and you'll find me locker! Look in there for the next clue.",
        },
        [138] = {
            description = "The clue to the treasure reads: Good work, matey! Now ye need to head due " ..
                "east. East up the bluffs, east to the road. Look for the ol' chimney ruins near the side " ..
                "of the road. There you'll find an old barrel with your next clue.",
        },
        [139] = {
            description = "Searching through the barrel you discover another piece of parchment. This one " ..
                "reads: Now from this here barrel, face ye North. Straight as the crow flies, keep ye " ..
                "walkin' till you see the empty jug next to the lone windmill on the sea bluffs. If ye " ..
                "poke around that jug, ye just might find what you're lookin' for.",
        },
        [140] = {
            description = "Sure enough, deep within the Old Jug there is another clue to Sander's " ..
                "treasure. The ink has run in some places and the paper smells like whiskey but you can " ..
                "make out some of the text: Now that ye found me ol' whiskey jug, you're almost to the " ..
                "treasure! Just face West from the bottle and walk down to the shore. Once ye get to the " ..
                "water, keep going! Swim straight west till you find the island with me treasure chest!",
            rewardItems = {{2842, 1}, {3342, 1}, {3344, 1}, {3343, 1}},
            rewardMoney = 800,
        },
        [141] = {
            description = "The Stonemasons' Guild was run by a man named Edwin VanCleef. VanCleef was " ..
                "responsible for rebuilding Stormwind after the orcs razed it in the First War. " ..
                "Apparently, VanCleef and his men were unhappy with their treatment by the King after the " ..
                "reconstruction was complete. That just might explain a thing or two.\n\nI have written a " ..
                "more detailed account for your Master in Westfall. Take this to him at once!",
        },
        [142] = {
            description = "We need to discover the location of the Defias hideout. <name>, my scout " ..
                "reports that a Defias Messenger has been seen on the roads between Moonbrook, the Gold " ..
                "Coast Quarry and the Jangolode Mine. I want you to capture him. If he resists, kill him " ..
                "and bring me whatever he is carrying.",
        },
        [143] = {
            description = "Something odd is afoot with the Stormwind Army. They should have been here in " ..
                "force by now. Time is a luxury we don't have, however. I will not stand by and watch the " ..
                "people of Lakeshire give their lives without trying to enlist more help. I've heard word " ..
                "of a people's militia forming in Westfall.\n\nTake this plea to their leader, Gryan " ..
                "Stoutmantle. Perhaps Stoutmantle's men can lend some support here until the King sends " ..
                "reserves.",
        },
        [144] = {
            description = "Magistrate Solomon 's note pains me to read. But it is obvious he knows not " ..
                "the war which is waged in Westfall or else he would know better than to expect aid from " ..
                "the Militia. If Stormwind had not deserted us as well, we would not have the need for " ..
                "the Militia.\n\nTake this response to your master in Redridge, <class>. And let him know " ..
                "that my heart is heavy with the loss of good men.",
            rewardMoney = 150,
        },
        [145] = {
            description = "I require your assistance once again. I have written to Lord Ebonlocke, " ..
                "requesting that he sends his trained guards, the Night Watch, to help with Lakeshire's " ..
                "defense. It is imperative this message makes it to him swiftly. You must exercise " ..
                "extreme caution. Ebonlocke is the mayor of Darkshire, in the heart of Duskwood. Do not " ..
                "stray from the roads.",
        },
        [146] = {
            description = "If I did not know Magistrate Solomon personally, I would say the man has gone " ..
                "mad. Send the Night Watch to Lakeshire because Stormwind refuses aid? The Night Watch " ..
                "was formed because Stormwind left us when this foul magic seeped into the land. If I " ..
                "sent my Night Watch, this town would be overrun by evil before the guards even reached " ..
                "the forest's edge.\n\nTake this letter of response to your Master in Lakeshire.",
            rewardMoney = 250,
        },
        [147] = {
            description = "If the \"Collector\" is taking gold from our mines then he's stealing from the " ..
                "kingdom! Bring the Collector to justice, and bring me the ring mentioned in the pickup " ..
                "schedule you gave me. It may tell us whom the Collector is working for...\n\nThat Pickup " ..
                "Schedule says the Collector is hiding out at the Brackwell Pumpkin Patch. You should " ..
                "search for him there.",
            rewardChoices = {{1360, 1}, {1183, 1}},
        },
        [148] = {
            description = "Oh, what is a poor old man to do? I need some supplies from Darkshire, but the " ..
                "village is so far away and I am so old and feeble...I would never make the trip.\n\nCan " ..
                "you go to Darkshire and bring me back some Ghost Hair Thread? You can get it from Madame " ..
                "Eva at her home on the Darkshire square.",
        },
        [149] = {
            description = "There is a poor, sad spirit, Blind Mary, who haunts an old farm house in the " ..
                "hills south of Darkshire.\n\nHere, take this Spectral Comb and ask Blind Mary to comb " ..
                "her hair. Then bring back the comb and I will glean from it the Ghost Hair I'll need for " ..
                "the thread.\n\nAnd take care, for dark things now lurk near that house...",
        },
        [150] = {
            description = "Murlocs are becoming a problem. Larger groups of the fishmen are dropping " ..
                "anchor along the shores of Lake Everstill and fishing up a storm! We need them gone " ..
                "before they eat all the fish in the lake!\n\nHunt murlocs! Bring me eight of their fins " ..
                "and I might have something for you...",
            rewardItems = {{3567, 1}},
        },
        [151] = {
            description = "Poor Old Blanchy! Such a tired beast after all the work we put her through. I " ..
                "fed her before we left the farm, but we weren't expecting the wagon to break on us. If " ..
                "you could bring her a few handfuls of oats from the fields, I'd be grateful.\n\nI bet " ..
                "you could find some around all of the farms in Westfall, if you can steer clear of those " ..
                "horrific machines that have taken over. There are several farms southwest of here.",
            rewardItems = {{2165, 1}, {1537, 1}},
        },
        [152] = {
            description = "You probably noticed all of the shipwrecks along the coast. The Great Sea is " ..
                "treacherous indeed. The coast of Westfall needs to be kept clear, so that if sailors " ..
                "find their way to our beaches, they are safe. The Murlocs are trouble though.\n\nKill 7 " ..
                "Tidehunters, 7 Warriors, 7 Oracles and 7 Coastrunners and I will see to it that you are " ..
                "rewarded.",
            rewardMoney = 1100,
        },
        [153] = {
            description = "The Defias Front is constantly shifting. I've been following their movements " ..
                "for quite some time now. On a side note, I've ascertained that many members of the gang " ..
                "can be tracked by the Red Leather Bandanas they wear.\n\nBring me 15 of these Bandanas " ..
                "and I'll see to it you are rewarded.",
            rewardChoices = {{3511, 1}, {5944, 1}, {12295, 1}},
        },
        [154] = {
            description = "NO!!!!!\n\nTake it, take this comb away from me!\n\nI'm a monster, and no one " ..
                "will ever think me lovely again!",
            rewardMoney = 175,
        },
        [155] = {
            description = "So Stoutmantle sends a scrawny <race> like you to protect me? Guess you'll " ..
                "have to do. Better bring some friends too.\n\nYou know the deal, right? You watch my " ..
                "back and I'll take you to the Defias hideout. But you better be close by my side. The " ..
                "Defias gang wants my head now. If they see me with you, they'll try to kill me.\n\nLet " ..
                "me know when you and any friends you can round up are ready to go.",
        },
        [156] = {
            description = "If you bring me some rot blossoms then I can brew you up a batch of zombie " ..
                "juice.\n\nrot blossoms grow in strange places. In particular, I hear you can find them " ..
                "inside the skulls of Skeletal Horrors and Skeletal Fiends... not that I've gotten close " ..
                "enough to look!\n\nThe Raven Hill Cemetery is lousy with those skeletons. You may as " ..
                "well get rid of them while you're looking for rot blossoms. The town of Darkshire would " ..
                "be grateful.",
        },
        [157] = {
            description = "Here is your thread, <name>. It has a thousand uses, from binding evil spirits " ..
                "to sewing life into inanimate objects.",
            rewardMoney = 1300,
        },
        [158] = {
            description = "I need a bottle of a certain liquor - Zombie Juice. Tavernkeep Smitts at the " ..
                "Scarlet Raven Tavern in Darkshire should have some.\n\nAnd please hurry, <name>. These " ..
                "nights get cold, and I need that drink to put fire in my veins again!",
        },
        [159] = {
            description = "Here's your Zombie Juice...\n\n...and be careful with this stuff. It's strong " ..
                "enough to raise the dead!",
            rewardMoney = 1700,
        },
        [160] = {
            description = "Take this note to Ello Ebonlocke, the Mayor of Darkshire.\n\nHe and I are old " ..
                "friends...and when he reads it and discovers what you did for me...I'm sure he'll be " ..
                "just as happy as I am! Hahahaha!",
        },
        [161] = {
            description = "If my suspicions are correct, this is some type of explosive powder. This must " ..
                "be analyzed by an explosives expert so we know just what we're dealing with here. Ashlan " ..
                "Stonesmirk was assigned to the regiment guarding Dun Modr and the Thandol Span. I need " ..
                "you to make a grave and perilous journey, <name>.\n\nTravel through the Algaz Gate, " ..
                "follow the road through the Wetlands and seek out Stonesmirk in Dun Modr. Heed my " ..
                "advice: stick to the roads and stop for nothing!",
        },
        [162] = {
            description = "I urge you to take this report to someone who has working knowledge in this " ..
                "kind of thing.\n\nI know this night elf scholar named Gracina Spiritmight. She's spent a " ..
                "lot of time studying life forms that are unique to the ecology of Azeroth; she's a " ..
                "historian to boot! If you want someone to help figure out what exactly this threat is, " ..
                "and more importantly how to stop it, give her the report. We'll need the help.\n\nLast I " ..
                "heard, she was residing in the Temple of the Moon, located in Darnassus.",
        },
        [163] = {
            description = "Something's amiss at Raven Hill, <name>. Calor swears that someone--or " ..
                "something--is haunting the buildings there. Two nights running he's noticed the shadows " ..
                "moving, and the third before that he says he saw light in one of the windows.\n\nIf, as " ..
                "you say, you care about the safety of Duskwood, find out what monster haunts in Raven " ..
                "Hill.",
        },
        [164] = {
            description = "Do you know Sven? Now, there is a man who does the work of the Light! He and " ..
                "his followers keep a camp at the northwestern edge of Duskwood.\n\nUnfortunately, " ..
                "because they are so few, they cannot even spare a man to fetch supplies from town. Will " ..
                "you deliver these supplies to him?",
            rewardMoney = 800,
        },
        [165] = {
            description = "There was an old man who used to come into town to buy supplies rather " ..
                "frequently, but I haven't seen him for quite some time now. He lives out in a shack " ..
                "overlooking Raven Hill cemetery, if I remember correctly. Perhaps you should go see if " ..
                "something is amiss.",
        },
        [166] = {
            description = "There is but one task left for you to complete. Edwin VanCleef must be " ..
                "assassinated. While it saddens me to condemn any man to a death sentence, it is for the " ..
                "greater good of the people of Westfall that VanCleef is laid to rest once and for all. " ..
                "Bring me the villain's head once the deed is done.",
            rewardChoices = {{6087, 1}, {2041, 1}, {2042, 1}},
        },
        [167] = {
            description = "We were deep in a vast mine in Westfall, hidden beneath a barn in Moonbrook. " ..
                "No clue where these stinkin' thieving types came from. Anyway, the mine tunnel collapsed " ..
                "on us. I got out but the others... well... the others haven't been heard from.\n\nYou " ..
                "look like you might have better luck in there. If you could look for my brother, I'd be " ..
                "thankful. He always carried his Explorers' League Badge. If you can't find him, that " ..
                "badge would at least give me some peace of mind.",
            rewardItems = {{1893, 1}},
        },
        [168] = {
            description = "Many of my friends perished that horrible day when the mine tunnel caved in. " ..
                "If your adventures happen to bring you into that wing of the mine in Moonbrook, please " ..
                "keep an eye out for any sign which might identify them. If you come across any of their " ..
                "Miners' Union Cards, bring them back to me and I'll make sure their families get some " ..
                "resolution from this horrible accident.",
            rewardChoices = {{2037, 1}, {2036, 1}},
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
        [170] = {
            description = "I hope you're here to lend us a hand, <class>. After the last trogg attack, we " ..
                "could use all the help we can get.\n\nI hear the buggers have been popping up all across " ..
                "the lands, and it seems Coldridge Valley is no exception. They've been spotted all over " ..
                "the hills to the southeast and near the frozen lake.\n\nAnd that's not all, just a few " ..
                "nights ago, they attacked and overran our camp to the west!\n\nWe're a bit shorthanded " ..
                "here, <lad/lass>, and we need strong arms to help drive the troggs back.",
            rewardChoices = {{6185, 1}, {2172, 1}, {6173, 1}},
        },
        [173] = {
            description = "Darkness seems drawn inexorably to Duskwood. Master Carevin's quest is the " ..
                "expulsion of evil and heresy. Through our efforts are the people of Darkshire kept " ..
                "safe.\n\nYou believe yourself worthy to join us?\n\nI once thought as you. Disillusioned " ..
                "by the complacency of the Watch, I joined Master Carevin. If you wish to prove yourself, " ..
                "it will not be through words.\n\nTest your skills against the Nightbane Shadow Weaver " ..
                "worgen in Brightwood Grove--bright, hah!--and the Rotting Orchard.",
            rewardMoney = 1800,
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
        [423] = {
            description = "After examining Arugal's work my worst suspicions were confirmed. The old hack " ..
                "was not qualified to clean chamber pots in Dalaran let alone represent the Kirin Tor in " ..
                "its most dire hour. Fools!\n\nArugal used enchanted items to reinforce his weak magic. I " ..
                "need to examine these items first hand. Travel forth and slay Moonrage Gluttons and " ..
                "Moonrage Darksouls until you have collected enough of their enchanted shackles for my " ..
                "research. The foul creatures have been seen to the north and east.",
            rewardMoney = 600,
        },
        [424] = {
            description = "It will indeed take me longer than I had thought to uncover the dark secrets " ..
                "behind the enchantments Arugal was using.\n\nBut in the meantime I need you to take care " ..
                "of a slight problem our Darkstalkers have discovered. It seems that Arugal let his magic " ..
                "spread to the Deep Elem Mine in the hills to the southeast.\n\nThe mine would prove to " ..
                "be quite a resource for Varimathras's advance.\n\nI want you to behead the tainted " ..
                "foreman of the mine, Grimson the Pale. With his death, the mine shall be ours.",
            rewardMoney = 700,
        },
        [444] = {
            description = "I have reduced the ichor you brought me and separated it into its base " ..
                "components. My findings are not conclusive, but I have determined that warlock and " ..
                "necromantic magics were used in the ichor's creation.\n\nWhile I continue to study the " ..
                "ichor, I want you to take a sample to Bethor Iceshard in the Undercity. Bethor is not an " ..
                "apothecary, but his knowledge of magic may help to unravel the mystery of the rot " ..
                "hides.\n\nGo. You will find Bethor in the Magic Quarter of the Undercity.",
        },
        [460] = {
            description = "You don't look like a rot hide. Good. I had lost hope...\n\nMy name is Alaric, " ..
                "and I was once Thule's head servant and bodyguard. He used his magic to \"protect\" me " ..
                "from the Plague of Undeath, but instead his spell gave me an unlife from which I cannot " ..
                "escape. And after creating the cursed rot hide gnolls, Thule beheaded me... and gave my " ..
                "head to the gnolls as a plaything!\n\nPlease, take me to my body. I believe the gnolls " ..
                "buried it here in Fenris Keep, near the stable, in an unmarked grave.",
        },
        [471] = {
            description = "I sent my apprentice out into the marshes to skin some of our famous giant " ..
                "Wetlands crocolisks. When he didn't return, I went out to look for him... Let's just say " ..
                "it wasn't a pretty sight.\n\nMidwife says he might pull through, but in the meantime I " ..
                "still need my skins!\n\n...If you'd like to kill a few more of the brutes, I wouldn't be " ..
                "opposed, after what they did. You'll find the crocs north up the coast, beyond the " ..
                "murloc hovels.",
            rewardChoices = {{2545, 1}, {3561, 1}},
            rewardItems = {{3681, 1}},
        },
        [493] = {
            description = "The Royal Apothecary Society is under extreme pressure from the Dark Lady to " ..
                "develop a New Plague. We are working diligently and have made much progress. It is our " ..
                "belief that the success will be achieved much faster if we share information amongst the " ..
                "Society.\n\nFor that reason I want you to deliver my latest findings to Apothecary Lydon " ..
                "in Tarren Mill, a small town nestled in the Hillsbrad Foothills. The journey will be a " ..
                "long one.\n\nHead south and stick to the roads. Follow the signs closely!",
            rewardMoney = 900,
        },
        [516] = {
            description = "I have received reports that a group of undead are holing up to prepare for an " ..
                "attack against us. Armed with this information, we can turn the tables and attack them " ..
                "first, nipping their little plan in the bud.\n\nUnfortunately, my information is spotty, " ..
                "at best. They are reported to be hiding in a location known as Beren's Peril. The exact " ..
                "location is unknown, but it appears to be a cave in the hills, near a pocket of Dalaran " ..
                "wizards.\n\nI trust your resourcefulness. Find them, and put them down.",
            rewardItems = {{5252, 1}},
        },
        [632] = {
            description = "It seems as though poor Ol' Rustlocke ran into a Dark Iron ambush. You notice " ..
                "a parchment next to his clenched fist.\n\nReport the grim news to Rhag Garmason and show " ..
                "him what you found.",
        },
        [642] = {
            description = "My name is Myzrael. I am a princess of the earth, and my captors, the giants, " ..
                "have trapped me deep beneath the Arathi Highlands. These crystal shards are the only way " ..
                "I can speak with the surface world.\n\nPlease help me. Allies of the giants, the " ..
                "Drywhisker Kobolds, have a shard like this one in their Drywhisker Gorge, to the east. " ..
                "To power the cluster, you must gather Motes of Myzrael from the kobolds and apply them " ..
                "to it.\n\nI beg you, <name>, aid me!",
        },
        [643] = {
            description = "Though they can barely be said to control Stromgarde, let alone the whole of " ..
                "Arathi Highlands, the human prince trots the remnants of his cavalry over the " ..
                "countryside. I can't understand why he does it, but who understands the way the humans " ..
                "think, hm?\n\nWhatever his reasoning, more importantly, he has given one of the sigils " ..
                "to Lieutenant Valorcall, their cavalry leader. Locate him and bring his sigil back to me.",
            rewardMoney = 5500,
        },
        [783] = {
            description = "I hope you strapped your belt on tight, young <class>, because there is work " ..
                "to do here in Northshire.\n\nAnd I don't mean farming.\n\nThe Stormwind guards are hard " ..
                "pressed to keep the peace here, with so many of us in distant lands and so many threats " ..
                "pressing close. And so we're enlisting the aid of anyone willing to defend their home. " ..
                "And their alliance.\n\nIf you're here to answer the call, then speak with my superior, " ..
                "Marshal McBride. He's inside the abbey behind me.",
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
        [833] = {
            description = "Only the most valiant tauren are laid to rest at Red Rocks, our sacred burial " ..
                "ground. It is an honor bestowed upon the great warriors who helped found and defend " ..
                "Thunder Bluff and those who have given their lives for the greater good of their tribes " ..
                "and chieftains.\n\nBut it appears a foul menace has made its way onto our holy land. A " ..
                "band of Bristleback Interlopers is ravaging the grave site and I am too old and past my " ..
                "prime to drive them away.\n\nThey must be driven off with force, <name>.",
            rewardMoney = 250,
        },
        [844] = {
            description = "Your first prey will be easy.\n\nThe plainstriders to the east have been " ..
                "harassing our food supplies and have become a nuisance.\n\nPut down the plainstriders " ..
                "and return to me with their beaks.",
            rewardMoney = 500,
        },
        [870] = {
            description = "Long ago, the Barrens was a lush place, teeming with life. But war and " ..
                "cataclysm raged across the land, scorching it and leaving a dry husk. Such is the way of " ..
                "things, and it saddens my heart.\n\nBut within the past few years, new oases have formed " ..
                "in the Barrens, and life stirs. And deep down, we druids sense a power leaking its way " ..
                "to the surface.\n\nWe must find its source. Travel to the Forgotten Pools, northwest of " ..
                "the Crossroads. Search its waters for a source of power, then return here.",
        },
        [880] = {
            description = "Your findings are incredible, <name>. These oases hold properties that must " ..
                "come from an outside source. Or perhaps an inside one.\n\nI want to know how these " ..
                "fissures are affecting the beasts who drink from the oases' water.\n\nHunt oasis " ..
                "snapjaws at the Lushwater and Stagnant Oases. Bring me their shells so I may examine " ..
                "them.",
            rewardMoney = 800,
        },
        [886] = {
            description = "The druids of Thunder Bluff sense a strange power leaking into the Barrens, " ..
                "east of Mulgore.\n\nTonga Runetotem was sent to discover the source of this power, but " ..
                "we fear he will need aid.\n\nTravel to the Barrens and speak with Tonga. He will be at " ..
                "the Crossroads. To reach there, take the road east out of Bloodhoof village. Enter the " ..
                "Barrens, then turn north when the road forks. Continue north and you will find the " ..
                "Crossroads.\n\nAnd do not leave the road, <name>, for the Barrens is a harsh land.",
        },
        [887] = {
            description = "I sure wish Vice Admiral Grezzlik did a better job of keeping the seas safe " ..
                "for our trading vessels. With all the gold the trade princes have poured into the Trade " ..
                "Fleets, it ticks me off to see so many pirates running willy-nilly, raiding my ships and " ..
                "stealing my goods!\n\nI heard that the Southsea Freebooters have set up a camp just " ..
                "south of here. They've been a real thorn in my side and if Grezzlik won't take care of " ..
                "them, well, maybe you can help me get rid of them.",
            rewardMoney = 500,
        },
        [892] = {
            description = "Everything looks square from my records, <name>. Go on back and tell Gazlowe " ..
                "he's out of luck. I wouldn't be surprised if it was the pirates that nabbed his " ..
                "goodies.\n\nNothing else I can do for him. Oh... though you could tell him that I've got " ..
                "some things from Undermine for him, when he has the time to come pick them up.",
        },
        [902] = {
            description = "Pulling open the face of the control console reveals a dense jumble of wires, " ..
                "tubing and other strange mechanical objects--most of which seem to serve no practical " ..
                "purpose. Pushing them aside and digging deeper into the console, you find the " ..
                "samophlange. A tug removes it from its housing.",
            rewardChoices = {{5324, 1}, {5325, 1}},
        },
        [905] = {
            description = "Now, <name>, the hunt deepens. Now you must defeat your prey, and then find " ..
                "your way to its lair.\n\nHunt the sunscale raptors to the south. Slay them and remove " ..
                "the feathers they wear. Place the feathers on the scytheclaw nests southwest of the " ..
                "Stagnant Oasis. Show their brethren you do not fear them!",
            rewardMoney = 900,
        },
        [929] = {
            description = "First, let me tell you more of the task you must complete. The druids in " ..
                "Darnassus use the water of the moonwells of Teldrassil, and their moonwell must be " ..
                "replenished from time to time. Using these specially crafted phials, you can collect the " ..
                "water of the moonwells.\n\nTake this vessel to the moonwell outside of Starbreeze " ..
                "Village to the east, and fill it with some of its waters, then return to me. When you " ..
                "have completed your task, I shall continue the story where Tenaron left off...",
        },
        [936] = {
            description = "Excuse me <class>, but I'd like just a moment of your time if possible.\n\nThe " ..
                "Cenarion Circle in Thunder Bluff is most interested in seasoned adventurers such as " ..
                "yourself to lend them aid in a vital research project. While I do not know the " ..
                "specifics, I can inform you that none other than Hamuul Runetotem is spearheading this " ..
                "research.\n\nPlease - if you are interested, speak with him directly on the Elder Rise " ..
                "within Thunder Bluff proper.",
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
        [990] = {
            description = "<name>, my mistress, Raene Wolfrunner, awaits you in the city of Astranaar " ..
                "within Ashenvale. With your help, perhaps we can at least ease some of the corruption " ..
                "that's taken hold there.\n\nHead south from here and stay close to the road--you'll find " ..
                "your way there without issue if you follow those directions.",
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
        [1011] = {
            description = "The Forsaken, the undead arm of the Horde, have crept into Ashenvale, lurking " ..
                "at our ruins and our barrows. We believe their goal is to spread disease amongst the " ..
                "lands of the night elves. We must confirm this!\n\nThe Forsaken have a camp south of " ..
                "here, near the Dor'Danil Barrow Den, where they create poisons and diseases and place " ..
                "them in bottles. Fight your way into that camp and steal a bottle of disease. Return " ..
                "with such a bottle. I will test it and find its purpose.",
        },
        [1014] = {
            description = "Arugal still resides in Shadowfang Keep. We cannot claim Silverpine as a " ..
                "strategic stronghold for the Dark Lady until Arugal is slain.\n\nI shall see to it that " ..
                "his magic is eradicated, <name>. But I leave it in your hands to see that Arugal meets " ..
                "the death he so deserves.\n\nTravel to Shadowfang Keep and put an end to Arugal's foul " ..
                "spells once and for all. Bring to me the vile wizard's head!",
            rewardItems = {{6414, 1}},
        },
        [1023] = {
            description = "As you rummage through Teronis' belongings, you find a journal that is still " ..
                "in good condition.\n\nYou take the journal and leave Teronis' corpse as is.\n\nThe only " ..
                "thing left to do is find the gem Teronis was seeking. Raene mentioned it being in the " ..
                "area. Perhaps the murlocs have it...",
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
        [1035] = {
            description = "Relara's fever has passed, but she is still very weak. I do not believe time " ..
                "alone will give her back the strength she has lost. I believe it will take the power of " ..
                "a moonstone.\n\nWe used to gather moonstones at Fallen Sky Lake to the southeast... " ..
                "until the Shadethickets came.\n\nTheir leader, a Shadethicket Oracle, gathered up all " ..
                "the fallen moonstones and hoards them. Now, you must retrieve a moonstone from the " ..
                "Oracle.\n\nAnd to do that, I fear that you must slay him.",
            rewardChoices = {{5814, 1}, {6722, 1}, {17047, 1}},
        },
        [1043] = {
            description = "Your story rings true... I do not entirely understand your motives, but if " ..
                "your business here in Duskwood involves ridding the forest of worgen in any number, then " ..
                "I can forgo understanding for results.\n\nThere is a mine to the south that has been " ..
                "overrun with worgen... They appeared out of nowhere, but from what we know, that is " ..
                "where they first were found.\n\nGo about your business, but I would ask that if you find " ..
                "anything of import, you share it with me. We will accept any aid in our war against evil.",
            rewardMoney = 2500,
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
        [1083] = {
            description = "I'm unsure what the Venture Co. did to the Vale, but it's obvious they were " ..
                "overpowered by the creatures there.\n\nThey set the forest aflame, and used their " ..
                "inventions of destruction to decimate as much of the Vale as possible.\n\nBut in their " ..
                "ignorance they also released something else: burning spirits, elementals of flame, stone " ..
                "and rage.\n\nThe land has no chance to see Elune's smile while these creatures roam " ..
                "free.\n\nBring me their smoldering embers to show you've reduced their numbers.",
            rewardMoney = 2000,
        },
        [1132] = {
            description = "Oh, to be at sea once again! To feel the kiss of the wind, and to have the " ..
                "waves rock me like my blessed mother, long ago!\n\nOh, I wish I had your fortune, good " ..
                "<class>, for I see the sea in your future!\n\nIt's my job to tell eager souls of the " ..
                "land of Kalimdor, the land of opportunity! If you're willing to try your luck across the " ..
                "sea, then take a ship from here to the lovely port of Auberdine. Speak there with my " ..
                "partner, the elf, Fiora Longears.\n\nShe'll start you on your Kalimdor adventure!",
        },
        [1150] = {
            description = "I'm pleased to see your courage remains steadfast in light of what you've " ..
                "already done. Since your faith is intact, the time has come to test your body.\n\nFirst " ..
                "is a test of endurance. Go to the Roguefeather Den west of Freewind Post. Make your way " ..
                "to the depths of their lair and destroy their foodstuffs. By then you should have " ..
                "provoked their fury, and if you are able to survive long enough, Grenka Bloodscreech " ..
                "herself will come for you--kill her and bring me her claw to complete your test.",
        },
        [1359] = {
            description = "The wolf hearts you acquired possess a quality unseen in similar specimens. " ..
                "There is a toxicity to them that should be deadly to the very wolves in which the hearts " ..
                "beat!\n\nIt's quite incredible, and we must study it further. I kept a few samples of " ..
                "the hearts acquired. Take them to my colleague, Apothecary Zinge. You will find her in " ..
                "our headquarters in the Undercity.",
        },
        [1462] = {
            objectivesText = {"Speak to Seer Ravenfeather for another Earth Sapta."},
            rewardItems = {{6635, 1}},
        },
        [1698] = {
            description = "Yorus Barleybrew has issued a challenge to all able warriors of the Alliance. " ..
                "He waits at the Lakeshire Inn, in Redridge, and pledges a grand reward to anyone able to " ..
                "pass his trial.",
        },
        [1718] = {
            description = "Your renown as a warrior grows, <name>. Now it is time to pit yourself against " ..
                "your peers and see where you stand.\n\nThere is an island off the coast of the Barrens, " ..
                "south of Ratchet. It is called Fray Island and it is a place where warriors " ..
                "meet.\n\nMeet, and fight.\n\nSpeak with the chief warrior of Fray Island, Klannoc " ..
                "Macleod. If he finds you worthy, then Klannoc will lead you further down the warrior's " ..
                "path.\n\nTo reach Fray Island, search for the sand bar shallows along the Merchant Coast.",
            rewardXP = 610,
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
        [1947] = {
            description = "Now it is time for you to earn your mage's wand. To begin this quest, speak " ..
                "with the human hermit Tabetha in Dustwallow Marsh. You will find her shack deep in the " ..
                "marsh, west of Theramore.\n\nSpeak with her, for her knowledge is vast. You will find " ..
                "Tabetha 's cottage west of Theramore, and just north of the Stonemaul Ruins.",
        },
        [1953] = {
            description = "It is time, <name>, for you to speak with Tabetha... the hermit of Dustwallow " ..
                "Marsh. She will instruct you on the creation of a powerful mage's implement.\n\nTabetha " ..
                "'s shack lies deep in Dustwallow Marsh, west of Theramore.",
        },
        [2139] = {
            description = "The survival of our people and lands comes at unfortunate costs, " ..
                "<name>.\n\nYou have spilled the blood of nature's servants; many sick animals you have " ..
                "felled. The people of Auberdine are indebted to you, for the forest's pain is eased - " ..
                "even if only for a moment.\n\nI have one final task for you, but be warned, you will " ..
                "have to kill again. It is my hope that this will be the last time I call upon you, " ..
                "<name>.\n\nIn a cave to the northeast, near Bashal'Aran, resides the Den Mother. Slay " ..
                "her.",
            rewardChoices = {{7738, 1}, {7739, 1}},
        },
        [2440] = {
            description = "I shall focus my energies on these discs; they will reveal their true workings " ..
                "to me in due time.\n\nAs for you <name>, I will now reward you for your diligence in " ..
                "bringing this to my attention. Take this voucher to Bena Winterhoof, the alchemy trainer " ..
                "for Thunder Bluff. She will give you a special item I believe you will find appealing, " ..
                "and she will supply you with a choice of potions from my personal stock.\n\nReturn to me " ..
                "soon, as I sense there is much more at hand for us to do regarding this find.",
            rewardChoices = {{3928, 5}, {6149, 5}},
            rewardItems = {{9587, 1}},
        },
        [2498] = {
            description = "I have just received word that Denalan at Lake Al'Ameth has discovered what " ..
                "may be the cause of the tumors that plague the timberlings. Please speak with him, and " ..
                "tell him I sent you.\n\nMake haste, <name>; he needs our help.",
        },
        [2861] = {
            description = "Rumor is that Tabetha, a mage colleague who lives deep in Dustwallow Marsh, " ..
                "has a bone to pick with a certain sand troll in Zul'Farrak. If you speak with Tabetha " ..
                "she can tell you more.\n\nAnd bring some friends with you, <name>. If Tabetha has you go " ..
                "to Zul'Farrak then you're not going to want to go alone.\n\nYou will find Tabetha 's " ..
                "cottage west of Theramore, and just north of the Stonemaul Ruin.",
        },
        [2976] = {
            description = "What?!\n\nAh, so I did mention a bounty, didn't I? Well, that'll teach me to " ..
                "open my mouth, won't it?\n\nYou did the work, so I suppose it is only right you reap the " ..
                "greatest reward from it. Take the horns, I'll have them put in a crate for you. Find " ..
                "Belgrom Rockmaul in the Valley of Honor, he'll want to know what you saw and he'll " ..
                "reward you for your hard work.\n\nBe well, <class>, and thank you again for everything " ..
                "you've done.",
            rewardChoices = {{11858, 1}, {11859, 1}},
            rewardMoney = 6500,
        },
        [3454] = {
            description = "The torch must now be bound to its owner. Pick up the torch, <name>.",
            rewardItems = {{10515, 1}},
        },
        [3462] = {
            description = "Speak with my envoy, Squire Maltrake. He will further instruct you as to the " ..
                "use of the Torch of Retribution.",
        },
        [3513] = {
            description = "The official-looking scroll is wrapped tightly with a silvery ribbon. You're " ..
                "sure someone would be interested in seeing this, but who?\n\nThere is an outpost close " ..
                "to the Ashenvale border to the north, and if the information on this scroll involves the " ..
                "night elves, this would be the place to take it.",
        },
        [3514] = {
            description = "This scroll is from that scheming dryad Rynthariel, Keymaster of the Talon Den " ..
                "on Stonetalon Peak.\n\nShe'll not be making any more contact with the messenger you " ..
                "looted this from, heh, but we must stand our ground here. The Horde will not tolerate " ..
                "her outrunners here.\n\n<name>, travel to the Talon Den. Kill Rynthariel, and then put " ..
                "up a symbol for all to see. Take this Horde flag, <name>. Put it up in the Talon Den so " ..
                "that they will not be so rash as to send another messenger through our territory again.",
            rewardChoices = {{10653, 1}, {10654, 1}},
        },
        [3541] = {
            description = "I have a fence in Orgrimmar. He resides in The Drag. He's difficult to nail " ..
                "down if you don't know where to look, but if you go looking in one of the highest " ..
                "buildings there you should have no problem finding him.\n\nDo me a favor though, don't " ..
                "go shouting to all of Kalimdor that he's there and what his business is--it'd be bad for " ..
                "both of us.\n\nHe'll give us more than a fair price for the Tablet of Jin'yael. I'm not " ..
                "sure why, but you should have seen how excited he was to hear about its whereabouts.",
            rewardMoney = 4000,
        },
        [3565] = {
            description = "What is it? Oh yes, your payment. Of course.\n\nTake this and be off with you. " ..
                "I'm sure Jediga is awaiting oh so patiently for your return.",
            rewardMoney = 6000,
        },
        [3601] = {
            description = "Kim'jael indeed!! Do you know what Kim'jael means to the Blood elves, <name>? " ..
                "Little rat... or something like that. The big bullies!\n\nThey hired me to help them " ..
                "scout the area looking for some sort of lost treasures. Of course I jumped aboard the " ..
                "moment they said \"treasure\" and the amount they were willing to pay, but of course, " ..
                "they turned on me and tried to kill me... ME!\n\nGoes to show you, you can't trust a " ..
                "Blood elf.\n\nThe problem is, they still have my equipment and I can't get it back. Help " ..
                "me out?",
            rewardItems = {{10830, 3}},
            rewardMoney = 800,
        },
        [3630] = {
            description = "Engineering at the expert level breaks into two disciplines: gnome and goblin. " ..
                "Gnome engineering represents by far the superior of the two! It's about the construction " ..
                "of wonderful gadgets and devices that make life better!\n\n<name>, read this manual. If " ..
                "you want to learn more on gnome engineering, then take that manual to Tinkmaster " ..
                "Overspark in Ironforge. Remember - membership is permanent and prevents joining the " ..
                "other discipline, so make sure you are sure before finishing his task!",
        },
        [3633] = {
            description = "Expert engineering yields two distinct disciplines: gnome and goblin. Clearly, " ..
                "goblin engineering is the choice of all brilliant engineers. Learn to master the world " ..
                "through the judicious use of high explosives and fantastic gear!\n\n<name>, read this " ..
                "manual. If you want to learn about goblin engineering, then take it to Nixx " ..
                "Sprocketspring in Gadgetzan. Remember - membership is permanent and prevents joining the " ..
                "other discipline, so make sure this is what you want before finishing his task.",
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
        [3782] = {
            description = "With what we call an Evergreen Pouch, we have cultivated Tharlendris seeds in " ..
                "the soil from Un'Goro Crater. These seeds have blossomed into an array of random, potent " ..
                "herbs. One result is morrowgrain, a mysterious herb we know little about; I very much " ..
                "hope to unravel this mystery for the Circle.\n\nTake this voucher over to my daughter " ..
                "Bashana, and she will give you some seeds so you may assist us. If you run out, you will " ..
                "need to purchase more from her.",
            rewardItems = {{11022, 20}},
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
        [4243] = {
            description = "Unfortunately, something's happened to one of my greatest inventions. You've " ..
                "seen mechanical squirrels, yes? Well, to get closer to the apes of Un'Goro Crater, I " ..
                "created a mechanical ape to blend in with their kind--I call her A-Me 01.\n\nShe has " ..
                "scrying gems for eyes so I could see everything she saw. She made it to Fungal Rock--the " ..
                "apes' lair--just east of here, and that's when I lost contact. The last thing I saw was " ..
                "one of their alpha males rushing up to say hello to her!\n\nCan you help me find her?",
        },
        [4244] = {
            description = "A little further investigation shows a panel that slides open. Clearly written " ..
                "above some wiring is the statement, \"Replace Mithril Casing And Turn Power Off Then " ..
                "On.\"\n\nTaking a moment to replace the panel, you wonder if it'll be that simple to fix " ..
                "A-Me 01 and get her back to Karna Remtravel near Marshall's Refuge.\n\nOnly trying it " ..
                "will tell.",
        },
        [4561] = {rewardItems = {{15102, 1}}},
        [5023] = {
            description = "You pick up the package, wiping off a small layer of dust and grime that had " ..
                "settled on it. It is addressed in a hurried hand to a Jeremiah Felstone of Lordaeron; " ..
                "the delivery of the package is dated for well over four years ago.\n\nThough it is " ..
                "unclear if Jeremiah Felstone is even alive, it is widely known that the Undercity, " ..
                "formerly known as Lordaeron, keeps records on the populace of the city. This is handled " ..
                "through the Royal Overseers of the Undercity Census.",
        },
        [5050] = {
            description = "It would seem that I was wrong about you <name>, and for that I owe you an " ..
                "apology. My sister sent me a number of personal effects, including humorously enough the " ..
                "deed to the Felstone farm. I think I'll pass on reclaiming it right now.\n\nIf my " ..
                "sister's spirit remains tethered to the farm and cannot rest, please... could you return " ..
                "this to her? It is half of a good luck charm she had, with her husband having the other " ..
                "half.\n\nMaybe her knowing I have these things will now put her soul to rest.",
        },
        [5097] = {
            description = "Through the use of a magical device known as a beacon torch, we can mark " ..
                "targets of our choosing for future actions by our troops. To that end, we think the " ..
                "Scourge are using Andorhal's watchtowers as a means to control their troop " ..
                "movements.\n\nYour mission: breach Andorhal's defenses to plant beacons at all four " ..
                "watchtowers. You'll need to be in the doorway of each tower to plant the beacon; it will " ..
                "then proceed to mark the tower. There are only five charges on the beacon torch, so use " ..
                "them wisely!",
            rewardMoney = 8500,
        },
        [5181] = {
            description = "The Annals of Darrowshire tells of the villains of that battle. It tells how " ..
                "the ghoul lord Horgus the Ravager was destroyed by Alliance forces during the battle. " ..
                "His body was cast into a lake, northwest of Corin's Crossing, and his skull remains " ..
                "there.\n\nMarduk the Black was never defeated, but his fabled sword was shattered and " ..
                "lost. It lies at the bottom of the gorge west of Corin's Crossing.\n\nRetrieve these " ..
                "items, <name>. I know not why, but I am certain their fate lies with you.",
        },
        [5216] = {
            description = "Of the four cauldrons here in the west, the one located at Felstone Field may " ..
                "be the easiest one in obtaining access to. The Scourge have greener troops positioned " ..
                "here, though they should not be underestimated.\n\nGo to Felstone Field, northwest of " ..
                "Andorhal, and engage the cauldron lord there. We think it has a key that will unlock " ..
                "access to the cauldron. When unlocked, use this bottle to obtain a sample of the poisons " ..
                "inside the cauldron; we'll need it for study in developing a counter agent.",
        },
        [5401] = {rewardItems = {{12846, 1}}},
        [5464] = {
            description = "The soul of the fallen clings to that which represents its former life and " ..
                "transforms the item into a soulbound keepsake. You pick the item up and place it in your " ..
                "pack.",
        },
        [5533] = {
            description = "On the island of Caer Darrow lies Scholomance - a wretched center of Scourge " ..
                "necromancy and evil. Our enemy dwells within, conducting unspeakable acts of depravity " ..
                "on unwitting victims... at least, we surmise as much. A door bars the way, and try as we " ..
                "might no entry is to be had without a proper key.\n\nAlchemist Arbington is well versed " ..
                "on Scholomance, and has an idea how to obtain a key. You have proved your worth to me, " ..
                "and now I entrust this task to you. Speak with him on this matter.",
        },
        [5647] = {
            description = "Your race is so very strong, <name>. We are proud to call you allies. And as " ..
                "each day's sun sets, you and your kin grow closer to not only finding your true origins, " ..
                "but find great confidence that you are on the right path in so many things. That feeling " ..
                "must make you feel so triumphant.\n\nWord came from Ironforge just recently. It asked " ..
                "that you return there and speak to High Priest Rohan in the Mystic Ward. I would not " ..
                "keep him waiting. May Elune guide your travels.",
            rewardXP = 390,
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
        [6323] = {
            description = "One of my bats can take you to the Undercity, for a small fee. Speak with me " ..
                "again when you are ready so that we may arrange your transport.\n\nYou will find Gordon " ..
                "Wendham in the Trade Quarter of the Undercity. That is the same quarter where my bat " ..
                "will land.",
            rewardMoney = 175,
        },
        [6344] = {
            description = "A friend of mine, Nessa Shadowsong, is a fishing merchant in Rut'theran " ..
                "Village. She needs a parcel taken to Darkshore, and is looking for someone to help " ..
                "her.\n\nIf you're interested, then to reach Nessa you must take the portal in Darnassus " ..
                "to Rut'theran Village. You will find the portal west of the Temple Gardens.",
        },
        [6364] = {
            description = "In order to fly to a town, you must have already been there and spoken with " ..
                "the wind rider master of that town. You have been to the Crossroads and spoken to their " ..
                "wind rider master Devrak, so for a small fee you can take a wind rider to him from " ..
                "here.\n\nSpeak with me again when you are ready. Once at the Crossroads, you can then " ..
                "deliver the leather goods to Jahan Hawkwing.",
            rewardMoney = 350,
        },
        [6384] = {
            description = "For just a few coins I will have a wind rider bring you to Orgrimmar. When you " ..
                "get there, you can take Zargh's Meats to Gryshka. Her inn is in the Valley of Strength, " ..
                "not far from the Skytower, where my wind rider will drop you off.\n\nSpeak with me again " ..
                "when you are ready for the journey.",
            rewardMoney = 175,
        },
        [6503] = {
            description = "We received reports that Ashenvale outrunners left Silverwing Outpost not long " ..
                "ago, and now sneak near our territories in the forest. We don't want them gathering " ..
                "intelligence on our defenses!\n\nSneak through the forests south of our post here and " ..
                "east of the Alliance outpost of Silverwing. Find and slay the outrunners, then return to " ..
                "me.",
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
        [6761] = {
            description = "I have relegated my second, Mathrengyl Bearwalker, to deal with Moonglade's " ..
                "call for aid. Speak to him on this matter - NOT me.\n\nLet me give you some... " ..
                "friendly... advice. It is I who led us out of the darkness - NOT the Cenarion Circle in " ..
                "Moonglade - when all was lost for our race. Teldrassil gives us all new life! They would " ..
                "have you believe otherwise, and to believe their propaganda would be a fool's " ..
                "task.\n\nI'll leave it to you to decide whether or not you're a fool.",
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
        [7499] = {description = "The tome carries the mark of the Athenaeum.", rewardItems = {{18466, 1}}},
        [7562] = {
            description = "<name>, your delvings into the dark arts are deep. Your mastery over " ..
                "otherworldly denizens has grown so strong... perhaps you are ready to bind to you one of " ..
                "the infamous dreadsteeds.\n\nThe ritual to summon the beast from its home requires great " ..
                "power and resources, but if you desire to dominate that epic mount, then speak with " ..
                "Mor'zul Bloodbringer. He is camped near the Altar of Storms in the Burning " ..
                "Steppes.\n\nGo, <name>. This quest will be perilous, but a Warlock of your stature does " ..
                "not shy from danger!",
            rewardXP = 955,
        },
        [7828] = {
            description = "Many brave trolls have been lost to the harsh wilds of the Hinterlands, " ..
                "<race>. The Silvermane wolves are one of the biggest threats to our hunters. They lay in " ..
                "wait, hiding amongst the bushes and landscape, then strike out when the opportunity " ..
                "presents itself.\n\nThis type of ferocity will not go unchecked!\n\nYou must think like " ..
                "the Silvermane. Stalk the stalkers! Slay them all!",
            rewardMoney = 14000,
        },
        [7865] = {rewardItems = {{19152, 1}}},
        [7868] = {rewardItems = {{19153, 1}}},
        [8151] = {
            description = "Ogtinc of Azshara has sent out a call for seasoned hunters such as yourself. " ..
                "He is a furbolg hunter who has left his tribe to aid the Cenarion Circle. His teachings " ..
                "are meant to enrich the wisdom of others who share his craft, and guide them toward " ..
                "maintaining a balance. You would do well to speak with him.\n\nOgtinc resides atop the " ..
                "cliffs of Azshara, northeast from the Ruins of Eldarath.",
        },
        [8233] = {
            description = "Lord Jorach Ravenholdt has requested your presence. The matter is secret, and " ..
                "I cannot say any more.\n\nRavenholdt Manor is located in the Hillsbrad Foothills -- look " ..
                "for a path in the mountains northwest of Durnhold Keep.",
        },
        [8250] = {
            description = "Archmage Xylem has been asking around lately... for someone of your " ..
                "experience.\n\nIf you wish to seek him out, you can find him in Azshara. His tower is " ..
                "built high atop the cliffs, and the only way up is a teleport spell invoked by his " ..
                "arrogant servant, Sanath Lim-yo.\n\nSanath makes camp below his master's tower. To find " ..
                "him, travel to where Azshara's main road forks at the entrance to the Ruins of Eldarath. " ..
                "From that spot, head directly north until you reach the cliffs.",
        },
        [8254] = {
            description = "It is the way of the divine to help those in need. The how is insignificant -- " ..
                "only the why matters.\n\nThe Cenarion Circle has such a need. Speak with Ogtinc to lend " ..
                "aid to their plight. He resides atop the cliffs to the northeast of the Ruins of " ..
                "Eldarath in Azshara.",
        },
        [8262] = {rewardItems = {{20231, 1}}, rewardXP = 1250},
        [8265] = {rewardItems = {{20228, 1}}, rewardXP = 1250},
        [8281] = {
            description = "Your performance has been truly exemplary so far, <name>. Our supply lines are " ..
                "not completely safe yet, however. In the absence of dredge strikers, their larger " ..
                "southern cousins will surely move in to take their place in the north.\n\nYou'll have to " ..
                "kill quite a few dredge crushers to keep them at bay, but we cannot leave the safety of " ..
                "our supply lines to chance.",
            rewardMoney = 17000,
        },
        [8365] = {
            description = "You're the help the Cartel sent? I suppose you'll do. Listen carefully " ..
                "<class>. As you know, I am a procurer of fashionable apparel for the elite of Azerothian " ..
                "society. Kings and Queens, Warchiefs and, well whatever the Horde calls their queens, " ..
                "all wear what I choose is in style. And they pay through the nose for it, which is the " ..
                "best part.\n\nSo here's what's going to happen. You head down to Lost Rigger Cove and " ..
                "acquire a lot of pirate hats by whatever means. Do you think you can handle that?",
            rewardMoney = 6500,
        },
        [8378] = {rewardItems = {{20703, 1}, {20715, 1}}},
        [8410] = {
            description = "Bath'rah the Windwatcher has sent out a summons for a shaman of your wisdom. " ..
                "He requests you bring a sample of each of the elements to show you are ready.\n\nTo find " ..
                "Bath'rah, go to the river east of Tarren Mill. Follow the river north until you come " ..
                "across the ruins where Bath'rah resides.",
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
        [8574] = {
            description = "The badges you collect from performing combat, logistics and tactical " ..
                "assignments for Windcaller Proudhorn are more than just for show, <name>.\n\nYou'd be " ..
                "wise to hold on to them. As you prove your loyalty to our organization I can offer you " ..
                "some of the gear we reserve for our closest allies in exchange for those badges.",
            rewardChoices = {{21184, 1}, {21185, 1}, {21186, 1}, {21189, 1}},
        },
        [8602] = {
            description = "It is said among us that the ornate shoulder armor worn by the mortal races " ..
                "started as an attempt to emulate the wings of a dragon.\n\nBring me the bindings worn by " ..
                "the highest Qiraji leaders and I shall shape them into a set of pauldrons more dreadful " ..
                "than even the wings of Nefarian himself!",
            rewardItems = {{21376, 1}},
        },
        [8624] = {
            description = "You seek to prove your worth to my kind, mortal? Very well, perhaps we can be " ..
                "of mutual assistance.\n\nThe ancient sandworm, Ouro, is a being of legendary power. He " ..
                "is rumored to have been created by the Old God himself as a mockery of life.\n\nHis skin " ..
                "is unnatural... thick, nearly impregnable, yet it's flexible and allows him to move with " ..
                "the speed and grace of a much smaller creature.\n\nBring me a sample of his skin along " ..
                "with other minor components and I shall craft you leggings of great power.",
            rewardItems = {{21375, 1}},
        },
        [8662] = {
            description = "The Twin Emperors... their incessant whispers are slowly taking a toll on my " ..
                "sanity. They mock me, knowing I cannot step further into their domain to save my brother " ..
                "Arygos.\n\nIn my visions I see their monstrous faces adorned by powerful crowns. But I " ..
                "will have my revenge... I will transmute these symbols of Qiraji power to ones better " ..
                "suited to our needs.\n\nBring me the components I require, <name>. I will give you a " ..
                "headpiece of unmatched power.",
            rewardItems = {{21337, 1}},
        },
        [8696] = {
            description = "I'm glad to hear you're aiding us in our attack on Ahn'Qiraj, <name>. I can " ..
                "make you a protective item that'll be of assistance in the fight against our enemy, " ..
                "<class>.\n\nI shall need a Qiraji drape, which I'll resize for you of course. I'll also " ..
                "need idols and scarabs which I'll use to create a suitable clasp.\n\nI promise you won't " ..
                "be disappointed.",
            rewardItems = {{21403, 1}},
        },
        [8699] = {
            description = "The rings worn by the Qiraji lieutenants are rumored to grant them formidable " ..
                "abilities. The corrupted gems that adorn them could, in theory, be swapped out with more " ..
                "pure materials to create uncorrupted versions of the rings.\n\nThe gems that adorn " ..
                "Qiraji idols would work quite well, as their quality is superior.\n\nBring me the ring " ..
                "and idols and I'll create a powerful ring for you, <class>.",
            rewardItems = {{21414, 1}},
        },
        [8732] = {rewardItems = {{20810, 1}}},
        [8920] = {
            description = "Hail, <class>! I can tell by your demeanor that you've seen and done much in " ..
                "this world. Yet I'm willing to wager you haven't seen a piece of armor like " ..
                "this.\n\nPerform a small favor for me and I'll be willing to trade it to you for an " ..
                "ordinary set of bracers.\n\nI'm in need of a sizeable sample of venom drawn from the " ..
                "spiders and scorpions that inhabit Silithus. Bring this to me along with a few gold " ..
                "coins and I'll perform the exchange.",
            rewardItems = {{21996, 1}},
        },
        [8944] = {
            description = "You've proven to be a very reliable individual, <name>. As much as I trust " ..
                "that you'll help me through this predicament, it would be wise of me to reward you " ..
                "according to your performance.\n\nFor now I will exchange your belt and gauntlets. If we " ..
                "both see this through I shall make the rest of the pieces available to you.",
            rewardItems = {{21994, 1}, {21998, 1}},
        },
        [8969] = {
            description = "Now we have what we need, so it's time to discuss who it is that you'll be " ..
                "summoning.\n\nKormok was ok for an ogre, right up until he turned to necromancy. After " ..
                "that, things got creepy for just about everyone in the outfit. It was no surprise then " ..
                "when he took his piece of the amulet and returned to his new home, Scholomance.\n\nBut " ..
                "even there, or perhaps especially there, he was not safe from the spectral assassins. " ..
                "They slew him right in front of his master, Ras Frostwhisper.",
        },
        [8991] = {
            description = "The siblings, Jarien and Sothos, decided to join the Scarlet Crusade upon the " ..
                "disbanding of our mercenary company. They took the right piece of Lord Valthalak's " ..
                "amulet with them. Good riddance, I say, but we need that piece back.\n\nFrom what we " ..
                "could gather, they were actually slain by Grand Crusader Dathrohan himself for failing " ..
                "the initiation rites inside his chamber in the Scarlet Bastion.\n\nIn any case, we... " ..
                "meaning you, are still going to need to retrieve that piece of the amulet.",
        },
        [9004] = {
            description = "That's an amazing story, <name>! You have my thanks, and the heartfelt " ..
                "gratitude of all who were involved. Now maybe I'll be able to sleep at night with both " ..
                "eyes shut.\n\nAs to your reward, I believe I have a few things that you'll really enjoy.",
            rewardItems = {{22005, 1}, {22009, 1}},
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
        [9020] = {
            description = "Valthalak's soul was stored in this amulet. In our greed we foolishly split it " ..
                "into three parts, not knowing the curse that would await us.\n\nThe only way to stop " ..
                "Valthalak's spell is to put the amulet back together. Return to Mokvar and tell him that " ..
                "Bodley is his only hope for finding the remaining pieces. Speak to him about any rewards " ..
                "you've arranged for.\n\nI, for once, shall rest in peace. I wish you the best of luck; " ..
                "you shall need every bit of it!",
            rewardItems = {{22003, 1}, {22007, 1}, {22008, 1}},
        },
        [9022] = {
            description = "Valthalak's soul was stored in this amulet. In our greed we foolishly split it " ..
                "into three parts, not knowing the curse that would await us.\n\nThe only way to stop " ..
                "Valthalak's spell is to put the amulet back together. Return to Mokvar and tell him that " ..
                "Bodley is his only hope for finding the remaining pieces. Speak to him about any rewards " ..
                "you've arranged for.\n\nI, for once, shall rest in peace. I wish you the best of luck; " ..
                "you shall need every bit of it!",
            rewardItems = {{21995, 1}, {22000, 1}, {22001, 1}},
        },
        [9060] = {
            description = "I have discovered a use for the carapace of the crypt fiend. I am able to " ..
                "fashion an extremely light and very deadly set of armor by combining the fragments with " ..
                "some of the desecrated magical armors lost in Naxxramas.\n\nBring me the items I require " ..
                "and I shall fashion for you a suit of armor the likes of which has never before been " ..
                "seen in our world!",
            rewardItems = {{22442, 1}},
        },
        [9137] = {rewardChoices = {{22523, 1}, {22524, 1}}, rewardMoney = 900},
        [9188] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order TR-95:\n\n6 " ..
                "Brightcloth Pants.\n\nAll filled orders should be delivered to Packmaster Stonebruiser " ..
                "at Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and void if " ..
                "tampered with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9221] = {
            description = "Greetings, friend. Have you insignias of the Dawn or the Crusade that you " ..
                "would like to redeem for items of power?\n\nI must warn you; purchases made at a " ..
                "friendly reputation with the Dawn come with a hefty surcharge. I would advise that you " ..
                "gain a better reputation with the Dawn before moving forward with your plans.",
            rewardChoices = {{22681, 1}, {22680, 1}, {22688, 1}, {22679, 1}, {22690, 1}, {22689, 1}},
        },
        [9313] = {
            description = "By all that is good, <name>, you must go at once to this Azure Watch and speak " ..
                "with Dyvuun!\n\nThere is a path that leads west off of this tiny isle. Follow it and " ..
                "cross the Crystalbrook River to arrive on the larger part of the isle. Continue to " ..
                "follow the path and you should find Azure Watch.\n\nSee if you can convince them to send " ..
                "us some aid and supplies. The rest of us will follow when we can.\n\nThank you, we " ..
                "wouldn't have made it without you!",
        },
        [9314] = {
            description = "<class>! A couple mutated beasts jumped me and my leg is injured.\n\nI was " ..
                "sent on a scouting mission from Azure Watch after we received word from Zhanaa. Please, " ..
                "could you go speak with Caregiver Chellan in my stead? She needs to know how many people " ..
                "to expect in Azure Watch. Just cross the Crystalbrook River here and continue following " ..
                "the road until you get to Azure Watch.\n\nBe sure to ask her for a place for yourself to " ..
                "stay in.",
            rewardChoices = {{6290, 5}, {159, 5}},
        },
        [9427] = {
            description = "I must ask that you finish what we've set in motion. Now that the demonic " ..
                "influence has weakened you must take this cleansing vial and pour it at the very source " ..
                "of the taint - Aggonar's own corpse.\n\nYou will find the demon's bones at the northern " ..
                "end of the pools. Beware, I sense that Aggonar's essence has not quite left this world.",
            rewardChoices = {{25484, 1}, {25486, 1}, {25485, 1}},
        },
        [9463] = {
            description = "I have found that lashers milling about on the island hold restorative " ..
                "medicinal properties in their vines. Through proper treatment, the vines can be broken " ..
                "down into a powerful healing ointment. Unfortunately, with so many injured draenei " ..
                "passing through Azure Watch, we are always in short supply.\n\nOur delicate guest was " ..
                "found injured and unconscious by the Crystalbrook only yesterday. If you bring me vines, " ..
                "we may be able to save her.\n\nYou will find root trappers both south and east of Azure " ..
                "Watch.",
        },
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
        [9505] = {
            description = "The Prophet spoke of this day: That on this island, in this new world, our " ..
                "allies would find us.\n\n\"We will be tested. They will ask that we pay for the sins of " ..
                "our fathers...\"\n\nAt the time, I did not understand the meaning behind his words, but " ..
                "seeing this creature and her reaction to us, it is now coming into focus. The corruption " ..
                "of our people has been felt even here.\n\nVenture south. It is there that we found this " ..
                "being. Find its kin and tell them of our people.",
        },
        [9506] = {
            description = "I am Admiral Odesyus of Alliance Naval Command. Our ship was forced to port on " ..
                "your island due to an infestation of sorts. It's embarrassing to even talk about, but " ..
                "goblins somehow managed to stow away in the holds of both of my ships.\n\nLast night, " ..
                "while most of the ship's crew was asleep below deck, they struck!\n\nStranger still, " ..
                "they took our navigation gear and jumped ship!\n\nThey disappeared into the thicket, " ..
                "east of here. Will you go in search of our gear? It will make for a strong gesture.",
        },
        [9512] = {
            description = "The Admiral be right, ye are a resourceful one. Mayhap ye could help Cookie " ..
                "out?\n\nIf I serve the crew chicken for dinner again, I'll be sent to the brig fer " ..
                "sure.\n\nI noticed that thar be crawlers all along the coastline - lots o' crawlers! " ..
                "Bring me crawler meats and I'll be forever indebted to ya.\n\nHelp a reformed pirate out?",
            rewardItems = {{23756, 10}},
        },
        [9515] = {
            description = "A naga invasion would be disastrous, <name>. I've seen what naga can do and I " ..
                "would not want to see such a catastrophe befall any being. If I were to guess, this " ..
                "Warlord Sriss'tiz will be hidden in a cave - probably along the coast to the " ..
                "west.\n\nFind Warlord Sriss'tiz and put an end to his reign.",
            rewardChoices = {{24448, 1}, {24447, 1}},
            rewardMoney = 1000,
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
        [9528] = {
            description = "My family was attacked by the murlocs and owlkin of this island several weeks " ..
                "ago. I managed to escape but I think that both my mother and father have been slain. I " ..
                "don't know what I'm going to do now, but I must try and get back to my home - or what's " ..
                "left of it... Will you help me get through the forest?",
            rewardItems = {{24113, 1}},
        },
        [9530] = {
            description = "I've wondered about this for some time now, but this proves it to be " ..
                "true.\n\nThere is a traitor among us.\n\nThe plans left behind by the goblins document " ..
                "the conspiracy. Since I don't know who it could be, I'm going to need your help in " ..
                "finding the traitor. None of my crew can be trusted.\n\nIf this is going to work, I'm " ..
                "going to need a hollowed out tree and leaves. Search near the loggers north of us for " ..
                "the tree. You'll need to find the leaves by yourself. Check the forest.",
        },
        [9537] = {
            description = "Spark must be brought to justice!\n\nI need you to go down to the beach and " ..
                "find that deceitful gnome. Once you find him, get whatever information you can out of " ..
                "him!\n\nIf a high ranking official of the Alliance has committed treasonous acts, who " ..
                "knows how many others are corrupt?\n\nAnd <name>, use force if you have to...",
            rewardChoices = {{24433, 1}, {24431, 1}, {24430, 1}, {24434, 1}, {24432, 1}},
        },
        [9540] = {
            description = "You begin to read the totem, better able to pronounce the words and phrases. " ..
                "Words start to form in your head. You think that the totem is telling you to go across " ..
                "the Crystalbrook river to the east. Perhaps your destination is on the other side of the " ..
                "river.",
        },
        [9542] = {
            description = "You no longer see unrecognizable symbology in the totems. The totem of Yor " ..
                "reads to you just as easily as your native tongue.\n\nThe markings identify another " ..
                "furbolg den, due west of here. You are able to expertly decipher the language on the " ..
                "totem and know that your destination is Bristlelimb Village. Yor will guide you but if " ..
                "you get lost, you know that you are able to take the ancient elven road in the forest " ..
                "leading west to reach your destination.",
        },
        [9544] = {
            description = "The images on this totem depict a war between the Stillpine and the " ..
                "Bristlelimb furbolg tribes. The etchings show that the Bristlelimb have done " ..
                "unconscionable things to the furbolgs of Stillpine.\n\nAmidst the chaos, a prophecy has " ..
                "begun to unfold: A hero will rise - not of furbolg blood - and save the Stillpine " ..
                "tribe.\n\nSlay Bristlelimb furbolgs at Bristlelimb Village for their keys. Use the keys " ..
                "to free the Stillpine captives. Return to Arugoo of the Stillpine when you have freed " ..
                "them all!",
            rewardChoices = {{27399, 1}, {27403, 1}, {27401, 1}},
        },
        [9560] = {
            description = "My brother and I were hunting in the woods to the east when we were ambushed " ..
                "by strange, insect-like beasts. Such aberrations have never before been seen in " ..
                "Azuremyst! Could they be a sign of the coming apocalypse? The apocalypse that YOU are " ..
                "destined to prevent?\n\nIf you truly are the Promised One, you will strike the creatures " ..
                "of the apocalypse down... and bring me their hides. From their hides, I can fashion " ..
                "armor of great power!\n\nFind them to the east, beyond the road.",
            rewardChoices = {{24108, 1}, {24107, 1}, {24109, 1}},
        },
        [9562] = {
            description = "These are dark days, Promised One. Even the murlocs are kicking our tails - " ..
                "literally. Unfortunately, more than just my ego has been bruised.\n\nWhile our " ..
                "relationship with the Siltfin murlocs had always been tenuous, never could we have " ..
                "imagined that they would have the gall to attack us and steal from our food stores! " ..
                "Travel west to the Silting Shore and recover our stolen food-stuffs!\n\nAnd if you see a " ..
                "dark-skinned murloc with a patch of white fur stuck in between his webbed toes...",
            rewardMoney = 350,
        },
        [9565] = {
            description = "As High Chief, my immediate concern is the root of the corruption in Stillpine " ..
                "Hold.\n\nWhy did the wildkin - once our allies - attack us? Why have they taken " ..
                "residence in Stillpine Hold?\n\nPerhaps something inside will hold the answer. Search " ..
                "Stillpine Hold for clues as to the source of corruption.",
        },
        [9566] = {
            description = "On the surface, the crystal appears to be a piece of the Exodar. Something has " ..
                "gone terribly wrong with this crystal, however, as it is blood red and rapidly " ..
                "dissolving into the water supply of the cave.\n\nThis may explain the unusually " ..
                "aggressive behavior of the creatures in Azuremyst. Return to High Chief Stillpine with " ..
                "this information.",
        },
        [9570] = {
            description = "After the crystal storm had subsided, a beast of myth appeared in our village. " ..
                "Brought here by the invading wildkin, this beast, the Kurken, laid waste to our village. " ..
                "Many Stillpine were slain in defense of our lands by this fiend and many have since lost " ..
                "their lives attempting to subdue the beast.\n\nIn my visions, I have seen one defeat the " ..
                "Kurken. The one must be you, <name>. You are our only hope. Enter Stillpine Hold and " ..
                "slay the Kurken. Bring me his hide as proof of deed.",
        },
        [9573] = {
            description = "I am Stillpine the Younger, heir to the Stillpine legacy. As you can see, my " ..
                "defenders have set up a death trap for the raving wildkin that attack from inside " ..
                "Stillpine Hold. While we are able to hold them off out here, none of my defenders have " ..
                "been able to infiltrate the hold. If you could get inside and slay their leader, it " ..
                "might give us an opportunity to strike!\n\nFind Chieftain Oomooroo and destroy him. Slay " ..
                "any crazed wildkin that you encounter inside as well.",
            rewardChoices = {{24446, 1}, {24445, 1}},
        },
        [9612] = {
            description = "You saved my life, <name>! Thank you so much! That beast would have torn me to " ..
                "shreds if it weren't for you.\n\nIf you see the exarch at Azure Watch, tell him of what " ..
                "you did. I'm sure he'll be pleased to hear such news!",
            rewardMoney = 450,
        },
        [9616] = {
            description = "This appears to be a bounty ledger. You cannot understand the blood elf " ..
                "language but you note that there is a picture depicting a dead draenei, a smiling blood " ..
                "elf standing over the corpse, and a symbol of what you think is some sort of blood elf " ..
                "currency.\n\nThey've put a hit out on draenei! You must inform the exarch.",
            rewardChoices = {{24141, 1}, {24142, 1}, {24144, 1}},
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
        [9665] = {
            description = "Agents of the Forsaken uncovered an Alliance plot to establish new bases here " ..
                "in the Eastern Plaguelands, at abandoned towers throughout the area.\n\nIt is imperative " ..
                "that we not allow them to establish a significant presence on our eastern borders, and " ..
                "so we must stave off this Alliance incursion. Our current plans are to drive them out of " ..
                "any towers they may have already seized, and occupy those that we have under our control " ..
                "against further attacks.",
            rewardMoney = 9000,
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
        [9815] = {
            description = "The most affected elements of water can be found in the Halaani Basin, " ..
                "southwest of here, beneath the abandoned city of Halaa. While some distressed elements " ..
                "can be destroyed without any impact upon the environment, spawns of muck must be " ..
                "physically removed from the world once destroyed.\n\nYou see, muck spawns leave behind " ..
                "globules of tainted debris that if left untouched will spread and further contaminate " ..
                "the environment.\n\nDestroy these muck spawns and bring back their muck-ridden cores.",
            rewardChoices = {{25560, 1}, {25561, 1}, {25559, 1}},
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
        [9890] = {
            description = "For many years, Boulderfist ruled all ogres in the Outland. The ogres were " ..
                "united under Krol and content with the lands that they were given. In the past few " ..
                "months, we have lost many ogres to a new clan known as Warmaul. Warmaul has taken most " ..
                "of our land in Nagrand and killed many of our people.\n\nWe had no choice but to take " ..
                "this town. We are being exterminated...\n\nKrol has gone missing and Boulderfist is in " ..
                "turmoil. Lantresor of the Blade rules in his absence.",
        },
        [9935] = {
            description = "Wanted: Dead or Alive\n\nGiselda the Crone of Kil'sorrow and her lackeys for " ..
                "murder, ritual sacrifice, communing with the Legion, kidnapping, and burglary.\n\nKnown " ..
                "to congregate at Kil'sorrow Fortress in southeastern Nagrand, near the border of " ..
                "Terokkar.\n\nLarge gold reward to be dispensed by Warden Bullrok at Garadar to anyone " ..
                "able to bring Giselda to justice.",
            rewardMoney = 105000,
        },
        [9971] = {
            description = "I have no idea what killed all of the druids here. I've been away for a couple " ..
                "of days on a survey of the Bone Wastes to the south.\n\nPlease, you must help me to " ..
                "uncover what's behind this horrible tragedy. Go into the thicket and look for a clue " ..
                "that might reveal something to us. When I was in there briefly, I could have sworn I saw " ..
                "a dead Broken and a strange object next to him.\n\nAnd don't worry about Treelos - he " ..
                "might have been driven insane by what happened, but I think he's mostly harmless.",
            rewardMoney = 29000,
        },
        [9995] = {
            description = "I don't know about you, but I have no idea what all of those things are. I do " ..
                "know one thing though - they look dangerous!\n\n<name>, I think you should take this box " ..
                "of parts to Tooki at Stonebreaker Hold to the southeast. He may have some idea of what " ..
                "these are.",
            rewardMoney = 16000,
        },
        [10002] = {
            description = "Over the past couple of days, I've observed a blood elf woman traveling to and " ..
                "from the fel orc stronghold and conversing with the fel orc leader. From her body " ..
                "language, she's clearly issuing orders. But why? Whose orders is she conveying?\n\nMy " ..
                "curiosity got the better of my judgment and I shadowed her when she left the fel orc " ..
                "encampment. She headed north, to Firewing Point. I stopped before reaching the perimeter " ..
                "of the blood elf outpost.\n\nKill her before she leaves the fel orc camp again.",
            rewardMoney = 31000,
        },
        [10003] = {
            description = "Over the past couple of days, I've observed a blood elf woman traveling to and " ..
                "from the fel orc stronghold and conversing with the fel orc leader. From her body " ..
                "language, she's clearly issuing orders. But why? Whose orders is she conveying?\n\nMy " ..
                "curiosity got the better of my judgment and I shadowed her when she left the fel orc " ..
                "encampment. She headed north, to Firewing Point. I stopped before reaching the perimeter " ..
                "of the blood elf outpost.\n\nKill her before she leaves the fel orc camp again.",
            rewardMoney = 31000,
        },
        [10007] = {
            description = "Knowing Thander and Bertelm, they won't tolerate such a large buildup of " ..
                "hostile forces on our doorstep. Asking them to dispatch members of the garrison to " ..
                "participate in an attack on the camp isn't an option either. It would just leave us too " ..
                "vulnerable to attack.\n\nIt falls to us to do what we can to diminish the threat the fel " ..
                "orc buildup poses. Kill what you can of their forces and I will look for ways to stall " ..
                "any reinforcements.",
            rewardChoices = {{25972, 1}, {25971, 1}, {25973, 1}},
            rewardMoney = 31000,
        },
        [10018] = {
            description = "Generations ago, when orc clans still called Terokkar Forest home, the wolf " ..
                "spirit played an important role in their lives. When the orcs departed, they had no " ..
                "longer had any need for the spirit and they left it behind.\n\nIn time, the spirit grew " ..
                "lonely and it too left the forest.\n\nI believe I can bring the wolf spirit back to his " ..
                "ancestral home, just as we orcs have returned. The ritual will require me to create " ..
                "vestments from the pelts of the wolves of the forest to guide the spirit back to its " ..
                "home.",
            rewardMoney = 31000,
        },
        [10039] = {
            description = "I am informed that one of our scouts near Grangol'var Village is currently " ..
                "observing a shadowy band that has recently moved in there.\n\n<name>, I want you to " ..
                "speak with Scout Neftis and see how you can assist her in figuring out what this unknown " ..
                "group is up to.\n\nJust head south out of here, and then due west, skirting the north of " ..
                "the Bone Wastes. Her last report puts her position near the southern entrance to the " ..
                "village.",
        },
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
        [10324] = {
            description = "Well done, <name>! Well done!\n\nNow that you've cut your teeth with the " ..
                "moongraze stag, it's time you graduated to more formidable prey. Do not allow the casual " ..
                "disinterest of the moongraze bucks to fool you: when provoked, they are a fearsome " ..
                "foe.\n\nYou'll find the bucks north of here. Good hunting.",
            rewardChoices = {{24104, 1}, {24103, 1}},
            rewardMoney = 175,
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
        [10428] = {
            description = "In the fevered dreams of our injured guest, she spoke of a fisherman, Cowlen, " ..
                "who was in some distress at Silvermyst Isle, to the southwest, off the coast of " ..
                "Azuremyst.\n\nWith all that has been happening, no one has had the opportunity to look " ..
                "into it, but I do feel a bit of worry. Perhaps there's something you can do, <name>?",
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
        [10444] = {
            description = "This calls for immediate action!\n\nWe have someone out in the field closer to " ..
                "Firewing Point that I want you to speak with. He'll have a better idea of what our next " ..
                "step should be.\n\nReport to Lieutenant Meridian out at the Allerian Post and apprise " ..
                "him of the situation. You'll find the post to the northeast on the southern bank of the " ..
                "river just south of Firewing Point.\n\nGodspeed, <name>.",
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
        [10448] = {
            description = "This calls for immediate action!\n\nWe have someone out in the field closer to " ..
                "Firewing Point that I want you to speak with. She'll have a better idea of what our next " ..
                "step should be.\n\nReport to Sergeant Chawni out at Stonebreaker Camp and apprise her of " ..
                "the situation.\n\nTake the road north out of the hold. From the middle of Tuurem, follow " ..
                "the road to the east. You'll find the camp on the bank of the river that lies just " ..
                "southwest of Firewing Point.\n\nGood luck, <name>.",
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
        [10497] = {
            description = "Valthalak's soul was stored in this amulet. In our greed we foolishly split it " ..
                "into three parts, not knowing the curse that would await us.\n\nThe only way to stop " ..
                "Valthalak's spell is to put the amulet back together. Return to Mokvar and tell him that " ..
                "Bodley is his only hope for finding the remaining pieces. Speak to him about any rewards " ..
                "you've arranged for.\n\nI, for once, shall rest in peace. I wish you the best of luck; " ..
                "you shall need every bit of it!",
            rewardItems = {{22087, 1}, {22092, 1}, {22093, 1}},
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
        [10564] = {
            description = "The device we've assembled won't win any beauty contests, but it should be " ..
                "capable of destroying the infernals amassed at Legion Hold. Judging from what the fel " ..
                "reaver power core's energy did to the Fetid Pool, it holds a respectable amount of " ..
                "explosive power.\n\nIf you set the device off in the middle of the green glyph at the " ..
                "hold, it should be in range to hit all of the infernals.",
            rewardChoices = {{30986, 1}, {30947, 1}, {30946, 1}, {30929, 1}},
            rewardMoney = 41000,
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
        [10582] = {
            description = "<Ewan listens to you recount the events at Legion Hold, nodding.>\n\nThat puts " ..
                "our observations into perspective. We've caught glimpses of them launching infernals in " ..
                "the direction of the hold, but haven't been able to find much more than that.\n\nThe " ..
                "Shadow Council has the Deathforge sealed tighter than a new keg o' thunderbrew. The " ..
                "first thing you'll need to do is crack some skulls so you can get in there and poke " ..
                "around. Start eliminating the Shadow Council guarding the entrance to the Deathforge!",
            rewardMoney = 41000,
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
        [10596] = {
            description = "The fortress of Legion Hold is your target. You'll have no reinforcements, so " ..
                "a frontal attack is out of the question.\n\nWhat little information we have shows that " ..
                "the Legion stocks and prepares its infernals at the hold. With the help of a disguise " ..
                "I'll give you, you must sneak into Legion Hold and discover their plans.\n\nYour best " ..
                "hope is to intercept or overhear communication between their commanders.",
            rewardMoney = 41000,
        },
        [10611] = {
            description = "The best way to destroy the rest of the Legion's supplies is to use their own " ..
                "weapons against them. I've been working on a rig that will let you take control of one " ..
                "of those Fel Reaver Sentinels below.\n\nThere are a couple things I need to work out, " ..
                "yet. For that, I'll need the manual that Doctor Maleficus keeps locked in a chest near " ..
                "the bottom of the ramp. He probably won't give up the key without a fight, so you'll " ..
                "need to capture it. Bring the fel reaver manual back to me and I'll do the rest.",
            rewardMoney = 41000,
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
        [10639] = {
            description = "With Gorefiend's items restored, there is but one last piece to this puzzle: A " ..
                "host.\n\n<The ancient shadowmoon spirit 's lips curl up to form a wicked " ..
                "grin.>\n\nSurely you did not believe the fairy tale that I told you. The Altar of " ..
                "Shadows is my prison. Without your help, I would have been stuck here for all eternity. " ..
                "Now, I will take over your body and you will destroy my captors and break these bonds. " ..
                "Refuse and we will both be stuck here forever.\n\nTeron Gorefiend will be free!",
            rewardChoices = {{31104, 1}, {31105, 1}, {31106, 1}, {31107, 1}, {31109, 1}, {31110, 1}},
            rewardXP = 19000,
        },
        [10640] = {
            description = "It is rare in this day and age to hear of those who follow the path of the " ..
                "demon hunter. It is rarer still to find someone who does and has no allegiance to " ..
                "Illidan.\n\nThere are rumors of one such individual here in Outland. One name is said to " ..
                "be feared in the Legion fields of Nagrand more than any army of Aldor vindicators. That " ..
                "name is Altruis.\n\nGo to western Nagrand and find him. He might be willing to shed some " ..
                "light on these new demon hunter training grounds.",
        },
        [10641] = {
            description = "The Burning Legion has proven its capacity to corrupt mortal souls time and " ..
                "again. If I'm to entrust you with the knowledge you seek, I must have proof of your " ..
                "allegiance.\n\nA demoness known as Sathal has eluded me for a long time as she's gifted " ..
                "with an incorporeal form.\n\nShe watches over the wrath priestesses as they do her " ..
                "bidding at Forge Base: Gehenna. Slay one of her minions and spill her blood on the " ..
                "ground. This affront should cause Sathal to materialize temporarily. Slay her while you " ..
                "can.",
        },
        [10644] = {
            description = "Stories abound about the life of Teron Gorefiend, but most are just that - " ..
                "stories. We do not know what happened to Gorefiend after he returned to Draenor.\n\nThe " ..
                "only thing we are certain of is that he has already died once.\n\nI have heard the " ..
                "scouts here speaking of an ancient orc spirit that resides at the Altar of Shadows, far " ..
                "to the east, across the Netherwing Fields and through Netherwing Pass. Take the " ..
                "Spectrecles and track this orc down. He will surely have more information on Gorefiend.",
        },
        [10645] = {
            description = "With Gorefiend's items restored, there is but one last piece to this puzzle: A " ..
                "host.\n\n<The ancient shadowmoon spirit 's lips curl up to form a wicked " ..
                "grin.>\n\nSurely you did not believe the fairy tale that I told you. The Altar of " ..
                "Shadows is my prison. Without your help, I would have been stuck here for all eternity. " ..
                "Now, I will take over your body and you will destroy my captors and break these bonds. " ..
                "Refuse and we will both be stuck here forever.\n\nTeron Gorefiend will be free!",
            rewardChoices = {{31104, 1}, {31105, 1}, {31106, 1}, {31107, 1}, {31109, 1}, {31110, 1}},
            rewardXP = 19000,
        },
        [10646] = {
            description = "You've proven your allegiance, <name>. You must forgive my caution, but in " ..
                "this world things are not what they appear.\n\nI will tell you about Varedis when you're " ..
                "ready.",
        },
        [10647] = {
            description = "Wanted - DEAD:\n\nUvuros, scourge of Shadowmoon Valley.\n\nBy order of " ..
                "Overlord Or'barokh, the fel beast, Uvuros, is to be killed on sight and his mane " ..
                "stripped from his carcass as proof of deed. Return the fiery mane of the beast to " ..
                "Warcaller Sardon Truslice should you succeed.\n\nUvuros was last seen at the Hand of " ..
                "Gul'dan, located in the heart of Shadowmoon Valley - east of Shadowmoon Village.",
            rewardChoices = {{31112, 1}, {31114, 1}, {31111, 1}, {31115, 1}},
            rewardMoney = 132000,
        },
        [10648] = {
            description = "Wanted - DEAD:\n\nUvuros, scourge of Shadowmoon Valley.\n\nBy order of Thane " ..
                "Yoregar, the fel beast, Uvuros, is to be killed on sight and his mane stripped from his " ..
                "carcass as proof of deed. Return the fiery mane of the beast to Warcaller Beersnout " ..
                "should you succeed.\n\nUvuros was last seen at the Hand of Gul'dan, located in the heart " ..
                "of Shadowmoon Valley - northeast of Wildhammer Stronghold.",
            rewardChoices = {{31112, 1}, {31114, 1}, {31111, 1}, {31115, 1}},
            rewardMoney = 132000,
        },
        [10649] = {
            description = "I sympathize with your intentions of stopping Varedis and his followers, but " ..
                "you won't stand a chance against him. That is, unless you find the artifact that gave " ..
                "him his power.\n\nThe Book of Fel Names is rumored to be in the possession of Blackheart " ..
                "the Inciter inside the Shadow Labyrinth in Auchindoun. Obtaining it will be your only " ..
                "hope against Varedis.",
        },
        [10650] = {
            description = "This book... I could use it to increase my power tenfold... No! It would end " ..
                "up corrupting my very soul, this I am sure of. Return to those who sent you here, " ..
                "<name>.\n\nYou now have the means to stop Varedis. Wait until he manifests his demonic " ..
                "form through metamorphosis, at that point you will need to burn the book in his " ..
                "presence. That will be the only way you can deprive him of his power.",
        },
        [10651] = {
            description = "We must dispose of this foul artifact, but not before we use it to dispose of " ..
                "Varedis 's powers.\n\nWe need to permanently shut down the Ruins of Karabor training " ..
                "grounds, which will mean killing not only Varedis but also the three night elf masters " ..
                "that assist him: Alandien, Theras and Netharel.\n\nGather a suitable force and return to " ..
                "the Ruins of Karabor. Follow Altruis's instructions for defeating Varedis. For all of " ..
                "our sakes, I hope they work.",
            rewardChoices = {{31013, 1}, {30933, 1}, {31010, 1}, {31002, 1}, {30948, 1}, {31009, 1}},
        },
        [10653] = {
            description = "By now it should be clear to you why we oppose the Burning Legion and those " ..
                "who serve them.\n\nIf you wish to prove yourself to the Aldor, bring me the insignias of " ..
                "high-ranking Legion and their Shadow Council followers. The highest-ranking Legion can " ..
                "be found in Netherstorm and Shadowmoon Valley.",
        },
        [10656] = {
            description = "As you might know, the Scryers and the armies of Kael'thas are at war. Kael " ..
                "sees us as a threat to his influence over other blood elves and has tried to crush us " ..
                "time and again.\n\nIf you wish to aid us in our battle against Kael'thas, there are " ..
                "plenty of targets for you to go after. Kael's highest ranking soldiers wear Sunfury " ..
                "signets to mark their ranks. You will find them all over Netherstorm and Shadowmoon " ..
                "Valley.",
        },
        [10660] = {
            description = "I am interested in learning more about the strange reptiles that mill about " ..
                "the lava flows of Shadowmoon Valley. Never have I seen beasts able to withstand the " ..
                "searing heat of molten lava!\n\nOutside of Shadowmoon Village, where the ground has " ..
                "ruptured and lava flows through the cracks, you will find felfire diemetradons. Slay " ..
                "them and bring me their spleens. From their spleens I will be able to begin preliminary " ..
                "analysis of their resistance to heat.\n\nBegin your search to the southeast.",
            rewardMoney = 41000,
        },
        [10666] = {
            description = "Recreating the enchantments on the blade requires several spells to be spoken " ..
                "in demonic.\n\nIt's not something I was taught during my training as an apprentice, but " ..
                "there's no way around it. There's a book, called the Lexicon Demonica, that will provide " ..
                "most of the words I need, but it's in the hands of a powerful Shadow Council " ..
                "warlock.\n\nDeep in the halls of Auchindoun's Shadow Labyrinth, it is held by " ..
                "Grandmaster Vorpil. Do whatever you must to secure the book and bring it to me.",
            rewardMoney = 41000,
        },
        [10667] = {
            description = "The frame that you brought me earlier will not be sufficient to hold molten " ..
                "metal without reinforcement. A rare kind of earth can be used to cool and imbue the " ..
                "frame, giving the adamantite an unnatural strength.\n\nUnderwold loam, as the earth is " ..
                "known, is accorded great value among the naga. Few enough of them possess it, and in " ..
                "Outland, I know of only one naga who uses it -- Hydromancer Thespia, who resides in the " ..
                "Steamvault of Coilfang Reservoir.",
            rewardMoney = 44000,
        },
        [10668] = {
            description = "I still have respect for Illidan. Without him I would not have found my " ..
                "path.\n\nHe is not who he once was, however. His soul has been corrupted by power, his " ..
                "mind has been twisted by defeat. He has become what I am sworn to destroy and his pet " ..
                "servants, the Illidari, are as much of an abomination as any demon of the Burning " ..
                "Legion.\n\nHis grasp on Outland is slipping yet his reach is still vast. Prove you're " ..
                "not with him by slaying his lieutenant Lothros at Illidari Point in Shadowmoon Valley.",
        },
        [10669] = {
            description = "Some demons pledge allegiance to no one but themselves. A true enemy of demons " ..
                "finds and destroys his prey regardless of affiliation, however.\n\nThe demon Xeleth - a " ..
                "Legion defector - was once worshipped as a god by primitive swamp creatures in " ..
                "Zangarmarsh. When Draenor was nearly destroyed, he retreated into a slumber deep beneath " ..
                "Marshlight Lake. Find the portal at the lake and plant this spear into the " ..
                "ground.\n\nXeleth will awake - be ready to slay him and prove you're an enemy to all " ..
                "demons.",
        },
        [10670] = {
            description = "The sword's enchantments must be contained within a powerful focus, such as a " ..
                "gem. I know of a gem that we can use for this purpose, for there are few that can play " ..
                "host to such powerful magics without shattering.\n\nThe gem we need is called the tear " ..
                "of the earthmother. It's a powerful artifact in the hands of the ogres who created it, " ..
                "and Warbringer O'mrogg, who currently holds the gem, has many powerful allies in " ..
                "Hellfire Citadel's Shattered Halls. Take care in retrieving the tear, <name>.",
            rewardMoney = 44000,
        },
        [10673] = {
            description = "Gnomus knows about the massive diemetradon and plans to eat it! He must have " ..
                "been able to see what I could see through the eyes of his arcano-scorp. Look, there's no " ..
                "time to explain. He's crazy and that craziness is going to cost us the closest thing " ..
                "we've got to a fireproof jumpsuit.\n\nGet back to the lava flow near Baa'ri and track " ..
                "down Felspine the Greater. Once you find it, kill it and bring me back its " ..
                "hide.\n\nDon't try and reason with me, <name>. I'm well past that point.",
            rewardMoney = 88000,
        },
        [10676] = {
            description = "<David gathers his smithing supplies.>\n\nYou've done well in getting " ..
                "everything we'll need to reforge the anti-demon blade. Your hard work and dedication is " ..
                "about to be repaid.\n\nThe time has come to forge the sword.",
        },
        [10678] = {
            description = "Long story short, I used to work with a blood elf named Tiorus. My partnership " ..
                "with Tiorus dissolved once I got into gourmet living. He decided to take it upon himself " ..
                "to continue our research using MY inventions. Anyhow, he had some of his Horde goons " ..
                "using my arcano-scorp probes at the Ruins of Baa'ri lava flow and discovered the mother " ..
                "of all diemetradons!\n\nI need you to get there before he does and kill the diemetradon, " ..
                "Felspine, and bring his hide back to me.\n\nHurry up!",
            rewardMoney = 88000,
        },
        [10679] = {
            description = "The blade is nearly finished!\n\nYou can almost feel the magic beginning to " ..
                "coalesce inside the steel, but one thing remains to be done.\n\nYou must take the forged " ..
                "blade to the Scalding Pools near the top of the Hand of Gul'dan in Shadowmoon Valley and " ..
                "plunge it into the lava pools to quench the sword. When you have quenched the sword, " ..
                "return.",
            rewardChoices = {{30788, 1}, {30789, 1}, {30787, 1}, {31745, 1}},
            rewardMoney = 44000,
        },
        [10680] = {
            description = "The elements need your help, <race>! Shadowmoon Valley has been subject to " ..
                "unspeakable evils. The spirits remain tortured to this day. Many are enraged and " ..
                "unwilling to commune with the Earthen Ring.\n\nHelp this world heal, friend.\n\nDirectly " ..
                "northeast of Wildhammer Stronghold you will find an area known as the Altar of " ..
                "Damnation. Make your way there and speak with Earthmender Torlok.",
        },
        [10681] = {
            description = "The elements need your help, <race>! Shadowmoon Valley has been subject to " ..
                "unspeakable evils. The spirits remain tortured to this day. Many are enraged and " ..
                "unwilling to commune with the Earthen Ring.\n\nHelp this world heal, " ..
                "friend.\n\nSoutheast of Shadowmoon Village - in the heart of Shadowmoon Valley - you " ..
                "will find an area known as the Altar of Damnation. Make your way there and speak with " ..
                "Earthmender Torlok.",
        },
        [10683] = {
            description = "The Ashtongue Broken have been ordered by Illidan to excavate the Ruins of " ..
                "Baa'ri, to the far north. They're in search of draenei artifacts, no doubt - Baa'ri was " ..
                "home to many Baa'ri relics before Gul'dan buried the town under a volcanic explosion. We " ..
                "must use this opportunity to recover the Tablets of Baa'ri, an ancient text rumored to " ..
                "hold the secrets of the Temple of Karabor... a place you might know as the Black Temple.",
        },
        [10684] = {
            description = "According to the tablets, an artifact known as a Medallion of Karabor was kept " ..
                "at Baa'ri. Only the highest-ranking draenei priests were granted these, as they allowed " ..
                "unfettered access into the Temple of Karabor.\n\nWe must find out whether the Ashtongue " ..
                "have recovered the medallion that was kept at Baa'ri yet. Its power would provide great " ..
                "aid in our fight against Illidan.\n\nAkama's lieutenant at Baa'ri, Oronu the Elder, " ..
                "receives written orders from him daily. Obtain them and bring them to me.",
        },
        [10685] = {
            description = "According to Akama's letter, four fragments of the medallion were unearthed " ..
                "and given to the Ashtongue Corruptors. These dreaded Broken were once powerful shaman " ..
                "who now defile the very elements they revered.\n\nHaalum, Corruptor of Air, can be found " ..
                "at Netherwing Pass. Eykenen and Uylaru, Corruptors of Earth and Fire, were last seen at " ..
                "the Fel Pits near the Hand of Gul'dan. Lakaan, Corruptor of Water, is rumored to be near " ..
                "Coilskar Point.\n\nFind them and obtain the medallion fragments.",
        },
        [10686] = {
            description = "The fragments you obtained are only half of the medallion. The Ashtongue " ..
                "leader, Akama, must have kept the other half.\n\nI dread to ask this of you, as Akama is " ..
                "both evil and cunning.\n\nHe and the Ashtongue Deathsworn - the vilest and most brutal " ..
                "of the tribe - are rumored to run a torture chamber inside the Warden's Cage.\n\nI want " ..
                "you to find that dreaded prison, and find the whereabouts of Akama. His second in " ..
                "command at the location is a Broken known as Sanoru - interrogate him if you have to.",
        },
        [10687] = {
            description = "Our scouts have reported a massive influx of Sunfury blood elf recruits " ..
                "heading to the Ruins of Karabor. Normally this would represent a purely military threat, " ..
                "however we believe something else is amiss.\n\nDescriptions of their attire and fighting " ..
                "style are suspiciously close to that of Illidan himself. I do not want to become alarmed " ..
                "without good reason, so I would like you to go there and bring me back their weapons. We " ..
                "will then determine whether my fears are unfounded or not.",
        },
        [10688] = {
            description = "The weapons are authentic, as we feared. Illidan is training demon hunters at " ..
                "the Ruins of Karabor and we must put an end to it.\n\nDo not be fooled by their name, " ..
                "<name>, their power will be used against us as often as against any demon.\n\nTheir " ..
                "warlocks summon and subdue demons to be used as part of the initiates' training. A pit " ..
                "lord named Azaloth has proven too strong to be used in training and is kept banished. " ..
                "Find a way to let him loose on his captors. That should buy us the time we need.",
        },
        [10689] = {
            description = "You don't see many demon hunters nowawdays. They're viewed with suspicion by " ..
                "their own people and it's very rare to find one that doesn't have some sort of " ..
                "allegiance to Illidan.\n\nThere are rumors of one such demon hunter out in Nagrand. His " ..
                "name is Altruis. He hates all demons with a passion and will help us if you can convince " ..
                "him that you share his goals.\n\nGo to western Nagrand and find him. He might be willing " ..
                "to shed some light on these new demon hunter training grounds.",
        },
        [10691] = {
            description = "This book... I could use it to increase my power tenfold... No! It would end " ..
                "up corrupting my very soul, this I am sure of. Return to those who sent you here, " ..
                "<name>.\n\nYou now have the means to stop Varedis. Wait until he manifests his demonic " ..
                "form through metamorphosis, at that point you will need to burn the book in his " ..
                "presence. That will be the only way you can deprive him of his power.",
        },
        [10692] = {
            description = "Of course we must destroy this book, but not before we use it to destroy " ..
                "Varedis.\n\nIf we're to shut down this academy of Illidan imitators, we'll have to deal " ..
                "not just with Varedis but also the three night elf masters that assist him: Alandien, " ..
                "Theras and Netharel.\n\nGather a suitable force and return to the Ruins of Karabor. " ..
                "Follow Altruis's instructions for defeating Varedis. Hopefully his plan will work - " ..
                "otherwise... it'll have been a pleasure working with you.",
            rewardChoices = {{31013, 1}, {30933, 1}, {31010, 1}, {31002, 1}, {30948, 1}, {31009, 1}},
        },
        [10704] = {
            description = "A message was embedded in the ata'mal crystal that you recovered. Nexus-Prince " ..
                "Haramad has given us information vital to our campaign against Tempest Keep.\n\nHe tells " ..
                "us that there are two pieces, shards to a key, which, when combined, will unlock the " ..
                "keep's Arcatraz satellite.\n\nOne half is possessed by an ancient in the Botanica known " ..
                "as Warp Splinter. The other is held by Pathaleon the Calculator inside the " ..
                "Mechanar.\n\nBring both shards to me and I will combine them into the Arcatraz key.",
            rewardChoices = {{31465, 1}, {31461, 1}, {31464, 1}, {31462, 1}, {31460, 1}},
            rewardItems = {{31084, 1}},
            rewardMoney = 132000,
        },
        [10705] = {
            description = "I hope you're not shocked when I reveal to you that the pieces of the " ..
                "Medallion of Karabor you obtained from my minions are mere replicas.\n\n< Akama shows " ..
                "you an identical medallion in his open palm.>\n\nMy Deathsworn and I have kept the " ..
                "secret from Illidan for as long as possible. We are however, still missing the final " ..
                "piece.\n\nUdalo came to me in dreams to announce he had found it. Unfortunately he is " ..
                "held by Kael'thas inside the Arcatraz in Tempest Keep. Find him and see what he knows.",
        },
        [10706] = {
            description = "Before he died, Udalo appears to have written a single word on the floor " ..
                "beneath him. The writing is barely legible but you recognize the word " ..
                "Atam'al.\n\nPerhaps Akama will understand the meaning of his brethren's message.",
        },
        [10707] = {
            description = "It has been known to us that the fel orcs, under Illidan's command, have " ..
                "guarded an Ata'mal crystal known as the Heart of Fury at the Ata'mal Terrace. They cloud " ..
                "its presence with dark magic, to keep it from the Sha'tar.\n\nFight your way to the " ..
                "Atam'al Terrace outside the Black Temple and turn your eyes to the sky. Shadowlord " ..
                "Deathwail will circle the terrace, beyond your reach. You will have to slay him and his " ..
                "warlocks before you can obtain the crystal.\n\nIt won't be easy, <name>. I wish you luck.",
        },
        [10725] = {
            description = "Your services have gone above and beyond what is expected of you, <name>. You " ..
                "are but a step away from achieving the highest honor available to non-citizens of " ..
                "Dalaran.\n\nContinue to prove your loyalty to us and I will empower your signet to its " ..
                "full capacity.",
            rewardItems = {{29287, 1}},
        },
        [10726] = {
            description = "Your services have gone above and beyond what is expected of you, <name>. You " ..
                "are but a step away from achieving the highest honor available to non-citizens of " ..
                "Dalaran.\n\nContinue to prove your loyalty to us and I will empower your signet to its " ..
                "full capacity.",
            rewardItems = {{29290, 1}},
        },
        [10727] = {
            description = "Your services have gone above and beyond what is expected of you, <name>. You " ..
                "are but a step away from achieving the highest honor available to non-citizens of " ..
                "Dalaran.\n\nContinue to prove your loyalty to us and I will empower your signet to its " ..
                "full capacity.",
            rewardItems = {{29283, 1}},
        },
        [10728] = {
            description = "Your services have gone above and beyond what is expected of you, <name>. You " ..
                "are but a step away from achieving the highest honor available to non-citizens of " ..
                "Dalaran.\n\nContinue to prove your loyalty to us and I will empower your signet to its " ..
                "full capacity.",
            rewardItems = {{29279, 1}},
        },
        [10729] = {rewardItems = {{29284, 1}}},
        [10730] = {rewardItems = {{29288, 1}}},
        [10731] = {rewardItems = {{29280, 1}}},
        [10732] = {rewardItems = {{29276, 1}}},
        [10733] = {
            description = "You've chosen your path, <class>. Now it is up to you to travel the path to " ..
                "wherever it may lead.\n\nYou will find that having friends among the Archmages of " ..
                "Dalaran has its advantages. Serve us well and your deeds will not go unrewarded.",
            rewardItems = {{29285, 1}},
        },
        [10734] = {
            description = "You've chosen your path, <class>. Now it is up to you to travel the path to " ..
                "wherever it may lead.\n\nYou will find that having friends among the Archmages of " ..
                "Dalaran has its advantages. Serve us well and your deeds will not go unrewarded.",
            rewardItems = {{29289, 1}},
        },
        [10735] = {
            description = "You've chosen your path, <class>. Now it is up to you to travel the path to " ..
                "wherever it may lead.\n\nYou will find that having friends among the Archmages of " ..
                "Dalaran has its advantages. Serve us well and your deeds will not go unrewarded.",
            rewardItems = {{29281, 1}},
        },
        [10736] = {
            description = "You've chosen your path, <class>. Now it is up to you to travel the path to " ..
                "wherever it may lead.\n\nYou will find that having friends among the Archmages of " ..
                "Dalaran has its advantages. Serve us well and your deeds will not go unrewarded.",
            rewardItems = {{29277, 1}},
        },
        [10738] = {
            description = "You have not disappointed us, <name>. We continue to have very high hopes for " ..
                "you, however.\n\nContinue to serve the Violet Eye and you will be appropriately rewarded.",
            rewardItems = {{29286, 1}},
        },
        [10739] = {
            description = "You have not disappointed us, <name>. We continue to have very high hopes for " ..
                "you, however.\n\nContinue to serve the Violet Eye and you will be appropriately rewarded.",
            rewardItems = {{29291, 1}},
        },
        [10740] = {
            description = "You have not disappointed us, <name>. We continue to have very high hopes for " ..
                "you, however.\n\nContinue to serve the Violet Eye and you will be appropriately rewarded.",
            rewardItems = {{29282, 1}},
        },
        [10741] = {
            description = "You have not disappointed us, <name>. We continue to have very high hopes for " ..
                "you, however.\n\nContinue to serve the Violet Eye and you will be appropriately rewarded.",
            rewardItems = {{29278, 1}},
        },
        [10742] = {
            description = "Now it comes to this. We will bring Goc forth from his lair, and we will " ..
                "destroy him. With Goc dead, the Bladespire ogres will threaten the Mok'Nathal no longer. " ..
                "Go to Goc 's altar outside Gruul's Lair, then blow my horn. I will come, and we will " ..
                "face the son of Gruul together.",
            rewardChoices = {{31546, 1}, {31544, 1}, {31545, 1}, {31547, 1}, {31549, 1}, {31548, 1}},
            rewardMoney = 132000,
        },
        [10744] = {
            description = "You must bring word of our success to Kurdran Wildhammer immediately! His men, " ..
                "under Wing Commander Nuainn, have fought nonstop to keep Wildhammer Stronghold safe and " ..
                "your return will surely bolster their spirits. With the threat from the Legion out of " ..
                "the way, Kurdran can finally turn his attention to dealing with the forces of Illidan. " ..
                "Our place here is far from secure, but we've won a major victory this day.",
            rewardChoices = {{30973, 1}, {30924, 1}, {31025, 1}, {31033, 1}, {31031, 1}},
            rewardMoney = 44000,
        },
        [10745] = {
            description = "You must bring word of our success to Overlord Or'barokh immediately! Now that " ..
                "we've crushed the Legion and obliterated their presence in Shadowmoon Valley, the " ..
                "overlord can turn his attention to our other foes.\n\nAlthough the Kor'kron guard will " ..
                "never admit it, they'll be glad we're no longer fighting on two fronts.",
            rewardChoices = {{30973, 1}, {30924, 1}, {31025, 1}, {31033, 1}, {31031, 1}},
            rewardMoney = 44000,
        },
        [10750] = {
            description = "Word has come from my wind riders, <name>. The Eclipsion blood elves are " ..
                "planning something big. They have begun forming their armies at the Path of Conquest, " ..
                "far to the southeast - adjacent to Eclipse Point.\n\nI want you to travel to the Path of " ..
                "Conquest and assess the situation. Once you have done so, use this flare gun to signal a " ..
                "wind rider. One will swoop down from the sky to meet you. Inform them of what you have " ..
                "discovered and they will give you your next set of orders.",
        },
        [10751] = {
            description = "We're going to need more time, <race>. I'm going to fly further ahead with " ..
                "some of the other wind riders. Hopefully, we can gather some more information. What I " ..
                "need from you now is to clear a path and more importantly, keep their arrows pointed " ..
                "away from us!\n\nCall for a wind rider with the Kor'kron flare gun once you have thinned " ..
                "their numbers.",
        },
        [10754] = {
            description = "This freshly cast mold was to be used to create a key of some sort. From the " ..
                "image engraved on its back, it appears to be related to Hellfire Citadel.\n\nMaybe this " ..
                "could prove to interest to Danath, the force commander at Honor Hold.",
        },
        [10755] = {
            description = "This freshly cast mold was to be used to create a key of some sort. From the " ..
                "image engraved on its back, it appears to be related to Hellfire Citadel.\n\nMaybe this " ..
                "could prove to interest to Nazgrel, the leader of the Horde's forces in Thrallmar.",
        },
        [10756] = {
            description = "The symbol on the key's handle... it is hard to make it out inside the mold, " ..
                "but I recognize it as the Shattered Hand's own.\n\nThere is a good chance this key will " ..
                "allow you to enter the Shattered Halls.\n\nSpeak to Rohok, our resident blacksmith. If " ..
                "anyone can forge this key it is he.",
        },
        [10757] = {
            description = "Fel orc blacksmiths may not be the most skilled in the world, but there is " ..
                "some craftsmanship to their trade. Only fel iron can be used with this mold if we want " ..
                "to end up with a working key - anything else would probably end up breaking it.\n\nBring " ..
                "me some fel iron bars, a bit of arcane dust and motes of fire. I'll try my hand at it, " ..
                "but I make no promises.",
        },
        [10758] = {
            description = "It's no good, <name>! No matter how many coals I put to the fire, it's just " ..
                "not enough heat.\n\nThere's only one thing I can think of that is hot enough to temper " ..
                "this key and it is the insides of the Legion's fel reavers.\n\nI've only ever seen one " ..
                "downed once. I remember seeing its insides fuming, shooting fire and steam as it fell. " ..
                "Take this mold and plunge it into a fallen fel reaver. I recommend you get yourself some " ..
                "friends if you plan to take one down.",
            rewardItems = {{28395, 1}},
        },
        [10762] = {
            description = "The symbol on the key's handle... it is hard to make it out inside the mold, " ..
                "but I recognize it at the Shattered Hand's own.\n\nThere is a good chance this key will " ..
                "allow you to enter the Shattered Halls.\n\nSpeak to Dumphry. He is a master of his " ..
                "craft. If he can't craft this key for you, no one can.",
        },
        [10763] = {
            description = "Fel orcs might be complete barbarians but their smithing is not as primitive " ..
                "as you might think. Only fel iron can be used with this mold if we want to end up with a " ..
                "working key - anything else would probably end up breaking it.\n\nBring me some fel iron " ..
                "bars, a bit of arcane dust and motes of fire. I'll try my hand at it, but I make no " ..
                "promises.",
        },
        [10764] = {
            description = "It's not working, <lad/lass>. I cannot give it enough heat... the materials " ..
                "will not be properly tempered.\n\nYou know, the Fel Reavers used by the Burning Legion " ..
                "are powered by a scalding core of fel fire - it burns much hotter than normal " ..
                "fire.\n\nIf you could find enough people to take one down, you could heat the mold in " ..
                "the insides of the fallen reaver. Beware, <class>, those fel reavers pack quite a punch.",
            rewardItems = {{28395, 1}},
        },
        [10765] = {
            description = "At the southern end of the Path of Conquest, near a stationary caravan, I " ..
                "discovered what looked like a meeting between a giant and a blood elf chancellor. You've " ..
                "probably already noticed the smaller giants on the path as well. Something is just not " ..
                "right about all of this, grunt.\n\nI want you to fight your way to this meeting and " ..
                "break up the party. Recover whatever you can from the scene and then call for one of us " ..
                "with the flare gun.",
        },
        [10766] = {
            description = "Now that we have access to the Legion's base at Invasion Point: Cataclysm, we " ..
                "need to figure out a way to shut down their operations there. Wildhammer Stronghold " ..
                "won't be safe until the Legion's presence is erased from Shadowmoon Valley.\n\nI've sent " ..
                "an advance party up to the invasion point to help you formulate a plan to destroy the " ..
                "Legion's supplies. Go back to Legion Hold and step into the teleporter with the green " ..
                "crystals above it. Plexi will meet you at your destination.",
        },
        [10767] = {
            description = "Now that we have access to the Legion's base at Invasion Point: Cataclysm, we " ..
                "need to figure out a way to shut down their operations there. Shadowmoon Village won't " ..
                "be safe until the Legion's presence is erased from the valley.\n\nI've sent an advance " ..
                "party up to the invasion point to help you formulate a plan to destroy the Legion's " ..
                "supplies. Go back to Legion Hold and step into the teleporter with the green crystals " ..
                "above it. Nakansi will meet you at your destination.",
        },
        [10768] = {
            description = "The wind riders must return to Shadowmoon Village to prepare for the next " ..
                "phase of our assault. What I need from you now are the tabards that these blood elves " ..
                "wear.\n\nWhen you have collected enough tabards, call for a wind rider using the " ..
                "Kor'kron flare gun. Prepare yourself for a bit of espionage, <race>!",
        },
        [10769] = {
            description = "Researcher Tiorus was kind enough to put this concoction together for the " ..
                "final strike. I merely pour it upon this tabard that you have provided for me and the " ..
                "item is imbued with the essence of the Illidari filth.\n\nTake the enchanted tabard and " ..
                "travel to the Eclipsion Fields, southwest of Eclipse Point. Once there, use the tabard " ..
                "to transform into an agent of Illidan. While in disguise, slay the crazed colossi that " ..
                "wander the field. They will think it an attack by the Eclipsion and sever all ties!",
            rewardChoices = {{31075, 1}, {31077, 1}, {31076, 1}, {31078, 1}},
            rewardMoney = 132000,
        },
        [10772] = {
            description = "My gryphon riders have come back with a bit of news! The Eclipsion blood elves " ..
                "are planning something big. They've begun forming their armies at the Path of Conquest, " ..
                "located east of here - adjacent to Eclipse Point.\n\nI want you to travel to the Path of " ..
                "Conquest and assess the situation. Once you've done so, use this flare gun to signal a " ..
                "gryphon rider. One will swoop down from the sky to meet you. Tell 'em what you've " ..
                "discovered and they'll give you the next set of orders.",
        },
        [10773] = {
            description = "We're going to need more time, <race>. I'm going to fly further ahead with " ..
                "some of the other gryphon riders. Hopefully, we can gather some more information. What I " ..
                "need from you now is to clear a path and more importantly, keep their arrows pointed " ..
                "away from us!\n\nCall for a gryphon rider with the Wildhammer flare gun once you have " ..
                "thinned their numbers.",
        },
        [10774] = {
            description = "At the southern end of the Path of Conquest, near a stationary caravan, I " ..
                "discovered what looked like a meeting between a giant and a blood elf chancellor. What " ..
                "are giants even doing here? Something is just not right about all of this, grunt.\n\nI " ..
                "want you to fight your way to this meeting and break up the party. Recover whatever you " ..
                "can from the scene and then call for one of us with the flare gun.",
        },
        [10775] = {
            description = "The gryphon riders must return to Wildhammer Stronghold to prepare for the " ..
                "next phase of our assault. What I need from you now are the tabards that these blood " ..
                "elves wear.\n\nWhen you have collected enough tabards, call for a gryphon rider using " ..
                "the Wildhammer flare gun. Prepare yourself for a bit of espionage, <race>!",
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
        [10781] = {
            description = "They are probably searching for you on the Path of Conquest as we speak. You " ..
                "must make your escape, <race>!\n\nLeave me, I'm done for... They... I think I hear them " ..
                "coming. It's now or never! Get out! If you choose to stay, you will have to fight!\n\nIf " ..
                "you fight and somehow manage to survive, take what you have learned here and deliver " ..
                "that knowledge to A'dal in Shattrath City.",
            rewardChoices = {{31380, 1}, {31381, 1}, {31382, 1}, {31383, 1}},
            rewardItems = {{31408, 1}},
            rewardMoney = 132000,
        },
        [10793] = {
            description = "This journal documents the recent activities of Illidan's armies. It also " ..
                "explains why Val'zareq was parading around the Path of Conquest. He was personally " ..
                "responsible for the capture of a high general of the Sha'tar.\n\nThis general is being " ..
                "held at a post known as Crimson Watch, located at the southern end of the Path of " ..
                "Conquest. A mysterious faction, calling itself the Crimson Sigil, is charged with his " ..
                "incarceration. If you choose to investigate, it would be wise to bring allies.",
        },
        [10804] = {
            description = "Something has them spooked, <race>.\n\n< Mordenai points to the nether drakes " ..
                "flying overhead.>\n\nThey won't even come down to feed. I have seen several fall to the " ..
                "earth, dead from exhaustion before their bodies hit the ground.\n\nWe must save them! " ..
                "The Rocknail flayers that are found near the crystals are their natural prey. Kill " ..
                "flayers and take their carcasses. Place a carcass in the field and stand extremely " ..
                "still. As long as you do not make any aggressive motions, they will not attack you.",
        },
        [10806] = {
            description = "The time has come for us to face Goc, the master of the Bladespire ogres. It " ..
                "is also time that I take a hand in events, to see the last of the gronn's life.\n\nTake " ..
                "my signet ring. When you come to the Altar of Goc, use it, and I will come to join " ..
                "you.\n\nTogether we will destroy Goc.",
            rewardChoices = {{31546, 1}, {31544, 1}, {31545, 1}, {31547, 1}, {31549, 1}, {31548, 1}},
            rewardMoney = 132000,
        },
        [10807] = {
            description = "The Ashtongue tribe is feared among all Broken. It consists of the most " ..
                "vicious and bloodthirsty individuals, handpicked by Akama himself. They are as fierce " ..
                "and ruthless as any naga, demon or blood elf in Illidan's army and they have been " ..
                "deployed in large numbers at the Ruins of Baa'ri, to the north. Go there and put a dent " ..
                "in their numbers before they get a chance to mount an attack on us.",
        },
        [10811] = {
            description = "Their patron soars high above, <name>. Perhaps the kindness that you showed " ..
                "his children has moved his heart. Seek Neltharaku out and enlist his aid. Together, you " ..
                "may be able to solve the plight of the Netherwing drakes.\n\n< Mordenai points to the " ..
                "sky.>\n\nFly high, friend...",
        },
        [10814] = {
            description = "I have information that you may find useful. Please listen to what I have to " ..
                "tell you, <race>.",
        },
        [10816] = {
            description = "You did well against the Broken in Baa'ri, <name>. Let's see how well you do " ..
                "against Illidan's most feared army.\n\nThe fel orcs of the Shadowmoon Clan occupy the " ..
                "Ata'mal Terrace, once a very holy site where ata'mal crystals were used in spiritual " ..
                "ceremonies.\n\nWe had reason to believe they were hiding an actual ata'mal crystal in " ..
                "the vicinity, but our scrying has revealed nothing. Nevertheless, the fel orcs are on " ..
                "draenei holy ground and their presence must be dealt with.",
            rewardChoices = {{30940, 1}, {30961, 1}, {30922, 1}, {30958, 1}},
            rewardMoney = 44000,
        },
        [10817] = {
            description = "You did well against the Ashtongue Broken, <name>. I have another challenge " ..
                "for you, should you be up to it.\n\nNot too long ago, the Sanctum of the Stars suffered " ..
                "a tremendous attack by Illidan's fel orcs.\n\nWe've determined it was perpetrated by the " ..
                "Shadowmoon orcs who occupy the Ata'mal Terrace.\n\nShow them that the Scryers are not to " ..
                "be trifled with.",
            rewardChoices = {{30940, 1}, {30961, 1}, {30922, 1}, {30958, 1}},
            rewardMoney = 44000,
        },
        [10824] = {
            description = "The survival of the Scryers hinges on outrecruiting Kael'thas. Every pilgrim " ..
                "from Quel'Thalas that joins his side brings him closer to victory. The opposite is true " ..
                "for us.\n\nSoon, however, we will run out of recruits and it will come down to what side " ..
                "can kill the other quicker. Prove your worth to the Scryers by bringing me Sunfury " ..
                "signets worn by high-ranking blood elves allied with Kael'thas and Illidan. You'll find " ..
                "them at Eclipse Point to the west and the Ruins of Karabor, to the northeast.",
        },
        [10826] = {
            description = "By now it should be clear to you why we oppose the Burning Legion and those " ..
                "who serve them.\n\nIf you wish to prove yourself to the Aldor, bring me the insignias of " ..
                "high-ranking Legion and their Shadow Council followers. Here in Shadowmoon you will find " ..
                "a strong Legion presence to the far west in Legion Hold and the Deathforge.",
        },
        [10831] = {
            description = "I can teach you the ways of mooncloth tailoring, if you are interested.. By " ..
                "specializing in mooncloth tailoring, creating primal mooncloth will yield twice the " ..
                "normal amount and you will have access to several exclusive patterns. All that is " ..
                "required is that you pass a simple test.\n\nAs to the test, your task is to create a " ..
                "small sample of primal mooncloth in the moonwell at Cenarion Refuge. I will provide all " ..
                "the materials you'll need. When you've created the sample, bring it back to me for " ..
                "examination.",
        },
        [10832] = {
            description = "I can teach you the ways of spellfire tailoring if you wish, but be warned, " ..
                "it's a dangerous pursuit.\n\nCreating spellcloth in Netherstorm attracts powerful " ..
                "nether-wraiths. I'm searching for a way to lessen backlash, but I need more " ..
                "nether-wraith essence for my research.\n\nTake this beacon with you to Netherstorm and " ..
                "use it to summon a nether-wraith. Bring back its essence and I'll agree to teach you. As " ..
                "a spellfire tailor, you'll receive twice as much cloth and have access to exclusive " ..
                "patterns.",
        },
        [10833] = {
            description = "If you become a shadoweave specialist, you will make twice as much shadowcloth " ..
                "as an average tailor and have access to several exclusive patterns.\n\nOf course, any " ..
                "tailor can use the Altar of Shadows, but a shadoweave tailor possesses a deeper " ..
                "attunement to the altar, unlocking powers that few can fathom.\n\nTake this crystal to " ..
                "eastern Shadowmoon Valley, and find Netherwing Pass leading south from the Netherwing " ..
                "Fields. Near the world's edge, you will find the Altar of Shadows. Use the crystal there.",
        },
        [10836] = {
            description = "I require time so that I may devise a plan to save my children and mate. You " ..
                "will buy me this time, mortal.\n\nVenture into Dragonmaw Fortress, located on the " ..
                "eastern edge of the Netherwing Fields, and lay waste to all Dragonmaw orcs that you " ..
                "find. The ensuing chaos and confusion should have a considerable impact on their " ..
                "plans.\n\nBe warned, some of my kin are too far gone - their minds corrupted by the " ..
                "Dragonmaw. For them, the only resolution is death. You have my permission to end their " ..
                "lives as well.",
        },
        [10837] = {
            description = "I believe that I can imbue nethervine crystals with my own essence. The power " ..
                "contained within these imbued crystals should be sufficient to free enslaved drakes of " ..
                "their masters' grasps.\n\nTravel to Netherwing Ledge, an island located off the broken " ..
                "shelf of Shadowmoon Valley, to the southeast. It is on Netherwing Ledge that you will " ..
                "find nethervine crystals. Return to me when you have collected enough crystals to fill " ..
                "your packs.\n\nAnd <name>, Beware the Dragonmaw that now inhabit the island.",
        },
        [10854] = {
            description = "Take this enchanted nethervine crystal and make your way back to Dragonmaw " ..
                "Fortress. Once there, seek out the enslaved drakes and invoke the magic of the " ..
                "nethervine crystal. My own energies will pour forth, causing the drakes to break free " ..
                "from the bond of their captors. When you see that the drake has broken free, help it " ..
                "defeat its captor! It will most assuredly be weak from the imprisonment.\n\nRelease all " ..
                "that you can find and return to me, <name>.",
        },
        [10858] = {
            description = "It shames me to ask for your assistance once more, <name>, but you are my " ..
                "flight's only hope. Without my mate, the netherwing brood may die out " ..
                "completely.\n\nMake your way to the top of Dragonmaw Fortress and find Karynaku.\n\nWe " ..
                "will be flying overhead. Should a break appear in their defenses, the might of the " ..
                "netherwing will swoop down to assist you.",
        },
        [10866] = {
            description = "He hides in my thoughts, mortal. He waits for me to break... for me to bend to " ..
                "his will.\n\nAnd this will be his undoing. I will call for him. I will tell him that I " ..
                "will do as he asks. When he appears, kill him and take the key!\n\nKnow this: Zuluhed is " ..
                "an ancient orc with unknown powers. He has surely been empowered further by Illidan. You " ..
                "risk your life for me in doing as I ask. Are you certain you wish to make such a " ..
                "sacrifice?",
        },
        [10870] = {
            description = "Allow me to return you to Mordenai. I am certain that he wishes to see you " ..
                "once more.",
            rewardChoices = {{31490, 1}, {31491, 1}, {31492, 1}, {31493, 1}, {31494, 1}},
            rewardMoney = 132000,
            rewardXP = 19000,
        },
        [10871] = {
            description = "Allow me to return you to Mordenai. I am certain that he wishes to see you " ..
                "once more.",
            rewardChoices = {{31490, 1}, {31491, 1}, {31492, 1}, {31493, 1}, {31494, 1}},
            rewardMoney = 132000,
            rewardXP = 19000,
        },
        [10872] = {
            description = "He hides in my thoughts, mortal. He waits for me to break... for me to bend to " ..
                "his will.\n\nAnd this will be his undoing. I will call for him. I will tell him that I " ..
                "will do as he asks. When he appears, kill him and take the key!\n\nKnow this: Zuluhed is " ..
                "an ancient orc with unknown powers. He has surely been empowered further by Illidan. You " ..
                "risk your life for me in doing as I ask. Are you certain you wish to make such a " ..
                "sacrifice?",
        },
        [10873] = {
            description = "Our small outpost is under constant attack. Several nights ago, we were raided " ..
                "by the spiders of Netherweb Ridge, on the southeastern edge of the Bone Wastes. They " ..
                "poisoned many of our people, wrapped them in webs and carried them away. Some of our " ..
                "warriors took up arms and with little preparation pursued the spiders.\n\nWe have not " ..
                "seen the captives or our hunting parties since. We hope that some may still be alive, " ..
                "perhaps imprisoned by the spiders. Our numbers are few. Will you search for our people?",
            rewardMoney = 33000,
        },
        [10882] = {
            description = "<A discordant note can be detected in A'dal 's 'voice'.>\n\nPrince Kael'thas " ..
                "has chosen his warden poorly, and now the entities that we kept locked up within the " ..
                "Arcatraz are breaking free.\n\nOne in particular, a servant of the Old Gods known as " ..
                "Harbinger Skyriss, seeks to usher in his masters' vision of conquering all of the worlds " ..
                "in the universe.\n\n<name>, you must not allow him to escape. Return to Tempest Keep, " ..
                "enter the Arcatraz, and slay Harbinger Skyriss before it is too late!",
            rewardChoices = {{31747, 1}, {31749, 1}, {31748, 1}},
            rewardMoney = 132000,
        },
        [10883] = {
            description = "You have proven yourself capable of great feats, <name>. Your discovery of the " ..
                "Cipher of Damnation and Kael'Thas' involvement is most important to our cause. Should " ..
                "Kael use the cipher, what little is left of this world may collapse.\n\nA'dal is " ..
                "convinced that Kael must be stopped and now seeks adventurers willing to undergo trials. " ..
                "Those that prove their strength will be granted favor by the naaru.\n\n< Khadgar " ..
                "nods.>\n\nA'dal awaits...",
        },
        [10884] = {
            description = "Four trials you must pass before you are deemed worthy by the naaru.\n\nWithin " ..
                "the Shattered Halls of Hellfire Citadel are three of your people. They are held there by " ..
                "the merciless one, Kargath Bladefist. He seeks to execute them as a sign of his virility " ..
                "and power. You must save these prisoners before such an atrocity can come to pass. As " ..
                "proof of deed, bring me the unused axe of the executioner. It must not have a drop of " ..
                "blood on its blade!",
        },
        [10885] = {
            description = "Four trials you must pass before you are deemed worthy by the naaru.\n\nThe " ..
                "trial of strength is divided in two. You must destroy the leader of the Coilfang " ..
                "Steamvaults, Warlord Kalithresh, and bring me his trident. Slay the extra-planar being " ..
                "known as Murmur, in the Shadow Labyrinth of Auchindoun, and bring me his essence.\n\nDo " ..
                "this and you will have passed the trial of strength.",
        },
        [10886] = {
            description = "Four trials you must pass before you are deemed worthy by the naaru.\n\nIn our " ..
                "travels we have encountered many dangerous beings. Some of these beings we incarcerated " ..
                "and placed in what is now known as the Arcatraz of Tempest Keep.\n\nThere is one " ..
                "prisoner, however, that is a victim of circumstance. A stowaway who was in the wrong " ..
                "naaru vessel at the wrong time.\n\nVenture to the Arcatraz and rescue the gnome, " ..
                "Millhouse Manastorm. Ensure his survival.",
        },
        [10888] = {
            description = "Four trials you must pass before you are deemed worthy by the naaru.\n\nOnly " ..
                "one obstacle remains, mortal. Gather an army and travel to the lair of Magtheridon, deep " ..
                "inside Hellfire Citadel. Battle your way to the heart of the chamber and destroy the " ..
                "foul corrupter!",
            rewardItems = {{31746, 1}},
            rewardMoney = 132000,
        },
        [10897] = {
            description = "As you know, plants have properties that allow alchemists to re-energize and " ..
                "reinvigorate others through potions.\n\nMy familiarity with the plants of Outland allows " ..
                "me to teach alchemists how to make the most out of them. If you're interested in " ..
                "expanding your knowledge of potions, I have but one task to ask of you.\n\nHigh Botanist " ..
                "Freywinn in Tempest Keep is rumored to have written a comprehensive botany guide. Bring " ..
                "it to me along with samples of your work and I'll teach you the knowledge you seek.",
        },
        [10899] = {
            description = "Any alchemist will tell you that matter is malleable, any substance can be " ..
                "transformed into another - but nothing is really created or destroyed.\n\nA true master " ..
                "of transmutation can learn to overcome this limitation - and I can teach you how to " ..
                "obtain this mastery!\n\nAs a prospective transmuter you're undoubtedly familiar with " ..
                "primal might - the combination of the material representation of all primal forces. Show " ..
                "me proof of your transmuting prowess and I will share my knowledge with you.",
        },
        [10901] = {
            description = "Bring me the elemental signets that the cudgel requires!\n\nThe earthen signet " ..
                "is held by Gruul the Dragonkiller. Gruul can be found inside his lair in the Blade's " ..
                "Edge Mountains.\n\nThe second signet is the blazing heart of a creature known as " ..
                "Nightbane. This mythical beast is said to reside in the hallowed halls of the prophet, " ..
                "Medivh.\n\nMake haste!",
            rewardMoney = 132000,
        },
        [10902] = {
            description = "I've devoted my life to perfecting my elixirs. Despite my success, I haven't " ..
                "been able to create an elixir of eternal life.\n\nI think I know the reagent I'm " ..
                "missing. I've heard of a place called the Caverns of Time in Azeroth where intruders " ..
                "known as rift lords and rift keepers phase in and out of the timeline.\n\nThis intrusive " ..
                "time-shifting creates tears in time itself, twisting it infinitely into crystallized " ..
                "essences. Bring these to me along with samples of your work and I'll teach you all I " ..
                "know.",
        },
        [10905] = {
            description = "My knowledge of alchemy is vast. It is, however, general in nature. If you " ..
                "wish to specialize, you will have to find others who have narrower fields of " ..
                "study.\n\nIf you wish to specialize in potion creation, I would recommend that you seek " ..
                "the help of Lauranna Thar'well of the Cenarion Expedition.\n\nHer knowledge of plants " ..
                "will allow you to make the most of your raw materials. Look for her in Zangarmarsh and " ..
                "tell her I sent you to her.",
        },
        [10906] = {
            description = "My knowledge of alchemy is vast. It is, however, general in nature. If you " ..
                "wish to specialize, you will have to find others who have narrower fields of " ..
                "study.\n\nIf you wish to specialize in elixir creation, I would recommend that you seek " ..
                "the help of the arakkoa known as Lorokeem.\n\nHis knowledge of elixirs is unmatched, yet " ..
                "he squanders his skill pursuing an elixir of eternal life. Find him and see what he can " ..
                "teach you.",
        },
        [10907] = {
            description = "My knowledge of alchemy is vast. It is, however, general in nature. If you " ..
                "wish to specialize, you will have to find others who have narrower fields of " ..
                "study.\n\nIf you wish to specialize in transmutation, I would recommend that you seek " ..
                "the help of the ethereal known as Zarevhi. He resides in the Stormspire in " ..
                "Netherstorm.\n\nHis mastery of transmutation is... well, outlandish! See what you can " ..
                "learn from him, but beware - ethereals drive a hard bargain.",
        },
        [10914] = {
            description = "It is not enough. A hero is needed. Our forces are overwhelmed as the Auchenai " ..
                "continue to grow in number.\n\n< Commander Ra'vaj looks at you.>\n\nWill you be the " ..
                "hero? Return to the field of battle and strike at their soldiers. Keep them occupied so " ..
                "that my scouts can get behind their lines and see what they are creating.",
        },
        [10930] = {
            description = "I was right! These carcasses you brought me belong to the baby bone worms. Do " ..
                "you know what that means? It means that somewhere out there is a big one! I think we can " ..
                "get it to come out if we can provide the right kind of food. Let's see... something big! " ..
                "Yes!\n\nI remember seeing clefthooves east of here on the other side of the Bone Wastes. " ..
                "Get out there and kill a clefthoof. Once it's dead, use the drums. Hopefully the big one " ..
                "will come up to feed. If you manage to kill it, bring me its organs!",
            rewardChoices = {{31756, 1}, {31758, 1}, {31759, 1}},
        },
        [10938] = {
            description = "Now that you have gathered all of the Blessings cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{31856, 1}},
        },
        [10939] = {
            description = "Now that you have gathered all of the Storms cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{31857, 1}},
        },
        [10940] = {
            description = "Now that you have gathered all of the Furies cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{31858, 1}},
        },
        [10941] = {
            description = "Now that you have gathered all of the Lunacy cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{31859, 1}},
        },
        [10944] = {
            description = "Thanks again, <name>. I recognize your name. Akama has entrusted you with his " ..
                "plans and so I will trust you as well.\n\nThe naga discovered I was working against " ..
                "Illidan and tried to get me to speak by torturing me. I did not tell them a thing - " ..
                "Akama himself taught me to master pain through meditation.\n\nIllidan asked the naga to " ..
                "bring me to him. He would have seen right through my flesh and into my soul's deepest " ..
                "secrets.\n\nAkama must be warned. Our plans are in jeopardy!",
            rewardMoney = 88000,
        },
        [10946] = {
            description = "Olum's sacrifice was tremendous. I would never have asked him to give up his " ..
                "life myself. But it is done.\n\nIf we're to lure Illidan back into a false sense of " ..
                "security, we need to do his bidding - at least for now.\n\nI command a vast army of " ..
                "Ashtongue, but - aside from the Deathsworn - none can be trusted.\n\nYou are to perform " ..
                "the deed that Illidan demands. Take this cowl; it is magical in nature. You will appear " ..
                "to be one of my men to any who see you slaying Kael's phoenix, Al'ar.",
            rewardMoney = 132000,
        },
        [10947] = {
            description = "Illidan's attention is now on Kael'thas, thanks to you. The time has come to " ..
                "make our move.\n\nI've had a vision of an artifact that will aid us in our final " ..
                "struggle - the phylactery of a lich known as Winterchill. Unfortunately its power was " ..
                "lost forever after his defeat in the Battle of Mount Hyjal.\n\nThere might be a way to " ..
                "retrieve this artifact, however. Legend speaks of a place in Azeroth guarded by bronze " ..
                "dragons... a place where past and present meet. It is there you will find what we seek.",
        },
        [10948] = {
            description = "You might wonder why I go to such lengths to hide my intentions. Why not throw " ..
                "my lot in openly with the naaru?\n\nMy very essence - my soul - is held prisoner inside " ..
                "the Black Temple. Illidan could destroy me any moment... until now! This phylactery will " ..
                "allow me to regain control of my soul.\n\nThe time has come, <name>. I'll lead Maiev and " ..
                "my Deathsworn to Illidan's doorstep.\n\nSpeak to A'dal and and tell him of our plan. If " ..
                "we strike together we'll break through Illidan's defenses.",
        },
        [10949] = {
            description = "< A'dal shows you an image of a naaru outside of the Black Temple, fighting " ..
                "alongside draenei vindicators and blood elf magisters. You immediately understand that " ..
                "this is the distraction Akama is waiting for.>",
            rewardMoney = 44000,
        },
        [10957] = {
            description = "When Illidan obtained the Broken's allegiance, Akama was our wisest. He knew " ..
                "that openly opposing the Betrayer would lead to the extinction of our race.\n\nInstead " ..
                "he has plotted and schemed for this very moment under utmost secrecy. Failure would be " ..
                "catastrophic... not just for Akama, not just for the Broken, but for all of Outland. No " ..
                "one this close to Illidan has ever been able to deliver such a terrible blow to " ..
                "him.\n\nHelp Akama free his soul and he will grant you access to Illidan's sanctum.",
        },
        [10958] = {
            description = "<As you look up at Xi'ri, your mind becomes focused and your will determined. " ..
                "Your work here is not done; you must go inside the Black Temple and find Akama's " ..
                "followers.>\n\n<Much depends on Akama's success.>",
        },
        [10959] = {
            description = "With Illidan's lieutenants defeated, Akama will be able to force open the " ..
                "doors to Illidan's sanctum. Be ready to bring your force inside as soon as Akama " ..
                "does.\n\nWe still do not know what has become of Maiev, but we must make our move " ..
                "without her.\n\nI hope your force is up to the task. Illidan will not be pleased to see " ..
                "Akama.",
            rewardItems = {{32757, 1}},
            rewardMoney = 132000,
        },
        [10969] = {
            description = "It would seem that an outside force has taken an interest in the business " ..
                "practices of the Consortium. Five Consortium dealers have gone missing in the past two " ..
                "days. We have reason to believe the Ethereum are involved. If you are interested in " ..
                "assisting, seek out Commander Ameer at the Protectorate Watch Post.\n\nYou will find the " ..
                "Protectorate Watch Post directly east of here on the next island.",
            rewardMoney = 4400,
        },
        [10970] = {
            description = "We salvaged this prison orb on our last scouting mission into Ethereum " ..
                "territory. We'd have never found it had it not been for the distress signal that it was " ..
                "faintly emitting.\n\nWe think one of our own might be locked up in there but we have no " ..
                "way of opening the orb up without harming whatever is inside.\n\nWhat we know about the " ..
                "Ethereum is that any of their members could - at any given time - be carrying a key to " ..
                "unlock an orb. Retrieve one and return so that we may uncover the mysteries of this orb.",
            rewardMoney = 44000,
        },
        [10971] = {
            description = "<Ameer holds up a tag.>\n\nI found this prisoner I.D. tag with the remains of " ..
                "the fallen vanguard. I can only assume that all of their prisoners are tagged in the " ..
                "same manner.\n\nI'm going to start cataloguing the tags in hopes of making sense of " ..
                "their penal system. If in your adventures you find more Ethereum prison keys, you can " ..
                "use them to open the Ethereum prisons at the Ethereum Staging Grounds - directly south " ..
                "of here. Bring me back any and all I.D. tags that you find.",
            rewardMoney = 44000,
        },
        [10972] = {
            description = "I am in need of more I.D tags, <name>. What I've discovered thus far is that " ..
                "this is not just a way to catalogue prisoners but it also documents locations!\n\nOnce " ..
                "this code is broken we'll be able to pinpoint exactly where all of our allies are held " ..
                "and free them with minimal hostile action received.",
        },
        [10973] = {
            description = "I have cracked the code! Each tag is broken up into several segments. The " ..
                "front side of the tag is always the same and states: \"A Thousand Worlds...\" I am " ..
                "unsure as to the meaning of this phrase but it sounds insidious.\n\nOn the back side of " ..
                "the tag are the vital statistics. The first set of runes indicates location and the " ..
                "second indicates prisoner type. Furthermore, it would seem that the keys can be combined " ..
                "to form a special key that accesses another prison type. Now I just need more keys...",
            rewardMoney = 132000,
        },
        [10974] = {
            description = "The Ethereum have a settlement on the northernmost shelf of Blade's Edge " ..
                "Mountains known as Bash'ir's Landing. According to the key tablet, much larger versions " ..
                "of the prisons are kept at Bash'ir's. It should also be noted that the Ethereum refer to " ..
                "those prisons as stasis chambers.\n\nThe key tablet grants access to a very specific " ..
                "stasis chamber at the landing known as Stasis Chamber Alpha. Take the key and " ..
                "investigate.\n\nMy image will be awaiting your return at Bash'ir's Landing. Speak to me " ..
                "there.",
            rewardItems = {{32064, 1}},
        },
        [10975] = {rewardItems = {{29750, 1}}, rewardMoney = 44000},
        [10976] = {
            description = "What I must now know is what the Ethereum have held inside the Mana-Tombs of " ..
                "Auchindoun.\n\nIn your battles against the beasts of the stasis chambers of Bash'ir you " ..
                "may run across an item known as the Mark of the Nexus-King. Should you find such an " ..
                "item, return it to me immediately! It is the final piece in crafting a key that will " ..
                "allow access to the stasis chamber inside the Mana-Tombs.",
            rewardMoney = 44000,
        },
        [10977] = {
            description = "The Mark of the Nexus-King that you recovered has allowed me to forge a new " ..
                "key for the stasis chambers found inside the Mana-Tombs.\n\nAccording to the glyphs on " ..
                "the mark, two exist: one near the front and one near Nexus-Prince Shaffar. This key that " ..
                "I am about to give you will open the stasis chamber near the front.\n\nI want you to go " ..
                "to the Mana-Tombs of Auchindoun and open the Mana-Tombs Stasis Chamber.",
            rewardItems = {{29434, 5}},
            rewardMoney = 132000,
        },
        [10981] = {rewardItems = {{32079, 1}}},
        [10982] = {rewardItems = {{32092, 1}}, rewardMoney = 132000},
        [10983] = {
            description = "Mog'dorg wise! Him send Grok to city, look for help. Bloodmaul clan need " ..
                "help.\n\nMog'dorg say, send powerful little ones to him at Blade's Edge Mountains. Him " ..
                "stand on tower at Circle of Blood. Mog'dorg wise!",
            rewardMoney = 4400,
        },
        [10984] = {
            description = "< V'eru 's voice fills your mind with crystalline tone and clarity.>\n\nThere " ..
                "is an ogre down in the Lower City, pleading for the assistance of passersby. They have " ..
                "all turned a deaf ear upon his plight.\n\nDo you think you might aid him?\n\nHis name is " ..
                "Grok, and he is sitting near the merchants to the southeast.\n\nThank you, <name>.",
        },
        [10985] = {
            description = "< Xi'ri pulses with lights as the Aldor and Scryer forces around him respond " ..
                "to his orders. Xi'ri 's army is ready to push Illidan's forces back and create a " ..
                "distraction for Akama. The naaru awaits your request to begin the attack.>",
            rewardItems = {{32649, 1}},
        },
        [10989] = {
            description = "Mog'dorg the Wizened waits for you at top of da tower. He tells me to look for " ..
                "a <race> <class> just like you. You go speak with him about smart things.\n\nGo now, but " ..
                "don't tell no one. It's a secret!",
        },
        [10995] = {
            description = "To the east, at the terminus of Dragons' End, is the Cursed Hollow. Therein, " ..
                "Grulloc, son of Gruul, plots his dimwitted schemes.\n\nI heard that one of his " ..
                "possessions was stolen from him through trickery. Was that you? Unfortunate that he was " ..
                "not slain in the process.\n\nIf we are to regain our freedom, I would have you take his " ..
                "most prized possession, a dragon skull from when he rejoiced in his father's slaying of " ..
                "the Black Dragonflight. The only way you'll get the skull is to vanquish him.",
            rewardMoney = 88000,
        },
        [10996] = {
            description = "On the Razor Ridge, above and to the southeast, Maggoc patrols. His father " ..
                "assigned him as the warden of the eastern mountain range, and he revels in terrorizing " ..
                "any creature that gets in his way.\n\nAs a son of Gruul, he must be done away with if my " ..
                "clan is to survive. That's where you come in.\n\nMaggoc carries a treasure chest with " ..
                "him at all times. Prove to me that he has been slain by bringing me his precious chest. " ..
                "Feel free to keep whatever you find within it.",
            rewardMoney = 88000,
        },
        [10997] = {
            description = "Are you familiar with Shattrath City, <class>? Above it to the northwest is a " ..
                "place called the Barrier Hills, which you can only get to upon a flying mount.\n\nOne of " ..
                "Gruul's sons, Slaag, exiled himself and took control of the Gordunni ogres that reside " ..
                "there. Even at such a distance, we cannot afford to leave him in peace, lest he return " ..
                "when the rest of his brothers have been slain.\n\n<name>, you must travel there, and " ..
                "bring back his standard as proof that he has been dealt with.",
            rewardMoney = 88000,
        },
        [10998] = {
            description = "There is one more gronn to be slain: Skulloc Soulgrinder. He keeps himself " ..
                "hidden away, but there is a way to coax him forth.\n\nHe was trained by an ogre warlock " ..
                "known as Vim'gol the Vile, whose grimoire you must retrieve!\n\nVim'gol must be summoned " ..
                "by yourself, and four others, each standing within a different fire ring at his circle. " ..
                "Find Vim'gol's Circle in the mountains, to the northeast, near the Broken Wilds.\n\nAnd, " ..
                "<name>, if you hear Vim'gol talk about growing bigger, get back to the fire rings!",
            rewardMoney = 88000,
        },
        [11000] = {
            description = "The grimoire is the key to Skulloc's downfall.\n\nRead aloud from the book at " ..
                "Soulgrinder's Barrow to initiate the ritual. An object known as the Soulgrinder will " ..
                "appear, as well as Skulloc's ghostly victims, who will try to destroy it. You must keep " ..
                "them from doing so long enough to force Skulloc fully into the world.\n\nFind the barrow " ..
                "by heading north through the Daggermaw Canyon on the other side of the Circle of Blood. " ..
                "It is on the right side before Gruul's Lair.\n\nBring back Skulloc's soul.",
            rewardMoney = 132000,
        },
        [11002] = {
            description = "The source of Illidan Stormrage's fel orc army has been vanquished. The " ..
                "manufactory halts production of its grim product - at least for now. All that remains " ..
                "are a few trinkets and this severed head - a fitting trophy for a hero of the " ..
                "Alliance.\n\nReturn Magtheridon's head to Danath Trollbane at Honor Hold.",
            rewardChoices = {{28792, 1}, {28793, 1}, {28790, 1}, {28791, 1}},
            rewardMoney = 132000,
        },
        [11003] = {
            description = "The source of Illidan Stormrage's fel orc army has been vanquished. The " ..
                "manufactory halts production of its grim product - at least for now. All that remains " ..
                "are a few trinkets and this severed head - a fitting trophy for a hero of the " ..
                "Horde.\n\nReturn Magtheridon's head to Nazgrel at Thrallmar.",
            rewardChoices = {{28792, 1}, {28793, 1}, {28790, 1}, {28791, 1}},
            rewardMoney = 132000,
        },
        [11004] = {
            description = "Sky Commander Adaris was seriously injured during a Skettis incursion. He's " ..
                "been in and out of consciousness since.\n\nI fear he has succumbed to a feverish " ..
                "delirium. During brief lucid moments he demands that I prepare an elixir made from " ..
                "shadow dust carried by the arakkoa. He seems to believe it will allow him to see into a " ..
                "\"world of shadows\" where the arakkoa's true leaders dwell.\n\nI do not believe this " ..
                "nonsense for a second, but I fear he won't rest until I obtain such an elixir. Will you " ..
                "help?",
            rewardItems = {{32446, 1}},
            rewardMoney = 44000,
        },
        [11005] = {
            description = "Thank you for paying heed to my fevered rants. All along we had been trying to " ..
                "identify and destroy the Skettis chain of command; we had learned of three clerics known " ..
                "as the talonpriests, but we'd never seen them with our own two eyes. Now we know " ..
                "why.\n\nTalk to Severin to obtain more of the elixir he discovered. Use the elixir to " ..
                "find and kill the three talonpriests: Ishaal, Skizzik and Zellek. They're rumored to " ..
                "dwell in Veil Ala'rak, near the eastern shore of Blackwind Lake.",
        },
        [11006] = {rewardItems = {{32446, 1}}},
        [11007] = {
            description = "The air around you hums - a gentle hum. The naaru are aware of your victory. " ..
                "Perhaps they are the reason you were compelled to pick up this sphere from the " ..
                "still-twitching remains of Kael'thas Sunstrider. What secrets could it hold?\n\nPerhaps " ..
                "A'dal in Shattrath City could make sense of the item.",
            rewardChoices = {{30007, 1}, {30015, 1}, {30017, 1}, {30018, 1}},
            rewardMoney = 132000,
            rewardXP = 19000,
        },
        [11008] = {
            description = "You think you have what it takes to be part of the Skyguard? We'll have to see " ..
                "how you handle yerself in the air.\n\nThe arakkoa are breeding a gargantuan variety of " ..
                "their attack pets and are using it against our scouts. I want you to take these blasting " ..
                "charges and use them to destroy hatcheries above the arakkoa's dwellings. Avoid the " ..
                "monstrous kaliri guarding the hatcheries. They'll knock you off your mount before you " ..
                "know what hit you.",
            rewardMoney = 44000,
        },
        [11009] = {
            description = "Now that you have delivered us from bondage, we can begin the process of " ..
                "reunifying the clans. This will take some time; old grudges are difficult to " ..
                "overcome.\n\nBut more pressing, you must go to Ogri'la in the heavens above to the west. " ..
                "You must defend it, and us, from those forces above that the gronn used to protect us " ..
                "from: ethereals, demons, and worst of all, the black dragonflight.\n\nWhen you find ogre " ..
                "heaven, seek out the wisdom of Chu'a'lor on how best to proceed.",
        },
        [11010] = {
            description = "You have a flying mount... so what! You think you have what it takes to use it " ..
                "properly?\n\nForge Camp: Wrath and Forge Camp: Terror, to the north and south, are a " ..
                "major pain in my backside, as well as being a threat to peaceful Ogri'la. With all of " ..
                "those fel cannons shooting down the Skyguard left and right, we can't get through there " ..
                "to take care of business.\n\nYou want to prove yourself? Take these bombs and knock out " ..
                "their ammo stacks. Just don't let them shoot you down, too!",
            rewardMoney = 44000,
        },
        [11011] = {
            description = "Your defeat of Anzu, the raven god, is truly a remarkable accomplishment. He " ..
                "may not abandon his quest to return to Outland, I fear.\n\nAs long as he has followers " ..
                "here, he will attempt to rise again. Keep the essence-infused moonstone with you in case " ..
                "we have not heard the last of Anzu.",
            rewardItems = {{32449, 1}},
        },
        [11013] = {
            description = "Netherwing Ledge... What was once a bastion of sanctuary for the Netherwing is " ..
                "now home to the Dragonmaw. While the orcs may have control of our territory, our magic " ..
                "there is still strong. Strong enough to cloak your true identity and allow you to " ..
                "infiltrate the ranks of Dragonmaw.\n\nI have prepared this letter for you to present to " ..
                "their leader, Overlord Mor'ghor. Fly headlong into the maw of our enemy and seek out " ..
                "Dragonmaw Base Camp to start your new life as a fel orc of Illidan Stormrage.",
        },
        [11014] = {
            description = "<Mor'ghor crumples up the service letter and tosses it aside.>\n\nAlright " ..
                "grunt, first things first. If you're gonna join my beloved Dragonmaw army, you'll need " ..
                "to work. Everyone works up here on the ledge. Get a job and don't screw it up and I'll " ..
                "see if there might be something more interesting for you to do later.\n\nGo talk to " ..
                "Taskmaster Varkule Dragonbreath. He's standin' in the middle of town. He'll assess your " ..
                "skills and assign work as he sees fit.\n\nNow get out of my face!",
        },
        [11015] = {
            description = "No good at nothin'? That's fine. Even lunkheads like you can be used around " ..
                "here. Just find creatures on the ledge and kill 'em. Sometimes they'll have nether " ..
                "crystals on their carcasses. Gather those and bring 'em back to me and I'll consider " ..
                "your work order for the day complete.",
            rewardMoney = 44000,
        },
        [11016] = {
            description = "A skinner, eh? Well you'll find plenty to skin here! You gotta search for " ..
                "flayers around crystal formations. Take 'em down and take their hides. Sometimes they'll " ..
                "have a hide worth keepin'. Bring those to me.",
            rewardMoney = 44000,
        },
        [11017] = {
            description = "A flower picker?! Hilarious... Unfortunately, our mages and shaman need your " ..
                "services. The netherdust bushes that grow on this ledge have special pollen that is " ..
                "apparently very useful in their magical dealings. Bring me that stuff and I'll consider " ..
                "your work order complete.",
            rewardMoney = 44000,
        },
        [11018] = {
            description = "A miner!\n\n<Varkule salutes.>\n\nAn orc after my own heart! That's how " ..
                "Varkule got his start - minin'! There ain't nothin' better than getting down and dirty " ..
                "in the mines, is there?\n\nNow get out there and find those nethercite deposits. Strip " ..
                "'em for all their worth and bring me back the ore.",
            rewardMoney = 44000,
        },
        [11020] = {
            description = "The Dragonmaw have peons stationed at nearly every crystal formation up here. " ..
                "While the outright slaying of them would draw far too much unwanted attention to you, " ..
                "there is a way that we can thin their numbers and remain below the suspicious eyes of " ..
                "Mor'ghor.\n\nVenture into the wilds of Shadowmoon Valley and slay the tainted wildlife. " ..
                "Take from them their corrupt fel glands. Use those fel glands with this mutton that I'll " ..
                "give you near the peons. They'll take one bite and fall deathly ill!",
            rewardMoney = 44000,
        },
        [11021] = {
            description = "This mysterious tome was on Talonpriest Ishaal's body. It contains arcane " ..
                "symbols and charts of celestial bodies beyond your comprehension.\n\nAll writing is in a " ..
                "language you don't understand; likely an ancient version of the arakkoa written tongue. " ..
                "Perhaps you should bring this to Sky Commander Adaris.",
        },
        [11022] = {
            description = "<King/Queen> <name>! You speak with Mog'dorg the Wizened before you leave and " ..
                "go to Ogri'la!",
        },
        [11023] = {
            description = "We're still having problems with those flak cannons, <name>.\n\nDon't get me " ..
                "wrong -- I think that you did an outstanding job the last time out -- but, that doesn't " ..
                "change the fact that those damned demons seem to be replenishing their ammo supplies " ..
                "faster than we can knock them out. And that means we're having a hell of a time getting " ..
                "our people through there, not to mention the risk those demons pose to Ogri'la.\n\nWhat " ..
                "do you say? Want to take another shot at it?",
            rewardItems = {{32569, 15}},
            rewardMoney = 44000,
        },
        [11024] = {
            description = "There is an arakkoa in Lower City by the name of Rilak... He can be trusted. " ..
                "Take the book... to him.\n\n<Adaris drifts into unconsciousness as he returns the book " ..
                "to you.>",
        },
        [11025] = {
            description = "When prepared correctly, the crystals of the mountains exhibit strange powers, " ..
                "such as the clarity of mind that we have found here in Ogri'la.\n\nAll of the creatures " ..
                "atop the mountains covet the crystal shards and use them to further their own goals. An " ..
                "economy has even sprung up around them.\n\nTo assist us, you must first learn about the " ..
                "Apexis shards. Bring me some. In addition to the creatures here having them, they can " ..
                "sometimes be found where the flayers dig at the larger crystals.",
            rewardMoney = 44000,
        },
        [11026] = {
            description = "You've arrived at the perfect time, friend! We are in need of assistance. In " ..
                "return, you will receive something very rare, which will help us both in the " ..
                "end.\n\nWe're not a violent ogre any longer, but the demons nearby threaten to overrun " ..
                "us and the Skyguard. The problem with demons is that, once killed, they come right back " ..
                "in new bodies!\n\nBut, if you use this crystal to summon a banishing portal, when they " ..
                "die near it, their essences will be drawn in and banished back from whence they came!",
            rewardItems = {{32643, 1}},
            rewardMoney = 44000,
        },
        [11028] = {
            description = "This almanac presages the return of Terokk, the most powerful and terrible " ..
                "Skettis king in arakkoa history.\n\nI always believed this to be the mere legend, " ..
                "<name>. The return of the talonpriests and your recovery of this tome indicate " ..
                "otherwise.\n\nWith each day, Terokk comes closer to returning to full strength. Your " ..
                "only chance is to bring him to our world prematurely. Return to Skettis and speak to " ..
                "Adaris about this. Let us hope he has the wisdom to do the right thing.",
        },
        [11029] = {
            description = "Open the package, <name>. It is a disguise. It doesn't look very convincing, " ..
                "does it?\n\nI craft them for ethereal smugglers in search of rare books. There is an " ..
                "arakkoa scribe who dwells in the central island in Skettis, Terokk's Rest; his name is " ..
                "Sahaak. He is old and nearly blind.\n\nUse the disguise to speak with him and obtain the " ..
                "book known as the Adversarial Bloodlines. Be careful, <name>. The disguise won't fool " ..
                "the other arakkoa.",
        },
        [11030] = {
            description = "<class>, we've got a problem -- we have lots of sons. And ever since the " ..
                "Skyguard moved in nearby, all our sons ever talk about is joining their ranks.\n\nAs a " ..
                "proud father, we want them to have every advantage for when they apply. So, would you go " ..
                "to the fel crystalforge at either forge camp to the north or south, and procure a magic " ..
                "flask for our sons? You can't miss their green smoke.\n\nWe think that they take ten " ..
                "apexis shards to make. We'd give you the shards, but we don't have any at the moment.",
            rewardMoney = 44000,
        },
        [11031] = {rewardChoices = {{29290, 1}, {29279, 1}, {29283, 1}}},
        [11032] = {rewardChoices = {{29290, 1}, {29287, 1}, {29283, 1}}},
        [11033] = {rewardChoices = {{29290, 1}, {29279, 1}, {29287, 1}}},
        [11034] = {rewardChoices = {{29283, 1}, {29279, 1}, {29287, 1}}},
        [11035] = {
            description = "On the northeast edge of this island exists a dock used for the packaging and " ..
                "transport of Netherwing crystals and relics. Dragonmaw Transporters transport the goods " ..
                "from the dock to Dragonmaw Fortress while Dragonmaw Ascendants guard the ground from any " ..
                "would-be attackers.\n\nThis leaves one opening for you to make a strike at the " ..
                "Dragonmaw: The Dragonmaw Skyway.\n\nFly to the shattered islands of the Dragonmaw Skyway " ..
                "and ambush the transporters that use the route. Recover our stolen relics!",
            rewardMoney = 44000,
        },
        [11041] = {
            description = "In the name of our great master... For the glory of Illidan!\n\nBy order of " ..
                "Overlord Mor'ghor, the great plateau of Netherwing Ledge is to be secured. With all " ..
                "Netherwing drakes captured or forced off of the land, rock flayers are running rampant " ..
                "and threatening crystal harvesting operations.\n\nDestroy them all, their den mother and " ..
                "her consort, Arvoar.\n\nMor'ghor commands it!\n\n<It would appear that this orc failed " ..
                "to take the plateau. It is time to prove your worth to Mor'ghor!>",
            rewardChoices = {{32866, 1}, {32867, 1}, {32865, 1}, {32868, 1}},
            rewardMoney = 132000,
        },
        [11049] = {
            description = "Should you discover any Netherwing eggs while exploring, bring them to " ..
                "me.\n\nBe warned, a Netherwing egg is a rare discovery. Do not become frustrated if you " ..
                "cannot locate one. These Dragonmaw have been very thorough in collecting most of them " ..
                "and shipping them off to parts unknown.\n\nEggs might be found on creatures of the " ..
                "island, near crystal formations, in the mines, or even inside a nethercite node or " ..
                "netherdust bush.\n\nKeep a low profile. We don't need Mor'ghor catching wind of your " ..
                "actions.",
            rewardMoney = 88000,
        },
        [11051] = {
            description = "If we know the demons, and we do because we've studied them extensively, " ..
                "they're fast at work repairing any damage that has been done to their precious " ..
                "transporter.\n\nSo, if you want a chance at another darkrune, take our banishing crystal " ..
                "back out there and eliminate more demons. Besides, you want to help us to lessen the " ..
                "threat that the demons pose, yes?\n\nWe said \"chance\" because the process we use " ..
                "yields mixed results. You might get a darkrune, or you might get something else entirely.",
            rewardItems = {{32777, 1}, {32569, 15}},
            rewardMoney = 44000,
        },
        [11052] = {
            description = "< Akama inserts the crystal into the medallion in his hand.>\n\nI am not as " ..
                "strong as I once was, <name>. Being so close to evil itself all these years - I do not " ..
                "know if I can trust myself with an artifact as powerful as this.\n\nTake this as my " ..
                "promise to you that when the time comes and you face Illidan, I will be on your side. " ..
                "Take it to the one being we know we can trust with its power. Take the medallion to " ..
                "A'dal in Shattrath City.",
            rewardChoices = {{30932, 1}, {30999, 1}, {31000, 1}, {30943, 1}, {30984, 1}, {31417, 1}},
        },
        [11053] = {
            description = "Rare it is that a peon survives for as long as you have. Rarer still is when a " ..
                "peon rises from the dregs to attain a new rank.\n\n<Varkule claps.>\n\nThe Overlord has " ..
                "called for you, grunt. A new rank awaits, no doubt.",
            rewardItems = {{32694, 1}},
            rewardMoney = 44000,
        },
        [11054] = {
            description = "So you're the new overseer, eh? Well there's one thing any good overseer needs " ..
                "and that's the proper disciplinary weapon. Before you can go out there and knock some " ..
                "sense into these peons you need to have your \"piece.\" Each overseer has to gather the " ..
                "materials required to make their own \"piece\" and you'll be no different.\n\nI'll need " ..
                "knothide leather and the hardened hide of Tyrantus. You'll find Tyrantus in Eco-Dome " ..
                "Farfield, located in the northern reaches of Netherstorm.",
            rewardMoney = 44000,
        },
        [11055] = {
            description = "This is your booterang. There are many like it but this one is yours.\n\nAs an " ..
                "overseer you will use this booterang to sow terror into the hearts of defiant peons. " ..
                "Proper use of the booterang will instill obedience and ensure subservience.\n\nVenture " ..
                "forth to the crystal fields and discipline any peons that you see slacking off. Show " ..
                "them the might of the booterang!",
            rewardMoney = 44000,
        },
        [11056] = {
            description = "Do not draw attention to our conversation. Adaris would not approve.\n\nI " ..
                "belong to the lowest caste of arakkoa, <name>. During Terokk's rule I would've been " ..
                "sacrificed to the dark powers worshipped by his talonpriests. If what you say is true " ..
                "and the talonpriests are seeking Terokk's return, then you must prevent them from " ..
                "succeeding - regardless of what your leader says!\n\nI've something to offer you that " ..
                "you'll find useful. There is a package at my old dwelling in Upper Veil Shil'ak. Bring " ..
                "it to me!",
        },
        [11074] = {
            description = "The descendants held prisoner by the Skettis talonpriests are listed in this " ..
                "book. Gezzarak the Huntress, Garokk the Crystal Giant, the heretic known as " ..
                "Darkscreecher Akkarai and Vekkaz the Windrager. They will all need to be slain before " ..
                "Terokk returns to this world.\n\nYou will need the scrolls carried by the time-lost " ..
                "arakkoa and burn them at the summoning circles all over Skettis. Bring me a token from " ..
                "each one. These are powerful beings you will be facing; you would do well to bring " ..
                "friends.",
            rewardItems = {{32720, 1}},
        },
        [11081] = {
            description = "This document outlines a revolt planned by the Murkblood broken. It seems that " ..
                "the dragon was to be used as a diversion to draw attention away from their escape. " ..
                "Looking at all of the corpses littering the mine, it would be safe to assume that their " ..
                "plans failed.\n\nReturn the escape plans to the Mistress of the Mines.",
        },
        [11129] = {
            description = "Help, <name>! My prized puppy, Kyle, has run away! I just know he's running " ..
                "around Bloodhoof Village, lost and hungry.\n\nWill you find him and feed him? Once he " ..
                "eats he will settle down and come home.\n\nTo feed him you will need to find food. His " ..
                "favorite meal is tender strider meat. Just venture east and you should find plenty of " ..
                "striders. Hunt one down and take its succulent meat to Kyle. When you see Kyle in town, " ..
                "put the meat down and he is sure to come to you.",
            rewardMoney = 175,
        },
        [11143] = {
            description = "I've spoken with Inspector Tarem regarding the evidence you gathered from the " ..
                "ruins of the Shady Rest Inn. He seems certain that the hoofprints and the shield you " ..
                "found there point to the Grimtotem clan of tauren.\n\nWith reports of Grimtotem activity " ..
                "on the rise in the marsh, this has to be more than a mere coincidence. I'm sending you " ..
                "to speak with Captain Darill, who is something of an expert on the Grimtotems. Follow " ..
                "the road north out of town to North Point tower. It's the second outpost on the road.",
        },
        [11381] = {
            description = "Death is in the air. I've never had so many orders for my famous soup--it " ..
                "lifts your spirits and soothes the soul.\n\nAnd I know a fellow cook when I see one! " ..
                "Would you like to help me out and get a cut of the profits?\n\nHere, take my cooking " ..
                "pot, gather some clefthoof meat and I'll let you in on a little secret. What makes my " ..
                "soup so good for the soul? It's not chicken--I cook it at the Ancestral Grounds in " ..
                "Nagrand to soak up all that spiritual stuff there.",
            rewardChoices = {{33844, 1}, {33857, 1}},
        },
    },
    npcs = {
        [1840] = {
            spawns = {
                [28] = {{53.4, 23.6}, {53.4, 24.6}, {53.8, 24.4}, {54, 24.6}, {54.6, 23.8}, {54.8, 23.4}},
            },
            zoneID = 28,
        },
        [15241] = {
            spawns = {
                [3483] = {
                    {53.4, 62.4}, {54.2, 63}, {54.4, 63.6}, {54.8, 63.2}, {54.8, 63.8}, {55.8, 60.6},
                    {56, 63.2}, {56.8, 63.6}, {57.8, 63.8},
                },
            },
            zoneID = 3483,
        },
        [18338] = {
            spawns = {
                [1497] = {{65.2, 2.6}, {65.8, 5}, {66.2, 6.2}, {66.4, 1.4}, {66.4, 1.6}, {66.4, 9.6}},
                [1519] = {
                    {57.2, 62.8}, {58.6, 65.6}, {61.2, 70.6}, {62, 71.4}, {64.2, 77.2}, {65.6, 78.8},
                    {68, 83.8}, {68.8, 84.6}, {69, 83.8}, {69, 86.2}, {69, 87.6}, {69.8, 86.4}, {70.2, 86.8},
                    {70.2, 89}, {71, 88.2}, {71.4, 88.8},
                },
                [1537] = {
                    {15, 85.4}, {15.2, 85.6}, {16.2, 84.4}, {16.4, 85}, {16.6, 82.8}, {16.6, 85},
                    {17.2, 83.8}, {17.4, 82}, {18, 82.8}, {18.2, 81.6}, {18.4, 81.4}, {18.8, 80.4}, {19, 81},
                    {20, 79.2}, {21, 75.8}, {21, 79.4}, {21.4, 78.2}, {22, 76}, {26.2, 83.6},
                },
                [1637] = {
                    {48.6, 92.4}, {49.2, 90.6}, {49.2, 93.2}, {49.2, 93.6}, {49.4, 90.2}, {49.6, 94.8},
                    {49.8, 70.8}, {50, 89.6}, {51.6, 73.4}, {52.6, 88.6}, {52.8, 88.4},
                },
            },
            zoneID = 1537,
        },
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
        [21502] = {spawns = {[3520] = {{23.4, 36.8}, {23.6, 36.8}}}, zoneID = 3520},
        [21877] = {spawns = {[3520] = {{58.2, 70.4}, {58.2, 70.8}}}, zoneID = 3520},
        [22038] = {
            spawns = {
                [3519] = {
                    {31.2, 76}, {32, 76}, {37.6, 75.4}, {39.4, 75.8}, {41.2, 73.6}, {41.4, 76.4},
                    {41.4, 77.8}, {41.6, 75.4}, {42, 77}, {42.2, 77.6}, {42.4, 71.6}, {42.4, 80},
                    {42.6, 75.4}, {42.6, 76.2}, {42.6, 78.4}, {42.6, 79}, {43.4, 69.6}, {43.4, 71},
                    {43.6, 70}, {43.8, 71.6}, {44.4, 72.6}, {44.4, 73.8}, {44.4, 76}, {44.4, 76.8},
                    {44.4, 79}, {44.4, 79.8}, {44.8, 79.6}, {44.8, 81.4}, {45.2, 75.6}, {45.2, 81.6},
                    {45.4, 74.2}, {45.4, 75.4}, {45.4, 77.6}, {45.4, 78.8}, {45.6, 74}, {45.6, 76.8},
                    {45.6, 78.6}, {45.8, 79.8}, {46, 75.4}, {46.4, 76},
                },
            },
            zoneID = 3519,
        },
        [22076] = {
            spawns = {[3520] = {{51.4, 72.4}, {51.4, 72.6}, {51.6, 72.4}, {51.6, 72.8}, {52, 73.6}}},
            zoneID = 3520,
        },
        [22459] = {
            spawns = {
                [3519] = {
                    {50.8, 81.6}, {51, 80}, {51.2, 77.8}, {51.4, 79.2}, {51.4, 81.4}, {51.8, 77.2},
                    {51.8, 79.4}, {51.8, 80}, {52, 78.4}, {52.4, 80.8}, {52.6, 76.8}, {52.6, 78.4},
                    {52.6, 80.6}, {52.8, 79.6}, {53.2, 78.8},
                },
            },
            zoneID = 3519,
        },
    },
    objects = {},
    items = {},
}
