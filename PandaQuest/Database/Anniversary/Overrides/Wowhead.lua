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
        [318] = {
            description = "Rejold Barleybrew experiments with his brews. Some of them taste good, some " ..
                "bad, and some...well, some will lay all but the stoutest dwarf flat.\n\nHe lives at " ..
                "Brewnall Village, west of Kharanos, and one of his drinks, Evershine, is what I want. " ..
                "It'll help keep me warm while I'm on the cold road.\n\nAnd...the blessed stuff burns so " ..
                "hot I can throw it in Jetsteam's furnace for a burst of power! That little tactic has " ..
                "gotten me out of more than one tight spot.",
        },
        [321] = {
            description = "The shipwrecks off the shore here are the doomed Third Fleet of Kul'Tiras, " ..
                "burned and sunk by Red Dragons during the last Great War.\n\nThe Fleet hailed from " ..
                "Lordaeron, but one ship, an Elvish Destroyer: Flying Osprey, was with it. It was " ..
                "shipping a load of Lightforge Iron and joined the Third Fleet for protection. Ironic " ..
                "that it sunk to the same dragons...\n\nEnough history. The Flying Osprey is wrecked to " ..
                "the south of Menethil Harbor. If you find the Lightforge Iron there, bring it to me.",
            rewardItems = {{2702, 1}},
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
        [496] = {
            description = "Ah, another wretched day in Tarren Mill. All of this clean air puts me in such " ..
                "a foul mood, <name>.\n\nThe sooner we can plague the humans here, the better. I've been " ..
                "conducting intense studies on possible killing agents to use in my concoctions but I " ..
                "haven't the time to collect them all.\n\nIf you want to make yourself of use, procure " ..
                "the following items for me: 10 Gray Bear Tongues and the very rare and hard to find, " ..
                "Creeper Ichor. You'll find both bears and creepers just outside of Tarren Mill.",
            rewardMoney = 150,
        },
        [519] = {
            description = "Targ, Muckrake, and Glommus are Mug'Thol's lieutenants. They are loyal to him, " ..
                "though who can say what drives an ogre to loyalty.\n\nBring me their heads, <name>, and " ..
                "then all that will remain is to remove Mug'Thol's head, crown and all.",
        },
        [531] = {
            description = "Light! Don't bring things like that into the Lodge... it's unsanitary, " ..
                "unspeakable, un... un... unsanitary!\n\nJust get it out of here, will you? No one wants " ..
                "to see your bloody little trophy, really!",
            rewardChoices = {{3574, 1}, {3573, 1}},
        },
        [543] = {
            description = "The Perenolde Tiara is an old heirloom of the Perenolde \"nobles\" - the " ..
                "ruling family of Alterac before that kingdom fell to ruin. It is said to have been " ..
                "crafted by master jewelers in Ironforge, and fitted with the finest of emeralds.\n\nWhen " ..
                "Alterac was destroyed the Tiara was lost, but there are rumors that an Ogre Mage, " ..
                "Grel'borg the Miser, found the tiara and now wanders the Ruins of Alterac searching for " ..
                "more treasures.\n\nWe would have you acquire the tiara for us.",
            rewardMoney = 15000,
        },
        [565] = {
            description = "I, the great Bartolo, shall make for you the world famous, Alliance renowned, " ..
                "Yeti Fur Cloak!\n\nTravel the planet and find yourself a better cloak, I dare you. Oh " ..
                "wait, what is that, little <race>? \"Bartolo, there is no finer cloak!\" Yes, yes! That, " ..
                "I have heard before.\n\nBartolo requires a Bolt of Wool, a Hillman's Cloak made by a " ..
                "skilled leatherworker, Fine Thread and Yeti Fur, of course! Bring to me these items and " ..
                "you shall be a happy customer!",
            rewardItems = {{2805, 1}},
        },
        [579] = {rewardChoices = {{2154, 1}, {3899, 1}}},
        [643] = {
            description = "Though they can barely be said to control Stromgarde, let alone the whole of " ..
                "Arathi Highlands, the human prince trots the remnants of his cavalry over the " ..
                "countryside. I can't understand why he does it, but who understands the way the humans " ..
                "think, hm?\n\nWhatever his reasoning, more importantly, he has given one of the sigils " ..
                "to Lieutenant Valorcall, their cavalry leader. Locate him and bring his sigil back to me.",
            rewardMoney = 5500,
        },
        [718] = {
            description = "In our hurry to leave the Uldaman excavation site, we were forced to abandon " ..
                "many wagons and crates of supplies along the way. The local ogres from Camp Kosh have " ..
                "been on our abandoned equipment like vultures on a rotting corpse. Don't smell much " ..
                "better, either. Than the corpses, I mean.\n\nAnyways, they took the cart that was " ..
                "carrying all our weapons and such... so--well, this is a bit embarrassing--we haven't " ..
                "been able to get any food.\n\nWe're in a bit of a pickle here, suppose you could help us " ..
                "out?",
        },
        [756] = {
            description = "To create the Thunderhorn Cleansing Totem, you must gather the claws of the " ..
                "predators of the Mulgore plains. Hunt prairie stalkers for their stalker claws and " ..
                "flatland cougars for their cougar claws, then return to me.\n\nYou will find the prairie " ..
                "stalkers and flatland cougars to the east and west.",
        },
        [831] = {
            description = "Humans cannot be trusted. We fought alongside them with a weary heart, knowing " ..
                "they would betray us one day.\n\nAdmiral Proudmoore's death was not enough to stop his " ..
                "legacy of deceit. The human scum had his plans well laid out before he ever met his " ..
                "demise.\n\nHis reign won't even die with Benedict it seems. Who knows how long it will " ..
                "be before the next waves of Proudmoore's men land upon our shores.\n\nWe need to get " ..
                "these orders to Vol'jin in Orgrimmar immediately! He can be found in Thrall's chamber.",
            rewardMoney = 175,
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
        [905] = {
            description = "Now, <name>, the hunt deepens. Now you must defeat your prey, and then find " ..
                "your way to its lair.\n\nHunt the sunscale raptors to the south. Slay them and remove " ..
                "the feathers they wear. Place the feathers on the scytheclaw nests southwest of the " ..
                "Stagnant Oasis. Show their brethren you do not fear them!",
            rewardMoney = 900,
        },
        [916] = {
            description = "I came to Shadowglen to observe the webwood spiders that dwell in the " ..
                "Shadowthread Cave. They are cousin to a much smaller variety of spider; I believe the " ..
                "world tree has had a profound effect on them, and I would like specimens to study to " ..
                "confirm this.\n\nFirst, I would like some of their venom. Gather Webwood venom sacs from " ..
                "the spiders in and around the Shadowthread Cave, to the north. I can then examine them " ..
                "for similarities with their smaller cousin's venom.",
            rewardChoices = {{10544, 1}, {5392, 1}, {5393, 1}, {5586, 1}},
        },
        [935] = {
            description = "Without the blessings of Alexstrasza the Life-Binder and Nozdormu the " ..
                "Timeless, Teldrassil 's growth has not been without flaw. Strange beasts have been " ..
                "reported arising from the very ground of the tree, and crazed furbolgs attack passing " ..
                "travelers.\n\nI can only hope that the solution the Arch Druid is looking for will be " ..
                "found quickly. I will pour all the phials you brought into this vessel, for you to " ..
                "deliver to Darnassus.\n\nBring it to Fandral Staghelm, you will find him in the druid " ..
                "grove.",
            rewardChoices = {{5596, 1}, {5595, 1}},
        },
        [966] = {
            description = "A group of warlocks has taken up residence around and inside the tower. I " ..
                "would have returned to Auberdine to report to Elissa earlier, but I was afraid that I " ..
                "might miss something while I was away.\n\nDelgren suspected such a company might be " ..
                "gathering at the tower, but did not know why.\n\nA few scraps of parchment that the " ..
                "warlocks carry have found their way to my hands, but I need more to complete the puzzle. " ..
                "I warn you not to venture into the tower, however, the warlocks there are much more " ..
                "powerful!",
            rewardMoney = 1000,
        },
        [1219] = {
            description = "Sifting through the loose dirt, the severed hand of an orc is found. And " ..
                "clutched in the hand is a bone-carved tube. And in the tube is a dirt-stained " ..
                "parchment.\n\nThe parchment is written in orcish... and it looks important.",
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
        [1447] = {
            description = "Yeah, you're obviously not the smartest <class> to come into Stormwind, but " ..
                "you're about to be one of the dumbest to never leave.\n\nHave you met me friends?",
        },
        [1711] = {rewardItems = {{6973, 1}}},
        [1842] = {
            description = "I can make you a pair of brutal gauntlets, and great magic will they hold. But " ..
                "first, you must collect this magic and bring it to me.\n\nThe satyrs dwell in " ..
                "northeastern Ashenvale because of the forest's power. They feed off its purity, leeching " ..
                "and corrupting. You can tell which satyrs have drawn the most of Ashenvale's magic by " ..
                "their swollen, uncloven hooves.\n\nThese hooves hold great power. I will need them for " ..
                "your gauntlets' crafting.",
        },
        [1955] = {
            description = "Now that we have a summoner's orb, we must exorcise the demon within it. I can " ..
                "do that. That's the easy part.\n\nYou're the one who has the hard job. You're the one " ..
                "who has to kill the demon once it's out.\n\nAnd you'll have to be quick. If you take too " ..
                "long then he'll jump back in the orb and we'll have to start over!\n\nSo get yourself " ..
                "ready. Prepare your strongest spells and keep your potions handy, and go get a friend if " ..
                "you have one. Because this isn't going to be pretty.",
        },
        [2160] = {
            description = "Hey! You look like a hearty adventurer. If you're planning on braving the " ..
                "pass, do you suppose you could bring a package to the inn in Kharanos?\n\nYou were " ..
                "planning on stopping at the inn, right? If you make it through the pass, you'll " ..
                "definitely want to take a breather there.\n\nAnyways, bring this to Tannok Frosthammer, " ..
                "the innkeeper's assistant. I can't get through the pass myself, and it'll be days until " ..
                "a Mountaineer escort comes through!",
            rewardChoices = {{117, 5}, {159, 5}},
        },
        [2205] = {
            description = "The badge? Oh, it's nothing, fish - nothing you could handle anyhow. By the " ..
                "looks of you, I'd say Mathias is likely to mistake you for the cheese delivery " ..
                "<boy/girl> instead of a proper rogue. Regardless, I've been assigned a job and I've made " ..
                "a promise to deliver on that job.\n\nSpeaking of which, deliver this package to Mathias " ..
                "and he may give you a small task or two.\n\nGet cracking.",
            rewardMoney = 85,
        },
        [2281] = {
            description = "Sending you out in the field now would be suicide. Renzik doesn't need another " ..
                "dead rogue on his hands. Don't fret, though, <name> - Renzik is going to get you up to " ..
                "speed.\n\nMake your way to the Redridge Mountains and speak with an associate of SI:7 " ..
                "named Lucius. You will find him hanging around the docks of Lakeshire with the other " ..
                "shady good-for-nothings.",
        },
        [2459] = {
            description = "The emerald... It is missing! My dreamcatcher has been damaged!\n\nThere is a " ..
                "band of Gnarlpine mystics located to the north of Starbreeze. I have heard reports that " ..
                "their leader, Ferocitas the Dream Eater has been wearing a necklace that glows green in " ..
                "the night. Now seeing my dreamcatcher, I am sure that he has stolen my emerald... He " ..
                "would never realize that its power is useless to him.\n\nFind this missing jewel, " ..
                "<name>. And, while you're there, clear out some of the corrupted mystics as well.",
            rewardMoney = 450,
        },
        [2582] = {
            description = "Ah, <name>, welcome back. It seems you enjoyed the effect of the robust, " ..
                "operational imbue, derived from snickerfang. Be warned, while the immediate effect is a " ..
                "titanic burst of strength, the long term effects on your spirit and intelligence could " ..
                "be hazardous.\n\nWith that said, do you require more? If so, bring me another three " ..
                "snickerfang jowls, two blasted boar lungs, and one scorpok pincer.",
            rewardItems = {{8410, 1}},
        },
        [2585] = {
            description = "Have you ever watched them in battle, <name>? The scorpoks, I mean. Have you " ..
                "ever seen the grace and agility with which they move? The decisiveness of their " ..
                "strikes?\n\nIf only we could somehow isolate that agility and encapsulate it, we would " ..
                "be wealthy beyond our... I mean... it would be a boon for the scientific " ..
                "community.\n\nAssist me, <name>, and I shall allow you a sampling of the assay.\n\nIn " ..
                "order to create a stable sample, I will need three scorpok pincers, two vulture " ..
                "gizzards, and one blasted boar lung.",
            rewardItems = {{8412, 1}},
        },
        [2607] = {
            description = "It appears as if you've brought back more information than even I expected. " ..
                "This certainly is a strange turn of events, <name>.\n\nA cure? Hrm... Go down to the " ..
                "cellar and speak with Doc Mixilpixil - he may be able to help.",
        },
        [2681] = {
            description = "It will take more than you alone to overcome the forces of Razelikh and his " ..
                "subordinates.\n\nGather a suitable group of adventurers and free my men of their eternal " ..
                "torture! Eighteen stones you must shatter.\n\nFight hard and die with honor, <name>.",
        },
        [2764] = {
            description = "If you are ready to conclude your training with Galvan, you should journey to " ..
                "Gadgetzan.\n\nThere, you will find my finest pupil: Trenton Lighthammer. He has much to " ..
                "teach you in the ways of ornate mithril. Otherwise, remain here and learn!\n\nOh, " ..
                "Gadgetzan is in Tanaris, of course!",
        },
        [2771] = {
            description = "It seems as if master had this planned from the start. I was not taught to " ..
                "create the items which you learned to create and you were not taught the items which I " ..
                "learned to create.\n\nThe master is wise, <name>. We shall teach each other!\n\nShow me " ..
                "how to make a mithril coif and ornate mithril shoulders and I shall show you how to " ..
                "create an ornate mithril helm.",
        },
        [2821] = {
            description = "My philosophy on leatherworking is that the work must be the best quality " ..
                "possible - no compromises. Anyone who says that quality doesn't matter is trying to sell " ..
                "you ocean-front property in Dun Morogh!\n\nIn my latest pursuit of high-quality " ..
                "materials, I have run across thick yeti hides. The Yeti are native to Feralas, with many " ..
                "found in Feral Scar Vale. I want some, and I'll give you a choice of one of my leather " ..
                "goods for a stack of ten. If that sounds fair to you, then we're in business.",
            rewardChoices = {{9630, 1}, {9631, 1}},
        },
        [2846] = {
            description = "Long ago I possessed a beautiful piece of jewelry, the Tiara of the Deep. And " ..
                "not only was it pretty--it held great power for those with the knowledge to use " ..
                "it.\n\nSo when word of the tiara reached the Hydromancer Velratha, she had to have it. " ..
                "She sent agents to my home and they stole it while I was away. The thieves!\n\nI want my " ..
                "tiara back! Go to Zul'Farrak, the troll city in Tanaris, find Velratha and wrench the " ..
                "tiara from her. Return it to me and you'll earn my favor.",
            rewardItems = {{9527, 1}, {9531, 1}},
            rewardMoney = 6500,
        },
        [2935] = {
            description = "The venom from the broodguards wasn't as potent as the venom you brought " ..
                "originally. It must have come from a different spider.\n\nI want a fresh sample of that " ..
                "venom. To find out where it came from, you must consult with a troll who knows the " ..
                "Witherbark well-- Master Gadrin in Sen'jin Village. Travel to Durotar and speak with " ..
                "Gadrin. With luck, he'll know where the Witherbarks get their venom.",
        },
        [2937] = {
            description = "Take his parchment, and read it at the altar of Shadra'Alor, deep within the " ..
                "witherbark realm in the Hinterlands. This will summon Shadra the spider god.",
        },
        [2987] = {
            description = "I just arrived here in Feralas, and I've heard that the Gordunni Ogres that " ..
                "inhabit the wilds here have some interesting minerals. Who knows what they are up to, " ..
                "but they sure are protective of that stuff! They don't leave it just lying around; no, " ..
                "they bury it to protect folks like me from getting their hands on it.\n\nIf you'd be " ..
                "willing, I'll give you my shovel. Go to the Gordunni Outpost north of here and dig me up " ..
                "some Gordunni cobalt. Look for the blue glow, then start digging!",
            rewardChoices = {{9658, 1}, {9660, 1}},
        },
        [3126] = {
            description = "The wandering forest walkers that can be found meandering through the forest " ..
                "are our next target, <name>. Night elves have enlisted treants as allies to fight " ..
                "against the horde. Their movement may be slow, but their role as protectors is " ..
                "undeniable.\n\nSoon we will be able to use this power for our own benefit.\n\nFind 3 " ..
                "wandering forest walkers; kill them, and use the muisek vessel to shrink and capture " ..
                "them.",
        },
        [3524] = {
            description = "Majestic sea creatures are known to launch themselves at the Darkshore " ..
                "coastline, beached there until they die. Lately, these beasts have been washing ashore " ..
                "in ever-increasing numbers. I've been sent here by the Temple of the Moon to " ..
                "investigate, but the presence of murlocs along the water has made my research " ..
                "difficult.\n\nThere is a giant creature washed ashore just south of Auberdine that is " ..
                "ringed by the foul Greymist murlocs. Could you go there and retrieve bones from the " ..
                "creature for our study?",
            rewardMoney = 400,
        },
        [3633] = {
            description = "Expert engineering yields two distinct disciplines: gnome and goblin. Clearly, " ..
                "goblin engineering is the choice of all brilliant engineers. Learn to master the world " ..
                "through the judicious use of high explosives and fantastic gear!\n\n<name>, read this " ..
                "manual. If you want to learn about goblin engineering, then take it to Nixx " ..
                "Sprocketspring in Gadgetzan. Remember - membership is permanent and prevents joining the " ..
                "other discipline, so make sure this is what you want before finishing his task.",
        },
        [3784] = {
            description = "Excuse me <class>, but I'd like just a moment of your time if possible.\n\nThe " ..
                "Cenarion Circle in Thunder Bluff is most interested in seasoned adventurers such as " ..
                "yourself to lend them aid in a vital research project. While I do not know the " ..
                "specifics, I can inform you that none other than Hamuul Runetotem is spearheading this " ..
                "research.\n\nPlease - if you are interested, speak with him directly on the Elder Rise " ..
                "within Thunder Bluff proper.",
        },
        [3861] = {
            description = "\"Cluck... cluck... cluck... BACAW!\n\nCluck... cluck... cluck.\"\n\nThe " ..
                "chicken looks up at you and then starts to scratch its claws into the ground. You think " ..
                "it is spelling out a word, but you are not sure what it is. Could it be... " ..
                "S-A-L-D-E-A-N? Before you can ask, the chicken turns away and goes about its business.",
        },
        [3884] = {
            description = "You have uncovered a mangled journal. Parts of it remain legible, with a " ..
                "Williden Marshal claiming ownership over the contents therein. If the journal is " ..
                "accurate, then Williden may be found somewhere in the northern part of the Crater; " ..
                "according to the journal, he and his companions sought higher ground from the savage " ..
                "beasts of the Crater once their base camps were overrun.",
        },
        [4186] = {
            description = "I am going to empower you as an acting deputy of Stormwind, <name>.\n\nReturn " ..
                "to Magistrate Solomon in Lakeshire and deliver this decree.",
        },
        [4382] = {rewardItems = {{11563, 6}}},
        [4976] = {
            description = "Take the cleansed orb back to Menara in Ratchet, <name>. Give her my regards " ..
                "and be safe. I truly hope you are able to withstand the temptation and corruption that " ..
                "is sure to come as you follow your path.\n\nGood luck.",
        },
        [5066] = {
            description = "Hear ye, hear ye! All heroes are called upon to heed these words!\n\nA call to " ..
                "arms has been issued by the Kingdom of Stormwind! All able bodied individuals are " ..
                "entreated to take up arms against the dark threat of the Scourge in the northern lands " ..
                "of the Eastern Kingdoms! Rumors fly of new threats rising from the ruins of the " ..
                "Plaguelands!\n\nHeroes of the realm - seek out Commander Ashlam Valorfist who has set up " ..
                "his base camp in Chillwind Camp, north of the Alterac Mountains!",
        },
        [5082] = {
            description = "I came to Winterspring to investigate the Frostfire Hot Springs. I've noticed " ..
                "that the water seems to have...strange qualities. I haven't yet been able to discover " ..
                "the source, and to tell you the truth, I've had some difficulty lately, due to the " ..
                "Winterfall furbolg.\n\nThey seem to be drawn to the springs, just as I am. They have " ..
                "become extremely protective of the water, and won't let me come near the two larger " ..
                "springs to the north of here.\n\nI'd like to continue my studies, so won't you help me?",
            rewardMoney = 8500,
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
        [5401] = {rewardItems = {{12846, 1}}},
        [5421] = {rewardItems = {{13546, 1}}},
        [5466] = {
            description = "There is but one task remaining, <name>. Confront the lich, Ras Frostwhisper, " ..
                "in his lair.\n\nUse the power of the keepsake against the beast - be unrelenting in your " ..
                "actions! Weather the blows that the flailing beast will surely bring down upon you. Do " ..
                "not give in to the pain!\n\nWhen the ritual is complete, Ras will be mortal once more. " ..
                "It is at that point that he must be slain. Strike him down and take his human head.",
            rewardChoices = {{13982, 1}, {13986, 1}, {13984, 1}},
            rewardItems = {{14002, 1}},
        },
        [5582] = {
            description = "This is a scale shed from a plagued dragon hatchling. But unlike the other " ..
                "pocked, oozing scales on the infant beast, this rare scale is healthy and " ..
                "unmarred.\n\nBetina Bigglezink will want a sample of this to study.",
        },
        [5630] = {
            description = "Hello there, <laddy/lassy>. Good to see you travelin' far and wide to distant " ..
                "lands. No offense meant, but a lot o' your kind don't take well to these cold climates " ..
                "usually. Glad to see you're made of tougher stuff.\n\nNot too long ago one of your " ..
                "priestesses was in here lookin' for you--said somethin' about you finding a Priestess " ..
                "Alathea in the Temple of the Moon back in Darnassus. Said it was important and you " ..
                "should head back there soon.",
            rewardXP = 210,
        },
        [5727] = {
            description = "Now let us see if this insignia you found is worth the effort.\n\nThere is a " ..
                "warlock within the city who believes he has my trust. He does not know that I realize " ..
                "where his true loyalties lie. He is in fact the leader of the Burning Blade. But do not " ..
                "rush off to do battle with him; he has a purpose, and we shall use him against our " ..
                "enemies.\n\nTake this insignia to him in the Cleft of Shadow here in Orgrimmar, speak to " ..
                "him and see if he believes you are one of his own, then return to me here.",
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
        [6064] = {
            description = "Hi there, <lad/lass>! So, you'd be wanting to know how you can gain a pet of " ..
                "your own?\n\nWell, let's get started. There's nothing more important than yer equipment " ..
                "when it comes to hunting, but we can chat about my new Shrapnel Blaster some other time. " ..
                "Fer now, let's focus on something I'm sure you're quite interested in: a pet!\n\nThe " ..
                "best way to learn is for you to try out several creatures as companions and see what ya " ..
                "like. So, find a large crag boar, then use the taming rod to tame it.",
            rewardXP = 840,
        },
        [6281] = {
            description = "For a small fee, you can take a gryphon to Stormwind, so you can deliver " ..
                "Lewis' note to Osric. You won't get there faster any other way.\n\nIf that sounds " ..
                "acceptable, then just speak to me again when you're ready for the ride. I'll charge you " ..
                "a little, but trust me; it'll be worth it!",
            rewardMoney = 175,
        },
        [6364] = {
            description = "In order to fly to a town, you must have already been there and spoken with " ..
                "the wind rider master of that town. You have been to the Crossroads and spoken to their " ..
                "wind rider master Devrak, so for a small fee you can take a wind rider to him from " ..
                "here.\n\nSpeak with me again when you are ready. Once at the Crossroads, you can then " ..
                "deliver the leather goods to Jahan Hawkwing.",
            rewardMoney = 350,
        },
        [6545] = {rewardItems = {{16763, 1}}},
        [6602] = {
            description = "How would you feel about paying a visit to the General? No illusions, this " ..
                "time.\n\nCeremony? A pretty word to describe the bloodletting that amuses the Black " ..
                "Dragonflight.\n\nAll this amulet requires is the blood of General Drakkisath. Primitive " ..
                "security. There are other ways to receive the General's blood.\n\nGo to Blackrock Spire " ..
                "and kill Drakkisath. Return with his blood and I will activate the key to Onyxia's lair.",
            rewardItems = {{16309, 1}},
        },
        [7302] = {
            description = "Our air support is in shambles, <name>. The Wing Commanders were shot down " ..
                "over enemy territory. You must find out what became of them so that we can attempt a " ..
                "rescue!\n\nGuse was last seen flying over the Icewing Bunker. Jeztor's War Rider was " ..
                "spotted near the Stormpike lumber mill. Mulverick... that reckless fool was seen " ..
                "crashing near the Dun'Baldar North Bunker.\n\nThat's all the information I have. Move " ..
                "out! Search through the areas thoroughly.",
            rewardXP = 7070,
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
        [7601] = {
            description = "If I am to teach you the secrets of summoning an infernal servant, you must " ..
                "destroy Kroshius and bring me the infernal core from his burning remains. This, however, " ..
                "is not as easy as it sounds. Kroshius has all but burned out completely. You must " ..
                "reignite his corpse and raise him from the rubble. To do this, however, you must gather " ..
                "some components from other demonic entities.\n\nMy imp, Impsy, shall set you on your way.",
        },
        [7624] = {
            description = "You wish to enter my good graces? Then kill for me.\n\nMy servant, Ulathek, is " ..
                "pathetic how he grovels before me, all the while plotting with Lord Hel'nurath on " ..
                "Xoroth. Hel'nurath plans to usurp my power here, and Ulathek is his spy...\n\nProve that " ..
                "you serve me and not my rivals. Confront Ulathek in his quarters, in the Shadow Hold to " ..
                "the west. Tell him that I know his secret and watch as fear grips him. Then, bring me " ..
                "the traitor's heart!",
            rewardXP = 9550,
        },
        [7632] = {
            description = "The epidermis of the leaf glows a bright green. The surface is extremely " ..
                "rugose, exposing several veins and wrinkles.\n\nIf you had to take a guess, you would " ..
                "say this leaf came from something ancient and powerful.\n\nMaybe you should find the " ..
                "original owner of this leaf?",
        },
        [7738] = {
            description = "You have found what may very well be a perfect yeti hide. You easily note that " ..
                "it is exceptionally thick and sturdy - more so than even the ones you've seen from the " ..
                "yeti in Rage Scar.\n\nConsidering that Jangdor Swiftstrider at Camp Mojache is in the " ..
                "market for yeti hides, this particular one may be of considerable interest to him.",
            rewardMoney = 700,
        },
        [8056] = {
            description = "The augurs of our tribe are revered for their gifts of the divine sight, ya " ..
                "mon. They ain't a witch doctor; they spend their time castin' bones or readin' the " ..
                "leaves for insight - not hexin' people. As a shaman, you already know somethin' about " ..
                "the power of augury; we Zandalar prize the insight they give to the tribe.\n\nBring me " ..
                "an offerin' of the Paragons of Power from inside Zul'Gurub and prove your worth to us. " ..
                "Do this for us, and I'll give ya some bracers that our augurs prize above all others!",
            rewardItems = {{19830, 1}},
        },
        [8060] = {
            description = "Mages in our tribe are known as illusionists. They employ powerful mojo in " ..
                "their incantations, often befuddling and confusing the tribe's enemies!\n\n<Al'tabim " ..
                "laughs wickedly.>\n\nIt is quite the sight to see a powerful illusionist at work, " ..
                "bringing our enemies to their knees from their own madness!\n\nFor you to know the way " ..
                "of our illusionists, go to Zul'Gurub and bring back to me selected Paragons of Power. " ..
                "For this, I will give you arm wraps our illusionists use to weave their spells.",
            rewardItems = {{19846, 1}},
        },
        [8112] = {rewardItems = {{19612, 1}}},
        [8184] = {rewardItems = {{19782, 1}}},
        [8313] = {
            description = "While the recipe for cooking sandworm meat is legible, it contains references " ..
                "to herbs and spices you've never heard of. Calandrath might have enough knowledge of the " ..
                "plants that grow in the desert to make sense of it.",
            rewardMoney = 8500,
        },
        [8324] = {rewardMoney = 4500},
        [8333] = {rewardItems = {{20422, 1}}},
        [8508] = {rewardItems = {{20810, 1}}},
        [8578] = {
            description = "<You hear a sigh of relief escape the crate.>\n\nYou just want his scrying " ..
                "goggles? Great! That will be no problem... Just give me a minute to... Hey! Where the... " ..
                "Dagnabbit!\n\nWell, there's some bad news and some worse news. The bad news is that I " ..
                "lost the goggles. The worse news is that I lost them when I was nosing around in the " ..
                "Molten Core last month. Yep, the Molten Core... I guess that concludes our business! Bye!",
            rewardItems = {{18253, 3}},
        },
        [8592] = {
            description = "The Twin Emperors... their incessant whispers are slowly taking a toll on my " ..
                "sanity. They mock me, knowing I cannot step further into their domain to save my brother " ..
                "Arygos.\n\nIn my visions I see their monstrous faces adorned by powerful crowns. But I " ..
                "will have my revenge... I will transmute these symbols of Qiraji power to ones better " ..
                "suited to our needs.\n\nBring me the components I require, <name>. I will give you a " ..
                "headpiece of unmatched power.",
            rewardItems = {{21348, 1}},
        },
        [8992] = {
            description = "Now we have what we need, so it's time to discuss who it is that you'll be " ..
                "summoning next.\n\nKormok was ok for an ogre, right up until he turned to necromancy. " ..
                "After that, things got creepy for just about everyone in the outfit. It was no surprise " ..
                "then when he took his piece of the amulet and returned to his new home, " ..
                "Scholomance.\n\nBut even there, or perhaps especially there, he was not safe from the " ..
                "spectral assassins. They slew him right in front of his master, Ras Frostwhisper.",
        },
        [9032] = {
            description = "The medallion contained Valthalak's soul? It's no surprise it was guarded by " ..
                "such a powerful curse.\n\nLocating Bodley presents a bit of a problem. Last time I heard " ..
                "of him, he was preparing to venture back into Blackrock Spire. He was never heard of " ..
                "again.\n\nSeek him out in Blackrock Mountain, though I'm afraid to say he's probably " ..
                "dead by now. I suggest taking the goblin's device with you, friend.",
        },
        [9143] = {
            description = "The lieutenant here rushed us into battle with the trolls across the lake " ..
                "instead of scouting the situation first. We were decimated by his stupidity! You hear me " ..
                "Tomathren? You're an idiot!\n\nWill you help us, <class>? Those trolls still need to be " ..
                "dealt with. I need to stay here and nursemaid him -- I think he's lost his mind.\n\nJust " ..
                "head east to the other side of the lake into Zeb'Sora. I want revenge... bring me their " ..
                "ears so that I can fashion a nice necklace!",
        },
        [9160] = {
            description = "<class>, we are having difficulty with a group of night elves that have " ..
                "recently taken over a nearby island. They've set up a small camp at the old high elf " ..
                "ley-line nexus, An'daroth, to the northwest. There is a dirt path that leads up to it " ..
                "just past the Dead Scar.\n\nI suggest that you lend us your aid by going there, " ..
                "investigating what they are up to, and slaying as many of the conceited night elves as " ..
                "you can.",
            rewardItems = {{858, 2}},
            rewardMoney = 400,
        },
        [9167] = {
            description = "Everything we've done in the Ghostlands has been done with the goal of taking " ..
                "back what is rightfully ours. The Scourge have maintained their chokehold on the region " ..
                "for far too long.\n\nThe time has come for payback, <name>. Thanks to your help and the " ..
                "help of our new allies, the Forsaken, vengeance will soon be ours.\n\nHe who sought to " ..
                "steal the power of the Sunwell must die. Go to Deatholme, the Scourge stronghold south " ..
                "of the Dead Scar. Bring me Dar'Khan's head and your deeds will go down in history!",
            rewardChoices = {{22980, 1}, {22982, 1}, {22984, 1}, {22995, 1}},
            rewardMoney = 4000,
        },
        [9179] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order BS-428:\n\n3 " ..
                "Imperial Plate Chests.\n\nAll filled orders should be delivered to Packmaster " ..
                "Stonebruiser at Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and " ..
                "void if tampered with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9186] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order LW-736:\n\n9 " ..
                "Wicked Leather Belts.\n\nAll filled orders should be delivered to Packmaster " ..
                "Stonebruiser at Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and " ..
                "void if tampered with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9201] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order AL-1420:\n\n15 " ..
                "Greater Arcane Protection Potions.\n\nAll filled orders should be delivered to " ..
                "Packmaster Stonebruiser at Light's Hope Chapel in the Eastern Plaguelands.\n\nContract " ..
                "is null and void if tampered with or damaged.\n\n-Dispatch Commander Metz, The Argent " ..
                "Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9203] = {
            description = "The bearer of this writ is entitled to payment in the form of an insignia of " ..
                "their choice upon completion of the contracted work order.\n\nWork Order AL-90:\n\n1 " ..
                "Flask of Petrification.\n\nAll filled orders should be delivered to Packmaster " ..
                "Stonebruiser at Light's Hope Chapel in the Eastern Plaguelands.\n\nContract is null and " ..
                "void if tampered with or damaged.\n\n-Dispatch Commander Metz, The Argent Dawn",
            rewardChoices = {{22524, 1}, {22523, 1}},
        },
        [9211] = {
            description = "Ah, the Ice Guard. It is a thin sheen of protective magic that covers certain " ..
                "pieces of equipment. Those that do battle with creatures of frost and ice will gain " ..
                "increased protection from their attacks by using the Ice Guard.\n\nAs with all things " ..
                "the Wrathcaster creates, there is a price - a price that I will not lower, regardless of " ..
                "how much you whimper. Interested?",
            rewardItems = {{22636, 1}},
        },
        [9228] = {
            description = "Greetings, friend. Have you insignias of the Dawn or the Crusade that you " ..
                "would like to redeem for items of great power?\n\nThose exalted amongst the Dawn receive " ..
                "our greatest discounts! I encourage you to make a purchase.",
            rewardChoices = {{22657, 1}, {22667, 1}, {22668, 1}, {22659, 1}, {22678, 1}, {22656, 1}},
        },
        [9240] = {
            description = "Thanks to you and Omarion, may he rest in peace, I am now able to create a " ..
                "Glacial vest. All you need to do is bring me the materials and pay a small crafting fee.",
            rewardItems = {{22652, 1}},
        },
        [9245] = {
            description = "Thanks to you and Omarion (May he rest in peace), I am now able to create Icy " ..
                "Scale gauntlets. All you need to do is bring me the materials and pay a small crafting " ..
                "fee.",
            rewardItems = {{22666, 1}},
        },
        [9318] = {rewardItems = {{23123, 1}}},
        [9340] = {
            description = "We're dangerously close to becoming fenced in by Alliance forces. With the " ..
                "influx of sin'dorei pilgrims from Azeroth, we must establish a route that's safe from " ..
                "our enemies' prying eyes.\n\nI've given it some thought and have arrived at a solution. " ..
                "We're to establish a secret path through the Great Fissure.\n\nYes, even though the area " ..
                "is crawling with brutal rock flayers, they are merely beasts and can be taught to fear " ..
                "us. I want you to go and kill a good number of them. They shall learn fear.",
        },
        [9364] = {
            description = "My research has revealed a unique purpose for the prismatic shell.\n\nCarry " ..
                "the shell and cast your polymorph spell on the Spitelash in Azshara. If you wait a few " ..
                "moments, the chaotic aura of the shell will cause them to split into several smaller " ..
                "clones for a few moments. Kill these clones as quickly as possible, and the shell will " ..
                "collect their essence.\n\nWhen the shell is full, return it to me.",
            rewardXP = 9550,
        },
        [9409] = {
            description = "Now that you've gathered all that we need to replenish our healing crystals, I " ..
                "need you to deliver the vials to Zalduun, our priest. You'll find him tending to our " ..
                "wounded inside the central chamber of the ship.",
        },
        [9443] = {
            description = "I was once a pupil of Uther Lightbringer, founder of the Knights of the Silver " ..
                "Hand. I saw how he mishandled Prince Arthas's training. It led to the destruction of my " ..
                "homeland, Quel'Thalas, and I blame Uther and his incompetence for all of it! And now he " ..
                "has a tomb in his honor - how lovely.\n\nMy sources tell me that the scarlet fools are " ..
                "keeping one of his 'holy' relics atop their guard tower near the gates of " ..
                "Hearthglen.\n\nGo to the Western Plaguelands and retrieve it for me.",
            rewardMoney = 9000,
        },
        [9450] = {
            description = "The balance of the elements has been disrupted by the violent intrusion of the " ..
                "draenei to the Vale. Your crash has caused the spirits of earth to be enraged and turn " ..
                "upon the other elements who have come to quell them. You will learn that an " ..
                "understanding of the elements can only come when all are in harmony.\n\nThus, it falls " ..
                "to you to seek a balance. Behind me in the grove you will find the restless spirits of " ..
                "earth warring upon the other three elements. Help restore the balance.",
            rewardXP = 355,
        },
        [9499] = {
            description = "What are you still doing here, <name>? Didn't you hear we built a proper " ..
                "sin'dorei outpost here in Hellfire Peninsula?\n\nSurely you'd rather be among fellow " ..
                "blood elves and away from all this... smell. You'll find Falcon Watch in the southwest, " ..
                "beyond Hellfire Citadel. Report to Ranger Captain Venn'ren; he will take care of " ..
                "you.\n\nThe road ahead is dangerous and heavily patrolled by Alliance scouts. I would " ..
                "recommend travelling with companions. Blood elves, preferably.",
        },
        [9505] = {
            description = "The Prophet spoke of this day: That on this island, in this new world, our " ..
                "allies would find us.\n\n\"We will be tested. They will ask that we pay for the sins of " ..
                "our fathers...\"\n\nAt the time, I did not understand the meaning behind his words, but " ..
                "seeing this creature and her reaction to us, it is now coming into focus. The corruption " ..
                "of our people has been felt even here.\n\nVenture south. It is there that we found this " ..
                "being. Find its kin and tell them of our people.",
        },
        [9542] = {
            description = "You no longer see unrecognizable symbology in the totems. The totem of Yor " ..
                "reads to you just as easily as your native tongue.\n\nThe markings identify another " ..
                "furbolg den, due west of here. You are able to expertly decipher the language on the " ..
                "totem and know that your destination is Bristlelimb Village. Yor will guide you but if " ..
                "you get lost, you know that you are able to take the ancient elven road in the forest " ..
                "leading west to reach your destination.",
        },
        [9558] = {
            description = "We were having a problem with arakkoa bandits raiding many of our supply " ..
                "caravans, so I hired some dwarves to take care of them.\n\nThey were brothers; Gremni " ..
                "Longbeard was the oldest.\n\nI'm a little worried about them. Those crazy dwarves packed " ..
                "more ale than food or ammunition! Maybe you can go check up on them?\n\nThe arakkoa's " ..
                "hideout, the Den of Haal'esh, can be found to the far west of here - beyond the Great " ..
                "Fissure. They set up camp northwest of there, south of Dustquill Ravine.",
        },
        [9606] = {
            description = "If I remember correctly, Blood Watch's hippogryph master is Laando. If you've " ..
                "spoken to him before, then you can take one of my hippogryphs to him.\n\nThat's a good " ..
                "lesson to know: hippogryphs are always trained to fly to their capital city, but they'll " ..
                "only take you to a remote hippogryph master after you've already been there.\n\nSince " ..
                "you arrived on one of Laando's hippogryphs, you can also use that route to return to " ..
                "Blood Watch with the caregiver's supplies.",
            rewardMoney = 700,
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
        [9888] = {
            description = "I have escaped certain death, surviving a cowardly nighttime attack by " ..
                "Boulderfist ogres upon my village.\n\nBut I ask you, stranger: For what?\n\n<Jorin " ..
                "points to Garrosh.>\n\nHe has refused to give us assistance. Ogres are rampaging through " ..
                "my town and he sits here, weeping into a fire. What has become of us? What will become " ..
                "of us?\n\nI've sent a scout, Kilrath, to the village, now the Bleeding Hollow Ruins. " ..
                "Will you find him and give him your assistance? He hides on the border of Nagrand and " ..
                "Terokkar.",
        },
        [9931] = {
            description = "Now you must plant the seed of war in the fat, useless heads of the Warmaul. " ..
                "To the northwest, near the mountains, you will find the Laughing Skull " ..
                "Ruins.\n\n<Lantresor points into the crate of armaments you brought him.>\n\nDo you " ..
                "recognize those banners? They are Kil'sorrow banners. I want you to take a stack of " ..
                "Kil'sorrow banners and plant them on the corpses of Warmaul ogres. Remember, northwest " ..
                "is where you will find the ogres.",
            rewardMoney = 70000,
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
        [10101] = {
            description = "Oshu'gun - the diamond mountain - was once sacred to my people. It was there " ..
                "that the clans would gather every year to celebrate the springtime festival. It was " ..
                "there that our shaman communed with the honored ancestors. It was the center of our " ..
                "culture - until the shadows overtook us. When the clans became a horde, the spirits of " ..
                "Oshu'gun fell silent. The ancestors turned their backs on us.\n\nYet something now draws " ..
                "them from their rest. Venture to Oshu'gun and discover what could trouble the spirits so.",
        },
        [10159] = {
            description = "We've been fighting an ongoing battle to keep the pass through Thornfang Hill " ..
                "to the west clear of ravagers. It would be bad if we were to become completely cut off " ..
                "from the refuge in Zangarmarsh.\n\nWe don't want to displace the creatures, but there " ..
                "seems to be little choice as their attacks on travelers through the area have become " ..
                "more aggressive.\n\nClear some of the ravagers out of there if you can.",
            rewardMoney = 29000,
        },
        [10162] = {
            description = "Now that you've got your wings, perhaps you'd be interested in running another " ..
                "bombing mission?\n\nThis time we've isolated the Legion's main production area, behind " ..
                "the forge camps to the north. I need you to get on a wyvern and destroy the whole damned " ..
                "thing!\n\nHere are your bombs - now, talk to Wing Commander Brack when you're ready for " ..
                "takeoff.",
            rewardChoices = {{29926, 1}, {29940, 1}, {29933, 1}, {29936, 1}},
        },
        [10247] = {
            description = "On the outskirts of town to the east are the Proving Grounds. Our top " ..
                "experimentalist, Doctor Vomisa, has been toying with a combination of fel reaver, " ..
                "ethereal, and of course, goblin technologies there.\n\nThis is in no small part thanks " ..
                "to your gathering efforts Junior Technician 3rd Grade, <name>!\n\nGo to him; I know that " ..
                "he'll have a solution for saving Area 52.\n\nAnd since he's likely to use you as a test " ..
                "subject, if I were you, I'd bring some friends along just in case.",
        },
        [10251] = {
            description = "A couple of draenei paid us a visit last night. They'd somehow learned that we " ..
                "had the book in our possession and made a very generous offer to \"take it off our " ..
                "hands.\"\n\nWe didn't ask them what they wanted with the book but the young one kept " ..
                "talking about \"the master's grand design,\" whatever that means.\n\nLook, I don't ask " ..
                "questions when money is in play. They gave us a lot of gold and we gave them the " ..
                "book.\n\nHe said that they lived in Nagrand - in the old Abandoned Armory, north of " ..
                "Telaar.",
        },
        [10255] = {
            description = "I think there's something we can use in the blood as the base of an antidote. " ..
                "Don't look at me like I've lost my mind!\n\nIt's a common theme in nature. Often, the " ..
                "cure for something can be derived from the toxin itself. That's just what I aim to " ..
                "do.\n\nRidding the boars of their demonic influence would probably eliminate their " ..
                "aggression and give us insight into how to best attempt to help other species.",
            rewardChoices = {{25986, 1}, {25987, 1}, {25985, 1}},
            rewardMoney = 29000,
        },
        [10431] = {
            description = "The Sunfury briefings support the theory that Kael'thas has been receiving " ..
                "outside help in constructing and running these manaforges. Who this is remains a bit of " ..
                "a mystery, though we're likely to find out in Manaforge Ara.\n\nI've sent a group of my " ..
                "men to scout the surrounding area. Go to Tuluman's Landing, north of here, and speak to " ..
                "Kaylaan. See what he's discovered at Manaforge Ara. Find out who is assisting the " ..
                "Sunfury army and take care of them.",
        },
        [10463] = {rewardItems = {{29302, 1}}},
        [10468] = {
            description = "You've carried out the promise you made to us, <name>. And for that you've " ..
                "gained the recognition you deserve.\n\nAs you continue to become attuned with past " ..
                "events surrounding mount Hyjal, I can continue to tap into the power contained in your " ..
                "ring. It won't be long until it has reached its full potential.",
            rewardItems = {{29304, 1}},
        },
        [10494] = {
            description = "You kept your word and brought the device built by Mux. I believe a reward is " ..
                "in order if I'm to keep you interested in saving my skin. Bring me the belt and set of " ..
                "gloves that you wish to upgrade. I promise the ones I give you in return will be far " ..
                "superior.",
            rewardItems = {{22098, 1}, {22099, 1}},
        },
        [10511] = {
            description = "If I'm going to start this vacation out right, then I'm going to need more " ..
                "brew. Unfortunately, the elves know nothing of the fine art of fermentation.\n\nI " ..
                "overheard that the Bloodmaul ogres down in the ravine have plenty. I'm willing to give " ..
                "it a try.\n\nDo me a favor? Head south through the Living Grove and then down the ramp " ..
                "to the east into Bloodmaul Outpost and procure me some? I hear they have big barrels of " ..
                "it laying around and that their brewmasters carry it around to all the other ogres.",
            rewardMoney = 35000,
        },
        [10530] = {
            description = "Lieutenant Dawnrunner at Farstrider Retreat has requested an audience with all " ..
                "able hunters. It would greatly benefit you to seek her out, <name>. She is a beacon of " ..
                "wisdom for those of our calling.\n\nFarstrider Retreat lies south of Silvermoon City.",
            rewardXP = 85,
        },
        [10581] = {
            description = "VERY WELL, I AM HEREBY WARNING YOU THAT YOU WILL FIND NOTHING UP ON THE " ..
                "RIDGE.\n\nDO NOT FOLLOW THE TRAIL OF SPARE PARTS THAT LEAD TO TOSHLEY 'S STATION! YOU " ..
                "WILL NOT FIND TOSHLEY, NOR ANY OTHER GNOME THERE.",
        },
        [10720] = {
            description = "The ogres, simple as they are, would notice you dispersing this poison " ..
                "throughout their camp. Thus, I will teach you how to enlist the help of one of nature's " ..
                "smallest creatures to do this task.\n\nBy playing a simple rhythm on this drum, you can " ..
                "coax a marmot to follow your commands.\n\nThere is a den of marmots near the Bloodmaul " ..
                "camp, to the north, down in the Daggermaw Canyon past the Circle of Blood.\n\nOnce you " ..
                "have a marmot's aid, use it to disperse the poison to the Bloodmaul's kegs.",
            rewardMoney = 37000,
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
        [10790] = {
            description = "You are a long way from home, <race>. Perhaps it is time you returned to learn " ..
                "from your master, Gan'rul Bloodeye. His knowledge is known to all of our craft, even " ..
                "those of us here.\n\nGan'rul dwells in the Cleft of Shadow in Orgrimmar.",
            rewardXP = 85,
        },
        [10798] = {
            description = "This is bad news. Gorgrom the Dragon-Eater is behind the recent Bloodmaul " ..
                "plans against Sylvanaar!\n\nWhy he's manipulating them, and not just using the " ..
                "Bladespire, I don't know. But if we're to deal with a gronn, we're going to need " ..
                "help.\n\nI know a man who is wise in the ways of all sorts of exotic magics. Baron " ..
                "Sablemane is his name, and you can find him at the Circle of Blood, back down the ramp " ..
                "to the northwest, and then southwest through the canyon.\n\nAsk him to fashion us a trap " ..
                "for the gronn.",
        },
        [10884] = {
            description = "Four trials you must pass before you are deemed worthy by the naaru.\n\nWithin " ..
                "the Shattered Halls of Hellfire Citadel are three of your people. They are held there by " ..
                "the merciless one, Kargath Bladefist. He seeks to execute them as a sign of his virility " ..
                "and power. You must save these prisoners before such an atrocity can come to pass. As " ..
                "proof of deed, bring me the unused axe of the executioner. It must not have a drop of " ..
                "blood on its blade!",
        },
        [10909] = {
            description = "Colonel Jules was cursed in a battle near the Gor'gaz Outpost, a haunt for " ..
                "Shattered Hand fel orcs. My master, Barada, works feverishly to cure the poor human, but " ..
                "he needs help. The Colonel's tormented spirit seeks peace, and his path to peace is, I " ..
                "fear, a path of vengeance.\n\nTake this anchorite relic to Gor'gaz Outpost. Place it " ..
                "upon the ground near Shattered Hand orcs and defeat them. This will release their fel " ..
                "spirits -- you must slay those fel spirits for Jules' own spirit's recovery.",
            rewardMoney = 20000,
        },
        [10939] = {
            description = "Now that you have gathered all of the Storms cards together into a deck, a " ..
                "ninth card mysteriously appears with the same backing as the first eight. On this card " ..
                "is inscribed, \"Return these cards to the Darkmoon Faire and be rewarded.\" You have " ..
                "heard that this faire alternately stops at Mulgore and Goldshire every few months, so " ..
                "you will have to wait until they are here next.",
            rewardItems = {{31857, 1}},
        },
        [10969] = {
            description = "It would seem that an outside force has taken an interest in the business " ..
                "practices of the Consortium. Five Consortium dealers have gone missing in the past two " ..
                "days. We have reason to believe the Ethereum are involved. If you are interested in " ..
                "assisting, seek out Commander Ameer at the Protectorate Watch Post.\n\nYou will find the " ..
                "Protectorate Watch Post directly east of here on the next island.",
            rewardMoney = 4400,
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
        [11014] = {
            description = "<Mor'ghor crumples up the service letter and tosses it aside.>\n\nAlright " ..
                "grunt, first things first. If you're gonna join my beloved Dragonmaw army, you'll need " ..
                "to work. Everyone works up here on the ledge. Get a job and don't screw it up and I'll " ..
                "see if there might be something more interesting for you to do later.\n\nGo talk to " ..
                "Taskmaster Varkule Dragonbreath. He's standin' in the middle of town. He'll assess your " ..
                "skills and assign work as he sees fit.\n\nNow get out of my face!",
        },
        [11130] = {
            description = "Come closer, <man/sweetheart>! Let ol' Griftah look at yer shiny " ..
                "things....\n\nHmm. Yeh, yeh, not bad, but ya can do better. Much, much better.\n\n< " ..
                "Griftah leans in and whispers.>\n\nThere be priceless shinies everywhere, <name>, ya " ..
                "just gotta know where to look! It be yer lucky day; I know a fella who can help ya find " ..
                "more shinies than ya can ever carry.\n\nVisit my ol' friend, Budd, near Zul'Aman and " ..
                "show him this here. Ya be tellin' him ol' Griftah sent ya and he'll let ya in on his new " ..
                "project.",
        },
        [11506] = {
            description = "The draenei might be our enemies, but the spirits of their ancestors in " ..
                "Auchindoun are restless and have no allegiance.\n\nThe draenei's custom required them to " ..
                "pay their respects at spirit towers at various times during the day. If you can help " ..
                "secure a tower during these times, you will help the spirits return to peace in " ..
                "Auchindoun.\n\nThe Alliance will try to capture the towers in order to secure the dead's " ..
                "favor. We must ensure that our side succeeds instead.",
            rewardMoney = 37000,
            rewardXP = 10050,
        },
    },
    npcs = {
        [14697] = {
            spawns = {
                [139] = {
                    {15.2, 78.8}, {15.8, 71.4}, {16.6, 75.4}, {16.8, 77.2}, {17.2, 76.2}, {17.6, 72.2},
                    {18, 80.2}, {18.4, 78.4}, {18.8, 80}, {19.4, 75.8}, {20.4, 86.2}, {20.6, 86.8},
                    {21.4, 87.6}, {21.6, 70.8}, {21.8, 83.4}, {21.8, 83.6}, {22.2, 85.8}, {22.4, 87.2},
                    {22.8, 73.2}, {23, 69.6}, {23, 75.6}, {23.2, 72.4}, {23.4, 84.6}, {23.6, 72},
                    {23.8, 71.4}, {23.8, 73.4}, {24.4, 68.4}, {24.4, 69.2}, {24.6, 71.6}, {24.8, 68.4},
                    {24.8, 71.2}, {25.2, 69.8}, {25.8, 72.4}, {27, 73.4}, {64.6, 70.8}, {65.4, 74.8},
                    {65.6, 70.6}, {66.4, 69.4}, {66.4, 72.6}, {67.2, 60.8},
                },
            },
            zoneID = 139,
        },
        [16141] = {
            spawns = {
                [139] = {
                    {14.4, 77.4}, {14.8, 73.6}, {15.4, 77.4}, {15.4, 78.4}, {15.4, 79.8}, {15.6, 81},
                    {16, 79.4}, {16, 79.8}, {16.4, 76.2}, {16.4, 76.6}, {16.6, 75.4}, {16.6, 79.6},
                    {16.8, 76}, {16.8, 78.8}, {17.2, 73}, {17.2, 78.2}, {17.6, 76}, {17.6, 78.6},
                    {17.8, 77.6}, {18, 74}, {18.6, 75.4}, {18.6, 77.8}, {19.4, 76.2}, {19.4, 77}, {19.6, 78},
                    {19.6, 79.4}, {19.8, 79.6}, {20.2, 87}, {20.4, 86.2}, {20.8, 72.2}, {21.2, 71.2},
                    {21.2, 85.4}, {21.4, 81.8}, {21.4, 83.2}, {21.4, 86}, {21.4, 86.6}, {21.8, 82.4},
                    {21.8, 83.4}, {22, 71.4}, {22, 85.6},
                },
            },
            zoneID = 139,
        },
        [16298] = {
            spawns = {
                [139] = {
                    {14.8, 74}, {15, 79}, {15.4, 77.2}, {15.4, 80.4}, {16, 78}, {16, 79.6}, {16.2, 81},
                    {16.4, 75}, {16.6, 76.4}, {16.8, 75.4}, {16.8, 79.8}, {17, 74.2}, {17.2, 78.2},
                    {17.6, 75.2}, {18, 76}, {18, 77.6}, {18.2, 77.2}, {18.4, 79.8}, {18.6, 77.4}, {18.6, 78},
                    {18.8, 76.2}, {18.8, 80}, {20.4, 85.2}, {20.8, 87.6}, {21.2, 83.2}, {21.2, 85},
                    {21.4, 71.6}, {21.4, 80.2}, {21.4, 86.2}, {21.4, 87.4}, {21.8, 71}, {21.8, 81.4},
                    {21.8, 83}, {22, 76.6}, {22, 85.8}, {22.2, 85}, {22.4, 69.8}, {22.4, 71.6}, {22.6, 68.2},
                    {22.6, 84.2},
                },
            },
            zoneID = 139,
        },
        [16299] = {
            spawns = {
                [139] = {
                    {14.4, 75.4}, {15.2, 80}, {15.4, 72}, {15.4, 75.8}, {15.4, 79}, {15.8, 79.6}, {16.2, 78},
                    {16.4, 76.4}, {16.4, 79.2}, {16.4, 81.2}, {16.6, 76.4}, {16.8, 79.8}, {17.2, 78},
                    {17.2, 81}, {17.6, 75.4}, {17.6, 76.2}, {17.8, 77.6}, {17.8, 78.8}, {18.6, 73.4},
                    {18.6, 77.4}, {18.6, 78.6}, {19.2, 76.2}, {19.6, 77}, {19.6, 77.8}, {19.8, 86.4},
                    {20.2, 86.8}, {20.4, 84.8}, {20.8, 75.4}, {21, 79.2}, {21.2, 70.8}, {21.2, 86.6},
                    {21.4, 76.8}, {21.4, 83.4}, {21.4, 84.2}, {21.4, 86.2}, {21.6, 71.2}, {21.8, 81.8},
                    {21.8, 83.4}, {22, 73}, {22, 76.4},
                },
            },
            zoneID = 139,
        },
        [16379] = {
            spawns = {
                [139] = {
                    {16.2, 78}, {16.4, 78.8}, {16.8, 76}, {17, 78.2}, {17.2, 79.2}, {17.4, 77.2},
                    {17.6, 77.2}, {17.6, 77.8}, {21.2, 85.8}, {21.4, 84.8}, {21.8, 83.8}, {21.8, 85},
                    {22.6, 71.4}, {22.6, 85.2}, {22.6, 85.6}, {22.6, 86.8}, {23, 70.2}, {23, 72.2},
                    {23.4, 69.2}, {24, 72.6}, {24.2, 70.4}, {24.2, 72}, {24.4, 71.2}, {65.6, 71.2},
                    {66.8, 72.8}, {67.4, 71.2}, {67.4, 72}, {70, 56.4}, {70.4, 58}, {70.8, 56.2}, {71, 56.8},
                    {71.4, 58}, {71.6, 56.8}, {72.2, 56.2}, {74.8, 71.2}, {75.4, 72.2}, {76.4, 70.8},
                    {77.2, 72.4}, {77.4, 71.2},
                },
            },
            zoneID = 139,
        },
        [16380] = {
            spawns = {
                [139] = {
                    {15.2, 79.6}, {15.6, 79.6}, {16.2, 78.8}, {16.6, 77.2}, {17.2, 74.4}, {17.2, 78},
                    {17.4, 73.2}, {17.6, 79}, {18.4, 77.8}, {19.4, 76}, {21, 84.6}, {21.4, 86.4},
                    {21.6, 84.4}, {21.6, 87}, {21.8, 85.8}, {22.2, 66.4}, {22.4, 67}, {22.8, 70.2}, {23, 84},
                    {23, 85.6}, {23.2, 86.8}, {23.4, 70.8}, {23.6, 85.6}, {23.8, 71.6}, {24, 84.8},
                    {24.6, 72}, {24.8, 85.2}, {24.8, 86}, {27.6, 70.6}, {30.6, 81.4}, {65.2, 70.2},
                    {65.8, 71.4}, {66.6, 70.8}, {66.8, 69}, {67.2, 72}, {67.4, 73.6}, {67.6, 72.4},
                    {70.2, 56.4}, {70.4, 56.6}, {70.4, 59.4},
                },
            },
            zoneID = 139,
        },
        [16383] = {
            spawns = {
                [1519] = {
                    {16.2, 52}, {17, 52.2}, {17.6, 50}, {17.6, 53}, {17.8, 51}, {18.4, 49.2}, {18.6, 52.2},
                    {19.4, 50.4}, {19.6, 48.8}, {19.6, 50.2}, {20.2, 57.2}, {20.4, 51.2}, {20.6, 51},
                    {20.8, 50}, {21, 56.4}, {21, 57}, {22, 50.6}, {22.2, 55.2}, {22.4, 54.4}, {22.4, 55.6},
                    {22.4, 57.8}, {22.6, 54.4}, {22.6, 57.6}, {23, 57}, {23.2, 52}, {23.2, 54.6},
                    {23.6, 54.8}, {23.6, 55.8}, {24.4, 51.2}, {24.6, 51.8}, {26.2, 49.8}, {26.4, 50.8},
                    {27, 51.6}, {27.2, 51.4}, {27.6, 51.2}, {27.6, 51.6}, {28.6, 50.6}, {28.8, 50.4},
                    {29.2, 52.2}, {29.2, 54},
                },
            },
            zoneID = 1519,
        },
    },
    objects = {},
    items = {},
}
