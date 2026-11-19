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
        [531] = {
            description = "Light! Don't bring things like that into the Lodge... it's unsanitary, " ..
                "unspeakable, un... un... unsanitary!\n\nJust get it out of here, will you? No one wants " ..
                "to see your bloody little trophy, really!",
            rewardChoices = {{3574, 1}, {3573, 1}},
        },
        [579] = {rewardChoices = {{2154, 1}, {3899, 1}}},
        [718] = {
            description = "In our hurry to leave the Uldaman excavation site, we were forced to abandon " ..
                "many wagons and crates of supplies along the way. The local ogres from Camp Kosh have " ..
                "been on our abandoned equipment like vultures on a rotting corpse. Don't smell much " ..
                "better, either. Than the corpses, I mean.\n\nAnyways, they took the cart that was " ..
                "carrying all our weapons and such... so--well, this is a bit embarrassing--we haven't " ..
                "been able to get any food.\n\nWe're in a bit of a pickle here, suppose you could help us " ..
                "out?",
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
        [905] = {
            description = "Now, <name>, the hunt deepens. Now you must defeat your prey, and then find " ..
                "your way to its lair.\n\nHunt the sunscale raptors to the south. Slay them and remove " ..
                "the feathers they wear. Place the feathers on the scytheclaw nests southwest of the " ..
                "Stagnant Oasis. Show their brethren you do not fear them!",
            rewardMoney = 900,
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
        [1711] = {rewardItems = {{6973, 1}}},
        [1842] = {
            description = "I can make you a pair of brutal gauntlets, and great magic will they hold. But " ..
                "first, you must collect this magic and bring it to me.\n\nThe satyrs dwell in " ..
                "northeastern Ashenvale because of the forest's power. They feed off its purity, leeching " ..
                "and corrupting. You can tell which satyrs have drawn the most of Ashenvale's magic by " ..
                "their swollen, uncloven hooves.\n\nThese hooves hold great power. I will need them for " ..
                "your gauntlets' crafting.",
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
        [2281] = {
            description = "Sending you out in the field now would be suicide. Renzik doesn't need another " ..
                "dead rogue on his hands. Don't fret, though, <name> - Renzik is going to get you up to " ..
                "speed.\n\nMake your way to the Redridge Mountains and speak with an associate of SI:7 " ..
                "named Lucius. You will find him hanging around the docks of Lakeshire with the other " ..
                "shady good-for-nothings.",
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
        [5727] = {
            description = "Now let us see if this insignia you found is worth the effort.\n\nThere is a " ..
                "warlock within the city who believes he has my trust. He does not know that I realize " ..
                "where his true loyalties lie. He is in fact the leader of the Burning Blade. But do not " ..
                "rush off to do battle with him; he has a purpose, and we shall use him against our " ..
                "enemies.\n\nTake this insignia to him in the Cleft of Shadow here in Orgrimmar, speak to " ..
                "him and see if he believes you are one of his own, then return to me here.",
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
        [6545] = {rewardItems = {{16763, 1}}},
        [7302] = {
            description = "Our air support is in shambles, <name>. The Wing Commanders were shot down " ..
                "over enemy territory. You must find out what became of them so that we can attempt a " ..
                "rescue!\n\nGuse was last seen flying over the Icewing Bunker. Jeztor's War Rider was " ..
                "spotted near the Stormpike lumber mill. Mulverick... that reckless fool was seen " ..
                "crashing near the Dun'Baldar North Bunker.\n\nThat's all the information I have. Move " ..
                "out! Search through the areas thoroughly.",
            rewardXP = 7070,
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
        [8324] = {rewardMoney = 4500},
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
        [10162] = {
            description = "Now that you've got your wings, perhaps you'd be interested in running another " ..
                "bombing mission?\n\nThis time we've isolated the Legion's main production area, behind " ..
                "the forge camps to the north. I need you to get on a wyvern and destroy the whole damned " ..
                "thing!\n\nHere are your bombs - now, talk to Wing Commander Brack when you're ready for " ..
                "takeoff.",
            rewardChoices = {{29926, 1}, {29940, 1}, {29933, 1}, {29936, 1}},
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
