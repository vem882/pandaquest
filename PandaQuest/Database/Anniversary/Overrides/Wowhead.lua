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
    },
    npcs = {},
    objects = {},
    items = {},
}
