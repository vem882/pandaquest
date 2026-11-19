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
        [127] = {
            description = "Lake Everstill is famous for its spotted sunfish. There's always demand for " ..
                "them...and I'm running low!\n\nBring me a batch of 10 and I'll barter well for them. If " ..
                "you can't fish yourself, then...maybe you can get them off the murlocs!",
            rewardItems = {{3663, 1}, {3680, 1}, {1322, 5}},
            rewardMoney = 1000,
        },
        [174] = {
            description = "My Gnomish friend, Cog, has promised to help me build a device which will let " ..
                "me peer towards the stars. A truth exists, beyond magic, that can explain the strange " ..
                "transformation in the forest.\n\nBring to me a bronze tube made by a skilled engineer. " ..
                "That is the first step, according to Cog's blueprint.",
        },
        [199] = {description = "You take a sample of the strange smelling powder."},
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
        [389] = {
            description = "VanCleef and I were members of the Stonemasons Guild. Our main project was to " ..
                "rebuild Stormwind after the War.\n\nWhen we had finished our duties, we were cheated. " ..
                "The nobles refused to pay us for our work. Some of the more senior of the Stonemasons " ..
                "were offered governmental jobs, but VanCleef refused it out of loyalty to all the " ..
                "Stonemasons. He led a riot and left the city, swearing revenge.\n\nHis lieutenant, Bazil " ..
                "Thredd, might know more about VanCleef's plans. He's being held prisoner in the Stockade.",
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
        [659] = {
            description = "Hail, and well met, <name>. I lead a group of adventurers investigating odd " ..
                "happenings in this area.\n\nMy cousin in Hillsbrad recently put down his dog Stanley " ..
                "because the animal mystically grew to an immense size and savagely attacked anyone who " ..
                "came near him.\n\nI believe the undead are involved, and we're looking for signs to " ..
                "prove as much.\n\nTwo of my companions, Quae and Kinelory, headed to the Go'Shek Farm in " ..
                "the Arathi Highlands, and haven't checked in for days. Find them for me? I grow " ..
                "concerned.",
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
        [1154] = {
            description = "You have passed Dorn's tests, and now you seek to pass your next trial. Very " ..
                "good. But up until now, your challenges have been childish. It is easy to test your " ..
                "body--your mind is another matter completely.\n\nI shall explain it simply: find the " ..
                "book I name, study it, and answer my question about its contents.\n\nWhat book, you must " ..
                "be asking? The Legacy of the Aspects. It can be found at the bottom of Dor'danil in " ..
                "southern Ashenvale, protected by the dead druids and their slayers.",
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
        [1360] = {
            description = "I had myself a fine job as a digger at the Uldaman excavation site in the " ..
                "Badlands... that is until those blasted troggs showed up. I escaped with my hide barely " ..
                "intact, and nothing else. In the chaos, I left my most treasured possession. It's safe " ..
                "from the troggs in my chest, sure, but it's right in the thick of 'em.\n\nI'd be in your " ..
                "debt, both in honor and coin, if you could fetch it for me! A chest with my name on it " ..
                "is at the end of the North Common Hall. That's the one you need to get in.",
            rewardMoney = 6000,
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
        [3741] = {
            description = "My friend Hilary lost her necklace, and we can't find it. We've been fishing " ..
                "all day right here, and we looked around here already. The only thing I can think of is " ..
                "that it fell into the lake. Our parents don't want us to swim in the lake... my mom says " ..
                "there's some mean things underwater, but you look like you aren't scared of mean " ..
                "things.\n\nCould you find it for her, please?",
        },
        [3823] = {
            description = "We must strike at our enemies before they strike at us!\n\nI'll make this " ..
                "brief, soldier.\n\nThe Firegut ogres of the Burning Steppes are allies of the Blackrock " ..
                "orcs. They work closely with those vile orcs, keeping the mineral rich Dreadmaul Rock " ..
                "guarded and the supply lines open at all times.\n\nLeave your mark, <name>. Cripple " ..
                "their forces and return to me when the job is done.\n\n< Oralius grabs at the air and " ..
                "makes a choking motion.>\n\nI WILL KILL YOU, WINKY!",
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
        [4802] = {rewardItems = {{12451, 3}}},
        [4904] = {
            description = "Arnak thinks we're going to be married... but after I declined his offer he " ..
                "came back that night and kidnapped me. My brother tried to stop him, but Arnak was too " ..
                "strong. He... he slew my brother and then brought me here. My poor brother...\n\n<name>, " ..
                "could you escort me out of the Darkcloud Pinnacle? Please... I need to get back to " ..
                "Thalia! She must be worried sick about me.",
            rewardChoices = {{15469, 1}, {15468, 1}},
        },
        [5054] = {
            description = "In the snowy mountains of Winterspring, to the northwest, a skilled hunter " ..
                "stalks his prey... I speak of Ursius of the shardtooth bears, an agile and clever " ..
                "beast.\n\nI send you now against him. He roams the sloping hills to the northwest of " ..
                "Everlook. Find and hunt him, before he discovers your intent.\n\nAll that have gone up " ..
                "against Ursius have quickly found themselves to be the prey, and he, the hunter. Stay on " ..
                "your guard.",
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
        [5561] = {
            description = "Bibbly thinks he is the only goblin in Desolace who knows how to make money. " ..
                "Well, the only caravan brave enough to travel these parts relies on me. Ever since I " ..
                "learned how to rejuvenate and control aged and dying kodos with my kodo kombobulator, " ..
                "the caravan owner Cork, Rigger, and I entered a partnership.\n\nTake the kombobulator " ..
                "and use it on any ancient, aged, or dying kodos; it will jolt the beast into a tamed " ..
                "kodo and force it to follow you. Once you have a kodo tamed, bring it back to me.",
            rewardChoices = {{15697, 1}, {15698, 1}},
        },
        [5729] = {
            description = "I think our next step should be to have you placed close to Neeru. If he is as " ..
                "agitated as reports suggest, then we may accomplish two things. One, you may be able to " ..
                "gain some greater knowledge about the Council or at least the Burning Blade, and two, he " ..
                "may just begin to trust you enough that he asks you to start to aid him. He may very " ..
                "well look at you as someone who can fill the void now that some of the leadership is in " ..
                "turmoil.\n\nReturn to the Cleft and speak to him again, but do not be too overt.",
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
        [6628] = {
            description = "So the time is once again upon us. As a student of lore, you have shown great " ..
                "tenacity by undertaking my task.\n\nAnd so now I offer you your question. If you are " ..
                "ready, speak to me again, and take all the time you need, <name>--there is no pressure " ..
                "to answer quickly.",
        },
        [7867] = {rewardItems = {{19155, 1}}},
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
        [8550] = {rewardItems = {{21438, 1}, {21509, 1}}},
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
        [8785] = {
            description = "The Orgrimmar Legion has put in a request for several unusual ingredients. " ..
                "Given their current performance in Silithus, we'd like to comply with their request as " ..
                "soon as possible. Gather the materials and bring them to the troll called Shai.",
            rewardItems = {{20800, 1}, {21386, 1}},
        },
        [8893] = {rewardItems = {{8647, 1}}},
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
    npcs = {},
    objects = {},
    items = {},
}
