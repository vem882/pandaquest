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
        [32] = {
            description = "Here's your report. I urge you to take it to someone who might have working " ..
                "knowledge in this kind of thing.\n\nI know this troll scholar named Zilzibin Drumlore. " ..
                "He's spent a lot of time studying life forms that are unique to the ecology of Azeroth; " ..
                "he's a historian to boot! If you want someone to help figure out what exactly this " ..
                "threat is and how to stop it, give this report to him. We're going to need all the help " ..
                "we can get.\n\nZil lives in a house on the second tier of the Drag in Orgrimmar.",
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
        [70] = {
            description = "The name Stalvan rings a bell. I remember now.\n\nMany years back, on a stormy " ..
                "night, a messenger came in, seeking refuge for the night. Near the stroke of midnight, " ..
                "the man ran down the stairs screaming, his face pale with fear. Still wearing his " ..
                "bedclothes, he disappeared into the downpour.\n\nIn his haste he forgot his letters in " ..
                "the chest upstairs. He never returned for them. One remains from that Stalvan fellow, " ..
                "intended for the Canal District in Stormwind. Help yourself to it.",
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
        [112] = {
            description = "I can make an invisibility liquor for Maybell, so she can slip away from the " ..
                "Maclure Vineyards and go to Tommy Joe. But to make the Liquor, I need some crystal " ..
                "kelp.\n\nAlthough the kelp usually grows in the ocean... sometimes murlocs collect it. " ..
                "See if the murlocs near Crystal Lake have any. Crystal Lake is just east of Goldshire.",
        },
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
        [129] = {
            description = "Can you do me a favor? I've prepared a lunch for Guard Parker, but he's out on " ..
                "patrol...he's a big, strong Stormwind guard who can defend himself, but it's much too " ..
                "dangerous out there for a townsperson like me.\n\nSo if you deliver his lunch for me, " ..
                "then come back here and I'll give you a free lunch! Parker patrols the stretch of road " ..
                "leading to Duskwood.",
        },
        [144] = {
            description = "Magistrate Solomon 's note pains me to read. But it is obvious he knows not " ..
                "the war which is waged in Westfall or else he would know better than to expect aid from " ..
                "the Militia. If Stormwind had not deserted us as well, we would not have the need for " ..
                "the Militia.\n\nTake this response to your master in Redridge, <class>. And let him know " ..
                "that my heart is heavy with the loss of good men.",
            rewardMoney = 150,
        },
        [146] = {
            description = "If I did not know Magistrate Solomon personally, I would say the man has gone " ..
                "mad. Send the Night Watch to Lakeshire because Stormwind refuses aid? The Night Watch " ..
                "was formed because Stormwind left us when this foul magic seeped into the land. If I " ..
                "sent my Night Watch, this town would be overrun by evil before the guards even reached " ..
                "the forest's edge.\n\nTake this letter of response to your Master in Lakeshire.",
            rewardMoney = 250,
        },
        [155] = {
            description = "So Stoutmantle sends a scrawny <race> like you to protect me? Guess you'll " ..
                "have to do. Better bring some friends too.\n\nYou know the deal, right? You watch my " ..
                "back and I'll take you to the Defias hideout. But you better be close by my side. The " ..
                "Defias gang wants my head now. If they see me with you, they'll try to kill me.\n\nLet " ..
                "me know when you and any friends you can round up are ready to go.",
        },
        [174] = {
            description = "My Gnomish friend, Cog, has promised to help me build a device which will let " ..
                "me peer towards the stars. A truth exists, beyond magic, that can explain the strange " ..
                "transformation in the forest.\n\nBring to me a bronze tube made by a skilled engineer. " ..
                "That is the first step, according to Cog's blueprint.",
        },
        [199] = {description = "You take a sample of the strange smelling powder."},
        [223] = {
            description = "Here you go, <name>. Bring this message to Master Carevin.\n\n<He quickly " ..
                "removes a piece of faded parchment and offers it to you.>\n\nA few more like you, and we " ..
                "will outnumber the Night Watch! Perhaps then we could complete the work that we few " ..
                "carry on today.",
            rewardChoices = {{2902, 1}, {1547, 1}},
            rewardItems = {{5244, 1}},
        },
        [224] = {
            description = "We need to protect the Loch, <name>! With so many of the King's soldiers " ..
                "fighting valiantly on remote battlefields, we've become overwhelmed on the home front. " ..
                "Troggs are tunneling up from every crevice! The Trogg infestation poses the largest " ..
                "threat to Ironforge. These disgusting mutants must be destroyed.\n\nWe need you, brave " ..
                "adventurer, to venture forth and lay waste to the Trogg threat. Slay 10 Stonesplinter " ..
                "Troggs and 10 Stonesplinter Scouts and report back.",
            rewardItems = {{414, 5}},
            rewardMoney = 500,
        },
        [228] = {
            description = "From what my scouts tell me, Mor'Ladim wanders throughout Duskwood, following " ..
                "a strange and meandering path through the cemetery. We buried him out past the house on " ..
                "the hill, you know where that is?\n\nThere isn't anything I can do to help you, but I " ..
                "wish you good luck.",
            rewardMoney = 3500,
        },
        [332] = {
            description = "If you talk to anyone about wine, then you know we Gallinas sell the best wine " ..
                "in Stormwind. And we're not far, still in the Trade District along the city's lovely " ..
                "canals.\n\nHere, take this pamphlet. Bring it to my sister Suzetta at our shop for a " ..
                "complimentary bottle of our famous pinot noir. You won't regret it!",
            rewardItems = {{2723, 1}},
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
        [344] = {
            description = "The Stresses of Iron? Yes, I know the book. Quite a good one, written by the " ..
                "Dwarven miner Margulf Blaggon a few decades ago. He spent most his time deep in the " ..
                "mountains of Khaz Modan, digging ore. Smart fellow!\n\nBut where was I? Oh yes, the " ..
                "Stresses of Iron! I'm afraid the book was moved to the Northshire Abbey. The caretaker " ..
                "of the Abbey's library, Brother Paxton, wanted to make a copy of the book for his own " ..
                "shelves.\n\nBut that was months ago. I wonder why it's taking him so long...",
        },
        [372] = {
            description = "Scarlet Crusaders have been raiding from the ruined tower in northern " ..
                "Tirisfal, past Faol's Rest. According to the information we have, a ruthless commander " ..
                "named Captain Melrache is in charge of this evil crew.\n\nI am entrusting you now with a " ..
                "special and dangerous mission. Slay Melrache and his two bodyguards, in the name of The " ..
                "Dark Lady.",
            rewardChoices = {{3445, 1}, {3071, 1}},
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
        [379] = {
            description = "You want a power source. I can help you with that. Know what I want? I want " ..
                "something to drink! Bring me five Wastewander Water Pouches, and I'll give you the " ..
                "4711-FTZ.\n\nNow... guess where you can find Wastewander Water Pouches! Why don't you " ..
                "walk up to one of the Wastewander nomads to the east of here and ask them for one. Let " ..
                "me know how that works out for you.",
            rewardItems = {{8524, 1}},
        },
        [388] = {
            description = "Bitterness flows through my veins like a cold river. My grandson, Mac, was " ..
                "such a good boy. A mere 14 years old. When the army was sent off to the front, Mac took " ..
                "up arms to defend the city. He was a guard in The Stockade, where the Defias gang is " ..
                "locked up. Mac reprimanded some of the prisoners for tearing their wool blankets to make " ..
                "scarves, a symbol of their gang. For that Mac was stabbed in the back.\n\nI want " ..
                "revenge. Bring me 10 of their precious Wool Bandanas. They are the color of blood.",
            rewardMoney = 4000,
        },
        [389] = {
            description = "VanCleef and I were members of the Stonemasons Guild. Our main project was to " ..
                "rebuild Stormwind after the War.\n\nWhen we had finished our duties, we were cheated. " ..
                "The nobles refused to pay us for our work. Some of the more senior of the Stonemasons " ..
                "were offered governmental jobs, but VanCleef refused it out of loyalty to all the " ..
                "Stonemasons. He led a riot and left the city, swearing revenge.\n\nHis lieutenant, Bazil " ..
                "Thredd, might know more about VanCleef's plans. He's being held prisoner in the Stockade.",
        },
        [444] = {
            description = "I have reduced the ichor you brought me and separated it into its base " ..
                "components. My findings are not conclusive, but I have determined that warlock and " ..
                "necromantic magics were used in the ichor's creation.\n\nWhile I continue to study the " ..
                "ichor, I want you to take a sample to Bethor Iceshard in the Undercity. Bethor is not an " ..
                "apothecary, but his knowledge of magic may help to unravel the mystery of the rot " ..
                "hides.\n\nGo. You will find Bethor in the Magic Quarter of the Undercity.",
        },
        [451] = {
            description = "According to Berard's Journal the moss from Lake Skulkers and Creepers might " ..
                "prove useful for our quest to brew a new plague. Those beasts dwell on the islands in " ..
                "Lake Lordamere to the east.\n\nHe also mentions a very rare Hardened Tumor that he " ..
                "discovered on a Vile Fin murloc. Apparently the tumor is so rare Berard was only able to " ..
                "obtain one.\n\nCollect samples of the moss as well as the rare Hardened Tumor and take " ..
                "them to Master Apothecary Faranell in the Undercity.",
            rewardChoices = {{3451, 1}, {3582, 1}},
            rewardItems = {{2458, 1}, {2459, 1}},
        },
        [482] = {
            description = "Of course! How could I have forgotten?\n\nAmbermill was one of the sites " ..
                "earmarked by the Kirin Tor, noted because it houses a dormant ley energy node. The " ..
                "wizards must be planning to reactivate the node and use its energies for some greater " ..
                "purpose.\n\nWe cannot allow this to happen...\n\nIt will take a great amount of power to " ..
                "activate the area's ley energies, we can stall them by taking the pendants away from the " ..
                "wizards.\n\nRelay this information to Allister, he will decide a course of action.",
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
        [518] = {
            description = "Mug'Thol and his Crushridge ogres have overrun the ruins of Alterac. It will " ..
                "be hard to inflict any serious punishment upon him without thinning out the ogres' " ..
                "numbers.\n\nAfter softening them up, we'll proceed.\n\nUnderstood? Good. Now go.",
        },
        [531] = {
            description = "Light! Don't bring things like that into the Lodge... it's unsanitary, " ..
                "unspeakable, un... un... unsanitary!\n\nJust get it out of here, will you? No one wants " ..
                "to see your bloody little trophy, really!",
            rewardChoices = {{3574, 1}, {3573, 1}},
        },
        [554] = {
            description = "Prospector Stormpike is a master of decryption and deciphering. If you take " ..
                "the parchment you found to him, then with luck he can make sense of it. Stormpike is " ..
                "currently studying in the Prospector headquarters in Ironforge.\n\nAnd when you see him " ..
                "tell him you spoke with me - I've been sending him quite a lot of business lately.",
            rewardMoney = 5000,
        },
        [624] = {
            description = "There is an ornate, well-traveled bridge East of Deadwind and south of " ..
                "Redridge Underneath there waits something for you Some call it a hint, others a clue " ..
                "There it will lie for endless tomorrows Biding its time in the Swamp of Sorrows",
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
        [643] = {
            description = "Though they can barely be said to control Stromgarde, let alone the whole of " ..
                "Arathi Highlands, the human prince trots the remnants of his cavalry over the " ..
                "countryside. I can't understand why he does it, but who understands the way the humans " ..
                "think, hm?\n\nWhatever his reasoning, more importantly, he has given one of the sigils " ..
                "to Lieutenant Valorcall, their cavalry leader. Locate him and bring his sigil back to me.",
            rewardMoney = 5500,
        },
        [659] = {
            description = "Hail, and well met, <name>. I lead a group of adventurers investigating odd " ..
                "happenings in this area.\n\nMy cousin in Hillsbrad recently put down his dog Stanley " ..
                "because the animal mystically grew to an immense size and savagely attacked anyone who " ..
                "came near him.\n\nI believe the undead are involved, and we're looking for signs to " ..
                "prove as much.\n\nTwo of my companions, Quae and Kinelory, headed to the Go'Shek Farm in " ..
                "the Arathi Highlands, and haven't checked in for days. Find them for me? I grow " ..
                "concerned.",
        },
        [699] = {
            description = "With the threat of murlocs along the coast, we're stationed out here to " ..
                "protect--or warn if the force is too large--of any coming threats to Stonard. It doesn't " ..
                "give us much time for relaxation, and we could use some more help if you're able.\n\nThe " ..
                "sawtooth snappers' claws make for fine weapons when properly prepared. Bring me some of " ..
                "their claws and I'll see you're rewarded with one of our weapons in thanks for the fresh " ..
                "meat and the good company.",
        },
        [766] = {
            description = "My grandfather told me stories about his battles with a strider named " ..
                "Mazzranache. He told me of its demonic red eyes, razor-sharp talons and venomous " ..
                "bite.\n\nAs fortune would have it, while traveling across the plains, I encountered it, " ..
                "and it took a nasty bite from my shoulder. He was as terrible as my grandfather " ..
                "described. I will need some hard-to-find animal parts to clean the infection from his " ..
                "bite: a wolf heart, cougar femur, plainstrider scale and swoop gizzard.\n\nHurry, time " ..
                "is of the essence.",
            rewardChoices = {{4972, 1}, {4973, 1}},
        },
        [794] = {
            description = "Through my divinations, I see that an item of power hides deep within the " ..
                "Burning Blade Coven, guarded by beasts and black magic.\n\nIt is called the Burning " ..
                "Blade Medallion, and your next task is to find it and remove it from the coven.\n\nBut " ..
                "be wary, for the medallion may be possessed by an agent of the Burning Blade, and if so " ..
                "then the agent's power would be greater than the familiars you have already " ..
                "encountered.\n\nGo, <name>. You will find the coven in a cave, to the north and west.",
            rewardChoices = {{4921, 1}, {4922, 1}, {6713, 1}},
            rewardItems = {{118, 1}},
        },
        [843] = {
            description = "In solitude I wander these roads.\n\nThe dwarves of Bael Modan show no respect " ..
                "for my land. Horrendous blasts drive holes deep into the ground as noisy machines rip " ..
                "apart the hills. Lands which once served as home and provider to my tribe are now " ..
                "riddled with destructive dwarves.\n\nAttempts at reaching a diplomatic resolution have " ..
                "failed. Now is the time for decisive action.\n\nDrive the dwarves from the Bael Modan " ..
                "excavation by force and bring to me the journal of their leader, Prospector Khazgorm.",
            rewardMoney = 1500,
        },
        [849] = {
            description = "Following Khazgorm's plans it should be no problem to fashion an explosive " ..
                "charge\n\nAh, there we go.\n\nNow, <name>, I am going to entrust you with a special " ..
                "task. Take this explosive stick and use it to blow up the flying machine at Bael " ..
                "Modan.\n\nNot only is the flying machine a key part of the site's infrastructure it also " ..
                "serves as a weapon of war. More importantly it is an icon of power and an insult to the " ..
                "memory of my tribe.\n\nMake me proud by completing this heroic task and you shall be " ..
                "rewarded.",
            rewardItems = {{5313, 1}},
            rewardMoney = 2000,
        },
        [857] = {
            description = "The power was mine! In my very hands! And I want it back! Back I say!\n\nThose " ..
                "dirty excavators uncovered it... so beautiful it was. Deemed the Tear of the Moons, it " ..
                "was the first great discovery we made at Bael Modan.\n\nIt should have been mine! Mine I " ..
                "say!\n\nGeneral Twinbraid grew jealous of the power it gave me. He locked it away in the " ..
                "Keep. Called it cursed, he did! The fool!\n\nOthers wanted it and they had to be " ..
                "stopped! That bastard Twinbraid drove me off.\n\nNow I want it back. Back I say!",
            rewardMoney = 2500,
        },
        [862] = {
            description = "A <class> like you must get pretty hungry out here in The Barrens. Me, I'm " ..
                "starving all day long.\n\nTell you what, I'll fix you up a nice stew. Just need a few " ..
                "dig rats.\n\nSeems those filthy dwarves at Bael Modan are overrun with everyone's " ..
                "favorite feast. Now head on down south to Bael Modan and bring me back some dig " ..
                "rats.\n\nYou can't call yourself a seasoned adventurer until you've spent some time " ..
                "killing rats! Haw!",
            rewardItems = {{5487, 1}, {5478, 5}, {10919, 1}},
        },
        [882] = {
            description = "Ishamuhale, Speartooth, is the fiercest sunscale raptor of the Barrens. He " ..
                "does not hunt for sport, nor for food. He hunts because hunting is his passion. He kills " ..
                "because it is his nature to kill.\n\nAnd you will learn of his nature, <name>, for your " ..
                "path now follows the taloned tracks of Ishamuhale.\n\nBegin the hunt. Slay his favorite " ..
                "prey, a zhevra, then bring its carcass to the dead tree northwest of Ratchet. Ishamuhale " ..
                "will smell the carcass and be drawn to it.\n\nBe ready when he comes.",
        },
        [905] = {
            description = "Now, <name>, the hunt deepens. Now you must defeat your prey, and then find " ..
                "your way to its lair.\n\nHunt the sunscale raptors to the south. Slay them and remove " ..
                "the feathers they wear. Place the feathers on the scytheclaw nests southwest of the " ..
                "Stagnant Oasis. Show their brethren you do not fear them!",
            rewardMoney = 900,
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
        [965] = {
            description = "Hail, young <race>. I am Elissa Starbreeze, and it is my charge to protect " ..
                "Auberdine from harm.\n\nTo this end, I sent Balthule Shadowstrike to observe the strange " ..
                "happenings around the Tower of Althalaxx to the northeast.\n\nIt is past time that he " ..
                "should have returned. I worry that he has encountered some unforeseen danger in the " ..
                "forest. I would be most appreciative if you would find him and see that he is doing well.",
        },
        [977] = {
            description = "Now that I have what I need to cover the mechanical moving parts, I only need " ..
                "one other thing. Well, actually two. Two horns!\n\nThe ice thistle patriarchs and " ..
                "matriarchs have the largest horns, so of course, those are the ones I want. That type of " ..
                "yeti inhabits a cave to the southeast. There are plenty of them there; you shouldn't " ..
                "have any problem finding them.\n\nRemember, I only want the best looking ones -- no beat " ..
                "up or broken horns, please!",
            rewardMoney = 9000,
        },
        [1020] = {
            description = "<name>, I have created a cure that I believe will help the afflicted child. " ..
                "Take it to Astranaar and give it to the child's parent, Pelturas Whitemoon.\n\nTo reach " ..
                "Astranaar, follow the road south, then east.",
            rewardMoney = 2500,
        },
        [1037] = {
            description = "Velinde Starsong was my predecessor here in Ashenvale Forest. At first it " ..
                "seemed she had the situation in Felwood under control, but little by little her efforts " ..
                "faltered. One day, she simply disappeared.\n\nI was sent here to continue her work. I'm " ..
                "afraid I know nothing of the priestess, however. Perhaps Thyn'tel Bladeweaver, one of " ..
                "the commanders of the Sentinels, knows further details of her disappearance that I was " ..
                "not a party to.\n\nSurely she will understand the import of such information.",
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
        [1055] = {
            description = "The rod, now complete, lies in your hands. Shael'dryn will want to hear of " ..
                "your success.",
        },
        [1119] = {
            description = "I figured out how to use Zanzil's mixture with stout to make a powerful " ..
                "libation. A Fool's Stout. I think it'll be just what Kravel needs, but try it out and " ..
                "let me know how it works.\n\nAnd <name>, don't keep this stuff too long without using " ..
                "it. Zanzil's mixture has a weird effect on the stout's yeast, kicking it into high gear. " ..
                "So it won't stay fresh forever.",
        },
        [1125] = {
            description = "To our southwest lies a tragic site - the ruins of Southwind Village. This is " ..
                "where our work should begin, <name>.\n\nFrom what we've learned, this village was once a " ..
                "night elf base of operations for Silithus. It's long since overrun by the silithid hives " ..
                "that infest the wastes. I can only imagine the horror of the village's initial " ..
                "sundering...\n\nThe tortured spirits of fallen druids and sentinels wander the ruins " ..
                "aimlessly. Explore this locale, freeing the souls of these wretched beings as needed.",
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
        [1144] = {
            description = "At last, help has arrived!\n\nYou have no clue how long I've been held " ..
                "prisoner here. I can't remember the last time I saw the outside of this place.\n\nYou " ..
                "see, I am an entrepreneur. Always out for a copper, as they say. I caught wind that " ..
                "Mebok Mizzyrix was paying well for Redleaf Tuber from this here pig pen. I figured it " ..
                "would be an easy in, easy out kind of affair. As you can see, I was a bit " ..
                "wrong!\n\nAnyway, if you'd be so kind as to help me get out of here, I'll make it worth " ..
                "your while.",
            rewardChoices = {{6748, 1}, {6750, 1}, {6749, 1}},
        },
        [1146] = {
            description = "So, Korran has come to a similar conclusion about these insects--they seem to " ..
                "be a larger threat than we assumed.\n\nA few days ago a hunter returned to me from " ..
                "Thousand Needles nearly dead. He was with a raiding party sent to drive a dwarven " ..
                "excavation team out of the Shimmering Flats. During the attack, more of these insects " ..
                "erupted from a cave in the dig site and nearly killed the party.\n\nThey were led by " ..
                "Moktar Krin, and they've taken refuge on the border of the Shimmering Flats. Bring him " ..
                "this note.",
        },
        [1151] = {
            description = "During the time of the Old Gods, elementals inhabited much of this world. They " ..
                "worshipped the Old Gods, and the Gods, through their power, kept the elementals bound to " ..
                "this world. When the Old Gods were banished, the elementals faded from our world and now " ..
                "only return at the bidding of powerful mages.\n\nThere are exceptions though. Some " ..
                "elementals were powerful enough to remain here on their own. One such elemental is " ..
                "Rok'Alim.\n\nTo test your strength, find Rok'Alim in Thousand Needles and slay him.",
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
        [1154] = {
            description = "You have passed Dorn's tests, and now you seek to pass your next trial. Very " ..
                "good. But up until now, your challenges have been childish. It is easy to test your " ..
                "body--your mind is another matter completely.\n\nI shall explain it simply: find the " ..
                "book I name, study it, and answer my question about its contents.\n\nWhat book, you must " ..
                "be asking? The Legacy of the Aspects. It can be found at the bottom of Dor'danil in " ..
                "southern Ashenvale, protected by the dead druids and their slayers.",
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
        [1241] = {
            description = "Recently a diplomat was sent to Theramore to meet with Jaina Proudmoore. That " ..
                "diplomat never arrived.\n\nI believe the Defias are involved in this plot, but I'm not " ..
                "sure how. The diplomat's disappearance still eludes public attention, but it can't " ..
                "remain that way for long.\n\nAgents of the king are already scouring the city for clues, " ..
                "but I have my own contacts I would like involved.\n\nIn the Valley of Heroes is an old " ..
                "friend of mine named Jorgen. Find him, give him this note, and follow his instructions.",
        },
        [1250] = {
            description = "The Defias didn't pay me well enough to die for their cause. They took the " ..
                "king. Yeah, the king of Stormwind, not some lowly diplomat. He was on his way to " ..
                "Theramore to meet with Jaina Proudmore--it was a big deal apparently, and a big secret. " ..
                "But it's not just the Defias that are involved. They're working with someone. I think " ..
                "they knew this was bigger than them.\n\nMy part was just to get their man on board the " ..
                "king's ship while it was in the harbor. The guy's name was Hendel. That's all I know. I " ..
                "swear!",
        },
        [1267] = {rewardItems = {{6757, 1}}, rewardMoney = 13000},
        [1268] = {
            description = "Rows of hoofprints lead away from the still-smoking skeleton of the Shady Rest " ..
                "Inn. There are at least a few visible impressions, with more rows of prints almost " ..
                "imperceptible in the soft mud of the marsh.",
        },
        [1360] = {
            description = "I had myself a fine job as a digger at the Uldaman excavation site in the " ..
                "Badlands... that is until those blasted troggs showed up. I escaped with my hide barely " ..
                "intact, and nothing else. In the chaos, I left my most treasured possession. It's safe " ..
                "from the troggs in my chest, sure, but it's right in the thick of 'em.\n\nI'd be in your " ..
                "debt, both in honor and coin, if you could fetch it for me! A chest with my name on it " ..
                "is at the end of the North Common Hall. That's the one you need to get in.",
            rewardMoney = 6000,
        },
        [1384] = {
            description = "The Kolkar centaurs think their magic is strong. They do not know magic! They " ..
                "would not know magic if it bit them!\n\nYou will show them their magic is weak. Go to " ..
                "the Kolkar to the northeast and kill them. Take their charms. Bring me the charms and I " ..
                "will throw them in the fire and laugh!",
        },
        [1394] = {
            description = "You have done well, <name>. You have passed my test, and the tests before " ..
                "mine. Return to Dorn in Thousand Needles. He will sense the change within you, and see " ..
                "that your mind, body and spirit are strong enough that you should be rewarded for your " ..
                "efforts.\n\nStay true to the balance you've shown throughout these trials, <name>. Dorn " ..
                "will test you again in the future if you do.",
            rewardChoices = {{6804, 1}, {6806, 1}},
        },
        [1396] = {
            description = "My caravan was destined for the eastern coast, but we did not reach our goal. " ..
                "Lost Ones attacked us, killing guards and dashing supplies.\n\nI alone survived their " ..
                "assault. I have sworn to protect what supplies remain, but wild creatures skulk near. " ..
                "Please, help me defend my camp from the beasts!",
        },
        [1470] = {
            description = "Greetings, child. I can see that you are still young in the ways of the " ..
                "warlock, power still eluding your grasp. I can sense your eagerness to learn.\n\nAnd you " ..
                "will learn.\n\nThere is no strength in ignorance. Knowledge is our greatest power. " ..
                "Through its application, we can control the chaotic magics and beings of the void, " ..
                "bending them to our will.\n\nI will show you how to bind a servant to your will, but " ..
                "first you must bring me three skulls of the rattlecage skeletons near the abandoned " ..
                "smithy.",
        },
        [1484] = {
            description = "This creature is far more dangerous than I had anticipated. No doubt Takata " ..
                "questions my abilities to take on such a creature, and it would insult his honor if he " ..
                "were not informed about what just happened.\n\nSpeak to the swordsman, tell him you are " ..
                "willing to slay the demon if he would allow it, but do not press too hard. It is better " ..
                "if he thinks it his own idea.",
        },
        [1527] = {
            description = "Torch firmly in hand, you turn away from the brazier and look out over " ..
                "Durotar. You feel an excitement tugging at your spirit as the wind picks up and forces " ..
                "the flame to dance violently.\n\nYou start off down the path back to the Barrens in " ..
                "search of Kranal Fiss.",
            rewardItems = {{5176, 1}},
        },
        [1531] = {
            description = "You be makin' headway now, mon. Your be ready to prove yerself worthy of the " ..
                "air totem, but first, ya must fin' Prate Cloudseer in Thousand Needles. She be willin' " ..
                "ta tell ya how to get yer air totem if ya treat her wit enough respect.\n\nHead south " ..
                "through the Barrens, and after ya reach Thousand Needles, head east. You'll find her " ..
                "hiddin' in a hole wit' her boyfriend--haha, don' tell her I be dissin' her none--she not " ..
                "take it too kindly.",
            rewardItems = {{5178, 1}},
        },
        [1560] = {
            description = "I am so lost!\n\nMy wife, Torta, sent me out to fetch dinner and I must have " ..
                "taken a wrong turn somewhere.\n\nWould you be so kind as to lead me back to Torta? She's " ..
                "waiting for me just south of Steamwheedle Port.",
            rewardChoices = {{9638, 1}, {9642, 1}},
        },
        [1643] = {
            description = "Your task then, <name>, is to find someone here in Stormwind that is in need " ..
                "of aid. Someone who is pure of heart and motive. Perhaps someone helping others. Perhaps " ..
                "someone in need of a guide. Regardless, the person must have noble intent and be relying " ..
                "on your kindness.\n\nDo this, and return to me when you are finished. Then, we shall " ..
                "discuss more of your path and what it means to be a paladin of the Light.",
        },
        [1689] = {
            description = "By retrieving my choker and besting Surena, you've proven that you're at least " ..
                "as capable as she was.\n\nWith that said, I can tell you're direly in need of training. " ..
                "You can manage the flows of magic, yes, but being a warlock is much more than that.\n\nI " ..
                "will show you how to command a voidwalker, but before I can, you must call one forth at " ..
                "a summoning circle and subdue it using whatever weapons--physical and magical--you have " ..
                "at your disposal. Use the magic of this choker at the summoning circle below.",
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
        [1780] = {
            description = "I'll take these to the children this very day. Please be safe, good <class>. " ..
                "It is not often <men/women> of your character show their faces in the city, but you've " ..
                "proven that the paladins here in Stormwind shall never turn their backs on those in " ..
                "need.\n\nFarewell.",
        },
        [1822] = {rewardChoices = {{7115, 1}, {7117, 1}, {7116, 1}, {7118, 1}}},
        [1952] = {
            description = "I'll go make the wands now.",
            rewardChoices = {{7514, 1}, {11263, 1}, {7513, 1}},
        },
        [2138] = {
            description = "As I had feared, the cure does not work.\n\nIt saddens me greatly to order the " ..
                "death of any of nature's beasts, but the sick and tainted thistle bears must be put " ..
                "down.\n\nReturn to the forest and destroy 20 rabid thistle bears, <name>. It will most " ..
                "certainly not put a stop to the plague but it will slow down the damage the animals are " ..
                "doing to our forest and its inhabitants for a short time.",
        },
        [2282] = {
            description = "We've been training thieves here for years! After all, not every rapscallion " ..
                "is born with the grace and finesse of old Lucius.\n\nUp off the road here you'll find " ..
                "Alther's Mill. I got a chest up there with something important inside. Go get it for me! " ..
                "Bring back that token and you'll receive your Certificate of Thievery!",
            rewardItems = {{7907, 1}},
        },
        [2608] = {
            description = "Oh my, you look like death. Correction - I've seen death, you look worse than " ..
                "death. You, <sir/miss>, would be what death coughed up at his last physical.\n\nHah! You " ..
                "hear that Noarm? Write that one down!\n\n*Cough* Hrm yes, in order for me to help you, " ..
                "I'll need to draw some blood. Don't worry, it only hurts the first few... fifty times or " ..
                "so... /lay down when you're ready for the treatment, <name>.",
        },
        [2764] = {
            description = "If you are ready to conclude your training with Galvan, you should journey to " ..
                "Gadgetzan.\n\nThere, you will find my finest pupil: Trenton Lighthammer. He has much to " ..
                "teach you in the ways of ornate mithril. Otherwise, remain here and learn!\n\nOh, " ..
                "Gadgetzan is in Tanaris, of course!",
        },
        [2841] = {
            description = "Gnome technology - two years ago its most common use was as a punch line. " ..
                "Times certainly have changed. Now they've got a new rig built that's better than all our " ..
                "shredder models combined. I need the blueprints, <name>!\n\nUnfortunately, the plans are " ..
                "locked away in a safe near Mekgineer Thermaplugg. To make matters worse, the combination " ..
                "to the safe is only known by Mekgineer Thermaplugg.\n\nDo whatever you have to do to get " ..
                "that combination, <name>. Then crack open that safe and bring back those blueprints!",
            rewardChoices = {{9623, 1}, {9624, 1}, {9625, 1}},
        },
        [2867] = {
            description = "With the discovery of the strange gazebo in the heart of the Ruins of " ..
                "Solarsal, the time has come to return to Feathermoon Stronghold and report to General " ..
                "Shandris Feathermoon what has been discovered here.",
            rewardMoney = 4500,
        },
        [2902] = {
            description = "Gnolls aren't the sharpest tools in the shed, but they will no doubt have some " ..
                "sort of documented strategy on their recent activity. If we were to find those plans, " ..
                "then we'd have a clearer idea of what is making them so worked up.\n\nI want you to head " ..
                "back to the Woodpaw and find anything that might resemble their battle plans. They have " ..
                "to have something; their attacks have been too coordinated to be done without them. Find " ..
                "them, and return to me when you have them.",
        },
        [2927] = {
            description = "You don't think I was always bald, do you? No <sir/ma'am>! It was the " ..
                "radiation leak in Gnomeregan that caused this tragic hair loss. Before that day, I had " ..
                "the only gnomefro in all of Azeroth.\n\n< Gnoarn shakes his fist in the air.>\n\nDamn " ..
                "those damned dirty troggs - damn them all!!\n\nPerhaps it's not too late, <name>. We may " ..
                "still be able to save it - the city I mean! Speak to Ozzie Togglevolt in Kharanos. He " ..
                "and his partner Razzle are working on a solution.",
        },
        [2962] = {
            description = "Not only was your sample insufficient in quantity, it was also impure.\n\nWhat " ..
                "we require is more green glow. The troggs are obviously not irradiated sufficiently to " ..
                "fulfill our needs. You will have to go into Gnomeregan and bring back some radioactive " ..
                "fallout, straight from the tap. I am speaking of the irradiated slimes, lurkers and " ..
                "horrors. Be warned, the containment of this type of fallout is difficult. You may need " ..
                "to make several attempts with the phial until a suitable sampling is recovered.",
            rewardMoney = 2500,
        },
        [2986] = {
            description = "Long has it been since you were last tested, <name>. You have shown patience " ..
                "thus far in your studies, but the time has come for you to learn more. The time has come " ..
                "for you to learn about the purity of water.\n\nSeek out Islen Waterseer in the Barrens. " ..
                "She is along the eastern coast, south of the Southfury River and Ratchet. You will find " ..
                "her there at her fishing hut. Good luck to you, <name>.",
        },
        [3084] = {
            description = "Ah, while you were gone a tablet came for you, <name>.\n\nRead it when you " ..
                "have time. If I'm not mistaken, it came from the shaman trainer Shikrik. She would have " ..
                "words with you when you're ready.",
        },
        [3114] = {
            description = "While you were helping me out, this memorandum was given to me to pass on to " ..
                "you. Take some time to read it when you have a chance. I'm thinkin' it came from the " ..
                "mage trainer Marryk. Take a gander at it and go find him inside Anvilmar when you've a " ..
                "chance.",
        },
        [3378] = {
            description = "Will you assist me, mortal? Will you find the prayer to Elune?\n\nAs I stated, " ..
                "the prayer was etched onto a golden tablet. One of these idol worshipping scoundrels " ..
                "must have it on their person.\n\nIf you do recover my prayer, take it to Astarii " ..
                "Starseeker in Darnassus. It matters little that my faith has been rekindled after the " ..
                "countless malevolent actions that I have taken against this world and its inhabitants, " ..
                "but my prayer must be heard. Absolution is the last thing I expect.",
            rewardChoices = {{10745, 1}, {10746, 1}},
            rewardMoney = 14500,
        },
        [3450] = {
            description = "I want the rubbings delivered to my tower, but there's no need to have you go " ..
                "all the way there. I'll just have them air-lifted out of Azshara.\n\nXiggs Fuselighter " ..
                "owes me a favor or two and will be in the area soon--he's signed on to patrol the coast. " ..
                "Speak to him before you leave. He can give you a flare gun to signal him with. When you " ..
                "have the rubbings, just head to wherever he tells you and then give them to him so he " ..
                "can get them to my tower safely. He should be in the hangar in the Military Ward.",
            rewardXP = 510,
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
        [3741] = {
            description = "My friend Hilary lost her necklace, and we can't find it. We've been fishing " ..
                "all day right here, and we looked around here already. The only thing I can think of is " ..
                "that it fell into the lake. Our parents don't want us to swim in the lake... my mom says " ..
                "there's some mean things underwater, but you look like you aren't scared of mean " ..
                "things.\n\nCould you find it for her, please?",
        },
        [3821] = {
            description = "Sha'ni was sent to investigate reports of strange ritualistic activity coming " ..
                "from the Firegut ogres of the Burning Steppes over three weeks ago.\n\nGoretooth tells " ..
                "me that he hasn't heard from anyone in that platoon and that it's best that I move on " ..
                "and focus on the task at hand. Can you believe it? That's my wife!\n\nI can't leave my " ..
                "post, <name>, but I must know what became of Sha'ni. Travel to the Burning Steppes and " ..
                "search for her.",
        },
        [3823] = {
            description = "We must strike at our enemies before they strike at us!\n\nI'll make this " ..
                "brief, soldier.\n\nThe Firegut ogres of the Burning Steppes are allies of the Blackrock " ..
                "orcs. They work closely with those vile orcs, keeping the mineral rich Dreadmaul Rock " ..
                "guarded and the supply lines open at all times.\n\nLeave your mark, <name>. Cripple " ..
                "their forces and return to me when the job is done.\n\n< Oralius grabs at the air and " ..
                "makes a choking motion.>\n\nI WILL KILL YOU, WINKY!",
        },
        [3844] = {
            description = "A destroyed raft rests along the shoreline. Considering this is only a small " ..
                "pond, it is not clear as to how it ended up here, although looking at the trees tells " ..
                "you that the water level may not be constant.\n\nPerhaps a little exploration in the " ..
                "area might uncover more clues...",
        },
        [3861] = {
            description = "\"Cluck... cluck... cluck... BACAW!\n\nCluck... cluck... cluck.\"\n\nThe " ..
                "chicken looks up at you and then starts to scratch its claws into the ground. You think " ..
                "it is spelling out a word, but you are not sure what it is. Could it be... " ..
                "S-A-L-D-E-A-N? Before you can ask, the chicken turns away and goes about its business.",
            rewardXP = 10,
        },
        [3901] = {
            description = "You've shown your potential to the Forsaken under normal circumstances <name> " ..
                "- now let's see you under pressure.\n\nThe Rattlecage skeletons, more mindless minions " ..
                "of the Lich King, are a tougher foe than the zombies you have faced thus far. Again, " ..
                "thin their numbers and prove yourself to the Forsaken. Do not tarry - when you are done, " ..
                "speak to me again.",
            rewardChoices = {{3274, 1}, {11851, 1}, {11852, 1}},
        },
        [3914] = {
            description = "After a strong flash of light, you are able to pick up the sword again. It has " ..
                "been transformed!",
            rewardMoney = 7500,
        },
        [4108] = {rewardItems = {{11516, 2}}},
        [4124] = {
            description = "An associate of mine, Ginro Hearthkindle, is looking for assistance concerning " ..
                "the location of a courier and the parcels he was carrying. It has been a week or so " ..
                "since the courier went missing; our own searches have proved fruitless, and we're at an " ..
                "impasse. Unfortunately, I have had to declare the courier as missing in action.\n\nIf " ..
                "you have the time and resources to spare, please speak with Ginro. He should be here in " ..
                "the Stronghold - perhaps in his quarters.",
        },
        [4341] = {
            description = "You have been to the smoldering ruins of Thaurissan? Did you happen to run " ..
                "into a pitiful lout named Kharan Mighthammer? The dwarf that was supposedly watching " ..
                "over my baby girl!\n\n<The King sobs.>\n\nAnd now she's gone, <name>!\n\nI have had my " ..
                "men turn the Steppes upside down. The only clue they have as to the whereabouts of my " ..
                "daughter is that she may be inside the Depths. For all I know, she could be " ..
                "dead!\n\nKharan is supposedly being held prisoner there... find him! I want answers!",
        },
        [4381] = {rewardItems = {{11562, 6}}},
        [4488] = {
            description = "Ah, <name>, you've seen fit to grace us with your presence. How " ..
                "wonderful!\n\nI hope you do not expect us to wait on you hand and foot also. You may be " ..
                "growing quickly in power, but you still are a pup when it comes to true knowledge and " ..
                "understanding. If you're not careful, corruption will overwhelm you and your weak " ..
                "will.\n\nBut I should get to the point: Strahad wishes to speak to you. He is still " ..
                "residing in his tower overlooking Ratchet in the Barrens. I suggest not taking too long.",
            rewardXP = 315,
        },
        [4489] = {
            description = "You, <race>! Come here!\n\nYou're the one they call <name>, yes?\n\nI thought " ..
                "as much. I will keep this short: you're growing in power, and it has been acknowledged. " ..
                "And now, the time has come that you are rewarded for your efforts.\n\nGo to the Barrens. " ..
                "There, above Ratchet, you'll find Strahad Farsan --perhaps you remember him? He would " ..
                "have words with you. I wouldn't take long.",
            rewardXP = 315,
        },
        [4770] = {
            description = "Please help me, <class>! I've been hiding here in Highperch for some time now " ..
                "and it's been days since I've seen a friendly face. I came here to study the wyvern and " ..
                "I think I got a little too close. After being chased away from one of the nests I got " ..
                "lost.\n\nI need to get back to Whitereach Post! Motega does not know that I am missing " ..
                "and will be furious to know that I ventured into Highperch by myself.\n\nWhitereach Post " ..
                "is just east of here... please take me there!",
            rewardMoney = 1900,
        },
        [4783] = {
            description = "The next components are found in Desolace, far to the west of the Barrens and " ..
                "even the Stonetalon Mountains.\n\nThere, chaos still reigns after the Sundering. Both " ..
                "your strength and cunning will be tested there--you will face creatures of hatred and " ..
                "also of the Burning Legion.\n\nFrom the Hatefury satyr in the northeast, bring me their " ..
                "blood. From the lesser infernals in Mannoroc Coven, bring me a lesser infernal " ..
                "stone.\n\nWe will use both in the construction of your robe.",
        },
        [4786] = {
            description = "I will put the robe together for you now. It will take but a few moments. Do " ..
                "not go far.",
            rewardItems = {{6900, 1}},
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
        [4907] = {
            description = "Hi, <name>. Remember Tinkee Steamboil? Well, she remembers you! She sent me a " ..
                "message to keep an eye out for you, because... she needs your help again. I think it has " ..
                "something to do with her studies on dragons.\n\nYou should speak to her in the Burning " ..
                "Steppes, at the Flame Crest.",
        },
        [5001] = {
            description = "Ordinarily I don't deal with <race>s but it seems that I'm stuck between a " ..
                "troll and a hard place. You see, my mission here is one of utmost importance to the " ..
                "Horde. The information I've discovered, however, applies to the well being of the " ..
                "Alliance as well. Now believe me, I'm no Alliance sympathizer, but the Blackrock threat " ..
                "is bigger than just a bunch of orcs.\n\nYou help me out by finding my belongings and " ..
                "I'll help you out with some information that could prove useful to your kind.\n\nDeal?",
        },
        [5054] = {
            description = "In the snowy mountains of Winterspring, to the northwest, a skilled hunter " ..
                "stalks his prey... I speak of Ursius of the shardtooth bears, an agile and clever " ..
                "beast.\n\nI send you now against him. He roams the sloping hills to the northwest of " ..
                "Everlook. Find and hunt him, before he discovers your intent.\n\nAll that have gone up " ..
                "against Ursius have quickly found themselves to be the prey, and he, the hunter. Stay on " ..
                "your guard.",
        },
        [5061] = {
            description = "You have completed the necessary lessons all young druids are taught before " ..
                "they can adopt an aquatic aspect. Go now back to your trainer, Mathrengyl Bearwalker, in " ..
                "Darnassus. Show him your pendant and prove to him you are ready to learn what he has to " ..
                "teach you. He will complete your training, allowing you to become one with the " ..
                "water.\n\nGoodbye, young druid. We shall speak again.",
            rewardItems = {{16608, 1}},
        },
        [5093] = {
            description = "Heroes of the realm, hear me - the Horde calls upon you for swift action!\n\nA " ..
                "call to arms has been issued for all able bodied individuals to take up arms against the " ..
                "Scourge! Rumors fly of new threats rising from the ruins of the Eastern Kingdoms. They " ..
                "loom to the east of the Undercity, in the northern reaches of the lands now known as the " ..
                "Plaguelands!\n\nHeroes of the realm - seek out High Executor Derrington, who has set up " ..
                "his base camp at the Bulwark, east of Tirisfal Glade!",
        },
        [5382] = {
            description = "Krastinov is responsible for the deaths of thousands. He must be punished, " ..
                "justice must be meted out.\n\nFind him and exact upon him the agony he has inflicted " ..
                "upon countless innocents. Once he is destroyed, burn our remains. Turn them to ashes, " ..
                "<name>.",
        },
        [5402] = {rewardItems = {{12844, 1}}},
        [5464] = {
            description = "The soul of the fallen clings to that which represents its former life and " ..
                "transforms the item into a soulbound keepsake. You pick the item up and place it in your " ..
                "pack.",
        },
        [5513] = {
            description = "Your service to the Argent Dawn is to be commended, <name>. You are truly " ..
                "revered amongst us. I have been authorized to make available for you to purchase one of " ..
                "the Dawn's most valued items - our magic resistance mantles.\n\nApplication of a mantle " ..
                "to your existing shoulder piece will enhance your resistance to the powers of magic in " ..
                "one of five potential ways. As a sign of continued dedication to our cause, I ask for no " ..
                "less than ten of our valor tokens in exchange for access to these mantles.",
        },
        [5536] = {
            description = "The satyr, a disfigured, evil aspect of the night elves, now infect the sacred " ..
                "lands once traveled by Cenarius. I cannot speak for the night elves when it comes to all " ..
                "the atrocities those demonic creatures have committed, but I have sworn an oath to the " ..
                "Earthmother to aid the elves in ridding the land of such a nuisance.\n\nI am sure you " ..
                "would prove yourself if you aided me in purging them.\n\nNortheast of here, you can find " ..
                "the Haldarr clan. Return to me after you've tested yourself against their power.",
            rewardMoney = 7000,
        },
        [5561] = {
            description = "Bibbly thinks he is the only goblin in Desolace who knows how to make money. " ..
                "Well, the only caravan brave enough to travel these parts relies on me. Ever since I " ..
                "learned how to rejuvenate and control aged and dying kodos with my kodo kombobulator, " ..
                "the caravan owner Cork, Rigger, and I entered a partnership.\n\nTake the kombobulator " ..
                "and use it on any ancient, aged, or dying kodos; it will jolt the beast into a tamed " ..
                "kodo and force it to follow you. Once you have a kodo tamed, bring it back to me.",
            rewardChoices = {{15697, 1}, {15698, 1}},
        },
        [5628] = {
            description = "Ah, yes, hello, <name>? I'm glad you stopped to talk for a moment. You are a " ..
                "far way from home at such a young age--I admire such ambition. I wish when I was younger " ..
                "I could have mustered the courage to travel the world.\n\nThere was a priestess of your " ..
                "order here looking for you not too long ago. She said it was very urgent you returned to " ..
                "the Temple of the Moon in Darnassus and speak to Priestess Alathea --it had something to " ..
                "do with your training. I wouldn't dally too long if you can help it.",
        },
        [5729] = {
            description = "I think our next step should be to have you placed close to Neeru. If he is as " ..
                "agitated as reports suggest, then we may accomplish two things. One, you may be able to " ..
                "gain some greater knowledge about the Council or at least the Burning Blade, and two, he " ..
                "may just begin to trust you enough that he asks you to start to aid him. He may very " ..
                "well look at you as someone who can fill the void now that some of the leadership is in " ..
                "turmoil.\n\nReturn to the Cleft and speak to him again, but do not be too overt.",
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
        [6004] = {
            description = "I was sent as a scout to do some damage and gauge the strength of Hearthglen's " ..
                "defenses. Some people in the Alliance feel the little town has more than historical " ..
                "importance. It's not my job to question what that importance is, but regardless, I'm in " ..
                "no shape to continue until I rest up.\n\nIf you're willing, I'd pay handsomely for some " ..
                "help. Start south of here at their camp near the small bulwark they've set up. If you " ..
                "prove strong enough, maybe I could get your help with my main goal.",
            rewardMoney = 6500,
        },
        [6021] = {
            description = "Can you believe that, after all the trouble we have in the plaguelands... we " ..
                "have to worry about thieves too? And not just normal thieves, troll thieves.\n\nAnd not " ..
                "just normal troll thieves. Dead troll thieves!\n\nThey're led by this big, dead troll " ..
                "named Zaeldarr the Outcast, and they come here at night and steal bodies from the pit " ..
                "below, then take them back to their evil, dead troll hideout--the Undercroft to the " ..
                "west.\n\nGo there and take out Zaeldarr, <name>. I'm sick to death of his mischief!",
            rewardMoney = 8500,
        },
        [6102] = {
            description = "You have tamed two creatures that inhabit the land, now you must tame one that " ..
                "soars the skies. Use the taming rod to tame a strigid screecher, found west of here. " ..
                "Practice your skills with this mighty owl at your side.\n\nWhen you return, I will " ..
                "bestow you with the skills you will need to tame an animal of your choosing to be your " ..
                "companion; this creature will face the challenges you face, and gain experience " ..
                "alongside you. I will also show you how to call it and dismiss it as you wish.",
        },
        [6392] = {
            description = "For a small fee you can buy a gryphon ride to Thelsamar... as long as you've " ..
                "already been there. Gryphons will only fly you to places you've already been, so be sure " ..
                "to speak with every gryphon master you see so you can fly to him later.\n\nYou've " ..
                "already been to Thorgrum, the gryphon master of Thelsamar, so now you can return to him. " ..
                "And once in Thelsamar, you can deliver the picks to Brock Stoneseeker.\n\nSpeak with me " ..
                "when you're ready to go.",
            rewardMoney = 350,
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
        [6628] = {
            description = "So the time is once again upon us. As a student of lore, you have shown great " ..
                "tenacity by undertaking my task.\n\nAnd so now I offer you your question. If you are " ..
                "ready, speak to me again, and take all the time you need, <name>--there is no pressure " ..
                "to answer quickly.",
        },
        [7046] = {
            description = "My scepter was once a source of hope for me. Its power allowed me the freedom " ..
                "to travel quickly through these caverns. I had hoped to bring peace to the spirit of my " ..
                "uncle... It is a task that I now pass to you.\n\nFor the two parts to once again become " ..
                "one, I will need your assistance in performing the ritual. Please follow me, and listen " ..
                "to my instructions while I channel the energy required to reunite the rod with the " ..
                "diamond.\n\nTogether, we shall create the Scepter of Celebras once again!",
            rewardItems = {{17191, 1}},
        },
        [7642] = {
            description = "You'll need four things for the barding - runecloth for the lining, arcanite " ..
                "bars for the plating, Arthas' Tears for the spiritual attunement, and Stratholme holy " ..
                "water for the spiritual imbuement. Actually, you need five things... gold for my fee. " ..
                "That fee includes all labor as well as a handcrafted saddle and stirrups.\n\nOnce you've " ..
                "got all that, I'll be able to finish your barding. Until then, there are some things I " ..
                "can get started on for you while you assemble your collection of goods.",
        },
        [7867] = {rewardItems = {{19155, 1}}},
        [8120] = {
            description = "As you no doubt have heard, the League of Arathor is sending large numbers of " ..
                "troops into Arathi Basin. Eager for food and supplies, these Alliance fools are intent " ..
                "to take and control the rich resources there. We must show them that Arathi will never " ..
                "again be a home for humans!\n\nGo to Arathi Basin and assault the mine, the lumber mill, " ..
                "the blacksmith and the stables. Pull down the enemies' banners, declaring those " ..
                "territories for the Horde.\n\nGo, <name>. Report back to me when this task is complete.",
            rewardMoney = 16500,
        },
        [8148] = {rewardItems = {{19621, 1}}},
        [8257] = {
            description = "Now the last part, the second cure.\n\nThe green drake Morphaz is known to be " ..
                "immune to all forms of poison and disease -- many druids died to bring us this " ..
                "information. There is no doubt his blood is potent for our needs.\n\nA courier from the " ..
                "Cenarion Circle will take the parts you have already collected while you gather the " ..
                "last. Summon your allies and seek out the drake's lair in the sunken temple of " ..
                "Atal'Hakkar. Bring his blood to Greta Mosshoof in Felwood.",
            rewardChoices = {{19990, 1}, {20082, 1}, {20006, 1}},
            rewardMoney = 15500,
        },
        [8282] = {
            description = "Where am I? Where's my bag? *gasp* I must've lost it while fleeing from " ..
                "Deathclasp, the giant scorpid. In my rush to escape I walked right into a nest of " ..
                "stonelash flayers.\n\nThe satchel I was carrying had all sorts of rare reagents in it. " ..
                "Without them, me and Beetix won't be able to make the potions that Cenarion Hold needs. " ..
                "I'm too weak to get up yet, but I can make it worth your while if you bring back my " ..
                "reagents.\n\nI ran into Deathclasp in the southern mountain range, behind Bronzebeard's " ..
                "camp.",
            rewardChoices = {{13452, 2}, {13447, 2}},
        },
        [8308] = {
            description = "To Whom It May Concern:\n\nIf you're reading this, I'm either dead or soon to " ..
                "be dead. It's hard to say. Most of the crew is dead anyhow.\n\nFound information about a " ..
                "Titan. Great battle between him and an Old God. Yes, a bona fide Old God. Found ancient " ..
                "tunnel leading to Ahn'Qiraj. Taking it.\n\nTake this letter to my old camp. Make sure my " ..
                "monkey is getting adequate food, water, and hugs.\n\n-Brann Bronzebeard, Explorer " ..
                "Extreme\n\nP.S. Watch out for crazy Old God worshipping night elf.",
            rewardItems = {{20723, 1}},
        },
        [8320] = {
            description = "The Twilight's Hammer, an insane cult bent on destruction, set up camps in " ..
                "Silithus and perform rituals day and night. We do not yet know their plans, but we do " ..
                "think they are somehow linked to the pulsing red crystals spread across the " ..
                "desert.\n\nAlthough their mystery may one day be solved, we must first deal with their " ..
                "immediate threat. Go to their camps to the west and seek out Twilight geolords. They are " ..
                "the heads of these serpents; that is where we must strike!",
            rewardMoney = 9000,
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
        [8377] = {rewardItems = {{20702, 1}, {20713, 1}}},
        [8393] = {
            description = "Winning a war is about more than just outsmarting and outfighting your " ..
                "opponent. Victory often comes down to simply producing more than your enemy.\n\nWhat we " ..
                "have in Arathi Basin is a sizeable supply of resources for whichever side manages to " ..
                "claim it first.\n\nIf the Alliance comes out victorious, it'll mean more swords and " ..
                "pikes for our troops. If the Horde were to win, those swords and pikes would still get " ..
                "made, they'd just be pointed at us! Now is the time to help the Alliance in Arathi " ..
                "Basin, <name>.",
            rewardMoney = 4500,
        },
        [8426] = {
            description = "The battle in Warsong Gulch against the Silverwing Sentinels is of great " ..
                "importance. Under the guise of protecting a forest that doesn't belong to them, the " ..
                "Alliance seeks to deny the Horde one of our largest sources for lumber.\n\nDo not let " ..
                "this happen, <name>! Come back to me with proof of serving the Horde in a worthy manner!",
            rewardMoney = 2500,
        },
        [8518] = {
            description = "Ever am I amazed by the selflessness exhibited when so many would instead turn " ..
                "to selfishness instead. <class>, I am still in need of a number of linen bandages before " ..
                "my assignment here is fulfilled. Will you aid me once more in the collection of those " ..
                "bandages?",
            rewardItems = {{21436, 1}, {21509, 1}},
        },
        [8544] = {
            description = "It is said among us that the ornate shoulder armor worn by the mortal races " ..
                "started as an attempt to emulate the wings of a dragon.\n\nBring me the bindings worn by " ..
                "the highest Qiraji leaders and I shall shape them into a set of pauldrons more dreadful " ..
                "than even the wings of Nefarian himself!",
            rewardItems = {{21330, 1}},
        },
        [8550] = {rewardItems = {{21438, 1}, {21509, 1}}},
        [8574] = {
            description = "The badges you collect from performing combat, logistics and tactical " ..
                "assignments for Windcaller Proudhorn are more than just for show, <name>.\n\nYou'd be " ..
                "wise to hold on to them. As you prove your loyalty to our organization I can offer you " ..
                "some of the gear we reserve for our closest allies in exchange for those badges.",
            rewardChoices = {{21184, 1}, {21185, 1}, {21186, 1}, {21189, 1}},
        },
        [8608] = {rewardItems = {{21438, 7}, {21512, 1}}},
        [8625] = {
            description = "It is said among us that the ornate shoulder armor worn by the mortal races " ..
                "started as an attempt to emulate the wings of a dragon.\n\nBring me the bindings worn by " ..
                "the highest Qiraji leaders and I shall shape them into a set of pauldrons more dreadful " ..
                "than even the wings of Nefarian himself!",
            rewardItems = {{21345, 1}},
        },
        [8708] = {
            description = "The Qiraji and their servants wield items made with the rarest and finest " ..
                "materials: bones from gargantuan ancient creatures, gems from the depths of the earth, " ..
                "metals pure and strong.\n\nJust the sight of Qiraji artifacts fills me with an urge to " ..
                "practice my craft with their shattered and smelted pieces. Prove your allegiance to the " ..
                "Circle, <name>, and I will make you a powerful weapon from the finest Qiraji materials.",
            rewardItems = {{21407, 1}},
        },
        [8709] = {
            description = "The Qiraji and their servants wield items made with the rarest and finest " ..
                "materials: bones from gargantuan ancient creatures, gems from the depths of the earth, " ..
                "metals pure and strong.\n\nJust the sight of Qiraji artifacts fills me with an urge to " ..
                "practice my craft with their shattered and smelted pieces. Prove your allegiance to the " ..
                "Circle, <name>, and I will make you a powerful weapon from the finest Qiraji materials.",
            rewardItems = {{21404, 1}},
        },
        [8730] = {
            description = "Champion, is it you? A thousand years it has been since I was entrusted the " ..
                "shard and it is at my darkest hour that one should rise to relieve me of it... But what " ..
                "would tragedy be without cruelty?\n\n<Vaelastrasz coughs weakly.>\n\nNe... Nefarius now " ..
                "holds the scepter shard.\n\nTime is of the essence. Nefarius plans to destroy the shard. " ..
                "You must hurry!",
            rewardChoices = {{21530, 1}, {21529, 1}},
        },
        [8737] = {
            description = "The Twilight's Hammer and the elemental nobles they worship present a " ..
                "formidable threat to our operations in Silithus. With the new enemies we're facing " ..
                "inside Ahn'Qiraj, we cannot afford to lower our guard to our enemies outside.\n\nFind a " ..
                "way to summon and destroy an Azure Templar and report to Bor Wildmane.",
            rewardItems = {{20801, 1}, {21133, 1}},
        },
        [8752] = {rewardItems = {{21201, 1}}},
        [8757] = {rewardItems = {{21206, 1}}},
        [8785] = {
            description = "The Orgrimmar Legion has put in a request for several unusual ingredients. " ..
                "Given their current performance in Silithus, we'd like to comply with their request as " ..
                "soon as possible. Gather the materials and bring them to the troll called Shai.",
            rewardItems = {{20800, 1}, {21386, 1}},
        },
        [8893] = {rewardItems = {{8647, 1}}},
        [8909] = {
            description = "Well met, <class>. I've something that might interest you.\n\nI have in my " ..
                "possession a set of armor much like the one worn by those of your profession, but of " ..
                "much higher quality. I'd be willing to trade the bracers for ordinary ones in exchange " ..
                "for a small favor.\n\nThe blood of the frostsabers and bears that inhabit Winterspring " ..
                "has properties I'm in need of at the moment. Bring me a sizeable sample of it along with " ..
                "the bracers and a small amount of gold. You shall find the effort worth your while.",
            rewardItems = {{22079, 1}},
        },
        [8977] = {
            description = "It's been great working with you, <name>. Here is the finished product.\n\nI " ..
                "hope it helps you in your current endeavors. And hey, if you don't mind, help spread the " ..
                "word. I wouldn't mind having more customers!",
        },
        [9006] = {
            description = "That's an amazing story, <name>! You have my thanks, and the heartfelt " ..
                "gratitude of all who were involved. Now maybe I'll be able to sleep at night with both " ..
                "eyes shut.\n\nAs to your reward, I believe I have a few things that you'll really enjoy.",
            rewardItems = {{21999, 1}, {21997, 1}},
        },
        [9050] = {
            description = "You will find the remnants of our fallen heroes on the corpses of the Lords of " ..
                "Naxxramas. Bring those desecrated keepsakes to me along with wartorn plate scraps and " ..
                "crafting materials capable of revitalizing the cursed armor and I shall craft a fine " ..
                "piece of armor for you.",
            rewardItems = {{22424, 1}},
        },
        [9053] = {
            description = "It is as I feared -- the toxin is simply too weak for such a powerful " ..
                "creature.\n\nIf we are to create a toxin of high enough potency, you must venture to the " ..
                "bottom of the Temple of Atal'Hakkar, unlock the secrets of the altar and recover a " ..
                "putrid vine from the guardian there. The temple is dangerous, and it would behoove you " ..
                "to bring friends.\n\nReturn to me when this is done.",
            rewardChoices = {{22274, 1}, {22272, 1}, {22458, 1}},
        },
        [9112] = {
            description = "<Father Montoy makes some strange gestures in the air in front of " ..
                "you.>\n\nBlessed <boy/girl>, have you found the vestments of the fallen? The poor souls " ..
                "whose last breaths were taken on the field of battle - stripped of everything including " ..
                "their dignity.\n\nBring me the desecrated remnants of the departed along with reagents " ..
                "of purification and you shall know faith.",
            rewardItems = {{22513, 1}},
        },
        [9114] = {
            description = "<Father Montoy makes some strange gestures in the air in front of " ..
                "you.>\n\nBlessed <boy/girl>, have you found the vestments of the fallen? The poor souls " ..
                "whose last breaths were taken on the field of battle - stripped of everything including " ..
                "their dignity.\n\nBring me the desecrated remnants of the departed along with reagents " ..
                "of purification and you shall know faith.",
            rewardItems = {{22515, 1}},
        },
        [9120] = {
            description = "The phylactery is all that remains of the master of Naxxramas. Your better " ..
                "judgment dictates that you destroy the phylactery, preventing the lich from ever " ..
                "reforming. Thankfully, you seldom listen to that internal voice of reason.\n\nSomeone at " ..
                "Light's Hope will pay you hugely for this artifact. Who cares if Kel'Thuzad regenerates " ..
                "to full power?",
            rewardChoices = {{23206, 1}, {23207, 1}},
        },
        [9198] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order EN-558:\n\n14 " ..
                "Thorium Tubes.\n\nAll filled orders should be delivered to Packmaster Stonebruiser at " ..
                "Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and void if tampered " ..
                "with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
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
        [65602] = {
            description = "You will need a powerful reagent to tempt an incubus -- an object that " ..
                "represents great devotion and love.\n\nWith my scrying, I have located a small figurine " ..
                "that should be suitable for your ritual.\n\nThousands of years ago, the figurine " ..
                "belonged to a young couple. The original owners are no more, but their keepsake has " ..
                "survived to the present day.\n\nFollow the road north into Ashenvale, then west and past " ..
                "Maestra's Post. You will see a house nestled amongst the trees. There you will find what " ..
                "you seek.",
            rewardXP = 1550,
        },
    },
    npcs = {
        [5676] = {
            spawns = {
                [1497] = {{86.4, 26.4}, {86.4, 26.6}, {86.6, 27}},
                [1519] = {{25.2, 77.4}, {25.2, 77.6}, {25.6, 76.8}},
                [1637] = {{49.4, 50}, {49.6, 50}},
            },
            zoneID = 1497,
        },
    },
    objects = {},
    items = {},
}
