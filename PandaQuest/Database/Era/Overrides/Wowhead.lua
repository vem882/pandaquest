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
        [943] = {
            description = "Prospector Whelgar now holds the original fossil at his site in the Wetlands. " ..
                "When I discovered the Stone of Relu, I believed it to be the key to unlocking the " ..
                "mystery of the fossil.\n\nWhile I traveled on the road to meet Whelgar, I was attacked " ..
                "by raptors and the relic was lost. I don't know which one of the mottled beasts " ..
                "swallowed the relic but if you can retrieve it, I can unleash the power of these " ..
                "artifacts.\n\nBring me both the Stone of Relu, and the original fossil he holds.",
            rewardChoices = {{5627, 1}, {5626, 1}},
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
        [1154] = {
            description = "You have passed Dorn's tests, and now you seek to pass your next trial. Very " ..
                "good. But up until now, your challenges have been childish. It is easy to test your " ..
                "body--your mind is another matter completely.\n\nI shall explain it simply: find the " ..
                "book I name, study it, and answer my question about its contents.\n\nWhat book, you must " ..
                "be asking? The Legacy of the Aspects. It can be found at the bottom of Dor'danil in " ..
                "southern Ashenvale, protected by the dead druids and their slayers.",
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
        [1780] = {
            description = "I'll take these to the children this very day. Please be safe, good <class>. " ..
                "It is not often <men/women> of your character show their faces in the city, but you've " ..
                "proven that the paladins here in Stormwind shall never turn their backs on those in " ..
                "need.\n\nFarewell.",
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
        [4381] = {rewardItems = {{11562, 6}}},
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
        [5382] = {
            description = "Krastinov is responsible for the deaths of thousands. He must be punished, " ..
                "justice must be meted out.\n\nFind him and exact upon him the agony he has inflicted " ..
                "upon countless innocents. Once he is destroyed, burn our remains. Turn them to ashes, " ..
                "<name>.",
        },
        [5729] = {
            description = "I think our next step should be to have you placed close to Neeru. If he is as " ..
                "agitated as reports suggest, then we may accomplish two things. One, you may be able to " ..
                "gain some greater knowledge about the Council or at least the Burning Blade, and two, he " ..
                "may just begin to trust you enough that he asks you to start to aid him. He may very " ..
                "well look at you as someone who can fill the void now that some of the leadership is in " ..
                "turmoil.\n\nReturn to the Cleft and speak to him again, but do not be too overt.",
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
        [8737] = {
            description = "The Twilight's Hammer and the elemental nobles they worship present a " ..
                "formidable threat to our operations in Silithus. With the new enemies we're facing " ..
                "inside Ahn'Qiraj, we cannot afford to lower our guard to our enemies outside.\n\nFind a " ..
                "way to summon and destroy an Azure Templar and report to Bor Wildmane.",
            rewardItems = {{20801, 1}, {21133, 1}},
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
    },
    npcs = {},
    objects = {},
    items = {},
}
