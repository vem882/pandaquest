-- Generated from https://www.wowhead.com/mop-classic/ as the PandaQuest portal read it - DO NOT EDIT BY HAND.
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
        [2] = {rewardMoney = 1500},
        [23] = {rewardMoney = 1700},
        [24] = {rewardMoney = 1700},
        [25] = {rewardMoney = 1800},
        [47] = {rewardMoney = 175},
        [52] = {rewardMoney = 250},
        [60] = {rewardMoney = 175},
        [62] = {rewardMoney = 175},
        [76] = {rewardMoney = 350},
        [123] = {rewardMoney = 350},
        [182] = {rewardMoney = 75},
        [188] = {rewardMoney = 7000},
        [193] = {rewardMoney = 7000},
        [197] = {rewardMoney = 7000},
        [208] = {rewardMoney = 7500},
        [216] = {rewardMoney = 1500},
        [218] = {rewardMoney = 200},
        [236] = {rewardMoney = 74000},
        [309] = {rewardMoney = 700},
        [313] = {rewardMoney = 175},
        [333] = {rewardMoney = 17},
        [353] = {rewardMoney = 700},
        [384] = {rewardMoney = 125},
        [432] = {rewardMoney = 300},
        [433] = {rewardMoney = 350},
        [476] = {rewardMoney = 125},
        [483] = {rewardMoney = 225},
        [486] = {rewardMoney = 600},
        [487] = {rewardMoney = 300},
        [488] = {rewardMoney = 100},
        [489] = {rewardMoney = 125},
        [543] = {rewardMoney = 15000},
        [583] = {rewardMoney = 175},
        [743] = {rewardMoney = 225},
        [744] = {rewardMoney = 350},
        [761] = {rewardMoney = 250},
        [833] = {rewardMoney = 250},
        [834] = {rewardMoney = 300},
        [844] = {rewardMoney = 500},
        [845] = {rewardMoney = 600},
        [848] = {rewardMoney = 1400},
        [850] = {rewardMoney = 600},
        [851] = {rewardMoney = 800},
        [852] = {rewardMoney = 1100},
        [863] = {rewardMoney = 2000},
        [866] = {rewardMoney = 800},
        [867] = {rewardMoney = 900},
        [875] = {rewardMoney = 800},
        [880] = {rewardMoney = 600},
        [887] = {rewardMoney = 1600},
        [895] = {rewardMoney = 800},
        [903] = {rewardMoney = 600},
        [905] = {rewardMoney = 600},
        [918] = {rewardMoney = 300},
        [919] = {rewardMoney = 600},
        [922] = {rewardMoney = 200},
        [923] = {rewardMoney = 600},
        [930] = {rewardMoney = 300},
        [931] = {rewardMoney = 300},
        [938] = {rewardMoney = 350},
        [997] = {rewardMoney = 150},
        [1222] = {rewardMoney = 4000},
        [1270] = {rewardMoney = 4000},
        [1393] = {rewardMoney = 8500},
        [1581] = {
            description = "Our herb and alchemy shop is booming, but my husband spends so much time " ..
                "mixing potions that we never have time for each other.\n\nCan you help us?\n\nIf you can " ..
                "bring me a supply of pre-made elixirs, then I would be happy to trade with you. I have " ..
                "some rare herbs that you might find useful.",
            rewardItems = {{2449, 1}, {785, 1}},
            rewardMoney = 225,
        },
        [2159] = {rewardMoney = 25},
        [2278] = {rewardMoney = 20000},
        [2280] = {rewardMoney = 20000},
        [2438] = {rewardMoney = 100},
        [2459] = {rewardMoney = 250},
        [2499] = {rewardMoney = 350},
        [2518] = {rewardMoney = 700},
        [2561] = {rewardMoney = 350},
        [3088] = {
            description = "Ah, while you were gone a parchment came for you, <name>.\n\nRead it when you " ..
                "have time. If I'm not mistaken, it came from the rogue trainer Rwag. He would have words " ..
                "with you when you're ready.",
        },
        [3096] = {
            description = "Ah, while you were off dealing with the mindless Scourge, this scroll arrived " ..
                "for you. I would think it's some matter of importance as it seems it bears the seal of " ..
                "the rogue trainer David Trias. I would take some time to read it before heading out " ..
                "again.",
        },
        [3102] = {
            description = "I was asked to bring this to your attention as soon as you returned from " ..
                "dealing with the Blackrock spies, <name>. It appears to be a letter sealed with the " ..
                "insignia of Jorik, one of our local trainers. I wouldn't hesitate to read it before you " ..
                "go about any other business here in the Abbey.",
        },
        [3106] = {rewardMoney = 25},
        [3107] = {rewardMoney = 25},
        [3108] = {rewardMoney = 25},
        [3109] = {rewardMoney = 25},
        [3110] = {rewardMoney = 25},
        [3116] = {rewardMoney = 25},
        [3117] = {rewardMoney = 25},
        [3118] = {
            description = "This sigil was given to me by a messenger from our rogue trainer, Frahun. It " ..
                "seems Frahun would have words with you when you have a moment. Read it and bring it to " ..
                "him afterwards.",
            rewardMoney = 25,
        },
        [3119] = {rewardMoney = 25},
        [3120] = {rewardMoney = 25},
        [3361] = {rewardMoney = 50},
        [4021] = {rewardMoney = 2500},
        [4512] = {rewardMoney = 7500},
        [4513] = {rewardMoney = 4000},
        [4983] = {rewardMoney = 18000},
        [5041] = {rewardMoney = 500},
        [5381] = {rewardMoney = 4500},
        [5421] = {rewardMoney = 3500},
        [5545] = {rewardMoney = 350},
        [5581] = {rewardMoney = 3500},
        [5713] = {rewardMoney = 1400},
        [5892] = {rewardMoney = 57000},
        [5893] = {rewardMoney = 57000},
        [6132] = {rewardMoney = 3500},
        [6134] = {rewardMoney = 4500},
        [6281] = {rewardMoney = 175},
        [6285] = {rewardMoney = 350},
        [6323] = {rewardMoney = 85},
        [6324] = {rewardMoney = 175},
        [6343] = {rewardMoney = 125},
        [6362] = {rewardMoney = 85},
        [6364] = {rewardMoney = 175},
        [6384] = {rewardMoney = 85},
        [6386] = {rewardMoney = 175},
        [6391] = {rewardMoney = 85},
        [6392] = {rewardMoney = 175},
        [6441] = {rewardMoney = 1400},
        [6462] = {rewardMoney = 1500},
        [6482] = {rewardMoney = 1700},
        [6503] = {rewardMoney = 1300},
        [6544] = {rewardMoney = 1700},
        [6621] = {rewardMoney = 1800},
        [6662] = {rewardMoney = 500},
        [6982] = {rewardMoney = 114000},
        [6985] = {rewardMoney = 114000},
        [7081] = {rewardMoney = 114000},
        [7082] = {rewardMoney = 114000},
        [7101] = {rewardMoney = 114000},
        [7102] = {rewardMoney = 114000},
        [7122] = {rewardMoney = 114000},
        [7124] = {rewardMoney = 228000},
        [7141] = {rewardMoney = 342000},
        [7142] = {rewardMoney = 342000},
        [7496] = {
            description = "Seek out Major Mattingly in the Valley of Heroes, <name>. He will be expecting " ..
                "you...",
            rewardChoices = {{18406, 1}, {18403, 1}, {18404, 1}},
        },
        [8105] = {rewardMoney = 16500},
        [8114] = {rewardMoney = 27000},
        [8115] = {rewardMoney = 27000},
        [8120] = {rewardMoney = 16500},
        [8121] = {rewardMoney = 27000},
        [8122] = {rewardMoney = 27000},
        [8166] = {rewardMoney = 13000},
        [8167] = {rewardMoney = 7500},
        [8168] = {rewardMoney = 3500},
        [8169] = {rewardMoney = 13000},
        [8170] = {rewardMoney = 7500},
        [8171] = {rewardMoney = 3500},
        [8193] = {rewardMoney = 228000},
        [8194] = {rewardMoney = 1400},
        [8221] = {rewardMoney = 28500},
        [8224] = {rewardMoney = 28500},
        [8225] = {rewardMoney = 28500},
        [8249] = {rewardItems = {{25878, 1}}},
        [8277] = {rewardMoney = 8500},
        [8278] = {rewardMoney = 6500},
        [8279] = {rewardMoney = 8500},
        [8280] = {rewardMoney = 8500},
        [8281] = {rewardMoney = 17000},
        [8283] = {rewardMoney = 17000},
        [8284] = {rewardMoney = 8500},
        [8287] = {rewardMoney = 17000},
        [8306] = {rewardMoney = 17000},
        [8309] = {rewardMoney = 8500},
        [8310] = {rewardMoney = 17000},
        [8313] = {rewardMoney = 8500},
        [8317] = {rewardMoney = 17000},
        [8318] = {rewardMoney = 17000},
        [8320] = {rewardMoney = 8500},
        [8321] = {rewardMoney = 17000},
        [8323] = {rewardMoney = 8500},
        [8324] = {rewardMoney = 4000},
        [8325] = {rewardMoney = 30},
        [8326] = {rewardMoney = 50},
        [8330] = {rewardMoney = 75},
        [8334] = {rewardMoney = 75},
        [8335] = {rewardMoney = 200},
        [8338] = {rewardMoney = 150},
        [8345] = {rewardMoney = 150},
        [8463] = {rewardMoney = 100},
        [8468] = {rewardMoney = 250},
        [8470] = {rewardMoney = 8500},
        [8472] = {rewardMoney = 100},
        [8473] = {rewardMoney = 300},
        [8474] = {rewardMoney = 350},
        [8476] = {rewardMoney = 350},
        [8477] = {rewardMoney = 350},
        [8480] = {rewardMoney = 175},
        [8482] = {rewardMoney = 250},
        [8487] = {rewardMoney = 300},
        [8488] = {rewardMoney = 300},
        [8490] = {rewardMoney = 350},
        [8491] = {rewardMoney = 175},
        [8637] = {
            description = "Qiraji magic is strong and ancient. The most powerful qiraji wield items of " ..
                "such might, they'd give pause even to a dragon.\n\nBring me the qiraji bindings of " ..
                "command and other minor components by and I'll create a set of powerful boots for " ..
                "you.\n\nYou will find them useful in the fight against the enemy.",
            rewardItems = {{21359, 1}},
        },
        [8638] = {
            description = "The unmentionable Old God slowly awakens from his slumber beneath Ahn'Qiraj. " ..
                "The terrible fate that awaits Azeroth could come in days or years; time has no meaning " ..
                "for beings of his power.\n\nWhen the stars are favorable, he will lash out against all " ..
                "living beings with terrible wrath. You must find him before then and find a way to bring " ..
                "his existence to an end.\n\nDo this and bring me a piece of his husk. I shall grant you " ..
                "armor no mortal has ever worn... armor fit for one who has slain a god!",
            rewardItems = {{21364, 1}},
        },
        [8639] = {
            description = "The Twin Emperors... their incessant whispers are slowly taking a toll on my " ..
                "sanity. They mock me, knowing I cannot step further into their domain to save my brother " ..
                "Arygos.\n\nIn my visions I see their monstrous faces adorned by powerful crowns. But I " ..
                "will have my revenge... I will transmute these symbols of Qiraji power to ones better " ..
                "suited to our needs.\n\nBring me the components I require, <name>. I will give you a " ..
                "headpiece of unmatched power.",
            rewardItems = {{21360, 1}},
        },
        [8640] = {
            description = "You seek to prove your worth to my kind, mortal? Very well, perhaps we can be " ..
                "of mutual assistance.\n\nThe ancient sandworm, Ouro, is a being of legendary power. He " ..
                "is rumored to have been created by the Old God himself as a mockery of life.\n\nHis skin " ..
                "is unnatural... thick, nearly impregnable, yet it's flexible and allows him to move with " ..
                "the speed and grace of a much smaller creature.\n\nBring me a sample of his skin along " ..
                "with other minor components and I shall craft you leggings of great power.",
            rewardItems = {{21362, 1}},
        },
        [8701] = {
            description = "The rings worn by the Qiraji lieutenants are rumored to grant them formidable " ..
                "abilities. The corrupted gems that adorn them could, in theory, be swapped out with more " ..
                "pure materials to create uncorrupted versions of the rings.\n\nThe gems that adorn " ..
                "Qiraji idols would work quite well, as their quality is superior.\n\nBring me the ring " ..
                "and idols and I'll create a powerful ring for you, <class>.",
            rewardItems = {{21405, 1}},
        },
        [8709] = {
            description = "The Qiraji and their servants wield items made with the rarest and finest " ..
                "materials: bones from gargantuan ancient creatures, gems from the depths of the earth, " ..
                "metals pure and strong.\n\nJust the sight of Qiraji artifacts fills me with an urge to " ..
                "practice my craft with their shattered and smelted pieces. Prove your allegiance to the " ..
                "Circle, <name>, and I will make you a powerful weapon from the finest Qiraji materials.",
            rewardItems = {{21404, 1}},
        },
        [8791] = {
            description = "A terrible menace has been laid to rest. The cruel Ossirian has been " ..
                "vanquished.\n\nThe denizens of Kalimdor would be relieved to know of this victory. Take " ..
                "Ossirian's head and present it to Commander Mar'alith of Cenarion Hold.",
            rewardChoices = {{21504, 1}, {21507, 1}, {21505, 1}, {21506, 1}},
        },
        [8885] = {rewardMoney = 600},
        [8886] = {rewardMoney = 225},
        [8887] = {rewardMoney = 225},
        [8891] = {rewardMoney = 350},
        [8892] = {rewardMoney = 175},
        [8894] = {rewardMoney = 350},
        [8895] = {rewardMoney = 35},
        [9062] = {rewardMoney = 250},
        [9064] = {rewardMoney = 125},
        [9066] = {rewardMoney = 125},
        [9067] = {rewardMoney = 900},
        [9076] = {rewardMoney = 225},
        [9119] = {rewardMoney = 100},
        [9133] = {rewardMoney = 85},
        [9135] = {rewardMoney = 175},
        [9138] = {rewardMoney = 350},
        [9139] = {rewardMoney = 400},
        [9140] = {rewardMoney = 1300},
        [9146] = {rewardMoney = 500},
        [9148] = {rewardMoney = 175},
        [9149] = {rewardMoney = 600},
        [9150] = {rewardMoney = 500},
        [9151] = {rewardMoney = 600},
        [9152] = {rewardMoney = 400},
        [9155] = {rewardMoney = 600},
        [9156] = {rewardMoney = 4000},
        [9157] = {rewardMoney = 500},
        [9158] = {rewardMoney = 600},
        [9159] = {rewardMoney = 700},
        [9160] = {rewardMoney = 400},
        [9162] = {rewardMoney = 800},
        [9163] = {rewardMoney = 600},
        [9164] = {rewardMoney = 2500},
        [9167] = {rewardMoney = 4000},
        [9169] = {rewardMoney = 1600},
        [9170] = {rewardMoney = 2500},
        [9172] = {rewardMoney = 800},
        [9173] = {rewardMoney = 700},
        [9174] = {rewardMoney = 1100},
        [9175] = {rewardMoney = 1400},
        [9176] = {rewardMoney = 900},
        [9192] = {rewardMoney = 600},
        [9193] = {rewardMoney = 900},
        [9199] = {rewardMoney = 900},
        [9207] = {rewardMoney = 600},
        [9212] = {rewardMoney = 900},
        [9214] = {rewardMoney = 1000},
        [9215] = {rewardMoney = 2500},
        [9220] = {rewardMoney = 2500},
        [9252] = {rewardMoney = 300},
        [9253] = {rewardMoney = 85},
        [9254] = {rewardMoney = 70},
        [9255] = {rewardMoney = 70},
        [9256] = {rewardMoney = 85},
        [9258] = {rewardMoney = 85},
        [9274] = {rewardMoney = 500},
        [9275] = {rewardMoney = 1100},
        [9276] = {rewardMoney = 1000},
        [9277] = {rewardMoney = 1100},
        [9280] = {rewardMoney = 15},
        [9281] = {rewardMoney = 2000},
        [9283] = {rewardMoney = 65},
        [9293] = {rewardMoney = 35},
        [9303] = {rewardMoney = 150},
        [9311] = {rewardMoney = 300},
        [9315] = {rewardMoney = 400},
        [9351] = {rewardMoney = 20000},
        [9352] = {rewardMoney = 125},
        [9355] = {rewardMoney = 20000},
        [9356] = {rewardMoney = 20000},
        [9360] = {rewardMoney = 400},
        [9361] = {rewardMoney = 20000},
        [9363] = {rewardMoney = 200},
        [9366] = {rewardMoney = 27000},
        [9369] = {rewardMoney = 15},
        [9370] = {rewardMoney = 27000},
        [9372] = {rewardMoney = 29000},
        [9373] = {rewardMoney = 20000},
        [9374] = {rewardMoney = 27000},
        [9375] = {rewardMoney = 29000},
        [9376] = {rewardMoney = 29000},
        [9381] = {rewardMoney = 29000},
        [9383] = {rewardMoney = 29000},
        [9385] = {rewardMoney = 29000},
        [9387] = {rewardMoney = 29000},
        [9391] = {rewardMoney = 27000},
        [9392] = {
            description = "As you advance within your class, you will want to take advantage of the " ..
                "training that your class trainer can provide you. For young rogues here on Sunstrider " ..
                "Isle, your trainer is Pathstalker Avokor. Speak with Avokor and see what training he has " ..
                "available for you. The things he will teach do have a cost, so bring some coin with " ..
                "you.\n\nAvokor - as with all the trainers on Sunstrider Isle - is inside the Sunspire on " ..
                "the lower level.",
        },
        [9396] = {rewardMoney = 27000},
        [9397] = {rewardMoney = 27000},
        [9398] = {rewardMoney = 27000},
        [9399] = {rewardMoney = 29000},
        [9401] = {rewardMoney = 27000},
        [9417] = {rewardMoney = 58000},
        [9420] = {rewardMoney = 27000},
        [9436] = {rewardMoney = 2000},
        [9437] = {rewardMoney = 4000},
        [9454] = {rewardMoney = 100},
        [9456] = {rewardMoney = 225},
        [9457] = {rewardMoney = 4000},
        [9466] = {rewardMoney = 58000},
        [9472] = {rewardMoney = 54000},
        [9490] = {rewardMoney = 58000},
        [9515] = {rewardMoney = 1000},
        [9523] = {rewardMoney = 225},
        [9531] = {rewardMoney = 900},
        [9548] = {rewardMoney = 900},
        [9549] = {rewardMoney = 900},
        [9562] = {rewardMoney = 350},
        [9567] = {rewardMoney = 600},
        [9569] = {rewardMoney = 1000},
        [9574] = {rewardMoney = 600},
        [9576] = {rewardMoney = 500},
        [9579] = {rewardMoney = 1000},
        [9580] = {rewardMoney = 800},
        [9581] = {rewardMoney = 400},
        [9583] = {rewardMoney = 44000},
        [9584] = {rewardMoney = 600},
        [9585] = {rewardMoney = 1000},
        [9594] = {rewardMoney = 600},
        [9606] = {rewardMoney = 350},
        [9612] = {rewardMoney = 450},
        [9624] = {rewardMoney = 500},
        [9625] = {rewardMoney = 100},
        [9628] = {rewardMoney = 600},
        [9629] = {rewardMoney = 600},
        [9634] = {rewardMoney = 400},
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
        [9643] = {rewardMoney = 700},
        [9644] = {
            description = "You fulfilled your end of the deal. I will now bind your essence to that of " ..
                "the dead blue dragon.\n\nThere is an urn in the Master's Terrace, should you touch that " ..
                "urn, you'll now release its energy and bring life back to the charred remains of " ..
                "Arcanagos. Defeat the creature and retrieve its essence immediately! You will need to " ..
                "take it to Alturus.\n\nShould you fail, the stars predict you will have let a great " ..
                "terror loose upon the skies.\n\nA terror known as Nightbane!",
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
        [9646] = {rewardMoney = 1800},
        [9647] = {rewardMoney = 800},
        [9648] = {rewardMoney = 1300},
        [9649] = {rewardMoney = 3000},
        [9666] = {rewardMoney = 600},
        [9669] = {rewardMoney = 3000},
        [9701] = {rewardMoney = 29000},
        [9702] = {rewardMoney = 31000},
        [9705] = {rewardMoney = 50},
        [9708] = {rewardMoney = 29000},
        [9709] = {rewardMoney = 62000},
        [9716] = {rewardMoney = 29000},
        [9720] = {rewardMoney = 31000},
        [9724] = {rewardMoney = 16000},
        [9728] = {rewardMoney = 31000},
        [9730] = {rewardMoney = 62000},
        [9731] = {rewardMoney = 29000},
        [9733] = {rewardMoney = 16000},
        [9747] = {rewardMoney = 27000},
        [9752] = {rewardMoney = 29000},
        [9759] = {rewardMoney = 3500},
        [9769] = {rewardMoney = 27000},
        [9770] = {rewardMoney = 27000},
        [9772] = {rewardMoney = 27000},
        [9773] = {rewardMoney = 20000},
        [9774] = {rewardMoney = 27000},
        [9777] = {rewardMoney = 27000},
        [9780] = {rewardMoney = 27000},
        [9781] = {rewardMoney = 27000},
        [9782] = {rewardMoney = 27000},
        [9783] = {rewardMoney = 27000},
        [9786] = {rewardMoney = 27000},
        [9787] = {rewardMoney = 27000},
        [9788] = {rewardMoney = 27000},
        [9789] = {rewardMoney = 35000},
        [9790] = {rewardMoney = 27000},
        [9791] = {rewardMoney = 27000},
        [9798] = {rewardMoney = 100},
        [9799] = {rewardMoney = 50},
        [9801] = {rewardMoney = 27000},
        [9803] = {rewardMoney = 27000},
        [9810] = {rewardMoney = 70000},
        [9814] = {rewardMoney = 31000},
        [9816] = {rewardMoney = 31000},
        [9817] = {rewardMoney = 58000},
        [9820] = {rewardMoney = 31000},
        [9822] = {rewardMoney = 31000},
        [9823] = {rewardMoney = 62000},
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
        [9827] = {rewardMoney = 27000},
        [9828] = {rewardMoney = 27000},
        [9830] = {rewardMoney = 31000},
        [9833] = {rewardMoney = 31000},
        [9834] = {rewardMoney = 31000},
        [9835] = {rewardMoney = 31000},
        [9839] = {rewardMoney = 31000},
        [9840] = {
            description = "Now that we've found a way back into Medivh's Tower - or rather you have - the " ..
                "first thing we need to do is try to get a sense of what the situation inside is.\n\nOne " ..
                "of our agents who had managed to infiltrate Karazhan kept an encoded log of her " ..
                "observations. Unfortunately her death was confirmed shortly before Karazhan was shut " ..
                "down. Koren, Karazhan 's blacksmith, was under our pay. Though not a member of the " ..
                "Violet Eye, he should be able to help us find Keanna's log. Look for him inside.",
        },
        [9841] = {rewardMoney = 31000},
        [9842] = {rewardMoney = 31000},
        [9843] = {
            description = "Who did you say you were looking for again? Keanna?\n\nI once met someone with " ..
                "that name. She was staying up at the guest chambers. I was supposed to keep that a " ..
                "secret now, wasn't I?\n\nDid you say you were with the Violet Eye? No, I've never heard " ..
                "of them.\n\nI need to return to my work now, if you don't mind.\n\n< Koren seems to have " ..
                "forgotten about you already.>",
        },
        [9844] = {rewardMoney = 44000},
        [9845] = {rewardMoney = 31000},
        [9846] = {rewardMoney = 27000},
        [9847] = {rewardMoney = 31000},
        [9848] = {rewardMoney = 31000},
        [9850] = {rewardMoney = 37000},
        [9851] = {rewardMoney = 74000},
        [9852] = {
            description = "The queen of all that dwell in Nagrand is known as Tusker. She's a giant elekk " ..
                "the likes of which you won't see anywhere else!\n\nYou're right to be fearful of that " ..
                "name. Bach'lor, Gutripper, and Banthar are nothing when compared to her. It is said that " ..
                "she can be found on a huge bluff far to the southwest overlooking Oshu'gun. Bring me her " ..
                "massive heart if you dare.\n\nDo you want to leave a letter with me so that I can have " ..
                "it delivered to your next of kin in the likely event that you don't return?",
            rewardChoices = {{25639, 1}, {25640, 1}},
            rewardMoney = 117000,
        },
        [9854] = {rewardMoney = 33000},
        [9855] = {rewardMoney = 37000},
        [9856] = {rewardMoney = 74000},
        [9857] = {rewardMoney = 33000},
        [9858] = {rewardMoney = 35000},
        [9859] = {
            description = "<Wracking cough.>\n\nDon't worry about...<cough>... me. I'll be fine. It's " ..
                "just a...<cough>... scratch.\n\nJust the same, I think you'll... <cough>... have to fill " ..
                "in for me one more... <cough>... time.\n\nYou must seek out the great Bach'lor, king " ..
                "of...<cough>... the stags.\n\nBring me one of his hooves...<cough>, <cough>... as " ..
                "confirmation.\n\nLook for him...<cough>... leading his herd in the far west of Nagrand.",
            rewardChoices = {{25543, 1}, {25545, 1}, {25636, 1}},
            rewardMoney = 70000,
        },
        [9860] = {rewardMoney = 132000},
        [9869] = {rewardMoney = 35000},
        [9870] = {rewardMoney = 35000},
        [9882] = {rewardMoney = 35000},
        [9892] = {rewardMoney = 3800},
        [9893] = {rewardMoney = 37000},
        [9894] = {rewardMoney = 27000},
        [9895] = {rewardMoney = 27000},
        [9896] = {rewardMoney = 27000},
        [9897] = {rewardMoney = 33000},
        [9898] = {rewardMoney = 27000},
        [9899] = {rewardMoney = 27000},
        [9900] = {rewardMoney = 37000},
        [9901] = {rewardMoney = 27000},
        [9902] = {rewardMoney = 31000},
        [9903] = {rewardMoney = 31000},
        [9904] = {rewardMoney = 31000},
        [9905] = {rewardMoney = 31000},
        [9911] = {rewardMoney = 31000},
        [9914] = {rewardMoney = 35000},
        [9923] = {rewardMoney = 99000},
        [9925] = {rewardMoney = 35000},
        [9927] = {rewardMoney = 35000},
        [9928] = {rewardMoney = 35000},
        [9931] = {rewardMoney = 70000},
        [9932] = {rewardMoney = 70000},
        [9933] = {rewardMoney = 105000},
        [9934] = {rewardMoney = 105000},
        [9935] = {rewardMoney = 105000},
        [9936] = {rewardMoney = 105000},
        [9937] = {rewardMoney = 111000},
        [9938] = {rewardMoney = 111000},
        [9939] = {rewardMoney = 70000},
        [9940] = {rewardMoney = 70000},
        [9945] = {rewardMoney = 37000},
        [9946] = {rewardMoney = 74000},
        [9948] = {rewardMoney = 37000},
        [9955] = {rewardMoney = 74000},
        [9956] = {rewardMoney = 37000},
        [9962] = {rewardMoney = 111000},
        [9967] = {rewardMoney = 111000},
        [9968] = {rewardMoney = 29000},
        [9970] = {rewardMoney = 111000},
        [9971] = {rewardMoney = 29000},
        [9972] = {rewardMoney = 111000},
        [9973] = {rewardMoney = 111000},
        [9977] = {rewardMoney = 117000},
        [9986] = {rewardMoney = 31000},
        [9987] = {rewardMoney = 31000},
        [9990] = {rewardMoney = 31000},
        [9992] = {rewardMoney = 29000},
        [9993] = {rewardMoney = 29000},
        [9994] = {rewardMoney = 16000},
        [9995] = {rewardMoney = 16000},
        [9996] = {rewardMoney = 31000},
        [9997] = {rewardMoney = 31000},
        [9998] = {rewardMoney = 29000},
        [10000] = {rewardMoney = 29000},
        [10002] = {rewardMoney = 31000},
        [10003] = {rewardMoney = 31000},
        [10005] = {rewardMoney = 87000},
        [10006] = {rewardMoney = 87000},
        [10007] = {rewardMoney = 31000},
        [10008] = {rewardMoney = 31000},
        [10009] = {rewardMoney = 39000},
        [10011] = {rewardMoney = 117000},
        [10012] = {rewardMoney = 31000},
        [10013] = {rewardMoney = 31000},
        [10016] = {rewardMoney = 31000},
        [10018] = {rewardMoney = 31000},
        [10020] = {rewardMoney = 62000},
        [10022] = {rewardMoney = 31000},
        [10023] = {rewardMoney = 31000},
        [10026] = {rewardMoney = 31000},
        [10027] = {rewardMoney = 31000},
        [10028] = {rewardMoney = 29000},
        [10030] = {rewardMoney = 33000},
        [10031] = {rewardMoney = 33000},
        [10033] = {rewardMoney = 33000},
        [10034] = {rewardMoney = 33000},
        [10035] = {rewardMoney = 66000},
        [10036] = {rewardMoney = 66000},
        [10040] = {rewardMoney = 33000},
        [10041] = {rewardMoney = 33000},
        [10042] = {rewardMoney = 66000},
        [10043] = {rewardMoney = 66000},
        [10050] = {rewardMoney = 20000},
        [10051] = {rewardMoney = 62000},
        [10052] = {rewardMoney = 62000},
        [10055] = {rewardMoney = 20000},
        [10057] = {rewardMoney = 20000},
        [10058] = {rewardMoney = 20000},
        [10066] = {rewardMoney = 1000},
        [10067] = {rewardMoney = 1100},
        [10074] = {rewardMoney = 37000},
        [10075] = {rewardMoney = 29000},
        [10076] = {rewardMoney = 37000},
        [10077] = {rewardMoney = 29000},
        [10078] = {rewardMoney = 20000},
        [10079] = {rewardMoney = 20000},
        [10086] = {rewardMoney = 20000},
        [10087] = {rewardMoney = 20000},
        [10096] = {rewardMoney = 27000},
        [10099] = {rewardMoney = 20000},
        [10106] = {rewardMoney = 77000},
        [10109] = {rewardMoney = 35000},
        [10110] = {rewardMoney = 27000},
        [10111] = {rewardMoney = 70000},
        [10112] = {rewardMoney = 31000},
        [10115] = {rewardMoney = 31000},
        [10116] = {rewardMoney = 62000},
        [10117] = {rewardMoney = 62000},
        [10118] = {rewardMoney = 31000},
        [10132] = {rewardMoney = 58000},
        [10134] = {rewardMoney = 15000},
        [10136] = {rewardMoney = 87000},
        [10159] = {rewardMoney = 29000},
        [10161] = {rewardMoney = 20000},
        [10173] = {rewardMoney = 39000},
        [10176] = {rewardMoney = 39000},
        [10183] = {rewardMoney = 10000},
        [10184] = {rewardMoney = 39000},
        [10185] = {rewardMoney = 39000},
        [10186] = {rewardMoney = 39000},
        [10188] = {rewardMoney = 41000},
        [10189] = {rewardMoney = 39000},
        [10190] = {rewardMoney = 39000},
        [10191] = {rewardMoney = 78000},
        [10192] = {rewardMoney = 41000},
        [10193] = {rewardMoney = 39000},
        [10197] = {rewardMoney = 39000},
        [10199] = {rewardMoney = 39000},
        [10203] = {rewardMoney = 41000},
        [10204] = {rewardMoney = 39000},
        [10205] = {rewardMoney = 41000},
        [10206] = {rewardMoney = 39000},
        [10208] = {rewardMoney = 27000},
        [10209] = {rewardMoney = 41000},
        [10220] = {rewardMoney = 20000},
        [10221] = {rewardMoney = 39000},
        [10222] = {rewardMoney = 41000},
        [10223] = {rewardMoney = 41000},
        [10224] = {rewardMoney = 39000},
        [10226] = {rewardMoney = 39000},
        [10232] = {rewardMoney = 41000},
        [10233] = {rewardMoney = 41000},
        [10234] = {rewardMoney = 41000},
        [10235] = {rewardMoney = 41000},
        [10236] = {rewardMoney = 20000},
        [10238] = {rewardMoney = 20000},
        [10239] = {rewardMoney = 41000},
        [10240] = {rewardMoney = 41000},
        [10241] = {rewardMoney = 39000},
        [10242] = {rewardMoney = 2300},
        [10245] = {rewardMoney = 39000},
        [10248] = {rewardMoney = 41000},
        [10249] = {rewardMoney = 123000},
        [10255] = {rewardMoney = 29000},
        [10256] = {rewardMoney = 41000},
        [10257] = {rewardMoney = 132000},
        [10261] = {rewardMoney = 78000},
        [10262] = {rewardMoney = 39000},
        [10265] = {rewardMoney = 41000},
        [10267] = {rewardMoney = 41000},
        [10268] = {rewardMoney = 21000},
        [10269] = {rewardMoney = 41000},
        [10270] = {rewardMoney = 44000},
        [10271] = {rewardMoney = 44000},
        [10272] = {rewardMoney = 44000},
        [10273] = {rewardMoney = 44000},
        [10274] = {rewardMoney = 88000},
        [10275] = {rewardMoney = 44000},
        [10276] = {rewardMoney = 44000},
        [10278] = {rewardMoney = 20000},
        [10280] = {rewardMoney = 132000},
        [10287] = {rewardMoney = 14000},
        [10290] = {rewardMoney = 44000},
        [10293] = {rewardMoney = 41000},
        [10294] = {rewardMoney = 20000},
        [10295] = {rewardMoney = 29000},
        [10299] = {rewardMoney = 39000},
        [10300] = {rewardMoney = 41000},
        [10301] = {rewardMoney = 41000},
        [10302] = {rewardMoney = 35},
        [10309] = {rewardMoney = 39000},
        [10310] = {rewardMoney = 88000},
        [10312] = {rewardMoney = 41000},
        [10314] = {rewardMoney = 41000},
        [10315] = {rewardMoney = 44000},
        [10318] = {rewardMoney = 44000},
        [10319] = {rewardMoney = 41000},
        [10320] = {rewardMoney = 41000},
        [10321] = {rewardMoney = 41000},
        [10323] = {rewardMoney = 44000},
        [10324] = {rewardMoney = 175},
        [10329] = {rewardMoney = 39000},
        [10330] = {rewardMoney = 41000},
        [10331] = {rewardMoney = 41000},
        [10332] = {rewardMoney = 41000},
        [10334] = {rewardMoney = 41000},
        [10335] = {rewardMoney = 44000},
        [10336] = {rewardMoney = 44000},
        [10337] = {rewardMoney = 41000},
        [10342] = {rewardMoney = 39000},
        [10348] = {rewardMoney = 41000},
        [10349] = {rewardMoney = 3000},
        [10351] = {rewardMoney = 58000},
        [10353] = {rewardMoney = 44000},
        [10355] = {rewardMoney = 27000},
        [10365] = {rewardMoney = 44000},
        [10369] = {rewardMoney = 54000},
        [10389] = {rewardMoney = 20000},
        [10390] = {rewardMoney = 20000},
        [10391] = {rewardMoney = 20000},
        [10392] = {rewardMoney = 20000},
        [10394] = {rewardMoney = 20000},
        [10396] = {rewardMoney = 20000},
        [10397] = {rewardMoney = 20000},
        [10399] = {rewardMoney = 20000},
        [10400] = {rewardMoney = 87000},
        [10407] = {rewardMoney = 44000},
        [10408] = {rewardMoney = 132000},
        [10409] = {rewardMoney = 132000},
        [10411] = {rewardMoney = 132000},
        [10413] = {rewardMoney = 88000},
        [10417] = {rewardMoney = 39000},
        [10418] = {rewardMoney = 39000},
        [10422] = {rewardMoney = 132000},
        [10424] = {rewardMoney = 21000},
        [10426] = {rewardMoney = 41000},
        [10427] = {rewardMoney = 41000},
        [10429] = {rewardMoney = 41000},
        [10433] = {rewardMoney = 41000},
        [10435] = {rewardMoney = 41000},
        [10436] = {rewardMoney = 41000},
        [10439] = {rewardMoney = 132000},
        [10446] = {rewardMoney = 66000},
        [10447] = {rewardMoney = 66000},
        [10449] = {rewardMoney = 2300},
        [10450] = {rewardMoney = 9000},
        [10451] = {rewardMoney = 132000},
        [10455] = {rewardMoney = 35000},
        [10456] = {rewardMoney = 35000},
        [10457] = {rewardMoney = 35000},
        [10482] = {rewardMoney = 9000},
        [10484] = {rewardMoney = 9000},
        [10485] = {rewardMoney = 9000},
        [10486] = {rewardMoney = 35000},
        [10487] = {rewardMoney = 35000},
        [10488] = {rewardMoney = 35000},
        [10489] = {rewardMoney = 35000},
        [10502] = {rewardMoney = 35000},
        [10503] = {rewardMoney = 70000},
        [10504] = {rewardMoney = 35000},
        [10505] = {rewardMoney = 35000},
        [10506] = {rewardMoney = 35000},
        [10507] = {rewardMoney = 132000},
        [10508] = {rewardMoney = 44000},
        [10510] = {rewardMoney = 35000},
        [10511] = {rewardMoney = 35000},
        [10512] = {rewardMoney = 35000},
        [10516] = {rewardMoney = 35000},
        [10517] = {rewardMoney = 37000},
        [10518] = {rewardMoney = 74000},
        [10524] = {rewardMoney = 35000},
        [10526] = {rewardMoney = 74000},
        [10538] = {rewardMoney = 9000},
        [10542] = {rewardMoney = 35000},
        [10543] = {rewardMoney = 37000},
        [10544] = {rewardMoney = 70000},
        [10545] = {rewardMoney = 35000},
        [10556] = {rewardMoney = 35000},
        [10557] = {rewardMoney = 8000},
        [10562] = {rewardMoney = 41000},
        [10563] = {rewardMoney = 41000},
        [10564] = {rewardMoney = 41000},
        [10566] = {rewardMoney = 35000},
        [10569] = {rewardMoney = 41000},
        [10572] = {rewardMoney = 41000},
        [10582] = {rewardMoney = 41000},
        [10583] = {rewardMoney = 41000},
        [10584] = {rewardMoney = 37000},
        [10585] = {rewardMoney = 41000},
        [10586] = {rewardMoney = 41000},
        [10588] = {rewardMoney = 132000},
        [10589] = {rewardMoney = 41000},
        [10594] = {rewardMoney = 37000},
        [10595] = {rewardMoney = 41000},
        [10596] = {rewardMoney = 41000},
        [10597] = {rewardMoney = 41000},
        [10598] = {rewardMoney = 41000},
        [10600] = {rewardMoney = 41000},
        [10601] = {rewardMoney = 41000},
        [10602] = {rewardMoney = 41000},
        [10603] = {rewardMoney = 41000},
        [10604] = {rewardMoney = 41000},
        [10606] = {rewardMoney = 41000},
        [10608] = {rewardMoney = 37000},
        [10609] = {rewardMoney = 37000},
        [10611] = {rewardMoney = 41000},
        [10612] = {rewardMoney = 41000},
        [10613] = {rewardMoney = 41000},
        [10617] = {rewardMoney = 35000},
        [10618] = {rewardMoney = 33000},
        [10620] = {rewardMoney = 37000},
        [10621] = {rewardMoney = 41000},
        [10623] = {rewardMoney = 41000},
        [10624] = {rewardMoney = 41000},
        [10625] = {rewardMoney = 41000},
        [10626] = {rewardMoney = 41000},
        [10627] = {rewardMoney = 41000},
        [10629] = {rewardMoney = 40000},
        [10630] = {rewardMoney = 20000},
        [10632] = {rewardMoney = 37000},
        [10642] = {rewardMoney = 41000},
        [10643] = {rewardMoney = 41000},
        [10647] = {rewardMoney = 132000},
        [10648] = {rewardMoney = 132000},
        [10657] = {rewardMoney = 37000},
        [10660] = {rewardMoney = 41000},
        [10661] = {rewardMoney = 41000},
        [10664] = {rewardMoney = 41000},
        [10666] = {rewardMoney = 41000},
        [10667] = {rewardMoney = 44000},
        [10670] = {rewardMoney = 44000},
        [10671] = {rewardMoney = 37000},
        [10672] = {rewardMoney = 41000},
        [10673] = {rewardMoney = 88000},
        [10674] = {rewardMoney = 37000},
        [10675] = {rewardMoney = 78000},
        [10677] = {rewardMoney = 41000},
        [10678] = {rewardMoney = 88000},
        [10679] = {rewardMoney = 44000},
        [10682] = {rewardMoney = 37000},
        [10690] = {rewardMoney = 35000},
        [10701] = {rewardMoney = 78000},
        [10702] = {rewardMoney = 123000},
        [10703] = {rewardMoney = 123000},
        [10704] = {rewardMoney = 132000},
        [10710] = {rewardMoney = 16000},
        [10711] = {rewardMoney = 24000},
        [10712] = {rewardMoney = 31000},
        [10713] = {rewardMoney = 37000},
        [10714] = {rewardMoney = 37000},
        [10715] = {rewardMoney = 37000},
        [10717] = {rewardMoney = 37000},
        [10720] = {rewardMoney = 37000},
        [10721] = {rewardMoney = 37000},
        [10722] = {rewardMoney = 39000},
        [10724] = {rewardMoney = 37000},
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
        [10728] = {
            description = "Your services have gone above and beyond what is expected of you, <name>. You " ..
                "are but a step away from achieving the highest honor available to non-citizens of " ..
                "Dalaran.\n\nContinue to prove your loyalty to us and I will empower your signet to its " ..
                "full capacity.",
            rewardItems = {{29279, 1}},
        },
        [10730] = {rewardItems = {{29288, 1}}},
        [10731] = {rewardItems = {{29280, 1}}},
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
        [10736] = {
            description = "You've chosen your path, <class>. Now it is up to you to travel the path to " ..
                "wherever it may lead.\n\nYou will find that having friends among the Archmages of " ..
                "Dalaran has its advantages. Serve us well and your deeds will not go unrewarded.",
            rewardItems = {{29277, 1}},
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
        [10742] = {rewardMoney = 132000},
        [10744] = {rewardMoney = 44000},
        [10745] = {rewardMoney = 44000},
        [10747] = {rewardMoney = 39000},
        [10748] = {rewardMoney = 78000},
        [10753] = {rewardMoney = 29000},
        [10760] = {rewardMoney = 41000},
        [10769] = {rewardMoney = 132000},
        [10770] = {rewardMoney = 37000},
        [10771] = {rewardMoney = 37000},
        [10776] = {rewardMoney = 132000},
        [10777] = {rewardMoney = 41000},
        [10778] = {rewardMoney = 41000},
        [10780] = {rewardMoney = 41000},
        [10781] = {rewardMoney = 132000},
        [10782] = {rewardMoney = 41000},
        [10784] = {rewardMoney = 37000},
        [10786] = {rewardMoney = 78000},
        [10792] = {rewardMoney = 20000},
        [10795] = {rewardMoney = 37000},
        [10796] = {rewardMoney = 37000},
        [10799] = {rewardMoney = 37000},
        [10800] = {rewardMoney = 37000},
        [10802] = {rewardMoney = 78000},
        [10803] = {rewardMoney = 39000},
        [10805] = {rewardMoney = 74000},
        [10806] = {rewardMoney = 132000},
        [10808] = {rewardMoney = 41000},
        [10809] = {rewardMoney = 18000},
        [10810] = {rewardMoney = 10000},
        [10812] = {rewardMoney = 10000},
        [10813] = {rewardMoney = 14000},
        [10816] = {rewardMoney = 44000},
        [10817] = {rewardMoney = 44000},
        [10821] = {rewardMoney = 78000},
        [10830] = {rewardMoney = 78000},
        [10834] = {rewardMoney = 54000},
        [10835] = {rewardMoney = 5200},
        [10838] = {rewardMoney = 40000},
        [10839] = {rewardMoney = 31000},
        [10840] = {rewardMoney = 33000},
        [10843] = {rewardMoney = 39000},
        [10845] = {rewardMoney = 39000},
        [10846] = {rewardMoney = 37000},
        [10847] = {rewardMoney = 27000},
        [10848] = {rewardMoney = 31000},
        [10849] = {rewardMoney = 7400},
        [10851] = {rewardMoney = 37000},
        [10853] = {rewardMoney = 37000},
        [10855] = {rewardMoney = 41000},
        [10859] = {rewardMoney = 37000},
        [10860] = {rewardMoney = 37000},
        [10861] = {rewardMoney = 31000},
        [10862] = {rewardMoney = 23000},
        [10863] = {rewardMoney = 23000},
        [10864] = {rewardMoney = 20000},
        [10867] = {rewardMoney = 78000},
        [10868] = {rewardMoney = 27000},
        [10869] = {rewardMoney = 27000},
        [10870] = {rewardMoney = 132000},
        [10871] = {rewardMoney = 132000},
        [10873] = {rewardMoney = 33000},
        [10874] = {rewardMoney = 33000},
        [10876] = {rewardMoney = 58000},
        [10877] = {rewardMoney = 35000},
        [10879] = {rewardMoney = 99000},
        [10889] = {rewardMoney = 26000},
        [10893] = {rewardMoney = 37000},
        [10895] = {rewardMoney = 18000},
        [10896] = {rewardMoney = 33000},
        [10898] = {rewardMoney = 66000},
        [10904] = {rewardMoney = 39000},
        [10908] = {rewardMoney = 3000},
        [10909] = {rewardMoney = 20000},
        [10910] = {rewardMoney = 39000},
        [10911] = {rewardMoney = 39000},
        [10912] = {rewardMoney = 117000},
        [10917] = {rewardMoney = 33000},
        [10922] = {rewardMoney = 33000},
        [10924] = {rewardMoney = 41000},
        [10927] = {rewardMoney = 33000},
        [10928] = {rewardMoney = 33000},
        [10935] = {rewardMoney = 40000},
        [10937] = {rewardMoney = 54000},
        [10944] = {rewardMoney = 88000},
        [10946] = {rewardMoney = 132000},
        [10949] = {rewardMoney = 44000},
        [10959] = {rewardMoney = 132000},
        [10969] = {rewardMoney = 4400},
        [10970] = {rewardMoney = 44000},
        [10971] = {rewardMoney = 44000},
        [10973] = {rewardMoney = 132000},
        [10975] = {rewardMoney = 44000},
        [10976] = {rewardMoney = 44000},
        [10977] = {rewardMoney = 132000},
        [10982] = {rewardMoney = 132000},
        [10983] = {rewardMoney = 4400},
        [10995] = {rewardMoney = 88000},
        [10996] = {rewardMoney = 88000},
        [10997] = {rewardMoney = 88000},
        [10998] = {rewardMoney = 88000},
        [10999] = {description = "Bring me 8 trogg stone teeth."},
        [11000] = {rewardMoney = 132000},
        [11002] = {rewardMoney = 132000},
        [11003] = {rewardMoney = 132000},
        [11004] = {rewardMoney = 44000},
        [11007] = {rewardMoney = 132000},
        [11008] = {rewardMoney = 44000},
        [11010] = {rewardMoney = 44000},
        [11015] = {rewardMoney = 44000},
        [11016] = {
            description = "A skinner, eh? Well you'll find plenty to skin here! You gotta search for " ..
                "flayers around crystal formations. Take 'em down and take their hides. Sometimes they'll " ..
                "have a hide worth keepin'. Bring those to me.",
            rewardMoney = 44000,
        },
        [11017] = {rewardMoney = 44000},
        [11018] = {rewardMoney = 44000},
        [11020] = {rewardMoney = 44000},
        [11023] = {rewardMoney = 44000},
        [11025] = {rewardMoney = 44000},
        [11026] = {rewardMoney = 44000},
        [11030] = {rewardMoney = 44000},
        [11031] = {rewardChoices = {{29290, 1}, {29279, 1}, {29283, 1}}},
        [11032] = {rewardChoices = {{29290, 1}, {29287, 1}, {29283, 1}}},
        [11034] = {rewardChoices = {{29283, 1}, {29279, 1}, {29287, 1}}},
        [11035] = {rewardMoney = 44000},
        [11041] = {rewardMoney = 132000},
        [11049] = {rewardMoney = 88000},
        [11051] = {rewardMoney = 44000},
        [11053] = {rewardMoney = 44000},
        [11054] = {rewardMoney = 44000},
        [11055] = {rewardMoney = 44000},
        [11058] = {rewardMoney = 44000},
        [11059] = {rewardMoney = 132000},
        [11060] = {rewardMoney = 4400},
        [11061] = {rewardMoney = 44000},
        [11062] = {rewardMoney = 4400},
        [11064] = {rewardMoney = 44000},
        [11065] = {rewardMoney = 44000},
        [11066] = {rewardMoney = 44000},
        [11067] = {rewardMoney = 44000},
        [11068] = {rewardMoney = 88000},
        [11069] = {rewardMoney = 88000},
        [11070] = {rewardMoney = 88000},
        [11071] = {rewardMoney = 132000},
        [11073] = {rewardMoney = 132000},
        [11076] = {rewardMoney = 88000},
        [11077] = {rewardMoney = 44000},
        [11078] = {rewardMoney = 132000},
        [11079] = {rewardMoney = 132000},
        [11080] = {rewardMoney = 34000},
        [11082] = {rewardMoney = 44000},
        [11084] = {rewardMoney = 44000},
        [11085] = {rewardMoney = 34000},
        [11086] = {rewardMoney = 44000},
        [11090] = {rewardMoney = 44000},
        [11091] = {rewardMoney = 4400},
        [11093] = {rewardMoney = 44000},
        [11097] = {rewardMoney = 88000},
        [11101] = {rewardMoney = 88000},
        [11102] = {rewardMoney = 44000},
        [11108] = {rewardMoney = 132000},
        [11119] = {rewardMoney = 4400},
        [11129] = {rewardMoney = 175},
        [11153] = {rewardMoney = 47000},
        [11154] = {rewardMoney = 47000},
        [11155] = {rewardMoney = 47000},
        [11157] = {rewardMoney = 47000},
        [11167] = {rewardMoney = 47000},
        [11168] = {rewardMoney = 24000},
        [11170] = {rewardMoney = 47000},
        [11188] = {rewardMoney = 47000},
        [11190] = {rewardMoney = 47000},
        [11202] = {rewardMoney = 47000},
        [11216] = {
            description = "I was sent here by my mentor to look for assistance, but unfortunately I'm not " ..
                "allowed outside of Lower City and the individuals that frequent this establishment tend " ..
                "to be less than helpful.\n\nYou do seem different, more like the adventurous type. If " ..
                "you're interested in aiding our cause, speak to Archmage Alturus outside of Medivh's old " ..
                "dwelling, Karazhan.\n\nIn the meantime, I'm going to see about gaining access to the " ..
                "rest of the city. One of our old associates is rumored to be here.",
        },
        [11218] = {rewardMoney = 47000},
        [11224] = {rewardMoney = 47000},
        [11227] = {rewardMoney = 47000},
        [11230] = {rewardMoney = 47000},
        [11231] = {rewardMoney = 47000},
        [11233] = {rewardMoney = 94000},
        [11235] = {rewardMoney = 47000},
        [11236] = {rewardMoney = 100000},
        [11237] = {rewardMoney = 50000},
        [11238] = {rewardMoney = 100000},
        [11239] = {rewardMoney = 47000},
        [11240] = {rewardMoney = 47000},
        [11241] = {rewardMoney = 94000},
        [11243] = {rewardMoney = 44000},
        [11244] = {rewardMoney = 44000},
        [11245] = {rewardMoney = 47000},
        [11246] = {rewardMoney = 47000},
        [11247] = {rewardMoney = 47000},
        [11249] = {rewardMoney = 100000},
        [11250] = {rewardMoney = 100000},
        [11251] = {rewardMoney = 4800},
        [11255] = {rewardMoney = 44000},
        [11257] = {rewardMoney = 47000},
        [11258] = {rewardMoney = 47000},
        [11259] = {rewardMoney = 47000},
        [11260] = {rewardMoney = 100000},
        [11261] = {rewardMoney = 100000},
        [11262] = {rewardMoney = 188000},
        [11263] = {rewardMoney = 47000},
        [11264] = {rewardMoney = 100000},
        [11265] = {rewardMoney = 47000},
        [11266] = {rewardMoney = 50000},
        [11267] = {rewardMoney = 100000},
        [11268] = {rewardMoney = 47000},
        [11269] = {rewardMoney = 47000},
        [11271] = {rewardMoney = 47000},
        [11275] = {rewardMoney = 47000},
        [11278] = {rewardMoney = 12000},
        [11279] = {rewardMoney = 47000},
        [11280] = {rewardMoney = 47000},
        [11281] = {rewardMoney = 47000},
        [11282] = {rewardMoney = 47000},
        [11283] = {rewardMoney = 94000},
        [11284] = {rewardMoney = 47000},
        [11286] = {rewardMoney = 47000},
        [11289] = {rewardMoney = 47000},
        [11290] = {rewardMoney = 44000},
        [11292] = {rewardMoney = 44000},
        [11296] = {rewardMoney = 50000},
        [11298] = {rewardMoney = 47000},
        [11301] = {rewardMoney = 47000},
        [11303] = {rewardMoney = 94000},
        [11307] = {rewardMoney = 47000},
        [11309] = {rewardMoney = 47000},
        [11310] = {rewardMoney = 94000},
        [11311] = {rewardMoney = 47000},
        [11313] = {rewardMoney = 47000},
        [11314] = {rewardMoney = 47000},
        [11315] = {rewardMoney = 47000},
        [11316] = {rewardMoney = 47000},
        [11317] = {rewardMoney = 47000},
        [11319] = {rewardMoney = 47000},
        [11322] = {rewardMoney = 47000},
        [11324] = {rewardMoney = 94000},
        [11326] = {rewardMoney = 94000},
        [11327] = {rewardMoney = 47000},
        [11329] = {rewardMoney = 44000},
        [11330] = {rewardMoney = 24000},
        [11332] = {rewardMoney = 94000},
        [11346] = {rewardMoney = 47000},
        [11348] = {rewardMoney = 47000},
        [11349] = {rewardMoney = 47000},
        [11350] = {rewardMoney = 47000},
        [11351] = {rewardMoney = 47000},
        [11352] = {rewardMoney = 47000},
        [11355] = {rewardMoney = 50000},
        [11358] = {rewardMoney = 50000},
        [11359] = {rewardMoney = 100000},
        [11364] = {rewardMoney = 88000},
        [11365] = {rewardMoney = 50000},
        [11366] = {rewardMoney = 50000},
        [11367] = {rewardMoney = 100000},
        [11369] = {rewardMoney = 132000},
        [11370] = {rewardMoney = 132000},
        [11371] = {rewardMoney = 88000},
        [11373] = {rewardMoney = 132000},
        [11374] = {rewardMoney = 132000},
        [11375] = {rewardMoney = 132000},
        [11376] = {rewardMoney = 88000},
        [11378] = {rewardMoney = 132000},
        [11383] = {rewardMoney = 88000},
        [11384] = {rewardMoney = 132000},
        [11385] = {rewardMoney = 88000},
        [11386] = {rewardMoney = 132000},
        [11387] = {rewardMoney = 88000},
        [11388] = {rewardMoney = 132000},
        [11389] = {rewardMoney = 88000},
        [11390] = {rewardMoney = 47000},
        [11391] = {rewardMoney = 47000},
        [11394] = {rewardMoney = 47000},
        [11396] = {rewardMoney = 94000},
        [11397] = {rewardMoney = 47000},
        [11399] = {rewardMoney = 94000},
        [11406] = {rewardMoney = 4400},
        [11410] = {rewardMoney = 47000},
        [11418] = {rewardMoney = 34000},
        [11420] = {rewardMoney = 47000},
        [11421] = {rewardMoney = 94000},
        [11422] = {rewardMoney = 47000},
        [11424] = {rewardMoney = 47000},
        [11428] = {rewardMoney = 94000},
        [11430] = {rewardMoney = 47000},
        [11432] = {rewardMoney = 47000},
        [11433] = {rewardMoney = 47000},
        [11443] = {rewardMoney = 47000},
        [11452] = {rewardMoney = 100000},
        [11453] = {rewardMoney = 100000},
        [11455] = {rewardMoney = 47000},
        [11456] = {rewardMoney = 47000},
        [11457] = {rewardMoney = 47000},
        [11466] = {rewardMoney = 94000},
        [11469] = {rewardMoney = 47000},
        [11470] = {rewardMoney = 94000},
        [11472] = {rewardMoney = 102000},
        [11481] = {rewardMoney = 4400},
        [11482] = {rewardMoney = 4400},
        [11490] = {rewardMoney = 44000},
        [11494] = {rewardMoney = 141000},
        [11495] = {rewardMoney = 94000},
        [11499] = {rewardMoney = 132000},
        [11500] = {rewardMoney = 88000},
        [11502] = {rewardMoney = 44000},
        [11503] = {rewardMoney = 44000},
        [11505] = {rewardMoney = 106000},
        [11506] = {rewardMoney = 114000},
        [11514] = {rewardMoney = 44000},
        [11515] = {rewardMoney = 44000},
        [11516] = {rewardMoney = 44000},
        [11521] = {rewardMoney = 44000},
        [11523] = {rewardMoney = 34000},
        [11525] = {rewardMoney = 34000},
        [11526] = {rewardMoney = 34000},
        [11531] = {rewardMoney = 29500},
        [11533] = {rewardMoney = 34000},
        [11536] = {rewardMoney = 44000},
        [11537] = {rewardMoney = 44000},
        [11540] = {rewardMoney = 44000},
        [11541] = {rewardMoney = 44000},
        [11544] = {rewardMoney = 88000},
        [11546] = {rewardMoney = 44000},
        [11547] = {rewardMoney = 44000},
        [11559] = {rewardMoney = 47000},
        [11560] = {rewardMoney = 47000},
        [11561] = {rewardMoney = 47000},
        [11563] = {rewardMoney = 47000},
        [11564] = {rewardMoney = 47000},
        [11566] = {rewardMoney = 100000},
        [11569] = {rewardMoney = 47000},
        [11570] = {rewardMoney = 47000},
        [11571] = {rewardMoney = 47000},
        [11572] = {rewardMoney = 141000},
        [11574] = {rewardMoney = 24000},
        [11575] = {rewardMoney = 24000},
        [11576] = {rewardMoney = 37000},
        [11582] = {rewardMoney = 37000},
        [11587] = {rewardMoney = 47000},
        [11590] = {rewardMoney = 47000},
        [11592] = {rewardMoney = 100000},
        [11593] = {rewardMoney = 47000},
        [11594] = {rewardMoney = 47000},
        [11605] = {rewardMoney = 50000},
        [11607] = {rewardMoney = 50000},
        [11609] = {rewardMoney = 50000},
        [11610] = {rewardMoney = 100000},
        [11612] = {rewardMoney = 50000},
        [11617] = {rewardMoney = 50000},
        [11619] = {rewardMoney = 47000},
        [11623] = {rewardMoney = 50000},
        [11627] = {rewardMoney = 50000},
        [11628] = {rewardMoney = 50000},
        [11630] = {rewardMoney = 50000},
        [11633] = {rewardMoney = 50000},
        [11635] = {rewardMoney = 47000},
        [11637] = {rewardMoney = 50000},
        [11638] = {rewardMoney = 94000},
        [11639] = {rewardMoney = 47000},
        [11640] = {rewardMoney = 50000},
        [11641] = {rewardMoney = 50000},
        [11645] = {rewardMoney = 47000},
        [11647] = {rewardMoney = 50000},
        [11648] = {rewardMoney = 37000},
        [11649] = {rewardMoney = 47000},
        [11650] = {rewardMoney = 47000},
        [11653] = {rewardMoney = 47000},
        [11654] = {rewardMoney = 39000},
        [11658] = {rewardMoney = 47000},
        [11659] = {rewardMoney = 50000},
        [11661] = {rewardMoney = 141000},
        [11663] = {rewardMoney = 4800},
        [11670] = {rewardMoney = 100000},
        [11671] = {rewardMoney = 47000},
        [11673] = {rewardMoney = 100000},
        [11675] = {rewardMoney = 47000},
        [11677] = {rewardMoney = 47000},
        [11680] = {rewardMoney = 4800},
        [11681] = {rewardMoney = 47000},
        [11682] = {rewardMoney = 24000},
        [11683] = {rewardMoney = 47000},
        [11684] = {rewardMoney = 47000},
        [11685] = {rewardMoney = 47000},
        [11687] = {rewardMoney = 50000},
        [11689] = {rewardMoney = 94000},
        [11693] = {rewardMoney = 47000},
        [11694] = {rewardMoney = 47000},
        [11695] = {rewardMoney = 47000},
        [11698] = {rewardMoney = 47000},
        [11701] = {rewardMoney = 94000},
        [11706] = {rewardMoney = 94000},
        [11710] = {rewardMoney = 47000},
        [11712] = {rewardMoney = 47000},
        [11713] = {rewardMoney = 94000},
        [11715] = {rewardMoney = 47000},
        [11718] = {rewardMoney = 47000},
        [11723] = {rewardMoney = 94000},
        [11726] = {rewardMoney = 47000},
        [11728] = {rewardMoney = 47000},
        [11730] = {rewardMoney = 94000},
        [11733] = {rewardMoney = 37000},
        [11788] = {rewardMoney = 94000},
        [11795] = {rewardMoney = 47000},
        [11796] = {rewardMoney = 47000},
        [11797] = {rewardMoney = 47000},
        [11798] = {rewardMoney = 100000},
        [11866] = {rewardMoney = 50000},
        [11868] = {rewardMoney = 50000},
        [11873] = {rewardMoney = 94000},
        [11875] = {rewardMoney = 88000},
        [11877] = {rewardMoney = 44000},
        [11880] = {rewardMoney = 34000},
        [11881] = {rewardMoney = 47000},
        [11887] = {rewardMoney = 47000},
        [11889] = {rewardMoney = 47000},
        [11890] = {rewardMoney = 47000},
        [11893] = {rewardMoney = 47000},
        [11894] = {rewardMoney = 94000},
        [11895] = {rewardMoney = 47000},
        [11896] = {rewardMoney = 47000},
        [11898] = {rewardMoney = 94000},
        [11899] = {rewardMoney = 47000},
        [11900] = {rewardMoney = 47000},
        [11903] = {rewardMoney = 47000},
        [11905] = {rewardMoney = 188000},
        [11906] = {rewardMoney = 47000},
        [11907] = {rewardMoney = 94000},
        [11908] = {rewardMoney = 47000},
        [11909] = {rewardMoney = 100000},
        [11910] = {rewardMoney = 47000},
        [11911] = {rewardMoney = 188000},
        [11912] = {rewardMoney = 47000},
        [11913] = {rewardMoney = 47000},
        [11914] = {rewardMoney = 47000},
        [11918] = {rewardMoney = 47000},
        [11919] = {rewardMoney = 47000},
        [11931] = {rewardMoney = 47000},
        [11936] = {rewardMoney = 47000},
        [11940] = {rewardMoney = 47000},
        [11941] = {rewardMoney = 47000},
        [11942] = {rewardMoney = 50000},
        [11943] = {rewardMoney = 47000},
        [11945] = {rewardMoney = 50000},
        [11946] = {rewardMoney = 4800},
        [11949] = {rewardMoney = 50000},
        [11951] = {rewardMoney = 47000},
        [11957] = {rewardMoney = 47000},
        [11958] = {rewardMoney = 50000},
        [11959] = {rewardMoney = 106000},
        [11960] = {rewardMoney = 50000},
        [11961] = {rewardMoney = 39000},
        [11967] = {rewardMoney = 24000},
        [11969] = {rewardMoney = 47000},
        [11973] = {rewardMoney = 188000},
        [11982] = {rewardMoney = 59000},
        [11984] = {rewardMoney = 56000},
        [11985] = {rewardMoney = 59000},
        [11986] = {rewardMoney = 59000},
        [11988] = {rewardMoney = 59000},
        [11991] = {rewardMoney = 56000},
        [11993] = {rewardMoney = 59000},
        [11999] = {rewardMoney = 50000},
        [12000] = {rewardMoney = 50000},
        [12002] = {rewardMoney = 59000},
        [12003] = {rewardMoney = 59000},
        [12004] = {rewardMoney = 106000},
        [12005] = {rewardMoney = 106000},
        [12006] = {rewardMoney = 50000},
        [12007] = {rewardMoney = 56000},
        [12009] = {rewardMoney = 50000},
        [12011] = {rewardMoney = 5000},
        [12013] = {rewardMoney = 106000},
        [12014] = {rewardMoney = 46000},
        [12016] = {rewardMoney = 50000},
        [12017] = {rewardMoney = 106000},
        [12019] = {rewardMoney = 150000},
        [12026] = {rewardMoney = 59000},
        [12027] = {rewardMoney = 56000},
        [12028] = {rewardMoney = 50000},
        [12029] = {rewardMoney = 56000},
        [12030] = {rewardMoney = 50000},
        [12031] = {rewardMoney = 50000},
        [12032] = {rewardMoney = 100000},
        [12037] = {rewardMoney = 224000},
        [12038] = {rewardMoney = 50000},
        [12043] = {rewardMoney = 56000},
        [12044] = {rewardMoney = 56000},
        [12045] = {rewardMoney = 56000},
        [12046] = {rewardMoney = 56000},
        [12047] = {rewardMoney = 56000},
        [12049] = {rewardMoney = 56000},
        [12050] = {rewardMoney = 56000},
        [12052] = {rewardMoney = 112000},
        [12054] = {rewardMoney = 59000},
        [12056] = {rewardMoney = 50000},
        [12058] = {rewardMoney = 59000},
        [12060] = {rewardMoney = 50000},
        [12061] = {rewardMoney = 50000},
        [12065] = {rewardMoney = 50000},
        [12066] = {rewardMoney = 50000},
        [12067] = {rewardMoney = 50000},
        [12068] = {rewardMoney = 59000},
        [12070] = {rewardMoney = 59000},
        [12073] = {rewardMoney = 59000},
        [12075] = {rewardMoney = 56000},
        [12076] = {rewardMoney = 56000},
        [12077] = {rewardMoney = 56000},
        [12078] = {rewardMoney = 56000},
        [12079] = {rewardMoney = 56000},
        [12080] = {rewardMoney = 168000},
        [12082] = {rewardMoney = 59000},
        [12083] = {rewardMoney = 50000},
        [12084] = {rewardMoney = 50000},
        [12085] = {rewardMoney = 50000},
        [12089] = {rewardMoney = 112000},
        [12090] = {rewardMoney = 112000},
        [12091] = {rewardMoney = 112000},
        [12092] = {rewardMoney = 50000},
        [12093] = {rewardMoney = 59000},
        [12094] = {rewardMoney = 59000},
        [12096] = {rewardMoney = 50000},
        [12097] = {rewardMoney = 177000},
        [12098] = {rewardMoney = 50000},
        [12099] = {rewardMoney = 118000},
        [12106] = {rewardMoney = 50000},
        [12107] = {rewardMoney = 100000},
        [12110] = {rewardMoney = 100000},
        [12111] = {rewardMoney = 53000},
        [12112] = {rewardMoney = 44000},
        [12113] = {rewardMoney = 59000},
        [12114] = {rewardMoney = 59000},
        [12116] = {rewardMoney = 118000},
        [12120] = {rewardMoney = 59000},
        [12121] = {rewardMoney = 59000},
        [12129] = {rewardMoney = 59000},
        [12130] = {rewardMoney = 59000},
        [12131] = {rewardMoney = 59000},
        [12134] = {rewardMoney = 59000},
        [12136] = {rewardMoney = 159000},
        [12138] = {rewardMoney = 59000},
        [12142] = {rewardMoney = 53000},
        [12143] = {rewardMoney = 53000},
        [12144] = {rewardMoney = 53000},
        [12145] = {rewardMoney = 53000},
        [12146] = {rewardMoney = 53000},
        [12147] = {rewardMoney = 53000},
        [12148] = {rewardMoney = 53000},
        [12149] = {rewardMoney = 53000},
        [12150] = {rewardMoney = 112000},
        [12151] = {rewardMoney = 168000},
        [12152] = {rewardMoney = 59000},
        [12153] = {rewardMoney = 118000},
        [12154] = {rewardMoney = 59000},
        [12159] = {rewardMoney = 59000},
        [12164] = {rewardMoney = 177000},
        [12165] = {rewardMoney = 59000},
        [12166] = {rewardMoney = 50000},
        [12167] = {rewardMoney = 50000},
        [12169] = {rewardMoney = 100000},
        [12170] = {rewardMoney = 56000},
        [12172] = {rewardMoney = 53000},
        [12173] = {rewardMoney = 53000},
        [12175] = {rewardMoney = 56000},
        [12180] = {rewardMoney = 59000},
        [12183] = {rewardMoney = 59000},
        [12184] = {rewardMoney = 59000},
        [12185] = {rewardMoney = 59000},
        [12190] = {rewardMoney = 56000},
        [12195] = {rewardMoney = 59000},
        [12196] = {rewardMoney = 59000},
        [12197] = {rewardMoney = 59000},
        [12198] = {rewardMoney = 59000},
        [12199] = {rewardMoney = 118000},
        [12201] = {rewardMoney = 59000},
        [12202] = {rewardMoney = 59000},
        [12203] = {rewardMoney = 59000},
        [12204] = {rewardMoney = 46000},
        [12205] = {rewardMoney = 50000},
        [12206] = {rewardMoney = 5000},
        [12208] = {rewardMoney = 14400},
        [12209] = {rewardMoney = 50000},
        [12210] = {rewardMoney = 41000},
        [12211] = {rewardMoney = 50000},
        [12212] = {rewardMoney = 56000},
        [12214] = {rewardMoney = 50000},
        [12215] = {rewardMoney = 44000},
        [12216] = {rewardMoney = 56000},
        [12217] = {rewardMoney = 56000},
        [12222] = {rewardMoney = 56000},
        [12223] = {rewardMoney = 56000},
        [12226] = {rewardMoney = 53000},
        [12230] = {rewardMoney = 50000},
        [12232] = {rewardMoney = 50000},
        [12234] = {rewardMoney = 50000},
        [12236] = {rewardMoney = 177000},
        [12239] = {rewardMoney = 50000},
        [12240] = {rewardMoney = 50000},
        [12243] = {rewardMoney = 50000},
        [12244] = {rewardMoney = 56000},
        [12245] = {rewardMoney = 50000},
        [12249] = {rewardMoney = 177000},
        [12252] = {rewardMoney = 50000},
        [12254] = {rewardMoney = 50000},
        [12255] = {rewardMoney = 56000},
        [12256] = {rewardMoney = 56000},
        [12257] = {rewardMoney = 56000},
        [12259] = {rewardMoney = 56000},
        [12260] = {rewardMoney = 50000},
        [12261] = {rewardMoney = 56000},
        [12262] = {rewardMoney = 56000},
        [12263] = {rewardMoney = 56000},
        [12264] = {rewardMoney = 56000},
        [12265] = {rewardMoney = 56000},
        [12266] = {rewardMoney = 5600},
        [12267] = {rewardMoney = 118000},
        [12268] = {rewardMoney = 56000},
        [12270] = {rewardMoney = 56000},
        [12271] = {rewardMoney = 25000},
        [12273] = {rewardMoney = 106000},
        [12274] = {rewardMoney = 53000},
        [12279] = {rewardMoney = 59000},
        [12280] = {rewardMoney = 56000},
        [12283] = {rewardMoney = 50000},
        [12284] = {rewardMoney = 56000},
        [12285] = {rewardMoney = 106000},
        [12288] = {rewardMoney = 56000},
        [12289] = {rewardMoney = 56000},
        [12296] = {rewardMoney = 56000},
        [12299] = {rewardMoney = 112000},
        [12303] = {rewardMoney = 50000},
        [12304] = {rewardMoney = 50000},
        [12307] = {rewardMoney = 44000},
        [12310] = {rewardMoney = 56000},
        [12314] = {rewardMoney = 56000},
        [12315] = {rewardMoney = 56000},
        [12316] = {rewardMoney = 56000},
        [12317] = {rewardMoney = 56000},
        [12323] = {rewardMoney = 56000},
        [12324] = {rewardMoney = 56000},
        [12372] = {rewardMoney = 56000},
        [12414] = {rewardMoney = 59000},
        [12415] = {rewardMoney = 59000},
        [12416] = {rewardMoney = 56000},
        [12417] = {rewardMoney = 56000},
        [12418] = {rewardMoney = 118000},
        [12419] = {rewardMoney = 15000},
        [12427] = {rewardMoney = 112000},
        [12428] = {rewardMoney = 168000},
        [12429] = {rewardMoney = 168000},
        [12430] = {rewardMoney = 177000},
        [12431] = {rewardMoney = 177000},
        [12432] = {rewardMoney = 56000},
        [12433] = {rewardMoney = 56000},
        [12437] = {rewardMoney = 56000},
        [12438] = {rewardMoney = 112000},
        [12441] = {rewardMoney = 112000},
        [12442] = {rewardMoney = 112000},
        [12443] = {rewardMoney = 56000},
        [12444] = {rewardMoney = 56000},
        [12447] = {rewardMoney = 5600},
        [12448] = {rewardMoney = 56000},
        [12449] = {rewardMoney = 56000},
        [12450] = {rewardMoney = 118000},
        [12453] = {rewardMoney = 44000},
        [12454] = {rewardMoney = 56000},
        [12456] = {rewardMoney = 112000},
        [12458] = {rewardMoney = 56000},
        [12459] = {rewardMoney = 168000},
        [12460] = {rewardMoney = 5600},
        [12461] = {rewardMoney = 5600},
        [12464] = {rewardMoney = 106000},
        [12469] = {rewardMoney = 5600},
        [12470] = {rewardMoney = 118000},
        [12476] = {rewardMoney = 53000},
        [12481] = {rewardMoney = 94000},
        [12483] = {rewardMoney = 59000},
        [12484] = {rewardMoney = 14400},
        [12489] = {rewardMoney = 31000},
        [12501] = {rewardMoney = 62000},
        [12502] = {rewardMoney = 15800},
        [12503] = {rewardMoney = 62000},
        [12504] = {rewardMoney = 62000},
        [12505] = {rewardMoney = 6200},
        [12506] = {rewardMoney = 62000},
        [12507] = {rewardMoney = 15800},
        [12508] = {rewardMoney = 62000},
        [12509] = {rewardMoney = 15800},
        [12510] = {rewardMoney = 62000},
        [12512] = {rewardMoney = 62000},
        [12514] = {rewardMoney = 62000},
        [12516] = {rewardMoney = 124000},
        [12519] = {rewardMoney = 15800},
        [12520] = {rewardMoney = 62000},
        [12522] = {rewardMoney = 48000},
        [12523] = {rewardMoney = 62000},
        [12524] = {rewardMoney = 62000},
        [12525] = {rewardMoney = 62000},
        [12527] = {rewardMoney = 62000},
        [12528] = {rewardMoney = 16600},
        [12529] = {rewardMoney = 65000},
        [12530] = {rewardMoney = 65000},
        [12531] = {rewardMoney = 65000},
        [12532] = {rewardMoney = 65000},
        [12533] = {rewardMoney = 65000},
        [12534] = {rewardMoney = 65000},
        [12535] = {rewardMoney = 65000},
        [12536] = {rewardMoney = 16600},
        [12537] = {rewardMoney = 65000},
        [12538] = {rewardMoney = 65000},
        [12539] = {rewardMoney = 65000},
        [12540] = {rewardMoney = 65000},
        [12541] = {rewardMoney = 15800},
        [12543] = {rewardMoney = 62000},
        [12544] = {rewardMoney = 48000},
        [12545] = {rewardMoney = 56000},
        [12546] = {rewardMoney = 204000},
        [12547] = {rewardMoney = 68000},
        [12549] = {rewardMoney = 62000},
        [12550] = {rewardMoney = 62000},
        [12551] = {rewardMoney = 62000},
        [12552] = {rewardMoney = 62000},
        [12553] = {rewardMoney = 62000},
        [12554] = {rewardMoney = 124000},
        [12555] = {rewardMoney = 62000},
        [12556] = {rewardMoney = 124000},
        [12557] = {rewardMoney = 6200},
        [12558] = {rewardMoney = 62000},
        [12559] = {rewardMoney = 51000},
        [12560] = {rewardMoney = 62000},
        [12561] = {rewardMoney = 130000},
        [12562] = {rewardMoney = 62000},
        [12563] = {rewardMoney = 62000},
        [12564] = {rewardMoney = 15800},
        [12568] = {rewardMoney = 15800},
        [12569] = {rewardMoney = 62000},
        [12570] = {rewardMoney = 65000},
        [12571] = {rewardMoney = 65000},
        [12572] = {rewardMoney = 65000},
        [12573] = {rewardMoney = 65000},
        [12574] = {rewardMoney = 33000},
        [12575] = {rewardMoney = 65000},
        [12576] = {rewardMoney = 65000},
        [12577] = {rewardMoney = 33000},
        [12578] = {rewardMoney = 33000},
        [12579] = {rewardMoney = 65000},
        [12580] = {rewardMoney = 65000},
        [12581] = {rewardMoney = 195000},
        [12582] = {rewardMoney = 33000},
        [12583] = {rewardMoney = 62000},
        [12584] = {rewardMoney = 62000},
        [12585] = {rewardMoney = 15800},
        [12587] = {rewardMoney = 62000},
        [12588] = {rewardMoney = 15800},
        [12591] = {rewardMoney = 15800},
        [12592] = {rewardMoney = 124000},
        [12594] = {rewardMoney = 15800},
        [12596] = {rewardMoney = 62000},
        [12597] = {rewardMoney = 15800},
        [12598] = {rewardMoney = 15800},
        [12599] = {rewardMoney = 15800},
        [12601] = {rewardMoney = 15800},
        [12602] = {rewardMoney = 15800},
        [12603] = {rewardMoney = 65000},
        [12604] = {rewardMoney = 186000},
        [12605] = {rewardMoney = 65000},
        [12606] = {rewardMoney = 62000},
        [12607] = {rewardMoney = 51000},
        [12608] = {rewardMoney = 68000},
        [12609] = {rewardMoney = 62000},
        [12610] = {rewardMoney = 62000},
        [12611] = {rewardMoney = 65000},
        [12614] = {rewardMoney = 130000},
        [12617] = {rewardMoney = 65000},
        [12620] = {rewardMoney = 51000},
        [12622] = {rewardMoney = 65000},
        [12624] = {rewardMoney = 186000},
        [12629] = {rewardMoney = 59000},
        [12630] = {rewardMoney = 59000},
        [12631] = {rewardMoney = 46000},
        [12633] = {rewardMoney = 46000},
        [12634] = {rewardMoney = 62000},
        [12637] = {rewardMoney = 30000},
        [12638] = {rewardMoney = 30000},
        [12639] = {rewardMoney = 65000},
        [12640] = {rewardMoney = 65000},
        [12643] = {rewardMoney = 59000},
        [12644] = {rewardMoney = 48000},
        [12645] = {rewardMoney = 124000},
        [12648] = {rewardMoney = 46000},
        [12649] = {rewardMoney = 46000},
        [12651] = {rewardMoney = 6600},
        [12654] = {rewardMoney = 62000},
        [12658] = {rewardMoney = 65000},
        [12659] = {rewardMoney = 65000},
        [12660] = {rewardMoney = 65000},
        [12661] = {rewardMoney = 59000},
        [12662] = {rewardMoney = 65000},
        [12669] = {rewardMoney = 59000},
        [12671] = {rewardMoney = 65000},
        [12673] = {rewardMoney = 59000},
        [12676] = {rewardMoney = 59000},
        [12677] = {rewardMoney = 59000},
        [12678] = {rewardMoney = 8500},
        [12679] = {rewardMoney = 8500},
        [12680] = {rewardMoney = 8500},
        [12681] = {rewardMoney = 65000},
        [12683] = {rewardMoney = 65000},
        [12686] = {rewardMoney = 30000},
        [12687] = {rewardMoney = 8500},
        [12688] = {rewardMoney = 62000},
        [12689] = {rewardMoney = 33000},
        [12690] = {rewardMoney = 59000},
        [12691] = {rewardMoney = 68000},
        [12692] = {rewardMoney = 33000},
        [12695] = {rewardMoney = 33000},
        [12698] = {rewardMoney = 8500},
        [12699] = {rewardMoney = 65000},
        [12701] = {rewardMoney = 25000},
        [12702] = {rewardMoney = 65000},
        [12703] = {rewardMoney = 136000},
        [12704] = {rewardMoney = 65000},
        [12705] = {rewardMoney = 136000},
        [12706] = {rewardMoney = 8500},
        [12707] = {rewardMoney = 65000},
        [12710] = {rewardMoney = 30000},
        [12713] = {rewardMoney = 186000},
        [12716] = {rewardMoney = 8500},
        [12719] = {rewardMoney = 8500},
        [12720] = {rewardMoney = 8500},
        [12722] = {rewardMoney = 8500},
        [12724] = {rewardMoney = 8500},
        [12726] = {rewardMoney = 74000},
        [12727] = {rewardMoney = 16500},
        [12728] = {rewardMoney = 94000},
        [12730] = {rewardMoney = 204000},
        [12732] = {rewardMoney = 74000},
        [12733] = {rewardMoney = 25000},
        [12734] = {rewardMoney = 74000},
        [12735] = {rewardMoney = 74000},
        [12736] = {rewardMoney = 74000},
        [12737] = {rewardMoney = 74000},
        [12739] = {rewardMoney = 8500},
        [12741] = {rewardMoney = 74000},
        [12742] = {rewardMoney = 8500},
        [12743] = {rewardMoney = 8500},
        [12744] = {rewardMoney = 8500},
        [12745] = {rewardMoney = 8500},
        [12746] = {rewardMoney = 8500},
        [12747] = {rewardMoney = 8500},
        [12748] = {rewardMoney = 8500},
        [12749] = {rewardMoney = 8500},
        [12750] = {rewardMoney = 8500},
        [12751] = {rewardMoney = 8500},
        [12754] = {rewardMoney = 8500},
        [12756] = {rewardMoney = 8500},
        [12757] = {rewardMoney = 25000},
        [12758] = {rewardMoney = 74000},
        [12759] = {rewardMoney = 136000},
        [12760] = {rewardMoney = 136000},
        [12761] = {rewardMoney = 136000},
        [12762] = {rewardMoney = 136000},
        [12763] = {rewardMoney = 6000},
        [12770] = {rewardMoney = 6000},
        [12771] = {rewardMoney = 57000},
        [12773] = {rewardMoney = 57000},
        [12774] = {rewardMoney = 57000},
        [12776] = {rewardMoney = 57000},
        [12779] = {rewardMoney = 25000},
        [12785] = {rewardMoney = 57000},
        [12786] = {rewardMoney = 57000},
        [12787] = {rewardMoney = 57000},
        [12788] = {rewardMoney = 57000},
        [12789] = {rewardMoney = 6000},
        [12792] = {rewardMoney = 6000},
        [12793] = {rewardMoney = 6000},
        [12795] = {rewardMoney = 6000},
        [12797] = {rewardMoney = 53000},
        [12799] = {rewardMoney = 59000},
        [12801] = {rewardMoney = 33300},
        [12804] = {rewardMoney = 62000},
        [12805] = {rewardMoney = 65000},
        [12809] = {rewardMoney = 57000},
        [12810] = {rewardMoney = 74000},
        [12812] = {rewardMoney = 57000},
        [12813] = {rewardMoney = 74000},
        [12814] = {rewardMoney = 74000},
        [12815] = {rewardMoney = 74000},
        [12818] = {rewardMoney = 68000},
        [12819] = {rewardMoney = 68000},
        [12820] = {rewardMoney = 68000},
        [12821] = {rewardMoney = 68000},
        [12822] = {rewardMoney = 68000},
        [12823] = {rewardMoney = 68000},
        [12824] = {rewardMoney = 6800},
        [12826] = {rewardMoney = 6800},
        [12827] = {rewardMoney = 68000},
        [12828] = {rewardMoney = 68000},
        [12829] = {rewardMoney = 68000},
        [12830] = {rewardMoney = 68000},
        [12831] = {rewardMoney = 68000},
        [12832] = {rewardMoney = 68000},
        [12833] = {rewardMoney = 68000},
        [12836] = {rewardMoney = 68000},
        [12838] = {rewardMoney = 74000},
        [12839] = {rewardMoney = 74000},
        [12840] = {rewardMoney = 74000},
        [12844] = {rewardMoney = 71000},
        [12847] = {rewardMoney = 148000},
        [12851] = {rewardMoney = 74000},
        [12852] = {rewardMoney = 148000},
        [12853] = {rewardMoney = 6800},
        [12854] = {rewardMoney = 74000},
        [12855] = {rewardMoney = 74000},
        [12856] = {rewardMoney = 74000},
        [12857] = {rewardMoney = 118000},
        [12858] = {rewardMoney = 74000},
        [12859] = {rewardMoney = 59000},
        [12860] = {rewardMoney = 74000},
        [12861] = {rewardMoney = 59000},
        [12862] = {rewardMoney = 6800},
        [12863] = {rewardMoney = 6800},
        [12864] = {rewardMoney = 68000},
        [12865] = {rewardMoney = 68000},
        [12866] = {rewardMoney = 68000},
        [12867] = {rewardMoney = 68000},
        [12868] = {rewardMoney = 136000},
        [12869] = {rewardMoney = 68000},
        [12870] = {rewardMoney = 68000},
        [12871] = {rewardMoney = 7400},
        [12872] = {rewardMoney = 74000},
        [12873] = {rewardMoney = 7400},
        [12874] = {rewardMoney = 74000},
        [12875] = {rewardMoney = 74000},
        [12876] = {rewardMoney = 74000},
        [12877] = {rewardMoney = 74000},
        [12878] = {rewardMoney = 74000},
        [12879] = {rewardMoney = 74000},
        [12880] = {rewardMoney = 7400},
        [12882] = {rewardMoney = 68000},
        [12883] = {rewardMoney = 118000},
        [12885] = {rewardMoney = 7400},
        [12887] = {rewardMoney = 74000},
        [12888] = {rewardMoney = 74000},
        [12889] = {rewardMoney = 58000},
        [12891] = {rewardMoney = 74000},
        [12892] = {rewardMoney = 74000},
        [12893] = {rewardMoney = 148000},
        [12895] = {rewardMoney = 74000},
        [12896] = {rewardMoney = 148000},
        [12897] = {rewardMoney = 148000},
        [12898] = {rewardMoney = 7400},
        [12899] = {rewardMoney = 7400},
        [12904] = {rewardMoney = 124000},
        [12906] = {rewardMoney = 36000},
        [12907] = {rewardMoney = 36000},
        [12909] = {rewardMoney = 7400},
        [12910] = {rewardMoney = 74000},
        [12913] = {rewardMoney = 7400},
        [12915] = {rewardMoney = 74000},
        [12917] = {rewardMoney = 74000},
        [12919] = {rewardMoney = 186000},
        [12920] = {rewardMoney = 58000},
        [12922] = {rewardMoney = 74000},
        [12924] = {rewardMoney = 74000},
        [12925] = {rewardMoney = 74000},
        [12926] = {rewardMoney = 74000},
        [12927] = {rewardMoney = 74000},
        [12928] = {rewardMoney = 74000},
        [12929] = {rewardMoney = 7400},
        [12930] = {rewardMoney = 74000},
        [12931] = {rewardMoney = 74000},
        [12932] = {rewardMoney = 195000},
        [12933] = {rewardMoney = 195000},
        [12934] = {rewardMoney = 195000},
        [12935] = {rewardMoney = 195000},
        [12936] = {rewardMoney = 195000},
        [12937] = {rewardMoney = 74000},
        [12939] = {rewardMoney = 74000},
        [12942] = {rewardMoney = 74000},
        [12943] = {rewardMoney = 74000},
        [12948] = {rewardMoney = 204000},
        [12949] = {rewardMoney = 74000},
        [12951] = {rewardMoney = 19000},
        [12953] = {rewardMoney = 58000},
        [12954] = {rewardMoney = 195000},
        [12955] = {rewardMoney = 74000},
        [12956] = {rewardMoney = 58000},
        [12957] = {rewardMoney = 74000},
        [12958] = {rewardMoney = 15},
        [12959] = {rewardMoney = 102000},
        [12960] = {rewardMoney = 114000},
        [12961] = {rewardMoney = 114000},
        [12962] = {rewardMoney = 114000},
        [12963] = {rewardMoney = 15},
        [12964] = {rewardMoney = 74000},
        [12965] = {rewardMoney = 74000},
        [12968] = {rewardMoney = 58000},
        [12970] = {rewardMoney = 7400},
        [12971] = {rewardMoney = 74000},
        [12973] = {rewardMoney = 222000},
        [12975] = {rewardMoney = 74000},
        [12976] = {rewardMoney = 37000},
        [12977] = {rewardMoney = 74000},
        [12978] = {rewardMoney = 74000},
        [12979] = {rewardMoney = 74000},
        [12980] = {rewardMoney = 74000},
        [12981] = {rewardMoney = 74000},
        [12982] = {rewardMoney = 74000},
        [12984] = {rewardMoney = 148000},
        [12985] = {rewardMoney = 74000},
        [12986] = {rewardMoney = 74000},
        [12987] = {rewardMoney = 19000},
        [12988] = {rewardMoney = 74000},
        [12989] = {rewardMoney = 74000},
        [12991] = {rewardMoney = 74000},
        [12992] = {rewardMoney = 74000},
        [12993] = {rewardMoney = 74000},
        [12994] = {rewardMoney = 74000},
        [12995] = {rewardMoney = 74000},
        [12997] = {rewardMoney = 74000},
        [12998] = {rewardMoney = 74000},
        [12999] = {rewardMoney = 7400},
        [13000] = {rewardMoney = 71000},
        [13001] = {rewardMoney = 74000},
        [13003] = {rewardMoney = 148000},
        [13005] = {rewardMoney = 148000},
        [13006] = {rewardMoney = 74000},
        [13007] = {rewardMoney = 222000},
        [13008] = {rewardMoney = 68000},
        [13009] = {rewardMoney = 74000},
        [13010] = {rewardMoney = 148000},
        [13011] = {rewardMoney = 74000},
        [13034] = {rewardMoney = 74000},
        [13035] = {rewardMoney = 74000},
        [13037] = {rewardMoney = 74000},
        [13038] = {rewardMoney = 74000},
        [13039] = {rewardMoney = 68000},
        [13040] = {rewardMoney = 68000},
        [13041] = {rewardMoney = 57000},
        [13042] = {rewardMoney = 74000},
        [13043] = {rewardMoney = 148000},
        [13045] = {rewardMoney = 136000},
        [13046] = {rewardMoney = 74000},
        [13047] = {rewardMoney = 222000},
        [13048] = {rewardMoney = 74000},
        [13049] = {rewardMoney = 74000},
        [13050] = {rewardMoney = 74000},
        [13051] = {rewardMoney = 37000},
        [13054] = {rewardMoney = 37000},
        [13055] = {rewardMoney = 74000},
        [13056] = {rewardMoney = 74000},
        [13058] = {rewardMoney = 148000},
        [13059] = {rewardMoney = 148000},
        [13060] = {rewardMoney = 6800},
        [13061] = {rewardMoney = 7200},
        [13063] = {rewardMoney = 37000},
        [13064] = {rewardMoney = 58000},
        [13068] = {rewardMoney = 7400},
        [13069] = {rewardMoney = 74000},
        [13071] = {rewardMoney = 37000},
        [13072] = {rewardMoney = 74000},
        [13073] = {rewardMoney = 58000},
        [13074] = {rewardMoney = 74000},
        [13075] = {rewardMoney = 74000},
        [13076] = {rewardMoney = 7400},
        [13077] = {rewardMoney = 58000},
        [13078] = {rewardMoney = 74000},
        [13079] = {rewardMoney = 74000},
        [13080] = {rewardMoney = 7400},
        [13081] = {rewardMoney = 58000},
        [13082] = {rewardMoney = 74000},
        [13083] = {rewardMoney = 222000},
        [13084] = {rewardMoney = 74000},
        [13087] = {rewardMoney = 57000},
        [13088] = {rewardMoney = 57000},
        [13089] = {rewardMoney = 57000},
        [13090] = {rewardMoney = 57000},
        [13091] = {rewardMoney = 74000},
        [13092] = {rewardMoney = 74000},
        [13094] = {rewardMoney = 188000},
        [13095] = {rewardMoney = 188000},
        [13100] = {rewardMoney = 71000},
        [13101] = {rewardMoney = 86000},
        [13102] = {rewardMoney = 86000},
        [13103] = {rewardMoney = 86000},
        [13104] = {
            description = "The Vanguard is secure, ally. We have reclaimed the Valley of Echoes and taken " ..
                "down the web walls blocking entry to the Breach. Now is the time to strike at " ..
                "Scourgeholme and establish our presence inside Icecrown. The battlefront moves on!\n\nI " ..
                "have asked the Ebon Watcher for his assistance with our assault upon Scourgeholme. His " ..
                "intimate knowledge of the Scourge will be invaluable in our effort.\n\nGo now and report " ..
                "to him at the tent outside of the Breach, northwest of here.",
        },
        [13106] = {rewardMoney = 7400},
        [13107] = {rewardMoney = 86000},
        [13112] = {rewardMoney = 86000},
        [13113] = {rewardMoney = 86000},
        [13114] = {rewardMoney = 86000},
        [13115] = {rewardMoney = 86000},
        [13116] = {rewardMoney = 86000},
        [13117] = {rewardMoney = 58000},
        [13119] = {rewardMoney = 74000},
        [13120] = {rewardMoney = 74000},
        [13121] = {rewardMoney = 74000},
        [13122] = {rewardMoney = 68000},
        [13124] = {rewardMoney = 296000},
        [13126] = {rewardMoney = 296000},
        [13127] = {rewardMoney = 296000},
        [13128] = {rewardMoney = 296000},
        [13129] = {rewardMoney = 224000},
        [13131] = {rewardMoney = 222000},
        [13132] = {rewardMoney = 296000},
        [13133] = {rewardMoney = 74000},
        [13134] = {rewardMoney = 74000},
        [13135] = {rewardMoney = 71000},
        [13136] = {rewardMoney = 74000},
        [13137] = {rewardMoney = 148000},
        [13138] = {rewardMoney = 74000},
        [13140] = {rewardMoney = 74000},
        [13141] = {rewardMoney = 71000},
        [13142] = {rewardMoney = 222000},
        [13143] = {rewardMoney = 74000},
        [13144] = {rewardMoney = 74000},
        [13145] = {rewardMoney = 74000},
        [13146] = {rewardMoney = 74000},
        [13147] = {rewardMoney = 74000},
        [13148] = {rewardMoney = 114000},
        [13149] = {rewardMoney = 296000},
        [13151] = {rewardMoney = 296000},
        [13152] = {rewardMoney = 74000},
        [13153] = {rewardMoney = 74000},
        [13154] = {rewardMoney = 74000},
        [13155] = {rewardMoney = 37000},
        [13156] = {rewardMoney = 74000},
        [13160] = {rewardMoney = 74000},
        [13161] = {rewardMoney = 148000},
        [13162] = {rewardMoney = 148000},
        [13163] = {rewardMoney = 148000},
        [13164] = {rewardMoney = 222000},
        [13166] = {rewardMoney = 25000},
        [13168] = {rewardMoney = 7400},
        [13169] = {rewardMoney = 74000},
        [13170] = {rewardMoney = 74000},
        [13171] = {rewardMoney = 74000},
        [13172] = {rewardMoney = 74000},
        [13174] = {rewardMoney = 74000},
        [13177] = {rewardMoney = 114000},
        [13178] = {rewardMoney = 114000},
        [13179] = {rewardMoney = 114000},
        [13180] = {rewardMoney = 114000},
        [13181] = {rewardMoney = 114000},
        [13183] = {rewardMoney = 114000},
        [13185] = {rewardMoney = 114000},
        [13186] = {rewardMoney = 114000},
        [13187] = {rewardMoney = 248000},
        [13191] = {rewardMoney = 74000},
        [13192] = {rewardMoney = 74000},
        [13193] = {rewardMoney = 74000},
        [13194] = {rewardMoney = 74000},
        [13195] = {rewardMoney = 74000},
        [13196] = {rewardMoney = 74000},
        [13197] = {rewardMoney = 74000},
        [13198] = {rewardMoney = 74000},
        [13199] = {rewardMoney = 74000},
        [13200] = {rewardMoney = 74000},
        [13201] = {rewardMoney = 74000},
        [13202] = {rewardMoney = 74000},
        [13206] = {rewardMoney = 188000},
        [13207] = {rewardMoney = 272000},
        [13211] = {rewardMoney = 74000},
        [13212] = {rewardMoney = 74000},
        [13214] = {rewardMoney = 222000},
        [13215] = {rewardMoney = 222000},
        [13216] = {rewardMoney = 222000},
        [13217] = {rewardMoney = 222000},
        [13218] = {rewardMoney = 222000},
        [13219] = {rewardMoney = 222000},
        [13220] = {rewardMoney = 74000},
        [13221] = {rewardMoney = 74000},
        [13222] = {rewardMoney = 114000},
        [13223] = {rewardMoney = 114000},
        [13228] = {rewardMoney = 74000},
        [13229] = {rewardMoney = 74000},
        [13230] = {rewardMoney = 74000},
        [13231] = {rewardMoney = 74000},
        [13232] = {rewardMoney = 74000},
        [13233] = {rewardMoney = 74000},
        [13234] = {rewardMoney = 74000},
        [13235] = {rewardMoney = 148000},
        [13237] = {rewardMoney = 74000},
        [13238] = {rewardMoney = 7400},
        [13239] = {rewardMoney = 74000},
        [13259] = {rewardMoney = 74000},
        [13261] = {rewardMoney = 74000},
        [13262] = {rewardMoney = 7400},
        [13263] = {rewardMoney = 7400},
        [13264] = {rewardMoney = 74000},
        [13273] = {rewardMoney = 74000},
        [13274] = {rewardMoney = 74000},
        [13275] = {rewardMoney = 58000},
        [13276] = {rewardMoney = 74000},
        [13277] = {rewardMoney = 148000},
        [13278] = {rewardMoney = 148000},
        [13279] = {rewardMoney = 74000},
        [13280] = {rewardMoney = 74000},
        [13281] = {rewardMoney = 222000},
        [13282] = {rewardMoney = 37000},
        [13283] = {rewardMoney = 74000},
        [13284] = {rewardMoney = 74000},
        [13285] = {rewardMoney = 148000},
        [13287] = {rewardMoney = 74000},
        [13288] = {rewardMoney = 74000},
        [13289] = {rewardMoney = 74000},
        [13291] = {rewardMoney = 74000},
        [13292] = {rewardMoney = 74000},
        [13294] = {rewardMoney = 148000},
        [13295] = {rewardMoney = 74000},
        [13297] = {rewardMoney = 222000},
        [13298] = {rewardMoney = 222000},
        [13300] = {rewardMoney = 74000},
        [13301] = {rewardMoney = 74000},
        [13302] = {rewardMoney = 74000},
        [13304] = {rewardMoney = 74000},
        [13305] = {rewardMoney = 74000},
        [13306] = {rewardMoney = 74000},
        [13307] = {rewardMoney = 74000},
        [13308] = {rewardMoney = 148000},
        [13309] = {rewardMoney = 74000},
        [13310] = {rewardMoney = 74000},
        [13312] = {rewardMoney = 148000},
        [13313] = {rewardMoney = 74000},
        [13314] = {rewardMoney = 74000},
        [13315] = {rewardMoney = 58000},
        [13316] = {rewardMoney = 148000},
        [13318] = {rewardMoney = 74000},
        [13319] = {rewardMoney = 74000},
        [13320] = {rewardMoney = 74000},
        [13321] = {rewardMoney = 74000},
        [13322] = {rewardMoney = 74000},
        [13323] = {rewardMoney = 74000},
        [13328] = {rewardMoney = 74000},
        [13329] = {rewardMoney = 74000},
        [13330] = {rewardMoney = 74000},
        [13331] = {rewardMoney = 74000},
        [13332] = {rewardMoney = 74000},
        [13333] = {rewardMoney = 74000},
        [13334] = {rewardMoney = 74000},
        [13335] = {rewardMoney = 74000},
        [13336] = {rewardMoney = 74000},
        [13337] = {rewardMoney = 148000},
        [13338] = {rewardMoney = 148000},
        [13339] = {rewardMoney = 74000},
        [13340] = {rewardMoney = 19000},
        [13341] = {rewardMoney = 19000},
        [13342] = {rewardMoney = 74000},
        [13343] = {rewardMoney = 148000},
        [13344] = {rewardMoney = 74000},
        [13345] = {rewardMoney = 74000},
        [13346] = {rewardMoney = 222000},
        [13348] = {rewardMoney = 37000},
        [13349] = {rewardMoney = 74000},
        [13350] = {rewardMoney = 222000},
        [13351] = {rewardMoney = 58000},
        [13352] = {rewardMoney = 74000},
        [13353] = {rewardMoney = 74000},
        [13354] = {rewardMoney = 74000},
        [13355] = {rewardMoney = 74000},
        [13356] = {rewardMoney = 74000},
        [13357] = {rewardMoney = 74000},
        [13358] = {rewardMoney = 74000},
        [13359] = {rewardMoney = 74000},
        [13360] = {rewardMoney = 19000},
        [13361] = {rewardMoney = 148000},
        [13364] = {rewardMoney = 222000},
        [13365] = {rewardMoney = 74000},
        [13366] = {rewardMoney = 74000},
        [13367] = {rewardMoney = 222000},
        [13368] = {rewardMoney = 222000},
        [13373] = {rewardMoney = 74000},
        [13375] = {rewardMoney = 296000},
        [13376] = {rewardMoney = 148000},
        [13377] = {rewardMoney = 224000},
        [13378] = {rewardMoney = 7400},
        [13379] = {rewardMoney = 7400},
        [13380] = {rewardMoney = 74000},
        [13382] = {rewardMoney = 148000},
        [13383] = {rewardMoney = 7400},
        [13385] = {rewardMoney = 296000},
        [13387] = {rewardMoney = 74000},
        [13388] = {rewardMoney = 7400},
        [13389] = {rewardMoney = 7400},
        [13391] = {rewardMoney = 58000},
        [13392] = {rewardMoney = 37000},
        [13393] = {rewardMoney = 74000},
        [13394] = {rewardMoney = 74000},
        [13396] = {rewardMoney = 37000},
        [13397] = {rewardMoney = 74000},
        [13398] = {rewardMoney = 74000},
        [13399] = {rewardMoney = 19000},
        [13400] = {rewardMoney = 148000},
        [13403] = {rewardMoney = 222000},
        [13404] = {rewardMoney = 74000},
        [13406] = {rewardMoney = 74000},
        [13408] = {rewardMoney = 7000},
        [13409] = {rewardMoney = 7000},
        [13410] = {rewardMoney = 7000},
        [13411] = {rewardMoney = 7000},
        [13412] = {rewardMoney = 19000},
        [13413] = {rewardMoney = 148000},
        [13414] = {rewardMoney = 74000},
        [13415] = {rewardMoney = 37000},
        [13416] = {rewardMoney = 37000},
        [13418] = {rewardMoney = 19000},
        [13419] = {rewardMoney = 19000},
        [13420] = {rewardMoney = 65000},
        [13421] = {rewardMoney = 65000},
        [13422] = {rewardMoney = 55000},
        [13423] = {rewardMoney = 74000},
        [13424] = {rewardMoney = 74000},
        [13425] = {rewardMoney = 74000},
        [13426] = {rewardMoney = 7400},
        [13430] = {
            description = "Four trials you must pass before you are deemed worthy by the naaru.\n\nOnly " ..
                "one obstacle remains, mortal. Gather an army and travel to the lair of Magtheridon, deep " ..
                "inside Hellfire Citadel. Battle your way to the heart of the chamber and destroy the " ..
                "foul corrupter!",
            rewardItems = {{31746, 1}},
            rewardMoney = 132000,
        },
        [13432] = {rewardMoney = 132000},
        [13481] = {rewardMoney = 74000},
        [13482] = {rewardMoney = 74000},
        [13504] = {rewardMoney = 600},
        [13505] = {rewardMoney = 600},
        [13506] = {rewardMoney = 600},
        [13507] = {rewardMoney = 600},
        [13508] = {rewardMoney = 600},
        [13509] = {rewardMoney = 600},
        [13510] = {rewardMoney = 600},
        [13511] = {rewardMoney = 600},
        [13512] = {rewardMoney = 600},
        [13513] = {rewardMoney = 600},
        [13514] = {rewardMoney = 1300},
        [13515] = {rewardMoney = 1300},
        [13518] = {rewardMoney = 350},
        [13519] = {rewardMoney = 600},
        [13520] = {rewardMoney = 350},
        [13521] = {rewardMoney = 350},
        [13522] = {rewardMoney = 350},
        [13523] = {rewardMoney = 600},
        [13526] = {rewardMoney = 1100},
        [13527] = {rewardMoney = 400},
        [13528] = {rewardMoney = 400},
        [13529] = {rewardMoney = 400},
        [13537] = {rewardMoney = 400},
        [13538] = {rewardMoney = 114000},
        [13539] = {rewardMoney = 114000},
        [13542] = {rewardMoney = 700},
        [13544] = {rewardMoney = 1100},
        [13545] = {rewardMoney = 1100},
        [13546] = {rewardMoney = 1100},
        [13549] = {rewardMoney = 65000},
        [13554] = {rewardMoney = 400},
        [13557] = {rewardMoney = 400},
        [13558] = {rewardMoney = 1600},
        [13560] = {rewardMoney = 600},
        [13561] = {rewardMoney = 400},
        [13562] = {rewardMoney = 400},
        [13563] = {rewardMoney = 400},
        [13564] = {rewardMoney = 400},
        [13565] = {rewardMoney = 500},
        [13566] = {rewardMoney = 500},
        [13569] = {rewardMoney = 500},
        [13570] = {rewardMoney = 700},
        [13572] = {rewardMoney = 1100},
        [13576] = {rewardMoney = 700},
        [13578] = {rewardMoney = 900},
        [13579] = {rewardMoney = 70},
        [13580] = {rewardMoney = 900},
        [13582] = {rewardMoney = 700},
        [13584] = {rewardMoney = 800},
        [13588] = {rewardMoney = 900},
        [13589] = {rewardMoney = 400},
        [13590] = {rewardMoney = 600},
        [13591] = {rewardMoney = 1400},
        [13592] = {rewardMoney = 74000},
        [13594] = {rewardMoney = 1300},
        [13596] = {rewardMoney = 600},
        [13598] = {rewardMoney = 500},
        [13599] = {rewardMoney = 350},
        [13600] = {rewardMoney = 74000},
        [13602] = {rewardMoney = 1300},
        [13603] = {rewardMoney = 74000},
        [13604] = {rewardMoney = 222000},
        [13605] = {rewardMoney = 1400},
        [13606] = {rewardMoney = 296000},
        [13607] = {rewardMoney = 148000},
        [13609] = {rewardMoney = 296000},
        [13610] = {rewardMoney = 296000},
        [13611] = {rewardMoney = 296000},
        [13612] = {rewardMoney = 1300},
        [13613] = {rewardMoney = 1300},
        [13614] = {rewardMoney = 296000},
        [13615] = {rewardMoney = 1300},
        [13616] = {rewardMoney = 74000},
        [13618] = {rewardMoney = 1300},
        [13619] = {rewardMoney = 1300},
        [13620] = {rewardMoney = 125},
        [13621] = {rewardMoney = 2500},
        [13624] = {rewardMoney = 1300},
        [13625] = {rewardMoney = 58000},
        [13626] = {rewardMoney = 1300},
        [13628] = {rewardMoney = 1300},
        [13629] = {rewardMoney = 222000},
        [13630] = {rewardMoney = 1300},
        [13631] = {rewardMoney = 296000},
        [13632] = {rewardMoney = 1300},
        [13633] = {rewardMoney = 74000},
        [13634] = {rewardMoney = 74000},
        [13635] = {rewardMoney = 300},
        [13636] = {rewardMoney = 400},
        [13639] = {rewardMoney = 600},
        [13640] = {rewardMoney = 1300},
        [13641] = {rewardMoney = 74000},
        [13642] = {rewardMoney = 1300},
        [13643] = {rewardMoney = 74000},
        [13644] = {rewardMoney = 3000},
        [13647] = {rewardMoney = 600},
        [13648] = {rewardMoney = 1000},
        [13650] = {rewardMoney = 800},
        [13651] = {rewardMoney = 1300},
        [13653] = {rewardMoney = 1000},
        [13654] = {rewardMoney = 74000},
        [13655] = {rewardMoney = 1600},
        [13656] = {rewardMoney = 1600},
        [13657] = {rewardMoney = 1600},
        [13658] = {rewardMoney = 1600},
        [13659] = {rewardMoney = 1800},
        [13660] = {rewardMoney = 1600},
        [13661] = {rewardMoney = 2000},
        [13663] = {rewardMoney = 74000},
        [13664] = {rewardMoney = 148000},
        [13665] = {rewardMoney = 74000},
        [13666] = {rewardMoney = 58000},
        [13667] = {rewardMoney = 7400},
        [13668] = {rewardMoney = 7400},
        [13669] = {rewardMoney = 58000},
        [13670] = {rewardMoney = 58000},
        [13671] = {rewardMoney = 58000},
        [13672] = {rewardMoney = 7400},
        [13673] = {rewardMoney = 58000},
        [13674] = {rewardMoney = 58000},
        [13675] = {rewardMoney = 58000},
        [13676] = {rewardMoney = 58000},
        [13677] = {rewardMoney = 58000},
        [13678] = {rewardMoney = 7400},
        [13679] = {rewardMoney = 74000},
        [13680] = {rewardMoney = 74000},
        [13683] = {rewardMoney = 1300},
        [13684] = {rewardMoney = 7400},
        [13685] = {rewardMoney = 7400},
        [13688] = {rewardMoney = 7400},
        [13689] = {rewardMoney = 7400},
        [13690] = {rewardMoney = 7400},
        [13691] = {rewardMoney = 7400},
        [13693] = {rewardMoney = 7400},
        [13694] = {rewardMoney = 7400},
        [13695] = {rewardMoney = 7400},
        [13696] = {rewardMoney = 7400},
        [13697] = {rewardMoney = 74000},
        [13698] = {rewardMoney = 2500},
        [13699] = {rewardMoney = 74000},
        [13702] = {rewardMoney = 148000},
        [13712] = {rewardMoney = 1000},
        [13713] = {rewardMoney = 74000},
        [13714] = {rewardMoney = 74000},
        [13715] = {rewardMoney = 74000},
        [13716] = {rewardMoney = 74000},
        [13717] = {rewardMoney = 74000},
        [13718] = {rewardMoney = 74000},
        [13719] = {rewardMoney = 74000},
        [13720] = {rewardMoney = 74000},
        [13721] = {rewardMoney = 74000},
        [13722] = {rewardMoney = 74000},
        [13723] = {rewardMoney = 74000},
        [13724] = {rewardMoney = 74000},
        [13725] = {rewardMoney = 74000},
        [13726] = {rewardMoney = 74000},
        [13727] = {rewardMoney = 74000},
        [13728] = {rewardMoney = 74000},
        [13729] = {rewardMoney = 74000},
        [13730] = {rewardMoney = 1300},
        [13731] = {rewardMoney = 74000},
        [13732] = {rewardMoney = 148000},
        [13733] = {rewardMoney = 148000},
        [13734] = {rewardMoney = 148000},
        [13735] = {rewardMoney = 148000},
        [13736] = {rewardMoney = 148000},
        [13737] = {rewardMoney = 148000},
        [13738] = {rewardMoney = 148000},
        [13739] = {rewardMoney = 148000},
        [13740] = {rewardMoney = 148000},
        [13741] = {rewardMoney = 74000},
        [13742] = {rewardMoney = 74000},
        [13743] = {rewardMoney = 74000},
        [13744] = {rewardMoney = 74000},
        [13745] = {rewardMoney = 74000},
        [13746] = {rewardMoney = 74000},
        [13747] = {rewardMoney = 74000},
        [13748] = {rewardMoney = 74000},
        [13749] = {rewardMoney = 74000},
        [13750] = {rewardMoney = 74000},
        [13751] = {rewardMoney = 350},
        [13752] = {rewardMoney = 74000},
        [13753] = {rewardMoney = 74000},
        [13754] = {rewardMoney = 74000},
        [13755] = {rewardMoney = 74000},
        [13756] = {rewardMoney = 74000},
        [13757] = {rewardMoney = 74000},
        [13758] = {rewardMoney = 74000},
        [13759] = {rewardMoney = 74000},
        [13760] = {rewardMoney = 74000},
        [13761] = {rewardMoney = 74000},
        [13762] = {rewardMoney = 74000},
        [13763] = {rewardMoney = 74000},
        [13764] = {rewardMoney = 74000},
        [13765] = {rewardMoney = 74000},
        [13766] = {rewardMoney = 1300},
        [13767] = {rewardMoney = 74000},
        [13768] = {rewardMoney = 74000},
        [13769] = {rewardMoney = 74000},
        [13770] = {rewardMoney = 74000},
        [13771] = {rewardMoney = 74000},
        [13772] = {rewardMoney = 74000},
        [13773] = {rewardMoney = 74000},
        [13774] = {rewardMoney = 74000},
        [13775] = {rewardMoney = 74000},
        [13776] = {rewardMoney = 74000},
        [13777] = {rewardMoney = 74000},
        [13778] = {rewardMoney = 74000},
        [13779] = {rewardMoney = 74000},
        [13780] = {rewardMoney = 74000},
        [13781] = {rewardMoney = 74000},
        [13782] = {rewardMoney = 74000},
        [13783] = {rewardMoney = 74000},
        [13784] = {rewardMoney = 74000},
        [13785] = {rewardMoney = 74000},
        [13786] = {rewardMoney = 74000},
        [13787] = {rewardMoney = 74000},
        [13792] = {rewardMoney = 1300},
        [13794] = {rewardMoney = 7400},
        [13795] = {rewardMoney = 7400},
        [13796] = {rewardChoices = {{56636, 1}, {56637, 1}, {56638, 1}}, rewardMoney = 2500},
        [13797] = {rewardMoney = 1100},
        [13798] = {rewardChoices = {{56711, 1}, {56712, 1}, {56713, 1}, {56714, 1}}, rewardMoney = 1400},
        [13801] = {rewardMoney = 1300},
        [13803] = {rewardMoney = 700},
        [13805] = {rewardChoices = {{56727, 1}, {56728, 1}, {56729, 1}}, rewardMoney = 1400},
        [13806] = {rewardMoney = 1400},
        [13808] = {rewardMoney = 700},
        [13809] = {
            rewardChoices = {{46114, 1}, {45724, 1}},
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
        },
        [13810] = {rewardChoices = {{46114, 1}, {45724, 1}}},
        [13811] = {rewardChoices = {{46114, 1}, {45724, 1}}},
        [13812] = {
            rewardChoices = {{46114, 1}, {45724, 1}},
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
        },
        [13813] = {rewardChoices = {{46114, 1}, {45724, 1}}},
        [13814] = {rewardChoices = {{46114, 1}, {45724, 1}}},
        [13815] = {rewardMoney = 1400},
        [13816] = {rewardMoney = 148000},
        [13817] = {rewardMoney = 222000},
        [13818] = {rewardItems = {{45798, 1}, {45878, 1}}, rewardMoney = 296000},
        [13819] = {rewardChoices = {{45588, 1}, {45618, 1}, {45608, 1}, {45614, 1}}, rewardMoney = 296000},
        [13821] = {rewardMoney = 296000},
        [13822] = {rewardMoney = 296000},
        [13823] = {rewardMoney = 296000},
        [13824] = {rewardMoney = 296000},
        [13828] = {rewardMoney = 37000},
        [13829] = {rewardMoney = 37000},
        [13830] = {rewardItems = {{46007, 1}}},
        [13831] = {rewardMoney = 400},
        [13832] = {rewardItems = {{46007, 1}}},
        [13833] = {rewardItems = {{46007, 1}}},
        [13834] = {rewardItems = {{46007, 1}}},
        [13835] = {rewardMoney = 37000},
        [13836] = {rewardItems = {{46007, 1}}},
        [13837] = {rewardMoney = 37000},
        [13838] = {rewardMoney = 37000},
        [13839] = {rewardMoney = 37000},
        [13841] = {rewardMoney = 350},
        [13842] = {rewardChoices = {{56708, 1}, {56710, 1}, {56709, 1}}},
        [13844] = {rewardChoices = {{52591, 1}, {52607, 1}, {52623, 1}}, rewardMoney = 600},
        [13845] = {rewardMoney = 148000},
        [13847] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13848] = {rewardMoney = 1100},
        [13849] = {rewardMoney = 1500},
        [13850] = {rewardMoney = 8000},
        [13851] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13852] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13853] = {rewardChoices = {{56673, 1}, {56674, 1}, {56675, 1}}, rewardMoney = 3000},
        [13854] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13855] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13856] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13857] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13858] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13859] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13860] = {rewardItems = {{44987, 1}}, rewardMoney = 74000},
        [13861] = {rewardChoices = {{46114, 1}, {45724, 1}}, rewardMoney = 74000},
        [13862] = {rewardChoices = {{46114, 1}, {45724, 1}}, rewardMoney = 74000},
        [13863] = {rewardChoices = {{46114, 1}, {45724, 1}}, rewardMoney = 74000},
        [13864] = {rewardChoices = {{46114, 1}, {45724, 1}}, rewardMoney = 74000},
        [13865] = {rewardChoices = {{56724, 1}, {56725, 1}, {56726, 1}}, rewardMoney = 1400},
        [13866] = {rewardMoney = 900},
        [13867] = {rewardMoney = 1500},
        [13868] = {rewardMoney = 1500},
        [13869] = {rewardMoney = 1300},
        [13870] = {rewardMoney = 350},
        [13871] = {rewardChoices = {{56718, 1}, {56719, 1}, {56720, 1}}, rewardMoney = 1400},
        [13873] = {rewardMoney = 1100},
        [13874] = {rewardMoney = 1500},
        [13875] = {rewardChoices = {{56655, 1}, {56656, 1}, {56657, 1}}, rewardMoney = 1400},
        [13876] = {rewardChoices = {{56623, 1}, {56622, 1}}, rewardMoney = 3500},
        [13878] = {rewardChoices = {{59529, 1}, {59530, 1}}},
        [13879] = {rewardMoney = 150},
        [13880] = {rewardMoney = 1500},
        [13881] = {rewardMoney = 1000},
        [13882] = {rewardChoices = {{52590, 1}, {52612, 1}}, rewardMoney = 1000},
        [13883] = {rewardMoney = 1400},
        [13884] = {rewardMoney = 1500},
        [13885] = {rewardMoney = 1100},
        [13886] = {rewardChoices = {{56684, 1}, {56685, 1}, {56683, 1}}, rewardMoney = 3500},
        [13887] = {rewardMoney = 8000},
        [13888] = {rewardChoices = {{56687, 1}, {56688, 1}, {56686, 1}}, rewardMoney = 3500},
        [13889] = {rewardItems = {{47196, 1}}},
        [13890] = {rewardChoices = {{56715, 1}, {56716, 1}, {56717, 1}}, rewardMoney = 1400},
        [13891] = {rewardChoices = {{52618, 1}, {52628, 1}, {52660, 1}}, rewardMoney = 2000},
        [13892] = {rewardMoney = 1100},
        [13896] = {rewardMoney = 500},
        [13897] = {rewardChoices = {{52616, 1}, {52655, 1}}, rewardMoney = 3000},
        [13898] = {rewardChoices = {{52640, 1}, {52644, 1}, {52673, 1}}, rewardMoney = 1200},
        [13900] = {rewardChoices = {{52588, 1}, {52610, 1}, {52630, 1}, {55135, 1}}, rewardMoney = 3500},
        [13901] = {rewardMoney = 1400},
        [13902] = {rewardMoney = 100},
        [13903] = {rewardItems = {{47196, 1}}},
        [13904] = {rewardItems = {{47196, 1}}},
        [13905] = {rewardItems = {{47196, 1}}},
        [13906] = {rewardItems = {{46102, 1}}},
        [13907] = {rewardMoney = 1000},
        [13909] = {rewardMoney = 1000},
        [13910] = {rewardChoices = {{52594, 1}, {52663, 1}}, rewardMoney = 1000},
        [13911] = {rewardChoices = {{52592, 1}, {52600, 1}, {52671, 1}}, rewardMoney = 1000},
        [13912] = {rewardMoney = 1000},
        [13913] = {rewardMoney = 1800},
        [13914] = {rewardItems = {{47196, 1}}},
        [13915] = {rewardItems = {{47196, 1}}},
        [13916] = {rewardItems = {{47196, 1}}},
        [13917] = {rewardItems = {{47196, 1}}},
        [13918] = {rewardChoices = {{52657, 1}, {52653, 1}}, rewardMoney = 1000},
        [13920] = {rewardChoices = {{56721, 1}, {56722, 1}, {56723, 1}}, rewardMoney = 1400},
        [13922] = {rewardMoney = 1500},
        [13923] = {rewardMoney = 150},
        [13924] = {rewardChoices = {{56676, 1}, {56677, 1}, {56678, 1}}, rewardMoney = 3000},
        [13925] = {rewardMoney = 700},
        [13928] = {rewardMoney = 1500},
        [13935] = {rewardChoices = {{56670, 1}, {56671, 1}, {56672, 1}}, rewardMoney = 3000},
        [13942] = {rewardMoney = 1500},
        [13943] = {rewardChoices = {{56667, 1}, {56668, 1}, {56669, 1}}, rewardMoney = 1500},
        [13945] = {rewardMoney = 350},
        [13946] = {rewardMoney = 175},
        [13947] = {rewardChoices = {{56661, 1}, {56662, 1}, {56663, 1}}, rewardMoney = 1500},
        [13949] = {rewardChoices = {{59536, 1}, {59537, 1}, {59538, 1}}, rewardMoney = 500},
        [13953] = {rewardMoney = 500},
        [13958] = {rewardMoney = 800},
        [13961] = {rewardMoney = 500},
        [13963] = {rewardMoney = 350},
        [13967] = {rewardMoney = 1800},
        [13968] = {rewardChoices = {{59533, 1}, {59534, 1}, {59535, 1}}, rewardMoney = 1000},
        [13970] = {rewardMoney = 500},
        [13971] = {rewardChoices = {{59531, 1}, {59532, 1}}, rewardMoney = 1000},
        [13973] = {rewardMoney = 500},
        [13974] = {rewardMoney = 1200},
        [13975] = {rewardMoney = 600},
        [13979] = {rewardChoices = {{56704, 1}, {56705, 1}, {56703, 1}}, rewardMoney = 1800},
        [13980] = {rewardMoney = 1800},
        [13981] = {rewardMoney = 1800},
        [13982] = {rewardMoney = 2000},
        [13985] = {rewardMoney = 1800},
        [13987] = {rewardChoices = {{56689, 1}, {56690, 1}, {56691, 1}}, rewardMoney = 3500},
        [13988] = {rewardMoney = 400},
        [13989] = {rewardChoices = {{56706, 1}, {56707, 1}}, rewardMoney = 4000},
        [13992] = {rewardMoney = 600},
        [13995] = {rewardMoney = 600},
        [13997] = {rewardMoney = 296000},
        [13998] = {rewardChoices = {{59545, 1}, {59546, 1}}, rewardMoney = 1300},
        [13999] = {rewardMoney = 600},
        [14001] = {rewardMoney = 125},
        [14005] = {rewardChoices = {{49448, 1}, {49449, 1}, {49546, 1}, {49562, 1}}, rewardMoney = 700},
        [14006] = {rewardChoices = {{59548, 1}, {59547, 1}}, rewardMoney = 800},
        [14014] = {rewardMoney = 125},
        [14016] = {rewardMoney = 74000},
        [14017] = {rewardMoney = 74000},
        [14019] = {rewardChoices = {{52898, 1}, {52928, 1}, {52943, 1}}, rewardMoney = 125},
        [14021] = {rewardChoices = {{52944, 1}, {55885, 1}}, rewardMoney = 125},
        [14031] = {rewardMoney = 125},
        [14034] = {rewardMoney = 400},
        [14038] = {rewardMoney = 1600},
        [14039] = {rewardMoney = 400},
        [14042] = {rewardChoices = {{59558, 1}, {59559, 1}}, rewardMoney = 1600},
        [14050] = {rewardChoices = {{59560, 1}, {59561, 1}, {59562, 1}}, rewardMoney = 1600},
        [14056] = {rewardMoney = 1600},
        [14063] = {rewardChoices = {{59573, 1}, {59574, 1}, {59575, 1}, {59576, 1}}, rewardMoney = 1800},
        [14067] = {rewardChoices = {{59554, 1}, {59555, 1}}, rewardMoney = 1400},
        [14068] = {rewardChoices = {{59563, 1}, {59564, 1}, {59565, 1}}, rewardMoney = 800},
        [14069] = {rewardMoney = 15},
        [14070] = {rewardChoices = {{54296, 1}, {54297, 1}}, rewardMoney = 50},
        [14071] = {rewardChoices = {{54298, 1}, {54299, 1}, {54300, 1}}, rewardMoney = 50},
        [14072] = {rewardMoney = 350},
        [14074] = {rewardMoney = 74000},
        [14075] = {rewardChoices = {{54292, 1}, {54293, 1}}, rewardMoney = 15},
        [14076] = {rewardMoney = 74000},
        [14077] = {rewardMoney = 74000},
        [14078] = {rewardMoney = 15},
        [14080] = {rewardMoney = 74000},
        [14090] = {rewardMoney = 74000},
        [14091] = {rewardMoney = 35},
        [14092] = {rewardMoney = 74000},
        [14093] = {rewardItems = {{55004, 1}}, rewardMoney = 65},
        [14094] = {rewardItems = {{52040, 1}}, rewardMoney = 65},
        [14095] = {rewardMoney = 74000},
        [14096] = {rewardMoney = 74000},
        [14098] = {rewardMoney = 65},
        [14099] = {rewardMoney = 50},
        [14101] = {rewardMoney = 74000},
        [14102] = {rewardMoney = 74000},
        [14103] = {rewardMoney = 11400},
        [14104] = {rewardMoney = 74000},
        [14105] = {rewardMoney = 74000},
        [14107] = {rewardMoney = 74000},
        [14108] = {rewardMoney = 74000},
        [14109] = {rewardMoney = 50},
        [14110] = {rewardMoney = 50},
        [14112] = {rewardMoney = 74000},
        [14113] = {rewardMoney = 50},
        [14115] = {rewardChoices = {{54302, 1}, {54303, 1}}, rewardMoney = 75},
        [14117] = {rewardChoices = {{53416, 1}, {53448, 1}}, rewardMoney = 350},
        [14118] = {rewardMoney = 350},
        [14121] = {rewardMoney = 75},
        [14122] = {
            rewardChoices = {{54304, 1}, {54305, 1}, {54306, 1}},
            rewardItems = {{56148, 1}},
            rewardMoney = 75,
        },
        [14123] = {rewardMoney = 75},
        [14124] = {rewardMoney = 75},
        [14125] = {rewardChoices = {{54307, 1}, {54308, 1}, {54309, 1}}, rewardMoney = 100},
        [14128] = {rewardMoney = 350},
        [14130] = {rewardMoney = 700},
        [14131] = {rewardMoney = 900},
        [14132] = {rewardMoney = 900},
        [14136] = {rewardMoney = 58000},
        [14138] = {
            description = "With all of the troubles down in the Kaja'mine, Foreman Dampwick 's been going " ..
                "crazy trying to find you. He said something about some 'defiant trolls'.\n\nThe " ..
                "kaja'mite that our trolls are mining is critical ingredient in Kaja'Cola. That bubbly " ..
                "stuff is making us a fortune, and it's going to get you a promotion to Trade " ..
                "<Prince/Princess>!\n\nBut first, we have to get production flowing again. You'll find " ..
                "the foreman to the east. Here, give him this as an incentive to get his act together.",
        },
        [14140] = {rewardMoney = 74000},
        [14141] = {rewardMoney = 74000},
        [14142] = {rewardMoney = 74000},
        [14143] = {rewardMoney = 74000},
        [14144] = {rewardMoney = 74000},
        [14145] = {rewardMoney = 74000},
        [14152] = {rewardMoney = 58000},
        [14153] = {rewardMoney = 50},
        [14154] = {rewardChoices = {{54976, 1}, {55005, 1}, {55006, 1}}, rewardMoney = 75},
        [14155] = {rewardChoices = {{53400, 1}, {53407, 1}, {53452, 1}}, rewardMoney = 800},
        [14157] = {rewardMoney = 7},
        [14161] = {rewardMoney = 800},
        [14165] = {rewardMoney = 400},
        [14184] = {rewardMoney = 700},
        [14194] = {rewardChoices = {{53434, 1}, {53449, 1}}, rewardMoney = 800},
        [14197] = {rewardMoney = 400},
        [14198] = {rewardMoney = 6000},
        [14201] = {rewardMoney = 500},
        [14202] = {rewardMoney = 500},
        [14204] = {
            rewardChoices = {{54985, 1}, {54986, 1}, {58217, 1}},
            rewardItems = {{66247, 1}},
            rewardMoney = 75,
        },
        [14209] = {rewardMoney = 350},
        [14212] = {rewardMoney = 75},
        [14216] = {rewardChoices = {{53404, 1}, {53435, 1}}, rewardMoney = 500},
        [14218] = {rewardChoices = {{55009, 1}, {55010, 1}}, rewardMoney = 100},
        [14221] = {rewardMoney = 50},
        [14222] = {rewardMoney = 300},
        [14223] = {rewardMoney = 2500},
        [14226] = {rewardMoney = 1000},
        [14227] = {rewardMoney = 6000},
        [14230] = {rewardMoney = 1000},
        [14232] = {rewardMoney = 3000},
        [14234] = {rewardChoices = {{52902, 1}, {52931, 1}, {52948, 1}}},
        [14236] = {rewardChoices = {{52899, 1}, {52929, 1}, {52945, 1}}, rewardMoney = 125},
        [14238] = {rewardChoices = {{52900, 1}, {52930, 1}, {52946, 1}}, rewardMoney = 175},
        [14241] = {rewardChoices = {{52903, 1}, {52932, 1}, {52949, 1}}, rewardMoney = 175},
        [14242] = {rewardMoney = 85},
        [14243] = {rewardChoices = {{52901, 1}, {52947, 1}}, rewardMoney = 350},
        [14246] = {rewardMoney = 3000},
        [14249] = {rewardMoney = 1000},
        [14250] = {rewardMoney = 1000},
        [14251] = {rewardMoney = 3000},
        [14252] = {rewardMoney = 3000},
        [14253] = {rewardMoney = 3000},
        [14254] = {rewardMoney = 6000},
        [14257] = {rewardMoney = 6500},
        [14258] = {rewardItems = {{49042, 1}}, rewardMoney = 350},
        [14261] = {rewardMoney = 1100},
        [14262] = {rewardMoney = 600},
        [14263] = {rewardMoney = 1000},
        [14264] = {rewardMoney = 3000},
        [14265] = {rewardMoney = 35},
        [14268] = {rewardMoney = 3000},
        [14269] = {rewardMoney = 35},
        [14271] = {rewardMoney = 600},
        [14273] = {rewardMoney = 35},
        [14275] = {rewardMoney = 35},
        [14277] = {rewardMoney = 35},
        [14278] = {rewardMoney = 35},
        [14280] = {rewardMoney = 35},
        [14282] = {rewardMoney = 6500},
        [14285] = {
            description = "There's only so much I can teach right now with all these worgen trying to " ..
                "dismember us.\n\nWe really should think about heading south with the other survivors. " ..
                "We've been told that King Greymane is there.\n\nIf we stick together our chances of " ..
                "survival will increase... especially if you choose someone nutritious-looking to stand " ..
                "next to.",
            rewardMoney = 13,
        },
        [14286] = {rewardMoney = 13},
        [14287] = {rewardMoney = 13},
        [14288] = {rewardMoney = 13},
        [14289] = {rewardMoney = 13},
        [14290] = {rewardMoney = 13},
        [14291] = {rewardMoney = 13},
        [14293] = {rewardMoney = 35},
        [14294] = {rewardMoney = 7},
        [14295] = {rewardChoices = {{53440, 1}, {53441, 1}}, rewardMoney = 1100},
        [14296] = {rewardMoney = 1000},
        [14297] = {rewardMoney = 1100},
        [14299] = {rewardChoices = {{53401, 1}, {53420, 1}}, rewardMoney = 700},
        [14300] = {rewardMoney = 1000},
        [14301] = {rewardMoney = 6500},
        [14304] = {rewardMoney = 3500},
        [14305] = {rewardMoney = 3000},
        [14306] = {rewardMoney = 3000},
        [14307] = {rewardMoney = 3000},
        [14308] = {rewardMoney = 600},
        [14309] = {rewardMoney = 3000},
        [14310] = {rewardMoney = 600},
        [14313] = {rewardMoney = 50},
        [14314] = {rewardMoney = 3000},
        [14316] = {rewardMoney = 3000},
        [14320] = {rewardMoney = 100},
        [14321] = {rewardMoney = 100},
        [14322] = {rewardMoney = 300},
        [14324] = {rewardChoices = {{53438, 1}, {53445, 1}}, rewardMoney = 1800},
        [14325] = {rewardMoney = 3500},
        [14329] = {rewardMoney = 3500},
        [14332] = {rewardMoney = 3500},
        [14334] = {rewardMoney = 3500},
        [14335] = {rewardMoney = 3500},
        [14336] = {rewardMoney = 50},
        [14337] = {rewardMoney = 1700},
        [14338] = {rewardMoney = 1600},
        [14339] = {rewardMoney = 3500},
        [14340] = {rewardMoney = 700},
        [14341] = {rewardMoney = 800},
        [14342] = {rewardMoney = 3500},
        [14343] = {rewardMoney = 1700},
        [14345] = {rewardMoney = 700},
        [14346] = {rewardMoney = 3500},
        [14347] = {rewardChoices = {{54983, 1}, {54984, 1}}, rewardMoney = 100},
        [14348] = {rewardChoices = {{159, 1}, {30816, 1}}, rewardItems = {{2723, 1}}, rewardMoney = 100},
        [14354] = {rewardChoices = {{55952, 1}, {55953, 1}, {55951, 1}, {55954, 1}}, rewardMoney = 3000},
        [14357] = {rewardChoices = {{55942, 1}, {55943, 1}, {55944, 1}}},
        [14361] = {rewardMoney = 2500},
        [14362] = {rewardMoney = 3000},
        [14363] = {rewardMoney = 3000},
        [14364] = {rewardChoices = {{55926, 1}, {55925, 1}, {55924, 1}}, rewardMoney = 6000},
        [14366] = {rewardMoney = 75},
        [14367] = {rewardMoney = 65},
        [14368] = {rewardChoices = {{54981, 1}, {54982, 1}}, rewardMoney = 125},
        [14369] = {rewardChoices = {{54979, 1}, {54980, 1}}, rewardMoney = 125},
        [14370] = {rewardMoney = 600},
        [14371] = {rewardMoney = 600},
        [14372] = {rewardMoney = 350},
        [14373] = {rewardChoices = {{55930, 1}, {55931, 1}, {55932, 1}}, rewardMoney = 3500},
        [14374] = {rewardChoices = {{55936, 1}, {55937, 1}, {55938, 1}}, rewardMoney = 3500},
        [14377] = {rewardMoney = 400},
        [14378] = {rewardMoney = 3500},
        [14379] = {rewardMoney = 3500},
        [14380] = {rewardMoney = 1700},
        [14381] = {rewardChoices = {{55918, 1}, {55919, 1}, {55920, 1}}, rewardMoney = 3500},
        [14382] = {rewardChoices = {{55015, 1}, {58216, 1}}, rewardMoney = 125},
        [14383] = {rewardChoices = {{53417, 1}, {53446, 1}}, rewardMoney = 600},
        [14384] = {rewardMoney = 250},
        [14385] = {rewardMoney = 600},
        [14386] = {rewardChoices = {{55007, 1}, {55008, 1}}, rewardMoney = 100},
        [14387] = {rewardMoney = 250},
        [14388] = {rewardMoney = 1300},
        [14389] = {rewardMoney = 800},
        [14391] = {rewardMoney = 1100},
        [14392] = {rewardItems = {{53057, 1}}, rewardMoney = 2000},
        [14393] = {rewardMoney = 3500},
        [14394] = {rewardMoney = 7500},
        [14395] = {rewardChoices = {{118, 1}, {2455, 1}}, rewardMoney = 125},
        [14396] = {rewardMoney = 65},
        [14397] = {rewardMoney = 45},
        [14399] = {rewardMoney = 125},
        [14400] = {rewardMoney = 85},
        [14401] = {rewardChoices = {{55016, 1}, {55017, 1}}, rewardMoney = 125},
        [14402] = {rewardMoney = 85},
        [14403] = {rewardMoney = 85},
        [14404] = {rewardItems = {{52039, 1}}, rewardMoney = 125},
        [14405] = {rewardMoney = 85},
        [14406] = {rewardMoney = 17},
        [14407] = {rewardMoney = 450},
        [14410] = {rewardMoney = 2500},
        [14412] = {rewardChoices = {{55018, 1}, {55019, 1}}, rewardMoney = 125},
        [14413] = {rewardMoney = 700},
        [14416] = {rewardChoices = {{55020, 1}, {55021, 1}}, rewardMoney = 125},
        [14422] = {rewardMoney = 1300},
        [14423] = {rewardChoices = {{53405, 1}, {53427, 1}, {53447, 1}}, rewardMoney = 1000},
        [14424] = {rewardMoney = 400},
        [14430] = {rewardChoices = {{53414, 1}, {53426, 1}}, rewardMoney = 1000},
        [14431] = {rewardMoney = 900},
        [14432] = {rewardMoney = 450},
        [14433] = {rewardMoney = 900},
        [14434] = {rewardMoney = 50},
        [14435] = {rewardMoney = 1800},
        [14438] = {rewardItems = {{57204, 1}}, rewardMoney = 125},
        [14443] = {rewardMoney = 58000},
        [14444] = {rewardMoney = 74000},
        [14449] = {rewardMoney = 8},
        [14452] = {rewardChoices = {{57199, 1}, {57216, 1}, {57231, 1}}, rewardMoney = 35},
        [14455] = {rewardChoices = {{57200, 1}, {57217, 1}, {57232, 1}}, rewardMoney = 50},
        [14456] = {rewardChoices = {{57201, 1}, {57218, 1}, {57224, 1}}, rewardMoney = 50},
        [14457] = {
            description = "One of my contacts in the Underbelly caught sight of a Sunreaver agent buying " ..
                "reagents from a dealer in the Black Market area. The Sunreavers normally aren't known " ..
                "for their interest in what goes on down in the sewers, so that's a big indication that " ..
                "they're planning something.\n\nHead into the Underbelly, find this Sunreaver agent, and " ..
                "take care of him. Search the body for any information that might give us a lead on the " ..
                "location of that tome from Wyrmrest. We can't let them get it back to Icecrown first.",
            rewardMoney = 74000,
        },
        [14458] = {rewardMoney = 17},
        [14459] = {rewardChoices = {{57202, 1}, {57219, 1}}, rewardMoney = 75},
        [14460] = {rewardChoices = {{57203, 1}, {57220, 1}}, rewardItems = {{57792, 1}}, rewardMoney = 200},
        [14461] = {rewardMoney = 75},
        [14463] = {rewardMoney = 17},
        [14464] = {rewardChoices = {{53412, 1}, {53425, 1}}, rewardMoney = 1200},
        [14465] = {rewardMoney = 45},
        [14466] = {rewardMoney = 45},
        [14469] = {rewardItems = {{54213, 1}}},
        [14471] = {rewardChoices = {{53422, 1}, {53430, 1}, {53437, 1}}},
        [14473] = {rewardMoney = 125},
        [14477] = {rewardChoices = {{53444, 1}, {53408, 1}, {53424, 1}}, rewardMoney = 1200},
        [14480] = {rewardChoices = {{53418, 1}, {53453, 1}}},
        [14486] = {rewardChoices = {{53411, 1}, {53433, 1}}, rewardMoney = 1800},
        [14491] = {rewardChoices = {{57207, 1}, {57223, 1}, {57233, 1}}, rewardMoney = 175},
        [20438] = {rewardMoney = 74000},
        [20439] = {rewardMoney = 58000},
        [20441] = {rewardChoices = {{57206, 1}, {57222, 1}}},
        [24428] = {rewardChoices = {{49486, 1}, {49485, 1}, {49487, 1}}},
        [24429] = {rewardChoices = {{49486, 1}, {49485, 1}, {49487, 1}}},
        [24430] = {rewardMoney = 1200},
        [24431] = {rewardMoney = 74000},
        [24433] = {rewardMoney = 1200},
        [24436] = {rewardChoices = {{53410, 1}, {53419, 1}}},
        [24437] = {rewardMoney = 2500},
        [24438] = {rewardMoney = 225},
        [24439] = {rewardChoices = {{53442, 1}, {53443, 1}, {53451, 1}}, rewardMoney = 2500},
        [24440] = {rewardChoices = {{57205, 1}, {57221, 1}}},
        [24442] = {rewardMoney = 74000},
        [24448] = {rewardMoney = 3300},
        [24449] = {rewardChoices = {{53399, 1}, {53403, 1}, {53415, 1}, {53428, 1}}, rewardMoney = 3300},
        [24451] = {rewardMoney = 58000},
        [24452] = {rewardChoices = {{53429, 1}, {53432, 1}}, rewardMoney = 2300},
        [24453] = {rewardMoney = 300},
        [24454] = {rewardMoney = 37000},
        [24456] = {rewardChoices = {{57210, 1}, {57226, 1}, {57235, 1}}},
        [24458] = {rewardMoney = 500},
        [24459] = {rewardMoney = 22},
        [24461] = {rewardMoney = 74000},
        [24463] = {rewardMoney = 300},
        [24467] = {rewardChoices = {{53402, 1}, {53423, 1}}, rewardMoney = 2000},
        [24468] = {rewardChoices = {{54994, 1}, {54995, 1}}, rewardMoney = 225},
        [24469] = {rewardChoices = {{66922, 1}, {66923, 1}, {66926, 1}}, rewardMoney = 15},
        [24470] = {rewardChoices = {{66928, 1}, {66929, 1}, {66930, 1}}, rewardMoney = 35},
        [24471] = {rewardMoney = 35},
        [24472] = {rewardMoney = 225},
        [24473] = {rewardMoney = 3},
        [24474] = {rewardMoney = 35},
        [24475] = {rewardMoney = 35},
        [24476] = {rewardMoney = 74000},
        [24477] = {rewardMoney = 35},
        [24478] = {rewardMoney = 1000},
        [24479] = {rewardMoney = 1000},
        [24480] = {rewardMoney = 74000},
        [24484] = {rewardMoney = 225},
        [24486] = {rewardChoices = {{57530, 1}, {57531, 1}, {57532, 1}}, rewardMoney = 35},
        [24487] = {rewardMoney = 5},
        [24488] = {rewardMoney = 50},
        [24489] = {rewardMoney = 50},
        [24490] = {rewardMoney = 10},
        [24491] = {rewardMoney = 10},
        [24492] = {rewardItems = {{57540, 1}}, rewardMoney = 75},
        [24493] = {rewardMoney = 10},
        [24494] = {rewardMoney = 25},
        [24495] = {rewardMoney = 225},
        [24496] = {rewardMoney = 25},
        [24497] = {rewardMoney = 600},
        [24498] = {rewardMoney = 296000},
        [24499] = {rewardMoney = 296000},
        [24500] = {rewardMoney = 296000},
        [24501] = {rewardChoices = {{54996, 1}, {54997, 1}, {54998, 1}}, rewardMoney = 300},
        [24502] = {rewardMoney = 50},
        [24504] = {rewardMoney = 1400},
        [24506] = {rewardMoney = 19000},
        [24507] = {rewardMoney = 296000},
        [24510] = {rewardMoney = 19000},
        [24511] = {rewardMoney = 296000},
        [24512] = {rewardMoney = 2500},
        [24514] = {rewardMoney = 2500},
        [24515] = {rewardMoney = 3000},
        [24517] = {rewardMoney = 3000},
        [24518] = {rewardMoney = 2200},
        [24519] = {rewardMoney = 3000},
        [24522] = {rewardMoney = 7400},
        [24524] = {rewardChoices = {{57213, 1}, {57229, 1}, {57238, 1}, {57240, 1}}},
        [24525] = {rewardMoney = 3000},
        [24529] = {rewardMoney = 3000},
        [24534] = {rewardMoney = 3000},
        [24535] = {rewardMoney = 74000},
        [24539] = {rewardMoney = 3000},
        [24540] = {
            rewardChoices = {{57214, 1}, {57230, 1}, {57239, 1}, {57241, 1}},
            rewardItems = {{57793, 1}},
            rewardMoney = 350,
        },
        [24542] = {rewardMoney = 3000},
        [24543] = {rewardMoney = 2500},
        [24545] = {rewardMoney = 148000},
        [24546] = {rewardMoney = 3000},
        [24547] = {rewardMoney = 148000},
        [24548] = {rewardMoney = 148000},
        [24549] = {rewardItems = {{49623, 1}}, rewardMoney = 296000},
        [24551] = {rewardMoney = 3000},
        [24552] = {rewardMoney = 3500},
        [24554] = {rewardMoney = 58000},
        [24555] = {rewardMoney = 74000},
        [24556] = {rewardMoney = 74000},
        [24557] = {rewardMoney = 74000},
        [24558] = {rewardMoney = 37000},
        [24559] = {rewardMoney = 74000},
        [24560] = {rewardMoney = 74000},
        [24561] = {
            description = "You have re-forged and tempered the sword, yet it sits quietly in its sheath, " ..
                "little different from a mundane blade. You say the sword pulls you, as though it " ..
                "possesses a will?\n\nDare you bring it where it wishes to go? It is not right that the " ..
                "sword should be this silent and this insistent, yet I fear that if you do not take the " ..
                "sword to its destination, we will never learn why. Bear it with you to Icecrown " ..
                "Citadel's Halls of Reflection, but be on your guard. I will wait for you in The Frozen " ..
                "Halls.",
            rewardMoney = 74000,
        },
        [24562] = {
            description = "Take Quel'Delar to the Sunwell as quickly as possible, <name>. Trust in " ..
                "Uther's words when he says that you will not always be able to control the blade while " ..
                "it is subject to the evil of the Lich King's influence. You must travel to the Isle of " ..
                "Quel'Danas, and there, seek entry to the Sunwell itself, where you can cleanse the " ..
                "sword.\n\nThe guardians will try to stop you from entering the Sunwell Plateau, but make " ..
                "yourself known to Halduron Brightwing, who will be inspecting the guards there.",
            rewardMoney = 7400,
        },
        [24563] = {
            description = "You are the one working with Myralion Sunblaze, arent you? I know of a way we " ..
                "can test the sword.\n\nIf you know the blade's history, you recall that it was borne by " ..
                "Thalorien Dawnseeker in defense of the Sunwell against the Scourge. He fell in what is " ..
                "now the Dead Scar, buying time for his men to make their own preparations. You will find " ..
                "his remains near the southern end of the Dead Scar on this isle. Visit them, and if his " ..
                "spirit gives you its blessing, I will allow you to enter the Sunwell.",
            rewardMoney = 74000,
        },
        [24564] = {
            description = "The Sunwell and the end of Quel'Delar's exile await, <name>.\n\nYou will find " ..
                "Lor'themar Theron, the regent of Quel'Thalas, and Grand Magister Rommath standing " ..
                "within. Be wary and do not allow them to entrap you in their political " ..
                "scheming.\n\nInstead, remain focused on your task here. Speak to a Warden of the Sunwell " ..
                "when you are ready to enter the Sunwell. Immerse the reformed Quel'Delar in the Sunwell " ..
                "to complete the restoration. Afterward, show the blade to Myralion Sunblaze at " ..
                "Quel'Delar's Rest.",
        },
        [24565] = {rewardMoney = 3000},
        [24566] = {rewardMoney = 3000},
        [24567] = {
            description = "<name>, Coach Crosscheck is looking for you. He's the leader of our fearless " ..
                "footbomb team, the Bilgewater Buccaneers.\n\nHe says that the division title against the " ..
                "Steamwheedle Sharks is on the line and that you're the only one that can bring it home " ..
                "for us!\n\nHead west into town. You can't miss Kajaro Field.\n\nA footbomb star. This is " ..
                "going to be great for your image!",
        },
        [24569] = {rewardMoney = 3000},
        [24570] = {rewardMoney = 3000},
        [24571] = {rewardMoney = 3000},
        [24572] = {rewardMoney = 3500},
        [24573] = {rewardMoney = 3500},
        [24574] = {rewardMoney = 3000},
        [24575] = {
            description = "We recently found out that the villagers at Emberstone survived most of the " ..
                "ravages of the Curse.\n\nUnfortunately their village wasn't as fortunate when it came to " ..
                "the Forsaken invasion.\n\nThe Forsaken have taken the villagers prisoner and are forcing " ..
                "them to work the nearby mine as slaves.",
            rewardMoney = 350,
        },
        [24578] = {
            description = "It took a while, but I think I've put together what happened here. At least " ..
                "partially.\n\nThere were survivors of the Curse in this town. They joined others in the " ..
                "mountains, in Tempest's Reach.\n\nEveryone left, except the man who kept the journal, " ..
                "old man Bradshaw. He noticed that the worgen attacks had stopped all of a sudden and " ..
                "decided to venture into the Blackwald.\n\nThere is an abandoned mill just northeast of " ..
                "town, it was where Bradshaw lived. See if you can find any clues there.",
            rewardMoney = 110,
        },
        [24579] = {
            description = "Sartharion, the Onyx Guardian, watches over the eggs of the Twilight " ..
                "Dragonflight. He rests within the Obsidian Sanctum in the Chamber of the Aspects " ..
                "underneath Wyrmrest Temple.\n\nThe Council of Six has decreed that Sartharion must die!",
            rewardMoney = 296000,
        },
        [24580] = {
            description = "Anub'Rekhan, once-mighty Spider Lord of the nerubian empire, has been taken by " ..
                "the Lich King and corrupted into a state of undeath.\n\nNow a crypt lord, he sits in his " ..
                "parlor in the Arachnid Quarter of Naxxramas, spinning strategies for Kel'Thuzad.\n\nThe " ..
                "Council of Six has decreed that Anub'Rekhan must die!",
            rewardMoney = 296000,
        },
        [24581] = {
            description = "Noth the Plaguebringer, traitor and coward! Second only to the Lich King " ..
                "himself for the number of souls that have been Scourged!\n\nMake haste to Naxxramas. You " ..
                "will find him within the Plague Quarter hiding behind his undead minions.\n\nDestroy " ..
                "him! The Council of Six has decreed that Noth must die!",
            rewardMoney = 296000,
        },
        [24582] = {
            description = "Instructor Razuvious smugly struts about the Military Quarter of Naxxramas. It " ..
                "is said that only a death knight personally trained by him could possibly even withstand " ..
                "the prowess of his blade.\n\nYou and your group are going to prove everyone " ..
                "wrong.\n\nThe Council of Six has decreed that Razuvious must die!",
            rewardMoney = 296000,
        },
        [24583] = {
            description = "The so-called \"avatar of war\", Patchwerk is the ultimate abomination. It is " ..
                "also taking a heavy toll upon on our forces in the Dragonblight.\n\nI want you to " ..
                "assemble your companions and enter the Construct Quarter of Naxxramas. Disassemble the " ..
                "construct.\n\nThe Council of Six has decreed that Patchwerk must die!",
            rewardMoney = 296000,
        },
        [24584] = {
            description = "Our resources are strained. Malygos, the Spell-Weaver, is draining all of the " ..
                "magic out of the world, consolidating it in the Eye of Eternity. Without magic, we are " ..
                "doomed.\n\n<class>, the Nexus War must be brought to an end. The Council of Six has " ..
                "decreed that Malygos must die!",
            rewardMoney = 296000,
        },
        [24585] = {
            description = "Within the Formation Grounds sits Ulduar 's first line of defense: Flame " ..
                "Leviathan.\n\nThe Kirin Tor have been provided with information suggesting that this " ..
                "Keeper-created machine is soon to be transported to an undisclosed location and let " ..
                "loose to wreak havoc upon the mortals of Azeroth.\n\nThis must not come to pass. The " ..
                "Council of Six has decreed that Flame Leviathan must die!",
            rewardMoney = 296000,
        },
        [24586] = {
            description = "Razorscale normally keeps to her aerie near the Colossal Forge in Ulduar. Of " ..
                "late, however, she has been spotted raining fire down upon lands outside of the titan " ..
                "complex.\n\nThough the broodmother's is a sad tale, she poses an imminent threat to all " ..
                "of Northrend. The Council of Six has decreed that Razorscale must die!",
            rewardMoney = 296000,
        },
        [24587] = {
            description = "The great fire giant, Ignis the Furnace Master toils away inside of Ulduar 's " ..
                "Colossal Forge. Under orders from Loken, Ignis creates weapons that are terrifying in " ..
                "their power.\n\nThe Council of Six has decreed that Ignis must die!",
            rewardMoney = 296000,
        },
        [24588] = {
            description = "Yet another strange construct of Mimiron, the XT-002 Deconstructor actually " ..
                "thinks that it is the keeper's son. Do not be fooled by its feigned innocence. It is a " ..
                "deadly machine!\n\nYou will find the Deconstructor within Ulduar 's Scrapyard. The " ..
                "Council of Six has decreed that XT-002 Deconstructor must die!",
            rewardMoney = 296000,
        },
        [24589] = {
            description = "Archmage Timear has foreseen a horrible event, which is about to transpire. A " ..
                "foolish gnome warlock is about to accidentally summon an Eredar lord of the Burning " ..
                "Legion into the middle of the Trial of the Crusader.\n\nYou must be there when it " ..
                "happens, <class>. If Lord Jaraxxus escapes, he will open a portal and the Burning Legion " ..
                "will spill forth into our world once more.\n\nThe Council of Six has decreed that Lord " ..
                "Jaraxxus must die!",
            rewardMoney = 296000,
        },
        [24590] = {
            description = "Lord Marrowgar is the guardian of the Frozen Throne within the Spire Chamber. " ..
                "Pieced together by the Lich King from the bones of a thousand vanquished adventurers, " ..
                "Marrowgar wields the power of the throne itself.\n\nWithout the destruction of this bone " ..
                "wraith, there is no hope of taking Icecrown Citadel.\n\nThe Council of Six has decreed " ..
                "that Lord Marrowgar must die!",
            rewardMoney = 296000,
        },
        [24591] = {rewardMoney = 3500},
        [24592] = {
            description = "King Greymane has been taken prisoner by Lord Godfrey in Tempest's " ..
                "Reach!\n\nHe managed to convince two of the eastern lords to go with his plan. The fool " ..
                "seems to think he can strike a deal with the Forsaken by turning Greymane over to " ..
                "them.\n\nListen carefully, <name>. We need to resolve this with as little bloodshed as " ..
                "possible.\n\nThis potion will allow you to sneak in undetected. We need you to " ..
                "assassinate the traitorous lords before this gets out of hand!",
            rewardChoices = {{55002, 1}, {55003, 1}},
            rewardItems = {{58255, 1}},
            rewardMoney = 700,
        },
        [24593] = {
            description = "It is time, <name>. This... alchemy that has kept the beast inside you at bay " ..
                "will not last for long.\n\nThe first cursed worgen were night elf druids like our new " ..
                "allies. They, however, abandoned the balance that the rest of their kind embraced and " ..
                "allowed the beast to take over their minds.\n\nIt is only fitting that their brethren be " ..
                "the ones that deliver us from the Curse. Go, <class>. Drink from the waters of Tal'doren " ..
                "and make peace with yourself.",
            rewardChoices = {{52942, 1}, {66439, 1}, {66660, 1}, {66876, 1}},
            rewardMoney = 300,
        },
        [24594] = {
            description = "The Sunwell and the end of Quel'Delar's exile await, <name>.\n\nYou will find " ..
                "Lor'themar Theron, the regent of Quel'Thalas, and Grand Magister Rommath standing " ..
                "within. Be wary of them and do not allow them to entrap you in their political " ..
                "scheming.\n\nInstead, remain focused on your task here. Speak to a Warden of the Sunwell " ..
                "to enter the Sunwell Plateau. Immerse the reformed Quel'Delar in the Sunwell to complete " ..
                "the restoration. Show the blade to Myralion Sunblaze at Quel'Delar's Rest once it is " ..
                "restored.",
        },
        [24595] = {
            description = "I admit, I was skeptical that you had actually re-forged Quel'Delar and I did " ..
                "not expect Thalorien's spirit to reveal itself to you. You cannot understand what it " ..
                "means to my people that Quel'Delar has been recovered.\n\nAs promised, I will admit you " ..
                "to the Sunwell and you will find the leaders of Silvermoon within. Carry the sword to " ..
                "the chamber of the Sunwell and immerse it. Once the blade is restored, return with it to " ..
                "Caladis Brightspear at Quel'Delar's Rest.",
        },
        [24596] = {
            description = "The Sunwell and the end of Quel'Delar's exile await, <name>.\n\nYou will find " ..
                "Lor'themar Theron, the regent of Quel'Thalas, and Grand Magister Rommath standing " ..
                "within. Be wary of them and do not allow them to entrap you in their political " ..
                "scheming.\n\nInstead, remain focused on your task here. Immerse the reformed Quel'Delar " ..
                "in the Sunwell to complete the its restoration, then speak with Myralion Sunblaze at " ..
                "Quel'Delar's Rest. Speak to a Warden of the Sunwell when you are ready to enter the " ..
                "Sunwell Plateau.",
        },
        [24598] = {
            description = "The Sunwell and the end of Quel'Delar's exile await, <name>.\n\nYou will find " ..
                "Lor'themar Theron, the regent of Quel'Thalas, and Grand Magister Rommath standing " ..
                "within. Be wary of them and do not allow them to entrap you in their political " ..
                "scheming.\n\nInstead, remain focused on your task here. Immerse the reformed Quel'Delar " ..
                "in the Sunwell to complete its restoration, then show it to Myralio Sunblaze at " ..
                "Quel'Delar's Rest. Speak to a Warden of the Sunwell when you are ready to enter the " ..
                "Sunwell Plateau.",
        },
        [24601] = {rewardMoney = 3000},
        [24602] = {
            description = "In our hurried escape for safety, we disturbed the resting homes of our " ..
                "ancestors, <name>. A grave sin, if you'll pardon the pun.\n\nIt is tradition that a " ..
                "small memento be buried on top of a Gilnean's graveyard, beneath the shallow earth. The " ..
                "stampede of people fleeing these tunnels has unearthed these mementos and angered the " ..
                "spirits.\n\nFind them and bring them to me. We'll see to it that the dead return to " ..
                "their eternal slumber.",
            rewardMoney = 400,
        },
        [24603] = {rewardMoney = 3500},
        [24604] = {rewardMoney = 350},
        [24606] = {rewardMoney = 3500},
        [24607] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Nortet to the east.",
            rewardMoney = 25,
        },
        [24608] = {rewardMoney = 3500},
        [24616] = {
            description = "You must have many questions, <name>. And they will be answered in time.\n\nI " ..
                "know why you're here and what you're looking for.\n\nI can't lead you there with the " ..
                "enemy tracking you.\n\nOne of Sylvanas's scouts has been following your tracks. You " ..
                "can't lead the Forsaken to the place you seek. Take this talisman and walk along the " ..
                "road just north of here.\n\nLet the ranger lure you to her trap and use the power of the " ..
                "talisman to break free and counterattack.",
            rewardChoices = {{54999, 1}, {55000, 1}, {55001, 1}},
            rewardMoney = 300,
        },
        [24617] = {
            description = "There are others like you, <name>. And they too, were lost and " ..
                "confused.\n\nThere is a place where you belong.\n\nTal'doren, the wild home, was once " ..
                "home to an order of druids who took the shape of wolves.\n\nIt is there that you will " ..
                "find the answers you seek. It is also there that you will find someone who can offer " ..
                "guidance. An old friend.",
            rewardMoney = 300,
        },
        [24618] = {rewardMoney = 3500},
        [24619] = {rewardMoney = 3500},
        [24620] = {rewardMoney = 3500},
        [24621] = {rewardMoney = 3500},
        [24622] = {
            description = "If ya lookin' for something ta do, we need some more raptors moved over to da " ..
                "pens. If ya head over to da island south of here, you can be meetin' with our caretakers " ..
                "and dey can set ya up.\n\nDey might appreciate a hand too. Got ta be spreadin' da love, " ..
                "ya know?",
            rewardMoney = 25,
        },
        [24623] = {
            description = "I actually have somethin' really important dat I could use help with, if ya be " ..
                "willin', mon.\n\nOur hatchlins' are bein' stolen by someone on da next island. At first " ..
                "I thought dey were just runnin' away or that nature be claimin' dem, but we are missin' " ..
                "more than a dozen of da little guys now.\n\nPlease head to Zalazane's Fall to da " ..
                "northwest and point da little hatchlins back dis way. Poor tings.",
            rewardMoney = 50,
        },
        [24624] = {
            description = "The fiend who stole our raptors has been corruptin' dem with some kind of " ..
                "magic. Now dat dey've grown with dis corruption inside of them, I fear dere's little we " ..
                "can be doin' to save dem outside grantin' them da peace of death. Go ta Zalazane's Fall, " ..
                "northwest of here, an' see da task done.\n\nI hope ya can stomach dae work. I don't tink " ..
                "I could bring myself ta do da deed, even knowin' that it be needed.",
            rewardMoney = 50,
        },
        [24625] = {
            description = "I been investigatin' our corrupted Bloodtalons troubles and I think I've found " ..
                "da source. A lone naga. He was holdin' a red orb aloft over our hatchlings and I could " ..
                "see dem... changin'.\n\nI'm certain he tinks his thievery and spellcastin' have gone " ..
                "unnoticed, so ya should be able ta catch him unawares. Kill dis naga and bring me back " ..
                "dat vile orb - you'll be findin' him to da northwest, at Zalazane's Fall.",
            rewardChoices = {{52869, 1}, {52880, 1}, {52885, 1}},
            rewardMoney = 50,
        },
        [24626] = {
            description = "Ya be a good one, <name>.\n\nMoraya was askin' for new raptors ta train. We " ..
                "shouldn't keep her waitin' any longa! I have a few other recruits bringin' some over as " ..
                "well, but I have a special one dat I've been promisin' Moraya for a while.\n\nSwiftclaw " ..
                "be one of our fastest and bravest young raptors yet, but he can be a bit unruly. I'll " ..
                "lend ya da lasso, I just need ya to catch him somewhere on da island here and steer him " ..
                "over to da pens on da main isle. I doubt he'll be makin' it easy on ya though.",
            rewardChoices = {{52877, 1}, {52882, 1}},
            rewardMoney = 50,
        },
        [24627] = {
            description = "The night elves have taught us much during this time, <name>. They've taught " ..
                "us who we are and where we come from.\n\nThanks to them... thanks to this place... we're " ..
                "no longer mere beasts. We have regained free will.\n\nThe Forsaken aren't here for our " ..
                "land alone.\n\nThey're looking for something we possess. An artifact capable of " ..
                "uncontrollably spreading the Curse to all humanity. We cannot let them find " ..
                "it.\n\nSylvanas's banshees have come very close. Help my trackers take them out.",
            rewardMoney = 300,
        },
        [24628] = {
            description = "What you know as the Curse began as a heresy among our brethren.\n\nFaced with " ..
                "a losing battle against demonic forces, the Druids of the Pack eschewed the balance they " ..
                "were sworn to and allowed the beast to overtake them.\n\nThey were banished to the " ..
                "Emerald Dream where they live in eternal slumber under a tree identical to this one, but " ..
                "not before their curse spread to others.\n\nToday our ceremony will restore balance to " ..
                "your people. Bring me the leaf that grows only in Tal'doren's vicinity.",
            rewardMoney = 300,
        },
        [24631] = {rewardMoney = 3500},
        [24633] = {rewardMoney = 900},
        [24634] = {rewardMoney = 3500},
        [24637] = {rewardMoney = 7000},
        [24639] = {
            description = "Alright, mon. We start with da basics. I need ta know dat you know how ta " ..
                "swing dat weapon you're totin' around.\n\nGo thrash dose tiki targets. Take it slowly. " ..
                "Natural-like. I'll watch ya fighting form and we'll go from dere.",
            rewardMoney = 35,
        },
        [24640] = {
            description = "As ya get bettah' at fightin', you'll start to find new tings that ya nevah " ..
                "knew you could do.\n\nWanna see? Go, train up some, and learn someting new.\n\n'Den come " ..
                "back and ya can show me.",
            rewardMoney = 40,
        },
        [24641] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24642] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52876, 1}},
            rewardMoney = 50,
        },
        [24643] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24646] = {
            description = "Ever since the Forsaken invaded Gilneas, we've tried to keep the location of " ..
                "the Scythe of Elune secret. We moved it at night to one of many safe locations. The Dark " ..
                "Rangers got close, but never found it... until now.\n\nThey were last spotted at the " ..
                "Woods' End Cabin, west of here. Blow this horn when you find them and Tobias and his " ..
                "trackers will engage the Dark Rangers.\n\nOnly then will it be safe for you to venture " ..
                "inside the cabin and take back the scythe. Hurry, <name>. It must not reach Sylvanas.",
            rewardMoney = 200,
        },
        [24653] = {rewardMoney = 3500},
        [24654] = {rewardMoney = 3500},
        [24671] = {
            description = "Ridiculous! The greatest goblin mind of all time reduced to food detail? I " ..
                "made the Micro Mechachicken just for this reason and they let it get away!\n\n<Hobart " ..
                "turns a deeper shade of green as his blood pressure rises.>\n\nDo I look like I should " ..
                "be rounding up escaped cluckers? No, my friend, not I! Bamm most definitely, though he's " ..
                "too lazy.\n\nYour station in life has recently taken a turn for the worse. You do " ..
                "it!\n\nTake these remote control fireworks and attach them to the cluckers.",
            rewardChoices = {{52904, 1}, {52950, 1}},
            rewardItems = {{56149, 1}},
            rewardMoney = 175,
        },
        [24672] = {
            description = "I will do as Darius asked and have our people move through the " ..
                "Blackwald.\n\nYou ought to catch up with King Greymane. He and Krennan went into " ..
                "Tempest's Reach after Lord Godfrey confirmed survivors had made their dwelling " ..
                "there.\n\nFollow the road out of Stormglen into the mountains. I asked Krennan to wait " ..
                "for you at the bridge before Tempest's Reach.",
            rewardMoney = 200,
        },
        [24673] = {
            description = "It'll be a long time before our nation comes together again. The old political " ..
                "divisions pale in comparison to what divides us now.\n\nYet if there was ever a time for " ..
                "us to come together and unite against a common enemy, it is now. And it is you, <name>, " ..
                "who have proven able to bridge the gap between our people.\n\nReturn to Stormglen and " ..
                "tell them it is safe to go through the Blackwald on their way to Tempest's Reach. We " ..
                "will take care of any Forsaken who follow them.",
            rewardMoney = 150,
        },
        [24674] = {
            description = "I was one of the few that escaped, <name>. When the Forsaken took over our " ..
                "town and our mine, they treated us with utmost cruelty.\n\nThose of us who were weak and " ..
                "could not endure hard labor were worked to death by the abomination known as " ..
                "Brothogg.\n\nMy wife was among his victims, <class>, and I swore that one day her death " ..
                "would be avenged. I am too frail now, but you can deliver justice... for my wife... for " ..
                "Gilneas!",
            rewardChoices = {{54991, 1}, {54992, 1}, {54993, 1}},
            rewardMoney = 300,
        },
        [24675] = {
            description = "I'm not dumb, <name>. I know what's ahead of us.\n\nOur people are going to go " ..
                "through those gates and fight against an enemy that is better trained, has more numbers " ..
                "and better weapons than us.\n\nEven if we succeed, it'll be at a great cost. For most of " ..
                "us, today's meal will be the last.\n\nI cannot fight, but I sure can cook. Bring me meat " ..
                "from the stags that roam this area and I will ensure that the last meal these folks get " ..
                "will be their best.",
            rewardMoney = 350,
        },
        [24676] = {
            description = "The people are free, but the town is still occupied by the Forsaken. They're " ..
                "cut off from their main force, so if we're to drive them out, now's our chance.\n\nTheir " ..
                "leader, Executor Cornell, is known for his unbound ruthlessness. Also among them is " ..
                "Valnov the Mad, a so-called scientist who carries out inhuman experiments on villagers " ..
                "too old to work the mines.\n\nTake care of them all.",
            rewardMoney = 400,
        },
        [24677] = {
            description = "I thank you, <name>. We can't rest on our laurels, however.\n\nWe found out " ..
                "about a mining town, currently under Forsaken occupation. We sent some of my men, along " ..
                "with Crowley's daughter to the nearby livery stables to begin operations there. Liam " ..
                "should be joining them shortly.\n\nI'll stay here and organize the final push for " ..
                "Gilneas City. Speak to Lord Hewell to secure a horse to get you there.",
            rewardMoney = 175,
        },
        [24678] = {
            description = "It's time to pack it in, <name>. Most of our people have made it through -- " ..
                "it's your turn now.\n\nTake this torch, you're going to need it. The tunnel is full of " ..
                "nasty, knee-biting critters of the worst kind. Use it to keep them at bay.\n\nSpeak to " ..
                "Krennan on the other side.",
            rewardMoney = 400,
        },
        [24679] = {
            description = "You've done it, <name>. Even in these times we must honor our dead.\n\nTake " ..
                "these offerings and place them at Aderic's tomb.\n\nLet's hope that's enough to placate " ..
                "the ghosts of our ancestors.",
            rewardMoney = 400,
        },
        [24680] = {
            description = "We might've lost our city, but at least it looks like the dead have forgiven " ..
                "us.\n\nMeet with the rest of the survivors in Keel Harbor.\n\nI'm sure there's plenty to " ..
                "do before we're in the clear. Genn hasn't arrived yet, so I suppose Lord Crowley will be " ..
                "in charge there.",
            rewardMoney = 50,
        },
        [24681] = {
            description = "The night elves made good on their promise. They've brought ships and are " ..
                "ready to offer us sanctuary in their lands.\n\nUnfortunately, the Forsaken's allies have " ..
                "arrived as well.\n\nThe orcs are advancing upon us while the Horde gunship prevents the " ..
                "transport ships from taking our people to safety.\n\nThe druids are holding the enemy " ..
                "back, but won't last long. Fortunately, the elven ships were carrying siege weapons. " ..
                "Take one of the glaive throwers and meet the enemy head on.",
            rewardChoices = {{55012, 1}, {55013, 1}},
            rewardMoney = 1000,
        },
        [24682] = {
            description = "Quickly, through the portal! I'll find you on the other side.",
            rewardMoney = 19000,
        },
        [24683] = {
            description = "Quickly, through the portal! I'll meet you on the other side.",
            rewardMoney = 19000,
        },
        [24684] = {rewardMoney = 3500},
        [24685] = {rewardMoney = 3500},
        [24686] = {
            description = "The Bloodpetals of Un'Goro have a fascinating life cycle.\n\nThese trees in " ..
                "front of us bear seeds that fall down into the river when they mature. The river's " ..
                "current then takes the seed north of here, where the seed hatches - almost like an egg - " ..
                "and a newborn Bloodpetal emerges.\n\nI require these seeds for my studies. Take this " ..
                "net, and use it to scoop up the bright orange seeds in the river. You'll have to hunt " ..
                "them down under the water.",
            rewardMoney = 7500,
        },
        [24687] = {
            description = "You're already familiar with the first phase of the Bloodpetals' life cycle: " ..
                "the waterborne seed. The next phase, however, is not so docile: the pack of " ..
                "juveniles.\n\nWhen Bloodpetals hatch, they quickly form gangs and travel together, " ..
                "offsetting their weakness with overwhelming numbers. These packs of young lashers " ..
                "normally keep to themselves, but upset one of them and you upset them all.\n\nFor our " ..
                "safety and the safety of others, dispose of them. They roam close by, to the west and " ..
                "north.",
            rewardMoney = 22500,
        },
        [24689] = {
            description = "Ithis Moonwarden is the night elf druid who indoctrinated me into the Cenarion " ..
                "Circle. He has set up camp north of here, near the cliffs of the crater's easternmost " ..
                "edge. Follow the flow of the Bloodpetal seeds, and I'll wager you'll find him " ..
                "nearby.\n\nMy studies are limited only to seeds and other reagents, but he pursues more " ..
                "advanced matters. If you are curious to learn more about Un'Goro's flora, you should " ..
                "speak with him now.",
            rewardMoney = 800,
        },
        [24690] = {
            description = "I'm still a bit concerned about these fire elementals, <name>. One last " ..
                "request: head to the top of Fire Plume Ridge, and kill the one they call Blazerunner. " ..
                "He's the biggest and strongest of all the fire elementals in the crater. With him gone, " ..
                "I'll be able to sleep much better.",
            rewardChoices = {{53574, 1}, {53575, 1}, {53576, 1}},
            rewardMoney = 8000,
        },
        [24691] = {
            description = "Hey <bub/sweetie>, interested in making an extra dime?\n\nI've got it on good " ..
                "authority that some interested parties are paying BIG money for silithid legs. Yes, you " ..
                "heard me right, silithid legs! Apparently these things are delicious if you cook them " ..
                "right. They're like underground lobsters, and they live just south of here.\n\nThing is, " ..
                "I'll need a good amount of them to pay for my overhead. Think you could get me 8 dozen " ..
                "or so?",
            rewardMoney = 7500,
        },
        [24692] = {
            description = "If you're here to help, then maybe you can help us with a lurking " ..
                "threat.\n\nTo the south lies the Slithering Scar, a quivering silithid outpost in the " ..
                "middle of the jungle. You can't miss it.\n\nOne of my scouts reports that the silithid " ..
                "are harboring a young colossus in their large central underground chamber, and once it " ..
                "is fully grown, they plan to unleash it upon Un'Goro!\n\nThis must not be allowed to " ..
                "pass, <name>. Find the colossus and kill it.",
            rewardChoices = {{53577, 1}, {53578, 1}, {53579, 1}},
            rewardMoney = 32000,
        },
        [24693] = {
            description = "Here in Marshal's Stand, I can't really do too much profiteering without " ..
                "arousing suspicion from the scientists. There is, however, another place where I might " ..
                "have use of you.\n\nMy business associate, Gremix, has a camp northwest of here, on the " ..
                "opposite side of the volcano. He's a savvy business mind, and has a better eye for " ..
                "profit than even I do. I'm sure he could put you to work, if you'd like to make some " ..
                "more coin.",
            rewardMoney = 800,
        },
        [24694] = {
            description = "<As you look into the orb in front of you, you hear a voice.>\n\nThe crystal " ..
                "pylons have been activated. A sufficient number of crystals have been gathered. The " ..
                "prerequisites have been met. We are prepared for teleport to The Shaper's " ..
                "Terrace.\n\nSpeak to me when you are ready, <race>. We will consult with The Watcher.",
            rewardMoney = 6000,
        },
        [24695] = {
            description = "When my master Khaz'Goroth shaped the world you call Azeroth, he designed " ..
                "Un'Goro Crater to be an area for experimentation. You might call it the Titans' petri " ..
                "dish.\n\nIf you seek further knowledge about the methods in which we observe the world, " ..
                "pull the four levers behind me and complete my tests.",
            rewardChoices = {{53595, 1}, {53596, 1}, {53594, 1}},
            rewardMoney = 25000,
        },
        [24697] = {
            description = "I don't believe we've met... I'm Nolen Tacker, Marshal Expeditions' new chief " ..
                "of the guards. I'm also their chef. There's actually more overlap than you'd " ..
                "think.\n\nI've got a fun little task for you. Have you seen the spike pits around the " ..
                "perimeter of the camp? See if you can convince some of the nearby dinosaurs to walk into " ..
                "them. If you throw this rotten meat at them when they're not looking, it'll either make " ..
                "them hungry or angry. Either way is fine, as long as they follow you into the pit!",
            rewardChoices = {{53563, 1}, {53564, 1}, {53565, 1}},
            rewardMoney = 7500,
        },
        [24698] = {
            description = "Hey, you want to try my new diemetradon dogs? No? Raptor risotto? Pterrordax " ..
                "ptacos?\n\nFine. Oh, I just remembered! I have a friend nearby that might be able to use " ..
                "your assistance. His name is Spark Nilminer, and he's Marshal Expeditions' chief " ..
                "archaeology officer.\n\nHe's been sent out to Golakka Hot Springs, to the west. You'll " ..
                "likely find him on the springs' western shore.",
            rewardMoney = 800,
        },
        [24699] = {
            description = "Hey, I know! We've been looking at the wrong tar creatures.\n\nGremix once " ..
                "told me about a larger-than-normal tar creature that he ran into. It lurks around the " ..
                "tar pit far to the east of here, south of Fungal Rock. I'll bet that the bigger these " ..
                "creatures get, the stickier they get! We'll make some money yet, <name>!\n\nDon't forget " ..
                "the scraper!",
            rewardChoices = {{53592, 1}, {53593, 1}},
            rewardMoney = 16500,
        },
        [24700] = {
            description = "The Lakkari Tar Pits, just north of here, conceal a hidden treasure: rare " ..
                "flowers that grow at the bottom of the pits. These tarblossoms, as they're called, are " ..
                "valued for their beauty and their durability. It's been a while since I last harvested " ..
                "tarblossoms, so there should be some new plants growing at the bottom of the pits. Grab " ..
                "some for me?\n\nBy the way, good luck swimming in tar. It's nothing like swimming in " ..
                "water.",
            rewardMoney = 15500,
        },
        [24701] = {
            description = "A big part of making money is shamelessness. You have to be willing to profit " ..
                "off of the misfortune of others. It all ends up boiling down to one question: How much " ..
                "do you love money?\n\nWhen Marshal and his crew abandoned their refuge up to the north, " ..
                "they left behind lots of supplies. This stuff isn't rare, or even particularly valuable, " ..
                "but it's there if you're willing to take it. His camp is up in the cliffs, to the " ..
                "north.\n\nOh, and be on the lookout for whatever it was that made them leave...",
            rewardChoices = {{53580, 1}, {53581, 1}, {53582, 1}},
            rewardMoney = 16000,
        },
        [24702] = {objectivesText = {"Obtain 10 Bloodpetal Sprouts."}},
        [24703] = {
            description = "What ho, traveler! You must know that you set foot upon the camp of " ..
                "Maximillian of Northshire! Mayhap you have heard tales sung of my many exploits? I can " ..
                "see from the look in your eye that you have. That glint of recognition plays upon your " ..
                "visage like the White Lady's reflection o'er Stonecairne Lake.\n\nIt is clear to me that " ..
                "you seek adventure. As you seem able enough, and thoroughly well-intentioned, I would " ..
                "offer to make you my squire.",
            rewardMoney = 4000,
        },
        [24704] = {
            description = "This crater is filled with a malignant breed of dragon. Have you seen them? " ..
                "They wander all about, parading their spiky backs and lizardy faces all around the " ..
                "Crater.\n\nDon't let them fool you, squire, for these dragons are no minions of graceful " ..
                "Alexstrasza. They are clearly vicious, and direly in need of a hero's blade.\n\nI have " ..
                "decided that I will slay no less than 15 of them. As my squire, you must come along. " ..
                "Should we become separated, you may meet me back here at the Hot Springs.",
            rewardMoney = 8000,
        },
        [24705] = {
            description = "I've a feeling that we may find more than dragons here in this crater. My " ..
                "paladin's instinct tells me that there are townsfolk nearby that require our aid. Those " ..
                "in distress cannot be ignored.\n\nLet us sally forth, Squire <name>! The people of " ..
                "Un'Goro require our aid!",
            rewardMoney = 8000,
        },
        [24706] = {
            description = "A moment of seriousness now, <name>. We have an important quest ahead of us. " ..
                "The treacherous dragons that plague this valley will not cease their mischief until we " ..
                "destroy their repugnant brood mother. Before we even attempt to complete such a task, we " ..
                "must ask the Light for aid.\n\nI have seen the Light manifest itself nearby, in the form " ..
                "of Spirits floating by the shores of Golakka Hot Springs. Come, I must speak with them, " ..
                "and ask them for aid.",
            rewardMoney = 8000,
        },
        [24707] = {
            description = "The time we have waited for is upon us, Squire <name>. Un'Goro's brood mother " ..
                "will perish at my hands. The gravity of our task weighs heavily on me, but with the " ..
                "power of the Light behind us, we are guaranteed to succeed.\n\nAre you ready to depart?",
            rewardChoices = {{53598, 1}, {53599, 1}, {53597, 1}},
            rewardMoney = 33300,
        },
        [24708] = {
            description = "One of the things I hate the most about digging is the fact that half the " ..
                "time, all you find is dirt. That's why I've been spending most of my time out here " ..
                "tinkering instead of digging.\n\nLet me show you what I've invented: the Fossil-Finder " ..
                "3000. I just put the finishing touches on it. If it works properly, it should find the " ..
                "largest fossils in the area. I know, sweet, huh?\n\nTest it out and see if you can find " ..
                "some ridiculously big dinosaur bones.",
            rewardMoney = 8000,
        },
        [24709] = {
            description = "Hey wait a minute, this bone has pickax marks on it. These aren't yours, are " ..
                "they? No, I recognize this mark... this must be that blasted dwarf! Gah!\n\nLet me step " ..
                "back for a minute and explain. There's another archaeologist south of here named Durrin " ..
                "Direshovel. He practices a reckless, devil-may-care brand of archaeology that offends " ..
                "even me.\n\nA priceless fossil, ruined by sloppy pick-work. This is the last straw, " ..
                "Durrin!\n\n<name>, go put an end to Direshovel and his negligent excavation.",
            rewardChoices = {{53600, 1}, {53602, 1}, {53601, 1}},
            rewardMoney = 25000,
        },
        [24710] = {
            description = "We need to make our way up the main path and through the cave to Tyrannus' " ..
                "rise.\n\nHe will be forced to confront us there lest we make our way into the citadel " ..
                "proper.\n\nGo now, <class>. My men and I will be there to stand by you when the " ..
                "confrontation with Tyrannus comes.",
            rewardMoney = 296000,
        },
        [24711] = {
            description = "We must press on, hero. We've come so far... we're so close to our goal.\n\nI " ..
                "must delay a moment to send Elandra back to the airship. I'm uncertain how we're going " ..
                "to escape with so many men lost and so few to keep our path in secure.\n\nContinue on. I " ..
                "will meet you in the Halls of Reflection.",
            rewardMoney = 19000,
        },
        [24712] = {
            description = "We need to make our way up the main path and through the cave to Tyrannus' " ..
                "rise.\n\nThere, he will be forced to confront us there lest we make our way into the " ..
                "citadel proper.\n\nGo now, <class>. My men and I will be there to stand by you when the " ..
                "confrontation with Tyrannus comes.",
            rewardMoney = 296000,
        },
        [24713] = {
            description = "Keep moving, the sword is close.\n\nI need a moment to send one of my dark " ..
                "rangers back to the airship. With all of our fodder gone, I will not be caught " ..
                "unprepared - we will need any help they can send.\n\nGo. I will meet you in the Halls of " ..
                "Reflection.",
            rewardMoney = 19000,
        },
        [24714] = {
            description = "Unfortunately, something's happened to one of my greatest inventions. You've " ..
                "seen mechanical squirrels, yes? Well, to get closer to the apes of Un'Goro Crater, I " ..
                "created a mechanical ape to blend in with their kind--I call her A-Me 01.\n\nShe has " ..
                "been studying the local wildlife at Fungal Rock for several months, but she should have " ..
                "returned by now. I fear the worst for her.\n\nCan you help me find her?",
            rewardMoney = 4000,
        },
        [24715] = {
            description = "<Suddenly, the robotic gorilla's eyes light up, and it begins to " ..
                "speak.>\n\n\"...operational capacity... less than 5%... accidentally... punctured oil " ..
                "reservoir...\"\n\n\"...use coconut milk... rock... save A-Me 01...\"\n\n<A-Me closes her " ..
                "eyes.>",
            rewardMoney = 7500,
        },
        [24717] = {
            description = "There's plenty of money to be had here in Un'Goro, you just need to know where " ..
                "to look!\n\nApes may be common here in Un'Goro, but they're much rarer up north. In " ..
                "Everlook, a gorilla hide fetches ten times what you'll get for it down here!\n\nI'm not " ..
                "going to send you all the way up to Winterspring - that'd be irresponsible - but I could " ..
                "use your help actually obtaining some hides.\n\nYou'll find gorillas at Fungal Rock, to " ..
                "the northeast, near a waterfall. Don't forget to check inside the cave!",
            rewardMoney = 15500,
        },
        [24718] = {
            description = "Looking around, you see bits of red fur laying around this part of the cave. " ..
                "It appears to match the consistency of gorilla fur.\n\nBased on your conversations with " ..
                "Gremix, you know that he would almost certainly be interested in a red gorilla hide, if " ..
                "you were to obtain one.",
            rewardChoices = {{53583, 1}, {53584, 1}},
            rewardMoney = 16000,
        },
        [24719] = {
            description = "Stop, <race>. I could use the help of a <class> like you.\n\nRight outside " ..
                "this camp, there are raptors with deadly claws. I've been using the claws for druid " ..
                "rituals, but it doesn't seem to be working. However, I did notice that some of those " ..
                "raptors sometimes have white claws, when most have deathly black ones.\n\nThe earth " ..
                "works in strange ways. Maybe you could fetch me some of the white claws, and I'll try " ..
                "one last time?",
            rewardChoices = {{53557, 1}, {53559, 1}, {53558, 1}},
            rewardMoney = 7500,
        },
        [24720] = {
            description = "I'm sure you've noticed 'em, <name>. They're everywhere!\n\nWhat am I talking " ..
                "about? Why, the crystals, of course!\n\nThe crystals... They're all over the crater. " ..
                "Most people ignore them, but I have a strange feeling that they hold power within " ..
                "them.\n\nSay, I'm running a little low on the crystals I have here -- think you might be " ..
                "able to collect some more for me?\n\nYou'll find yellow crystals to the northwest, red " ..
                "crystals to the... oh, I'm sure you'll figure it out.",
            rewardMoney = 7500,
        },
        [24721] = {
            description = "High up in the cliffs above me there is a large crystal pylon. Who placed it " ..
                "there, I cannot say, nor can I determine any reason that it would be built in such a " ..
                "strange place.\n\nMaybe you can make more of it than I can. I personally don't care what " ..
                "it does, so you needn't report back to me, but perhaps one of the scholars in Marshal's " ..
                "Stand might be interested in what you discover.",
            rewardMoney = 8000,
        },
        [24722] = {
            description = "You've done us a number of favors, <name>... now let Gremix do one for you. " ..
                "The attacks on Marshal's Refuge were terrible, undoubtedly. They came without warning, " ..
                "and took no prisoners. They were lucky that so many of them survived.\n\nA few weeks " ..
                "ago, I came across a crystal pylon in the cliffs to the northeast of here, east of " ..
                "Marshal's Refuge. I think the pylon and the attacks may be related somehow. Maybe you " ..
                "can investigate? I'm sure someone in Marshal's Stand will thank you.",
            rewardMoney = 8000,
        },
        [24723] = {
            description = "Durrin's research touched on one area that intrigues me: a potential link " ..
                "between the titans and the dinosaurs. J.D. Collie back at camp is always talking about " ..
                "titan this and crystal that... maybe she'd be interested.\n\nBefore you report to her, " ..
                "you might want to check out the crystal pylon not far from here. It's just up in the " ..
                "cliffs, to the west of here. It's got crystals on it, and it always seemed to me like it " ..
                "might have something to do with the titans.",
            rewardMoney = 8500,
        },
        [24724] = {rewardItems = {{11562, 1}}},
        [24725] = {rewardItems = {{11566, 1}}},
        [24726] = {rewardItems = {{11563, 1}}},
        [24727] = {rewardItems = {{11567, 1}}},
        [24728] = {rewardItems = {{11564, 1}}},
        [24729] = {rewardItems = {{11565, 1}}},
        [24730] = {
            description = "You'd think that being chief digger for Marshal Expeditions means I like " ..
                "digging. There might be worse things to do in this world... but none really leap to " ..
                "mind.\n\nWe were supposed to be digging in Terror Run - FANTASTIC name by the way - for " ..
                "dead stegodons and diemetradons. Well, there are plenty of live ones there too! Wil and " ..
                "Hol are still all about studying this death trap, so we need those dinosaur bones. " ..
                "Between you and me though, bringing some from live ones will work out just as well.",
            rewardChoices = {{53585, 1}, {53586, 1}},
            rewardMoney = 8000,
        },
        [24731] = {
            description = "Once, a long time ago, a brother of mine took some meat from one of " ..
                "Lar'korwi's kills. He didn't know it at the time, but Lar'korwi saw him from the forest. " ..
                "Lar'korwi followed my brother for days, destroying everything he touched. My brother, " ..
                "scared, finally decided to run from the Crater and leave Lar'korwi behind.\n\nLar'korwi " ..
                "killed him not far from this spot.\n\nIf you want to provoke Lar'korwi, find a fresh " ..
                "kill of his and take some of the meat from it.\n\nStart your search to the west.",
            rewardMoney = 7500,
        },
        [24732] = {
            description = "I'm actually surprised he has not come for you yet, <name>. But all is well, " ..
                "for I have a final plan that will bring the monster to us.\n\nBeing the dominant male " ..
                "gives Lar'korwi rights to breed with any female he chooses--and he chooses many of them. " ..
                "You'll find many ravasaur eggs to the west of here. Get close to them and you should " ..
                "provoke an attack by his mates. The females produce an awful smell from a gland in their " ..
                "heads that allow males to know they are ready to breed. Bring me two of those glands.",
            rewardMoney = 7500,
        },
        [24733] = {
            description = "This will be the most difficult part because there is some complexity to the " ..
                "plan. Continue following the river to the north, and look for a bend in the river. It " ..
                "was here I saw Lar'korwi last. You will know you are in the right area because of all " ..
                "the bones from massive creatures that once wandered nearby.\n\nTake the meat you " ..
                "recovered and place it there. Then, rub this mixture I created on the meat.\n\nIf both " ..
                "lures mingled together do not bring Lar'korwi to you, then I know nothing else that will.",
            rewardChoices = {{53587, 1}, {53588, 1}},
            rewardMoney = 16000,
        },
        [24734] = {
            description = "You've got to help me, <name>! My friend, Ringo left earlier to explore the " ..
                "volcano to the north of here, and he has been gone way too long. I am really worried " ..
                "about him.\n\nDo you think you could find him? Why don't you take my canteen with you -- " ..
                "if you do find Ringo, I'm sure he'll need it!",
            rewardMoney = 4000,
        },
        [24735] = {
            description = "Ugh... It's so hot...\n\nI was exploring this area, when all of a sudden, the " ..
                "heat just became unbearable. I must be suffering from heat exhaustion.\n\nPlease, help " ..
                "me get back to my friend Spraggle at Marshal's Stand. I think I'm well enough to follow " ..
                "you there.\n\nI am feeling a little out of it, so you can slap me if I'm feeling woozy. " ..
                "If I do happen to faint again, just splash some water on me from Spraggle's canteen. " ..
                "That should work, I hope...",
            rewardChoices = {{53566, 1}, {53567, 1}, {53568, 1}},
            rewardMoney = 7500,
        },
        [24736] = {
            description = "I'm making a flying machine!\n\nI got stranded here, and I'm absolutely " ..
                "horrible at finding my way around. I'd take a gryphon or wind rider back to Gadgetzan, " ..
                "but those beasts just scare me to death.\n\nSo, will you help me? All I have left to " ..
                "build is the wings, and I was thinking that the webby scales from the pterrordax in the " ..
                "Screaming Reaches to the west would be perfect. There's no way I'm going to go up " ..
                "against one of those, but you look pretty tough. Why don't you give it a try?",
            rewardChoices = {{53589, 1}, {53590, 1}, {53591, 1}},
            rewardMoney = 8000,
        },
        [24737] = {
            description = "I'm always looking for a quick way to earn a gold, <name>. If you help me with " ..
                "my newest idea, I'll let you in on a little of the profit. How does that sound to " ..
                "you?\n\nI thought so!\n\nWe're going to be making some glue. Head to the tar pits just " ..
                "north of here, and collect me some tar. Not just any tar, now, you'll need to get it " ..
                "from the beasts that live around the tar pits. As a bonus, if you use my tar scraper on " ..
                "their corpses, you'll keep your hands nice and clean.",
            rewardMoney = 15500,
        },
        [24740] = {
            description = "Welcome. I'm Williden Marshal, and my sister and I run this expedition of " ..
                "explorers and scientists. You have a moment?\n\nI don't like the look of those " ..
                "elementals on that volcano, <class>. We have too much equipment, too many notes... one " ..
                "crazed elemental could streak its way through our camp and do terrible, terrible " ..
                "damage.\n\nShow them that their new neighbors aren't to be trifled with. And bring back " ..
                "the ash that they leave behind... we might as well do a little science while we're at it.",
            rewardMoney = 7500,
        },
        [24741] = {
            description = "Hobart thinks he's going to feed us on those tiny clucker eggs? Bah! We're " ..
                "going to get some real eggs!\n\nI've already set up some traps on the Raptor Rise up the " ..
                "path to the east. Take this bunch of wild clucker eggs and lay them in the traps. The " ..
                "spiny raptors will go right after the clucker eggs, and then you'll get to trade up to " ..
                "their larger eggs.\n\nGenius!",
            rewardMoney = 225,
        },
        [24742] = {
            description = "I created a thermometer to take readings of the temperatures at the volcano, " ..
                "and I'd like to find the hottest lava flows. It gives the measurements in degrees " ..
                "Kraklenheit!\n\nHere, take it, and take readings of the temperatures at the ridge " ..
                "whenever you see a hot spot!\n\nHot spots usually take the form of a glowing, rocky " ..
                "pillar jutting out of the ground. You'll find them around the base of Fire Plume " ..
                "Ridge... one trip around the perimeter will likely suffice.",
            rewardMoney = 7500,
        },
        [24743] = {rewardItems = {{49888, 1}}},
        [24744] = {
            description = "Bamm Megabomb? Who does he think he is? His spiny raptor eggs are no match for " ..
                "what we are about to recover!\n\nAs you well know, each Town-In-A-Box is equipped with a " ..
                "micro mechachicken for just such a dietary emergency. Luckily for us, my keen intellect " ..
                "was able to deduce the location that our prodigious, pre-programmed poultry ran off " ..
                "to.\n\nHead north to the Scorched Gully. But beware, its circuit boards are fried and I " ..
                "imagine it's not so micro any longer!",
            rewardChoices = {{52905, 1}, {52933, 1}, {52951, 1}},
            rewardMoney = 450,
        },
        [24747] = {rewardMoney = 7500},
        [24748] = {
            description = "Shadowmourne; a newly forged weapon already steeped in this world's history, " ..
                "reborn into an unrivaled destiny.\n\nWith this weapon you bear a solemn responsibility, " ..
                "and the time to carry out that charge is at hand.\n\nTake this weapon of myth and legend " ..
                "and march on the enemy. Avenge the countless heroes lost in his merciless campaign. " ..
                "Bring rest to their tortured souls.\n\nSteel yourself, <class>, and guide Shadowmourne " ..
                "to fulfill the purpose of its creation.",
            rewardMoney = 296000,
        },
        [24749] = {
            description = "Before your weapon can reach its full potential it must be endowed with its " ..
                "signature powers. First among them is unholiness.\n\nYou must seek out and defeat the " ..
                "one called Professor Putricide, but his death is not your only goal. You must use his " ..
                "resources against him.\n\nFind a way to absorb his mutated slime. Use the foul substance " ..
                "to infuse your weapon with the power of the unholy. Only when this has been done shall I " ..
                "reveal your next task.",
            rewardMoney = 148000,
        },
        [24750] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Soratha to the east.",
            rewardMoney = 25,
        },
        [24751] = {
            description = "Alright, mon. We start simple. I need ta know dat you know the basics of the " ..
                "arcane arts.\n\nGo thrash dose tiki targets. Take it slowly. Natural-like. I'll watch " ..
                "how you form your casts and we'll go from dere.",
            rewardMoney = 35,
        },
        [24752] = {
            description = "As ya' develop ya' powah, ya' gonna start to tink of new spells, new ways to " ..
                "use ya' arcane talents.\n\nGo now, grow ya' skills, and 'den come back an' show me what " ..
                "'cha figure out.",
            rewardMoney = 40,
        },
        [24753] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24754] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52873, 1}},
            rewardMoney = 50,
        },
        [24755] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24756] = {
            description = "Your weapon is ready to be endowed with the power of blood.\n\nYou must face " ..
                "Queen Lana'thel in battle and subject yourself to her Blood Mirror. This will cause " ..
                "Shadow's Edge to drink the blood of the nearest living being. That being would be you, " ..
                "<race>.\n\nOnce the blade has been thus awakened, allow the Queen's Frenzied Bloodthirst " ..
                "to take hold of you, feed the blade thrice to sate it, and then give the queen an " ..
                "ignominious death.\n\nMay her screams pierce the ears of the Lich King as he awaits his " ..
                "fate.",
            rewardMoney = 148000,
        },
        [24757] = {
            description = "Shadow's Edge is prepared to receive its final infusion of " ..
                "power.\n\nSindragosa, the enemy's own mount, must fall. But before she is brought down, " ..
                "you must sustain four of her frozen breath attacks without tasting death.\n\nWithout his " ..
                "dragon, nothing shall stand between you and the Lich King.",
            rewardMoney = 148000,
        },
        [24758] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Nekali to the east.",
            rewardMoney = 25,
        },
        [24759] = {
            description = "Alright, mon. We start simple. I need ta know dat you know the basics of the " ..
                "natural arts.\n\nGo thrash dose tiki targets. Take it slowly. Natural-like. I'll watch " ..
                "how you form your casts and we'll go from dere.",
            rewardMoney = 35,
        },
        [24760] = {
            description = "As ya grow in powah, you begin ta discovah the voices of da ancestahs speakin' " ..
                "to ya, teachin' you dere secrets.\n\nTha first of 'dese is to focus tha power of da " ..
                "elements into yer weapon. It allows ya to unleash a quick, vicious attack on your " ..
                "enemies. Dis should be easy enough for ya to make a lot of use of it.\n\nTry it out. Let " ..
                "me know when ya tink you have it down.",
            rewardMoney = 40,
        },
        [24761] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24762] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52875, 1}},
            rewardMoney = 50,
        },
        [24763] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24764] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Zen'Tabra to the east.",
            rewardMoney = 25,
        },
        [24765] = {
            description = "Alright, mon. We start simple. I need ta know dat you know the basics of the " ..
                "druidic arts.\n\nGo thrash dose tiki targets. Take it slowly. Natural-like. I'll watch " ..
                "how you form your casts and we'll go from dere.",
            rewardMoney = 35,
        },
        [24766] = {
            description = "As ya grow in powah, ya ability to call on nature gets strongah, too. Ya wanna " ..
                "see?\n\nGo get some experience and show me what ya' learn.",
            rewardMoney = 40,
        },
        [24767] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24768] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52870, 1}},
            rewardMoney = 50,
        },
        [24769] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24770] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Legati to the east.",
            rewardMoney = 25,
        },
        [24771] = {
            description = "Alright, mon. We start with da basics. I need ta know dat you know how ta " ..
                "swing dose weapons you're totin' around.\n\nGo thrash dose tiki targets. Take it slowly. " ..
                "Natural-like. I'll watch ya fighting form and we'll go from dere.",
            rewardMoney = 35,
        },
        [24772] = {
            description = "As ya fight ya enemies, ya will learn new tricks you use ta be even " ..
                "bettah'.\n\nThere's one ya should be learnin' soon to let ya see dere weaknesses and set " ..
                "up for devastating combo attacks. After ya've struck a few blows to weaken ya foe, " ..
                "finish dem off with a vicious evisceration attack.\n\nWhen ya learn it, try it out. Let " ..
                "me know when ya tink you have it down.",
            rewardMoney = 40,
        },
        [24773] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24774] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52889, 1}},
            rewardMoney = 50,
        },
        [24775] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24776] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Ortezza to the east.",
            rewardMoney = 25,
        },
        [24777] = {
            description = "Alright, mon. We start with da basics. I need ta know dat you know how ta use " ..
                "dat weapon you're totin' around.\n\nGo thrash dose tiki targets. Take it slowly. " ..
                "Natural-like. I'll watch ya fighting form and we'll go from dere.",
            rewardMoney = 35,
        },
        [24778] = {
            description = "As ya' start to get da hang of tings, ya gonna figure out how ta do new " ..
                "tricks.\n\nOne of da' first ya gonna learn is to keep a steady hand between shots, or " ..
                "else ya gonna find yaself exhausted and not really managin' to kill much.\n\nGo get some " ..
                "more experience 'till ya figure it out, 'den come back and try it out. Let me know when " ..
                "ya tink you have it down.",
            rewardMoney = 40,
        },
        [24779] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24780] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52872, 1}},
            rewardMoney = 50,
        },
        [24781] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24782] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Tunari to the east.",
            rewardMoney = 25,
        },
        [24783] = {
            description = "Alright, mon. We start simple. I need ta know dat you know the basics of the " ..
                "holy arts.\n\nGo thrash dose tiki targets. Take it slowly. Natural-like. I'll watch how " ..
                "you form your casts and we'll go from dere.",
            rewardMoney = 35,
        },
        [24784] = {
            description = "As ya get more skill out there in tha' world, you'll start to discovah' new " ..
                "powahs.\n\nWhy dontcha go out an' go get yaself stronger, and come back when ya learn " ..
                "sometin' new. You can show me what ya learn.",
            rewardMoney = 40,
        },
        [24785] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [24786] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52874, 1}},
            rewardMoney = 50,
        },
        [24787] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [24794] = {
            description = "My good friend Spraggle has been fretting about something for some time now. " ..
                "I'd help her, but as you can see, I'm pretty comfortable right now.\n\nCould you check " ..
                "in with her and see what she needs?",
            rewardMoney = 800,
        },
        [24795] = {
            description = "In spite of Queen Lana'thel's boasting, you have restored Quel'Delar, <name>. " ..
                "Long have we dreamt of reclaiming Quel'Delar.\n\nThe Silver Covenant, and indeed all " ..
                "quel'dorei owe you a debt of gratitude.\n\nAs a <class>, the sword seems to know you " ..
                "lack the training to wield it and hasn't bonded to you. Where, then, will its next " ..
                "master come from? Perhaps the Argent Crusade can find one. Go north to the Argent " ..
                "Tournament Grounds and present the sword to Justicar Mariel Trueheart on behalf of the " ..
                "Silver Covenant.",
            rewardChoices = {{50050, 1}, {50051, 1}, {50052, 1}},
            rewardMoney = 222000,
        },
        [24796] = {
            description = "In spite of Queen Lana'thel's boasting, you have restored Quel'Delar, <name>. " ..
                "Long have we dreamt of reclaiming Quel'Delar.\n\nThe Silver Covenant, and indeed all " ..
                "quel'dorei owe you a debt of gratitude.\n\nVereesa Windrunner, the leader of the Silver " ..
                "Covenant, asked to see you after you returned from the Sunwell. Take Quel'Delar with you " ..
                "and go to Dalaran's Violet Citadel where she waits, <name>.",
            rewardChoices = {{50046, 1}, {50047, 1}, {50048, 1}, {50049, 1}},
            rewardMoney = 222000,
        },
        [24798] = {
            description = "At last, Quel'Delar is restored for the glory of the Sunreavers and the " ..
                "sin'dorei!\n\nAll of Silvermoon will celebrate you as a hero, <name>.\n\nAs a <class>, " ..
                "the sword seems to know you lack the training to wield it and hasn't bonded to you. " ..
                "Where, then, will its next master come from? No worthy sin'dorei has come forward. Let " ..
                "us seek the Argent Crusade's counsel. Go north to the Argent Tournament Grounds and " ..
                "present the sword to Justicar Mariel Trueheart on behalf of the Sunreavers.",
            rewardChoices = {{50050, 1}, {50051, 1}, {50052, 1}},
            rewardMoney = 222000,
        },
        [24799] = {
            description = "At last, Quel'Delar is restored for the glory of the Sunreavers!\n\nAll the " ..
                "Horde will celebrate you as a hero, <name>.\n\nAs a <class>, the sword seems to know you " ..
                "lack the training to wield it and hasn't bonded to you. Where, then, will its next " ..
                "master come from? I will not conceal my disappointment; I had hoped it would be a worthy " ..
                "sin'dorei. Let us seek the Argent Crusade's counsel. Go north to the Argent Tournament " ..
                "Grounds and present the sword to Justicar Mariel Trueheart on behalf of the Sunreavers.",
            rewardChoices = {{50050, 1}, {50051, 1}, {50052, 1}},
            rewardMoney = 222000,
        },
        [24800] = {
            description = "At last, Quel'Delar is restored for the glory of the Sunreavers and the " ..
                "sin'dorei! All of Silvermoon will proclaim you a hero, as will all of the " ..
                "Horde.\n\nArchmage Aethas Sunreaver, the leader of the Sunreavers, asked to see you " ..
                "after you returned from the Sunwell. Travel to the Violet Citadel in Dalaran as soon as " ..
                "you can, <name> and bring Quel'Delar with you. The archmage wishes to congratulate you " ..
                "personally!",
            rewardChoices = {{50046, 1}, {50047, 1}, {50048, 1}, {50049, 1}},
            rewardMoney = 222000,
        },
        [24801] = {
            description = "At last, Quel'Delar is restored for the glory of the Sunreavers and the Horde! " ..
                "This is a blessing for our efforts against the Lich King.\n\nArchmage Aethas Sunreaver, " ..
                "the leader of the Sunreavers, asked to see you after you returned from the Sunwell. " ..
                "Travel to the Violet Citadel in Dalaran as soon as you can, <name> and bring Quel'Delar " ..
                "with you. The archmage wishes to congratulate you personally!",
            rewardChoices = {{50046, 1}, {50047, 1}, {50048, 1}, {50049, 1}},
            rewardMoney = 222000,
        },
        [24802] = {
            description = "It's hard to believe that there is much hope of defeating Arthas upon the " ..
                "steps of his own throne. And who will take up the crown of Lich King if it comes to " ..
                "that?\n\nMany questions remain, but you need to find Sylvanas and escape the Lich King " ..
                "while there's still time.",
            rewardMoney = 296000,
        },
        [24807] = {rewardMoney = 1600},
        [24812] = {
            description = "Da naga have committed great atrocities on our people. Da time ta show dem " ..
                "mercy has long passed.\n\nEnter da cave and kill any naga you find dere. Every naga dead " ..
                "dis day is one less naga ta take us unawares later on. I trust ya will be thorough.",
            rewardChoices = {{52878, 1}, {52883, 1}, {52886, 1}},
            rewardMoney = 75,
        },
        [24813] = {
            description = "Dis is no casual counter-attack. We be fully intendin' ta slaughter every last " ..
                "naga here and do anything we can ta ensure that dey will have no desire ta return.\n\nI " ..
                "want ya ta place dese fetishes on any Spitescale banner ya be findin' inside their cave. " ..
                "It should prove a clear statement of what we think of their presence here. More dan dat, " ..
                "da magic in dese fetishes will be weakenin' any Spitescale dat approach, which should " ..
                "make dem second guess stayin' on our isle.",
            rewardMoney = 75,
        },
        [24814] = {
            description = "Da Sea Witch is here, on top of dis very isle. We've been waitin' a long time " ..
                "for dis chance at revenge and ya will be havin' da privilege of seein' it " ..
                "through.\n\nMeet with Vol'jin, up da ramp to da northeast. Let him know when you are " ..
                "ready ta join da battle.",
            rewardChoices = {{52879, 1}, {52884, 1}, {52887, 1}},
            rewardItems = {{60260, 1}},
            rewardMoney = 300,
        },
        [24815] = {
            rewardChoices = {{50377, 1}, {50378, 1}, {50376, 1}, {50375, 1}, {52569, 1}},
            rewardMoney = 74000,
        },
        [24816] = {
            description = "Fine, fine, perhaps the whole egg thing didn't quite pan out. Who's up for " ..
                "some shark meat?\n\nOnly one little problem. Well, a big problem, actually. A really BIG " ..
                "problem: The Hammer!\n\nOf course, I have a brilliant idea. Swim out into the Dire " ..
                "Strait to the west and get us some shark parts. Give them to my assistant, Greely. I'm " ..
                "too important to get my hands dirty with the small details.",
            rewardMoney = 225,
        },
        [24817] = {
            description = "Combining the remains of the Mechachicken with these shark parts, we've " ..
                "assembled the greatest fighting submersible of all time: the Mechashark " ..
                "X-Steam!\n\nHobart and I want you to pilot it, <name>. Go west to the water and activate " ..
                "the Mechashark X-Steam Controller.\n\nYou must kill The Hammer if we're to have any hope " ..
                "of exploiting the natural resources of the Dire Strait to their fullest extent. It's for " ..
                "the good of the cartel!",
            rewardChoices = {{52906, 1}, {52952, 1}},
            rewardMoney = 450,
        },
        [24819] = {rewardChoices = {{50378, 1}, {50376, 1}, {50375, 1}, {52569, 1}}},
        [24820] = {rewardChoices = {{50378, 1}, {50377, 1}, {50375, 1}, {52569, 1}}},
        [24821] = {rewardChoices = {{50378, 1}, {50377, 1}, {50376, 1}, {52569, 1}}},
        [24822] = {rewardChoices = {{50377, 1}, {50376, 1}, {50375, 1}, {52569, 1}}},
        [24823] = {rewardItems = {{50397, 1}}, rewardMoney = 74000},
        [24824] = {rewardMoney = 3500},
        [24825] = {rewardItems = {{50386, 1}}, rewardMoney = 74000},
        [24826] = {rewardItems = {{50387, 1}}, rewardMoney = 74000},
        [24827] = {rewardItems = {{50388, 1}}, rewardMoney = 74000},
        [24828] = {rewardItems = {{50384, 1}}, rewardMoney = 74000},
        [24829] = {rewardItems = {{50398, 1}}, rewardMoney = 74000},
        [24830] = {rewardItems = {{50399, 1}}, rewardMoney = 74000},
        [24831] = {rewardItems = {{50400, 1}}, rewardMoney = 74000},
        [24832] = {rewardItems = {{50401, 1}}, rewardMoney = 74000},
        [24833] = {rewardItems = {{50402, 1}}, rewardMoney = 74000},
        [24834] = {rewardItems = {{50403, 1}}, rewardMoney = 74000},
        [24835] = {rewardItems = {{50404, 1}}, rewardMoney = 74000},
        [24836] = {rewardChoices = {{50386, 1}, {50387, 1}, {50388, 1}, {52570, 1}}},
        [24837] = {rewardChoices = {{50384, 1}, {50387, 1}, {50388, 1}, {52570, 1}}},
        [24838] = {rewardChoices = {{50386, 1}, {50384, 1}, {50388, 1}, {52570, 1}}},
        [24839] = {rewardChoices = {{50386, 1}, {50387, 1}, {50384, 1}, {52570, 1}}},
        [24840] = {rewardChoices = {{50399, 1}, {50401, 1}, {50403, 1}, {52571, 1}}},
        [24841] = {rewardChoices = {{50397, 1}, {50401, 1}, {50403, 1}, {52571, 1}}},
        [24842] = {rewardChoices = {{50399, 1}, {50397, 1}, {50403, 1}, {52571, 1}}},
        [24843] = {rewardChoices = {{50399, 1}, {50401, 1}, {50397, 1}, {52571, 1}}},
        [24844] = {rewardChoices = {{50400, 1}, {50402, 1}, {50404, 1}, {52572, 1}}},
        [24845] = {rewardChoices = {{50398, 1}, {50402, 1}, {50404, 1}, {52572, 1}}},
        [24846] = {rewardChoices = {{50398, 1}, {50400, 1}, {50404, 1}, {52572, 1}}},
        [24847] = {rewardChoices = {{50398, 1}, {50402, 1}, {50400, 1}, {52572, 1}}},
        [24852] = {
            description = "Despite their size, the Bristleback greatly outnumber us. A pack ambush can " ..
                "easily overwhelm even the largest tauren.\n\nMany new initiates have taken up arms to " ..
                "defend our home. Some have given their lives, but others have been captured " ..
                "alive.\n\nPlease, find their cages and free them. The battle should keep the quilboar " ..
                "distracted.",
            rewardChoices = {{57198, 1}, {57215, 1}},
            rewardMoney = 35,
        },
        [24854] = {
            description = "Zen'Aliri been studyin' the ways of the druid, <race>. Hopefully one day, " ..
                "Zen'Aliri join the Druids of the Talon, and soar over this crater as a storm " ..
                "crow.\n\nBut for now, my mentor says I stay here and wait. So Zen'Aliri waits.\n\nI know " ..
                "another druid who might be able to use your help. His name is Garl Stormclaw, and he's " ..
                "somewhere to the east of here, studying reagents. Maybe you go talk to him?",
            rewardMoney = 800,
        },
        [24855] = {
            description = "Look how strangely the plant life reacts to the bloodpetals in the Roiling " ..
                "Gardens to the north. The trees are enveloped with more flowers and vines than usual. " ..
                "Large, sporous blossoms project themselves from the ground where they once did " ..
                "not.\n\nThe land is speaking to us, <race>. The bloodpetals are destroying the " ..
                "balance.\n\nAs my final task, I ask you to visit the swarming adult bloodpetals and " ..
                "prune their numbers.",
            rewardChoices = {{53569, 1}, {53570, 1}},
            rewardMoney = 15500,
        },
        [24856] = {
            description = "Your work here is done for now, but there's no rest for the wicked, eh?\n\nYou " ..
                "remember Megs Dreadshredder, our old marketing rep? She's taken some others over the " ..
                "hills to the southeast, just past the Raptor Rise. If you follow the path east out of " ..
                "town and follow it south at the fork, you can't miss her.\n\nApparently there's some " ..
                "trouble or other brewing with the snake-men at the ruins on the shore. Go see if you " ..
                "can't sort it all out, would you?",
        },
        [24858] = {
            description = "Looks like the naga down there in the ruins are preparing to invade our " ..
                "Town-In-A-Box. I have lots of dead scouts here as proof.\n\nI don't know about you, but " ..
                "I'm not about to let them try. Let's get the jump on them!\n\nCould you lay the " ..
                "foundation for our new coastal holdings by replacing their banners with our own? That's " ..
                "some prime real estate down there!",
            rewardChoices = {{52907, 1}, {52953, 1}},
            rewardMoney = 225,
        },
        [24859] = {
            description = "It's oft whispered in dark corners of a material so fine, so exquisite to the " ..
                "touch, that goblins of sophisticated taste will spend any amount of moolah to get their " ..
                "hands on some.\n\nOf course, I'm speaking of naga hide!\n\n<Brett looks around to make " ..
                "sure no one else is listening in.>\n\nI know that you're going to head down there and " ..
                "that it's inevitable that you're going to have to fight those snakes. Hey, they're not " ..
                "going to have a use for their hides anyway. They'll be dead!",
            rewardMoney = 225,
        },
        [24861] = {
            description = "The camp is safe, and the quilboar driven off, all thanks to you, young one. " ..
                "You have my personal thanks for what you have done for my mother, my son, and for all of " ..
                "us.\n\nIt is now time to put Greatmother Hawkwind to rest. Lay the final offering at her " ..
                "feet, <name>, and we will say our goodbyes.",
        },
        [24862] = {
            description = "Look around you, <class>. We've had no luck dislodging the Horde from the " ..
                "hidden trails that overlook this valley. They appear out of nowhere to ambush our supply " ..
                "caravans and then disappear into the hills!\n\nI need you to run the gauntlet to Honor's " ..
                "Stand and let them know the roads still aren't safe. Talk to Mattingly, the supplies " ..
                "officer by the gate.\n\nAnd kill a few of these brutes along the way!",
            rewardMoney = 2500,
        },
        [24863] = {
            description = "Horde scouts hiding in the ruins up ahead ambushed my supply train. Only two " ..
                "of my bodyguards made it out of there alive. And me? I used to have hair!\n\nThe " ..
                "supplies I was delivering are scattered through the ruins up ahead. Gather them up and " ..
                "take them to Janice Mattingly at Honor's Stand. If they can't make it to Stonetalon, at " ..
                "least we can keep them out of Horde hands...",
            rewardMoney = 2500,
        },
        [24864] = {
            description = "I've got a plan and you're the only one that I know crazy enough to pull it " ..
                "off!\n\nI need you to take this irresistible pool pony to the Vashj'elan Spawning Pool " ..
                "and inflate it. Then, swim down to their hatchlings with it on. I'll bet anything that " ..
                "the hatchlings can be lured away to follow you.\n\nBring them back here and we'll " ..
                "proceed with the next phase of the plan.",
            rewardMoney = 225,
        },
        [24865] = {
            description = "You find what appears to be a crate of food, left behind when this camp was " ..
                "abandoned. On the outside of the crate, you can make out a stamp that says \"PROPERTY OF " ..
                "MARSHAL EXPEDITIONS\".\n\nPerhaps you might find someone who could use this?",
            rewardMoney = 4000,
        },
        [24866] = {
            description = "You find what appears to be a piece of research equipment, left behind when " ..
                "this camp was abandoned. Chiseled onto the side of the device are the words \"PROPERTY " ..
                "OF MARSHAL EXPADISHUNS\".\n\nPerhaps you might find someone who could use this?",
            rewardMoney = 4000,
        },
        [24868] = {
            description = "<name>, you and Ace need to march those naga hatchlings down there and use " ..
                "them as leverage to convince the leader of the naga to surrender to us.\n\nAce knows " ..
                "where to go on the south side of the ruins... just follow him.",
            rewardChoices = {{52908, 1}, {52954, 1}},
            rewardMoney = 450,
        },
        [24897] = {
            description = "We were wrong. It wasn't the naga that were preparing to attack... it was the " ..
                "nearby Oomlot tribe.\n\n<name>, you need to get back to the Town-In-A-Box. The pygmies " ..
                "are already attacking!\n\nHere, take this. We bought it off of a pygmy who said it used " ..
                "to belong to some great leader of theirs. Someone whose name translates as Dark Tan " ..
                "Helmet.\n\nIt should fool them so that they don't attack you.",
        },
        [24901] = {
            description = "<name>, you have to defend us!\n\nI had the eggheads deploy the town's cannon " ..
                "defenses, but it seems like there's an unlimited supply of these Oomlot warriors!\n\nGet " ..
                "your behind into one of those B.C. Eliminators and eliminate the pygmy threat to the " ..
                "town!",
            rewardChoices = {{52909, 1}, {52955, 1}},
            rewardMoney = 225,
        },
        [24902] = {
            description = "It's true then? Gilneas has lost her favorite son.\n\nWe will mourn when this " ..
                "is all over but not a day sooner.\n\nWe will not allow ourselves the luxury of grief " ..
                "while the enemy still breathes Gilnean air.\n\nMy father's men are ready to strike while " ..
                "we still have the Banshee Queen's trail. Just say the word if you're ready. Liam " ..
                "deserves swift vengeance.",
            rewardMoney = 800,
        },
        [24903] = {
            description = "Tell Greymane that we have trackers on Sylvanas and tell him about the " ..
                "Plague.\n\nThe decision will be his. Launch an all out attack against the leader of the " ..
                "Forsaken or try to evacuate our survivors.",
            rewardMoney = 300,
        },
        [24904] = {
            description = "The time has come, <name>. We've rallied and armed every available " ..
                "Gilnean.\n\nIt is time to meet the enemy head on. Time to settle the score with Sylvanas " ..
                "and her Forsaken dogs once and for all.\n\nLiam is heading the assault from this gate. " ..
                "King Greymane and my father are leading the assault on the other districts.\n\nYou have " ..
                "a crucial role to play in this as well. Take this rapier. Use it to inspire our men and " ..
                "women in combat. Speak to Krennan Aranas to take part in the battle for Gilneas City.",
            rewardChoices = {{54987, 1}, {54988, 1}, {54989, 1}, {54990, 1}, {55011, 1}},
            rewardMoney = 1300,
        },
        [24905] = {
            description = "You know, while you were out doin' your thing, Megs stopped by here. I hadn't " ..
                "seen her in months, but she barely gave me the time of day, just wanted me to tell you " ..
                "she had more business lined up.\n\nShe said she was headed over to the Dunemaul Compound " ..
                "to set up shop, something about ogres. Since you're done here, might as well head " ..
                "over...I wouldn't keep a goblin like her waiting.",
            rewardMoney = 3500,
        },
        [24906] = {rewardMoney = 6500},
        [24907] = {rewardMoney = 6500},
        [24910] = {rewardMoney = 13000},
        [24911] = {
            description = "Hey, you look like a discriminating adventurer. Are you looking for something " ..
                "different? Something exotic? Something... profitable?\n\nWell shake the sand out of your " ..
                "boots, because I've got a proposition for you. Williden Marshal is looking for competent " ..
                "sellswords such as yourself. He's set up camp at Marshal's Stand, just southeast of the " ..
                "volcano in the center of lush Un'Goro Crater.\n\nThen again, paradise isn't for " ..
                "everyone, <race>. It's up to you. Your tropical oasis awaits.",
            rewardMoney = 4000,
        },
        [24913] = {
            description = "Magtoor grows weaker by the second, <name>. My remedy is prepared... it must " ..
                "work. It must!\n\nYou have done so much for the both of us. I would be honored if you " ..
                "stayed for what may be Magtoor's final moments.",
            rewardItems = {{64597, 1}},
            rewardMoney = 16500,
        },
        [24914] = {
            description = "You can detect no hinges or openings on this box. Were it not for the shifting " ..
                "of items inside, it could easily be mistaken for solid metal.\n\nIf anyone could know " ..
                "the method of its opening, it would be Highlord Mograine.",
            rewardItems = {{51316, 1}},
            rewardMoney = 148000,
        },
        [24915] = {rewardItems = {{52200, 1}}, rewardMoney = 74000},
        [24916] = {rewardItems = {{52251, 1}}, rewardMoney = 74000},
        [24917] = {rewardItems = {{52201, 1}}, rewardMoney = 74000},
        [24918] = {rewardItems = {{52253, 1}}, rewardMoney = 74000},
        [24919] = {rewardItems = {{52252, 1}}, rewardMoney = 74000},
        [24920] = {
            description = "As much as I want to exact swift and brutal revenge... I must honor my son's " ..
                "memory first. He cared for his people first and foremost.\n\nThe Undertaker's Pass goes " ..
                "underground below Northgate River. You must prevent the plague from being deployed while " ..
                "we evacuate our men, women and children to Aderic's Repose.\n\nWe captured one of the " ..
                "Forsaken's dreaded bombing bats. I want you to fly the infernal beast as best you can " ..
                "and unleash hell upon those who seek to bring the Plague to our people. Hurry!",
            rewardMoney = 800,
        },
        [24921] = {
            description = "You there! Fresh off the boat? Welcome to Kalimdor, a land hellbent to kill " ..
                "you or die tryin'.\n\nThere's trouble at the hold - as I'm sure you noticed on your way " ..
                "in. Admiral Aubrey needs all hands on deck if we're to make it through this. Consider " ..
                "yourself drafted, <class>!\n\nFollow the road up the hill and you'll find Aubrey in the " ..
                "tower, topside.",
            rewardMoney = 700,
        },
        [24924] = {
            description = "The pygmies took most of our people back to their village. Who knows what evil " ..
                "they're up to?\n\n<name>, you have to go up there and free all of the captives before " ..
                "the pygmies work their voodoo on them!\n\nIzzy 's already up near Oomlot Village to the " ..
                "southeast. She'll give you the heads-up on what's going down.\n\nYour pygmy helmet looks " ..
                "like it's in bad shape, but it should last long enough for you to get there.\n\nI hope.",
        },
        [24925] = {
            description = "They've got a bunch of our people in there. I know that they're doing strange " ..
                "rituals to them. It looks like they're sucking the life force right out of them!\n\nYou " ..
                "have to go into the village and free the captives before it's too late!",
            rewardMoney = 225,
        },
        [24926] = {
            description = "Greetings. I unit A-Me 01. You... <race>?\n\nA-Me's mission to study the local " ..
                "gorillas was success. A-Me has gathered data that Karna needs.\n\nA-Me 01 not returning, " ..
                "though. A-Me has new family now. Here, with the gorillas, A-Me stay.\n\n< A-Me 01 " ..
                "detaches a small device from her hand and gives it to you.>\n\nYou bring data back to " ..
                "Karna. You tell her what happen.",
            rewardChoices = {{53571, 1}, {53572, 1}, {53573, 1}},
            rewardMoney = 15500,
        },
        [24927] = {rewardMoney = 13000},
        [24928] = {rewardMoney = 6500},
        [24929] = {
            description = "The Oomlot leader, Yngwie, is too powerful to be left alive. He's barking " ..
                "nonsense from the raised west side of the village, across the rope bridge.\n\nGo up " ..
                "there and get him before he sends the rest of the village against us.\n\nPiece of cake!",
            rewardChoices = {{52910, 1}, {52934, 1}, {52956, 1}},
            rewardMoney = 225,
        },
        [24930] = {
            description = "Fine by me if King Greymane wants you to risk your life to rescue a known " ..
                "traitor.\n\nDo me a favor and do something useful while you're out there and kill these " ..
                "cursed fleabags.",
            rewardChoices = {{54975, 1}, {54978, 1}},
            rewardMoney = 40,
        },
        [24931] = {rewardMoney = 7000},
        [24932] = {rewardMoney = 7000},
        [24933] = {rewardMoney = 7000},
        [24934] = {
            description = "<name>, the sea is our only lifeline, and right now most of my fleet is either " ..
                "steaming back to Theramore for repairs or rusting at the bottom of this bay. Only the " ..
                "Blackpool remains afloat to defend our harbor.\n\nBut she's just signaled that she's " ..
                "being boarded!\n\nSpeak to me when you're ready, I'll have one of our naval gryphons " ..
                "deposit you right on the deck. Slaughter the rageroar sea dogs who dare assault my " ..
                "precious ship and report to Captain Fisher for further orders.",
            rewardMoney = 2500,
        },
        [24937] = {
            description = "<name>, you have to get back to the Town-In-A-Box and warn them about the " ..
                "goblin zombies up in the volcano's caldera!",
        },
        [24938] = {
            description = "Captain Fisher signaled us from below. The Horde fleet is landing shore " ..
                "parties? We can't let them flank us from the beach.\n\nI've already sent two of my best " ..
                "gunners down there to defend the beach head. Talk to Cannoneer Smythe down on the " ..
                "shore.\n\nYou'll have to fight your way through the courtyard to get there. See if you " ..
                "can help the others secure the hold on your way down!",
            rewardMoney = 2100,
        },
        [24939] = {
            description = "We've got the hardware but not the manpower, <name>. Man one of the carronades " ..
                "on the shore here and take out those incoming boats!",
            rewardChoices = {{53268, 1}, {53282, 1}, {53296, 1}},
            rewardMoney = 2500,
        },
        [24940] = {
            description = "A whole bunch of our people headed up to the top of the volcano to mount a " ..
                "counter-offensive. There's something horrible brewing up there on the Lost " ..
                "Peak.\n\nThey're waiting for you before they make any moves against the pygmies. Those " ..
                "evil little things turned a lot of us into zombies!\n\n<name>, save us!",
        },
        [24941] = {
            description = "<class>! Thank the light - they've practically driven us back to the docks. " ..
                "The courtyard is overrun!\n\nWe're out of canister shot and the orcs are getting ready " ..
                "for an assault up the hill. We need to improvise some scatter-shot, and fast.\n\nHurry, " ..
                "run into the broken tower here and grab whatever sharp, pointy bits of scrap metal you " ..
                "can lay your hands on. Knives, forks, nails - anything! Load the cannon when you've got " ..
                "an armful!",
        },
        [24942] = {
            description = "Those zombies that got past us are nothing compared to the numbers waiting " ..
                "just through the pass. If we don't deal with them soon, the pygmy witch doctors are " ..
                "going to send all of them against the town, and even the cannons down there won't be " ..
                "able to handle that many!\n\nI brought a couple of shredder boots along. Greely modded " ..
                "them and now they're Super Booster Rocket Boots!\n\nUse the boots to incinerate the " ..
                "zombies in the Oostan villages to the east.",
            rewardChoices = {{52912, 1}, {52936, 1}, {52958, 1}},
            rewardMoney = 225,
        },
        [24943] = {
            description = "That's one way to clear a hill. Those corpses are impaled with knives and " ..
                "forks!\n\nThe Rageroar clan has breached the walls, but we can still turn this fight " ..
                "around. Go down the hill and help our men hold on to the courtyard below...",
            rewardChoices = {{53283, 1}, {53294, 1}, {53297, 1}},
            rewardMoney = 2500,
        },
        [24944] = {
            description = "This fight isn't over, <class>. Not by a long shot.\n\nSome of the soldiers in " ..
                "the courtyard still have breath in their lungs. We can save them! I've soaked these rags " ..
                "in an herbal remedy we used to rely on back in Gilneas. The smell is awful but this " ..
                "poultice can practically raise the dead.\n\nUse these bandages on wounded defenders down " ..
                "in the courtyard and we'll see if we can't get them back in the fight.",
            rewardMoney = 2500,
        },
        [24945] = {
            description = "Look, I think it's great that we're destroying all of these zombies, even " ..
                "though they're our friends and family. But don't you think we should be taking care of " ..
                "the pygmies that are creating them as well?\n\nAt the three Oostan villages, Nord, Sor, " ..
                "and Ost, there are witch doctors: Gaahl, Malmo, and Teloch.\n\nMaybe you could take care " ..
                "of them? I don't want to be turned into a zombie!",
            rewardChoices = {{52913, 1}, {52959, 1}},
            rewardMoney = 300,
        },
        [24946] = {
            description = "I'll give these pygmies one thing... they sure know how to party! But they're " ..
                "not so clever. I think I've discovered the source of their rockin' powers: Rockin' " ..
                "Powder!\n\nIt turns out that this stuff, which turns them into world-class rockers, is " ..
                "also highly explosive. We must have it!\n\nSo, while you're in there at Oostan to the " ..
                "east, make sure that you pickup a whole bunch of the stuff. Trust me, you're going to " ..
                "need it for what's coming up!",
            rewardMoney = 225,
        },
        [24948] = {
            description = "We'll never be able to re-secure the fortress walls so long as Rageroar and " ..
                "his goons have access to artillery. I need you to fight your way across that chasm and " ..
                "take out his big guns.\n\nOrcs season their heavy machinery with coal tar, which makes " ..
                "them flammable. Take my torch and burn any catapults you see north of " ..
                "Northwatch.\n\nThen, torch those big blade-throwers in Rageroar's base camp! Those " ..
                "things have killed enough of our men.",
            rewardMoney = 2500,
        },
        [24949] = {rewardMoney = 6500},
        [24950] = {rewardMoney = 13000},
        [24951] = {rewardMoney = 7000},
        [24952] = {
            description = "You need to get those boots down into the caldera to Hobart " ..
                "Grapplehammer.\n\nNow that they're infused with the leftover rockin' powder, they should " ..
                "have enough thrust to get you all the way there on one shot.\n\nWhen you're ready, " ..
                "activate the boots. Don't worry, they're automatically set to land you safely.\n\nI " ..
                "think.",
        },
        [24953] = {rewardMoney = 13500},
        [24954] = {
            description = "Volcanoth is the turtle god in the cave that these primitives worship.\n\nIt's " ..
                "not really a god.\n\n<Hobart rolls his eyes.>\n\nBut it is tough enough that I'm going " ..
                "to have to devise a new weapon for you from the one functioning boot we have left.\n\nI " ..
                "think that the age-old motto of \"fight fire with fire\" applies here. Plus, I like " ..
                "fire!\n\nLet's get some fire glands from Volcanoth's children. That should give me time " ..
                "to modify the rocket boot into something more fitting.",
            rewardMoney = 225,
        },
        [24955] = {
            description = "As I may have mentioned, I'm trying to get these Dunemaul ogres to join the " ..
                "Horde..and work for the Bilgewater Cartel as cheap local labor.\n\nTo pull this off, " ..
                "we've gotta pay lip service to the actual initiation process and all that, or I'm going " ..
                "to catch flak later on. So I've gotten this charter drawn up, and slapped the initiation " ..
                "rites onto our own limited time offer labor stipulation contract.\n\nI've got a disguise " ..
                "for you here, so suit up and get all these signatures filled out.",
            rewardMoney = 7000,
        },
        [24956] = {
            description = "I have encountered the Rageroar clan before, <name>. They are led not by an " ..
                "orc, but by a monster - a war-gorged fiend without a shred of decency or compassion. He " ..
                "and his lieutenants must be killed, not just to save Northwatch, but for the good of all " ..
                "of Azeroth.\n\nKarga Rageroar wears a helm. Execute him, <class>, and bring the helm to " ..
                "me. It is of... particular importance.\n\nRageroar has made his camp across the chasm, " ..
                "east of here.",
            rewardChoices = {{53266, 1}, {53289, 1}},
            rewardMoney = 6000,
        },
        [24957] = {
            description = "Okay, babe. Like I said, the ogres are too dumb to know what signing that " ..
                "charter meant. Now we have to actually get them to come along with us, so we'll be " ..
                "procuring what is apparently beloved local flavor.\n\nBeloved local flavor for drooling " ..
                "idiots, I mean.\n\nJust pop on over to the Noxious Lair to the west, it's that big " ..
                "horrible pit full of dangerous silithid. Kill a bunch of the Centipaar silithid and " ..
                "bring back the pieces so we can hand 'em out, okay? Ciao.",
            rewardMoney = 7000,
        },
        [24958] = {
            description = "It took a lot of blood, sweat, and tears, but the Bootzooka, patent-pending, " ..
                "is ready for use!\n\nThese no-good pygmies have been feeding our people to their " ..
                "\"god\", Volcanoth, and they're about to unleash it on our town!\n\nYou have to get into " ..
                "the cave and kill that thing before it's too late!",
            rewardItems = {{52914, 1}},
            rewardMoney = 600,
        },
        [24959] = {
            description = "<name>!\n\nRise, <name>!\n\nWelcome back to the realm of the living. With the " ..
                "blessing and power of the Dark Lady, I have freed you from death's grip.\n\nYou are no " ..
                "slave, <name>. You are free to follow whatever path you choose from here. If you choose " ..
                "to serve the Dark Lady Sylvanas, I recommend you speak with Undertaker Mordo. You will " ..
                "find him behind me, in the graveyard.",
            rewardMoney = 2,
        },
        [24960] = {
            description = "King, peasant, or <class>... I don't care WHAT you were before. I just need " ..
                "somebody with a working tongue.\n\nBeing raised from the dead is strenuous. Not everyone " ..
                "copes with it as well as you did. In particular, there are three newly-raised undead who " ..
                "are having trouble coping right now.\n\nI want you to find them and talk to them. It " ..
                "might be that they just need someone that they can relate with.\n\nYou'll find them here " ..
                "in the graveyard.",
            rewardMoney = 12,
        },
        [24961] = {
            description = "Earlier on, I saw a young Forsaken woman running towards the old inn. She was " ..
                "screaming for her life, pleading to be taken back home.\n\nNot all of us are as resolute " ..
                "as others, <name>. Even so, we must accept our fate as undead if we are to rise up " ..
                "against those that would put us down.\n\nTake my hand mirror and show it to the young " ..
                "woman. She needs to see what she really is, and join us in our cause. Besides... we can " ..
                "use all the bodies that we can get.",
            rewardMoney = 40,
        },
        [24962] = {
            description = "Ah, while you were off dealing with the mindless Scourge, this scroll arrived " ..
                "for you. I would think it's some matter of importance as it seems it bears the seal of " ..
                "the hunter trainer Xavier. I would take some time to read it before heading out again.",
        },
        [24963] = {
            description = "Okay, babe, listen up. There's two ways to get people to do what you want. You " ..
                "can provide goods, services, and things people want...or you can beat the living " ..
                "daylights out of them.\n\nI've often found it's useful to do both at the same time, and " ..
                "you're pretty familiar with both methods by now. Take these little silithid treats, go " ..
                "and beat some ogres dizzy, and then give them the treat before you knock them completely " ..
                "dead, 'kay?",
            rewardMoney = 7000,
        },
        [24964] = {
            description = "I've been told that I'm supposed to train you how to be a hunter. That's all " ..
                "well and good, but in my opinion, you'll get more training out in the field than you " ..
                "will talking about theories with me.\n\nGo out, get some more experience, and see if you " ..
                "learn any new tricks. Then you can come back and show me.",
            rewardMoney = 25,
        },
        [24965] = {
            description = "Let's get some work done, shall we?\n\nAs you grow in power, your connection " ..
                "to the arcane will deepen, granting you access to new spells.\n\nYou'll see. Go, get " ..
                "some more experience, then come back and demonstrate what you've learned.",
            rewardMoney = 25,
        },
        [24966] = {
            description = "A Forsaken priest is a curious beast, <his/her> path an unusual course. $G " ..
                "His: Her; shadowy rites cannot come from the Light, so <he/she> seeks a more sinister " ..
                "source.\n\nNot only has the world forsaken us, <name>... it seems the Light has left us " ..
                "as well. As the poem hints, however... we are not without power.\n\nGo, get more " ..
                "experience, grow your power. Return to me, and demonstrate what you have learned.",
            rewardMoney = 25,
        },
        [24967] = {
            description = "Quiet down! I don't want these novices around us to hear what we're about to " ..
                "discuss.\n\nListen up... <name>, is it? Soon, you'll learn something that'll change the " ..
                "way you operate as a rogue. You'll be able to follow up on your attacks with a deadly " ..
                "finishing move. Maybe even slide a dagger between their vertebrae.\n\nTo learn it, you " ..
                "just gotta get some more experience. Don't worry, you'll figure it out.",
            rewardMoney = 25,
        },
        [24968] = {
            description = "As you continue your career as a warlock, you'll begin to hear the voices of " ..
                "fel power... they will reveal their secrets, teaching you new spells.\n\nI want to see " ..
                "you learn a new spell and try it out on one of the dummies here.",
            rewardMoney = 25,
        },
        [24969] = {
            description = "If you want to become a stronger warrior, you'll need to work on your weapons. " ..
                "You'll find stronger swords and larger shields out on your adventures, that I have no " ..
                "doubt about.\n\nBut it isn't just your physical armory that will get stronger - you'll " ..
                "also begin to discover new techniques. Go, get some experience, learn something new, " ..
                "then come back and show me.",
            rewardMoney = 25,
        },
        [24970] = {
            description = "While you were inside that cave, your big friend Darnell came by with some " ..
                "alarming news.\n\nSince the val'kyr arrived, we've seen more and more undead that chose " ..
                "not to join our forces under the banner of the Dark Lady. They've been gathering at a " ..
                "small camp here in the valley, and now they've organized forces.\n\nThey plan to attack " ..
                "Deathknell, <class>.\n\nDarnell is just down the road, to the east. Be careful, <name>. " ..
                "While those undead aren't completely brainless, they're still not quite right in the " ..
                "head.",
            rewardChoices = {{3267, 1}, {3268, 1}, {3269, 1}, {5779, 1}},
            rewardItems = {{159, 1}},
            rewardMoney = 7,
        },
        [24971] = {
            description = "While you were taking care of matters for Executor Arren, I went off on an " ..
                "assignment of my own. Shadow Priest Sarvis asked me to peek in on the Rotbrain " ..
                "camp.\n\nThere's a reason why they're called Rotbrains.\n\nTheir leader goes by the name " ..
                "of Marshal Redpath, and he's an absolute beast.\n\nLook, <name>... the attack is " ..
                "starting. You're better in combat than I am. Get in there and help out!\n\nWhen you're " ..
                "done, meet up with Shadow Priest Sarvis in the chapel. Good luck, <name>.",
            rewardChoices = {{3276, 1}, {3277, 1}},
            rewardMoney = 200,
        },
        [24972] = {
            description = "<Sarvis produces a piece of paper from within his robes.>\n\nThese will need " ..
                "to be taken to my field agent, Deathguard Simmer. This information contains the " ..
                "whereabouts of the last few holdouts from the Scarlet Crusade. We will destroy these " ..
                "crusaders, once and for all. And I have a feeling you'll be instrumental in that effort, " ..
                "<name>.\n\nTake the road north out of Deathknell. Soon after entering Tirisfal proper, " ..
                "you'll see a large manse. Simmer's inside.",
            rewardMoney = 75,
        },
        [24973] = {
            description = "One of our greatest struggles is obtaining the natural resources we need to " ..
                "survive. Gold was scarce in Lordaeron, even in the height of the Alliance's power so " ..
                "many years ago.\n\nThere is a gold mine to the west that has been overrun with spiders. " ..
                "We need gold from the mine, but we can't very well get it while the spiders are crawling " ..
                "around in there. I've not much manpower to commit to the task, so we'll just have to do " ..
                "it little by little.\n\nGet up there and see what you can do for us, <name>.",
            rewardChoices = {{3270, 1}, {3272, 1}, {3273, 1}, {57139, 1}},
            rewardMoney = 75,
        },
        [24974] = {
            description = "You work hard your whole life, and what do you get? Killed by a plague. Then " ..
                "you work even harder in undeath, and what do you get? Money, yes, and a small estate " ..
                "with a few pesky hangers-on, but happiness? Not so much.\n\nI'm lonely in my old age, " ..
                "<name>. I need a companion. Use this leash on one of the murlocs at the Whispering Shore " ..
                "to the northwest. You'll have to weaken it first before it can be leashed. Then bring it " ..
                "back to me.",
            rewardMoney = 100,
        },
        [24975] = {
            description = "What have we here? You look like a fledgling <class>. If you hope to prove " ..
                "yourself to the Dark Lady, you need to learn the ways of the Forsaken.\n\nTo the west " ..
                "you'll find a farm. Humans infest the land like mold on a rotting corpse. And worse yet, " ..
                "the Scarlet Crusade patrols nearby from their tower. Teach those scum a lesson and steal " ..
                "10 of their precious pumpkins.\n\nOnce you have 10, bring them back to me.",
            rewardMoney = 125,
        },
        [24976] = {
            description = "These pumpkins have a purpose, <class>. They'll be the delivery mechanism for " ..
                "my latest batch of plague, which should be a particularly painful and virulent " ..
                "concoction. However, the plague requires a few rare ingredients.\n\nWe'll need " ..
                "Marrowpetals, which grow at the bottom of Stillwater Pond, just to the east of here. " ..
                "We'll also need Xavren's thorn, which grows on rocky cliffs to the northwest. Finally, " ..
                "we need some briny sea cucumbers, found in the surf off of Whispering Shore.",
            rewardChoices = {{57147, 1}, {57148, 1}},
            rewardItems = {{57790, 1}},
            rewardMoney = 125,
        },
        [24977] = {
            description = "Harmless pumpkins, right? Or so it would seem. If we are to defeat the Scourge " ..
                "advances from the North and the human infestation from the South we need to start " ..
                "realizing the full potential of our gift of undeath.\n\nWith a little ingenuity a simple " ..
                "pumpkin becomes an agent for our Dark Lady. This pumpkin, laced with my latest formula, " ..
                "will prove to be quite a treat.\n\nYet another Scarlet Zealot has been captured and is " ..
                "being kept outside, by the gazebo. Take this pumpkin to the fool.",
            rewardMoney = 35,
        },
        [24978] = {
            description = "Humans are notoriously fickle creatures. The farmers to the west are no " ..
                "exception. Sure, they may be plowing their fields peacefully now, but tomorrow, they may " ..
                "be raising their scythes against us. The Alliance looms close by in Gilneas, and the " ..
                "power of Stormwind looms to the south... any of these could recruit these tillers and " ..
                "use them as a wedge against us.\n\nI want them dead. See to it that it's done.",
            rewardChoices = {{57145, 1}, {57146, 1}},
            rewardMoney = 125,
        },
        [24979] = {
            description = "Lieutenant Gebler:\n\nHow curious that you would decide to take a prisoner... " ..
                "an undead one at that. What were you thinking? Do you think that, just because of the " ..
                "prisoner's former status, that she would be above the edicts of the Scarlet " ..
                "Crusade?\n\nThis is most troubling, Gebler. I would remind you that there are penalties " ..
                "for such behavior. I command you to execute the prisoner at once. She is no longer one " ..
                "of us.",
            rewardMoney = 100,
        },
        [24980] = {
            description = "We need someone with \"initiative\" like yourself to drive the Scarlet Crusade " ..
                "to the grave.\n\nProve to me you are capable of serving The Dark Lady by travelling west " ..
                "to the tower past the Solliden Farmstead and slaying 10 warriors of the Scarlet Crusade.",
            rewardMoney = 125,
        },
        [24981] = {
            description = "Information we've received from Executor Arren in Deathknell contain all the " ..
                "details we need to wipe the human infestation from the lands. According to the " ..
                "information, The Scarlet Crusade has assigned Captain Perrine and a brigade to the " ..
                "ruined tower southwest of Brill.\n\nKill 3 of his zealots and 3 of his missionaries. And " ..
                "while you're there, see if you can dig up any other information about what they're up to.",
            rewardMoney = 225,
        },
        [24982] = {
            description = "Speaking frankly, the Forsaken of yesteryear were a sniveling, pathetic group. " ..
                "We huddled together in decrepit old human buildings, hiding from the Scourge, cowering " ..
                "from the Alliance, and groveling at the foot of the Horde.\n\nLook before you now, and " ..
                "see the product of the new Forsaken. We have made our mark here on Azeroth, and that " ..
                "mark will grow. Our dominion will soon blanket the world!\n\nYou want my advice? Speak " ..
                "with Magistrate Sevren in Brill, down this road. He runs that town.",
            rewardMoney = 17,
        },
        [24983] = {
            description = "I need a fresh report from our Deathguard waystation to the east.\n\nI must " ..
                "know if more Scourge forces have slipped past The Bulwark and into Tirisfal. Our " ..
                "vigilance on the border to the Plaguelands must be maintained - we can't let the Scourge " ..
                "get a stronger foothold here!\n\nTravel south along the road, then east at the fork to " ..
                "the waystation. Speak with Deathguard Linnea. She has the information I need.",
            rewardMoney = 55,
        },
        [24988] = {
            description = "It's so cold, now. The Plague of Undeath crawls through my veins like an icy " ..
                "serpent. The mindless state will be upon me soon. But no doomed destiny will prevent me " ..
                "from serving our Dark Lady. When the call arose I sewed body bags for the fallen " ..
                "soldiers of Sylvanas's mighty army.\n\nNow my hands shake from the chill. If you would " ..
                "bring me five duskbat pelts, I could sew myself a blanket. Help me, <name>, so that I " ..
                "can continue to serve the cause.",
            rewardChoices = {{57151, 1}, {57152, 1}, {57153, 1}},
            rewardMoney = 225,
        },
        [24989] = {
            description = "You should return to Magistrate Sevren with the information I gave you. He'll " ..
                "want it as soon as possible, so be swift.",
            rewardMoney = 22,
        },
        [24990] = {
            description = "Lady Sylvanas has called upon the Royal Apothecary Society. She has challenged " ..
                "us to concoct a new plague, a plague deadlier than any ailment on Azeroth. This new " ..
                "disease will bring our enemies - living and dead - to ruin.\n\nMy studies show that the " ..
                "blood of beasts might prove to be the key. Here, fill these vials with darkhound blood " ..
                "so I can test my theory.",
            rewardItems = {{3382, 1}},
            rewardMoney = 125,
        },
        [24991] = {
            description = "As you're probably already realizing, the Royal Apothecary Society is a " ..
                "widespread organization. We take our plague-alchemy seriously. It is our belief that the " ..
                "more agents we have performing experiments, the sooner we will realize our " ..
                "objective.\n\nOne of our agents performs his work at a small encampment to the north of " ..
                "here. His name is Jerrod, and he could use an apprentice of your... stature.",
            rewardMoney = 22,
        },
        [24994] = {
            description = "My envoy just delivered me a bushel of gloom weed. Gloom weed! I don't need " ..
                "gloom weed, I need doom weed! You can see the predicament that I'm in, <name>.\n\nI'll " ..
                "make it worth your while to gather what I need. Bring back to me enough doom weed and " ..
                "I'll give you a suitable reward.\n\nIt is my understanding that they like to plague the " ..
                "flora near the mass gravesite, to the north of the Brill graveyard. Hurry and be mindful " ..
                "of the gnolls in the area.",
            rewardMoney = 175,
        },
        [24995] = {
            description = "While you were collecting samples for me, my experiments led me to realize " ..
                "that more reagents will be required for this new disease to spread properly. Poisoning " ..
                "some hapless victim is child's play. Plaguing an entire world proves to be a bit more " ..
                "complicated.\n\nI will need several scales from murlocs in the vicinity. You will find " ..
                "the creatures ambling brainlessly along the coast to the north.",
            rewardChoices = {{57149, 1}, {57150, 1}},
            rewardItems = {{3434, 1}},
            rewardMoney = 225,
        },
        [24996] = {
            description = "I am to understand that another one of those foolish Dwarven Mountaineers has " ..
                "just been captured. The deathguard has him stored here in this building, and they've " ..
                "assigned one of their own to persuade him not to escape.\n\nWhy don't you go see how the " ..
                "Captured Mountaineer enjoys this special drink I made for him? It contains a subtle hint " ..
                "of what The Dark Lady has planned for the rest of Azeroth.",
            rewardChoices = {{57143, 1}, {57144, 1}},
            rewardMoney = 125,
        },
        [24997] = {
            description = "The mass graves within the forest to the west of us were made to accommodate " ..
                "the... impressive... number of deaths Tirisfal suffered when the plague first " ..
                "came.\n\nThe bodies in these graves have so far been spared an undeath, but the Scourge " ..
                "now send Rot Hide gnolls to gather the corpses and use them to bolster their armies. " ..
                "This cannot be allowed!\n\nYour task is twofold: slay the Rot Hides at the mass grave " ..
                "and Garren's Haunt, and gather from them the embalming ichor that gives them life.",
            rewardChoices = {{3439, 1}, {6063, 1}},
            rewardMoney = 175,
        },
        [24998] = {
            description = "Maggot Eye is a foul beast, even by gnoll standards. He leads a band of " ..
                "renegade gnolls through the land, tearing up the glades and stealing whatever corpses he " ..
                "can find along the way.\n\nThose are our corpses! We had plans for those!\n\nMaggot Eye " ..
                "resides just up the path from us. Show him no mercy. Mercy is for the weak.",
            rewardChoices = {{57158, 1}, {57159, 1}, {57160, 1}},
            rewardMoney = 300,
        },
        [24999] = {
            description = "It seems that Jerrod has you hunting the murlocs to the north. That's good... " ..
                "we can use their parts for our poisons. I get a little worried sometimes, " ..
                "though...\n\nThe Vile Fin spawning grounds are not far off Tirisfal's northern coast, so " ..
                "you'll probably notice several tadpoles among the adults on the shore. If these " ..
                "impressionable young murlocs were to seek revenge against us... that could ruin us. Go " ..
                "chase them, and show them that the Forsaken and the Horde are not to be trifled with.",
            rewardMoney = 225,
        },
        [25000] = {
            description = "Hey, <class>!\n\nAre you headed to support Corporal Teegan? He's in charge of " ..
                "keeping the supply routes open.\n\nHe's got two of the most ornery dwarves I've ever met " ..
                "in charge of sundries. If you want to make an impression on those two crotchety hunters, " ..
                "you're going to need to show that you can hold your own against the predators around " ..
                "here.\n\nThe raptors west of the hold here are especially vicious. Bring Goucho some " ..
                "fresh hides and you'll make an impression while supplying the troops in one swoop.",
            rewardMoney = 3000,
        },
        [25001] = {
            description = "My other assistants are making sure our proud new comrades are put into comfy " ..
                "cages and shipped to where they're needed most. For the Horde. Meanwhile, we've got one " ..
                "last item on our agenda.\n\nSandscraper, the chief of the Dunemaul Clan, is probably too " ..
                "dumb to even be aware of what we're doing here. But I absolutely loathe unfinished " ..
                "business, babe. He's lurking in the den just over there to the west. Knuckle down, take " ..
                "him out, and we'll be good to sign off on this, 'kay?",
            rewardChoices = {{56887, 1}, {56888, 1}, {56889, 1}, {56890, 1}},
            rewardMoney = 14000,
        },
        [25002] = {
            description = "<You discover a cargo manifest on the body, detailing a long list of sundries " ..
                "urgently needed on the front.>\n\n<A bloody trail in the dirt indicates bodies were " ..
                "dragged south of here, toward the raptor dens.>\n\n<The raptors may have dragged away " ..
                "the supplies, as well. Retrieving those supplies for Corporal Teegan could help salvage " ..
                "this disaster!>",
            rewardMoney = 3000,
        },
        [25003] = {
            description = "The strongest point in the mills is the Agamand Family Crypt. With necromancy, " ..
                "Captain Dargol has raised the ancestors of the Agamands and plans to use them against " ..
                "us.\n\nThis cannot pass, and you must stop it. Travel to the Agamand Family Crypt and " ..
                "defeat the raised Agamand ancestors.",
            rewardChoices = {{57161, 1}, {57162, 1}, {57163, 1}},
            rewardMoney = 300,
        },
        [25004] = {
            description = "The Scourge are trying to form a base here at the Agamand Mills. If they do, " ..
                "then they can stage further attacks within Tirisfal.\n\nThe orders have been given. The " ..
                "Scourge in the Mills must be destroyed.\n\nCollect Notched Ribs from Rattlecage and " ..
                "Cracked Skull Soldiers, and Blackened Skulls from Darkeye Bonecasters.",
            rewardMoney = 450,
        },
        [25005] = {
            description = "I have destroyed the remains you've given me, <name>. That is, all remains " ..
                "except for these...\n\nDevlin Agamand was weak and sharp-tongued in life, and was among " ..
                "the first to succumb to the plague. He existed as a slave of the Scourge for a long " ..
                "time, longer than most. As such, he may possess knowledge that would be of value to " ..
                "us.\n\nBring his remains to Magistrate Sevren, and tell him what I've told you. He'll " ..
                "know what to do.",
            rewardMoney = 70,
        },
        [25006] = {
            description = "While the Frozen Throne lies dormant, the grasp that the Lich King once held " ..
                "over the Scourge grows ever-weaker. His grip on a weakling like Devlin Agamand should be " ..
                "weak enough that we can remove it entirely.\n\nSpeak with Shadow Priestess Malia in the " ..
                "manor on the east side of town. She will assist you in the procedure.",
            rewardChoices = {{57164, 1}, {57165, 1}},
            rewardMoney = 600,
        },
        [25007] = {
            description = "You've done much for us here, <name>, but <men/women> of your caliber are " ..
                "needed elsewhere.\n\nTo the east lies the Bulwark: a fortified barricade against the " ..
                "ravages of the Plaguelands. The Bulwark protects us from Scourge invasions, and has " ..
                "allowed us enough sanctity to build up our forces here in Tirisfal Glades.\n\nGo, speak " ..
                "with High Executor Derrington. He is an ally, and will doubtless appreciate whatever aid " ..
                "you can give him.",
            rewardMoney = 70,
        },
        [25008] = {
            description = "You probably caught wind of some of them Hecklefang scavengers on the way in - " ..
                "they reek worse than ol' Durty Pete here. Worthless animals! They steal our kills, " ..
                "rummage through our supplies, and worse... they ain't good for eatin'.\n\nGo kill " ..
                "some.\n\nThen kill some more, if you want to.",
            rewardChoices = {{53276, 1}, {53293, 1}},
            rewardMoney = 3000,
        },
        [25009] = {
            description = "Though the strength of the Scarlet Crusade wanes, we are still at war. The " ..
                "report Executor Arren sent me indicates Scarlet Crusaders have been raiding from the " ..
                "ruined tower in southeastern Tirisfal near the Balnir Farmstead under the command of " ..
                "Captain Vachon.\n\nKill 3 of his zealots and 4 of his friars. It should prove to be a " ..
                "devastating blow to the Crusade!",
            rewardMoney = 300,
        },
        [25010] = {
            description = "Shortly before you arrived at the Bulwark, I was approached by the most " ..
                "unusual young undead woman. She swore enmity against the Scarlet Crusade, so I sent her " ..
                "to work on our enemies to the north. You say you saw some dead crusaders earlier? Those " ..
                "were probably her work.\n\nGo check up on her, and see if she can use any assistance in " ..
                "her vendetta against the Crusade... though I wouldn't be surprised if she's already " ..
                "killed them all.",
            rewardMoney = 175,
        },
        [25011] = {
            description = "There isn't much more glory for you here on the Bulwark, <name>. You've done " ..
                "enough already. There may, however, be further adventures waiting in Silverpine " ..
                "Forest.\n\nSpeak with my bat man, Timothy Cunningham. He'll give you a ride to Brill, " ..
                "free of charge.",
            rewardMoney = 35,
        },
        [25012] = {
            description = "If you're headed back to Brill, you'll want to stop by Executor Zygand on your " ..
                "way out. I hear there's some excitement going on in Silverpine Forest, to the south. " ..
                "He'll know more than I do.\n\nSpeak with me again when you're ready to head out.",
            rewardMoney = 250,
        },
        [25013] = {
            description = "<Dithers samples his latest concoction.>\n\nHmm... this isn't quite there. It " ..
                "needs something to give at a little more zing. I've got it! The spiders to the north " ..
                "have a potent venom that'll do the trick. See if you can extract some for me, <name>?",
            rewardChoices = {{57166, 1}, {57167, 1}, {57168, 1}},
            rewardMoney = 350,
        },
        [25014] = {
            description = "Inside this weathered stone chest at the back of Stonescraper's lair, you find " ..
                "a curious artifact.\n\nShaped like a beetle, its surface is a smooth, brilliant blue, " ..
                "lined with gold. It looks mechanical, but unlike anything you've seen crafted by mortal " ..
                "hands, and very old.\n\nMegs will probably be interested in this.",
            rewardMoney = 3500,
        },
        [25015] = {
            description = "One of the native species in Kalimdor is the 'quilboar.' Prickly little " ..
                "buggers. Reason enough to hate this continent.\n\nThe raids started shortly after we " ..
                "established our forward camps. Worse, those spiny fiends seem to thrive in this thorny " ..
                "hell of a jungle. I need you to help beat them back so we can re-establish contact with " ..
                "Forward Command.\n\nWhile you're out there, acquire one of those twisted branches their " ..
                "casters seem to be using to manipulate the jungle growth...",
            rewardMoney = 3000,
        },
        [25017] = {
            description = "For years, this valley has been sealed behind impenetrable gates. Now that the " ..
                "cataclysm has torn them down, the secrets within are ours to discover.\n\nThere are yet " ..
                "some obstacles in the way. From within the gates, the bygone creations of the titans " ..
                "have awoken. They wander aimlessly across the sand, attacking any who " ..
                "approach.\n\nSomeone needs to destroy the golems patrolling the valley; are you up to it?",
            rewardChoices = {{56906, 1}, {56907, 1}, {56908, 1}},
            rewardMoney = 7000,
        },
        [25018] = {
            description = "Listen carefully, <name>. I don't know how those ogres got ahold of it, but " ..
                "that thing's a titan artifact. I'm no expert, but just that fact alone makes it probably " ..
                "older than the sand we're standing on.\n\nI also know that things like this are nothing " ..
                "but trouble. I don't want anything to do with it. Take it south, to the Valley of the " ..
                "Watchers, and give it to a blood elf named Andoren Dawnrise there. And don't ask any " ..
                "questions, babe, please.",
            rewardMoney = 3500,
        },
        [25019] = {
            description = "We are not the only ones who have discovered the value of the Southmoon Ruins. " ..
                "The dwarves of the Explorers' League have swarmed there, taking artifacts and " ..
                "inscriptions for the Alliance.\n\nI don't think I have to explain much further. We will " ..
                "not allow the discoveries here to fall into the hands of the Alliance. Slay as many " ..
                "dwarves as you can, and drive them from the ruins!",
            rewardMoney = 7000,
        },
        [25020] = {
            description = "At the Southmoon ruins, just east of here, we've made some finds. My " ..
                "colleagues have found stone shards, engraved with ancient writings, newly exposed by the " ..
                "shifting sands.\n\nThe writings are in no known tongue, though they bear resemblance to " ..
                "markings we've seen on other ruins of the titans. Deciphering them could reveal many " ..
                "more secrets.\n\nUnfortunately, my colleagues are also busy defending the tablets from " ..
                "the Alliance. I need you to go to the Southmoon ruins and retrieve the tablets yourself.",
            rewardMoney = 7000,
        },
        [25021] = {rewardMoney = 6500},
        [25022] = {
            description = "I told him he was a fool, but Ambassador Gaines insisted he could negotiate an " ..
                "alliance with the quilboar against the Horde. Even if he succeeded, I for one wouldn't " ..
                "want to fight with those... pig-men at my side.\n\nWell, Gaines hasn't returned, and " ..
                "General Hawthorne will hold me accountable if I lose one of our best negotiators to " ..
                "these squealing savages.\n\nLocate the Ambassador in this steaming mess of a jungle and " ..
                "rescue him if he's still alive.",
            rewardMoney = 3000,
        },
        [25023] = {
            description = "Alright then, grab onto the ladder. We gotta get outa here!\n\nWe'll make a " ..
                "flyby of the town, and then I'm gonna get you to some old friends!",
        },
        [25024] = {
            description = "The Alliance have caught back up with us at just the wrong moment, my friend. " ..
                "We took care of their ships, but they still have planes that are dropping their vaunted " ..
                "127th Paratroopers onto the coast below.\n\nIt's all that the battlesworn and scouts can " ..
                "do to hold the two ramps against their overwhelming numbers. I'm certain that if you " ..
                "were to aid them, the tide would quickly be turned.",
            rewardMoney = 300,
        },
        [25025] = {rewardMoney = 6500},
        [25026] = {rewardMoney = 6500},
        [25027] = {
            description = "According to Gaines, \" Three-Tooth \" is what the quilboar call their " ..
                "matriarch. She's been twisting the thorns of this crazy jungle to her own ends, and it " ..
                "was her orders that Gaines be \"torn apart and fed to the overgrowth.\" Nice " ..
                "lady.\n\nLet's give her a taste of her own. Take the Bramblestaff you recovered, and use " ..
                "it on Three-Tooth to take her out of the picture. Then kill the crones she's been " ..
                "training, to ensure nobody else can take her place.",
            rewardChoices = {{53287, 1}, {53302, 1}},
            rewardMoney = 3000,
        },
        [25028] = {
            description = "Teegan's a fool to think the quilboar caused this sudden overgrowth. Look " ..
                "around you. I've been watching these plants bloom and sprout daily - each generation is " ..
                "more mutated than the last. This isn't tribal magic - it's something primal. And " ..
                "dangerous.\n\nThe day before last a great druid passed through our camp. Seek out " ..
                "Naralex, somewhere in the midst of this jungle. He'll know what to do.\n\nAnd bring him " ..
                "some plant samples from around the overgrowth to help his studies.",
            rewardMoney = 3000,
        },
        [25029] = {
            description = "The Agamand family was the most prosperous family in Tirisfal Glades. I used " ..
                "to work their mills...before the plague.\n\nWhen the Scourge first came, the Agamands " ..
                "fortified their home and convinced those in their employ to remain and help them defend. " ..
                "We were fools, but at least we were loyal fools.\n\nThe Agamands, in their pride, doomed " ..
                "us to undeath. And now they are minions of the Scourge!\n\nServe the Forsaken by " ..
                "defeating the Agamands who fell to the plague. Serve me by bringing me their remains.",
            rewardChoices = {{3440, 1}, {3446, 1}},
            rewardMoney = 300,
        },
        [25030] = {
            description = "You sense a malign presence coming from within the skull of the beast. Coleman " ..
                "Farthing may be interested in seeing this.",
            rewardMoney = 600,
        },
        [25031] = {
            description = "The Agamand Mills, to the west, have been lost to the Scourge. The Agamand " ..
                "family has been slain, and the entire residence has been claimed by the Scourge.\n\nThis " ..
                "is probably the largest Scourge outpost in Tirisfal, <name>. If you think you're enough " ..
                "of a <class>, head up there and speak with Coleman Farthing. He's been doing his best to " ..
                "take the land back, and he'll need help. Just follow this road, it'll take you right to " ..
                "him.",
            rewardMoney = 70,
        },
        [25032] = {rewardMoney = 13000},
        [25034] = {
            description = "I'd love to keep you here behind the lines, but it looks like you've been " ..
                "summoned to the front. Ambassador Gaines - remember him? - has relocated to Forward " ..
                "Command and in his latest missive he's requested you, personally, to assist " ..
                "him.\n\nYou'll find our Forward Command operation south of here, in what's become known " ..
                "as the \"Fields of Blood.\"\n\nBe careful, <name>. The Horde has taken to ambushing some " ..
                "of our officers en route.",
        },
        [25035] = {
            description = "Vol'jin be callin' for an all out attack on da naga that have taken over our " ..
                "northern isle. Many of our men were already engaged with their forces near da bridge, " ..
                "but several of us are breakin' through their lines ta assault their isle " ..
                "itself.\n\nSpeak to Jornun right 'ere to secure a ride to da isle. Once there, seek out " ..
                "Morakki, da Captain of da Watch. He will be tellin' ya how ya can aid in da battle.",
            rewardMoney = 20,
        },
        [25036] = {
            description = "The Admiral will be pleased that Northwatch is almost secured, but if we're to " ..
                "keep a grip on this continent we're going to need to maintain the supply lines to the " ..
                "interior.\n\nJust before the assault I received the strangest of reports from Corporal " ..
                "Teegan, who's in charge of maintaining our contact with Forward Command. Says he's " ..
                "having trouble with the \"jungle?\" There's no jungle in the Barrens!\n\nFollow the " ..
                "upper road out of Northwatch and see if you can render any assistance to our wayward " ..
                "Corporal.",
        },
        [25037] = {
            description = "Perhaps me agin' body is just growin' too picky after all dese years, but boar " ..
                "meat just ain't goin' down easy no more. More for da new recruits I be thinkin'.\n\nWe " ..
                "just set out some crab traps, but if ya be willin' ta help an impatient old troll, I'd " ..
                "love ta have some fresh crawler meat right now. Dey're all around da island, but da best " ..
                "spot ta be huntin' them is off da eastern coast.",
            rewardMoney = 50,
        },
        [25038] = {
            description = "Master want weeds. Us gots big hands and not good at picking. You help us and " ..
                "we not hurt you. Us need gloom weed. Many weeds around here and near road.\n\nWhen you " ..
                "have gloom weed you take to Master Holland in Brill.",
            rewardMoney = 65,
        },
        [25041] = {
            description = "Respect the lion, <name>! A ferocious killer. You gotta admire the elegance of " ..
                "the beast... Muscle and claws... Running down its food... So primal...\n\nI'm sorry, my " ..
                "mind wandered. As I was saying, I respect these lions, but they're just murder on our " ..
                "patrols. I mean that literally. The men are afraid to go to the bathroom alone at night. " ..
                "Can you help make our camp a little safer?\n\nBarrens lions like to linger under trees.",
            rewardMoney = 3000,
        },
        [25042] = {
            description = "It's true what they say: An army marches on its stomach. And we've been " ..
                "marching a long way.\n\nI'm thinking if we barbecue up a few of those giant lumbering " ..
                "stormsnouts, we'll have enough meat to feed us for weeks.\n\nStormsnouts are big and " ..
                "slow, so they should be easy to kill. Except... Hey you're not carrying any metal on you " ..
                "are you?",
            rewardChoices = {{53284, 1}, {53286, 1}, {53299, 1}, {53304, 1}},
            rewardMoney = 3000,
        },
        [25043] = {
            description = "The Horde has taken to calling this region the \"Fields of Blood.\" It's an " ..
                "apt name: these reeds run red with the blood of some of my best men.\n\nI've sent out " ..
                "recon patrols to crush the quilboar and report on the Horde troop movements, but not all " ..
                "of them return. They could use your support out there.\n\nPatrol the fields and seek out " ..
                "the Desolation Grunts that are causing us so much grief. Do not expect them to " ..
                "surrender; their Warchief has instructed them to fight to the death.",
            rewardMoney = 3000,
        },
        [25044] = {
            description = "I have not forgotten my brush with death at the hands of the quilboar in that " ..
                "filthy jungle. The General here has ordered some tactical strikes, but he stops short of " ..
                "genocide. I have no such qualms.\n\nTake this horn that I 'borrowed' during my " ..
                "negotiations. Blow the horn within the Bristleback challenge ring west of our position - " ..
                "you can't miss it. I want you to challenge the champion of the Bristleback, Sabersnout, " ..
                "to single combat. His death in front of his followers will leave them in utter chaos.",
            rewardChoices = {{53265, 1}, {53292, 1}, {53267, 1}},
            rewardMoney = 6500,
        },
        [25045] = {
            description = "Strategically, control of a region requires constant observation. See here on " ..
                "this map - I've identified a number of strategic hills, similar to this one, that the " ..
                "Alliance must acquire if we are to keep the enemy under our thumb.\n\nMy scouts have " ..
                "already marked their location on the field. What I need is someone to spearhead their " ..
                "capture, and you're the <man/woman> for the job.\n\nSeek out neutral grey flags on hills " ..
                "to the north, east, and south of the Taurajo Ruins. Capture one and defend it!",
            rewardChoices = {{53275, 1}, {53291, 1}, {53301, 1}},
            rewardMoney = 3000,
        },
        [25046] = {
            description = "The whisper continues:\n\n<\"My name is Lilian Voss. Before I died, I was a " ..
                "member of the Scarlet Crusade. My father, High Priest Voss, raised me to be a weapon " ..
                "against the plagued. I studied stealth, sorcery, martial arts, anything to make myself " ..
                "stronger. I gave up my childhood for him.\">\n\n<\"Then, as fate would have it, I died " ..
                "and returned as... this. My father instantly forgot me and, when I returned, ordered me " ..
                "executed.\">\n\n<\"Come. We will speak with him now, in his tower to the northwest.\">",
            rewardChoices = {{57169, 1}, {57170, 1}, {57171, 1}},
            rewardItems = {{57791, 1}},
            rewardMoney = 700,
        },
        [25047] = {
            description = "This badly broken figurine was discarded by its last owner. However, with the " ..
                "right materials and your skill in jewelcrafting, it could be completely restored.",
            rewardItems = {{52199, 1}},
        },
        [25048] = {
            description = "If we want to convince Mister Noggenfogger to let us move more gnomes here, " ..
                "we've got to show him just how nice we are! I know just the thing.\n\nGadgetzan's under " ..
                "blockade by pirates, but plenty of the goods that get blown off the ships survive " ..
                "intact... they just wash away. Most of them wash up in the shallows just south of " ..
                "town.\n\nIf you could go collect those supplies for them, it'd help us make friends! And " ..
                "it'll keep that mean goblin girl over there from taking them and selling them.",
            rewardMoney = 6500,
        },
        [25049] = {
            description = "There's a big problem here! It's great that the ocean came in so far, because " ..
                "now ships can get to Gadgetzan. But now there's a bunch of nasty old sea giants " ..
                "encroaching on the town! I'm sure Mister Noggenfogger would appreciate us taking care of " ..
                "them for him.\n\nDon't worry, I won't ask you to do it just out of the goodness of your " ..
                "heart! Take care of them and I'll give you a reward!",
            rewardMoney = 6500,
        },
        [25050] = {
            description = "When the water came in, Steamwheedle Port to the east was flooded, and a lot " ..
                "of poor goblins are still stuck there! Now those mean pirates are shooting at any boat " ..
                "that leaves the docks here.\n\nBut they won't expect us to fly! There's a hot air " ..
                "balloon by the docks. We can use that, fly over to rescue the goblins, and take care of " ..
                "the pirates, too. Mr. Noggenfogger will be so pleased!\n\nGo to the docks and hop in the " ..
                "balloon and I'll be right behind you, okay? I've got to get some rockets...",
            rewardChoices = {{56859, 1}, {56861, 1}, {56862, 1}, {56860, 1}},
            rewardMoney = 6500,
        },
        [25051] = {rewardMoney = 4000},
        [25052] = {
            description = "Well gosh, as you can plainly see there's this really big battle with these " ..
                "pirates here going on. We're doing our best to make sure they never bother Gadgetzan or " ..
                "our new gnomish homes there ever again!\n\nBy killing them.\n\nSo how about helping us? " ..
                "We really wanna make sure we kill more than green-nose over there and her awful thugs. " ..
                "I'd really appreciate it!",
            rewardChoices = {{56875, 1}, {56876, 1}, {56877, 1}, {56878, 1}},
            rewardMoney = 13000,
        },
        [25053] = {
            description = "You know, this place would probably make a great home for us gnomes if it " ..
                "wasn't so old and dirty and full of pirates! We're taking care of the pirates problem, " ..
                "but the awful and dirty problem needs fixing.\n\nI mean, no self-respecting gnome would " ..
                "ever live in such an ugly hovel like these buildings! So here, take this bottle of " ..
                "flaming rum and go burn those ugly shacks down for us!",
            rewardMoney = 6500,
        },
        [25054] = {
            description = "It's just really so wasteful that all these pirates have golden treasures " ..
                "lying around. Some of this stuff could be used for practical things! Like melting into " ..
                "wire, or intrinsic shielding matrices, or selling to other stupid races that buy gold " ..
                "just to keep it around.\n\nAnd speaking of other stupid races, I bet those greedy " ..
                "goblins are going to be taking all of it. We can't let that happen! Go collect that " ..
                "treasure for Gnomeregan!",
            rewardMoney = 6500,
        },
        [25056] = {
            description = "Have you seen the plagued bruins that wander to the west of here? Those " ..
                "hides... so hideous, so diseased, so... perfect!\n\nFetch me 5 of them. I've got an idea " ..
                "for an anti-Scourge poison that's guaranteed to succeed!",
            rewardMoney = 300,
        },
        [25057] = {
            description = "Our policy of conscripting non-violent criminals from the Stormwind Stockades " ..
                "has come back to haunt us, <name>. Some of my less-scrupulous soldiers broke ranks after " ..
                "our victory in Taurajo and are looting the remains of the city.\n\nThis is a breakdown " ..
                "in discipline. Worse, the desecration of their homes only spurs the enemy to fight " ..
                "harder when our ultimate goal should be peace.\n\nTake these manacles and bring the " ..
                "Taurajo looters to justice. Speak to them first, but you may need force to subdue them.",
            rewardMoney = 3000,
        },
        [25058] = {
            description = "The paratroopers have mined the beach!\n\nThe Warchief asked me if there's " ..
                "anything we can do about that. I told him, 'You bet we can!'. I was thinking maybe you " ..
                "could take this satchel of grenades and detonate the land mines from a safe " ..
                "distance?\n\nIt's how we do things, right?!",
            rewardMoney = 300,
        },
        [25059] = {
            description = "The General is too preoccupied with the looters in Taurajo. Too soft! We ought " ..
                "to be focused on our next move against the Horde.\n\nThere's valuable intelligence that " ..
                "might be compromised if we allow the ruins of Taurajo to continue to burn. While you're " ..
                "running the General's errand, dig around for any maps or notes you can find. I can speak " ..
                "a little of the orcish tongue - I'll be able to make sense of what you find.",
            rewardMoney = 3000,
        },
        [25060] = {
            description = "We received reports that a goblin shipwreck occured on this beach some time " ..
                "ago, with the survivors left to fend for themselves. We expected there to be a modicum " ..
                "of survivors, perhaps some even suitable for interrogation.\n\nWhat we found was a crew " ..
                "of Bilgewater goblins who have all become insane, delusional, and maniacally " ..
                "violent...to further degrees than is normally observed, rather.\n\nIn short, they are " ..
                "useless and dangerous. Gnomeregan will be best served by cutting down as many as we can.",
            rewardMoney = 7000,
        },
        [25061] = {
            description = "Psst! Hey! Come closer, you fool, you expect me to read your mind or--oh. Come " ..
                "closer anyway!\n\nYou've done a wonderful job advancing the agenda of Gnomeregan here, " ..
                "friend! And an amazing job of pretending you were only in it for the coin, simply " ..
                "splendid. But now Kelsey Steelspark could use more of your direct help.\n\nShe's moved " ..
                "on yet again...she asked me to tell you to meet her far south, at Land's End Beach. I " ..
                "wouldn't keep her waiting, either!",
            rewardMoney = 3500,
        },
        [25062] = {
            description = "Gnomeregan previously learned that the Bilgewater goblins of the Horde " ..
                "survived a crash on an uncharted island near Kalimdor before arriving in Durotar. We " ..
                "initially came here to investigate what techniques and technology could possibly allow a " ..
                "hopeless pack of imbeciles to survive such harsh conditions.\n\nWhile the goblins are at " ..
                "a loss, we still need to find out exactly what happened here. Search the beach for " ..
                "wreckage and belongings and bring anything that appears significant back to me.",
            rewardMoney = 7000,
        },
        [25063] = {
            description = "We need to obtain the object described in this journal, for certain. " ..
                "Extracting it from a chest would be a feasible matter, but the object itself sounds " ..
                "compromised, and unstable. Attempting to forcefully open the chest could be " ..
                "disastrous.\n\nFortunately, we know where the key is...statistically speaking, at least. " ..
                "There's plenty of sea turtles at the east end of this beach. One of them may hold the " ..
                "key.",
            rewardMoney = 7000,
        },
        [25064] = {
            description = "Moraya has been lookin' for some help with tha raptors. Ya should talk to her " ..
                "on the other side of Darkspear Hold when ya get a chance.",
            rewardMoney = 5,
        },
        [25065] = {
            description = "It's time to conclude this matter efficiently. From what we've determined, " ..
                "this mysterious object is in the possession of the \"smart\" brute described in the " ..
                "journal. We don't know exactly what's happened to this creature, obviously, so you " ..
                "should take caution.\n\nThis... \"Meatface\" is hiding in the hills, near where these " ..
                "goblins bury their dead. Look for the graveyard and he should be just past it.",
            rewardChoices = {{56883, 1}, {56884, 1}, {56885, 1}, {56886, 1}},
            rewardMoney = 14000,
        },
        [25066] = {
            description = "This is ridiculous! Those gnomes just don't know when to stop!\n\nGoblin pride " ..
                "is on the line here! <name>, you gotta jump into the Pride of Kezan and show them what's " ..
                "what!\n\nLet me know when you're ready!",
            rewardChoices = {{52916, 1}, {52961, 1}},
            rewardMoney = 600,
        },
        [25067] = {rewardMoney = 21000},
        [25068] = {
            description = "The creatures wandering these ruins are Earthen, the ancient ancestors of " ..
                "dwarves, made by the Titans to shape the world itself.\n\nThe original Earthen broke " ..
                "down and went awry thousands of years ago, and these freshly uncovered ones seem no " ..
                "different. We may as well make use of these confused and unstable constructs.\n\nEnter " ..
                "the ruins and destroy the Earthen, and collect the jewels embedded in them; their " ..
                "magical energies will be both valuable and worthy of study.",
            rewardMoney = 7000,
        },
        [25069] = {
            description = "We are ready to enter the antechamber itself, <name>. This is a momentous " ..
                "occasion.\n\nFrom the writings you've brought us, I believe these ruins were in fact " ..
                "once the grand entrance to Uldum itself. The quakes that ripped its doors open have " ..
                "probably collapsed the tunnels, but we may yet find amazing things hidden " ..
                "within.\n\nSearch the ruins for anything intact that may be studied. The thrill of " ..
                "discovery awaits!",
            rewardMoney = 7000,
        },
        [25070] = {
            description = "As you lay your hand upon the chest, a faint rumbling can be heard. The sound " ..
                "of grinding movement echoes behind you as the chest begins to shut itself.\n\nSomething " ..
                "is approaching!",
        },
        [25072] = {rewardMoney = 7000},
        [25073] = {
            description = "You've be doin' quite well for one so young. I've no doubts you'll be makin' " ..
                "quite da name for yarself.\n\nGo now, northwest, across da shallows ta Sen'jin Village. " ..
                "Dere you'll be meetin' Master Gadrin. He'll likely have a task or two for ya before ya " ..
                "truly make ya way out into the Durotar wilds.\n\nPlease remember, <name>, we may " ..
                "disagree wit' the young Hellscream at times, but his intentions are noble, and it be " ..
                "very important that we remain united as one Horde. Make da Darkspear proud.",
            rewardMoney = 10,
        },
        [25074] = {
            description = "Thanks in part to your efforts, we've stabilized the situation here. We need " ..
                "to turn our attention south, to Fort Triumph.\n\nFort Triumph is the keystone of our " ..
                "operation in the Barrens - the vital land-link between Northwatch and Theramore.\n\nI'll " ..
                "pack up and head out separately. Report to Commander Roberts at the fortress and I will " ..
                "see you there soon. Together, we will secure the frontier!",
        },
        [25075] = {
            description = "These bulky dwarven siege engines aren't cut out for the close-quarters " ..
                "fighting of the Battlescar.\n\nI've got some new designs I'd like to try out, but first " ..
                "I'm going to need some spare parts. There's plenty of wreckage sitting in the " ..
                "Battlescar. All I need is an enterprising <class> to haul it back for me.\n\nThat's you, " ..
                "<name>. I'm talking about you.",
            rewardMoney = 3500,
        },
        [25079] = {
            description = "Our shipments of saltpeter from Dustwallow have been held up, which means we " ..
                "can't manufacture our own gunpowder here.\n\nBut I can retrofit our armaments to use " ..
                "goblin Blast-O powder. It's unstable, dangerous, toxic to the skin, and harmful if " ..
                "swallowed... but I think I can make it work!\n\nGet me a keg of the stuff by attacking " ..
                "one of those goblin sapper specialists who've been storming our walls.",
            rewardMoney = 3500,
        },
        [25080] = {
            description = "Okay! Using the spare parts you've found for me, I've got a framework roughed " ..
                "out for my versatile new assault vehicle. All I need now is a compact power " ..
                "supply.\n\nI've noticed that the indigenous wildlife here packs quite the punch, " ..
                "electrostatically speaking. Can you hunt down Thunderheads near the base here and get me " ..
                "an intact electrogizard? It might take a few kills to find a usable gland.",
            rewardChoices = {{53270, 1}, {53281, 1}, {53285, 1}, {53303, 1}},
            rewardMoney = 3500,
        },
        [25081] = {
            description = "The Horde has fought us to a standstill from their stronghold west of here. " ..
                "The fighting continues, even as the land breaks open under our feet.\n\nSomeone's got to " ..
                "break the stalemate! I need you to venture into the Battlescar and help my men crush the " ..
                "Horde opposition there.\n\nIn the center of the scar you will find a flag marker " ..
                "designating who controls the area. Scout out the flag. It'll be worth your while to " ..
                "claim the scar for the Alliance if someone hasn't already done so.",
            rewardMoney = 7000,
        },
        [25082] = {
            description = "Why high command decided that a silithid mound was the ideal place to build a " ..
                "fortress, I'll never know. Them lil' buggers are tunneling under our fortifications and " ..
                "setting back our timetables. We need to scorch 'em out!\n\nTake this here bucket of " ..
                "burning pitch and dump it on the silithid mounds right outside the main gate. They look " ..
                "like big piles of sand. Kill anything that comes out, but be careful, <name> - them " ..
                "nasties are likely to swarm you when you light those mounds up.",
            rewardMoney = 3500,
        },
        [25084] = {
            description = "A moment there, <class>.\n\nWe've got more problems here than just the end of " ..
                "the world as we know it. Our vigil here's threatened by the quilboar. We've been content " ..
                "to leave them be when they stay in the Kraul, sure, but every day they press further and " ..
                "further out towards our camp.\n\nMahka, bless her green heart, wouldn't ever forgive me " ..
                "if I went out bashing heads in myself, but if you could help drive back those that're " ..
                "wandering near the camp, I'd appreciate it.",
            rewardMoney = 3500,
        },
        [25085] = {
            description = "Una here used to spend time in Camp Taurajo. She's told me about a quilboar " ..
                "that used to be captured there, named Mangletooth. Quite the clever one, for a " ..
                "quilboar.\n\nI've been tryin' to think what got these quilboar riled up so much " ..
                "recently, and it might be that Mangletooth escaped Taurajo alive. If he has, he's " ..
                "certainly calling the shots.\n\nThere's a large hut up in the hills to the northwest. If " ..
                "you find Mangletooth there, cut 'im down.",
            rewardChoices = {{53279, 1}, {53288, 1}, {53290, 1}, {53269, 1}},
            rewardMoney = 3500,
        },
        [25086] = {
            description = "Can you do me a huge favor, <name>? My sister-in-law's uncle is in the Earthen " ..
                "Ring, and he's here in the Barrens studying the impact of the Cataclysm, down at " ..
                "Firestone Point. He says their camp is surrounded by quilboar and I worry that they " ..
                "might get overrun.\n\nCan you check in on Dorn Redearth for me? I'd hate for anything to " ..
                "happen to him, what with the close family bond and all.",
        },
        [25087] = {
            description = "The Alliance owes a debt to the dwarves of Bael Modan, who built some of our " ..
                "earliest fortifications in the Barrens.\n\nTheir commander, General Twinbraid, is a real " ..
                "stalwart. One of our best. He's on patrol south of here, keeping the Horde on their " ..
                "toes.\n\nI definitely want to keep him appraised of the situation here so we can " ..
                "coordinate our next move. Can you deliver this frontline report to him in the field?",
        },
        [25089] = {
            description = "Darnell tells me that the two of you have already met. That's good, because " ..
                "I'm sending you both into Deathknell. Your work is done here.\n\nSpeak with Deathguard " ..
                "Saltain in Deathknell, to the north. He will tell you more of what you must know.",
        },
        [25090] = {
            description = "Scourge have trickled into Tirisfal Glades and have infested this area.\n\nI " ..
                "need someone to beat back the rotting dead and ravaged corpses that have taken this " ..
                "small farm. Scatter their bones and bring back their putrid claws. The Deathguards will " ..
                "reward you.",
            rewardMoney = 100,
        },
        [25091] = {rewardMoney = 3000},
        [25093] = {
            description = "These orcs were murdered in cold-blood by the Alliance down on the coast. We " ..
                "did nothing to provoke them.\n\nTheir deaths should not be in vain, <name>. Will you " ..
                "bring them justice?\n\n< Aggra appears as if she can barely contain her rage.>\n\nThere " ..
                "are three SI:7 leaders down there along the beach. Bring me each of their heads.",
            rewardChoices = {{52915, 1}, {52960, 1}},
            rewardMoney = 350,
        },
        [25094] = {
            description = "Splendidly done! But you'll be fighting more than mere humans!\n\nYour next " ..
                "opponent's a mean one...watch out for his right hook. And his left. I'd be wary of his " ..
                "fists in general.",
            rewardMoney = 21000,
        },
        [25095] = {
            description = "I hope you're ready for the next one, <name>. One mistake could mean instant, " ..
                "painful death! But that's what the people pay to see, isn't it?\n\nI hope you're not " ..
                "afraid of bugs...",
            rewardMoney = 21000,
        },
        [25098] = {
            description = "True to his word, Thrall is going to get us going in the right direction to " ..
                "rescue our people. He asked to speak with you.\n\nGood luck, <name>. We're all depending " ..
                "on you.",
        },
        [25099] = {
            description = "Head back down to the coast and tell Kilag that I'd like for you to borrow " ..
                "Bastia. The panther knows the way to where your friends are being held captive.\n\nGo " ..
                "now. I will see you again before we make our move against the Trade Prince.",
        },
        [25100] = {description = "Bastia will make sure that you get to where you need to go, goblin."},
        [25102] = {
            description = "Twinbraid's patrols always throw us right into the thick of danger. If it's " ..
                "not Horde ambushes, it's a quilboar hit-and-run.\n\nThe problem is them lousy landquaker " ..
                "kodos. Big walkin' walls of fur, shakin' the ground... We can't see or hear an ambush " ..
                "creepin' up on our backside.\n\nGo scare 'em off from our patrol, here. Killing a few " ..
                "should drive the herd south and out of what's left of me hair.",
            rewardChoices = {{53277, 1}, {53278, 1}, {53298, 1}},
            rewardMoney = 3500,
        },
        [25103] = {rewardMoney = 3500},
        [25104] = {
            description = "The patrol's been quiet today. And that's got me worried, <name>.\n\nEver " ..
                "since the Alliance sacked Taurajo, none of our positions are secure. You look like you " ..
                "can handle yourself - can you scout around for me?\n\nCheck in with my son Marley " ..
                "outside the Bael Modan excavation, southeast of here. The site's exposed and susceptible " ..
                "to raids, and my son's too proud to signal for help if he needs it.",
        },
        [25105] = {
            description = "Lila's pet Nibbler got into my workshop again!\n\nI was making a bracelet, to " ..
                "be delivered today. The work was almost done, except for the gems. I spent all night " ..
                "cutting them, but when I stepped out for a bit of breakfast, the little beast came into " ..
                "my workshop and swallowed every gem in sight! The thing can digest ANYTHING, and trust " ..
                "me, you'd break your back trying to pick up its leavings.\n\nI need to get replacement " ..
                "gems fast; the courier is coming in tonight. Help!",
        },
        [25106] = {
            description = "Look at the chaos down there, <name>! I've instructed the foremen to save what " ..
                "artifacts they can. Who knows what treasures these tauren animals are like to make off " ..
                "with.\n\nCan you help get a handle on things? Kill the raiders and save what artifacts " ..
                "you can.\n\nWhile you're at it, look for my missing tools. A few quick repairs and I can " ..
                "get this flying machine up and running again.",
            rewardMoney = 3500,
        },
        [25107] = {
            description = "At the bottom of the chest, you find a large tablet. Made of a material " ..
                "resembling stone, but completely smooth and flawless, it is covered in strange " ..
                "writing.\n\nWhile some resembles the writing on the walls, other scripts appear " ..
                "completely different. Andoren would probably like to see this.",
            rewardChoices = {{56900, 1}, {56901, 1}, {56902, 1}},
            rewardMoney = 14000,
        },
        [25108] = {
            description = "Saddest story I ever heard told, <name>. Feegly was one of our fastest " ..
                "diggers, until he got a hold of that - thing. \"The Tear of the Moons\" we called it. It " ..
                "changed him. Remade him. I wish it had stayed buried.\n\nFeegly was banished from Bael " ..
                "Modan but I've heard reports he's come sniffing around the dig site again. He's suffered " ..
                "enough, the wretched thing. If you find him down there, put ol' Feegly out of his misery.",
            rewardChoices = {{53263, 1}, {53271, 1}, {53280, 1}},
            rewardMoney = 3500,
        },
        [25109] = {
            description = "We barely escaped with our hides intact!\n\nThe Trade Prince has a whole bunch " ..
                "of us enslaved and performing manual labor inside the cavern.\n\nGreely helped the seven " ..
                "of us to get out, but she was recaptured in the process.\n\n<name>, you're the only one " ..
                "crazy enough to walk into an exploding volcano! The assistant will be able to help you " ..
                "free the others.\n\nHurry! This place is about to blow for good!",
            rewardChoices = {{52917, 1}, {52962, 1}},
            rewardMoney = 150,
        },
        [25110] = {
            description = "Assistant Greely is clearly bewildered and intimidated. How will she help you " ..
                "to find a way to rescue everyone in this condition?\n\nMaybe if she were to drink one of " ..
                "those Kaja'Cola Zero-One drinks you saw, she'd be able to have a bright idea?",
            rewardMoney = 300,
        },
        [25111] = {rewardMoney = 6500},
        [25112] = {rewardMoney = 6500},
        [25115] = {rewardMoney = 6500},
        [25118] = {
            description = "I don't know about you, but I'm not much a fan of spiders, much less the kind " ..
                "that come bigger than me. Loch Modan 's a gorgeous place, but I'd say it could do " ..
                "without those horrid things waltzing around.\n\nTell you what, I've got some spare coin, " ..
                "and you look like a tough one. If you head out and off some of those things for me, I'll " ..
                "pay you for your time.",
            rewardMoney = 600,
        },
        [25120] = {
            description = "Okay, <name>! Let's take these artifacts to my father and give him our report " ..
                "firsthand.\n\nThanks to your help my flying machine is ready to roll. We can fly there " ..
                "together and share in the glory.\n\nTalk to me when you're all set to move out!",
        },
        [25121] = {
            description = "It looks like we've got more work to do! Having Mr. Noggenfogger ask us to " ..
                "take care of the rest of the pirates is a true honor.\n\nSince you've been SO helpful, " ..
                "why don't you meet me at Lost Rigger Cove? I've just got to slip into something a bit " ..
                "more comfortable, so don't wait on me. I'll beat you there, promise!",
            rewardMoney = 3500,
        },
        [25122] = {
            description = "You've got to get all the Kaja'Cola Zero-One that you can and make the goblins " ..
                "drink it to boost their morale and free them!",
            rewardMoney = 300,
        },
        [25123] = {
            description = "This nightmare will never be over while Blastshadow the Brutemaster still " ..
                "breathes. There are a couple of problems though.\n\nOne, being a warlock, he's got a " ..
                "succubus named Delicia Whipsnaps. If you kill Blastshadow quickly, the demon will go " ..
                "back to where it was summoned from.\n\nThe second problem, since Blastshadow is a " ..
                "warlock, he has a soulstone that allows him to resurrect. You have to get his soulstone " ..
                "and destroy it so that he'll be dead forever!",
            rewardChoices = {{52918, 1}, {52963, 1}},
            rewardMoney = 350,
        },
        [25125] = {
            description = "Okay, we have got to get out of here before she blows for good!\n\nLet's head " ..
                "out the other end of the tunnel on the north side of the mine. We should be able to use " ..
                "one of the mine carts for a quick ride down the side of the volcano.",
        },
        [25126] = {
            description = "The first order of business will be to put a little strength in your backbone. " ..
                "I could send you out to the Barrens to hunt kodo, but well, in all honesty, you're more " ..
                "useful to us alive than dead.\n\nI believe you'll be of more use to us slaughtering the " ..
                "boars you'll find in the farms to the north and northeast of here.",
            rewardChoices = {{53359, 1}, {53360, 1}, {53378, 1}},
            rewardMoney = 65,
        },
        [25127] = {
            description = "I must send you back into the fields again, <class>. You will find large " ..
                "numbers of scorpids northwest of here. Bring me eight of their tails.\n\nThe antidote " ..
                "for their sting is actually made from venom extracted from their stingers. We keep large " ..
                "quantities of antidote for scorpid venom on hand to heal young bloods just like " ..
                "you...\n\nBut I'm sure you won't be needing any of that, will you?",
            rewardChoices = {{53362, 1}, {53380, 1}, {53394, 1}},
            rewardMoney = 50,
        },
        [25128] = {
            description = "Hey mon, take a knee and hear me out. We got a problem.\n\nA good friend of " ..
                "mine, Hana'zua, has gone out into the valley and he hasn't returned. Last I seen, he was " ..
                "headin' north, where the scorpids hunt. Maybe you go take a look for him? The spirits be " ..
                "tellin' me that he's not well.",
            rewardMoney = 25,
        },
        [25129] = {
            description = "<class>! I thought I would die out here with none to know of it. While I was " ..
                "hunting the scorpids of the Valley, I came across a particularly vicious-looking one. " ..
                "Hurling myself at it, I managed to inflict a massive blow to its claw before it closed " ..
                "around my leg.\n\nI wasn't ready for its stinger though, and it sliced down and into my " ..
                "chest, cutting into my flesh and letting my blood. Please, you must kill the scorpid for " ..
                "me! My honor must be upheld! I fought it up on the plateau to the south.",
            rewardMoney = 100,
        },
        [25130] = {
            description = "Seeing the deed you have done for me steels my heart. I cannot fall so easily! " ..
                "I must endure!\n\nBut it remains that I cannot make the trek back to our settlement " ..
                "unassisted. Please, <name>, return and tell Gornek of my situation. Perhaps he can help " ..
                "me.",
            rewardChoices = {{53354, 1}, {53370, 1}, {53371, 1}},
            rewardItems = {{60241, 1}},
            rewardMoney = 25,
        },
        [25131] = {
            description = "I trust the Valley of Trials will teach you much, young <class>.\n\nI was sent " ..
                "to the Valley to guide you, but I have discovered a growing taint here...\n\nOne of the " ..
                "Burning Blade - a foul, demon-worshipping cult - has made camp here in the Valley of " ..
                "Trials. He skulks in a cave to the north, and his vile familiars have spilled from its " ..
                "mouth to cause havoc.\n\nAs your first task against the Burning Blade, I bid you, defeat " ..
                "these familiars. Slay many and, if you survive, return to me.",
            rewardChoices = {{53395, 1}, {53396, 1}, {53397, 1}},
            rewardMoney = 150,
        },
        [25132] = {
            description = "Through my divinations, I see that an item of power - a medallion - hides deep " ..
                "within the Burning Blade Coven, guarded by beasts and black magic. We must have " ..
                "it.\n\nFor too long these demon-worshippers have defiled our homelands. Cleanse the " ..
                "coven of its demonic taint by slaying the fel beasts and their leader. Return with this " ..
                "medallion as proof of your deed.\n\nGo, <name>. You will find the coven in a cave to the " ..
                "north.",
            rewardChoices = {{53361, 1}, {53367, 1}, {53379, 1}},
            rewardItems = {{118, 1}},
            rewardMoney = 300,
        },
        [25133] = {
            description = "Your trials against the Burning Blade are finished... here in the Valley. But " ..
                "I want you to report your findings.\n\nGo to the troll village of Sen'jin and seek out " ..
                "Master Gadrin. Sen'jin Village is east out of the valley, then right at the " ..
                "fork.\n\nTell Gadrin of the Burning Blade, and that they have reached the Valley of " ..
                "Trials. Discover from him if they have yet reached Sen'jin.\n\nGo, <name>, and be swift. " ..
                "I fear the evil found in the Burning Blade Coven is but the herald of a larger threat...",
            rewardMoney = 50,
        },
        [25134] = {
            description = "Cursed peons! They work hard gathering lumber from the trees of the valley, " ..
                "but they're always taking naps! I need someone to help keep the peons in line.\n\nYou " ..
                "look like the right <race> for my task. Here, you take this blackjack and use it on any " ..
                "lazy peons you find sleeping on the job. A good smack will get them right back to work! " ..
                "Return the blackjack when you're done.\n\nLook for them underneath the trees in the " ..
                "valley. Lousy slacking peons...",
            rewardMoney = 150,
        },
        [25135] = {
            description = "<name>, you are a dependable <race>. Can I count on you for another " ..
                "task?\n\nSome time ago I was surveying the cave to the north for minerals, and I left my " ..
                "favorite pick behind. When I later returned to retrieve it I found the cave was filled " ..
                "with vicious beasts! Will you go into the cave, the Burning Blade Coven, and get my " ..
                "pick?\n\nI left it in a chamber with waterfalls. My pick has a spell on it so you can " ..
                "see it in the dark, so you won't have to worry about finding it... just what's guarding " ..
                "it!",
            rewardMoney = 150,
        },
        [25136] = {
            description = "It sure gets hot out here in the Valley of Trials.\n\n< Galgar wipes his " ..
                "brow.>\n\nIf only I had some cactus apples, I could make my famous cactus apple " ..
                "surprise! Nothing cools you off faster than a piece of that delicious treat.\n\nI'll " ..
                "tell you what, <name>. If you bring me 6 cactus apples, I'll make you a few portions of " ..
                "cactus apple surprise to take with you on your adventures. If you're interested, you can " ..
                "find cactus apples growing near the cactus plants around here.",
            rewardItems = {{11584, 1}},
            rewardMoney = 50,
        },
        [25138] = {
            description = "Ah, while you were gone a parchment came for you, <name>.\n\nRead it when you " ..
                "have time. If I'm not mistaken, it came from the mage trainer Acrypha. She would have " ..
                "words with you when you're ready.",
        },
        [25139] = {
            description = "You already know how to fire an arcane shot. Good. But doing so depletes your " ..
                "focus. To gain your focus back you will need to switch to a second type of ranged " ..
                "attack.\n\nGo out and get some more experience. As you do, you'll learn some new " ..
                "abilities. The first of these will help you get your focus back.",
            rewardItems = {{53356, 1}},
        },
        [25141] = {
            description = "Let's start with the basics, shall we? I'm the only rogue trainer in town, so " ..
                "you're going to have to learn it from me.\n\nGo get some more experience, figure out how " ..
                "to eviscerate your foes, and then show me on the training dummies here. I'll evaluate " ..
                "your form.",
            rewardItems = {{53376, 1}},
        },
        [25143] = {
            description = "As you grow in power by gaining levels, you will discover the power to use new " ..
                "abilities. The first you will discover on your journey is Primal Strike.\n\nUse it to " ..
                "deliver a strike with your weapon, infused with the power of the elements.\n\nIt is time " ..
                "to learn and master your new skill. Practice using it on the training dummies outside " ..
                "the Den.",
            rewardItems = {{53385, 1}},
        },
        [25145] = {
            description = "It is my duty to train you, and I intend to do just that.\n\nAs you become " ..
                "more powerful, you will begin to hear the fel voices revealing new spells to you.\n\nGo, " ..
                "get more experience, learn a new spell, and then practice your new spell against one of " ..
                "the training dummies around here.",
            rewardItems = {{53363, 1}},
        },
        [25147] = {
            description = "I've been instructed to prepare you for battle. Though, from the look of you, " ..
                "it looks like you've already spent a little time out in the field. Good.\n\nAs you " ..
                "continue your journey, you'll discover that you can begin to use new techniques\n\nGo, " ..
                "get some more experience, and teach yourself how to Charge, then show me what you've " ..
                "learned.",
            rewardItems = {{53357, 1}},
        },
        [25149] = {
            description = "Alright, here's the easy part.\n\nAll you have to do to deepen your connection " ..
                "to the arcane is to get more experience and grow your power. You'll begin to find that " ..
                "you can cast new spells.\n\nYou'll see. Go try it, and show me what you learn.",
            rewardItems = {{53365, 1}},
        },
        [25151] = {
            description = "<Marley grasps the side of your head with a shaking, bloody hand.>\n\nAle... " ..
                "Must... have ale...\n\nOl' Barkerstout from inside. <He coughs.> That should... do the " ..
                "trick.",
        },
        [25152] = {
            description = "Finally, you are of age, <name>... of age to battle in the name of the Horde. " ..
                "To conquer for the glory of the Warchief.\n\nYes...\n\n< Kaltunk looks you over.>\n\nYou " ..
                "will do nicely.\n\nNo doubt you wish to find a great dragon or demon and strangle it " ..
                "with your bare hands, but perhaps it would be wise to start on something less... " ..
                "dangerous.\n\n< Kaltunk laughs.>\n\nReport to Gornek, he should be able to assign a task " ..
                "better suited to a young <class>. You will find him seated at the fire behind me.",
        },
        [25153] = {
            description = "Help - Help! You've got to do something!\n\nSome dwarves are still inside - so " ..
                "many - they're trapped in the debris. Buried alive. The flames! It's a nightmare in " ..
                "there. We don't know how much longer until the roof collapses...\n\nPlease, <class>, " ..
                "you've got to save them!\n\nRun inside. Use the emergency fire valves to protect " ..
                "yourself from the flames. You're the only hope they have...",
            rewardChoices = {{53264, 1}, {53300, 1}, {53306, 1}},
            rewardMoney = 3500,
        },
        [25154] = {
            description = "I'm trying to impress this trade ship captain Lila. I've been working on a " ..
                "necklace to match her lovely purple hair, but the gems have gone missing! They were " ..
                "there when I was showing them off to my good friend Curver last evening. We were " ..
                "drinking moonshine and I blacked out - when I woke up the gems were gone! They must have " ..
                "been darn good thieves, because Curver didn't see anything.\n\nHer ship is coming in " ..
                "tonight, and I really need three nightstones to get her present done. Help me out here!",
        },
        [25155] = {
            description = "I was supposed to receive a shipment of jasper from Azeroth Express, but I " ..
                "just heard their ship crashed into some tiny island called Ogrezonia. I worry about the " ..
                "crew, as the giant female ogres on the island are rumored to perform horrible rituals on " ..
                "men who happen upon their island. My work must go on, though, and we need those gems. " ..
                "I've heard great things about your skill as a jewelcrafter - could you deliver three " ..
                "jagged jaspers by the end of the day?",
        },
        [25156] = {
            description = "Instead of using the tired old method of setting gems into rings and such, I " ..
                "use an innovative new method. I simply glue on the gems with Barnsworth Elemental Glue! " ..
                "The professor needs more elemental goo for another batch, though, and I have a whole " ..
                "bunch of setting to do. Can you go get me some?",
        },
        [25157] = {
            description = "Professor Barnsworth has been working on this new stardust - what with the " ..
                "fashion in Stormwind this season being about all things sparkly, I'm sure if we can get " ..
                "it to the market it will be all the rage! The Jewelcrafter's Association, however, won't " ..
                "let us market it until we've completed some humanoid testing - something about tinkering " ..
                "with magical dust being dangerous or some such nonsense. Well, I suppose we need to " ..
                "humor them. Take this bag and test out Stardust No. 2 on some humanoid subjects.",
        },
        [25158] = {
            description = "Lila's pet Nibbler got into my workshop again!\n\nI was making a bracelet, to " ..
                "be delivered today. The work was almost done, except for the gems. I spent all night " ..
                "cutting them, but when I stepped out for a bit of breakfast, the little beast came into " ..
                "my workshop and swallowed every gem in sight! The thing can digest ANYTHING, and trust " ..
                "me, you'd break your back trying to pick up its leavings.\n\nI need to get replacement " ..
                "gems fast; the courier is coming in tonight. Help!",
        },
        [25159] = {
            description = "Dr. Vernstrom has been working on this new stardust - what with the fashion in " ..
                "Orgrimmar this season being about all things sparkly, I'm sure if we can get it to the " ..
                "market it will be all the rage! The Jewelcrafter's Association, however, won't let us " ..
                "market it until we've completed some \"live testing\" - something about tinkering with " ..
                "magical dust being dangerous or some such nonsense. Well, I suppose we need to humor " ..
                "them. Take this bag and test out Stardust No. 2 on humanoid subjects.",
        },
        [25160] = {
            description = "I'm trying to impress this trade ship captain Lila. I've been working on a " ..
                "necklace to match her lovely purple hair, but the gems have gone missing! They were " ..
                "there when I was showing them off to my good friend Bonder last evening. We were " ..
                "drinking moonshine and I blacked out - when I woke up the gems were gone! They must have " ..
                "been darn good thieves, because Bonder didn't see anything.\n\nHer ship is coming in " ..
                "tonight, and I really need three nightstones to get her present done. Help me out here!",
        },
        [25161] = {
            description = "I was supposed to receive a shipment of jasper from Azeroth Express, but I " ..
                "just heard their ship crashed into some tiny island called Ogrezonia. I worry about the " ..
                "crew, as the giant female ogres on the island are rumored to perform horrible rituals on " ..
                "men who happen upon their island. My work must go on, though, and we need those gems. " ..
                "I've heard great things about your skill as a jewelcrafter - could you deliver three " ..
                "jagged jaspers by the end of the day?",
        },
        [25162] = {
            description = "Instead of using the tired old method of setting gems into rings and such, I " ..
                "use an innovative new method. I simply glue on the gems with Vernstrom Elemental Glue! " ..
                "The doctor needs more elemental goo for another batch, though, and I have a whole bunch " ..
                "of setting to do. Can you go get me some?",
        },
        [25163] = {
            description = "Sabotage! It had to be. The whole fortress magazine exploded. The Horde " ..
                "must've gotten someone inside...\n\n<class>, if you've the stones to rush into that " ..
                "burning nightmare... look for some clues as to who did this to us. The General will want " ..
                "to know! Look for a Horde corpse in the wreckage and get to the bottom of this " ..
                "disaster...",
        },
        [25164] = {
            description = "The naga are upon us, <class>. Aid us in fightin' dem off!",
            rewardChoices = {{59765, 1}, {59766, 1}, {59767, 1}},
            rewardMoney = 156000,
        },
        [25165] = {
            description = "Next, we gonna get some poison from the scorpions that be runnin' around here. " ..
                "But don't you worry, Bom'bay 's not gonna let you get hurt!\n\nBom'bay 's got a big " ..
                "totem that you gonna stick in the ground when the scorpion strikes. The totem gonna suck " ..
                "up all the poison, and you gonna walk away still breathing. Sound good?",
            rewardMoney = 125,
        },
        [25166] = {
            description = "This is getting pretty fun, but let's not forget we're here for " ..
                "Gnomeregan!\n\nWe spotted the captain of the Southsea over on one of his boats to the " ..
                "south, past where all the fighting is. He's all alone on his little boat, " ..
                "undefended!\n\nIf you go take care of him, we'll have the rest of these pirates mopped " ..
                "up in no time.",
            rewardChoices = {{56867, 1}, {56868, 1}, {56869, 1}, {56870, 1}},
            rewardMoney = 13000,
        },
        [25167] = {
            description = "Aw man, this ain't good. Not one bit, mon.\n\nThrall's off to sea, Vol'jin's " ..
                "taking care of business in Echo Isles, and old Master Gadrin is left behind to take care " ..
                "of Sen'jin. And then what happens? Those humans come outta Northwatch Hold and set up " ..
                "camp in our backyard!\n\nLucky for us, they just got here, and they're still setting up " ..
                "their base. You can help out old Gadrin by destroying those big supply crates they " ..
                "carry, and by killing the laborers carryin' them. You'll find'm to the southwest.",
            rewardMoney = 125,
        },
        [25168] = {
            description = "Northwatch is a highly-defended stronghold southwest of here, across the " ..
                "harbor. It's a strategically-located stronghold that the Horde still struggles to " ..
                "overtake. We don't need the humans setting up another Northwatch here in " ..
                "Durotar.\n\nSweep through the valley to the west and slay these humans, <name>. Let them " ..
                "know the power and the fury of Sen'jin.",
            rewardChoices = {{53388, 1}, {53389, 1}},
            rewardMoney = 125,
        },
        [25169] = {
            description = "These humans in the west, they don't just wanna camp out in Durotar, mon. They " ..
                "got bigger plans, and those plans involve takin' our home and leavin' our skulls on " ..
                "pikes.\n\nWell I'm not havin' it. Nope! Not Lar! I've got family here in Sen'jin, and " ..
                "I'll be damned if I let one of those brutes put my Tai'tasi's head on a " ..
                "stick!\n\nThey've got their plans written down in there, mon. Big scrolls, real " ..
                "important-lookin'. We gonna burn those scrolls before they burn us.",
            rewardChoices = {{53364, 1}, {53391, 1}},
            rewardMoney = 250,
        },
        [25170] = {
            description = "Heya mon! Bom'bay be workin' on some new mojo. You wanna try a piece of it? " ..
                "Well, before ya do, Bom'bay 's gonna need ya to pick up some jujus.\n\nFirst, Bom'bay " ..
                "needs ya to get some o' the goop from the crabs down by the water. Let me see your " ..
                "hands!\n\n< Bom'bay examines your hands closely.>\n\nBom'bay gonna need 5 handfuls. Go " ..
                "on now!",
            rewardMoney = 125,
        },
        [25171] = {
            description = "We gotta pass the word on to Razor Hill. These humans may be defeated today, " ..
                "but tomorrow they'll come again, and when they do, we'll need help from the " ..
                "orcs.\n\nSpeak with Jhash, outside the gates of Sen'jin. He'll give you a ride to Razor " ..
                "Hill. His wolves know the path well.",
            rewardMoney = 35,
        },
        [25172] = {
            description = "You're not just another grunt - you seem to be a serious <class>. Good, " ..
                "because that's exactly what I need.\n\nTry not to let the word out, since I don't want " ..
                "to cause a panic... but there have been reports of more humans nearby. This is an " ..
                "egregious betrayal of the peace that we negotiated with that miserable Jaina Proudmoore! " ..
                "We can't allow humans here in Durotar, and especially not here in the Valley.\n\nYou " ..
                "will find them to the south. Slay them quickly, before their numbers increase any more.",
            rewardChoices = {{53355, 1}, {53373, 1}, {53386, 1}},
            rewardMoney = 50,
        },
        [25173] = {
            description = "Tiragarde Keep lies to the southeast of here, on Durotar 's eastern shore. You " ..
                "probably passed it on your trip from Sen'jin Village. This castle has been a thorn in my " ..
                "side for too long.\n\nHumans from Kul Tiras lived in the castle for years, thwarting my " ..
                "every attempt to crush them. When the cataclysm hit us, the shore was wiped out, along " ..
                "with the castle and all the humans. However, these upstarts from Northwatch have moved " ..
                "in to take their place!\n\n< Gar'Thok roars in aggravation.>",
            rewardChoices = {{53375, 1}, {53383, 1}, {53392, 1}},
            rewardMoney = 175,
        },
        [25174] = {
            description = "< General Twinbraid will want to know the details of this cowardly attack. You " ..
                "gather up the evidence.>",
            rewardMoney = 1700,
        },
        [25175] = {
            description = "<You gently close Marley's eyes.>\n\n<Someone is going to have to tell General " ..
                "Twinbraid that the Horde has killed his only son.>\n\n<That someone is you.>",
            rewardMoney = 1700,
        },
        [25176] = {
            description = "<Hey there, handsome! I've had my eye on those big, beefy biceps ever since " ..
                "you stepped into town./What're you looking at> ugly? I've seen you walking around Razor " ..
                "Hill, trying to steal MY men from me!;\n\nListen, I've got something for you to do. I " ..
                "hear Gar'Thok's got you headed over to Tiragarde. While you're there, think you could " ..
                "find some abandoned Kul Tiras knicknacks?\n\n<Thanks sweetie!/Don't ask why> just get to " ..
                "it!;",
            rewardMoney = 175,
        },
        [25177] = {
            description = "Now that those humans are out of our hair for a bit, we can move on to more " ..
                "pressing matters.\n\nThe cataclysm utterly decimated Durotar 's eastern coast. You saw " ..
                "the wreckage that it made of Tiragarde. The devastation was even worse on the coast to " ..
                "the east of here.\n\nAfter the first wave, the beach was overtaken by angry elementals " ..
                "that came from the sea. I sent grunts to take care of it, but the onslaught was too " ..
                "much. I'm guessing you'll have a little more luck than they did.\n\nBeware the tides!",
            rewardMoney = 350,
        },
        [25178] = {
            description = "<Hey handsome, welcome back! You wouldn't mind running another errand, would " ..
                "you? I'd be EVER so grateful.../You! Stop right there> you tramp! I'm not finished with " ..
                "you yet.;\n\nI hear you're headed off to the shore east of here. The beach is filled " ..
                "with crashed ships, and those ships have gnomish tools in them... tools that I can " ..
                "use.\n\n<See you soon, beefcake!/Get cracking> missy!;",
            rewardMoney = 175,
        },
        [25179] = {
            description = "You've got to help us. The elementals... they're stronger than they look, and " ..
                "they come in waves. They took us completely by surprise, and we were overcome.\n\nMany " ..
                "of my fellow grunts lay dying on the beach. If you could save them... I would be " ..
                "grateful, as would Gar'Thok back in Razor Hill.",
            rewardItems = {{53384, 1}},
            rewardMoney = 175,
        },
        [25182] = {
            description = "I want to see some dead goblins, <name>! Just west of here you'll find a whole " ..
                "warren of those little insects burrowing into the mountain.\n\nLet's see to it that " ..
                "they're digging their grave.\n\nDestroy them. Lay waste to their whole grubby operation. " ..
                "They've sown their own demise in Bael'dun, <class>, and it is time to meet the reaper.",
            rewardMoney = 3500,
        },
        [25183] = {
            description = "It's not enough to kill 'em - after Bael'dun, I want to give those goblins a " ..
                "taste of their own.\n\nGo into Frazzlecraz's mine and arm a pile of the explosives " ..
                "inside.\n\nAt the entrance to the mine you should see some sort of switch or plunger. " ..
                "Once the explosives are armed, use the plunger to blow that place sky-high. Put the fear " ..
                "in 'em, <class>!",
        },
        [25184] = {
            description = "All you have to do is jump in and speak with Assistant Greely when you get to " ..
                "the bottom.",
            rewardChoices = {{52919, 1}, {52964, 1}},
        },
        [25185] = {
            description = "<You shield your eyes from the blast and the debris as the mine implodes onto " ..
                "itself.>\n\n< General Twinbraid will be pleased, but somehow you doubt it'll be enough " ..
                "to quench his thirst for vengeance.>",
            rewardChoices = {{53274, 1}, {53305, 1}, {53272, 1}},
            rewardMoney = 7500,
        },
        [25186] = {
            description = "<name>, I certainly don't want to deliver my report to Commander Singleton " ..
                "without at least a little bit of good news. We've got to wrestle control of these roads " ..
                "back from these Horde holdouts.\n\nFrom what we can gather, Kona Thunderwalk is the name " ..
                "of the ringleader. He's got a camp just north of here. A Stonetalon native, he knows " ..
                "these roads better than his own hide. If we can wipe him out, resistance from the west " ..
                "might vanish.\n\nFind and kill Kona Thunderwalk, then report to Commander Singleton!",
            rewardChoices = {{53273, 1}, {53295, 1}},
            rewardMoney = 3000,
        },
        [25187] = {
            description = "The recent cataclysmic events have done more than wash a few boats onto our " ..
                "shore, <class>. The Southfury River has overflowed, and Durotar 's entire western basin " ..
                "is now flooded.\n\nThere are still people out there. I've been searching for a while, " ..
                "but haven't been able to find anything. Would you mind using my telescope and taking a " ..
                "look for yourself?",
            rewardMoney = 175,
        },
        [25188] = {
            description = "My post is here on the tower, <name>, and I cannot leave it. I need someone to " ..
                "go out there and help the people who are still trapped in the river's overflow.\n\nCan I " ..
                "count on you?",
            rewardMoney = 450,
        },
        [25189] = {
            description = "Who are you? What happened?\n\nI was alone in my hut, meditating, " ..
                "when...\n\nAhh, I remember now. The spirits cried out, and the river swept in. I'm lucky " ..
                "that you found me here. I am old, and no longer physically able to endure the elements " ..
                "like this. Will you lead me out of here?",
            rewardMoney = 225,
        },
        [25190] = {
            description = "The quilboar are a stain on the land that not even the river can wash away. " ..
                "They told me to evacuate, but I told them that my job was not yet done.\n\nHrrrraaagh! I " ..
                "hate quilboar so much! Will you help me kill them?",
            rewardMoney = 225,
        },
        [25191] = {
            description = "I had heard of enormous seismic anomalies here in Kalimdor, but I had no " ..
                "inkling that the geological chaos would be so profound!\n\nI need an up-to-date survey " ..
                "of the destruction while I stay here to study the seismographic readings. Could you " ..
                "gather some data via my automated survey craft? I'll take care of all the " ..
                "flying.\n\nWhen the survey is complete, present the data to my colleague Horton " ..
                "Gimbleheart in Northwatch.",
            rewardMoney = 2100,
        },
        [25192] = {
            description = "I will not rest until they're defeated! Slay them all!\n\n< Raggaran catches " ..
                "his breath.>\n\nTheir stinking lairs are to the north, or to the southwest!",
            rewardChoices = {{53381, 1}, {53382, 1}},
            rewardMoney = 300,
        },
        [25193] = {
            description = "Today marks the anniversary of my son Kron's passing. As long as I refused to " ..
                "admit it, I recognize now: Kron is not returning from his crocolisk hunt.\n\nI've been " ..
                "working on a project... something that will memorialize Kron's passion for the hunt. " ..
                "It's a crocolisk-tooth necklace... rows and rows of teeth, suitable to be worn by only " ..
                "the bravest young orc. I will place it on his grave.\n\nKron was brave, but he was not " ..
                "strong, like you. Will you bring me the teeth for my necklace?",
            rewardChoices = {{53372, 1}, {53377, 1}, {53393, 1}},
            rewardItems = {{60242, 1}},
            rewardMoney = 225,
        },
        [25194] = {
            description = "Don' worry, Zen'Taji 's not in any trouble. He just been studyin' what happens " ..
                "when the river overflows.\n\nYa see the big tall birds that stand on the riverbank? " ..
                "Zen'Taji thinks they're in trouble. The earthquake and the flood pushed the " ..
                "plainstriders over to this side of the water, but they can't fly back, and they're too " ..
                "scared to swim.\n\nThey'll die if they stay here. Zen'Taji doesn't like violence, but " ..
                "maybe YOU can attack them and scare them over to the other side. Yes?",
            rewardMoney = 225,
        },
        [25195] = {
            description = "Many creatures died when the water came rushin' into the valley. The raptors, " ..
                "however, thrived. They're clever predators, and they've been living off the misfortune " ..
                "of the other creatures.\n\nOne of the raptors is particularly cruel. He's killing the " ..
                "little animals and letting them rot in the water without even eating them! He goes by " ..
                "the name of Screamslash, and if we're not careful, he could seriously disrupt the " ..
                "balance of nature.\n\nTravel north, slay him, and give his body back to nature.",
            rewardItems = {{53398, 1}},
            rewardMoney = 600,
        },
        [25196] = {
            description = "You should head north from here, <name>. Speak with Gor the Enforcer at the " ..
                "Dranosh'ar Blockade. He's been placed in charge of securing shipping lanes for " ..
                "Orgrimmar, and Skull Rock sits right next to his precious dock. I'm certain he'll be " ..
                "interested in picking up where we left off.",
            rewardMoney = 85,
        },
        [25197] = {
            description = "What? You want to stay here to fight? Typical <class>, wanting to stay and " ..
                "fight off the Horde while there's still a chance to run for it.\n\nLook, if you really " ..
                "want to save Northwatch, you should report to Admiral Aubrey in the tower behind me. " ..
                "He's keeping his ships here to fight, instead of ferrying us all away like I begged him " ..
                "to.\n\nNow if you'll excuse me, I've got to finish packing!",
        },
        [25200] = {
            description = "That no-good Trade Prince Gallywix somehow managed to stow the whole " ..
                "Steamwheedle Sharks footbomb team away on the yacht. I didn't even see any of " ..
                "them!\n\nNow he has them doing his dirty work here at the lumber yard. <name>, you're " ..
                "the <guy/gal> who won the championship for us back home on Kezan. You've got to get rid " ..
                "of them!",
            rewardMoney = 350,
        },
        [25201] = {
            description = "Look, kid, I'm here to see to it that you've got a fighting chance at the end " ..
                "game. Thrall's going to need your help in the fight against the Trade Prince.\n\nGreely, " ..
                "Hobart, and I have a plan to put together the ultimate footbomb uniform for you so that " ..
                "you can win the game, but I'm going to need some things first.\n\nLucky for us, this " ..
                "lumber yard is sick with spare shredder parts. Now get out there and give me 110%!",
            rewardMoney = 350,
        },
        [25202] = {
            description = "Oh, girl! You're never going to guess who's out on the oil platform to the " ..
                "north.\n\n< Izzy shakes her head sadly at you.>\n\nChip's out there, and he's working " ..
                "for the Trade Prince. That cold-hearted snake dropped you like a bad habit and now he's " ..
                "working for the other team. I even heard he's going out with that tramp, Candy " ..
                "Cane!\n\nI don't know about you, but if he was my ex, I'd rip his still-beating heart " ..
                "out of his chest.",
            rewardChoices = {{52920, 1}, {52937, 1}, {52965, 1}},
            rewardMoney = 800,
        },
        [25203] = {
            description = "Dude! You're never going to guess who's out on the oil platform to the " ..
                "north.\n\n< Ace shakes head in disbelief.>\n\nChip's out there, and he's working for the " ..
                "Trade Prince. That traitor's now working for the other team. But worse, I heard he's " ..
                "going out with your ex-girlfriend, Candy Cane!\n\nI don't know about you, but if he was " ..
                "going out with my ex, I'd do something about it.",
            rewardChoices = {{52921, 1}, {52938, 1}, {52966, 1}},
            rewardMoney = 800,
        },
        [25204] = {
            description = "We have to stop Trade Prince Gallywix's oil supply and bring his machines to a " ..
                "grinding halt.\n\nWe're going to need you to go out to the KTC Oil Platform and release " ..
                "the valves to overload the coolant system. After you do that, head to the platform " ..
                "control panel on the platform and set it to blow.",
            rewardMoney = 350,
        },
        [25205] = {
            description = "My \"associate\" here has some plans for you that I don't agree with. His " ..
                "actions are hasty, uncontrolled, and irresponsible, and you may end up paying for them " ..
                "with your life.\n\nBefore you work with Gor, first listen to the tale that I have to " ..
                "tell. It's a moralistic story - a fable - but I believe its lesson will prove valuable. " ..
                "Speak to me when you are ready.",
            rewardMoney = 350,
        },
        [25206] = {
            description = "Ignore the shaman, soldier. Certain powers-that-be within the Horde demand " ..
                "that I keep him with me, but I assure you, that Thrall-loving farseer truly sees no " ..
                "farther than the borders of this hut.\n\nElementals war against one another to the west " ..
                "of here. I normally wouldn't mind, but I need that land clear to secure a broader " ..
                "shipping route to and from the Barrens. The elementals are normally quite strong, but " ..
                "they are weakened by their attacks against one another. Use this knowledge to destroy " ..
                "them.",
            rewardChoices = {{53368, 1}, {53374, 1}},
            rewardMoney = 350,
        },
        [25207] = {
            description = "There is single big, red button on the platform control console. Clearly if " ..
                "ever there were a button to cause massive explosions, that is it!",
            rewardChoices = {{52922, 1}, {52967, 1}},
            rewardMoney = 350,
        },
        [25208] = {
            description = "It seems we've found an infestation far worse than the one we expected. " ..
                "Cho'gall is no doubt trying to use the Gordok to gain access to the remnants of " ..
                "Eldre'thalas within Dire Maul, full of the forbidden powers that brought the downfall of " ..
                "the Shen'dralar...\n\nI am rambling. Leave me, <name>. Tell Silvia of what you've " ..
                "learned. Whatever is occuring in Dire Maul must be stopped.",
        },
        [25209] = {rewardMoney = 7500},
        [25210] = {rewardMoney = 4000},
        [25211] = {
            description = "Don't listen to Rharen. He's as addled as they come. It's his fault that the " ..
                "ale got captured!\n\nAnd what's more, I figure there's a bigger issue here than the ale " ..
                "being stolen. The fact that there's a bunch of orcs runnin' about Dun Algaz after all " ..
                "these years is ridiculous!\n\nTell you what, <class>. You head in there and be sure to " ..
                "drive as many orcs out of those ruins as you can. Dun Algaz isn't good for much anymore, " ..
                "but I'll be damned if we let them just sit in there.",
            rewardMoney = 1300,
        },
        [25213] = {
            description = "Sassy's over at the Slave Pits. She's there with the orcs getting ready to " ..
                "execute the final play on the Trade Prince.\n\n<name>, take the footbomb uniform up the " ..
                "road to the southwest and find her. I know she's going to want you to lead the " ..
                "charge!\n\nAck, I'm starting to talk like the coach now!",
        },
        [25214] = {
            description = "We really don't have time to rescue those that are incompetent enough to get " ..
                "themselves captured over and over. Still, since I have some extra rockets leftover, this " ..
                "problem should be a snap.\n\nTake these single-stage booster rockets down into the Slave " ..
                "Pits to the north and put them on the cages.\n\nThe cage will lift off into orbit and " ..
                "those idiots will be freed.",
            rewardChoices = {{52923, 1}, {52939, 1}, {52968, 1}},
            rewardMoney = 350,
        },
        [25215] = {
            description = "Predators will smell these dead naga from nearly a mile away. Soon we'll find " ..
                "ourselves fighting just to get in and out of the cave. Care to help me clean up?\n\nJust " ..
                "over the ridge to the south is Glimmerdeep Gorge. If you drag the corpses from the " ..
                "eastern exit of the cave over there to the gorge and cut them loose, the wildlife will " ..
                "pick them clean before they hit the sea floor. Just steer clear of the sharks as much as " ..
                "you can.",
            rewardChoices = {{59762, 1}, {59763, 1}, {59764, 1}},
            rewardMoney = 78000,
        },
        [25216] = {
            description = "If you're heading down the trench, I'd like you to check in one of our novice " ..
                "members for me.\n\nHis name is Sam, but he's likely to embellish it a bit. He doesn't " ..
                "really understand how members of the Earthen Ring work, but he tries hard, so we try to " ..
                "give him the benefit of the doubt.\n\nDon't get too wrapped up in helping him with his " ..
                "crazy schemes. Just make sure he's still in one piece and let me know so that I can have " ..
                "a little peace of mind.",
            rewardMoney = 7800,
        },
        [25217] = {
            description = "Okay, I'll let you in on the real work, since you're looking at me so " ..
                "desperately.\n\nThis rock is untapped! It's probably richer than a trade prince during a " ..
                "great war! I need samples. More samples. Samples from everywhere!\n\nI've modified my " ..
                "earth totems to drill through the sand and store samples of the rock underneath. Go find " ..
                "a nice spot and plant one.\n\nThe shaking and rumbling will probably attract all the " ..
                "cute, curious wildlife, so maybe you can make some friends while you're at it.",
            rewardChoices = {{59756, 1}, {59757, 1}, {59758, 1}},
            rewardMoney = 78000,
        },
        [25218] = {
            description = "Fine! Fine. You argued me into it. You can help.\n\nI'm leaking air worse than " ..
                "a zeppelin stuffed with quilboar! My air valve must have come loose somewhere in the " ..
                "trench.\n\nI brought spare air balloons - make yourself useful and go fill one up, will " ..
                "ya? And find my valve! I'll need that too.\n\nI bet the crabs snatched it up... pinchy, " ..
                "greedy little things.",
            rewardMoney = 78000,
        },
        [25219] = {
            description = "I'm researching snails.\n\nYes. Snails. When you're done laughing, maybe you " ..
                "can help.\n\nI'm sure you noticed the gigantic shellfish across the ridge... well, I'm " ..
                "pretty sure there's something inside it. It has several points that can only be mouths " ..
                "or entrances of some kind, and I've seen those sifting snails squeezing in and " ..
                "out.\n\nI'm thinking that we might be able to use the snails to gain entrance ourselves. " ..
                "That's the theory anyway.",
            rewardMoney = 78000,
        },
        [25220] = {
            description = "Been attacked by any of the eels along the ridges yet? If not, you will. They " ..
                "are vicious, bloodthirsty little monsters. They don't seem to show much of any " ..
                "preference in what they're biting.\n\nIf you're going out into the valley, I'd " ..
                "appreciate if you thinned their population a bit. Not everyone here is as well equipped " ..
                "as you - we might not come back with just scratches.",
            rewardMoney = 78000,
        },
        [25221] = {
            description = "They're getting away!\n\nThese are the same naga that attacked the boats and " ..
                "carried away our friends. We cannot let them escape!\n\nTake these spears and run them " ..
                "down with that seahorse of yours... don't waste your time dismounting, just keep after " ..
                "them and kill all that you can with the spears.\n\nI will try to hunt down that " ..
                "Fathom-Lord. Meet me at the far end of the ledge when you're done.",
            rewardMoney = 78000,
        },
        [25222] = {
            description = "Most of the other Earthen Ring that escaped the massacre on the boats have " ..
                "taken shelter in a cave a short swim down from the ridge. It's tucked midway up a huge " ..
                "rock formation, west of Nespirah, the gigantic shell on the horizon. I need you to make " ..
                "sure they're okay. There's no telling how many naga might have attacked them as " ..
                "well.\n\nI'm going to hunt down that Fathom-Lord. I'll send word if I find the rock he's " ..
                "hiding under.",
            rewardMoney = 19500,
        },
        [25223] = {
            description = "I'd love to say that with the tides turning against us in Hyjal, every recruit " ..
                "helps our cause and so on... but to be perfectly blunt, most of you are nothing but a " ..
                "burden.\n\nIf I had a copper for every peasant who got too scared when the cataclysm hit " ..
                "and now wishes to join our side... well, let's just say I'd be a rich " ..
                "woman.\n\nFortunately we have checks in place to separate the wheat from the chaff. Go " ..
                "and prove yourself to the fiery instructors below. Hopefully you'll do better than the " ..
                "others.",
            rewardChoices = {{57309, 1}, {57310, 1}},
            rewardMoney = 78000,
        },
        [25224] = {
            description = "It is customary for new recruits to be sent on a difficult or sometimes " ..
                "impossible task. I was sent to obtain a black dragon's scale; last year's instructors " ..
                "demanded a feather from a phoenix.\n\nYour lot has it relatively easy. Find me a handful " ..
                "of flame blossoms.\n\nThey grow around here in relative abundance. Oh, right. There will " ..
                "be a gigantic core hound roaming the fields to keep things interesting. Do your best to " ..
                "avoid him.",
            rewardMoney = 78000,
        },
        [25227] = {
            description = "<Oh, sweetie, I just remembered!/Sorry if I've been mean to you. Sometimes I " ..
                "get a little jealous when other women come into town> as I'm a little insecure about my " ..
                "appearance.;\n\nMy VERY good friend Thonk works in the guard tower on that cliff, just " ..
                "to the northwest of Razor Hill. He said something about a river overflowing, lots of " ..
                "work to be done, and so on. I wasn't really paying attention... I was staring into those " ..
                "deep brown eyes of his.\n\n<What, we can't see other people?/Thanks.>",
            rewardMoney = 22,
        },
        [25230] = {rewardMoney = 4000},
        [25232] = {
            description = "I've been sent to investigate the presence of more Burning Blade agents here " ..
                "in Durotar. To the northeast, you'll find a cave where the organization trains their new " ..
                "recruits. I'm interested in what exactly they are teaching these neophytes.\n\nI only " ..
                "tell you this because you seem to be looking for work. If you're interested in a little " ..
                "coin, sack the cave and return with their spellscrolls.\n\nThe cave is somewhat hidden: " ..
                "exit Razor Hill from the east, and follow the canyon's eastern ridge.",
            rewardMoney = 350,
        },
        [25233] = {
            description = "Cho'gall's Twilight Proveditors swear a blood oath that they will get their " ..
                "supplies through to the front, pledging a pound of their own considerable flesh for " ..
                "every pound of supplies they fail to deliver. They would rather die than fail.\n\nSee to " ..
                "it that they do both.",
            rewardMoney = 78000,
        },
        [25234] = {
            description = "Prisoners of the Twilight's Hammer are forced to lug around sundries for the " ..
                "war effort, like common pack animals. I want those supplies, and if we can free a few " ..
                "poor souls from the Hammer's shadowy grip, all the better.\n\nKill the slave drivers " ..
                "along the road to our south and nearby slaves should make a break for it.\n\nSearch the " ..
                "packs they leave behind for anything valuable, and destroy anything you can't carry.",
            rewardChoices = {{57384, 1}, {57385, 1}, {57383, 1}},
            rewardMoney = 78000,
        },
        [25235] = {
            description = "Hail, <class>. Care to lend a hand for the people of Darkshire?\n\nThere's a " ..
                "huge ogre mound just down the hill there. The Splinter Fist ogres usually keep to " ..
                "themselves, but they've got a bad habit of attacking travelers. Just the other day I saw " ..
                "one drag off a poor man's horse for food... he was lucky it left him behind!\n\nThe " ..
                "Night Watch wants to only risk its few members in the defense of more immediate threats, " ..
                "me included. But if you kill some of those ogres for me, I'll pay you for your deed.",
            rewardMoney = 1400,
        },
        [25236] = {
            description = "Our army needs water, and luckily the elements gave us plenty of that when the " ..
                "cataclysm hit. The water that filled up the canyon to the southwest should do the " ..
                "trick.\n\nUnfortunately, the corpses of thunder lizards still sit at the bottom of the " ..
                "canyon, and their electrical discharges are a bit too dangerous. I've got grunts that " ..
                "can lift them out of the water, but we need someone agile enough to attach the other end " ..
                "of the rope. Are you my <man/woman>, <name>?",
            rewardMoney = 350,
        },
        [25237] = {rewardMoney = 4000},
        [25239] = {rewardItems = {{52570, 1}}, rewardMoney = 74000},
        [25240] = {rewardItems = {{52571, 1}}, rewardMoney = 74000},
        [25241] = {rewardMoney = 4000},
        [25242] = {rewardItems = {{52572, 1}}, rewardMoney = 74000},
        [25243] = {
            description = "Oh, sweetie! You're never going to guess who's down in the slave pits to the " ..
                "north.\n\n<Sassy shakes her head sadly at you.>\n\nCandy's down there, and she's working " ..
                "for the Trade Prince. She dropped you like a bad habit and now she's working for the " ..
                "other team. but it gets worse. Since you \"dealt\" with Chip, she's dating the Trade " ..
                "Prince!\n\nI don't know about you, but if she were my ex, I'd rip her fickle heart right " ..
                "out of her chest.",
            rewardChoices = {{52920, 1}, {52940, 1}, {52969, 1}},
            rewardMoney = 800,
        },
        [25244] = {
            description = "Can you believe that Candy Cane! You know up until you \"dealt\" with Chip, " ..
                "she was dating him. Now she's going out with the Trade Prince!\n\nI just can't get over " ..
                "the fact that she betrayed you like that with your ex. Maybe you should head down into " ..
                "the Slave Pits and take care of her once and for all?",
            rewardChoices = {{52941, 1}, {52970, 1}, {52972, 1}},
            rewardMoney = 800,
        },
        [25246] = {rewardChoices = {{50398, 1}, {50400, 1}, {50404, 1}, {50402, 1}}},
        [25247] = {rewardChoices = {{50378, 1}, {50377, 1}, {50375, 1}, {50376, 1}}},
        [25248] = {rewardChoices = {{50386, 1}, {50384, 1}, {50388, 1}, {50387, 1}}},
        [25249] = {rewardChoices = {{50399, 1}, {50397, 1}, {50403, 1}, {50401, 1}}},
        [25250] = {rewardMoney = 7500},
        [25251] = {
            description = "<name>, this is it! Thrall's down at the Gallywix Docks fighting the Trade " ..
                "Prince right now!\n\nYou gotta jump into your Ultimate Footbomb Uniform and get over " ..
                "there!",
            rewardMoney = 1000,
        },
        [25252] = {rewardMoney = 4000},
        [25255] = {
            description = "Twilight's Hammer has revealed itself as more than a mere cult. They're a war " ..
                "machine - a swarm of locusts moving up the mountain, devouring anything in their " ..
                "way.\n\nThe parts of the forest they're not setting ablaze are being scoured of life in " ..
                "order to feed the mortal cultists.\n\nWe've got to put a stop to the hunters canvassing " ..
                "Wolf's Run, not only to preserve what wildlife remains but to force the cult to march on " ..
                "empty stomachs. Look south of here, as well as up the road to the east.",
            rewardMoney = 78000,
        },
        [25256] = {
            description = "You, <race>, stop a minute.\n\nMy boss Spiketooth sent me to look for help and " ..
                "supplies. You don't appear to be a merchant, but you can probably still help him out. " ..
                "He's just to the southeast of here, next to the crashed cart. Oh, and tell him I sent " ..
                "you... I want to make sure that he knows I'm not just slacking off over here.",
            rewardMoney = 35,
        },
        [25257] = {
            description = "I own a couple gladiators that I put into competitions around Kalimdor. You " ..
                "can see most of them chained up around here... we were lucky to rein these ones in after " ..
                "the cart broke down.\n\nGhislania, that naga over there... she's lost her last three " ..
                "fights. She could use a tune-up, or maybe just a little bit of thrashing. Go challenge " ..
                "her, I'll bet even YOU are stronger than she is.",
            rewardMoney = 250,
        },
        [25258] = {
            description = "Griswold, chained up over there on the cliffs, is my newest gladiator. We " ..
                "found him just south of here, sniffing around with Northwatch soldiers. I had my men nab " ..
                "him up, and now he works for me.\n\nHe looks tough enough, but he hasn't really been " ..
                "battle-tested yet. Go pick a fight with him so I can see if he's worth keeping around.",
            rewardMoney = 350,
        },
        [25259] = {
            description = "I wouldn't normally keep a taunka as a captive, due to their close " ..
                "relationship with the Horde... but this one is a traitor, and a criminal to boot. Exiled " ..
                "by his own tribe, he canoed down to Azshara and was found stealing supplies from " ..
                "Valormok. He would have been put to the axe had I not been standing by, wallet in " ..
                "hand.\n\nGaur is my winningest gladiator, <class>. I'll bet you 10 silver that you can't " ..
                "beat him.",
            rewardMoney = 700,
        },
        [25260] = {
            description = "The flood to the southwest wiped out one of the few Burning Blade camps that " ..
                "still pockmark Durotar. This one was led by a goblin named Fizzle Darkclaw, and believe " ..
                "me, we're better off without him.\n\nDarkclaw, however, did possess an orb that the " ..
                "Horde is interested in procuring. Who knows why... I leave that to the warlocks. All I " ..
                "know is that I need that orb.",
            rewardChoices = {{53366, 1}, {53369, 1}},
            rewardMoney = 350,
        },
        [25261] = {
            description = "One of our more useful shaman, Margoz, knows more of the Burning Blade's " ..
                "corruption. He speaks of a cave called Skull Rock in the mountains, just outside " ..
                "Orgrimmar, that shelters a large band of Burning Blade cultists.\n\nBefore you go to " ..
                "Skull Rock, speak with Margoz. He is wise and his council is valued.\n\nHe is camped to " ..
                "the southeast, between the coast and Drygulch Ravine.\n\nFollow his advice, but whatever " ..
                "Margoz says, <name>, I still want you to crush those cultists!",
        },
        [25262] = {
            description = "<name>. The Burning Blade has infested the cave east of Orgrimmar known as " ..
                "Skull Rock. Inside that cave they perform vile rituals, and burn their own flesh with " ..
                "Searing Collars.\n\nBy wearing these collars, I believe the cultists attune themselves " ..
                "to demonic power. But to confirm this, I must have a collection of the collars to " ..
                "study.\n\nGo to Skull Rock and gather Searing Collars from the cultists you find there. " ..
                "Bring them to me, and I will uncover their secrets.",
            rewardChoices = {{53358, 1}, {53387, 1}, {53390, 1}},
        },
        [25263] = {
            description = "The Searing Collars you brought me are powerful demonic implements. Divining " ..
                "their origin is, I'm afraid, beyond my skills as a shaman. We will need a warlock to " ..
                "study them.\n\nTake a searing collar to Neeru Fireblade. Although he is a skilled " ..
                "warlock, he professes to use his powers to thwart demons, and claims his research in the " ..
                "occult is benign. Be that true or false, we may need his aid against the demonic cult in " ..
                "Durotar.\n\nYou may find Neeru in Orgrimmar in the Cleft of Shadow.",
        },
        [25264] = {
            description = "Since the last great war when the Burning Legion was defeated, I have searched " ..
                "for sources of demonic corruption in orc society. The collar you brought me confirms my " ..
                "fears.\n\nIt belongs to the Burning Blade.\n\nYour role in this tale is nearly complete, " ..
                "<name>. Go to Far Watch Post, on the border of the Barrens to the west, and speak with " ..
                "my assistant, Ak'Zeloth. Pass on to him this information.",
        },
        [25265] = {
            description = "We just can't thank you enough for all that you've done. Now we can all get " ..
                "off of this island before it kills us!\n\nThrall is going to want to speak with you " ..
                "first, <name>. I'll rocket you over there.\n\nSee you on the ship!",
            rewardChoices = {{52927, 1}, {52971, 1}, {58499, 1}, {62335, 1}},
        },
        [25266] = {
            description = "The goblins and orcs have accomplished too much together to part ways now, " ..
                "<class>. I intend for the Bilgewater Cartel to become part of the Horde.\n\nI have " ..
                "something that I want you to deliver to the new warchief. Give this package to my " ..
                "Kor'kron friend on the dock at Bladefist Bay in Durotar. He will help you to get into " ..
                "Orgrimmar safely.\n\nSpeak with Sassy Hardwrench on the ship when you are ready to set " ..
                "sail.\n\nUntil we meet again. Aka'Magosh, a blessing on you and yours, <name>!",
            rewardMoney = 100,
        },
        [25267] = {
            description = "<The Kor'kron loyalist opens the package, palming one object while reading a " ..
                "letter from within. As he finishes the note from Thrall, the barest hint of a fanged " ..
                "smile appears on his face.>\n\nYou are to take this directly to Warchief Hellscream " ..
                "inside Orgrimmar. Make certain that Garrosh knows that it is from Thrall.\n\nTake my " ..
                "battleworg. Hurry, little goblin, there is no time to waste for this message!",
            rewardChoices = {{67154, 1}, {67156, 1}, {67157, 1}},
            rewardMoney = 800,
        },
        [25268] = {
            description = "Southwest of here lies the shrine of Goldrinn, a memorial erected in honor of " ..
                "the ancient wolf spirit and his contribution during the War of the Ancients.\n\nOur new " ..
                "worgen allies have been drawn to the memory of the wolf god - go figure! - and were in " ..
                "the process of cleaning up the shrine.\n\nI haven't heard anything from my contact, Ian " ..
                "Duran, in days. Can you fly down there and find him? I've got a bad feeling that " ..
                "Goldrinn's shrine is in trouble...",
        },
        [25269] = {
            description = "Have you heard of Lo'Gosh, the wolf ancient? In the Alliance tongue, he is " ..
                "known as \"Goldrinn.\"\n\nI don't need to tell you how important the wolf god has been " ..
                "to the Horde - his tenacity under adversity has been an inspiration to all of our " ..
                "disparate races.\n\nSouthwest of here, down in the valley, lies a shrine to Goldrinn. My " ..
                "friend Takrik Ragehowl was refurbishing the shrine when I stopped hearing from him. I " ..
                "fear the worst.\n\nPlease find Takrik and make sure the shrine is okay!",
        },
        [25270] = {
            description = "The shrine has been taken, <name>. We need the tenacity of Lo'Gosh now more " ..
                "than ever.\n\nThese defilers - the lice-ridden wolf-men running rampant over the shrine " ..
                "- dishonor the memory of the wolf god. They arrived with the Twilight's Hammer, howling " ..
                "with their own twisted religion. They seek to corrupt noble Lo'Gosh to fit their own " ..
                "warped pantheon.\n\nKill them! Kill them and bring me the tools of their worship, a kind " ..
                "of polluted incense. I must understand what they want with the shrine...",
            rewardMoney = 78000,
        },
        [25271] = {
            description = "The beasts you see here, they're no longer my brothers from Gilneas. They've " ..
                "been corrupted by some kind of madness, and they've taken over the shrine.\n\nThey came " ..
                "when the Twilight's Hammer arrived in Hyjal, and they howl the name of some blasphemous " ..
                "mockery of our beloved Goldrinn. Forget about me - destroy these vandals before they " ..
                "continue to defile the shrine.\n\nAs you destroy them, look for the incense they carry " ..
                "and bring me some samples.",
            rewardMoney = 78000,
        },
        [25272] = {
            description = "The actions of these feral dogs are beginning to make sense. The Twilight's " ..
                "Hammer fears the power of the ancients. They do not want Lo'Gosh to return.\n\nSo " ..
                "they've summoned their own wolf god - a perversion of what once was. \" Lycanthoth,\" " ..
                "the corruptor.\n\n<name>, Lycanthoth is but a shadow of Lo'Gosh's power, but the beast " ..
                "must be destroyed so that the true ancient can return. Take this incense, and burn it in " ..
                "the Maw of Lycanthoth east of here. Slay the monstrosity and free the spirit of Lo'Gosh!",
            rewardChoices = {{57375, 1}, {57376, 1}, {57374, 1}},
        },
        [25273] = {
            description = "I think I understand what's happening here. The Twilight's Hammer fears that " ..
                "the ancients may someday rise up to oppose them. They'll do anything to stop the return " ..
                "of Goldrinn.\n\nThis \" Lycanthoth \" is a twisted version of our beloved wolf god, " ..
                "summoned by the Twilight's Hammer to replace him.\n\nBah! It is but a shadow of " ..
                "Goldrinn's power. <name>, kill this beast so that the true ancient can return. Take this " ..
                "incense and burn it in the Maw of Lycanthoth east of here. Slay that beast and free " ..
                "Goldrinn!",
            rewardChoices = {{57378, 1}, {57379, 1}, {57377, 1}},
        },
        [25274] = {
            description = "You're here at last, <name>. Just in time as well.\n\nNews of Ragnaros' " ..
                "emergence has spurred a large wave of recruits to seek membership in the Twilight's " ..
                "Hammer.\n\nIf you're to infiltrate the cult, the time is now. We will need recruitment " ..
                "papers -- signed in blood by a referring Twilight member. Lure one of the new recruits " ..
                "away from the group and hit them with this blackjack.\n\nIf you're lucky, you'll be able " ..
                "to steal his recruitment papers. Bring them back to me and we'll do our best to alter " ..
                "them.",
            rewardMoney = 78000,
        },
        [25275] = {
            description = "Your people are busy with the terraforming of Azshara. We will remake the land " ..
                "in the image of the Horde so that all will know that Kalimdor is ours!\n\nGo north " ..
                "through the city. On the far side of the Valley of Honor you will find the Orgrimmar " ..
                "Rear Gate. Report to Labor Captain Grabbit outside the gates, goblin.\n\nFor the Horde!!!",
        },
        [25276] = {
            description = "There. Not my best work, but certainly not my worst. You will be known as " ..
                "\"<name>damus\" among the cultists.\n\nThese papers will bump you ahead of the other " ..
                "recruits and allow you to speak directly to the Twilight instructors.\n\nGo to the " ..
                "proving grounds and show these to Condenna the Pitiless. She's separating the wheat from " ..
                "the chaff.\n\nShow her what you're made of.",
            rewardMoney = 39000,
        },
        [25277] = {
            description = "We are well on our way to returning the shrine to its former glory, <name>. " ..
                "But there is some housecleaning to take care of. On the other side of this meadow, some " ..
                "ogre squatters are setting up camp, led by a thick-headed chunk of ugly by the name of " ..
                "Gar'gol.\n\nKill Gar'gol's minions and see if we can't send him packing.",
            rewardMoney = 78000,
        },
        [25278] = {
            description = "Thanks to your efforts, we may soon be able to return this shrine to its " ..
                "former glory. But first we've got to secure this valley. South of here, a group of ogres " ..
                "led by Gar'gol has set up camp in a stinking hovel.\n\nI wouldn't characterize Gar'gol " ..
                "as a 'threat' so much as an enormous fleshy obstacle thrown into our path to distract us " ..
                "from the real danger. Nonetheless, he and his goons will have to be dealt with.\n\nKill " ..
                "Gar'gol's minions in Goldrinn's name!",
            rewardMoney = 78000,
        },
        [25279] = {
            description = "Yes, <name>. I am Goldrinn, the one called \"Lo'Gosh\" in your tongue. Your " ..
                "persistence in the face of fear has unbound me from twilight's grasp.\n\nMy shrine has " ..
                "been purified, and my worshippers have returned to their rightful place at my right " ..
                "paw.\n\nReturn to Takrik and continue your work here in Hyjal. I will have need of you " ..
                "again soon.",
            rewardMoney = 78000,
        },
        [25280] = {
            description = "Yes <name>, I am Goldrinn. Your persistence in the face of fear has unbound me " ..
                "from twilight's grasp.\n\nMy shrine has been purified, and my worshippers have returned " ..
                "to their rightful place at my right paw.\n\nReturn to Ian and continue your work here in " ..
                "Hyjal. I will have need of you again soon.",
            rewardMoney = 78000,
        },
        [25281] = {
            description = "You are now able to move about this realm more freely and without fear of " ..
                "drowning.\n\nThis is where our work begins.\n\nFirst, you have many allies nearby who " ..
                "are drowning as we speak. As I saved you, you must save them.\n\nI have enchanted the " ..
                "shell you brought me. Use it to rescue your friends.\n\nHurry now!",
        },
        [25284] = {rewardMoney = 2500},
        [25291] = {
            description = "You've proven you're worthy of at least participating in our most basic " ..
                "training.\n\nYou'll find one of our settlements east of here. Speak to instructor Mylva " ..
                "there.",
            rewardMoney = 39000,
        },
        [25292] = {rewardMoney = 2500},
        [25294] = {
            description = "Hmmmphh.... it seems they'll let anyone in these days.\n\nVery well. You " ..
                "doubtlessly became acquainted with Smolderos in the proving grounds.\n\nWell, I've been " ..
                "entrusted with the care of one of his pups. Quite the little terror -- if he grows up to " ..
                "be anything like his father he shall serve our cause well.\n\nCollect meat from the " ..
                "basilisks around the area and feed them to him.",
            rewardMoney = 78000,
        },
        [25296] = {
            description = "It's me, <name>, Ortell!\n\nDon't look directly at the outhouse... you'll give " ..
                "away my position.\n\nEverything's going according to plan then? Excellent!\n\nI'm going " ..
                "to need you to obtain some intelligence while you're here. It might not seem like much " ..
                "to get our hands on a map or a letter, but it may mean saving a hundred lives on our " ..
                "side if we can anticipate our enemy's next move.",
            rewardMoney = 78000,
        },
        [25297] = {
            description = "I know of a draught that should jolt these gibbering former slaves back to " ..
                "reality. Gather some stonebloom from the rocks around Gar'gol's hovel, some " ..
                "bitterblossom from the shores of the nearby lake, and a darkflame ember from one of the " ..
                "braziers at the hovel entrance. The draught won't last long, so combine the ingredients " ..
                "at a twilight cauldron by the entrance to the hovel.\n\nOne sip of that draught should " ..
                "knock some sense into the brainwashed slaves!",
        },
        [25298] = {
            description = "<Rio said that the draught would not remain effective for long.>\n\n<You'd " ..
                "better hurry into the hovel and administer it to as many Twilight Servitors as you can " ..
                "find.>",
            rewardChoices = {{57363, 1}, {57364, 1}, {57365, 1}},
            rewardMoney = 156000,
        },
        [25299] = {
            description = "You might think you're ready to receive the knowledge we're to impart on you. " ..
                "But you are not.\n\nThink of your mind as a box inside a series of other boxes.\n\nEach " ..
                "step of our training will open one of those boxes, until you are ready to achieve direct " ..
                "communion with the elements.\n\nTake the Core of Ascension and answer all questions it " ..
                "asks of you, truthfully. Failing to do so could be... fatal.",
            rewardMoney = 78000,
        },
        [25300] = {
            description = "The ogre clan across the lake is led by Gar'gol. I use the term loosely; " ..
                "Gar'gol has the intelligence of raw beef.\n\nSo far as I can tell, Gar'gol is taking " ..
                "orders from a magical instrument: \"The Eye of Twilight.\" He follows its commands " ..
                "unquestioningly.\n\nIf we can sabotage the eye, we can cause unimaginable havoc.\n\nGo " ..
                "to Gar'gol's hovel and seek out the Eye of Twilight near the entrance. Study it. Find a " ..
                "way to subvert it. Ah, marvelous chaos...",
        },
        [25301] = {
            description = "<During your brief communion with the Eye, you felt that its power source lay " ..
                "deep within the hovel. You felt the weight of a powerful tome, binding together four " ..
                "elements.>\n\n<Mastering the Eye will require you to search the hovel for this tome.>",
        },
        [25303] = {
            description = "<You can't read the text, but diagrams seem to indicate that the devices " ..
                "around you should be activated in a set order.>\n\n<One passage of the Apocrypha has " ..
                "been translated to modern text:>\n\nIn the beginning was shadow eternal. Hate blazed " ..
                "forth, and FIRE was born. Wounds scabbed, and so begat EARTH. Cries of anguish birthed " ..
                "howling WIND. Wherein the skies wept seas of TEARS. We live in the shadow, The world we " ..
                "know Built of rage, hurt, anguish and sorrow.",
            rewardChoices = {{57380, 1}, {57381, 1}, {57382, 1}},
        },
        [25304] = {
            description = "Our settlement on Sardor Isle was lost to the Hatecrest naga. Overwhelmed by " ..
                "their numbers, we fell back to the mainland. While they coveted their newly-gained " ..
                "sandbar, we raised New Feathermoon on the shore and amassed an even greater " ..
                "army.\n\nNow, the Hatecrest will be driven back into the sea. Find our Ancient of War " ..
                "along the shore. He will take you to the front lines, where Tambre leads the offensive.",
            rewardMoney = 2000,
        },
        [25308] = {
            description = "According to the intelligence you acquired, there is major friction between " ..
                "the ogres and non-ogres in the cult.\n\nHigh Cultist Azennios and the ogre mage " ..
                "Karr'gonn are meeting at the Seat of the Chosen in an attempt to ease the " ..
                "conflict.\n\nThere is an outhouse like this one at the Seat of the Chosen. Go there and " ..
                "put on this ogre disguise. Find a way to kill Azennios while he's in this mission of " ..
                "peace.\n\nWe must exploit this division as much as we can!",
            rewardMoney = 78000,
        },
        [25309] = {
            description = "You've made it this far. Others haven't.\n\nGo to Doom's Vigil, just north of " ..
                "here. We've rounded up all the... failures. I want you to help take care of them. It'll " ..
                "be good for your spiritual growth.\n\nIf this cold-blooded act gives you trouble, think " ..
                "of it as their second chance. Should any of them manage to kill you... well, they'll " ..
                "take your spot.",
            rewardChoices = {{57306, 1}, {57307, 1}, {57308, 1}},
            rewardMoney = 78000,
        },
        [25310] = {
            description = "We took Darkwhisper Gorge from the demons of the Burning Legion by force. " ..
                "We've held on to our territory pretty well so far, with one exception.\n\nWe recently " ..
                "lost the Gates of Sothann to a pit lord and his army. We cannot allow this to " ..
                "stand.\n\nUse this talisman when you're near him. You'll gain the powers of a flame " ..
                "ascendant temporarily. Make it count.",
            rewardMoney = 156000,
        },
        [25311] = {
            description = "The demons of the Burning Legion think they can just walk up here and take " ..
                "whatever territory they want. Sure -- the territory was previously theirs, but that's " ..
                "beside the point.\n\nWe'll teach them not to cross the Twilight's Hammer.\n\nHead to the " ..
                "Gates of Sothann and wipe out the contingent of Horrorguards that roam the area.",
            rewardMoney = 78000,
        },
        [25312] = {
            description = "<You force your own image into the Eye, manipulating it to give the ogres " ..
                "different orders. As you do so, you feel another presence within the Eye, probing you, " ..
                "seeking out a weakness. A distant being fumes with rage. You've made some enemies " ..
                "today!>\n\n<Your work here is done, and the ogres will be friendly to you. Return to " ..
                "Royce Duskwhisper at the Shrine of Goldrinn and let him know what you've accomplished.>",
            rewardMoney = 156000,
        },
        [25314] = {
            description = "Listen, <name>. I found out what they're doing with Jarod Shadowsong. He's " ..
                "scheduled to be sacrificed by the ogres of the Twilight's Hammer as part of this year's " ..
                "initiation.\n\nI heard that the initiate charged with delivering the speech ahead of the " ..
                "sacrifice is an ogre named Okrog, but get this: you were a close second.\n\nWe need you " ..
                "to deliver that speech if we're to free Jarod. Don't worry -- I'll write you some cue " ..
                "cards -- just make sure Okrog has an \"accident\" as he leaves the Seat of the Chosen.",
            rewardMoney = 78000,
        },
        [25315] = {
            description = "You're finally ready, <name>damus.\n\nI am so proud of you and all you've " ..
                "accomplished.\n\nToday you will deliver a speech in front of your peers and inspire them " ..
                "to crush our enemies until Hyjal is nothing but a pile of ash.\n\nRemember, <name>damus. " ..
                "It'll be important to read your audience's emotions and use words that best address " ..
                "those emotions.",
            rewardMoney = 234000,
        },
        [25316] = {
            description = "<name>! We've heard much about you and your previous accomplishments.\n\nIt is " ..
                "good that you've come here just as Azeroth finds itself in a time of great " ..
                "need.\n\nDeathwing's minions are attacking Hyjal and seek to bring the destructive " ..
                "Ragnaros back into our world.\n\nAronus will take you to join Malfurion's forces in " ..
                "Hyjal. Lend them what help you can.",
            rewardMoney = 59000,
        },
        [25317] = {
            description = "< Ysera 's eyes look distant, as if not fully acknowledging you.>\n\nI feel it " ..
                "as well, <class>. Ragnaros has arrived.\n\nWe must defeat his minions before he can join " ..
                "them and lend them his strength.\n\nSeek Malfurion Stormrage at the Tranquil Grove, west " ..
                "of here, and aid his forces in any way you can.\n\nI must seek answers from within the " ..
                "Emerald Dream. You must protect the World Tree until I return.",
            rewardMoney = 19500,
        },
        [25319] = {
            description = "Make no mistake about this, <name>. The outcome of this war will determine the " ..
                "very survival of our world as we know it.\n\nThe Twilight's Hammer has become more " ..
                "powerful than ever with Deathwing's return. Should they succeed in taking over the World " ..
                "Tree, they might strike a blow from which we will never recover.\n\nIt is time we beat " ..
                "back the enemy. It is time we crushed the Twilight's Hammer.",
            rewardChoices = {{57290, 1}, {57291, 1}, {57292, 1}, {57293, 1}},
            rewardMoney = 78000,
        },
        [25320] = {
            description = "I've heard about you, <name>, and the news you brought from the south. The " ..
                "battle has reached a stalemate.\n\nOne that I fear is about to be broken by the " ..
                "Firelord's reawakening.\n\nThat is unless we tip the scales in our favor in some " ..
                "way.\n\nThere is a scout that was captured by the Twilight's Hammer. I believe she was " ..
                "in possession of valuable intelligence. Find her in the Twilight camp to the west.",
            rewardMoney = 39000,
        },
        [25321] = {
            description = "I'd been scouting behind enemy lines for nearly a day when they caught " ..
                "me.\n\nThis attack on our frontlines is not what it appears, <name>.\n\nI'll give you " ..
                "all the details, but first let's find a way to get me out of here.\n\nOnly the overseers " ..
                "carry keys to these cages.\n\nFrom what I recall, they're in the middle of the crater, " ..
                "in the thick of it.\n\nSee if you can get a key off of one of them.",
            rewardMoney = 59000,
        },
        [25323] = {
            description = "The large elementals that besiege us are not a singular entity.\n\nThey are an " ..
                "amalgamation of lesser spirits bound together by the Twilight's Hammer cultists' " ..
                "magic.\n\nThe rebuilt flameseer's staff will give us enough power to shatter its " ..
                "bonds.\n\nDestroy the smaller elementals once you've broken up the more dangerous large " ..
                "ones.",
            rewardMoney = 59000,
        },
        [25324] = {
            description = "The Twilight's Hammer wants to free Fandral Staghelm?\n\nMalfurion suspected " ..
                "his corruption ran deep... this just cements it.\n\nAt any rate we cannot allow our " ..
                "enemies to get their hands on such a powerful arch druid.\n\nI've a plan, <name>. We " ..
                "will move the prisoner through the Emerald Dream. It will be risky, but with all the " ..
                "cultists present here it might be the only way to guarantee our success.\n\nSpeak to " ..
                "Saynna Stormrunner inside the Barrow Dens to the northeast.",
            rewardMoney = 39000,
        },
        [25325] = {
            description = "Alysra 's plan might be necessary, <name>. I don't know how much longer we can " ..
                "hold off the cultists.\n\nFandral Staghelm is bound by powerful spells. He won't be able " ..
                "to escape you, even inside the Emerald Dream.\n\nBeware, though, for all we know the " ..
                "nightmare has spread to this part of the world inside the dream.\n\nTake Fandral to the " ..
                "surface and hand him to Alysra. Let us hope he's more secure in Moonglade than he is " ..
                "here.",
            rewardChoices = {{57284, 1}, {57285, 1}, {57286, 1}},
            rewardMoney = 59000,
        },
        [25328] = {
            description = "<Kristoff cranes his neck, trying to look you in the eye.>\n\nListen, you " ..
                "gotta get me outta here. They're either going to eat me or turn me over to the " ..
                "Twilight's Hammer. Maybe both.\n\nThey've padlocked me in, and Gar'gol keeps the key in " ..
                "his personal treasure chest. Kill Gar'gol if you have to - but get that " ..
                "key!\n\n<Kristoff flails his limbs, helplessly.>",
            rewardMoney = 78000,
        },
        [25329] = {rewardMoney = 8000},
        [25330] = {
            description = "Look at these fools. Half of them won't even make it past this trial.\n\nThey " ..
                "are not worthy of ascending into our inner circles. But perhaps... perhaps they are " ..
                "worthy of menial service.\n\nTake this gem and utilize its power to save some of the " ..
                "less competent supplicants. Those who have no chance of succeeding. Those already on " ..
                "fire, preferably.",
            rewardMoney = 59000,
        },
        [25332] = {
            description = "<You reach up to unfasten Kristoff's bonds.>\n\nGood! Make a break for the " ..
                "exit, and I'll follow.\n\nIf we get separated, check back here to make sure I haven't " ..
                "been recaptured.",
            rewardChoices = {{57360, 1}, {57361, 1}, {57362, 1}},
            rewardMoney = 78000,
        },
        [25333] = {
            description = "The Twilight's Hammer? Here?\n\nThis is far more serious than I expected. " ..
                "We've got to put a stop to this. I don't know if I'm ready to lead such an offensive, " ..
                "but I'm not about to let my fears get in the way of what needs to be done!\n\nI will " ..
                "rally our forces from Feathermoon Stronghold. Head to Dire Maul, make your way to the " ..
                "arena, and disrupt Cho'gall's activities; we will launch our attack during the confusion.",
            rewardChoices = {{54935, 1}, {54936, 1}, {54937, 1}},
            rewardMoney = 8000,
        },
        [25334] = {
            description = "Can ya feel how angry the elements be? They be wantin' to attack us and " ..
                "consume us even as we just arrive. We need ta calm dem, but that kinda wisdom only comes " ..
                "from knowin' what's riling them up in da first place.\n\nCome sit with me by da fire. " ..
                "Let yaself get lost in da flames... let ya spirit peer into the true threat.",
            rewardMoney = 59000,
        },
        [25336] = {rewardMoney = 4500},
        [25337] = {rewardMoney = 4500},
        [25338] = {rewardMoney = 4000},
        [25339] = {rewardMoney = 7500},
        [25340] = {rewardMoney = 7500},
        [25341] = {rewardMoney = 4000},
        [25342] = {rewardMoney = 2000},
        [25344] = {rewardMoney = 4000},
        [25349] = {rewardMoney = 5000},
        [25350] = {
            description = "If you have a moment, <class>...\n\nOne of the students I was teaching has " ..
                "gone to explore the darkmist ruins to the south by himself. I warned him that it was too " ..
                "dangerous, but he was too excited to listen. I had spoken with him earlier about an " ..
                "amulet that is concealed within those ruins. Now, I fear that he may have run off in " ..
                "search of it, because of me...\n\nEstulan has forbidden us to pursue him. If you go " ..
                "there, could you please look for him?",
        },
        [25352] = {
            description = "Wonderful work in the hovel, <name>. I prayed at the shrine while you were " ..
                "away, and in my visions, Goldrinn was watching you closely.\n\nBut we've been on the " ..
                "defensive too long: it's time to foil the Twilight's Hammer directly.\n\nFly up to the " ..
                "Lightning Ledge and disrupt their operation. Kill the stormcallers and the monstrosities " ..
                "they're preparing to unleash!",
            rewardChoices = {{57370, 1}, {57371, 1}, {57372, 1}, {57373, 1}},
            rewardMoney = 78000,
        },
        [25353] = {
            description = "When I prayed at the shrine, Goldrinn granted me another vision. I saw you " ..
                "standing astride the Lightning Ledge, with lightning in your hands. Goldrinn seems to " ..
                "feel that this is of the utmost importance, but I don't understand what the ancient has " ..
                "planned...\n\n<name>, go to the Lightning Ledge. Twilight's Hammer has been running " ..
                "experiments with something called a \"Lightning Channel.\" Investigate these channels, " ..
                "then use this totem to summon the Spirit of Goldrinn and see what he has in mind...",
        },
        [25354] = {
            description = "The shrine is secure, the ogres in disarray. Enough. The time has come to go " ..
                "on the offensive.\n\nSomething sinister is underway above us, on the Lightning Ledge. It " ..
                "is time to unleash the fury of the ancients!\n\nFly up to the Lightning Ledge and " ..
                "demolish the Twilight's Hammer there. Crush them, <name>, slay their creations and hurl " ..
                "their bodies from the mountainside!",
            rewardChoices = {{57366, 1}, {57367, 1}, {57368, 1}, {57369, 1}},
            rewardMoney = 78000,
        },
        [25355] = {
            description = "Lo'Gosh granted me a vision while you were in the hovel, <name>. I saw you " ..
                "striding across the Lightning Ledge, with lightning bolts in your hand. The vision was " ..
                "powerful: Lo'Gosh feels this is of utmost importance. We must not fail the " ..
                "ancient.\n\nUpon the Lightning Ledge, Twilight's Hammer has been experimenting with " ..
                "devices they call \"Lightning Channels.\"\n\nInvestigate one of these channels, then use " ..
                "this totem to summon the Spirit of Lo'Gosh and learn what the ancient is planning...",
            rewardMoney = 78000,
        },
        [25357] = {
            description = "So many good men have been lost today. Without you, that number would be even " ..
                "higher.\n\nYou have our gratitude.\n\nIf what the shaman says is true, then there is no " ..
                "time to spare. The naga are scouring these waters looking for survivors.\n\nWe are not " ..
                "yet ready to fight. You must buy us time to make preparations. Find the naga that hunt " ..
                "us and delay their efforts.",
            rewardMoney = 78000,
        },
        [25358] = {
            description = "How am I feelin', you ask?\n\nWell, after bein' yanked from the deck of our " ..
                "ship by a giant sea monster and then left to drown in the sea... not so good!\n\nMy " ..
                "nerves are gettin' the best of me, to be honest.\n\nIf you could round up some of the " ..
                "supplies that are sure to be floatin' around the nearby wrecks, I could likely whip up " ..
                "somethin' that'll take the edge off...",
            rewardItems = {{52974, 1}},
            rewardMoney = 78000,
        },
        [25359] = {
            description = "You met Toshe back in Damplight Cavern, didn't you? He followed some of the " ..
                "fleeing naga to a set of ruins to the east and then sent for help.\n\nFind Toshe at the " ..
                "ruins as soon as you can. If you find out anything about what the naga want, please let " ..
                "us know.",
            rewardMoney = 19500,
        },
        [25360] = {
            description = "These crabs are not friendly. Not. Friendly.\n\nSam's endless drilling is " ..
                "riling them up. I know from experience that there's no stopping Sam, so let's look into " ..
                "the other side of things, shall we?",
            rewardChoices = {{59759, 1}, {59760, 1}, {59761, 1}},
            rewardMoney = 78000,
        },
        [25361] = {rewardMoney = 4500},
        [25362] = {rewardMoney = 4500},
        [25363] = {rewardMoney = 4500},
        [25364] = {rewardMoney = 8500},
        [25367] = {rewardMoney = 4500},
        [25368] = {rewardMoney = 4000},
        [25369] = {rewardMoney = 8500},
        [25370] = {
            description = "This is no mere natural occurrence, <name>. There must be a twilight presence " ..
                "behind our lines that we haven't accounted for.\n\nIt's possible that whoever is " ..
                "instigating the elemental disturbance is using foul magic to hide themselves from our " ..
                "sight.\n\nSeek the aid of the faerie dragons that roam near the World Tree; they can see " ..
                "through any of our enemy's illusions.\n\nFeed them the juniper berries that grow nearby " ..
                "to gain their trust.",
            rewardMoney = 78000,
        },
        [25371] = {
            description = "If you are going to be making it anywhere in this kelp forest, we need to get " ..
                "you a reliable mount. I think I've come up with a better plan than the sea turtle, and " ..
                "it's not far.\n\nTie off a lure at the rope just west of us, and then mount the seahorse " ..
                "that it will attract.\n\nBe warned, you may need to work hard to break the beast.",
            rewardItems = {{54465, 1}},
            rewardMoney = 156000,
        },
        [25372] = {
            description = "<The finger-like branches of one of Nordu 's burning limbs part, revealing an " ..
                "untouched, glimmering seed.>\n\nThis is the Heart of the Forest. The seed of " ..
                "life.\n\nTake this to your Arch Druid at Aessina's Grove - Hamuul Runetotem will know " ..
                "how to invoke its power. I promise you, the wilderness spirit will be silent no longer. " ..
                "New life will bloom from the ashes of old.\n\nThank you, <race>. My time is done.",
            rewardChoices = {{57264, 1}, {57265, 1}, {57266, 1}, {57267, 1}},
            rewardMoney = 7800,
        },
        [25373] = {rewardMoney = 4500},
        [25374] = {rewardMoney = 9000},
        [25375] = {rewardMoney = 4500},
        [25377] = {
            description = "It is unclear what manner of creature scrawled the seemingly random markings " ..
                "on this piece of parchment, but upon close inspection, some of the obscure shapes begin " ..
                "to look like landmarks.\n\nScanning the sea floor, you think you recognize a few points " ..
                "of reference, one being a nearby sunken ship. If your guess is correct, there appears to " ..
                "be treasure of some kind near the wreck.\n\nYou cannot help but wonder what the scaly, " ..
                "serpentine figure on the map might represent....",
            rewardItems = {{59788, 1}},
            rewardMoney = 78000,
        },
        [25381] = {
            description = "The inferno raging up ahead marks the front line between us and the forces of " ..
                "the Fire Lord. The fire elementals unleashed here are unlike any I've ever " ..
                "encountered.\n\nCan you help us stem the tide of destruction? Slay the raging " ..
                "firestorms... before they engulf Aessina's Grove and erase all hope of someday " ..
                "reclaiming this mountain!",
            rewardMoney = 78000,
        },
        [25382] = {
            description = "The firestorms up ahead are unbound elementals in the purest form - something " ..
                "I didn't think could exist outside their own plane. Only very skilled summoners could " ..
                "unleash something like this.\n\n<name>, head into the Inferno and seek out Twilight " ..
                "Inferno Lords. They've got to be summoning in reinforcements as we speak. Silence " ..
                "them... For good!",
            rewardChoices = {{57329, 1}, {57330, 1}, {57331, 1}},
            rewardMoney = 78000,
        },
        [25383] = {rewardMoney = 10000},
        [25385] = {
            description = "Help us, <class>! The forest is aflame, and the wee animals can't find their " ..
                "way out. They can't fight for themselves, with their teeny-tiny little teeth and their " ..
                "soft furry paws! They're fluffy and sweet.\n\nThey have wet little noses!\n\nIf you " ..
                "don't save them, I don't want to even THINK about it.\n\n<She slaps her palms over her " ..
                "eyes.>\n\nI'm not thinking!",
            rewardMoney = 78000,
        },
        [25386] = {rewardMoney = 2000},
        [25387] = {rewardMoney = 3000},
        [25388] = {
            description = "This crate, labeled 'Crab Meat', seems to have fallen from a recently sunken " ..
                "cargo ship.\n\nAdarrah would surely welcome such a find, considering the ordeal she's " ..
                "had to endure.",
            rewardItems = {{68609, 1}},
            rewardMoney = 78000,
        },
        [25389] = {
            description = "It could be days before we're ready to make our way to the surface, and to be " ..
                "honest, I'm already beginning to get hungry.\n\nI hate to be picky, but when it comes to " ..
                "seafood, I'm afraid there are very few things I can stomach.\n\nIf you come across any " ..
                "lobster types, I would happily pay you what coin I have with me for their tails.",
            rewardMoney = 78000,
        },
        [25390] = {
            description = "Let's just get it out in the open. I'm no stranger to love, <name>.\n\nOver " ..
                "the years, if there's one thing I've learned, it's that love's tangible treasures last " ..
                "longer than the flames of passion.\n\nI've managed to collect my fair share of these " ..
                "gifts - gemstones, rings, necklaces, and the like, and I carry them with me wherever I " ..
                "go.\n\nAt least I used to...\n\nWhen I was swept from the ship, my valuables were " ..
                "scattered across the sea. Help me recover them and I promise to make it worth your " ..
                "trouble.",
            rewardChoices = {{59793, 1}, {59794, 1}, {59792, 1}},
            rewardMoney = 78000,
        },
        [25392] = {
            description = "Do you speak deer? It's all in the nose.\n\n<She points to her nose.>\n\nThe " ..
                "does have fled the fires, but their little fawns - Some of them are still trapped in the " ..
                "burning and the hurt!\n\nGo back into the Inferno and escort three injured fawns back " ..
                "here to their mothers right here beside me.\n\nPlease save the little fawns, or I'll " ..
                "give you the big eyes!\n\n<Her eyes grow big and dewy.>",
            rewardChoices = {{57326, 1}, {57327, 1}, {57328, 1}},
            rewardMoney = 78000,
        },
        [25394] = {
            description = "I've discovered a brood of dragon whelps gathered off the road to the north " ..
                "with a similar affliction. Green dragons are sacred custodians of nature. The fact that " ..
                "this disease is capable of spreading to them is cause for great alarm.\n\nWe must stop " ..
                "this from spreading further through any means. Slay the infected whelps, <name>, and " ..
                "return to me.",
            rewardChoices = {{54909, 1}, {54910, 1}, {54911, 1}, {54912, 1}},
            rewardMoney = 4000,
        },
        [25395] = {
            description = "You've got to help us, <lad/lass>. We were tasked with escorting a precious " ..
                "cargo to our fellow dwarves...a keg full of the finest ale you can get out " ..
                "here!\n\nUnfortunately, bird-brain over here fell asleep on the job! Those blasted orcs " ..
                "took our keg, and hauled it up into Dun Algaz where they're hiding.\n\nThis can't stand! " ..
                "Now, while I stay here and try to convince this idiot that it was his fault, I'd like " ..
                "you to go in there and get our keg back. For Khaz Modan!",
            rewardMoney = 1200,
        },
        [25396] = {
            description = "As you witnessed, the dragon Ysondre has told us that the tears of the land " ..
                "can seal the portal from which this corruption stems.\n\nHer words ring true; in the " ..
                "glade to the west, I have seen the mountain giants distraught. They raged in frustration " ..
                "and wept, and their tears fell upon the stones as shining crystals.\n\nThough the giants " ..
                "weep no more, these stonetears must be what Ysondre referred to. We must gather them.",
            rewardMoney = 4000,
        },
        [25397] = {
            description = "The cliff giants of Feralas are extensions of the earth itself, <name>. When " ..
                "nature thrives, they are benevolent protectors and peaceful guardians.\n\nBut as the " ..
                "forest is tainted, so too are they.\n\nShould they be corrupted by this malady, they " ..
                "will lash out in violence against trees, wildlife, and the very boulders they were " ..
                "shaped from.\n\nBe wary in your tasks. Should you find any corrupted giants, destroy " ..
                "them, for the sake of those still spared.",
            rewardMoney = 4000,
        },
        [25398] = {
            description = "It is ready. Take this, <name>; a beacon of natural essence, blessed by the " ..
                "will of Ysondre.\n\nTo the north, on the other side of the flowing brook, is Dream " ..
                "Bough. There stands the Great Tree, the tallest in Feralas, a sapling of the very World " ..
                "Tree. A portal to the heart of the Emerald Dream sits in its trunk, and it is this " ..
                "portal you must seal.\n\nThe portal will be guarded, but you must be brave.",
            rewardChoices = {{54917, 1}, {54918, 1}},
            rewardMoney = 7500,
        },
        [25399] = {
            description = "The Hatecrest are fighting fiercely! Their leader is a priority, but we need " ..
                "to kill as many of them as we can.\n\nGo ahead of me, I'll meet you on the battlefield. " ..
                "Show them no mercy!",
            rewardMoney = 4000,
        },
        [25400] = {
            description = "Estulan, the Highborne up in the tower, is reclusive. I haven't been able to " ..
                "speak to him very much. He has, however, told me that the ruins of the High Wilderness " ..
                "to the south are full of Gordunni ogres.\n\nThe ogres are not only a threat, they're " ..
                "destroying any forest and wildlife nearby. Estulan has also warned me of what might " ..
                "happen if they discover any artifacts of Highborne power among the ruins...\n\nHead " ..
                "south, <name>, and slay any Gordunni you find!",
            rewardMoney = 8000,
        },
        [25401] = {
            description = "In addition to clearing out the ogres...\n\nEstulan mentioned something else " ..
                "about the ogres. He said the ogre warlocks may have some sort of orb, or other item of " ..
                "power\n\nHe was terse about it, but seemed upset...he said there was \"no way they could " ..
                "be Highborne\", so I think he wants to know just where they got them. Bring me back one " ..
                "of these orbs.",
            rewardMoney = 4000,
        },
        [25402] = {
            description = "He's right. I haven't been among the night elves long, but I can tell these " ..
                "markings are completely unlike any kaldorei decorations...\n\nEstulan needs to see this. " ..
                "Take this up the tower to him. He may be surly, but don't be dissuaded; once he sees the " ..
                "orb, he'll realize it's an important issue.",
            rewardMoney = 2000,
        },
        [25403] = {
            description = "This is neither a crude ogre trinket, nor an ancient relic made by my kind. " ..
                "Its specific construction is new to me...and this fact disturbs me greatly.\n\nThe " ..
                "wolf-girl will be sending you to Dire Maul soon, to fight the Gordok elite. They are the " ..
                "leaders of the Gordunni, and would know who is supplying these.\n\nTake the orb back, " ..
                "I've cast a few enchantments on it. Hold it up in front of a weakened Gordok ogre, and " ..
                "once you've captured him, bring it back here.",
            rewardChoices = {{54927, 1}, {54928, 1}, {54929, 1}, {54930, 1}},
            rewardMoney = 4000,
        },
        [25404] = {
            description = "South of here you'll find a solitary tower, known as \"Blackhorn's Penance.\" " ..
                "Upon it is bound a demon: Tyrus Blackhorn.\n\nYou may think me mad for turning to an old " ..
                "foe for help, but Blackhorn was once a mortal, and I can't imagine he wants to watch " ..
                "Twilight's Hammer triumph.\n\nSpeak with Blackhorn, and see if you can convince him to " ..
                "help us in our fight. He may yet redeem himself.\n\n...Just don't set him free!",
        },
        [25405] = {
            description = "You have done well, <race>, but there is much more to do and I grow " ..
                "weary.\n\nI have expended a great deal of energy sending a distress message to Earthen " ..
                "Ring leadership, pleading for their help.\n\nI must rest if I am to be of further use to " ..
                "us here.\n\nSpeak to the leader of the men you've saved and do what you can to help them " ..
                "prepare for battle.\n\nThe naga are scouring the waters for us. It is but a matter of " ..
                "time before they return - and they will surely come in even greater force.",
            rewardMoney = 7800,
        },
        [25406] = {
            description = "With the nearby ogres dealt with, we should take the offensive and press our " ..
                "attack into their territory.\n\nThe Gordok ogres are the head of the Gordunni clan, " ..
                "ruling them from the ruins now called Dire Maul. They are stronger than the lesser " ..
                "Gordunni, but I have no doubt you can handle them, <name>. They won't know what hit them.",
            rewardMoney = 4000,
        },
        [25407] = {
            description = "The Sentinels make up the bulk of our forces here, but a well-rounded night " ..
                "elf army requires more than just night elves. The creatures of this forest, our " ..
                "ancestral home, have protected us for centuries. We simply need to rally them.\n\nTake " ..
                "this whistle. Our allies know this sound, and you'll be using it to recall " ..
                "them.\n\nBefore you start gathering creatures, I'd like you to recall a few of our " ..
                "wisps, just for practice. You can find them just outside the fortress, among the trees.",
            rewardMoney = 4000,
        },
        [25408] = {
            description = "We will decimate the Twilight's Hammer by corrupting and subverting " ..
                "them.\n\nSeeing that you have no intention of releasing me from my bonds, I require you " ..
                "to collect some reagents for me. My own demonic essence has corrupted the plant life " ..
                "around my shrine here. I need you to harvest some bileberries from the wailing weeds " ..
                "that surround this tower.\n\nMy little pets will attempt to harvest YOU in return. Try " ..
                "not to let them agitate one another.",
            rewardChoices = {{57323, 1}, {57324, 1}, {57325, 1}},
        },
        [25409] = {
            description = "Hippogryphs are majestic creatures. Some say they were created by Cenarius " ..
                "himself as a gift for the night elves. They're wary of other races, but they're " ..
                "intelligent enough to recognize a friend of a friend.\n\nI need more hippogryphs here so " ..
                "we can begin training some of our newer archers to ride them. Take the whistle again and " ..
                "rally the Frayfeather hippogyphs in the grove just south of the Tower of Estulan.",
            rewardMoney = 4000,
        },
        [25410] = {
            description = "Some people think treants are good for little more than fetching drinks in a " ..
                "war. Most of them haven't seen an entire defensive line scattered by what they thought " ..
                "was cover.\n\nAnd have you ever seen a peon try to chop one down and get surprised? I " ..
                "was in tears...\n\nAt any rate, they're immensely valuable allies. You'll find some " ..
                "wandering just outside the Tower of Estulan and more in forest to the east, just " ..
                "southeast of Dire Maul. Be on the lookout for the Horde!",
            rewardMoney = 4000,
        },
        [25411] = {
            description = "The potion you created is vile enough to wake the dead. Which is its intended " ..
                "purpose.\n\nSlay a Twilight Inferno Lord and force the brew down his throat. He will " ..
                "revive, if only briefly, and be completely under your dominance.\n\nSpeak with him and " ..
                "learn the true name of the fire elemental he is channeling into the world to burn down " ..
                "your precious forest.",
            rewardMoney = 39000,
        },
        [25412] = {
            description = "We called upon the fury and flame of the One, my former master.\n\nThe Inferno " ..
                "is by His design.\n\nHis true name is never uttered, it holds His power.\n\nEach of us " ..
                "was told but a piece. Each piece engraved on a firestone.\n\nThe One's true name is " ..
                "here, in the Inferno. Seek the three stones...",
        },
        [25419] = {
            description = "Dozens of crude gold links make up this heavy chain.\n\nDangling from the " ..
                "center link is an opalescent fragment of what must have once been a large shell-shaped " ..
                "medallion.\n\nYou wonder if the other fragments might be nearby, and if the medallion " ..
                "might be reassembled into its original state.",
            rewardChoices = {{59783, 1}, {59784, 1}, {59782, 1}},
        },
        [25420] = {
            description = "I've studied the gate here for years, trying to find a way of entry that " ..
                "wouldn't disturb any of the ancient architecture just behind it. It figures a few " ..
                "overgrown earthquakes decided to muck the whole thing up! But what's done is done, and " ..
                "the entrance to Uldum is revealed.\n\nI wasn't expecting anything to come out of the " ..
                "ruins before we went in, though. A whole mess of golems are running amok in the valley " ..
                "now, let loose from inside. Someone needs to clean them up if we're gonna get in there!",
            rewardChoices = {{56903, 1}, {56904, 1}, {56905, 1}},
            rewardMoney = 7000,
        },
        [25421] = {
            description = "At the bottom of the chest, you find a large tablet. Made of a material " ..
                "resembling stone, but completely smooth and flawless, it is covered in strange " ..
                "writing.\n\nWhile some resembles the writing on the walls, other scripts appear " ..
                "completely different. Gunstan would probably like to see this.",
            rewardChoices = {{56897, 1}, {56898, 1}, {56899, 1}},
            rewardMoney = 14000,
        },
        [25422] = {rewardMoney = 4000},
        [25423] = {rewardMoney = 4000},
        [25424] = {
            description = "I thank you for freeing me, <name>. I will tell our allies of my " ..
                "findings.\n\nI suggest that you return to the emerald dragon that sent you.\n\nThe " ..
                "Twilight's Hammer does not just seek to gain territory with this particular attack. " ..
                "They're also after a prisoner.\n\nFandral Staghelm is being held in the Barrow Dens. The " ..
                "attack doubles as a distraction to free him. To what end, I cannot tell. Perhaps our " ..
                "dragon ally can shed some light on this.",
            rewardMoney = 59000,
        },
        [25426] = {
            description = "The first of Shandris's direct orders is to deal with the Woodpaw gnolls here. " ..
                "They've been spreading too far, too fast, and are becoming a threat to both the forest " ..
                "and our war effort.\n\nThey know we're here. After we took this camp, we've been leading " ..
                "covert strikes against them. It's time to make a major blow; bring back ten of their " ..
                "manes, and we'll be ready for the next phase.",
            rewardMoney = 4500,
        },
        [25427] = {
            description = "Never underestimate a threat. These gnolls may seem like simple brutes, but " ..
                "there's animal cunning even among them.\n\nThe gnolls run as a pack, and every pack has " ..
                "Alphas: The biggest, strongest, and most ruthless members that claw their way to " ..
                "dominance. They're the ones giving orders, so they're the ones we're going to slay " ..
                "now.\n\nThey reside mostly around the Woodpaw Den, pushing the others around. Get out " ..
                "there and push harder.",
            rewardMoney = 9000,
        },
        [25428] = {
            description = "Now you will use our newfound knowledge to pull Thol'embaar into the mortal " ..
                "plane like a babe screaming from the womb. Then you will crush him.\n\nThe ritual is " ..
                "simple: take this charred branch, tap it on the ground three times, and utter his name " ..
                "aloud.\n\nYou must call him from within the heart of the Inferno. Destroy him, and bring " ..
                "his black heart back to me.",
            rewardChoices = {{57320, 1}, {57321, 1}, {57322, 1}},
        },
        [25429] = {
            description = "With the gnolls out of the way, we're ready to take care of other foes. Our " ..
                "scouts have discovered what appears to be a hive nearby, extending deep beneath the " ..
                "ground.\n\nThe insects of the hive are large and ferocious, and most likely pose an even " ..
                "greater threat than the gnolls. I want you to proceed to the hive with caution. Cut down " ..
                "a good portion of the bugs and bring back their carapaces for further study.",
            rewardMoney = 4500,
        },
        [25430] = {
            description = "The druids of Hyjal are not the only ones sworn to defend this land. The " ..
                "emerald dragons have once again become a powerful ally to our cause.\n\nSpeak to Alysra " ..
                "at the Ruins of Lar'donir, to the north, and see what you can do to help.",
            rewardMoney = 39000,
        },
        [25431] = {
            description = "Most of the insects we've seen wandering the hive have been enormous enough, " ..
                "but my scouts reported an especially huge one. It's supposedly a massive wasp, and it " ..
                "seemed to be directing the workers on the surface.\n\nI don't know much about these " ..
                "things, but if they're starting to wander beyond that pit in the ground, we need to put " ..
                "a stop to it. Kill this giant wasp and return to me.",
            rewardItems = {{54941, 1}},
            rewardMoney = 9000,
        },
        [25432] = {
            description = "We dealt the Gordunni ogres a large blow at Dire Maul, but we haven't quite " ..
                "finished the job. My scouts have reported a group of them amassed in the hills to the " ..
                "north, gathering for some reason.\n\nIt's possible they're interested in the Horde " ..
                "settlement nearby, but I don't want to take any chances. Scout the area, kill any ogres " ..
                "you come across, and report back.",
            rewardMoney = 4500,
        },
        [25433] = {
            description = "You may have seen it yourself, but other scouts have discovered an enormous " ..
                "beast being held by the ogres. Reports say it looks like a sasquatch, but if it is, it's " ..
                "the biggest ever seen in Feralas.\n\nThe ogres are most likely trying to teach it to " ..
                "obey them. While that's almost comical, I'm not going to sit by and let them train that " ..
                "thing to roll over at their command. Return to the hills and slay it.",
            rewardChoices = {{54943, 1}, {54944, 1}, {54945, 1}},
            rewardMoney = 9000,
        },
        [25434] = {
            description = "The sasquatch may be a larger threat, but we also need to wipe out the ogres. " ..
                "The Gordunni have been a nuisance to us for too long, and Lady Shandris wants them " ..
                "completely gone. Let's hope these are the last ones.\n\nKill the Gordunni tamers that " ..
                "keep the beast chained, and make sure they know the price of their meddling.",
            rewardMoney = 4500,
        },
        [25436] = {
            description = "Something truly disturbing has occured. While on patrol, several of my scouts " ..
                "were ambushed by dryads.\n\nThe dryads are close allies of the night elves and guardians " ..
                "of the forest. I assumed they were just frightened by the sight of worgen, but the " ..
                "sentinels I sent out afterwards were also attacked.\n\nWhatever is going on, I don't " ..
                "like it. I want you to go investigate as well. If even the dryads have been " ..
                "corrupted...put them to the sword.",
            rewardMoney = 5000,
        },
        [25437] = {
            description = "A dragon of the emerald dream... what have you gotten yourself involved in, " ..
                "<name>?\n\nI wouldn't keep her waiting if I were you. The place she spoke of is what we " ..
                "call the Emerald Summit. A path off the main road through the Lower Wilds leads up one " ..
                "of the high stone plateaus; there's a small shrine at the top.\n\nGood luck, <name>. I " ..
                "hope to see you back safe.",
        },
        [25438] = {
            description = "With that, I am the only one left.\n\nEven if I choose to remain in this " ..
                "world, I cannot rejoin the green flight. But this victory gives me hope. Perhaps, in " ..
                "time, I can find peace in a simple life among mortals.\n\nYou must return to your " ..
                "people. Tell them that the dragons of nightmare are gone, and will no longer threaten " ..
                "these lands.",
            rewardChoices = {{54952, 1}, {54951, 1}, {54953, 1}},
            rewardMoney = 10000,
        },
        [25439] = {
            description = "These are the naga that took our people. I only need one to interrogate, kill " ..
                "the rest.\n\nShow no mercy, <class>, for they would surely show us none.",
            rewardMoney = 78000,
        },
        [25440] = {
            description = "The Fathom-Lord is here, at the far side of the ruins. He's still injured from " ..
                "our last battle.\n\nI'll leave this pleasure to you. Make sure he doesn't get away this " ..
                "time.",
            rewardChoices = {{59753, 1}, {59754, 1}, {59755, 1}},
            rewardMoney = 78000,
        },
        [25441] = {
            description = "I have no fondness for snakes, and even less so down here. Fortunately for us, " ..
                "the watery elements still bend to my will for now.\n\nTake these globes and throw them " ..
                "at the ground to send the nearby water into a vortex, pulling in all the nearby " ..
                "serpents. The naga will most certainly turn the snakes against us, so keep the orbs " ..
                "close at hand.",
            rewardMoney = 78000,
        },
        [25442] = {
            description = "This pearl is unlike anything you've ever seen before. It radiates light, and " ..
                "if you are not mistaken, it radiates powerful magic as well.\n\nEarthmender Duarn back " ..
                "in Silver Tide Hollow will surely be interested in this.",
            rewardChoices = {{59750, 1}, {59751, 1}, {59752, 1}},
            rewardMoney = 78000,
        },
        [25443] = {
            description = "Did my drought work? You spoke with one of them?\n\nThen you know what to do. " ..
                "The name of their elemental master is written on three firestones scattered throughout " ..
                "the Inferno. Examine each of these stones and we will have the name we need.\n\nHurry! " ..
                "Your precious forest burns!",
        },
        [25447] = {
            description = "A severe illness has fallen over the creatures of this forest. While at first " ..
                "I hoped it was part of nature's course, it has refused to pass.\n\nThe forest stags, " ..
                "normally strong and serene, have suffered the worst. Some waste away in weakness; others " ..
                "froth and rage dangerously. If I am to consult the spirits to learn more of this " ..
                "sickness, I will need the stags' antlers.",
            rewardMoney = 4000,
        },
        [25448] = {
            description = "My duty here is to watch over Telaron. Even without his meditation leaving him " ..
                "vulnerable, there's enough threats in this forest to keep both of us on our " ..
                "toes.\n\nThat's why it maddens me so much that I don't have the opportunity to leave " ..
                "camp. More harpies than I've ever seen infest the northwest...foul creatures, spreading " ..
                "their filth across the ancient ruins uncaringly.\n\nThey're a threat to this camp, and " ..
                "have no place in these lands. I'll pay you well if you get rid of them.",
            rewardMoney = 7500,
        },
        [25449] = {
            description = "My philosophy on leatherworking is that the work must be the best quality " ..
                "possible - no compromises. Anyone who says that quality doesn't matter is trying to sell " ..
                "you ocean-front property in Dun Morogh!\n\nIn my latest pursuit of high-quality " ..
                "materials, I have run across thick yeti hides. The Yeti are native to Feralas, with many " ..
                "found in Rage Scar Hold to the northeast. I want some, and I'll give you a choice of one " ..
                "of my leather goods for a stack of ten. If that sounds fair, then we're in business.",
            rewardChoices = {{9630, 1}, {9631, 1}},
            rewardMoney = 4000,
        },
        [25450] = {
            description = "It's funny how things change. The northern yetis used to yield the best hides, " ..
                "but these...there's been a decline in quality, it seems. Maybe something nearby is " ..
                "making them sick.\n\nLuckily, the Feral Scar yetis to the southeast have flourished. I " ..
                "bet their hides are even better than they used to be!\n\nI would reward you handsomely " ..
                "for a stack of ten of their hides; bring them to me here, and we'll finish our business.",
            rewardItems = {{54967, 1}},
            rewardMoney = 4000,
        },
        [25451] = {
            description = "You have found a pristine yeti hide that is exceptionally thick and sturdy - " ..
                "more so than even the ones you've seen from the yeti in Rage Scar.\n\nConsidering that " ..
                "Pratt McGrubben at the Feathermoon Stronghold is in the market for yeti hides, this " ..
                "particular one may be of considerable interest to him.",
            rewardMoney = 8000,
        },
        [25452] = {rewardMoney = 4000},
        [25453] = {rewardMoney = 4000},
        [25454] = {rewardMoney = 8000},
        [25456] = {
            description = "Yeah yeah, I'm sure Felora wants you back. That woman has no respect for " ..
                "innovation. When I told her about the modifications I was making for my Earth Elemental, " ..
                "she nearly threw a fit.\n\nGo tell her everything's all well and dandy. And tell her " ..
                "she's not getting a share of my inevitable fortune either.\n\nShe probably likes " ..
                "sleeping on the rock anyway.",
            rewardMoney = 19500,
        },
        [25458] = {
            description = "The leader of these forces must fall! The naga's offensive will be broken with " ..
                "no one to command them.\n\nI saw the coward retreat into one of the abandoned buildings " ..
                "here. Cut your way through the others and take his head! Lady Shandris will want to see " ..
                "it for herself.",
            rewardMoney = 8000,
        },
        [25459] = {
            description = "If there's one thing I can't stand, it's snakes. Any kind of snake - doesn't " ..
                "matter.\n\nWhile I was out searching for salvage, I saw a nest of sea serpents " ..
                "surrounding the nearby wreckage.\n\nI simply can't relax knowing that those awful " ..
                "creatures could slither up in here at any moment.\n\nPlease, <class>! Do something about " ..
                "them!",
            rewardMoney = 78000,
        },
        [25460] = {
            description = "The effects of the Twilight's Hammer attack can be felt even here, this close " ..
                "to the world tree.\n\nAs our forests burn, the very earth turns against us in a crazed " ..
                "frenzy.\n\nWe can't allow the elementals to go unchecked. Go and help our men take care " ..
                "of them.",
            rewardChoices = {{57281, 1}, {57282, 1}, {57283, 1}},
            rewardMoney = 78000,
        },
        [25462] = {
            description = "Do not fear the bears in this grove, <class> - I have pacified them for the " ..
                "moment.\n\nMy concern at present is for the welfare of the bear cubs. The fires drove " ..
                "the little ones up the trees, where they've gotten stuck. We've got to get those bears " ..
                "safely to the ground!\n\nFlying creatures frighten them, so you'll have to climb the " ..
                "trees yourself. Look for footholds at the trunks. Climb the trees, grab the bear cubs, " ..
                "and toss them - GENTLY! - onto the target here.\n\nNothing can go wrong with this plan.",
            rewardChoices = {{57354, 1}, {57355, 1}, {57356, 1}},
            rewardMoney = 78000,
        },
        [25463] = {
            description = "A Highborne mage named Estulan, estranged from his surviving brothers, has " ..
                "built a tower to the east where he trains young night elves in arcane magic.\n\nWere it " ..
                "not for Lady Tyrande's recent mercy towards his kind, his execution would be my duty " ..
                "under the law. He will be watched closely, but I will not deny aid to my Sentinels " ..
                "simply out of pride.\n\nI've sent Silvia ahead to the Tower of Estulan to begin an " ..
                "offensive against the ogres infesting the nearby forest. Report to her for further " ..
                "orders.",
            rewardMoney = 1000,
        },
        [25464] = {
            description = "Ragnaros is not the only powerful elemental that has re-emerged into our " ..
                "world.\n\nThe dreaded Baron Geddon is leading the onslaught and we must put an end to " ..
                "this rampage.\n\nThe Flameseer's Staff has proven powerful. Perhaps it is powerful " ..
                "enough to weaken him to the point where our arch druids can bind him where he " ..
                "stands.\n\nGo, <name> and be careful. Baron Geddon is a vengeful and treacherous being.",
            rewardChoices = {{57303, 1}, {57304, 1}, {57305, 1}},
            rewardMoney = 156000,
        },
        [25465] = {rewardMoney = 4000},
        [25466] = {rewardMoney = 4000},
        [25467] = {
            description = "You are pleasantly surprised to find that after being mangled and masticated " ..
                "by a sea crab, this map is still quite legible.\n\nIt clearly indicates that a " ..
                "footlocker was buried in the Kelp'thar Forest behind a gigantic mollusk.\n\nA well-drawn " ..
                "sketch on the back of the map shows that the owner, along with his key, was eaten by an " ..
                "overgrown crustacean named Kliklak.",
            rewardItems = {{59798, 1}},
            rewardMoney = 156000,
        },
        [25468] = {
            description = "You wouldn't know it from looking at them, but the lovely faerie dragons that " ..
                "inhabit this forest can be truly fearsome if trained properly. They can do amazing " ..
                "things to magical energy...absorb it, redirect it, even nullify it entirely.\n\nThey're " ..
                "nearly harmless alone, but in large numbers, they can have a stunning effect on a " ..
                "battle. You can find some in the fields to the northwest, but be careful, the Horde is " ..
                "nearby.",
            rewardMoney = 4000,
        },
        [25469] = {
            description = "The mountain giants are our most powerful allies of the forest. They're carved " ..
                "from the land itself.\n\nNot many of our enemies are willing to fight off a walking " ..
                "hillside. It only takes a few of these to turn the tide of a battle completely.\n\nThe " ..
                "mountain giants here have been afflicted by some illness lately, but I've seen a healthy " ..
                "group of them to the southwest.",
            rewardChoices = {{54885, 1}, {54886, 1}, {54887, 1}, {54888, 1}},
            rewardMoney = 12000,
        },
        [25471] = {
            description = "We will need to press deeper into Vashj'ir if we want to uncover what the naga " ..
                "are doing here.\n\nGo to the Lightless Reaches, the giant chasm bordering the Kelp'thar " ..
                "Forest to the west. If you look across it, you should see a cluster of plant-life " ..
                "surrounding the entrance to Damplight Chamber.\n\nOnce you're inside the cave, it's a " ..
                "bit of a ride up until you break surface, but I have friends there that should provide " ..
                "you a warm welcome.",
            rewardMoney = 7800,
        },
        [25472] = {
            description = "A powerful artifact known as the Flameseer's Staff was lost during the initial " ..
                "onslaught by the enemy forces. It was an ancient bone staff that granted its wielder " ..
                "power over the elements of fire.\n\nIts fragments litter the area around us. Find them " ..
                "and bring them to Malfurion. Perhaps the artifact's power will still be of use.",
            rewardMoney = 78000,
        },
        [25473] = {
            description = "Sassy's been riding me to supply some Kaja'cola for the party that's being " ..
                "thrown in your honor later today.\n\nOops, was it supposed to be a surprise? You didn't " ..
                "hear it from me!\n\nAnywho, with production down these last few days, this is all that I " ..
                "managed to get made. Would you take it to her?",
            rewardItems = {{49884, 1}},
            rewardMoney = 3,
        },
        [25477] = {
            description = "Greetings, friend.\n\nIt is good to see that you survived your battle in one " ..
                "piece.\n\nWhile Erunak tries to scry a place of safety for us all, I shall assist you in " ..
                "securing a less strenuous means of transport.\n\nI have prepared this baitstick to use " ..
                "near a sea turtle. It is crude, but it should serve to bring one under your " ..
                "control.\n\nOnce you've become comfortable with the animal, simply guide it back here to " ..
                "me.",
        },
        [25479] = {
            description = "We are staging a relief effort at New Thalanaar for all of Thousand Needles. " ..
                "The goblin, Dyslix Silvergrub, will lend you my hippogryph to safely get you there. " ..
                "Speak with Caryssia Moonhunter when you land.\n\nYou must go quickly if lives are to be " ..
                "saved!",
        },
        [25481] = {
            description = "We are staging a relief effort at New Thalanaar for all of Thousand Needles. " ..
                "Seyala Nightwisp will lend you my hippogryph to safely get you there. Speak with " ..
                "Caryssia Moonhunter when you land.\n\nYou must go quickly if lives are to be saved!",
        },
        [25486] = {
            description = "This is going to take a while, but I'm sure we'll beat them back.\n\nYou're " ..
                "more good to Thousand Needles elsewhere. We have reports that the gnomes and goblins out " ..
                "on the flooded salt flats somehow survived on a giant barge! Rendow is on the dock. " ..
                "She'll get you a boat to go there.\n\nMind helping us out a little on your way to her?",
            rewardMoney = 5000,
        },
        [25487] = {rewardMoney = 5000},
        [25488] = {
            description = "Are you ready to go, <class>? One of the sentinels will take you out to the " ..
                "Mirage Raceway.\n\nIf there's anyone left alive out there, please help them.\n\nGoddess " ..
                "watch over you!",
            rewardChoices = {{63559, 1}, {63560, 1}, {63561, 1}, {63558, 1}},
        },
        [25490] = {
            description = "<name>, these fiends from the Twilight's Hammer are attempting to scourge this " ..
                "whole mountain clean of all life. Even now they trail behind this inferno, leaving death " ..
                "and ash in their wake.\n\nArch Druid Hamuul Runetotem is behind the fires, trying to " ..
                "salvage the wilderness before it's blotted permanently from the map. Travel southeast, " ..
                "through The Inferno and down the road beyond. Find and aid the Arch Druid.\n\nOn your " ..
                "way there, clear the roads by killing any Charbringers that you find.",
            rewardMoney = 78000,
        },
        [25491] = {
            description = "This land has been scourged by fire, but it may yet renew itself.\n\nSome " ..
                "seeds deep in the soil may have withstood the scorching heat here in The Flamewake. " ..
                "These durable plants are the key to this forest's regrowth. Please, collect some of " ..
                "these seedlings for me.",
            rewardMoney = 78000,
        },
        [25492] = {
            description = "In their efforts to decimate Hyjal, Twilight's Hammer has elementals scouring " ..
                "the earth in the wake of the fire.\n\nThey're pulverizing the soil, rooting around in " ..
                "the ash, digging up any scrap of plantlife that survived and destroying it. It's like " ..
                "they're paving the way for... I don't even want to imagine.\n\nStop them before Hyjal is " ..
                "devoid of life. Kill the lava surgers!",
            rewardMoney = 78000,
        },
        [25493] = {
            description = "I was stunned to discover that Twilight's Hammer had located - and imprisoned " ..
                "- the great turtle ancient Tortolla. As we speak he is chained above the murky waters of " ..
                "the Ashen Lake.\n\nFreeing Tortolla from his bonds will not be easy. But we will take it " ..
                "one step at a time.\n\nHead into the Flamewake and collect for me heaps of core hound " ..
                "entrails. I will explain why later.\n\nAnd beware of Nemesis the Usurper while you are " ..
                "there! His time will come, but we are not yet prepared.",
            rewardChoices = {{57351, 1}, {57352, 1}, {57353, 1}},
            rewardMoney = 78000,
        },
        [25494] = {
            description = "This little guy is a true menace now, isn't he?\n\nWe're going to have to give " ..
                "him a nice spiked collar if he's going to be a fighting pup.\n\nThe basilisk matriarch " ..
                "has made her lair off of the road to Winterspring. Bring me her spiked hide and we'll " ..
                "fashion a collar for our little killer here.",
            rewardMoney = 78000,
        },
        [25496] = {
            description = "I don't know if you've picked up on this, but there's a bit of a rivalry " ..
                "between the ogre members of the Twilight's Hammer and the rest of us.\n\nFor me... it's " ..
                "personal.\n\nThis one ogre called Gromm'ko has a pet raptor named \"Butcher.\" He's " ..
                "taken out the last three of my corehound pups.\n\nI think this last one will fare " ..
                "differently. He's got a real killer's instinct.\n\nGo to the Seat of the Chosen and " ..
                "challenge Gromm'ko to a match between our two beasts. Humiliate him for me, <name>damus.",
            rewardMoney = 156000,
        },
        [25499] = {
            description = "Before we go any further, we're going to have to get you into " ..
                "shape.\n\nDevotion to the Old Gods is not going to save you when some emerald dragon " ..
                "comes chasing after you. You need to be fleet of foot, if you catch my drift.\n\nEnough " ..
                "said. We'll summon your trainer... your job is to run away from him without leaving this " ..
                "camp.\n\nGo!",
            rewardMoney = 78000,
        },
        [25502] = {
            description = "The Arch Druid has tasked me with setting up a series of flamewards around the " ..
                "perimeter of the area. Once these are active, we can prevent further attacks from the " ..
                "fire elementals that left this valley in ruins.\n\nThese will also protect and nourish " ..
                "the soil for whatever Hamuul has planned.\n\nIt's time to begin. Find one of the five " ..
                "flamewards I've marked on your map, activate it, and defend it from counterattack until " ..
                "its magic kicks in. It won't take more than a minute.",
            rewardChoices = {{57348, 1}, {57349, 1}, {57350, 1}},
            rewardMoney = 78000,
        },
        [25503] = {
            description = "<A torn page precedes the latest entry, which reads:>\n\nOur self-proclaimed " ..
                "king will stop at nothing to acquire my family fortune. He has threatened and harassed " ..
                "me to no end.\n\nI can't take it anymore!\n\nI've buried the treasure and fed the map to " ..
                "Blackfin.\n\nThat should keep my cousin's grubby little mitts off of our precious " ..
                "heirlooms!",
            rewardChoices = {{59779, 1}, {59780, 1}, {59781, 1}},
        },
        [25504] = {
            description = "Hello there. Pleased to meet you! I'm Fizzle Brassbolts. Welcome to my " ..
                "Speedbarge.\n\nI share your concerns about helping all of Thousand Needles. It's my firm " ..
                "belief that the Speedbarge is the best hope for the entire region.\n\nPerhaps you could " ..
                "help us out a little bit here? I'll make sure that you're equipped with what you need to " ..
                "tackle everything else.\n\nAs to that, if you could just run this list of parts over to " ..
                "Jinky Twizzlefixxit in her shop, you'll be well on your way.",
        },
        [25507] = {
            description = "Fresh and stinking, these innards will prove to be irresistible for Nemesis, " ..
                "the befouled turtle god created by Twilight's Hammer.\n\nNemesis must eventually be " ..
                "destroyed, but first, we must collect a piece of his fiery armored shell. With it, we'll " ..
                "be able to work some magic to free the true ancient.\n\nGo into the Flamewake and drop " ..
                "this bait near Nemesis. It will distract him. Pry off a piece of his shell... then run, " ..
                "if you hope to survive the encounter.",
            rewardMoney = 78000,
        },
        [25509] = {
            description = "Training to join our ranks is not pleasant. Why should it be?\n\nThe path to " ..
                "serve the Old Gods is long, painful, and soul-harrowing. Consider this your first " ..
                "step.\n\nTake this pick and break the lodestone deposits found in the gorge.\n\nNo, we " ..
                "don't need any of the ore. This is purely for your benefit.",
            rewardMoney = 78000,
        },
        [25510] = {
            description = "<The Arch Druid fills the shell fragment with water, which boils instantly. He " ..
                "adds a bundle of herbs and closes his eyes in a silent prayer.>\n\n<name>, Tortolla the " ..
                "turtle ancient is ageless, a part of this world since the time of the titans. He speaks " ..
                "a language older than our understanding.\n\nDrink this and find a place of calm within " ..
                "yourself. You will be able to understand the language of Tortolla. Go to him now, in the " ..
                "Ashen Lake. Earn the ancient's trust. The fate of Hyjal hinges on this.",
        },
        [25513] = {
            description = "It seems we have a special request! I have here a note from one Kelsey " ..
                "Steelspark, requesting to enter the cage and settle a dispute.\n\nShe's asked for you to " ..
                "be her partner, <name>. A fan of your previous victories? Or perhaps you're acquainted " ..
                "outside the ring?\n\nI wouldn't back down now if I were you. This is the grand finale...",
            rewardChoices = {{56893, 1}, {56891, 1}, {56892, 1}},
            rewardMoney = 21000,
        },
        [25514] = {
            description = "From the deep... A realm of darkness and fire. Grasping in my slumber.\n\nI am " ..
                "ensnared, <race>.\n\nShadows lurk in the rods of fire beside me. Slay them. That I may " ..
                "be free again.",
        },
        [25515] = {
            description = "<Jinky rolls up her sleeves and slicks back her hair while eyeing you up and " ..
                "down.>\n\nFine, if Fizzle wants you to have your own boat, the first thing we'll need is " ..
                "parts. Guess who gets to go get them?\n\n<Jinky smiles as she points downward and then " ..
                "grabs you a spare diving helm and flippers.>\n\nThat's right, <brother/sister>. You get " ..
                "to go down into the deeps and salvage what rocket car parts you can find at the Raceway " ..
                "Ruins.",
            rewardChoices = {{63542, 1}, {63543, 1}, {63544, 1}, {63545, 1}},
            rewardMoney = 5000,
        },
        [25516] = {rewardMoney = 5000},
        [25517] = {
            description = "Those no-good, smelly, green in the gills goblins have got it coming!\n\nI " ..
                "want you to go into the Speedbarge Bar, order a bottle of grog, and hit one over the " ..
                "head with it!\n\nShow them that we're not going to take any more of their insolence, " ..
                "<name>!",
            rewardMoney = 5000,
        },
        [25518] = {rewardMoney = 5000},
        [25519] = {
            description = "My children. They lie below. In silt and sand.\n\nThe others corrupt them. " ..
                "Darken them within their shells.\n\nSlay the others. Destroy the corruptors. Save them...",
            rewardChoices = {{57277, 1}, {57278, 1}, {57279, 1}, {57280, 1}},
            rewardMoney = 78000,
        },
        [25520] = {
            description = "I slumbered in the healing silt of Hyjal. I slept until the world broke open. " ..
                "When the others came, I was not ready.\n\nI am ready now, <race>.\n\nMy children and I. " ..
                "Slow to anger. But our wrath is final.\n\nTell those who sent you that we are prepared " ..
                "for war.\n\nThe others will be cast from the mountain.",
            rewardMoney = 156000,
        },
        [25521] = {rewardMoney = 6500},
        [25522] = {rewardMoney = 13000},
        [25523] = {
            description = "<name>, our enemy is using this grotto in the Firelands to prepare an " ..
                "invasion. We're going to hit them hard right where they live.\n\nBut first, you'll need " ..
                "to get your wings. Flight in the Firelands does not work as it does in the outside " ..
                "world. Something about the dense, superheated air. You'll need some practice!\n\nGet a " ..
                "Twilight Firelance from the rack behind me, equip it, then mount one of Aviana's " ..
                "Guardians. Practice flying - flap your wings! Visit a flag placed on the ledge below and " ..
                "return.",
            rewardMoney = 59000,
        },
        [25524] = {
            description = "Hello? Hello! HELP!\n\nI'm almost out of air! You have to get me out of " ..
                "here!\n\n<The voice inside gags.>\n\nOne of those Southsea treasure hunters has got to " ..
                "have a crowbar!",
            rewardMoney = 5000,
        },
        [25525] = {
            description = "Here they come, <name>! The Twilight Knight Riders, astride black buzzards " ..
                "birthed in the scorching sulfurous breeding pools of the Firelands. The only way to " ..
                "defeat them is from the sky!\n\nTake wing once more, <class>, and slay them.\n\nRun into " ..
                "enemy riders with your lance to destroy them.\n\nGo forth. Fly, fool. Fly!",
            rewardMoney = 78000,
        },
        [25526] = {rewardMoney = 5000},
        [25531] = {
            description = "I thank you for freeing me. Let us take advantage of the distraction you've " ..
                "created and get out of here.\n\nWe must hurry before the cultists catch on.\n\nMeet me " ..
                "again when we've left this place.",
        },
        [25532] = {
            description = "I don't know if you've noticed, but the cannonballs are hitting us. I'd say " ..
                "the Southsea pirates are getting more accurate... the ship is on fire!\n\nYou've got a " ..
                "river boat now. Go talk to Mazzer Stripscrew.\n\nPut those fires out!",
            rewardMoney = 5000,
        },
        [25533] = {rewardMoney = 5000},
        [25534] = {rewardMoney = 6500},
        [25535] = {
            description = "Poor things. They're starving.\n\nWe've many matters to attend to, not the " ..
                "least of them the naga, but first we need to get some food in these bellies. I'm not " ..
                "sure what the naga fed them up in that shell, if anything, but they're definitely worse " ..
                "for the wear.\n\nQuite a few of the survivors have made their way into Glimmerdeep " ..
                "Gorge, to the northwest. Go join them and help out. With a bit of clam meat, we can get " ..
                "these survivors back on their feet.",
            rewardMoney = 19500,
        },
        [25536] = {
            description = "Many of the survivors made their way down into Glimmerdeep Gorge to help with " ..
                "the clam diving. We've been receiving reports back of deliberate attacks from some kind " ..
                "of murlocs down there.\n\nThe Admiral has to stay here as more men report in from the " ..
                "shell, so I'm having trouble convincing him to get any significant muscle to help the " ..
                "divers. If you'd be up for it, I'm certain they could use your help.\n\nCome back and " ..
                "let me know if you get the situation under control.",
            rewardMoney = 78000,
        },
        [25537] = {
            description = "I have an idea. A brilliant idea! Those clown-looking fish have developed a " ..
                "symbiotic defensive relationship with the anemones. Having dismissed anemone disguise " ..
                "plausibilities, I've uncovered the chemical attractor that lures the fish.\n\nI have a " ..
                "gyrocoptic thermascrub extractor that I've brought down to take samples. Use it to " ..
                "extract the chemical attractor from several of the anemones, then bring the samples back " ..
                "to me for rapid synthesis and deployment.\n\nGo with haste! Brilliance is waiting!",
            rewardMoney = 78000,
        },
        [25538] = {
            description = "Marvelous creation if I do say so myself. Ready for deployment.\n\nSimply " ..
                "spray the clam divers with a bit of the chemical and they shall soon be accompanied by a " ..
                "protective aquatic companion. You can even spray yourself to similar effect if you so " ..
                "desire.\n\nSpeaking of desire, I would highly recommend that you moderate deployment of " ..
                "the chemical attractor to minimal applications. Large doses could result in undesirable " ..
                "effects...\n\nUndesirable for you anyway. Likely very desirable for the fish.\n\nAway!",
            rewardChoices = {{59732, 1}, {59733, 1}, {59734, 1}},
            rewardMoney = 78000,
        },
        [25539] = {
            description = "Here to help with the clam diving?\n\nGet to it then. There are clams about " ..
                "everywhere just waiting to be dived.",
            rewardMoney = 78000,
        },
        [25540] = {
            description = "We have quite a stock of gathered clams to tote back to the cave, I was simply " ..
                "awaiting someone to do the toting. You've proven dangerous enough to be the sort.\n\nI " ..
                "highly expect that such a fine meal shall not pass uncontested by predators on the way " ..
                "back, so I'd make your trip as swift as possible.\n\nThank you for your help, friend. " ..
                "It's been a pleasure.",
            rewardChoices = {{59726, 1}, {59727, 1}, {59728, 1}},
            rewardMoney = 78000,
        },
        [25541] = {rewardMoney = 6500},
        [25542] = {
            description = "The fires are dealt with, but there are still Southsea pirates getting ready " ..
                "to board the Speedbarge.\n\nTime to switch to the other side cannon and sink them before " ..
                "it's too late!",
            rewardChoices = {{63550, 1}, {63551, 1}, {63552, 1}, {63553, 1}},
            rewardItems = {{55121, 1}},
            rewardMoney = 5000,
        },
        [25543] = {rewardMoney = 5000},
        [25544] = {
            description = "You've stirred up the hornets, <name>. The ceiling is coming down on us! And " ..
                "their strongest fighters are taking wing on creatures warped and twisted by this world " ..
                "of flame.\n\nGet back out there and take them down! Watch out for flaming boulders.",
            rewardMoney = 78000,
        },
        [25545] = {
            description = "As we struggled not to drown, my men and I were forced to abandon our weapons " ..
                "and much of our armor.\n\nErunak says to expect a major attack from the naga soon and " ..
                "I'm inclined to believe him.\n\nIf we're going to stand a chance, we'll need your help " ..
                "to recover our lost armaments. They should be lying on the sea floor near our " ..
                "shipwrecks.\n\nHurry, <race>, we're defenseless here.",
            rewardChoices = {{59808, 1}, {59809, 1}, {59810, 1}},
            rewardMoney = 78000,
        },
        [25546] = {
            description = "I'll need your help if I am to get these men ready for battle.\n\nAny decent " ..
                "leader knows that his men travel and fight on their stomachs. No food, no " ..
                "victory.\n\nThese soldiers are weak from their recent ordeal. They'll need sustenance if " ..
                "they're to put up any kind of fight when the need arises.\n\nSpeaking of traveling on " ..
                "stomachs, I've seen several crabs out there on the sea floor....",
            rewardMoney = 78000,
        },
        [25547] = {
            description = "We're as ready as we'll ever be. No sense waiting around for the naga to find " ..
                "us.\n\nI'll address the men, then we'll meet the enemy on our own terms and let fate " ..
                "decide the outcome.",
            rewardMoney = 78000,
        },
        [25548] = {
            description = "I've been charged with leading our military operations against the enemy. A " ..
                "humbling task when you consider there are demigods walking among us.\n\nI'm going to " ..
                "have you carry out a series of hit-and-run attacks behind enemy lines. It will be " ..
                "important that you keep the enemy off guard and weaken their numbers ahead of our main " ..
                "force's attack.\n\nYour first target will be the Ascendant's Rise, where the most highly " ..
                "trained Twilight's Hammer devotees have achieved a partial elemental state.",
            rewardChoices = {{57287, 1}, {57288, 1}, {57289, 1}},
            rewardMoney = 78000,
        },
        [25549] = {
            description = "The mad prophets of the Twilight's Hammer congregate in the area just north of " ..
                "the Ascendant's Rise.\n\nIt is said that their dark visions are granted to them directly " ..
                "by the Old Gods. Whether or not that is true, they provide tremendous spiritual guidance " ..
                "to the cult. Attacking the Sanctum of the Prophets will deal a devastating blow to the " ..
                "enemy's morale and if we're lucky you might run into one of the Firelord's own " ..
                "emissaries while you're there.",
            rewardMoney = 78000,
        },
        [25550] = {
            description = "The magma giants who serve Ragnaros are kept in line by their king's " ..
                "heavy-handed rule. Were we to take care of him, the rest will surely fall into " ..
                "disarray.\n\nWithout the giants, the fight on the ground will get a lot more even. " ..
                "Perhaps even tilt to our favor.\n\nBut felling the magma monarch will be no easy task. " ..
                "Use these drums to enlist the help of the great Tortolla who is capable of holding off " ..
                "King Moltron for an eternity. But holding him off won't be enough -- and that's where " ..
                "you come in.",
            rewardMoney = 164000,
        },
        [25551] = {
            description = "With his gatekeeper gone, you've given the Guardians of Hyjal access to " ..
                "Sulfuron Spire.\n\nRagnaros will have no choice but to defend the main entryway to the " ..
                "Firelands himself.\n\nGo through the Twilight's Hammer portal at the Sanctum of the " ..
                "Prophets and meet me inside. Malfurion and Hamuul will also aid us while the others " ..
                "continue to fight the enemy outside.",
            rewardChoices = {{57274, 1}, {57275, 1}, {57276, 1}},
            rewardMoney = 82000,
        },
        [25552] = {
            description = "This egg you recovered is an alarming sign, <name>. The Twilight dragons are " ..
                "usually raised from stolen eggs from other dragonflights, which are then modified " ..
                "through dark magic.\n\nThis \"natural\" egg is evidence that one of their matriarchs has " ..
                "become a viable broodmother. We must destroy her before her brood spreads.\n\nGo to the " ..
                "Ascendant's Rise where they claim these aberrations are kept and slay one of the " ..
                "juvenile drakes. We will use its skull to lure out its mother.",
            rewardMoney = 82000,
        },
        [25553] = {
            description = "We've located the matriarch's feeding grounds south of the Ascendant's " ..
                "Rise.\n\nShe will be extremely angry to have lost one of her drakes. Place the skull " ..
                "there near the carcasses she devours. If she's anywhere in the vicinity, she will come " ..
                "out and attempt to exact revenge.\n\nWe will have a surprise waiting for her.",
            rewardChoices = {{57300, 1}, {57301, 1}, {57302, 1}},
            rewardMoney = 164000,
        },
        [25554] = {
            description = "If we are to banish Ragnaros back into the Firelands, we will need to gain " ..
                "access to Sulfuron Spire.\n\nOnly the most trusted members of the Twilight's Hammer will " ..
                "have been entrusted with such valuable information.\n\nGo search the Ascendant's Rise " ..
                "for any written tomes you might find. Foul as they are, we cannot waste the opportunity " ..
                "to learn about our enemy's weaknesses.",
            rewardMoney = 78000,
        },
        [25555] = {
            description = "According to these tomes, one of Ragnaros' most powerful lieutenants serves as " ..
                "the sole gatekeeper to Sulfuron Spire.\n\nYou won't be able to defeat him " ..
                "alone.\n\nSound this horn when you engage in combat with Azralon and any of our forces " ..
                "in the vicinity will come to your aid.\n\nYou must hurry, <name>. It won't be long " ..
                "before the Firelord realizes what we're up to.",
            rewardChoices = {{57298, 1}, {57299, 1}},
            rewardMoney = 164000,
        },
        [25558] = {
            description = "This is it.\n\nThis is where we make our stand.\n\nWe must defend this ship to " ..
                "our last breath, and make these cretins think twice before approaching it again!\n\nMay " ..
                "our blades strike fear in their hearts!",
            rewardChoices = {{59802, 1}, {59803, 1}, {59804, 1}},
            rewardMoney = 78000,
        },
        [25559] = {
            description = "We're not the only ones interested in these ruins, it seem. Of all things, " ..
                "we've got blood elves after our dig sites.\n\nI'd expect them to wilt in the heat " ..
                "without all their fancy fountains and cushy pillows, but they're surprisingly scrappy, " ..
                "and they're trying to drive us out of the Southmoon Ruins by force.\n\nIt's time to " ..
                "crack a few heads. Head over there and teach those elves not to mess with us!",
            rewardMoney = 7000,
        },
        [25560] = {
            description = "Without any defenders, the Firelands eggs are vulnerable.\n\nTake wing once " ..
                "more and smash those eggs! Simply rush over them to crush them. Search all the nooks, " ..
                "crannies, and side-caves. Hurry!",
            rewardChoices = {{65662, 1}, {65661, 1}},
            rewardMoney = 78000,
        },
        [25561] = {
            description = "The fires may be dealt with, but those Southsea pirates are still getting " ..
                "ready to board the Speedbarge!\n\n<name>, you need to go back to Mazzer Stripscrew and " ..
                "get on your boat. Use the cannon to sink them before it's too late!",
            rewardChoices = {{63550, 1}, {63551, 1}, {63552, 1}, {63553, 1}},
            rewardItems = {{55121, 1}},
            rewardMoney = 5000,
        },
        [25562] = {rewardMoney = 5000},
        [25564] = {
            description = "You've done us a great service, <class>, so I'm going to let you in on a " ..
                "little secret. The men you've saved today aren't your everyday Stormwind troops.\n\nWe " ..
                "belong to a special detachment of elite soldiers sent here not only to contend with the " ..
                "Horde, but to investigate the massive geological disturbances originating from the " ..
                "nearby sea floor.\n\nI tell you this because our top secret equipment lies in the bottom " ..
                "of some of our wrecked ships here.\n\nThat gear must be retrieved!",
            rewardMoney = 78000,
        },
        [25565] = {
            description = "We've had our first big find in years here at the Southmoon ruins. My lads " ..
                "have dug up stone tablets, engraved with ancient writings.\n\nThe glyphs on the tablets " ..
                "are like nothing we've ever seen, but I have a hunch we can connect them with titanic " ..
                "scripts found at other digsites. Imagine what a breakthrough like that could mean!\n\nI " ..
                "need you to go to the Southmoon ruins and help us collect the tablets; the other lads " ..
                "can't leave, lest the blood elves take our site!",
            rewardMoney = 7000,
        },
        [25566] = {
            description = "I studied these ruins for years trying to find a way in. We even took a good " ..
                "chunk out of the gate, only to find impenetrable walls beneath. Now the cataclysm may've " ..
                "wrecked everything in there something fierce, but it's done what we couldn't and opened " ..
                "a way in!\n\nI'd like you to have the honor, <lad/lass>. Head on in there and see if " ..
                "anything's been left uncracked. Be careful though... there's no telling what, or who, " ..
                "might be stirring in there.",
            rewardMoney = 7000,
        },
        [25574] = {
            description = "We've identified the general direction where the infiltrators have been coming " ..
                "from, thanks to your work.\n\nNow we just need to shut down their camp and put an end to " ..
                "their operations this side of Nordrassil.\n\nTake this horn. It will signal one of our " ..
                "emerald drakes to swoop down and give these Twilight cultists a taste of the flames they " ..
                "so madly worship.",
            rewardChoices = {{57294, 1}, {57295, 1}, {57296, 1}},
            rewardMoney = 78000,
        },
        [25575] = {
            description = "The weapons the Twilight's Hammer uses against us are crafted by Forgemaster " ..
                "Pyrenduis within these very halls. The metal slices through armor like cheese in the " ..
                "hands of its wielder. Yet, when captured, the steel turns brittle and shatters.\n\nSo be " ..
                "it, <name>. I'd rather see those cursed arms smashed than delivered to our " ..
                "enemy.\n\nSeek out the crates of Twilight arms in these caverns and smash them to pieces.",
            rewardMoney = 78000,
        },
        [25576] = {
            description = "Here we are deep within the realm of the fire god and what do we find? The " ..
                "little puppets of Ragnaros, scurrying around to do his bidding.\n\nThese Dark Iron " ..
                "laborers are finishing and packaging the weapons Twilight's Hammer hopes to use in their " ..
                "conquest of Hyjal. I don't care if they're here of their own free will or if they've " ..
                "been brainwashed or kidnapped... They're a foe of our beloved wolf ancient and they " ..
                "should pay the ultimate price.",
            rewardMoney = 78000,
        },
        [25577] = {
            description = "These searing guardians are murderous! We destroy them, and within minutes, " ..
                "they reignite from the ashes.\n\nI think there's a way to destroy them permanently, but " ..
                "we'll need someone who can fight through the front ranks.\n\n<name>, kill the searing " ..
                "guardians and take their smoldering cores to the nearby anvils. Smash them on the " ..
                "Twilight Anvils, and destroy them for good!",
            rewardChoices = {{57357, 1}, {57358, 1}, {57359, 1}},
            rewardMoney = 78000,
        },
        [25578] = {
            description = "I will take Fandral to Moonglade swiftly. I hope to return soon so I may " ..
                "continue to aid in the battle.\n\nIn the meantime, report back to Ysera and inform her " ..
                "of these recent developments.",
            rewardMoney = 78000,
        },
        [25579] = {
            description = "Our escape from the shell can't have gone unnoticed, but either the naga at " ..
                "these ruins weren't informed or they don't consider us a threat. I don't intend to take " ..
                "the opportunity for granted - we strike now.\n\nI need you to slip into the lower level " ..
                "of the ruins to our west and take out as many of their patrols as you can. We cannot " ..
                "risk any of those patrols finding out about our occupation of this cave - make sure none " ..
                "escape.",
            rewardMoney = 78000,
        },
        [25580] = {
            description = "I've taken the liberty of performing some preliminary scouting. The naga may " ..
                "not be aware of our position, but they are not entirely unprepared for " ..
                "intruders.\n\nBeyond their patrols, they have set up magical sentry devices that will " ..
                "warn them of unwelcome guests. Fortunately, they seem to have sacrificed quality for " ..
                "quantity, and there is definitely a window in which the devices can be destroyed before " ..
                "their alarms are answered.\n\nI trust that you can see to this before our other soldiers " ..
                "arrive.",
            rewardChoices = {{59720, 1}, {59721, 1}, {59722, 1}},
            rewardMoney = 78000,
        },
        [25581] = {
            description = "Look--<name> is it?--I need your help. I know most everyone in this cave " ..
                "thinks that we're not in a position to be worrying about anything but our own hides " ..
                "right now, but I cannot dismiss my ancestors so readily.\n\nAll I want from you, while " ..
                "you're out in the city proper, is to keep a watchful eye out for objects of " ..
                "significance. The statues interest me especially.",
            rewardChoices = {{59714, 1}, {59715, 1}, {59716, 1}},
            rewardMoney = 78000,
        },
        [25582] = {
            description = "This cave is our only refuge. There's no help on the way. Whatever happens, " ..
                "this cave must remain safe or we are all sure to die down here.\n\nWe need a forward " ..
                "post to launch our attacks from. Something defensible.\n\nIn the eastern portion of the " ..
                "ruins on the lowest level, scout the north end of the gardens, the passage leading under " ..
                "the main structure just west of the gardens, and the cluster of buildings at the " ..
                "southeast corner of the ruins, under the bridges.\n\nBring me back any information you " ..
                "can.",
            rewardMoney = 78000,
        },
        [25583] = {
            description = "All around you lie the remnants of a fierce battle. The naga skeletons are no " ..
                "surprise, but the weapons and remains of their apparent opponents are somewhat more " ..
                "unexpected.\n\nAmidst the bones, you spot a strangely prominent piece of metal jutting " ..
                "out from one of the skulls. It's difficult to tell what sort of weapon it might have " ..
                "once been part of, but it stands out sufficiently to prompt you to retrieve it as " ..
                "evidence.\n\nSurely someone back at the cave would be interested in this revelation.",
            rewardMoney = 78000,
        },
        [25584] = {
            description = "It'll be crucial to reclaim each of the ancients' shrines, <name>.\n\nFollow " ..
                "the road west of the Verdant Thicket, into Wolf's Run.\n\nWe have operatives stationed " ..
                "there. Aid them in any way that you can and work your way to the first shrine.\n\nThe " ..
                "wolf god was known to the elves as Goldrinn and to the orcs as Lo'Gosh. He will be a " ..
                "fierce ally in our fight against the enemy.",
            rewardMoney = 39000,
        },
        [25585] = {
            description = "Now it's time to do something about those darn cannons up on the bluffs to the " ..
                "east!\n\nIf you'd be so kind, hop into your boat and cruise on over to the Southsea " ..
                "Holdfast. Up top you'll see a bunch of cannons firing down on us.\n\nThose pirates don't " ..
                "know squat about engineering. It shouldn't be too difficult for you to clog 'em up and " ..
                "make them explode.",
            rewardMoney = 5500,
        },
        [25586] = {rewardMoney = 5500},
        [25587] = {
            description = "Please, <race>! You must help me!\n\nI've barely managed to survive, what with " ..
                "naga, sharks, and that horrible monster that attacked our ship.\n\nI can see a cave that " ..
                "might be safe, but I don't dare try to make it unless I know there's air inside.\n\nCan " ..
                "you make sure it's ok?",
            rewardMoney = 78000,
        },
        [25588] = {
            description = "It's time for a little payback, I think. Can you blame me? After they locked " ..
                "me down in that outhouse and left me to drown?!\n\nI'll make it worth your while if you " ..
                "head up to the Southsea Holdfast on the eastern bluffs and exact my revenge.",
            rewardChoices = {{63574, 1}, {63575, 1}, {63576, 1}, {63577, 1}},
            rewardMoney = 5500,
        },
        [25589] = {rewardMoney = 5500},
        [25590] = {
            description = "Hey, <name>, you haven't seen my other brother, Wizzle, have you?\n\nI just " ..
                "know that the pirates captured him! He said that he was going to try to sell them some " ..
                "engineering stuff, or something.\n\nWould you please look for him up at the Southsea " ..
                "Holdfast to the east? I'll bet that no-good goblin he's always traveling with, Synge, " ..
                "got him into trouble!",
            rewardMoney = 5500,
        },
        [25591] = {
            description = "It seems we have a special request! I have here a note from one Megs " ..
                "Dreadshredder, requesting to enter the cage and settle a dispute.\n\nShe's asked for you " ..
                "to be her partner, <name>. A fan of your previous victories? Or perhaps you're " ..
                "acquainted outside the ring?\n\nI wouldn't back down now if I were you. This is the " ..
                "grand finale...",
            rewardChoices = {{56896, 1}, {56894, 1}, {56895, 1}},
            rewardMoney = 21000,
        },
        [25592] = {
            description = "I've been able to help some of the survivors make it to the cave, but it's " ..
                "starting to get hairy out there. If we didn't have enough problems, some glowing murlocs " ..
                "started creeping up from the nearby crevice to attack the stranded survivors.\n\nThe men " ..
                "up there are warriors--they won't go down without a fight--but they're much worse for " ..
                "the wear after that damned shell.\n\nIf you have any breath left in your lungs, get up " ..
                "there and take out some of those murlocs. Hellscream's eyes are upon you.",
            rewardMoney = 78000,
        },
        [25593] = {
            description = "A lot of the men haven't made it to the cave yet. It's a safe bet that they're " ..
                "stranded at the vents on the ridge above us.\n\nWe found some spiralung shells on the " ..
                "way here. They don't produce much air, but it was enough for us to make the cave.\n\nI " ..
                "need to stay here to count heads and get them back on their feet as they arrive. Do me a " ..
                "favor - go collect those spiralung shells, get them to any of my men that are still up " ..
                "on the ridge, and give them a swift kick in the arse so that they get moving.",
            rewardMoney = 78000,
        },
        [25594] = {
            description = "It was that darn crab!\n\nHere I thought that all the exercise from walking " ..
                "here was making me super buff! My pack just kept getting lighter and lighter. But no! " ..
                "That crab snipped a hole in my bag and all my parts were falling out the whole way " ..
                "here.\n\nPlease, help a good lookin' goblin out, will ya? Go back and help me pick up " ..
                "all of my stray parts. I'm sure those conniving vicious little crabs ran off with some " ..
                "of them too.",
            rewardChoices = {{59729, 1}, {59730, 1}, {59731, 1}},
            rewardMoney = 78000,
        },
        [25595] = {
            description = "Were they trying to starve us all to death?! Not giving prisoners food is just " ..
                "despicable.\n\nWe need to get these soldiers fed. The best prospect I spotted on the way " ..
                "here were those giant grouper. Several of those and we shouldn't want for meat for a " ..
                "while.\n\nIf you can bring me back some, I'll see to it that it gets cooked and passed " ..
                "out fairly.",
            rewardChoices = {{59723, 1}, {59724, 1}, {59725, 1}},
            rewardMoney = 78000,
        },
        [25596] = {rewardMoney = 5500},
        [25597] = {
            description = "Only once has there been a leader capable of commanding demigods and mortals " ..
                "alike.\n\nHis name was Jarod Shadowsong and his ability to lead in battle was such that " ..
                "Cenarius and the other ancients placed themselves under his command.\n\nHe disappeared " ..
                "for years and his whereabouts were unknown. Until now.\n\nHe is being held captive " ..
                "inside a Twilight camp in Darkwhisper Gorge.\n\nYour job is to infiltrate their ranks " ..
                "and free Jarod. Speak to the one known as Ortell at Darkwhisper Pass to the southeast.",
            rewardMoney = 59000,
        },
        [25598] = {
            description = "Now that you've brought me to safety, I'm afraid I must impose upon your " ..
                "kindness just a bit further.\n\nThe captain of our ship, Samir, is still out there. Mack " ..
                "too. I'm sure they made it to the sea floor but beyond that I didn't see what became of " ..
                "them.\n\nI simply couldn't get by in a place like this without their help.\n\nI lost " ..
                "sight of them in a clump of kelp west of where you found me.\n\nPlease hurry! They " ..
                "couldn't have gotten far...",
            rewardMoney = 78000,
        },
        [25599] = {
            description = "Twilight's Hammer is using these corridors, and others like them, to move " ..
                "supplies from the elemental planes up into Azeroth. In order to seal these passages off, " ..
                "we're going to need to know how they're constructed.\n\nFind for me the Tome of " ..
                "Openings, used by the elementals to open gates between the planes.\n\nCindermaul the " ..
                "Portal Master should have one. You'll have to kill him. Careful! He's probably got some " ..
                "tricks up his sleeve...",
            rewardMoney = 78000,
        },
        [25600] = {
            description = "A terrible evil squats in the heart of this cavern, <name>. Forgemaster " ..
                "Pyrendius has personally crafted many of the cursed weapons that Twilight's Hammer is " ..
                "using in their conquest of the realms above.\n\nBefore we leave these lands of flame... " ..
                "Pyrendius must die.\n\nHe will not go down easy. But, if I'm reading the tome correctly, " ..
                "we can briefly open up small gateways to the Abyssal Maw, the realm of water. Lure " ..
                "Pyrendius onto a portal rune and activate it to weaken him!",
            rewardChoices = {{57268, 1}, {57269, 1}, {57270, 1}},
            rewardMoney = 156000,
        },
        [25601] = {
            description = "That settles it, \"<name>damus!\" You are head of your class!\n\nYou will get " ..
                "a chance to address a crowd of the most fanatical, bloodthirsty and certifiably insane " ..
                "people on this planet.\n\nGo report to your instructor for the details, but remember: " ..
                "your goal is to exploit the animosity between the ogres at the Seat of the Chosen and " ..
                "the other, less privileged races.\n\nIf all goes well, we will smuggle Jarod out of here " ..
                "during the ensuing riot.",
            rewardMoney = 39000,
        },
        [25602] = {
            description = "Mack's still out of it, and I fear we may lose him if I can't get this fire " ..
                "started. With the wood being soaked, we'll need something special to get it " ..
                "going.\n\nThere's an abandoned camp nearby with a barrel of explosives in it. There's no " ..
                "way I can recover it on my own.\n\nWould you mind hauling it back for us? For Mack?",
            rewardMoney = 78000,
        },
        [25607] = {
            description = "Zese goblinz dizgust me. Zer filzy goblin technology iz inferior to anyzing " ..
                "gnomish, yet...\n\n<Professor Xakxak sighs.>\n\nIt iz ze last piece of ze puzzle! Wizout " ..
                "ze filzy goblin technology ze gnomecorder cannot be built!\n\nVenture eazt into ze " ..
                "\"Skunkworks\" and take from zem zer filzy goblin junk! You vill most likely find zem on " ..
                "goblin technicians.\n\n<Professor Xakxak laughs mockingly.>\n\nGoblin technician? Vut iz " ..
                "zat anyvay?\n\n<Professor Xakxak shrugs.>\n\nZome kind of oxymoron?",
            rewardMoney = 1800,
        },
        [25608] = {
            description = "Victory is possible, <name>.\n\nThis portal is not just a means of bringing " ..
                "back Cenarius through the dream. Think about it, <name>. Once a gateway through the " ..
                "Emerald Dream is open, our forces can use them to move freely from Moonglade, " ..
                "Nordrassil, and even Wyrmrest, to this strategic location.\n\nAll Ysera needs is time. " ..
                "It'll be up to you to keep the Twilight's Hammer forces in Darkwhisper Gorge from " ..
                "pulling together and attacking us from the east.\n\nTake one of the emerald drakes and " ..
                "hit them hard, <name>.",
            rewardMoney = 156000,
        },
        [25609] = {
            description = "The key to the cage is held by Tony Two-Tusk, the pirate admiral, and he's " ..
                "guarded by ogres that you'll never be able to kill!\n\n<Wizzle cries some more and then " ..
                "looks up, an idea forming in his brain.>\n\nI've got it! What do all pirates want more " ..
                "than anything else? No, not grog. Something even better... treasure!\n\nThey had a ship " ..
                "full of treasure that was sunk by a giant whale-shark. The treasure is scattered all " ..
                "over down in the Mirage Abyss to the northwest.\n\nGo get it!",
            rewardMoney = 5500,
        },
        [25610] = {rewardMoney = 5500},
        [25611] = {
            description = "I'll usher out the rest of Goldrinn's followers and seal this portal behind " ..
                "us.\n\nThe rest of our forces at Mount Hyjal will want to hear of this victory. Return " ..
                "to Ian Duran and let him know what we've discovered and how we were " ..
                "triumphant!\n\nSimply step through the portal to return to Mount Hyjal.",
            rewardMoney = 7800,
        },
        [25612] = {
            description = "I'll usher out the rest of the followers of Lo'Gosh and seal this portal " ..
                "behind us.\n\nThe rest of our forces at Mount Hyjal will want to hear of this victory. " ..
                "Return to Takrik Ragehowl and let him know what we've discovered and how we were " ..
                "triumphant!\n\nSimply step through the portal to return to Mount Hyjal.",
            rewardMoney = 7800,
        },
        [25613] = {
            description = "So these night elves send out a desperate call for help to us, goes something " ..
                "like this:\n\n<Gnombus changes the pitch of his voice to sound like a " ..
                "woman.>\n\n\"Please come help us! The big, mean Horde has goblins! Oh, we can't handle " ..
                "goblins! They pull our hair and make us cry!\"\n\nRight, anyway, so here we are.\n\nThe " ..
                "first thing I did was upgrade their aerial defenses with some of my new sniper guns. " ..
                "Problem is, they don't use guns. Do yourself a favor and lend 'em a hand, eh? Find 'em " ..
                "south of here.",
        },
        [25614] = {
            description = "The skies are swarming with heavily armored orcs on the backs of even more " ..
                "heavily armored wind riders. Our best efforts to bring them down have thus far proven " ..
                "fruitless. Our arrows usually just bounce off of those foul creatures. If we do happen " ..
                "to take one down the orcs deploy their goblin parachutes and safely land on the ground " ..
                "below.\n\nI need you to use Gnombus's sniper cannons and blow up the Warsong wind riders " ..
                "and then blow up the parachuting orcs.\n\nThe only way down is in a body bag.",
        },
        [25615] = {
            description = "Huntress Jalin will be pleased to know that the way to Windshear Hold is now " ..
                "clear. Please return to Stardust Spire and inform her of your success. She will most " ..
                "assuredly have more work for you now that our path is clear.\n\nThank you and good luck, " ..
                "friend.",
            rewardChoices = {{57415, 1}, {57416, 1}, {57417, 1}},
        },
        [25616] = {
            description = "Enter Stonetalon Mountains through Talondeep Pass and head towards the " ..
                "smoldering trees. Seek out the Krom'gar incinerators that are destroying the forest and " ..
                "slay as many as you can! Be warned, the incinerators are powerful orcs. Attacking them " ..
                "through conventional means will likely result in your death. Destroy the oil canisters " ..
                "on their backs and they will be devoured by flame!\n\nReport to Sentinel Heliana at " ..
                "Windshear Mine should you succeed. She will have your new orders.",
        },
        [25617] = {
            description = "Atop the Lightning Ledge, the Twilight's Hammer has erected an enormous " ..
                "flamegate. I do not know where it leads; I know it is not of this realm, and I cannot " ..
                "enter. None of my other followers have returned.\n\nI need you to enter this realm and " ..
                "be my fangs within. Step through the flamegate. If he is still alive, meet with Jordan " ..
                "Olafson inside. He will give you a token that will allow you to use my powers in that " ..
                "realm.\n\nBe bold, <name>. Find out where that flamegate leads, and destroy whatever " ..
                "lies within.",
            rewardItems = {{55050, 1}},
        },
        [25618] = {
            description = "Atop the Lightning Ledge, the Twilight's Hammer has erected an enormous " ..
                "flamegate. I do not know where it leads; I know it is not of this realm, and I cannot " ..
                "enter. None of my other followers have returned.\n\nI need you to enter this realm and " ..
                "be my fangs within. Step through the flamegate. If he is still alive, meet with Jordan " ..
                "Olafson inside. He will give you a token that will allow you to use my powers in that " ..
                "realm.\n\nBe bold, <name>. Find out where that flamegate leads, and destroy whatever " ..
                "lies within.",
            rewardItems = {{55049, 1}},
        },
        [25619] = {
            description = "There's no shortage of Kvaldir to slaughter. They're obviously still reeling " ..
                "from our assault. The city has been desolate so long, I doubt they expected any naga to " ..
                "contest them here.\n\nThere have been no reports yet of their leader. I'm sure that " ..
                "culling them further will force the coward to rear his head soon enough.\n\nShall we " ..
                "continue?",
        },
        [25620] = {
            description = "The Revered Lady has sent word for you. She awaits you at the far end of the " ..
                "temple gardens.\n\nIf you feel the need to mention the heroic exploits of your faithful " ..
                "battle brother, Azjentus, please don't hold back. I won't take your admiration of me as " ..
                "a weakness.\n\nI'll hold you up no longer. The Lady awaits.",
        },
        [25621] = {
            description = "Ze Gnomecorder iz complete! Now ve must test zit!\n\nVenture into Stonetalon " ..
                "Mountains to ze southeast and valk down ze Talondeep Pass until you reach a filzy goblin " ..
                "drill machine. I vill activate ze Gnomecorder ven you reach your destination!",
        },
        [25622] = {
            description = "Deze orc incinerators zat burn ze forest carry viz zem powerful veaponry! You " ..
                "must kill zem and take zhere flame thrower. Vonce you have ze flame thrower, search ze " ..
                "forest for varsong stockpilez and use ze flame thrower to burn zem down!\n\nBurn zem all " ..
                "and I vill reward you! Yes, ze Gnomecorder can transport items!\n\nVait! Do you hear " ..
                "zat! I zink zhere iz an orc nearby! Vatchout!",
            rewardChoices = {{57425, 1}, {57426, 1}, {57427, 1}},
        },
        [25623] = {
            description = "<name>, there you are! Goldrinn has a mission that only his champion can " ..
                "accomplish. Atop the Lightning Ledge, Twilight's Hammer has erected a flamegate. We " ..
                "don't know where it leads, but Goldrinn can't enter. The ancient needs you to be his " ..
                "fangs.\n\nStep into the flamegate and talk to Jordan Olafson when you get inside. He'll " ..
                "give you a token to allow you to use Goldrinn's power in that realm. Find out where the " ..
                "flamegate leads!",
            rewardItems = {{55049, 1}},
        },
        [25624] = {
            description = "<name>! Lo'Gosh needs you. Atop the Lightning Ledge, Twilight's Hammer has " ..
                "erected a flamegate. We don't know where it leads, but nobody who's gone through has " ..
                "returned. You are to venture inside and be the fangs of Lo'Gosh within.\n\nStep into the " ..
                "flamegate and talk to Jordan Olafson when you get inside. He'll give you a token to " ..
                "allow you to use Lo'Gosh's power inside that realm. Find out where the flamegate leads!",
            rewardItems = {{55050, 1}},
        },
        [25626] = {
            description = "What you told me of the naga before has been plaguing my mind. Who are these " ..
                "allies they're summoning? Do they really think they can defeat the " ..
                "Tidehunter?\n\nEscaping this cave brings a degree of relief, but our purpose here " ..
                "remains. I'm hoping you will be willing to seek answers from the Battlemaiden one last " ..
                "time.\n\nThere's only one place that I can think of where they would have taken the " ..
                "artifact - the temple atop the ruins. It's sure to be well guarded. Proceed carefully.",
            rewardChoices = {{59670, 1}, {59671, 1}, {59669, 1}, {59672, 1}},
            rewardMoney = 312000,
        },
        [25627] = {
            description = "This treasure's all fake, but it's not like those den whompers are going to " ..
                "know the difference. Stupid ogres!\n\nHere's the plan... you head into the Admiral's Den " ..
                "and spread all of this \"treasure\" around to any ogres that get in your way. Then all " ..
                "you have to do is confront Tony Two-Tusk.\n\nYou'll have the key to the cage in no-time!",
            rewardChoices = {{63624, 1}, {63625, 1}, {63626, 1}, {63627, 1}},
            rewardMoney = 11500,
        },
        [25628] = {rewardMoney = 11500},
        [25629] = {
            description = "Battlemaiden!\n\nFind my Honor Guard upon the field of battle and relieve them " ..
                "of their foes. I need them to return to guard the priestesses immediately!\n\nI will " ..
                "hold the entrance. Be swift!",
        },
        [25630] = {
            description = "Do you see it, <name>? From the ridge southwest of here... plumes of black " ..
                "smoke curling into the sky.\n\nMount Hyjal is burning.\n\nIf the fires have raced this " ..
                "far up the mountain, surely they threaten the Grove of Aessina and all of our forces " ..
                "there. Can you investigate?\n\nSpeak with Laina Nightsky near the Grove of Aessina. Last " ..
                "I heard, she was fighting off the assault.",
        },
        [25637] = {
            description = "Fathom-Lord Zin'jatar has sent word that the Kvaldir leader has shown himself. " ..
                "I would like you to make your way to him at the far end of the terrace above us, on the " ..
                "middle level of the ruins: Nar'shola Terrace.\n\nKill any Kvaldir that stand in your " ..
                "path on that terrace. We want the echoes of this defeat to ring in their minds so that " ..
                "they will dare not return to threaten our purpose here.\n\nYour devotion does not go " ..
                "unnoticed, my battlemaiden. Go knowing that you have my blessing.",
        },
        [25638] = {
            description = "The note in this bottle is soaked through, but still legible.\n\nIn it, the " ..
                "author claims to have escaped from some sort of undersea naga prison.\n\nHe is clearly " ..
                "in fear for his life, and you can't help but wonder if it might be one of your recently " ..
                "abducted shipmates.\n\nAt a loss as to how to locate the escapee, you determine to share " ..
                "the find with Erunak.",
            rewardMoney = 59000,
        },
        [25640] = {
            description = "Ve have discovered ze vhereabouts of ze gigantic goblin bomb zat you " ..
                "discovered at Silvervind Refuge.\n\nYou remember Boog? Ze gnome you rescued from ze " ..
                "orcish vagon of agony? Vell, he and Minx have tracked ze bomb down to Windshear Mine. Go " ..
                "zhere immediately, <name>! Zey'll be expecting you.",
        },
        [25641] = {rewardMoney = 2000},
        [25642] = {
            description = "Keep your head down, <name>. No need to draw unwanted attention.\n\nLooks like " ..
                "the orcs are piling that balloon up with some type of ore from the mine. Get in there " ..
                "and take the ore from the orcs. Bring me back whatever you manage to grab and I'll ship " ..
                "it off to the professor for examination.\n\nBefore you go, a word of advice: you can " ..
                "avoid the Krom'gar pretty easily in there as (1) they're dumb as dirt and (2) they can't " ..
                "see anything if they're carrying ore. Of course, you need to kill them to get their ore.",
        },
        [25644] = {
            description = "The egg is unlike any that you've seen before. Its translucent shell appears " ..
                "to bend the light around it.\n\nAccompanying it, you find a note describing the arrival " ..
                "of a fertile broodmother at the Ascendant's Rise.\n\nPerhaps you should show this to " ..
                "Aronus.",
            rewardMoney = 82000,
        },
        [25645] = {rewardMoney = 8000},
        [25646] = {
            description = "The Horde has overrun Windshear Mine. I'm not sure what these orcs are hauling " ..
                "out of here or why they're here, but I know that it can't be good. Get in that mine and " ..
                "take out the management. Without goblin overseers, these peons will be even more " ..
                "worthless.\n\nWhile you're inside, keep your eyes peeled for any other information about " ..
                "the Horde operation in the mines.\n\nGood luck!",
            rewardChoices = {{57422, 1}, {57423, 1}, {57421, 1}, {57424, 1}},
        },
        [25647] = {
            description = "You've discovered a parchment with an impressive looking Horde seal imprinted " ..
                "upon its page. Unfortunately, the rest of the document is completely illegible as it is " ..
                "in orcish.\n\nTake the letter to Boog. He might know what to do with it!",
        },
        [25648] = {
            description = "Hmmph... it looks like your services are being requested elsewhere. Ag'tor " ..
                "Bloodfist is looking for recruits to assist the Horde's ventures in Azshara, north of " ..
                "Orgrimmar.\n\nI'm sure you still have work to do here in Durotar, and I understand that " ..
                "they'll shortly be asking for your help in the Barrens. I wouldn't be going anywhere yet " ..
                "if I were you, but if you're itching for some manifest destiny... Azshara awaits.",
            rewardMoney = 35,
        },
        [25649] = {
            description = "The good news is that Minx is fluent in orcish and she's nearby. Head back " ..
                "into the mine and find her. She's probably deeper inside, standing around being " ..
                "useless.\n\nDon't forget the parchment!",
        },
        [25650] = {
            description = "The letter is actually an order from Horde high command. Someone named " ..
                "Overlord Krom'gar has issued a \"strip job\" on this mine in order to obtain something " ..
                "called azure iron flake. Presumably this flake is obtained from breaking down the " ..
                "ore.\n\nIt gets worse. They plan to mix the azure flake with the explosives sitting " ..
                "inside the huge bomb outside and blow up Windshear Hold.\n\nWe don't have a moment to " ..
                "lose, <name>! Take this translated copy of the letter and return to Boog! He'll know " ..
                "what to do next.",
        },
        [25651] = {
            description = "So, I've been thinkin'...\n\nIf someone's out-of-their-mind-guano-crazy, do " ..
                "they know it?\n\nCase in point, I coulda swore that I'd collected a barrel of gunpowder " ..
                "from the cannonballs around here, but it's nowhere ta be found.\n\nI distinctly remember " ..
                "lifting the cannonballs from them Gilblins just west of here.\n\nMaybe they're right... " ..
                "maybe I really have lost it.",
            rewardMoney = 78000,
        },
        [25652] = {
            description = "We don't have a moment to lose, <name>. You're going to have to commandeer " ..
                "that hot air balloon and stop it!\n\nHow? I have no idea! We don't have time to argue " ..
                "details! Grab onto that rope ladder and climb up! Just start banging on stuff once " ..
                "you're inside!\n\nIf you somehow manage to stop the balloon and survive, report to Lord " ..
                "Fallowmere at Windshear Hold in the west.\n\nGood luck, we're all counting on you. Now " ..
                "if you'll excuse me I'm going to RUN FOR MY LIFE!",
            rewardChoices = {{57418, 1}, {57419, 1}, {57420, 1}},
            rewardMoney = 4000,
        },
        [25653] = {
            description = "Nemesis... destroyed.\n\nI feel rejuvenated. Powerful. Awakened.\n\nTell Ysera " ..
                "my strength is hers.\n\nThe Twilight's Hammer will fall.",
            rewardMoney = 7800,
        },
        [25654] = {
            description = "Edana Hatetalon is the queen of the Northspring harpies that reside in the " ..
                "ruins to the west. It is her malicious will that leads the harpies to defend their nests " ..
                "among the ruins of our people.\n\nThe harpies can call to her with a horn they carry - " ..
                "blowing it by the Hatetalon stones, in the northern part of the ruins, will summon " ..
                "Edana.\n\nShow no mercy for these foul creatures. Slay her, and bring her dark heart to " ..
                "me.",
            rewardChoices = {{54921, 1}, {54922, 1}},
            rewardMoney = 7500,
        },
        [25655] = {
            description = "Skylord Omnuron has been too gentle with the Wormwing harpies. He allows them " ..
                "to share a perch on this mountain just because they're creatures of the air. Well " ..
                "<class>, not all creatures of the air are created equal.\n\nWhen the attacks on Hyjal " ..
                "began, the Wormwing went into a frenzy. They're up there right now, assaulting a sacred " ..
                "shrine they once claimed to revere.\n\nI'm not troubled. Now we have a reason to drive " ..
                "them from Hyjal, don't we?",
            rewardMoney = 78000,
        },
        [25656] = {
            description = "There's a pattern to these Wormwing attacks. While groups make a showy assault " ..
                "on the shrine itself, others swoop into the nearby nests and make off with eggs from all " ..
                "the flying creatures of Hyjal.\n\nThese animals are under our protection. Before we find " ..
                "out why the Wormwing are doing this, it's up to us to rescue as many eggs as we can from " ..
                "their talons.",
            rewardMoney = 78000,
        },
        [25657] = {
            description = "So, seein' as ya been so kind to me, I'm inclined to let you in on a special " ..
                "secret.\n\nI've found the biggest shiney of all, no more than 50 steps from where we're " ..
                "standin'!\n\nOnly one thing stands between you, me, and great fortune - and his name is " ..
                "Gnaws.\n\nDon't fret now - I've got a plan.\n\nGnaws loves his grubs, so I've loaded one " ..
                "up with that gunpowder so as to make like a trap of sorts, ya see?\n\nJust set it " ..
                "floatin' up in the reef. Once the shark is dead, we're rich!",
            rewardMoney = 78000,
        },
        [25658] = {
            description = "My lady, I have a request from the High Priestess that I am to pass along to " ..
                "you. Many of the city's defenses remain from long before it sunk beneath the waves, and " ..
                "some of them are but a trivial task to reactivate, were it not for the countless Kvaldir " ..
                "that stand in our way.\n\nWe are told you are to be fighting on Nar'shola Terrace above " ..
                "us. You would do my lady a great service if you would but touch some of the devices as " ..
                "you pass. Your noble blood should prove more than sufficient to reactivate them.",
        },
        [25659] = {
            description = "The Kvaldir leader has shown his rotting, ugly face but a short swim from " ..
                "here, down this hall to our west. We kill him now and the Kvaldir occupation of our once " ..
                "beloved city shall be ended.\n\nBeware Battlemaiden, for he is no weakling. He has many " ..
                "Kvaldir at his command. Some Sira'kess Sea Witches have been dispatched to weaken him " ..
                "during your attack, but they will be interrupted if you let any of his Kvaldir attack " ..
                "them.\n\nShow no mercy, Battlemaiden.",
        },
        [25661] = {rewardMoney = 5500},
        [25662] = {
            description = "Yesterday morning I dispatched a squadron of huntresses on a mission into " ..
                "Windshear Crag to obtain information about Horde operations in Stonetalon. Field " ..
                "intelligence reports that they have all been captured, including their squad leader, " ..
                "Huntress Illiona.\n\nHead east into Windshear Crag and slay the Krom'gar infantry that " ..
                "occupy the crag and take from them their keys to unlock the Horde cages holding our " ..
                "sisters.\n\nDo your best to locate Illiona once you've freed the huntresses.",
            rewardMoney = 2000,
        },
        [25663] = {
            description = "Although the guardian of all winged creatures is no longer with us in body, I " ..
                "sometimes hear her voice in the whisper of swaying leaves.\n\n<name>, we ask much of you " ..
                "as you set out to preserve this mountain. Before going on, take a moment to " ..
                "reflect.\n\nTake this offering of nectar to Aviana's burial circle, a circle of stones " ..
                "just outside the main door of the shrine. Perhaps some time alone with Aviana's memory " ..
                "will help sharpen your focus.",
        },
        [25664] = {
            description = "A winged visage? Could it be...?\n\n<name>, there's no time to waste. You may " ..
                "have been speaking to Aviana herself, trying to return to us.\n\nI'll need something " ..
                "from Aviana's past to reach out to her. High atop the ridge overlooking this shrine, " ..
                "you'll find a series of huge nests belonging to Blaithe, an ancient bird of prey that " ..
                "was once her consort. For ten thousand years he's been mad with grief.\n\nGo to one of " ..
                "his roosts, and use this call to summon him. Kill Blaithe and bring me one of his " ..
                "feathers.",
            rewardChoices = {{57339, 1}, {57340, 1}, {57341, 1}},
            rewardMoney = 78000,
        },
        [25665] = {
            description = "<You can't make sense of the spirit's urgent plea, but maybe Choluna can " ..
                "decipher what's going on here.>\n\n<Speak with Choluna back inside the shrine!>",
        },
        [25667] = {
            description = "The wendigos in the Grizzled Den to the southwest of town have long been a " ..
                "thorn in our side. They're never quite strong enough to threaten Kharanos directly, yet " ..
                "they prey on travelers, mountaineer patrols, and supply convoys.\n\nI'm going to be " ..
                "withdrawing my observers from the Grizzled Den because I need them on the troll front. " ..
                "Would you help my men finish culling the wendigo population? Without strength of " ..
                "numbers, they won't be able to attack us.",
            rewardMoney = 125,
        },
        [25668] = {
            description = "With the Frostmanes making trouble to our east, the wendigos have sensed our " ..
                "weakness and grown bolder in their raids. Only one of the four most recent supply wagons " ..
                "has made it here safely. The wendigos made off with the rest, stashing it in the " ..
                "Grizzled Den, a cave southwest of town. If you're willing to go down there and recover " ..
                "the stolen supplies, you would have the gratitude of all the townspeople and the " ..
                "mountaineers defending Kharanos.",
            rewardChoices = {{57550, 1}, {57551, 1}},
            rewardMoney = 125,
        },
        [25669] = {
            description = "Prepare yourself, <name>! The Warlord comes! Kill him and take his key. Use " ..
                "the key to release me.\n\nShould we make it out of here, report the following to Lord " ..
                "Fallowmere at Windshear Hold:\n\nThe Horde has aborted their plans to destroy Windshear " ..
                "Hold due to the efforts of one of our heroes. They now plan to move the bomb to " ..
                "Battlescar Valley and drop it on our armies battling the Horde at that location.\n\nThey " ..
                "must be stopped!",
            rewardChoices = {{57432, 1}, {57433, 1}, {57431, 1}},
        },
        [25670] = {
            description = "If ol' Gnaws had heels he'd be on 'em right now.\n\nFortunately for you, I " ..
                "think like a shark.\n\nGnaws is mad as all get out and we're gunna use that to our " ..
                "advantage.\n\nHere, I found this chain while out treasure-huntin'. Use it to tie off to " ..
                "that harpoon gun.\n\nWhen Gnaws sees ya he'll be consumed with rage - that's when we " ..
                "strike!\n\nYou try to finish him off and I'll sneak in there and grab the " ..
                "shiney.\n\nHurry, <class>, before he grows them teeth back!",
            rewardMoney = 78000,
        },
        [25671] = {
            description = "The Horde's numbers swell as reinforcements from Ashenvale and Azshara arrive. " ..
                "There is no diplomacy to be had with the beasts. This is Hellscream's Horde and " ..
                "Hellscream's Horde wants our blood! We will not sit idly by and allow them to take our " ..
                "land and kill our people. We must act!\n\nWe must thin the Horde! Consider it your daily " ..
                "responsibility.\n\nVenture forth into Stonetalon Mountains and slay as many of the Horde " ..
                "as you are able. Let them know that the Alliance will not surrender!",
            rewardMoney = 5000,
        },
        [25672] = {rewardMoney = 5500},
        [25673] = {
            description = "Mr. P is sick, <mister/miss>. Won't you help him? All you have to do is find " ..
                "his hat and batteries and he'll be all better. I'd go get them myself, but I can't leave " ..
                "Mr. P alone!\n\nHis hat was stolen by the meanies in the Venture Co. over at the water " ..
                "wheel and his batteries are hidden around Windshear Crag. You'll just have to look real " ..
                "hard for those!\n\nWould you kindly bring Mr. P's stuff back so he can teach those " ..
                "baddies in the Horde a lesson?",
        },
        [25674] = {rewardMoney = 4000},
        [25675] = {rewardMoney = 8500},
        [25676] = {rewardMoney = 4000},
        [25677] = {rewardMoney = 8500},
        [25678] = {rewardMoney = 8500},
        [25679] = {rewardMoney = 2100},
        [25680] = {rewardMoney = 8500},
        [25681] = {rewardMoney = 16500},
        [25682] = {rewardMoney = 16500},
        [25683] = {rewardMoney = 8500},
        [25684] = {rewardMoney = 2100},
        [25685] = {rewardMoney = 8500},
        [25686] = {rewardMoney = 2100},
        [25687] = {rewardMoney = 8500},
        [25688] = {rewardMoney = 25000},
        [25689] = {rewardMoney = 2100},
        [25690] = {rewardMoney = 8500},
        [25691] = {rewardMoney = 8500},
        [25692] = {rewardMoney = 8500},
        [25693] = {rewardMoney = 4000},
        [25694] = {rewardMoney = 17000},
        [25695] = {rewardMoney = 8500},
        [25696] = {rewardMoney = 4500},
        [25697] = {rewardMoney = 8500},
        [25698] = {rewardMoney = 8500},
        [25699] = {rewardMoney = 8500},
        [25700] = {rewardMoney = 2100},
        [25701] = {rewardMoney = 34700},
        [25702] = {rewardMoney = 900},
        [25703] = {rewardMoney = 8500},
        [25704] = {rewardMoney = 11500},
        [25705] = {rewardMoney = 8500},
        [25706] = {rewardMoney = 17000},
        [25707] = {rewardMoney = 8500},
        [25708] = {
            description = "Based on what you're telling me, it sounds like there aren't many survivors... " ..
                "just restless spirits. The least we can do is give them their rest.\n\n<Enohar takes a " ..
                "long draw off of a mug of black ale.>\n\nHead back to the Shattershore and vanquish the " ..
                "worgen ghosts that still remain. Doing so should release their spirit from this world " ..
                "and allow them to pass into the next.",
            rewardMoney = 16500,
        },
        [25709] = {
            description = "The other thing that concerns me about those shipwrecks is all the vultures " ..
                "that they've attracted. Knowing how those birds operate, they've already picked the " ..
                "bones clean, but still... we can't allow them to further desecrate the bodies of our " ..
                "friends.\n\nBefore I brewed, I hunted. Here, take this bow, and more importantly, these " ..
                "arrows. They've been laced with a little concoction that should give those bonepickers a " ..
                "surprise.",
            rewardChoices = {{59368, 1}, {59369, 1}, {59370, 1}, {59371, 1}},
            rewardMoney = 8500,
        },
        [25710] = {
            description = "Nethergarde has stood steadfast for years against the demon onslaught that " ..
                "plagues this land. Our watch is never-ending, our vigilance unfaltering, and our courage " ..
                "bottomless.\n\nWe have held these lands since the portal opened, but now these Horde " ..
                "insects have the insolence to stand in our way!? We have protected THEM as well as we " ..
                "have protected ourselves!\n\n<Lungertz looks you over.>\n\nLet's see if you've got a " ..
                "hand for combat. Slay one of the Horde's Okril'lon scouts that nibble at our perimeter.",
            rewardMoney = 6000,
        },
        [25711] = {
            description = "The Horde are a nuisance that we will deal with, but they are proving more " ..
                "difficult than previously expected. You are to put a stop to this.\n\nTo the west of " ..
                "Nethergarde, the Okril'lon main forces press on our defenses. They currently hold the " ..
                "Nethergarde Mines, and they mean to move into the supply camps and, eventually, the " ..
                "Keep. Thin their numbers and delay their advance, <name>.",
            rewardChoices = {{59372, 1}, {59373, 1}, {59374, 1}, {59375, 1}},
            rewardMoney = 16500,
        },
        [25712] = {
            description = "Lungertz is a strong leader, but he is proud. He understates the pressure that " ..
                "the Horde is really putting on us. Without our mine... Nethergarde is penniless.\n\nWe " ..
                "need to move the Horde forces from the supply camp NOW, and doing so means killing their " ..
                "commander, Captain Metlek. He's not a strong leader, and prefers to bark orders from the " ..
                "back lines, but even so, his death might buy us the victory we need.",
            rewardMoney = 8500,
        },
        [25713] = {
            description = "Say there... <name>, is it? I've got a proposition for you which involves " ..
                "explosions. Interested?\n\nI couldn't help but overhear your conversation with the " ..
                "quartermaster. You see... I've been working on an explosive device. It's not very " ..
                "effective against other creatures, but devastating against artillery. If you're heading " ..
                "back into the field to visit those orcs, find some enemy supplies and give this thing a " ..
                "try. Who knows... maybe they like explosions too.",
            rewardMoney = 8500,
        },
        [25714] = {
            description = "It's time for you to visit the Watcher. He's been in a bit of a mood lately, " ..
                "and I'm not quite sure why.\n\nHead up to the top of the mage tower and check in with " ..
                "him. I don't have any work for you here, but I'm certain that he will.",
            rewardMoney = 800,
        },
        [25715] = {
            description = "We've seen countless ships sail past the shore to the southeast, but most pass " ..
                "by inconspicuously. Several days ago, however, a powerful storm carried several of the " ..
                "ships to shore and left them wrecked.\n\nI'd bet a pint of Nethergarde Bitter that they " ..
                "were Horde ships if I didn't love Nethergarde Bitter so much. I can pay you gold, " ..
                "though, if you'll go check out those ships and report back.",
            rewardMoney = 8500,
        },
        [25716] = {
            description = "You may have already run into some of the Shadowsworn cultists that dwell in " ..
                "the caves just to the southwest of Nethergarde. They do not impress an immediate danger " ..
                "upon our fortress, but I fear that they are planning something more dreadful than you " ..
                "can imagine.\n\nThe low-ranking members carry spell foci that might hold an answer. " ..
                "Bring some back to me intact, if you can wrench them from the cultists' hands.",
            rewardChoices = {{59376, 1}, {59377, 1}, {59378, 1}, {59379, 1}},
            rewardMoney = 8500,
        },
        [25717] = {rewardMoney = 17500},
        [25718] = {rewardMoney = 900},
        [25719] = {rewardMoney = 17500},
        [25720] = {
            description = "Wormthorn's unnatural forest threatens our excursion's progress. His trees' " ..
                "roots break our picks, his moss grows over our excavation sites, and his animals attack " ..
                "my men. When it comes to digging, I'll take a demon-infested wasteland over a forest any " ..
                "day.\n\nTake the demoniac vessel and use it on Marl Wormthorn to pull him from his " ..
                "trance. Return to me when he is no more.",
            rewardChoices = {{59437, 1}, {59438, 1}, {59439, 1}, {59440, 1}},
            rewardMoney = 26500,
        },
        [25721] = {
            description = "I'm here because Muradin himself knew that this survey needed someone to keep " ..
                "these buffoons on their toes. They're all too scared of the wildlife to do a thing! If " ..
                "I'm to get them off their duffs, I'm going to need some cleanup done.\n\nWe've got an " ..
                "elemental problem, first off. The flood did such a number here that the water itself's " ..
                "gone hysterical.\n\nI bet you've never slapped the sense into an entire lake before, but " ..
                "I'm askin' it of you now. Whallop those elementals but good for me.",
            rewardMoney = 1200,
        },
        [25722] = {
            description = "The destruction of the Stonewrought Dam was no small thing, <lad/lass>. We're " ..
                "here to find out just how bad the damage is. A mighty load of water's rampaged through " ..
                "here, and if it's disturbed the earth too far, we could be in for worse later on.\n\nWe " ..
                "can tell a lot from studying the sediment of the flooded area. I need as many soil " ..
                "samples as I can get, so if you could head out there and collect some more, I'd much " ..
                "appreciate it.",
            rewardChoices = {{59073, 1}, {59074, 1}, {59075, 1}},
            rewardMoney = 1200,
        },
        [25723] = {
            description = "The local wildlife's all messed up from the flood, it seems. This fen used to " ..
                "be full of crocolisks, but I haven't spotted a single one.\n\nWhat I have spotted are " ..
                "threshadons. Never used to be any here, so the flood must've swept them all right out of " ..
                "Loch Modan.\n\nLucky for us, because they're tastier than crocolisks, and I'm running " ..
                "low on provisions. Bring me back some threshadon meat for the camp, and I'll gladly pay " ..
                "you for it.",
            rewardMoney = 1200,
        },
        [25724] = {
            description = "The cataclysm has thrown the balance of power in Dun Morogh into question, " ..
                "<name>. Without warning, a wave of troggs emerged from the caves near Gnomeregan and " ..
                "overran the Frostmane trolls. The trolls have been migrating east ever since.\n\nThere " ..
                "has always been a Frostmane presence up on Shimmer Ridge, to the northwest, but with the " ..
                "migration, the trolls now surround us. We can't allow the trolls to use this position to " ..
                "their advantage. While my men hold the line in the east, strike against Shimmer Ridge.",
            rewardItems = {{2900, 1}},
            rewardMoney = 125,
        },
        [25725] = {
            description = "We're good on provisions, but we're in need of some medicine. Half the camp's " ..
                "fiercely hung over, and a remedy's in order.\n\nLuckily, I know a good folk remedy " ..
                "taught to me by my dear old mum. We just need some local ingredients.\n\nGather me some " ..
                "fenbush berries, if you would. They keep to where there's water and shade, so look along " ..
                "the shore and near other plants.",
            rewardMoney = 1200,
        },
        [25726] = {
            description = "Alright, I need you to help me find my dumpy level.\n\nWhat's that look for? " ..
                "That's right! I said my dumpy level! It's a piece of significant surveying " ..
                "equipment!\n\nI didn't name the bloody thing, alright? Go look it up! All I did was " ..
                "leave it on a rock long enough for one of those horrible oozes to swallow it up. The " ..
                "place is crawling with 'em, but one of them should still have it inside.",
            rewardMoney = 1200,
        },
        [25727] = {
            description = "The Dark Iron clan is up to no good out here. And if that surprises you, " ..
                "you're thicker than the addled blotters over in that tent. Muradin may pay lip service " ..
                "to those sooty cretins back in Ironforge, but out here all bets are off.\n\nWe had a " ..
                "raid against the camp last night, and one raid is too many. Their leader's a stout " ..
                "fellow by the name of Glowerglare, and he's hiding in the cave on the south bank of the " ..
                "river.\n\nBring me Glowerglare's beard as proof he's no longer a threat to us and " ..
                "Ironforge.",
            rewardChoices = {{59070, 1}, {59071, 1}, {59072, 1}},
            rewardMoney = 1200,
        },
        [25728] = {
            description = "Now Mr. P just needs an angel to help him navigate. Will you be that angel, " ..
                "<mister/miss>? With you helping we can go out into the crag and kill bunches and bunches " ..
                "of Horde! Waddya say? Come on, <mister/miss>! PRETTY PLEASE WITH SUGAR ON TOP?\n\nIf we " ..
                "kill enough Horde, Mr. Fallowmere will buy us all ice cream!",
            rewardItems = {{57518, 1}},
            rewardMoney = 6500,
        },
        [25729] = {
            description = "<The Gnomecorder comes to life with a loud buzz.>\n\nCome in, <name>! Are you " ..
                "zhere? I have noted on ze map that you are near ze Cragpool Lake vater vheel, is that " ..
                "correct?\n\nIt vould appear that ze Venture Co. has holed up at ze vheel. Have a look " ..
                "around vhile you are up zhere. If you happen to zee a traitorous gnome by ze name of " ..
                "Gerenzo Wrenchwhistle, put your boot firmly up his keester for me and for Gnomeregan! I " ..
                "vill pay handsomely!",
            rewardMoney = 6500,
        },
        [25730] = {
            description = "By order of people not wanting to get themselves devoured whole by a really " ..
                "huge fish, Cragpool Lake is OFF-LIMITS! Someone decided to up and put a huge, " ..
                "dwarf-eating fish in the lake.\n\nIt is strongly recommended that you stay out, however, " ..
                "if you are the heroic type and have a few friends around, do us all a favor and kill the " ..
                "damned thing! Maybe I can get some fishing done then, eh?\n\nIf you manage to actually " ..
                "do it, meet me back at Windshear Hold for a reward.\n\n- Ol' Irongoat",
            rewardChoices = {{57428, 1}, {57429, 1}, {57430, 1}},
            rewardMoney = 6500,
        },
        [25731] = {
            description = "It's time to get to the bottom of this. We need to interrogate the matron of " ..
                "these beasts, Marion Wormwing. We'll capture her alive. Here's the plan:\n\nThe harpies " ..
                "communicate across the ridge using a series of signal fires. If we extinguish one, " ..
                "Marion is sure to come investigate.\n\nYou fight her as a distraction while I sneak up " ..
                "behind and grab her. I'll leave the questioning to you. Let's get her, <name>!",
            rewardChoices = {{57332, 1}, {57333, 1}, {57334, 1}},
            rewardMoney = 78000,
        },
        [25732] = {
            description = "We did it!\n\nGnaws is down, and I have our shiney!\n\nThat's good " ..
                "news.\n\nDarn shiney is cursed treasure - makes everyone who touches it a " ..
                "skeleton.\n\nThat's bad news.\n\nThese cursed pirates say the Gilblin King has the " ..
                "secret to remove the hex.\n\nThat's good news.\n\nI can't step foot outside the reef or " ..
                "I'll be cursed forever.\n\nThat's bad news.",
            rewardMoney = 78000,
        },
        [25733] = {
            description = "Thelgen Rock's an important site here. We need to use it to study the bedrock " ..
                "formations an' such.\n\nOf course, it can't be that easy, so Thelgen Rock's also full of " ..
                "giant cave stalkers. Big as a dwarf and twice as hungry. Like I said, these fancy-lads " ..
                "are researchers, not warriors, so if I want them to get anything done you're gonna have " ..
                "to help me clear the filthy bugs out.\n\nKill as many of the blighters as you can and " ..
                "I'll make it worth your while, <name>.",
            rewardMoney = 1300,
        },
        [25734] = {
            description = "I'm feeling slightly less wobbly now, so I'm going to start setting up the " ..
                "level for my final measurements here. There's one last thing I need from you.\n\nThere's " ..
                "a seismograph set up deep within Thelgen Rock to record any movements in the earth. If " ..
                "things have been continuing to shift since the cataclysm, this'll tell us.\n\nThe " ..
                "seismograph's at the very bottom of the cave; find it and bring the record it's created " ..
                "back to me.",
            rewardMoney = 1300,
        },
        [25735] = {
            description = "Thelgen Rock over yonder is something of a natural wonder. It's the only known " ..
                "source of incendicite in the world!\n\nThe stuff's rare, highly sought, and ridiculously " ..
                "explosive. Hit it with a steel mining pick and you'll set off a fireworks show that'll " ..
                "put a room full of goblins to shame.\n\nLuckily, I've developed a spark-proof pick for " ..
                "such tasks. I'll loan it to you if you bring me back some incendicite ore, and I'll " ..
                "split you in on the profits, of course.",
            rewardChoices = {{59064, 1}, {59065, 1}, {59066, 1}},
            rewardMoney = 1300,
        },
        [25736] = {
            description = "This is all that's left of the huge elemental that attacked you: a frothing " ..
                "orb of water that continues to fight your grip.\n\nForba might appreciate seeing proof " ..
                "that you helped stop another threat to the camp.",
            rewardChoices = {{59067, 1}, {59068, 1}, {59069, 1}},
            rewardMoney = 2500,
        },
        [25739] = {
            description = "<Captain Kosak coughs weakly.>\n\nWas traveling up Webwinder Path, coming from " ..
                "Northwatch Expedition Base Camp in the south. Ambushed. Not by Horde. Spiders. Big, " ..
                "ugly, hairy, nasty spiders.\n\nFought off dozens, maybe hundreds. Lost count. Overtaken " ..
                "by their queen. She took a chunk right out of me. Barely made it out alive. Might be " ..
                "dying.\n\nMore of my men coming. Must provide safe passage. Kill spider " ..
                "queen.\n\n<Captain Kosak passes out.>",
        },
        [25740] = {
            description = "The dragon Sethria must be stopped. We know that her roost is south of here, " ..
                "along the southern cliffs of Hyjal, but beyond that we know little else.\n\nI have sent " ..
                "Thisalee on a fact-finding mission to Sethria's Roost. She specifically requested your " ..
                "help - evidently you made quite an impression with the young druid.\n\nMeet Thisalee " ..
                "just beyond the tunnel leading to Sethria's Roost. And remember, this is a fact-finding " ..
                "mission - don't do anything crazy!",
            rewardMoney = 19500,
        },
        [25741] = {
            description = "Poisoned travelers are becoming a common occurrence around Windshear Hold. Why " ..
                "just the other day a Northwatch Captain fell prey to the spiders of the Webwinder " ..
                "Hollow. He would have died to the poison had it not been for my anti-venom. Sadly my " ..
                "stock of anti-venom is almost completely depleted.\n\nIf you're heading south towards " ..
                "Webwinder Hollow, would you kindly recover Deepmoss venom sacs for me? You should be " ..
                "able to acquire them from Deepmoss spiders.",
            rewardMoney = 2200,
        },
        [25743] = {
            description = "This is no magic solution to my curse! It's just a hammer!\n\nI may be crazy, " ..
                "but I'm not stupid.\n\nThere's NO WAY I'm gunna use this to break my shiney - not after " ..
                "all I've gone through to get it.\n\n< Budd pauses in thought for a moment.>\n\nBut that " ..
                "means I'm stuck down here for eternity...\n\nI had just learned to sail, you " ..
                "know.\n\nOhhh... I can't decide.\n\nHere, you take the hammer and I'll just set the " ..
                "shiney down and look the other way.",
            rewardChoices = {{59785, 1}, {59786, 1}, {59787, 1}},
            rewardMoney = 78000,
        },
        [25744] = {
            description = "<name>, great job defending the Speedbarge! I've got something else that I " ..
                "need you to help out with.\n\nI've sent Crazzle Sprysprocket and Kravel Koalbeard " ..
                "northeast to negotiate with the centaur survivors. Their Splithoof Heights is dripping " ..
                "with oil!\n\nI figure those smelly half horses won't know what they've got and we'll get " ..
                "the rights to pump up that black gold for a song, but I'd feel better if you took charge " ..
                "of the talks.\n\nWhat do you say?",
        },
        [25746] = {
            description = "First order of business is to thin the herd here. This place crawls.\n\nLet's " ..
                "start slaughtering these dragonkin and worry about why they're here later.",
            rewardMoney = 78000,
        },
        [25747] = {
            description = "The Admiral used the information you gathered for him to make a forward post " ..
                "under the terrace to our west. He's been preparing there for some kind of attack against " ..
                "the naga.\n\nYou should go to him immediately and inform him of the scope of what you've " ..
                "witnessed. Our force is small, and I fear for our soldiers if we charge in too " ..
                "recklessly.\n\nTake my sea horse. It knows the way.",
            rewardMoney = 7800,
        },
        [25748] = {
            description = "I see. The news you bring is grim, but I was not entirely unprepared for such " ..
                "possibilities. Without any effective scouting of naga numbers, I knew our plan was " ..
                "risky, but that's why we established this forward post.\n\nLet me put it to you plainly, " ..
                "<class>. If we do not keep the naga off-balance, they will bring the fight to us. We do " ..
                "not have the structures or the men to mount a defense, so that is not an option.\n\nWe " ..
                "need more time. Can you thin their numbers to the south?",
            rewardMoney = 78000,
        },
        [25749] = {
            description = "I overheard your conversation with the Admiral. I know what we're doing sounds " ..
                "insane, but we really don't have much choice. There are people back at that cave that " ..
                "are depending on us.\n\nI've stationed lookouts on various ledges in the immediate area. " ..
                "They're burning ammo fast on the scattered naga scouts. Can you bring them more crossbow " ..
                "bolts to buy us some extra time?",
            rewardChoices = {{59702, 1}, {59703, 1}, {59704, 1}},
            rewardMoney = 78000,
        },
        [25751] = {
            description = "Hello! I've been scrambling, scrambling to prepare for the Admiral's assault. " ..
                "He's got high hopes and high plans to blow all kinds of things sky high!...or water " ..
                "high? That would do.\n\nBlowing things high takes EXPLOSIVES! I don't have explosives. " ..
                "It's saddening. Very saddening.\n\nI've been properly inspired to improvise though, and " ..
                "the solution has become apparent. The bulbs on the seaweed hanging from the ruins " ..
                "contain a surprisingly volatile gas. Maybe you might gather some for me? Pretty Please?",
            rewardMoney = 78000,
        },
        [25752] = {
            description = "We have everything we need to begin the attack.\n\nIf your claims were " ..
                "correct, you would do well to make sure you cling tight to your mount as we make the " ..
                "attack. Anyone who gets caught in the open water isn't likely to out-swim a " ..
                "naga.\n\nKill as many as you can as we make the attack run and we'll rendezvous on the " ..
                "broken ledge of the terrace above once we've expended our explosives. Hopefully by that " ..
                "point there will be few enough that we can finish them off the old-fashioned way.",
            rewardChoices = {{59662, 1}, {59663, 1}, {59664, 1}},
            rewardMoney = 78000,
        },
        [25753] = {
            description = "That was a disaster! Most of our men went down to spears before making it " ..
                "anywhere near the rendezvous.\n\nWe're only going to be able to hold this position for " ..
                "so long before the naga overrun us. We need to get out there to the southwest and save " ..
                "as many of the men as we can find - do anything you can.\n\nThey won't last long. Please " ..
                "hurry!",
            rewardMoney = 78000,
        },
        [25754] = {
            description = "Vicious louts... they did a lot of damage with those spears.\n\n<The admiral " ..
                "winces slightly as he clutches a wound on his side.>\n\nWe'll hold here as long as we " ..
                "can for all the men to make it. I need someone to scout their numbers to see how much " ..
                "damage we did.\n\nOne of the biggest groups of them was around the corner on the " ..
                "northwest portion of this round terrace, and the other was a bit farther to the north in " ..
                "the small tunnel, also on this middle level of the ruins.\n\nUp for some scouting?",
            rewardMoney = 78000,
        },
        [25755] = {
            description = "Look, I know this is asking a lot during a time like this, but I need you to " ..
                "tear yourself away from this defeat for a moment.\n\nI will tend to these soldiers - you " ..
                "need to find the location of that battle with the Kvaldir General to the west that you " ..
                "told me about. You should be able to glimpse more of the Battlemaiden's experiences from " ..
                "there. I have a strong feeling that the key to defeating these naga will lie with that " ..
                "Battlemaiden.\n\nPlease hurry - I will do everything I can to buy you time.",
            rewardChoices = {{59690, 1}, {59691, 1}, {59692, 1}, {59689, 1}},
            rewardMoney = 312000,
        },
        [25756] = {
            description = "If we're going to get those oil drilling rights, we need to know what the " ..
                "Horde is offering. How can we win if we can't do them one better?!\n\nTheir negotiator, " ..
                "Trackmaster Zherin, is up there talking with one of their khans right now. Why don't you " ..
                "head up and persuade him to hand over the Horde's proposal?\n\nYou don't have to kill " ..
                "him... we're not savages! Just rough him up a bit.",
            rewardMoney = 5500,
        },
        [25757] = {rewardMoney = 5500},
        [25758] = {
            description = "Do you see what they're doing here? They're affixing armored plates onto the " ..
                "Dragonkin. A page out of Deathwing's book, I suppose.\n\nThose Twilight Juggernauts look " ..
                "like they'll be invincible once they're complete. There's got to be a way around that " ..
                "armor plating!\n\nRun out there and fetch some of the Twilight armor plates that are " ..
                "waiting to be installed. We'll figure out how to beat this.",
            rewardMoney = 78000,
        },
        [25760] = {
            description = "The shard you recovered looks to be of naga origin. I had hoped to find a " ..
                "strong focal object like this for a spell I've been working on that would allow us to " ..
                "glimpse into the recent past.\n\nI've enchanted the blade, but you'll have to take it to " ..
                "a place where we know its owner was. I want you to travel back to the site where you " ..
                "found it and use the blade.\n\nPerhaps we can uncover more behind what the naga are " ..
                "doing here. Or even better, maybe we'll uncover a weakness that will give us a better " ..
                "chance.",
            rewardChoices = {{59708, 1}, {59709, 1}, {59710, 1}},
            rewardMoney = 312000,
        },
        [25761] = {
            description = "We have to stop these juggernauts before they're completely encased in armor. " ..
                "Right now they're vulnerable, but only if we pry aside the plates and hack at the marred " ..
                "flesh beneath.\n\nTake my shiv, and jam it between the plates of armored juggernauts to " ..
                "deprive them of their armor.\n\nOnce they break from their trance, you're in for a tough " ..
                "fight - keep prying loose that armor and stop those juggernauts!",
            rewardChoices = {{57312, 1}, {57313, 1}, {57314, 1}, {57315, 1}},
            rewardMoney = 78000,
        },
        [25762] = {rewardMoney = 5500},
        [25763] = {
            description = "<This elaborate book contains hundreds of vellum pages bound within a slate " ..
                "cover. It's written in many languages, most unfamiliar. Carefully inked illustrations " ..
                "depict sorcerers or even entire buildings vanishing into curtains of shadow.>\n\n<Many " ..
                "illustrations depict magical artifices like those you see around camp. You suspect the " ..
                "dragon Sethria is trying to keep something hidden. Thisalee will want to hear about " ..
                "this!>",
            rewardMoney = 7800,
        },
        [25764] = {
            description = "Skylord Omnuron wants us to find Aviana's Egg, and I can almost guarantee you " ..
                "it's cloaked by one of Sethria's shadow devices.\n\nSearch around the camp for shadow " ..
                "cloak generators and shut those things down until you find the egg.\n\nOnce you've " ..
                "unveiled it, I'll call out to the other druids. Defend that egg until we can carry it " ..
                "off to safety.\n\nGo get that egg, <name>!",
            rewardChoices = {{57317, 1}, {57318, 1}, {57319, 1}, {57316, 1}},
            rewardMoney = 78000,
        },
        [25765] = {
            description = "Northwatch could really use a powerful <race> like you. We're taking a beating " ..
                "in the Southern Barrens and need your help! Are you interested in lending the Alliance a " ..
                "hand?\n\nThe bomb? Yea, it's a problem, but Stonetalon isn't exactly prime real estate. " ..
                "This place was a dump before the Horde sunk their claws into it!\n\nI'll leave the " ..
                "choice in your hands. If you want to help us out in the Barrens, take my horse, Blue " ..
                "Steel. He's grazing at the crossroads south of here. He'll get you past the orc blockade.",
        },
        [25766] = {
            description = "The rage of the elements has unearthed a hidden Highborne city in the heart of " ..
                "Stonetalon Mountains.\n\nDirectly southwest of here, through Sishir Canyon, you will " ..
                "find the Ruins of Eldre'thar. Within the ruins lie treasures untouched by mortals for " ..
                "ten thousand years!\n\nTake this device and use it on the Highborne ghosts that inhabit " ..
                "the ruins. It will... put their souls to rest and also collect valuable data which I may " ..
                "peruse at a later date.",
        },
        [25767] = {
            description = "The great cataclysm has unearthed a forgotten Highborne city within Stonetalon " ..
                "Mountains. You must venture southwest to the Ruins of Eldre'thar. Once you are there, " ..
                "search the area for ancient relics. Return the relics to me so that I may study them, " ..
                "<name>.\n\nGo! Lest we keep the arcanist waiting!",
            rewardMoney = 2500,
        },
        [25768] = {
            description = "Scout Commander Barus, stationed at Mirkfallon Post, to the northwest, has " ..
                "spotted the Horde bomb. The Krom'gar hot air balloon, with bomb attached, is currently " ..
                "at the new goblin fueling station at Mirkfallon Lake. This might be the opportunity we " ..
                "need to take that thing out once and for all.\n\nGather your things, <name>, and move " ..
                "out! Scout Commander Barus awaits your arrival at Mirkfallon Post.\n\nAnd <name>, your " ..
                "tenacity is a testament to the strength and fortitude of the Alliance!\n\nGlory be unto " ..
                "you!",
            rewardChoices = {{57435, 1}, {57436, 1}, {57437, 1}, {57434, 1}},
        },
        [25769] = {
            description = "You're still here? What are you waiting for, a personal engraved invitation? " ..
                "Lord Fallowmere beckons, fool! Go to him now!",
        },
        [25770] = {
            description = "Alright. We need to get this ale to where it's going right away!\n\nIronforge " ..
                "has sent out an expedition of surveyors to check the damage done to the wetlands when " ..
                "the dam burst. Forba Slabchisel 's the one leading it...and believe me, you don't want " ..
                "to get on her bad side!\n\nShowing up with an armful of ale will help with that. Go and " ..
                "take this ahead to her, and she might even ask you to stick around for some work.",
            rewardMoney = 600,
        },
        [25771] = {
            description = "A shard of glimmering rock sits before you. You sense that this item would be " ..
                "of value to someone within the Blasted Lands.",
            rewardItems = {{12122, 1}},
        },
        [25772] = {
            description = "A glimmering sphere sits before you. You sense that this item would be of " ..
                "great value to someone within the Blasted Lands.",
            rewardItems = {{10752, 1}},
        },
        [25774] = {
            description = "We definitely DO NOT have the kind of gold that the Horde is offering. <name>, " ..
                "we have to do something or we're not going to be able to get those drilling " ..
                "rights!\n\nWait a minute! There was this report from an underwater survey that we did " ..
                "right after the Cataclysm struck. Something about some gold-looking ore that was pushed " ..
                "up from underground. That's it!\n\nHead west to the old stomping grounds of the centaur, " ..
                "Splithoof Crag and Splithoof Hold, and dig some up.",
            rewardMoney = 5500,
        },
        [25775] = {rewardMoney = 5500},
        [25776] = {
            description = "While you've been raiding Sethria 's nest, messages have been flying back and " ..
                "forth between here and the shrine. Skylord Omnuron was at first reluctant, but I've " ..
                "persuaded my fellow druids to risk a direct assault on Sethria herself.\n\nEveryone " ..
                "agreed to my plan... provided YOU spearhead the attack.\n\nTake this signal rocket and " ..
                "engage Sethria on the far ridge. When she reveals her true colors and shifts to her " ..
                "dragon form, fire the rocket and backup will arrive to help you!",
            rewardMoney = 78000,
        },
        [25777] = {
            description = "This news needs to get to Menethil as soon as possible. I'll send you along on " ..
                "my fastest ram, <name>.\n\nHe knows the way, just make sure you're steady in the saddle " ..
                "and hold on tight.\n\nDon't dawdle around the camp. We've got to send word quickly!",
            rewardMoney = 700,
        },
        [25778] = {
            description = "Now that the \"gold\" is ready, I want you to take it up to Khan Ablinh. He'll " ..
                "be so overwhelmed, I bet he'll offer to help us setup the drilling rigs. We could use " ..
                "the horsepower.\n\nHaha, get it? Horsepower?",
            rewardMoney = 500,
        },
        [25779] = {rewardMoney = 500},
        [25780] = {
            description = "We'd barely pulled ourselves together after the flood when the Dark Iron hit " ..
                "the town. My men and I all rushed to defend the townsfolk, but the crazed fools " ..
                "retreated right into the keep itself.\n\nThey're holed up good, and we can't destroy the " ..
                "keep. Not with half the town in ruins already.\n\nTake my place, <name>. I'd take the " ..
                "leader on myself if he hadn't dealt me this blow. Enter the keep, slay Horghast, and " ..
                "bring this to an end!",
            rewardChoices = {{59076, 1}, {59077, 1}, {59078, 1}},
            rewardMoney = 1300,
        },
        [25790] = {
            description = "I am NOT stupid!\n\nGo back to your master and tell him that there will be NO " ..
                "deal! That is, if you can survive to make it back to him.",
            rewardChoices = {{63566, 1}, {63567, 1}, {63568, 1}, {63569, 1}},
            rewardMoney = 5500,
        },
        [25791] = {rewardMoney = 5500},
        [25792] = {
            description = "Most of the mountaineers and steam tanks in Dun Morogh are battling along the " ..
                "Frostmane Front, which is approaching us from the southeast. We can barely hold the " ..
                "trolls back, let alone advance into their village and take on their leader.\n\nThey've " ..
                "blocked our path of approach with mysterious totems that choke mountaineers who come in " ..
                "range, leaving the victims helpless against their enemies. This stone is inscribed with " ..
                "a rune of fire; it should be able to destroy the totems and free our mountaineers.",
            rewardChoices = {{1010, 1}, {1011, 1}, {10547, 1}},
            rewardMoney = 175,
        },
        [25793] = {
            description = "The purpose of this base was to establish a foothold in Stonetalon for " ..
                "Theramore and to open up a supply line to the night elves. The Horde, unfortunately, has " ..
                "given us one hell of a fight. Hellscream's armies are mighty and unrelenting. I haven't " ..
                "seen this type of ferocity from the Horde since the second war.\n\nNow it would appear " ..
                "that the mine the Explorers' League dug out is being used by the Horde to \"backdoor\" " ..
                "us. We need to seal that thing off!",
        },
        [25794] = {
            description = "I believe I've located the author of your note, friend.\n\nIt would seem that " ..
                "he is in desperate need of attention if he is to survive.\n\nI shall attune one of my " ..
                "scrying orbs, that you might see him for yourself.",
        },
        [25795] = {
            description = "Aviana's Egg should have arrived safely back at the Shrine. You should go " ..
                "check on it! Choluna should know how to handle this.\n\nI'll finish the last of our " ..
                "business here and catch up with you later.",
            rewardMoney = 7800,
        },
        [25796] = {
            description = "It is our destiny to take this oil. Unfortunate that the centaur retreated to " ..
                "here when the sea rushed in.\n\nUnfortunate for them, that is.\n\nThey've spit in our " ..
                "faces, <name>. We made them a generous offer and they made the mistake of not accepting. " ..
                "Now we... you, will show them the error of their ways.\n\nClear the centaur off of the " ..
                "Splithoof Heights. The oil must flow!",
            rewardMoney = 5500,
        },
        [25797] = {rewardMoney = 5500},
        [25798] = {
            description = "I'm not leaving here empty-handed! Are you?\n\nI bet you were wondering what's " ..
                "in the giant crate. Well, wait no longer. I want you to take one of our drilling rigs to " ..
                "the oil pools and pump us up some crude.\n\nOf course, you should expect the centaurs to " ..
                "attack. Just defend the drill long enough for us to get a barrel or two out of the " ..
                "ground.",
            rewardMoney = 5500,
        },
        [25799] = {rewardMoney = 5500},
        [25800] = {
            description = "There's a lot to do here, <class>, but we need to keep an eye out for the " ..
                "gifts of fate.\n\nWhen the flood rolled in, right over our houses, it swept a good " ..
                "number of ocean dwellers with it. Menethil Bay's full of crabs now, large and ripe for " ..
                "the picking.\n\nWhen life gives you crabs, go crab fishing, I say. Bring me back the " ..
                "largest, meatiest claws you can find and I'll pay you.",
            rewardMoney = 1400,
        },
        [25801] = {
            description = "Murlocs are crawling out from the deep waters and building their villages on " ..
                "the coastline. They are harassing our fishers and merchants and must be stopped.\n\nOne " ..
                "of these murlocs, Gobbler, skulks with other bluegill murlocs and harries merchants " ..
                "along the road, always then retreating to the safety of the nearby murloc hovels. Our " ..
                "merchants are in jeopardy, and we will pay to secure them.\n\nGobbler prowls the river " ..
                "inlet north of here. Find him, slay his kin, and bring me his head.",
            rewardChoices = {{59079, 1}, {59080, 1}, {59081, 1}, {59082, 1}},
            rewardMoney = 1400,
        },
        [25802] = {
            description = "Not long ago a merchant vessel, the Blind Princess, was raided by murlocs. " ..
                "Although the ship escaped intact, much of its cargo was dragged overboard by the " ..
                "creatures, including a very valuable statuette of Terenas Menethil. We want that " ..
                "statuette recovered.\n\nSearch the coastal murloc hovels for crates, barrels and other " ..
                "evidence of lost cargo. Find the Menethil statuette and return it to me.",
            rewardItems = {{929, 1}},
            rewardMoney = 700,
        },
        [25803] = {
            description = "You thoroughly search this cluster of murloc hovels, and find no trace of the " ..
                "Menethil statuette.\n\nPerhaps one of the two nearby hovels to the north and northeast " ..
                "will have more clues.",
            rewardItems = {{422, 1}},
            rewardMoney = 700,
        },
        [25804] = {
            description = "This grouping of murloc hovels, after a thorough inspection, reveals " ..
                "nothing.\n\n...but you're certain that the next clue you find will be fruitful.\n\nOne " ..
                "of the hovels to the north must have the Menethil statuette!",
            rewardMoney = 700,
        },
        [25805] = {
            description = "After pulling the barrel free from the muck and opening it, a silvery figurine " ..
                "is found packed in fine straw. It depicts a young, long-haired paladin with hammer " ..
                "upraised.\n\nThis must be the Menethil statuette! You must now return it to Karl Boran " ..
                "in Menethil Harbor.",
            rewardChoices = {{59083, 1}, {59084, 1}, {59085, 1}},
            rewardMoney = 3000,
        },
        [25806] = {
            description = "Ah, the Explorers' League - such a profound group of morons. Not only do we " ..
                "have tauren ghosts up our butts, the Explorers' League has also managed to open up a " ..
                "backdoor to the primary Horde base in Stonetalon, Krom'gar Fortress.\n\nNow we've got " ..
                "Krom'gar assassins silently executing everyone in the mine.\n\nI need you to head in " ..
                "there and clean house.\n\nI almost forgot to give you these goggles. Put them on " ..
                "immediately. They'll make all the stealthed assassins in the mine plainly visible.",
        },
        [25807] = {
            description = "I'm convinced that YOU are the herald of Aviana, <name>. It was you who first " ..
                "saw her and rescued her essence from the claws of a dragon.\n\nYes, I believe Aviana is " ..
                "to be reborn into our world. And you shall have the honor of ushering her over the " ..
                "threshold.\n\nTake this incense and burn it before Aviana 's egg in the room just above " ..
                "me.\n\nThe ancient awaits, <name>. Our deliverance is here!",
            rewardChoices = {{57336, 1}, {57337, 1}, {57335, 1}},
        },
        [25808] = {
            description = "<The Gnomecorder crackles with energy. You can hear Lieutenant Paulson on the " ..
                "other end.>\n\nStupid gnome junk... Is ANYBODY there? <name>, are you there?\n\nMaybe " ..
                "<he's/she's> dead.\n\nListen, if you can still hear me, we just got word that a Horde " ..
                "master assassin is in the mines, directing the other assassins. Find her, kill her, " ..
                "report back to me.\n\nPaulson, out.",
            rewardChoices = {{57444, 1}, {57445, 1}, {57446, 1}, {57447, 1}},
        },
        [25809] = {
            description = "Horde monsters!\n\n< Corporal Wocard spits.>\n\nLook at this place! They've " ..
                "wiped out innocents! Civilians!\n\nListen, <name>, you've got to help us. Go into the " ..
                "Deep Reaches and look for surviving miners. If any are still alive they're probably " ..
                "scared witless! Check in the nooks and crannies of the mine. Maybe in mine carts! There " ..
                "are bound to be some left alive and in hiding.",
            rewardMoney = 5000,
        },
        [25810] = {
            description = "<name>! Choluna spoke true: the goddess has returned! A miracle in our " ..
                "midst.\n\nWhile you were able to kill the twilight dragon Sethria, we have not yet " ..
                "located all of the eggs that the harpies had delivered to her. Thisalee and I have " ..
                "tracked them to a great hatchery constructed within the Firelands. It is not of this " ..
                "realm, so Aviana cannot accompany you.\n\nFly south and enter the flamegate in the " ..
                "center of the valley. Farden Talonshrike has been sent ahead and will be waiting for you " ..
                "within.",
            rewardMoney = 7800,
        },
        [25811] = {
            description = "To bring this mine down you're gonna need to blow up her support beams. I can " ..
                "provide you with the explosives you'll need, but you're gonna have to trudge through " ..
                "Krom'gar assassins to get to all of the beams.\n\nThe good news, if any exists, is that " ..
                "we always mark our support beams with a big 'X.' Look for the markers and plant this " ..
                "dynamite near 'em. Once you've planted all the dynamite come on back up here and I'll " ..
                "activate the explosives.\n\nKaboom!",
            rewardChoices = {{57443, 1}, {57442, 1}},
        },
        [25812] = {
            description = "Hurry, <name>!\n\nMake your way to that cavern at once.\n\nWe shall go behind " ..
                "you to ensure that you are not followed.",
        },
        [25813] = {
            description = "That old, bitter centaur, Skycaller Vrakthris, mentioned a great air spirit " ..
                "that the centaur worship. To secure the Heights, the last step is for us to deal with " ..
                "this thing.\n\nI've seen them blow the giant horn at the top of the hill up there and an " ..
                "air elemental came down. It gave them orders and then dissipated.\n\nGo blow that horn, " ..
                "<name>.",
            rewardMoney = 11500,
        },
        [25814] = {rewardMoney = 11500},
        [25815] = {
            description = "I was once First Mate on the Wave Mistress, ship-of-the-line in the Kul Tiras " ..
                "Third Fleet. The Doomed Fleet. Doomed, for on its last voyage the fleet was attacked by " ..
                "red dragons. Dragons controlled by orcs!\n\nWe didn't stand a chance against that " ..
                "dragonfire...and our fleet was burned and sunk off this here coast. I'm the sole " ..
                "survivor of those poor vessels...\n\n...Bring me my mead, <class>. It's down in the " ..
                "cellar of the inn. As far away as I put it from me, I can't go without it in the end.",
            rewardMoney = 700,
        },
        [25816] = {
            description = "<Bolstered, Fitzsimmons continues his tale...>\n\nI am the sole survivor of " ..
                "the ill-fated Third Fleet of Kul Tiras, wrecked off the coast to the north. On one of " ..
                "our ships was hidden a great, and terrible treasure, and the eerie power of it keeps the " ..
                "souls of my brothers trapped within the ships' rotting hulls.\n\nI'm haunted by them day " ..
                "and night. First Mate Snellig calls for me! He's supposed to be dead! Please, <name>, " ..
                "look for him near the shipwrecks and just...tell him to leave me alone!",
        },
        [25817] = {
            description = "The sailors of the Third Fleet are damned, forever cursed to wander these " ..
                "shores in agony. Fitzsimmons' anguish is tied to us; so long as we suffer, there can be " ..
                "no rest for him, either.\n\nYou must end the suffering of my crewmates' spirits. Purge " ..
                "their ghosts from this plane, and return to me.",
            rewardChoices = {{59086, 1}, {59087, 1}, {59088, 1}, {59089, 1}},
            rewardMoney = 1400,
        },
        [25818] = {
            description = "To break the curse, there must be a reckoning. Captain Halyndor damned us all " ..
                "to covet a forbidden artifact; the Eye of Paleth. His spirit still covets it, standing " ..
                "guard over the strongbox of his old ship, the Intrepid.\n\nVanquish the soul of the one " ..
                "who cursed us so, <class>. Defeat the Captain, claim his key, and spirit the Eye of " ..
                "Paleth far from this place.",
        },
        [25819] = {
            description = "Opening the chest reveals a blackened orb, pulsing with an eerie light. This " ..
                "must be the foul Eye of Paleth that damned these sailors' souls.\n\nSuch corruption " ..
                "should be purged. Perhaps a priest in Menethil Harbor could help you.",
            rewardChoices = {{59090, 1}, {59091, 1}, {59092, 1}},
            rewardMoney = 1500,
        },
        [25820] = {
            description = "My son Gimlok's the light of my life. It warms my heart to see him playin' " ..
                "with the other children.\n\nI can't help but worry, though. There's sharks not but a few " ..
                "feet away in the bay. If it's deep enough for one to swim its way here...\n\nI can't " ..
                "bear it! Please, you're clearly one <race> that's seen tougher situations than us " ..
                "townsfolk. Would you get rid of those nasty sharks for me? At least a few?",
            rewardMoney = 1400,
        },
        [25821] = {
            description = "You've done an admirable job down here, <name>. Force Commander Valen has " ..
                "taken notice and requested that you see him immediately. He's got a special mission " ..
                "lined up for you - one that'll hopefully put a cold stop on the Horde's incursion into " ..
                "Stonetalon.",
        },
        [25822] = {
            description = "I am going to need to put you in harm's way once more, <name>. To the east you " ..
                "will find a mineral rich excavation site that was recently overrun by the Horde. At that " ..
                "site are crates of our weaponry, scattered about all over the place. The Horde has only " ..
                "recently taken over, so it is unlikely that they've found all of our supplies.\n\nGet in " ..
                "there and get our Grimtotem friends some weapons!",
            rewardChoices = {{57448, 1}, {57449, 1}, {57450, 1}},
            rewardMoney = 2500,
        },
        [25823] = {
            description = "While it is of utmost importance that you secure weapon crates immediately, we " ..
                "need the Unearthed Grounds to the east clear of Horde. If we are to open a supply line " ..
                "for our Grimtotem allies, we're going to need full access to the dig site.\n\nKill all " ..
                "Horde that you come across at the Unearthed Grounds, <name>. For the glory of the " ..
                "Alliance!",
            rewardMoney = 2500,
        },
        [25824] = {
            description = "This soldier was near death, but I fear we do not have the time to await his " ..
                "full recovery. He has information we desperately need to know.\n\nBe patient with him, " ..
                "but keep him talking until we've learned all that we can.\n\nWith luck we might discover " ..
                "just what we're up against...",
        },
        [25825] = {
            description = "Alright, <name>, I need you to get this oil back to Fizzle on the Speedbarge, " ..
                "and let him know the good news!",
            rewardChoices = {{63611, 1}, {63612, 1}, {63613, 1}},
        },
        [25830] = {
            description = "You have awakened the ancients, <name>, but the wilderness spirit Aessina " ..
                "remains silent. With her help, we can turn the tide of this attack and undo the damage " ..
                "Twilight's Hammer has done.\n\nThere may be one who can help us. The oldest of the " ..
                "trees, Nordu, stood in the center of what is now the Flamewake for thousands of years. " ..
                "His wisdom is as old as this mountain. If that old tree still lives, perhaps he can " ..
                "awaken Aessina... seek him out.",
        },
        [25832] = {
            description = "<name>, you've done all you can here. This whole cavern is about to collapse " ..
                "in on itself!\n\nI'll gather up the last of our feathered steeds and ensure that the " ..
                "flamegate is sealed behind me.\n\nYou should go on ahead and let Aviana know that this " ..
                "abominable hatchery is no more!",
            rewardChoices = {{57271, 1}, {57272, 1}, {57273, 1}},
            rewardMoney = 7800,
        },
        [25834] = {
            description = "Can you hear them fighting down below, <name>? It would appear that the " ..
                "Grimtotem tauren are no longer in the good graces of the Horde. I don't know what " ..
                "happened, but we can turn this to our advantage.\n\nI will arrange a meeting with an " ..
                "ambassador from the Grimtotem. What I need you to do is put together a peaceful " ..
                "offering.\n\n< Force Commander Valen points to Cookie.>\n\nTalk to \"Cookie,\" <name>. " ..
                "He's already been briefed on what we need to do.",
        },
        [25835] = {
            description = "Alas, it's time for you to leave. How quickly the chicks fall from the nest. " ..
                "Or, something.\n\nAnyway, you've done solid work here, my friend, but Quentin and the " ..
                "night elves have been crying that they urgently need your help with the Grimtotem at " ..
                "Freewind Post to the northwest.\n\nIf you ask me, it's a lost cause, but who knows... " ..
                "maybe with your help they'll actually succeed?",
        },
        [25837] = {
            description = "To make the perfect peace offerin', I be needing the following " ..
                "ingredients:\n\nKalimdor eagle eggs, obtained from Kalimdor eagle nests. They be " ..
                "scattered about the forest to the west.\n\nRam haunches! You'll find ram haunches on " ..
                "Stonetalon rams.\n\nThe last ingredient be a little tougher to come by, but we be " ..
                "needin' it to make the ramlette. Head southwest to Boulderslide Canyon and find the " ..
                "kobold caves. Kill the kobolds and take their special cheese.\n\nBring it all back and " ..
                "I'll cook up a masterpiece!",
            rewardItems = {{57519, 1}},
        },
        [25838] = {
            description = "With your help, we've managed to push toward Frostmane Retreat. Our forces " ..
                "will soon be in position to dwindle down the Frostmane trolls' reserves, leaving their " ..
                "village open to attack.\n\nThat's where the Gnomeregan covert ops team comes in. Their " ..
                "technicians have figured out a way to deploy operatives behind enemy lines without " ..
                "alerting the Frostmanes to our presence. Head to Steelgrill's Depot, just northeast of " ..
                "town, and speak with Delber Cranktoggle. He'll tell you more about it.",
        },
        [25839] = {
            description = "The cataclysm has brought our enemies closer to home, so the chief of " ..
                "Gnomeregan covert operations asked me to build a device to dispatch personnel quickly " ..
                "and quietly to any corner of Dun Morogh.\n\nBehold, the ultrasafe personnel " ..
                "launcher!\n\nWith a jolt of electricity and the benefit of a VLD parachute system, uh, " ..
                "that's 'very late deployment' for you laymen, this baby'll get you to the front in no " ..
                "time. Just hop aboard and prepare for flight! Slamp Wobblecog will be waiting for you in " ..
                "the drop zone.",
            rewardMoney = 175,
        },
        [25840] = {
            description = "The Frostmane chieftain died in the initial trogg onslaught, but they've been " ..
                "led by a well-respected warrior ever since. Battok the Berserker was the one who " ..
                "organized the Frostmane retreat, the construction of the new village, and the strikes " ..
                "against Kharanos and the mountaineers.\n\nIf we remove Battok, the Frostmanes' " ..
                "organization should crumble, leaving the mountaineers free to pick off the survivors. " ..
                "Battok will be in the village, just east of here.",
            rewardChoices = {{57554, 1}, {57555, 1}},
            rewardMoney = 225,
        },
        [25841] = {
            description = "Delber's technicians have been up day and night helping us prepare for this " ..
                "strike. Aside from building and tuning the personnel launcher, his men have prepared the " ..
                "covert operations air wing for a strike on Frostmane Retreat. They'll be waiting for a " ..
                "signal to begin their strikes.\n\nTake this flare with you, and set it off near the " ..
                "cluster of buildings at the northern end of the village, and the buildings at the " ..
                "southern end of the village. The flying machines will make a quick strike at each site.",
            rewardMoney = 225,
        },
        [25842] = {
            description = "It is... too late for me. Burned to all but the core. I have lived eons... yet " ..
                "still my end seems sudden.\n\nNew life can spring from old. I still have wisdom to pass " ..
                "on. Please... do not let them take me before my work is done.\n\nKeep the tormentors at " ..
                "bay... just a little longer, <class>.\n\nGive me minutes, and I will give you a thousand " ..
                "lifetimes.",
        },
        [25843] = {
            description = "The mountain blooms again! If we act quickly, we can press our " ..
                "advantage.\n\nOur old friend Tortolla, the turtle ancient, is already on the move. At " ..
                "his own pace, of course...\n\nFind Tortolla east of here, at the head of the path " ..
                "leading down into the scorched plains. Our strongholds there fell early in the campaign, " ..
                "but perhaps now we can reclaim them.",
            rewardMoney = 7800,
        },
        [25844] = {
            description = "You heard the commander, <name>. Deliver me perfect offerin' to the Grimtotem " ..
                "ambassador! Him and his crew be waitin' for you at the bottom of the southeastern " ..
                "path.\n\nThis is sure to put us in the good graces of their chieftain!",
        },
        [25845] = {
            description = "Grimtotem need weapons! The Horde, empowered by their Warchief and with the " ..
                "help of their new goblin allies, have amassed powerful weaponry. Our armaments are " ..
                "simply no match for their firepower. Supply the Grimtotem with strong weapons and we " ..
                "will work together to destroy the Horde!\n\nThese are our demands! Supply the Grimtotem " ..
                "and we will fight for the Alliance!",
        },
        [25846] = {
            description = "The Grimtotem chieftain awaits your arrival, <name>. Take the weapon crates " ..
                "with you and head to Grimtotem Post, south of here.\n\nGood luck, <name>. Should " ..
                "anything happen to you I will personally notify your next of kin and let King Wrynn know " ..
                "what you have done for the Alliance.",
        },
        [25847] = {
            description = "Throughout all of Greatwood Vale you will find Grimtotem under attack by the " ..
                "Horde. Hellscream's armies show no mercy and no compassion, killing anything that stands " ..
                "in their way.\n\nBut no more! Take the armaments you brought for us and find Grimtotem " ..
                "in battle with the Horde. Give them the weapons of the Alliance and watch as they " ..
                "destroy their Horde assailants! Go, there is much work to do, ally.",
            rewardMoney = 2500,
        },
        [25848] = {
            description = "By the time that we received word that Hellscream had sent another mag'har orc " ..
                "to oversee the Horde troops in southern Stonetalon, it was too late. Camp Aparaje was " ..
                "burned to the ground and all Grimtotem in the area incinerated.\n\nNow the Horde have " ..
                "four of their most fearsome generals commanding the battle for Greatwood Vale, including " ..
                "the mag'har, General Glubgok.\n\nYou must travel to the ruins of Camp Aparaje, south of " ..
                "here, and kill the generals. We stop the Horde NOW! Return to me with their mark!",
            rewardMoney = 8000,
        },
        [25849] = {
            description = "Listen, <lad/lass>, any good archaeologists know the risks that come with the " ..
                "job. If you don't unearth an ancient evil or get cursed by wicked spirits at least once " ..
                "in your career, you're not digging up anything worthwhile!\n\nNo, the real " ..
                "archaeologists know that a little thing like fossilized bones reanimating into skeletal " ..
                "creatures is no reason to stop working.\n\nI still need those fossil bones. Collect 'em " ..
                "from the fossil monsters roaming around and bring them back to me, and I'll reward you.",
            rewardMoney = 1500,
        },
        [25850] = {
            description = "In case you didn't notice, the land here in the Wetlands is pretty messed up. " ..
                "Floods, earthquakes... and on top of it all, even the ground's got a wild hair now.\n\nI " ..
                "never thought we'd be attacked by our own dig site, but sure enough, big chunks of it " ..
                "are now rampaging around trying to flatten any dwarf they see.\n\nYou look like a " ..
                "strong, strapping young <race>... mind going down there and slapping some sense into the " ..
                "clods?",
            rewardMoney = 1500,
        },
        [25851] = {
            description = "Return now to your leader and tell him all that you have done for the " ..
                "Grimtotem. Tell him that the Alliance may pass freely across our borders.",
            rewardChoices = {{57466, 1}, {57467, 1}, {57468, 1}, {57465, 1}},
        },
        [25852] = {
            description = "Pack up your gear, <name>, it's time to join up with the rest of the " ..
                "Northwatch forces in Southern Barrens. Your first mission in Southern Barrens should be " ..
                "fairly straightforward.\n\nTwo days ago we received a distress signal from Commander " ..
                "Walpole. He and his battalion are pinned down in Stonetalon Pass, just outside of " ..
                "Honor's Stand. They've got Horde all over the place! Get there and help him out. I'll " ..
                "forward news of our alliance with the Grimtotem to Northwatch command.",
        },
        [25853] = {
            description = "I'm in charge of supplying this dig. It's not that bad, but having to pick up " ..
                "and move out so fast wasn't exactly ideal!\n\nArchaeologists need tools, you know. You " ..
                "can't run around pulling up priceless antiquities with your bare hands. If you're going " ..
                "back to the dig site, can you bring back the tools that got left behind?",
            rewardChoices = {{59103, 1}, {59104, 1}, {59105, 1}, {60338, 1}},
            rewardMoney = 1500,
        },
        [25854] = {
            description = "Have you heard some raptors are intelligent enough to be domesticated? It's " ..
                "true! I've seen hunters tame them.\n\nIt gets quite lonely out here, you know, even with " ..
                "Wenna to keep me company... a pet's just what I need to brighten my spirits. A little " ..
                "baby raptor would be the best!\n\nIf you're out there slaughtering the adults, would you " ..
                "mind bringing me back some mature eggs? You can tell if they're ready to hatch by the " ..
                "wobbling.",
            rewardMoney = 1500,
        },
        [25855] = {
            description = "I've been coming up short on parts recently for my engineering projects, and " ..
                "the other day I finally saw why: the Mosshide gnolls have been making off with " ..
                "them!\n\nI don't have any idea what they could possibly want them for, but I need those " ..
                "gizmos back. They're probably strewn all over the marsh by now, but if you see any, " ..
                "could you gather them and bring them back?",
            rewardMoney = 1500,
        },
        [25856] = {
            description = "I've skinned crocs in the wetlands for years, <class>. Things have changed " ..
                "though.\n\nYou see, not to bore you with a sob story, but when the cataclysm flooded " ..
                "Menethil Harbor, our house went with it. My wife and kids don't have a place to stay, " ..
                "and I need to make as much money as I can to get us under a roof again.\n\nI've been " ..
                "skinning crocs 'til I was too tired to move, but I still need more skins to sell. If you " ..
                "bring me some croc hides, I'll pay you a bit for them.",
            rewardMoney = 1500,
        },
        [25857] = {
            description = "I've been tempted to go after the big kill... the largest crocolisk out there, " ..
                "Horrorjaw. His hide alone would be enough to get my family out of this hole.\n\nBut I'm " ..
                "no fool. One mistake and I could lose a leg, or my life, and then where would my wife " ..
                "and kids be? Still homeless and without a father to care for them.\n\nIt's not my " ..
                "proudest moment, but I'll pick my family's safety over pride any day. Please, <class>... " ..
                "hunt Horrorjaw for me. You'll find him in his shady pool to the north, lurking.",
            rewardMoney = 800,
        },
        [25858] = {
            description = "Lady Sira'kess has begun preparations for the ritual of summoning, but the " ..
                "Crucible of Nazsharin has been stolen from us. The Kvaldir have surely taken it with " ..
                "them as they retreated to shallower waters.\n\nSpeak to the caste leaders to secure a " ..
                "war party, and then lead them in retrieving the artifact from Biel'aran Ridge to the " ..
                "east.\n\nI trust you my Battlemaiden, for you have never failed in any task that I have " ..
                "given you. As I am revered to the Queen, so are you revered to me. Go with my blessings.",
        },
        [25859] = {
            description = "I know that you, like our revered lady, have unfortunate streaks of mercy that " ..
                "you succumb to at times. I would advise against such kindnesses this day. The Kvaldir " ..
                "are proud, and they will strike back if we do not cripple them completely. Kill all that " ..
                "you find.\n\nSadly, I have the inglorious task of making sure none return to the city, " ..
                "so you can go have all of the fun. I will cheer you on though, of course.",
        },
        [25860] = {
            description = "We are to begin the ritual immediately, and you are to see to it that we are " ..
                "not interrupted.\n\nSlaughter any Kvaldir that enter the temple. See to it that my " ..
                "priestesses live to see their task complete, no matter the cost.",
        },
        [25861] = {
            description = "The High-Shaman are in the buildings nearby, chanting and taunting, but not " ..
                "daring to approach me. These Kvaldir find their courage and strength only in the mist. " ..
                "They are a pitiful nuisance beneath the waves.\n\nI came bearing a message. If your " ..
                "ladyship has the time, bring a high-shaman to my feet that I might deliver this message " ..
                "to him and his people.",
        },
        [25862] = {
            description = "Our revered lady has sent me to aid you in your task. She wants you to " ..
                "retrieve the stolen Crucible of Nazsharin and bring it back here as soon as you " ..
                "can.\n\nShe grows impatient to start the ritual of summoning so that we might fully " ..
                "begin our preparations for war.",
        },
        [25863] = {
            description = "With the Crucible of Nazsharin, all that remains is to inform Lady Naz'jar of " ..
                "your success.",
        },
        [25864] = {
            description = "We've been getting more and more reports of raptor attacks in the area. I'm " ..
                "seeing to it that this place is safe enough for more settlement to start occuring, so " ..
                "I've put a bounty on the buggers.\n\nA lot have been cleared out already, but the " ..
                "Highland raptors to the north have been growing in number. That won't be true for long, " ..
                "now will it?\n\nClear out a good deal of Highland raptors, and I'll have a nice reward " ..
                "for you.",
            rewardChoices = {{59093, 1}, {59094, 1}, {59095, 1}},
            rewardMoney = 1500,
        },
        [25865] = {
            description = "You seem trustworthy enough to help me out with my real problem, <name>. I was " ..
                "sent here by Ironforge to recover a shipment of gold ingots.\n\nThe ingots are part of " ..
                "the Ironforge Royal Treasury, stamped with the royal seal... only an idiot would steal " ..
                "them for profit, far too easy to trace. Oddly enough, this area is full of idiots: " ..
                "Mosshide gnolls.\n\nI don't know how many gnolls you've fought before, but they're foul " ..
                "and brutal beasts, and dangerous. I need you to slay them and recover the missing ingots.",
            rewardChoices = {{59097, 1}, {59098, 1}, {59096, 1}},
            rewardMoney = 1500,
        },
        [25866] = {
            description = "You may have seen them while you were out, but the Dark Iron clan has been " ..
                "spotted in this area. They're never up to any good, and it looks like they're kidnapping " ..
                "the Mosshide gnolls for some reason.\n\nI don't know what their game is, but we're " ..
                "putting a stop to this before more foul play occurs. Go and stop them.\n\nAnd if you're " ..
                "worried about fairness, try askin' them politely first and see how far that gets you.",
            rewardMoney = 1500,
        },
        [25867] = {
            description = "I know we were just attacking the gnolls ourselves, but I'm not about to let " ..
                "the Dark Iron capture them as slaves. For one, we found the thieves and took back what " ..
                "was missing, so justice is served; for another, whatever work the Dark Iron will be " ..
                "putting them to isn't something I want to allow.\n\nEither way, the gnolls need to be " ..
                "freed. The trappers should have keys on them, so use those to open the cages.",
            rewardMoney = 1500,
        },
        [25868] = {
            description = "I've found out who's pulling the strings on this operation here. Yorla " ..
                "Darksnare is directing the Dark Iron dwarves from a camp to the east, and it might've " ..
                "been orders to have the gnolls steal Ironforge's gold in the first place.\n\nWhat's " ..
                "more, she's a wanted criminal... she's been inciting rebellion and attacks against " ..
                "Ironforge since Magni was still alive.\n\nShe can't slip through our fingers this time, " ..
                "<name>. Go and get her!",
            rewardChoices = {{59099, 1}, {59100, 1}, {59101, 1}, {59102, 1}},
            rewardMoney = 3000,
        },
        [25869] = {
            description = "The journey ahead must begin with you killing the Grimtotem invaders at " ..
                "Freewind Post. If you can't stop them here, we won't be able to move into their " ..
                "territory.",
            rewardMoney = 5500,
        },
        [25870] = {rewardMoney = 5500},
        [25871] = {
            description = "<Brienna waves a note around with Taur-ahe markings on it.>\n\nThose monsters " ..
                "have captured one of our sentinels! They're threatening to kill her if we don't pull " ..
                "back!\n\nWe don't negotiate with cowardly beasts! Please, if you can, rescue her before " ..
                "it's too late, <class>.",
            rewardMoney = 5500,
        },
        [25872] = {rewardMoney = 5500},
        [25873] = {
            description = "Here lies the broken body of the Freewind Post lorekeeper, Montarr. The aged " ..
                "tauren's body is broken, lying in a pool of his own blood.\n\nA trail of droplets leads " ..
                "back to the inn....",
            rewardItems = {{63632, 1}},
            rewardMoney = 12000,
        },
        [25874] = {rewardMoney = 12000},
        [25875] = {
            description = "Mirkfallon Lake is crawling with Horde. The goblins have set up shop and they " ..
                "aren't going to leave until all the oil under Stonetalon is sucked dry.\n\nThankfully I " ..
                "have a gnome on the inside that's been collecting information for us. If anyone knows " ..
                "what's going on with that bomb, it's my inside gnome.\n\nMake your way to the " ..
                "Sludgewerks, north of here, and find Minx. She'll be disguised as a \"goblin\" pump " ..
                "controller.",
        },
        [25876] = {
            description = "Listen, I've been tracking this bomb since you rescued me in Ashenvale. " ..
                "Whatever they're doing with it is going to happen real soon.\n\nAt the top of the large " ..
                "oil rig is a control room. Inside that control room you'll find a Krom'gar log book. " ..
                "That log book is the key to where this bomb is heading. Get up there and get the log " ..
                "book! Bring it back here and I'll decipher it for you.",
        },
        [25877] = {
            description = "RUN! Get out of here, <name>. Get back to Barus and inform him of what you've " ..
                "discovered. He'll arrange for you to get safely across Battlescar Valley to Thal'darah " ..
                "Overlook.\n\nIt's not too late to save those young druids!",
            rewardChoices = {{57438, 1}, {57439, 1}, {57440, 1}},
        },
        [25878] = {
            description = "Goblins... What would this world be without goblins? I'll tell you what: " ..
                "CLEAN!\n\nThose filthy little scum suckers have planted their oil pumps all over the " ..
                "lake with the hope of extracting every last drop of oil that exists in Stonetalon. At " ..
                "each oil pump they've stationed an oil pump controller whose sole job it is to watch the " ..
                "pump and make sure nothing goes wrong.\n\nSomething is about to go wrong.\n\nTake out " ..
                "the goblin pump controllers and take their pump controls. Use 'em to overload the pumps!",
            rewardChoices = {{57451, 1}, {57452, 1}, {57453, 1}},
            rewardMoney = 2500,
        },
        [25879] = {
            description = "Ever seen a hobgoblin? They're another vile goblin creation. Take a goblin, " ..
                "make it even uglier, fatter, bigger and stupider and you have a hobgoblin. Add to all of " ..
                "that a nasty mean streak and we've got a problem.\n\nThese lumbering oafs wander the " ..
                "Sludgewerks and Mirkfallon Lake, acting as muscle to the goblins.\n\nGet out there and " ..
                "thin 'em out. Permanently.",
        },
        [25880] = {
            description = "There are dozens of students at Thal'darah Grove. Most of them have no means " ..
                "of defending themselves, ripe for the slaughter.\n\nYou must get word to Master " ..
                "Thal'darah of the Horde's plans. He will direct you in what you must do next.\n\nFiora " ..
                "Moonsoar has granted you the use of her fastest hippogryph. Take it now to Thal'darah " ..
                "Overlook! Don't look back, <name>! The Horde must be stopped!",
        },
        [25881] = {
            description = "We held out as long as we could, <class>. But the flames... the heat... We " ..
                "lost the whole town.\n\nCaptain Irontree refused to pull back when the flames engulfed " ..
                "us. Our forces are scattered. Maybe some of the others survived? We can mount a " ..
                "counter-attack!\n\nGo into the Scorched Plain and rescue any lost wardens that got " ..
                "separated from the group. Then find Captain Irontree - he's probably taken up a " ..
                "fortified position in the middle of the fighting.",
            rewardMoney = 78000,
        },
        [25882] = {
            description = "Captain Tharran asked me to pass along his thanks for your help and " ..
                "congratulations on a successful mission. He and his men are cleaning up the last of the " ..
                "trolls and tending to the wounded.\n\nHe also wanted me to ask you to check out reports " ..
                "about troll raids on the Amberstill Ranch to the north. Ask for Sergeant Flinthammer " ..
                "when you arrive.",
        },
        [25883] = {
            description = "Naga weapons...\n\nAs you cast your vision on the naga Holding Pens, you see " ..
                "dozens of similar stacks of tridents positioned strategically.\n\nDestroying their " ..
                "weapons could only hamper whatever wicked designs they are carrying out in this region...",
        },
        [25884] = {
            description = "Oh fer the love of...\n\nI know our survivor friend here means well, but the " ..
                "lad's been severely traumatized.\n\nThere only be one way ta deal with these accursed " ..
                "beasts, an' that be a fine dwarven axe buried hilt-deep in the noggin.\n\nPile up enough " ..
                "o' their corpses an' they'll think twice before fiddlin' with yer tasty bits.\n\nMark me " ..
                "words <laddie/lassie>, them buggers don't like the sight o' their own blood any more " ..
                "than you or I.\n\nNow git out there an' give 'em what fer!",
            rewardChoices = {{59776, 1}, {59777, 1}, {59778, 1}},
            rewardMoney = 78000,
        },
        [25885] = {
            description = "Wha...what IS this!?\n\nThere's great pain growing... from deep in my " ..
                "bowels.\n\nI think... ugh... they must have poisoned me!\n\nThey fed us strangely " ..
                "glowing seaweed that they grow around their stronghold...\n\nI think these cramps will " ..
                "worsen if I don't get more soon...\n\nPlease, <race>. Try to find me some!",
        },
        [25886] = {
            description = "It looks like most of the Twilight's Hammer has fallen back to regroup for " ..
                "another assault. Their most dedicated are staying behind to hold the line. This is our " ..
                "chance to whittle away at their leadership.\n\nRange out along the Scorched Plain and " ..
                "crush the Twilight Field Captains. We'll remove them from the equation!",
            rewardMoney = 78000,
        },
        [25887] = {
            description = "Our time here draws to a close. I must somehow follow the trail of these naga " ..
                "captives if we are to discover their purposes in this region.\n\nBut before I move on, I " ..
                "would see the destruction of this operation!\n\nNevermind their numbers, I have a plan " ..
                "that has the potential to even the odds.\n\nOutside this cave, famished great sharks, " ..
                "displaced by these naga, seek food.\n\nIn their weakened state, they will be susceptible " ..
                "to suggestion. Use this orb to subdue them, then direct them against our enemy.",
            rewardMoney = 78000,
        },
        [25888] = {
            description = "I simply cannot bear the thought of so many others like this soldier " ..
                "imprisoned, surrounded by naga.\n\nSomething must be done to rescue them!\n\nTry this, " ..
                "<name>. Use it on the prison cells to make them buoyant.\n\nIf we can get them to the " ..
                "surface, at least they stand a chance at being rescued.",
            rewardChoices = {{59773, 1}, {59774, 1}, {59775, 1}},
            rewardMoney = 78000,
        },
        [25889] = {
            description = "My poor, defenseless young students are stranded at Thal'darah Grove. With the " ..
                "battle raging across Battlescar Valley, they have no means of escaping. We must save the " ..
                "children before the Horde drops their bomb!\n\nTake my hippogryph and use it to rescue " ..
                "the young druids of Thal'darah Grove. Drop them off at the hippogryph post here in " ..
                "town.\n\nSave them all, <name>! You truly are our only hope.",
            rewardChoices = {{57459, 1}, {57460, 1}, {57458, 1}},
        },
        [25890] = {
            description = "It is clear to me at this point what must be done, <name>.\n\nThe naga can " ..
                "only be obtaining these pearls from one place: Nespirah, the ancient, shelled creature " ..
                "that rests outside of this cave. Why Nespirah would submit to the naga, however, is " ..
                "beyond my understanding.\n\nWe can enter Nespirah's body cavity through a small tube " ..
                "near the exit to this cave. I must first fetch my master, then we can meet you on the " ..
                "inside. We will convene in Nespirah's northwestern entrance.",
            rewardMoney = 7800,
        },
        [25891] = {
            description = "The Horde have signaled a retreat. Look now, they fall back from the field of " ..
                "battle - portends of disaster.\n\nWe must make one final descent into Thal'darah Grove. " ..
                "I could not live with myself if any of our young druids were left behind.\n\nAssist me, " ..
                "hero. I will take the reins. You search for any druids that might be left behind.\n\nWe " ..
                "will go when you are ready.",
        },
        [25892] = {
            description = "You'll have to catch me up more later. Right now, we need to get out of here " ..
                "before more naga push in. Make your way back to the forward post on the level below " ..
                "us.\n\nTake my sea horse. We will meet you back there shortly.",
            rewardMoney = 78000,
        },
        [25893] = {
            description = "Jorlan and Hexascrub left to find a way to contact help. The trade lanes " ..
                "aren't far, so there might be a chance of success, but I'm wary to let anyone get their " ..
                "hopes up.\n\nIn truth, we don't have any other options. We're not likely to last much " ..
                "longer here. The naga will find us eventually, and... well... you saw how many of them " ..
                "there were.\n\nYou should go find the two of them on Biel'aran Ridge to the southeast. " ..
                "I'll keep everyone here safe as long as I can.",
            rewardMoney = 19500,
        },
        [25894] = {
            description = "Hexascrub came out here with a balloon of some sort that he retrieved from one " ..
                "of our ships. He tried to float it to the top, but those Muckskin Scroungers came out of " ..
                "nowhere and swarmed the thing.\n\nHe's got an idea for another balloon, but we need to " ..
                "make sure that the past doesn't repeat itself. I need you to kill off those gill " ..
                "goblins. Or at the very least, enough of them to make them a bit more wary of us.",
            rewardMoney = 78000,
        },
        [25895] = {
            description = "We must always come prepared. Prepared with gear. Prepared with plans. " ..
                "Prepared with gear plans!\n\nAll of the ships in all of the Alliance fleets stow a " ..
                "survival kit. A lot of our tools came from a survival kit. My balloon came from a " ..
                "survival kit too! But now it's gone. I need another survival kit!\n\nThere's a ship to " ..
                "the southeastish. Let's hope that the survivors were dumb and didn't take the survival " ..
                "kit. More survival kit for us!",
            rewardChoices = {{59682, 1}, {59683, 1}, {59684, 1}},
            rewardMoney = 78000,
        },
        [25896] = {
            description = "Ah, Battlemaiden. You carry with you the word and the will of our Lady. I " ..
                "might ask a favor of you...\n\nI need Fathom-Caller Azrajar and my Tide Priestesses to " ..
                "return so that we can begin the ritual. Can you carry my will to them as such? You " ..
                "should find them spread upon the temple terrace. Azrajar will be at the stairs to the " ..
                "north.",
        },
        [25897] = {
            description = "Survival kits never have any rope. It makes no sense! No sense at all.\n\nI " ..
                "bet those Kvaldir have rope. They're always riding around in boats, tying knots, " ..
                "dressing in nets. Go take some rope from them! I must have it for our plan to work. " ..
                "Absolutely must.",
            rewardMoney = 78000,
        },
        [25898] = {
            description = "All done! I'm confident it will work. And not a scrounger in sight to pop a " ..
                "hole in it this time! Fortuitous.\n\nJorlan already swam up to catch it. Swam up and " ..
                "stopped to wait for it. He said you'd get the honors though. Jorlan's nice like " ..
                "that.\n\nGo to the top with the balloon, take the flare gun from the crate, and scan the " ..
                "horizon for Alliance ships. If you see any, fire the flare towards them. That's it! All " ..
                "there is to it.\n\nSwim. Float. Flare. Rescue! That last part's my favorite.",
            rewardMoney = 78000,
        },
        [25899] = {
            description = "The fiery army that caused so much devastation up the hill has retreated east " ..
                "of here. Only the Scorchlords remain in action. If we can punch a hole through their " ..
                "lines to regroup with Captain Irontree 's forces, the whole offensive may " ..
                "collapse.\n\n<class>, I'm in no shape to continue fighting, but you look like you can do " ..
                "some damage. Slay those Scorchlords and regroup with Captain Irontree!",
            rewardMoney = 78000,
        },
        [25900] = {
            description = "I can't believe that Nespirah would willingly allow these naga to take " ..
                "residence inside her shell. As I see it, one of two things has happened: they have " ..
                "convinced her to willingly join their cause, or they have weakened her to a point where " ..
                "she cannot fight back. Either one is bad.\n\nHere in this chamber, I should be able to " ..
                "communicate directly with Nespirah. Let us find out for ourselves. Speak to me when you " ..
                "are prepared, <class>.",
            rewardMoney = 39000,
        },
        [25901] = {
            description = "Reinforcements! I thought we were going to fight this out to the bitter " ..
                "end.\n\nVery few of the Guardians of Hyjal remain, and our supplies are running out. The " ..
                "battlefield around our holdout here must be littered with serviceable arrows.\n\nI know " ..
                "it's beneath your abilities, but can you gather up our spent ammunition? It's the only " ..
                "way we can replenish our supplies!",
            rewardChoices = {{57345, 1}, {57347, 1}, {57346, 1}},
            rewardMoney = 78000,
        },
        [25904] = {
            description = "My Nemesis. Still lives. The servants of fire still come. We must pursue. Into " ..
                "their den.\n\nThe ogres know the way. Slay the Field Captains. Recover the Glyph of " ..
                "Opening.\n\nThis is the way.",
            rewardMoney = 78000,
        },
        [25905] = {
            description = "The rams we raise and train here at Amberstill ranch have long been the mounts " ..
                "of choice for Dun Morogh 's mountaineers. Aye, there're a few here, but not enough to " ..
                "guard my family and all the animals.\n\nA few brave Frostmane raiders have taken to " ..
                "stealing our rams under the cover of night, taking them south into the Tundrid Hills. " ..
                "Would you be willing to help return them? You'll need to get fairly close to them and " ..
                "give a sharp whistle to get their attention. Their training will take over from there.",
            rewardMoney = 225,
        },
        [25906] = {
            description = "Memorize the glyph. Take it within yourself.\n\nDraw it on the ground before " ..
                "the flamegate. East of here. Enter the Firelands.\n\nI cannot come with you. But my " ..
                "children await. Inside.\n\nFind Garunda Mountainpeak within the realm of flame.",
            rewardChoices = {{57342, 1}, {57343, 1}, {57344, 1}},
            rewardMoney = 7800,
        },
        [25907] = {
            description = "It will take me some time to break through this barrier and communicate with " ..
                "Nespirah. In the meantime, you can save some of those men that the naga have enslaved in " ..
                "the pits below.\n\n<Duarn produces a length of rope from within his robes.>\n\nThis " ..
                "should come in handy.",
            rewardMoney = 78000,
        },
        [25908] = {
            description = "I may be unable to communicate directly with the beast Nespirah, but I can " ..
                "still feel some things indirectly. For example, I can clearly sense that Nespirah is not " ..
                "happy about the naga's presence here.\n\nWhen we first entered Nespirah's body, I saw " ..
                "dozens of sentinels and enchantresses patrolling the central chamber floor. Perhaps some " ..
                "of the ancient one's pain will be alleviated if you remove them.",
            rewardChoices = {{59747, 1}, {59748, 1}, {59749, 1}},
            rewardMoney = 78000,
        },
        [25909] = {
            description = "Everything in my body tells me that Nespirah is trying to speak with me, but I " ..
                "cannot hear her. Perhaps the naga have done something to her voice.\n\n<Duarn thinks to " ..
                "himself for a moment.>\n\nNespirah's voice may be suppressed... that means... we need to " ..
                "find a voice for her!\n\nI've got it! The Idra'kess have been known to train deepseeker " ..
                "crabs as battle companions. Use this net to capture a crab, and bring it to me. You will " ..
                "likely find them prowling the chamber's outer edges.",
            rewardMoney = 59000,
        },
        [25910] = {
            description = "This cavern is an abomination, <name>. And it's filled with horrors from the " ..
                "depths.\n\nI don't want any of these - things - getting through the portal to the " ..
                "outside world. Slay everything!",
            rewardMoney = 78000,
        },
        [25911] = {
            description = "They'll probably send a skiff over, which may take a bit. I'll stay here to " ..
                "make contact.\n\nYou need to return to the cave immediately and let them know that " ..
                "rescue is on its way. We can only hope that the naga have not found them yet.\n\nGo. " ..
                "Swim fast, <name>.",
            rewardChoices = {{59676, 1}, {59677, 1}, {59678, 1}},
            rewardMoney = 39000,
        },
        [25912] = {
            description = "The world is unraveling around us, <name>. Old enemies seek to destroy us from " ..
                "one end, while ancient forces close in on the other.\n\n< Elder Sareth'na sighs.>\n\nI " ..
                "have seen better days - brighter days, and I long for them...\n\nAcross Stonetalon Peak " ..
                "lies the ruins of our old outpost - now overrun with darkness. If you happen to go that " ..
                "way, could you search for my sketch book? It holds many happy memories. I would reward " ..
                "you well for its return.",
            rewardChoices = {{57454, 1}, {57455, 1}, {57456, 1}, {57457, 1}},
        },
        [25913] = {
            description = "As the Horde were marching upon Stonetalon, I noticed that some of the " ..
                "sentinels had fallen ill. Not long after, they started acting strangely. When the first " ..
                "tentacle burst from the ground the ill sentinels began attacking us. We lost the outpost " ..
                "shortly after...\n\nThe sentinels in the peak are now nothing more than shells - husks " ..
                "for something far more sinister. I want you to put the sentinels to rest and retrieve " ..
                "their glaives. Each glaive returned can identify a fallen sister.",
            rewardMoney = 5000,
        },
        [25914] = {
            description = "Tendrils are bursting forth from the earth and terrorizing Stonetalon Peak. My " ..
                "sentinels are hardly making a dent in their numbers.\n\nI suspect that there is a force " ..
                "at the heart of Stonetalon Peak that controls the tendrils. Perhaps if we can put a stop " ..
                "to that force, the tendrils will return to the depths from whence they came!",
            rewardMoney = 2500,
        },
        [25915] = {
            description = "The dark usurper Nemesis fled here when the fires of Hyjal receded. We are not " ..
                "yet strong enough to defeat Nemesis, <name>, but we may be able to turn his own strength " ..
                "against him.\n\nI will send a child of Tortolla with you, one of the children you freed " ..
                "earlier from the Twilight's corruption.\n\nSearch the depths of this cave for a Nemesis " ..
                "Crystal, and allow the young turtle to examine it.\n\nSee me if you lose your companion!",
            rewardMoney = 78000,
        },
        [25916] = {
            description = "A trained shaman has the ability to communicate with the four elements of " ..
                "earth, fire, air and water. This is known.\n\nWhat is not as widely known, however, is " ..
                "the presence of a fifth element. This element is not as clearly described as the other " ..
                "four, but it has to do with the shared... commonality between all living " ..
                "creatures.\n\nMy theory is that the crab, as a creature of the sea, is close enough to " ..
                "Nespirah that, with the elements' coaxing, we can convince it to act as Nespirah's " ..
                "mouthpiece.",
            rewardMoney = 39000,
        },
        [25917] = {
            description = "<Duarn closes his eyes, pauses, and nods.>\n\nNespirah has just informed me " ..
                "that we are not the only people fighting inside of this shell. A small group of Alliance " ..
                "slaves has escaped and is currently fighting off the naga on the other side of the " ..
                "shell, up on the ledge that overlooks Nespirah's heart.\n\nGo find them, <name>, and see " ..
                "what help they can lend us. With their aid, we may be able to rouse Nespirah from her " ..
                "torpor.\n\nI will remain here, should you need anything.",
            rewardMoney = 39000,
        },
        [25918] = {
            description = "I honestly don't know how we've survived this long. The naga took my armor and " ..
                "weapons, and left me with rags and a mining pick... and THAT snapped in half long " ..
                "ago.\n\nIf we're to stand any hope of turning the tide, I'm going to need something to " ..
                "fight with... as will my companions, though they may be too proud to admit it.\n\nI've " ..
                "seen weapon racks in the naga storage areas nearby. I'm not accustomed to fighting with " ..
                "a trident, but it'll sure be better than fighting with my fists.",
            rewardChoices = {{59744, 1}, {59746, 1}, {59745, 1}},
            rewardMoney = 78000,
        },
        [25919] = {
            description = "< Captain Taylor listens intently to your recount of Duarn and Nespirah's " ..
                "conversation.>\n\nI see. So the creature wants our help waking it up, is that " ..
                "it?\n\nWith hundreds of slaves already picking away at her pearls, the beast seems to be " ..
                "a pretty heavy sleeper. You might have better luck, though.\n\nMy suggestion? Look " ..
                "around the creature's flesh for signs of weakness. Maybe that weapon of yours will find " ..
                "a ticklish spot and force the beast to come to its senses.",
            rewardMoney = 78000,
        },
        [25920] = {
            description = "My time in the pearl pits, however short, has made me curious about the naga's " ..
                "goals. Yes, I now know that the naga want to use Nespirah as an engine of war, but if " ..
                "that's the case, then why are they enslaving men to mine her pearls?\n\nAssuming we " ..
                "escape this creature's hull, I would very much like to study these objects. The pearls " ..
                "we found in the pits were much too large to carry, but I've seen the warlords and " ..
                "prophets occasionally carrying around smaller ones.",
            rewardMoney = 78000,
        },
        [25921] = {
            description = "My men are flagging, <name>. We won't last much longer against these naga, I'm " ..
                "afraid. With the Idra'kess' weapons, and Nespirah's pearls, we should be ready to bust " ..
                "out of here.\n\nFollow the wall to the southeast, and look for a ramp to the upper " ..
                "chamber. I assume their leader is in there, or perhaps the key to Nespirah's awakening. " ..
                "Hopefully both.\n\nIf you feel strong enough, head up to the top of the shell and look " ..
                "for some answers.",
            rewardChoices = {{59738, 1}, {59739, 1}, {59740, 1}},
            rewardMoney = 234000,
        },
        [25922] = {
            description = "Thanks to you and the Captain, Nespirah has full control of her body... but " ..
                "most of the naga don't know this yet. Once we make our escape, she will activate her " ..
                "biological defenses and destroy the naga from within.\n\nMake yourself ready... I will " ..
                "now tell Nespirah to begin the countdown.",
            rewardMoney = 78000,
        },
        [25923] = {
            description = "Your turtle companion can use this newfound power to render the two of you " ..
                "invulnerable for a short period of time. You can \"turtle up\" to avoid the worst of " ..
                "Nemesis and his fury. To do so, simply invoke this totem.\n\nThis is all I can do for " ..
                "you. Together, you and a Child of Tortolla must defeat Nemesis, once and for all. Finish " ..
                "the Usurper!\n\nReturn to me if you lose your turtle friend.",
            rewardChoices = {{57260, 1}, {57261, 1}, {57262, 1}, {57263, 1}},
            rewardMoney = 78000,
        },
        [25924] = {
            description = "Listen up, <race>!\n\nA new landmass has emerged off the coast of Eastern " ..
                "Kingdoms and we are engaged in a critical battle for control of the island!\n\nVictory " ..
                "there will leave Stormwind completely defenseless!\n\nNow is the time to " ..
                "strike!\n\nReport to the docks at once for transport to the battle.\n\nEvery warship is " ..
                "engaged, so you'll be boarding a mercenary vessel commissioned by the Warchief himself.",
        },
        [25925] = {
            description = "We must attempt to establish communication with Farwatcher Glen, to the south. " ..
                "Our Darnassian glaive throwers are at your disposal, <name>. Use them to cut a swath " ..
                "through the encroaching Horde forces and clear a path to Farwatcher Glen.\n\nI only hope " ..
                "we're not too late to save the Glen. Should Farwatcher Glen be intact, find Hierophant " ..
                "Malyk and inform him of our status.",
            rewardMoney = 8000,
        },
        [25926] = {
            description = "The mirebeasts to the west are not my brethren... they are symptoms of the " ..
                "earth's disturbance, a foulness of rot given form.\n\nYou would not understand... they " ..
                "take the shape of my kind, infested within with decaying spores, forcing out flourished " ..
                "life in the swamp. They take all and leave only rot. Nothing left, nothing " ..
                "left!\n\nSoothe my mind, <race>. Slay the mirebeasts, cleanse the land, and perhaps my " ..
                "mind will settle.",
            rewardMoney = 1800,
        },
        [25927] = {
            description = "Flame has threatened me for far too long... far too long... but it is no " ..
                "longer the little ones, no longer mere gnats...\n\nThe fields burn! The hills and " ..
                "highlands scream, <race>, they scream. The elementals brought here consume all life in " ..
                "their wake.\n\nThey cannot stand, they cannot stand. Stop them. STOP THEM! Destroy the " ..
                "bringers of flame...",
            rewardMoney = 1800,
        },
        [25928] = {
            description = "I'll escort the children of Tortolla out of here and seal up this accursed " ..
                "portal.\n\nI'll leave it to you to inform Tortolla of our victory. Simply step back " ..
                "through the flamegate. The ancient will be pleased!",
        },
        [25929] = {
            description = "Greetings, <class>. I am Erunak, a fellow survivor of this savagery.\n\nI'm " ..
                "afraid your travails have only just begun. The naga have been scouring these waters, " ..
                "attacking anyone that still lives.\n\nYou are not yet equipped to survive here, but I " ..
                "can remedy that.\n\nJust outside this ship live a special breed of starfish. Bring me " ..
                "some of them along with a conch shell. I'll prepare an enchantment that should help you " ..
                "grow accustomed to your environment.",
        },
        [25930] = {
            description = "I am told that before the great upheaval the Charred Vale was a valley, closed " ..
                "off to the sea. One has merely to look to the south to see that the Charred Vale is no " ..
                "longer a valley and in fact has become an area of great volcanic activity.\n\nSalsbury " ..
                "here has configured a device that will allow us to ascend the volcano. Use it to get to " ..
                "the top and assess the goings on.\n\nI will keep in touch with this Gnomecorder device, " ..
                "which Salsbury has so kindly gifted upon me.",
        },
        [25931] = {
            description = "<The Gnomecorder buzzes.>\n\nBe very careful, <name>. You do not want to rouse " ..
                "that black dragon.\n\nNow, look around you. If this is a nest then there must be black " ..
                "dragon eggs nearby. Search the premises for eggs and destroy any that you see.\n\nReturn " ..
                "to me should you find and destroy Seldarria's eggs.\n\nGoldrinn watch over you.",
            rewardChoices = {{57461, 1}, {57462, 1}, {57463, 1}, {57464, 1}},
        },
        [25932] = {
            description = "The reports I'm sending Captain Tharran can't really convey the amount of " ..
                "trouble the Frostmanes have created for us. Your assault on the village has started to " ..
                "relieve some of the pressure. The raids are still frequent, but the trolls don't have " ..
                "the numbers they once did.\n\nEven so, my men are tired and their morale is flagging. " ..
                "Would you help us keep watch for the Frostmane raiders? They could turn up at any time.",
            rewardChoices = {{57556, 1}, {57558, 1}, {57559, 1}},
            rewardMoney = 300,
        },
        [25933] = {
            description = "Thank you again for all your help here, <name>.\n\nI have a cousin who used to " ..
                "work in the mines beneath the Gol'Bolar Quarry, but he hasn't been able to work since " ..
                "troggs flooded into the mines and took control. The quarry and its camp are just to the " ..
                "southeast of the ranch. Would you be willing to check in with the foreman there and see " ..
                "if there's anything to be done?",
            rewardMoney = 30,
        },
        [25934] = {
            description = "Good day, citizen, allow me to introduce myself. I am Salsbury, soon to be the " ..
                "world's first gnomegen. Malyk has assured me that as soon as my work here is complete he " ..
                "will grant me the gift of the worgen.\n\nSo with the introduction out of the way, I've a " ..
                "request!\n\nWithin the Charred Vale, south of here, roam newly created fire elementals. " ..
                "I desperately need a rare blazing heart of fire from one of the fiends. Get it for me " ..
                "and you bring me one step closer to becoming a gnomegen!",
            rewardMoney = 2500,
        },
        [25935] = {
            description = "Ah, a new arrival! Good that you're here <lad/lass>! The pups are hungry and " ..
                "we're completely out of food.\n\nThankfully they love dragon meat, which fortuitously " ..
                "exists in abundance within the Charred Vale, south of here.\n\nBe a good <boy/girl> and " ..
                "fetch me several pounds of black dragon whelp filet.",
            rewardMoney = 2500,
        },
        [25936] = {
            description = "You are now able to move about this realm more freely and without fear of " ..
                "drowning.\n\nThis is where our work begins.\n\nFirst, you have many allies nearby who " ..
                "are drowning as we speak. As I saved you, you must save them.\n\nI have enchanted the " ..
                "shell you brought me. Use it to rescue your friends.\n\nHurry now!",
        },
        [25937] = {
            description = "Mining wasn't the only thing going on in the quarry, you know. I led a team of " ..
                "Explorers' League excavators recovering priceless ancient artifacts.\n\nI managed to " ..
                "escape, but my colleagues were much deeper in the mine and didn't survive the initial " ..
                "trogg attack.\n\nThey took great pride in their work and they risked their lives to " ..
                "learn more of our history. If you're going into the mines, take this pick with you and " ..
                "see if you can find anything in the digs the prospectors started.",
            rewardChoices = {{57571, 1}, {57572, 1}, {57574, 1}},
            rewardItems = {{57549, 1}},
            rewardMoney = 350,
        },
        [25938] = {
            description = "I've received a disturbing message from Nijel's Point in Desolace. It would " ..
                "seem as if the great upheaval has created some new problems for them, which they are " ..
                "ill-equipped to handle. I was given no further information.\n\nReport to Office Jankie " ..
                "in Desolace. She will direct you to Nijel's Point.\n\nGood luck, <name>.",
        },
        [25939] = {
            description = "The elementals rampaging across Direforge Hill are setting the very land " ..
                "beneath them ablaze. In a marsh such as this, fire can find many places to smoulder " ..
                "through the deep moss and peat.\n\nYou must quench the fires before they spread further. " ..
                "Take this flower... blessed by nature's rain, it will let you douse the fires.\n\nThe " ..
                "blossom may also prove useful against the elementals themselves.",
            rewardChoices = {{59106, 1}, {59107, 1}, {59108, 1}, {59109, 1}},
            rewardMoney = 1700,
        },
        [25940] = {
            description = "We might have a chance to beat these flames back thanks to your work in the " ..
                "Inferno.\n\nStill, more wildlife is threatened. Keeper Taldros ran north through the " ..
                "flames, to Whistling Grove.\n\nSee if you can help him!",
            rewardMoney = 7800,
        },
        [25941] = {
            description = "You have done well, <race>, but there is much more to do and I grow " ..
                "weary.\n\nI have expended a great deal of energy sending a distress message to Earthen " ..
                "Ring leadership, pleading for their help.\n\nI must rest if I am to be of further use to " ..
                "us here.\n\nSpeak to the leader of the men you've saved and do what you can to help them " ..
                "prepare for battle.\n\nThe naga are scouring the waters for us. It is but a matter of " ..
                "time before they return - and they will surely come in even greater force.",
            rewardMoney = 7800,
        },
        [25942] = {
            description = "Many good warriors have been lost today.\n\nIf what the shaman says is true, " ..
                "then we must act swiftly or we will add to their numbers.\n\nThe naga are out there, " ..
                "scouring these waters looking for survivors.\n\nWe are not yet ready to fight, <race>. " ..
                "You must buy us time to make preparations.\n\nFind the naga that hunt us and delay their " ..
                "efforts.",
            rewardMoney = 78000,
        },
        [25943] = {
            description = "I'll need your help if I am to get these orcs ready for battle.\n\nAny worthy " ..
                "leader knows that his warriors travel and fight on their stomachs. No food, no " ..
                "victory.\n\nThese warriors are weary from their struggle out there. They need food " ..
                "before they're ready to overcome a naga attack.\n\nSpeaking of traveling on stomachs, I " ..
                "saw plenty of crabs out on the sea floor...",
            rewardMoney = 78000,
        },
        [25944] = {
            description = "As we struggled not to drown, my orcs and I were forced to abandon our weapons " ..
                "and much of our armor.\n\nErunak says to expect a major attack from the naga soon and I " ..
                "believe him.\n\nIf we're going to be victorious, we'll need your help to recover our " ..
                "lost equipment.\n\nYou should find it scattered around the sea floor near our shipwrecks " ..
                "here and to the north.\n\nMake haste, <race>. The enemy could arrive at any moment.",
            rewardChoices = {{59805, 1}, {59806, 1}, {59807, 1}},
            rewardMoney = 78000,
        },
        [25946] = {
            description = "This helm and its associated components are marked with the seal of Stormwind. " ..
                "It was no doubt cast off from an Alliance ship that suffered a similar fate to " ..
                "yours.\n\nLooking closer, this seems far too intricate and sturdy to be everyday diving " ..
                "equipment. Perhaps Nazgrim can make some sense of this...",
            rewardMoney = 78000,
        },
        [25947] = {
            description = "I recognize this helm, <race>. You were wise to bring it to me.\n\nThe " ..
                "Alliance have a special unit, trained and equipped to explore and fight beneath the " ..
                "sea.\n\nIt would seem that they are in this region to do more than just defend against " ..
                "our attack.\n\nThere must be more of these down here, and if you can find them it could " ..
                "turn things around for the Vanguard.",
            rewardMoney = 78000,
        },
        [25948] = {
            description = "It is time, <class>.\n\nWe are as ready as we ever will be!\n\nI shall address " ..
                "the Vanguard, and then we shall swim into the sea to meet our fate.",
            rewardMoney = 78000,
        },
        [25949] = {
            description = "The time has come to make our stand, <race>.\n\nWe'll defend this ship to our " ..
                "last breath, and make these naga scum think twice before approaching it again!\n\nFor " ..
                "the Horde!",
            rewardChoices = {{59799, 1}, {59800, 1}, {59801, 1}},
            rewardMoney = 78000,
        },
        [25950] = {
            description = "You're the <name> everyone's been talking about? Good to meet ya, love. Let's " ..
                "have a butcher's hook.\n\nWell, enough rabbit, right? Let's get down to it. I need you " ..
                "to swim out northwest to the Sira'kess Front and read and write them snakes something " ..
                "quick.\n\nNothing fancy. They're looking for a bother, and we'll give 'em a right good " ..
                "one in the ol' boat race.",
            rewardMoney = 82000,
        },
        [25951] = {
            description = "Get to the bridge on the east, quickly. Lady Naz'jar and the Fathom-Lord " ..
                "should be there with whatever forces remain.\n\nFollow our Lady's direction, as always. " ..
                "Hold the bridge until we can complete the ritual.\n\nOnce our allies arrive, the Kvaldir " ..
                "will be doomed.",
        },
        [25952] = {
            description = "Our escape from the shell can't have gone unnoticed, but either the naga at " ..
                "these ruins weren't informed or they don't consider us a threat. I don't intend to take " ..
                "the opportunity for granted - we strike now.\n\nI need you to slip into the lower level " ..
                "of the ruins to our west and take out as many of their patrols as you can. We cannot " ..
                "risk any of those patrols finding out about our occupation of this cave - make sure none " ..
                "escape.",
            rewardMoney = 78000,
        },
        [25953] = {
            description = "I've taken the liberty of performing some preliminary scouting. The naga may " ..
                "not be aware of our position, but they are not entirely unprepared for " ..
                "intruders.\n\nBeyond their patrols, they have set up magical sentry devices that will " ..
                "warn them of unwelcome guests. Fortunately, they seem to have sacrificed quality for " ..
                "quantity, and there is definitely a window in which the devices can be destroyed before " ..
                "their alarms are answered.\n\nI trust that you can see to this before our other soldiers " ..
                "arrive.",
            rewardChoices = {{59717, 1}, {59718, 1}, {59719, 1}},
            rewardMoney = 78000,
        },
        [25954] = {
            description = "Look--<name> is it?--I need your help. I know most everyone in this cave " ..
                "thinks that we're not in a position to be worrying about anything but our own hides " ..
                "right now, but I cannot dismiss my ancestors so readily.\n\nThis was one of the royal " ..
                "cities of the elves in the days when Azshara was queen. In this city lie the keys to " ..
                "lore long lost and artifacts of unimaginable historical value. All I want from you, " ..
                "while you're out in the city proper, is to keep a watchful eye out for objects of " ..
                "significance.",
            rewardChoices = {{59711, 1}, {59712, 1}, {59713, 1}},
            rewardMoney = 78000,
        },
        [25955] = {
            description = "This cave is our only refuge. There's no help on the way. Whatever happens, " ..
                "this cave must remain safe or we are all sure to die down here.\n\nWe need a forward " ..
                "post to launch our attacks from. Something defensible.\n\nIn the eastern portion of the " ..
                "ruins on the lowest level, scout the north end of the gardens, the passage leading under " ..
                "the main structure just west of the gardens, and the cluster of buildings at the " ..
                "southeast corner of the ruins, under the bridges.\n\nBring me back any information you " ..
                "can.",
            rewardMoney = 78000,
        },
        [25956] = {
            description = "All around you lie the remnants of a fierce battle. The naga skeletons are no " ..
                "surprise, but the weapons and remains of their apparent opponents are somewhat more " ..
                "unexpected.\n\nAmidst the bones, you spot a strangely prominent piece of metal jutting " ..
                "out from one of the skulls. It's difficult to tell what sort of weapon it might have " ..
                "once been part of, but it stands out sufficiently to prompt you to retrieve it as " ..
                "evidence.\n\nSurely someone back at the cave would be interested in this revelation.",
            rewardMoney = 78000,
        },
        [25957] = {
            description = "The shard you recovered looks to be of naga origin. I had hoped to find a " ..
                "strong focal object like this for a spell I've been working on that would allow us to " ..
                "glimpse into the recent past.\n\nI've enchanted the blade, but you'll have to take it to " ..
                "a place where we know its owner was. I want you to travel back to the site where you " ..
                "found it and use the blade.\n\nPerhaps we can uncover more behind what the naga are " ..
                "doing here. Or even better, maybe we'll uncover a weakness that will give us a better " ..
                "chance.",
            rewardChoices = {{59705, 1}, {59706, 1}, {59707, 1}},
            rewardMoney = 312000,
        },
        [25958] = {
            description = "The Captain used the information you gathered for him to make a forward post " ..
                "under the terrace to our west. He's been preparing there for some kind of attack against " ..
                "the naga.\n\nYou should go to him immediately and inform him of the scope of what you've " ..
                "witnessed. Our force is small, and I fear for our soldiers if we charge in too " ..
                "recklessly.\n\nTake my sea horse. It knows the way.",
            rewardMoney = 7800,
        },
        [25959] = {
            description = "I see. The news you bring is grim, but I was not entirely unprepared for such " ..
                "possibilities. Without any effective scouting of naga numbers, I knew our plan was " ..
                "risky, but that's why we established this forward post.\n\nLet me put it to you plainly, " ..
                "<class>. If we do not keep the naga off-balance, they will bring the fight to us. We do " ..
                "not have the structures or the men to mount a defense, so that is not an option.\n\nWe " ..
                "need more time. Can you thin their numbers to the south, under the far terrace?",
            rewardMoney = 78000,
        },
        [25960] = {
            description = "I overheard your conversation with the Captain. I know what we're doing sounds " ..
                "insane, but we really don't have much choice. There are people back at that cave that " ..
                "are depending on us.\n\nI've stationed lookouts on various ledges in the immediate area. " ..
                "They're burning ammo fast on the scattered naga scouts. Bring them more crossbow bolts " ..
                "to buy us some extra time.",
            rewardChoices = {{59699, 1}, {59700, 1}, {59701, 1}},
            rewardMoney = 78000,
        },
        [25962] = {
            description = "Been all over the place. Blown all kinds of things up. I thought I might have " ..
                "some trouble carrying on the trend, what with the water and all, but it's all just a " ..
                "matter of inspiration.\n\nI found something volatile enough to make bombs out of! " ..
                "There's a bunch of kelp hanging under the terrace to the southwest. Normally kelp stores " ..
                "gas that makes it float - this kelp produces a different kind of heavy gas. It keeps it " ..
                "hanging, but also makes for great explosions.\n\nGather me some?",
            rewardMoney = 78000,
        },
        [25963] = {
            description = "We have everything we need to begin the attack.\n\nIf your claims were " ..
                "correct, you would do well to make sure you cling tight to your mount as we make the " ..
                "run. Anyone who gets caught in the open water isn't likely to out-swim a naga.\n\nKill " ..
                "as many as you can as we make the attack run and we'll rendezvous on the broken ledge of " ..
                "the southern terrace above once we've expended our explosives. Hopefully by that point " ..
                "there will be few enough that we can finish them off the old-fashioned way.",
            rewardChoices = {{59659, 1}, {59660, 1}, {59661, 1}},
            rewardMoney = 78000,
        },
        [25964] = {
            description = "That was a disaster! Most of our men went down to spears before making it " ..
                "anywhere near the rendezvous.\n\nWe're only going to be able to hold this position for " ..
                "so long before the naga overrun us. We need to get out there to the southwest and save " ..
                "as many of the men as we can find - do anything you can.\n\nThey won't last long. Please " ..
                "hurry!",
            rewardMoney = 78000,
        },
        [25965] = {
            description = "Vicious louts... they did a lot of damage with those spears.\n\n<The captain " ..
                "winces slightly as he clutches a wound on his side.>\n\nWe'll hold here as long as we " ..
                "can for all the men to make it. I need someone to scout their numbers to see how much " ..
                "damage we did.\n\nOne of the biggest groups of them was around the corner on the " ..
                "northwest portion of this round terrace, and the other was a bit farther to the north in " ..
                "the small tunnel, also on this middle level of the ruins.\n\nUp for some scouting?",
            rewardMoney = 78000,
        },
        [25966] = {
            description = "Look, I know this is asking a lot during a time like this, but I need you to " ..
                "tear yourself away from this defeat for a moment.\n\nI will tend to these soldiers - you " ..
                "need to find the location of that battle with the Kvaldir General to the west that you " ..
                "told me about. You should be able to glimpse more of the Battlemaiden's experiences from " ..
                "there. I have a strong feeling that the key to defeating these naga will lie with that " ..
                "Battlemaiden.\n\nPlease hurry - I will do everything I can to buy you time.",
            rewardChoices = {{59686, 1}, {59687, 1}, {59688, 1}, {59685, 1}},
            rewardMoney = 312000,
        },
        [25967] = {
            description = "You'll have to catch me up more later. Right now, we need to get out of here " ..
                "before more naga push in. Make your way back to the forward post on the level below " ..
                "us.\n\nTake my sea horse. We will meet you back there shortly.",
            rewardMoney = 78000,
        },
        [25968] = {
            description = "Toldrek and Fiasco left to find a way to contact help. The trade lanes aren't " ..
                "far, so there might be a chance of success, but I'm wary to let anyone get their hopes " ..
                "up.\n\nIn truth, we don't have any other options. We're not likely to last much longer " ..
                "here. The naga will find us eventually, and... well... you saw how many of them there " ..
                "were.\n\nYou should go find the two of them on Biel'aran Ridge to the southeast. I'll " ..
                "keep everyone here safe as long as I can.",
            rewardMoney = 19500,
        },
        [25969] = {
            description = "Fiasco came out here with a balloon of some sort that he retrieved from one of " ..
                "our ships. He tried to float it to the top, but those Muckskin Scroungers came out of " ..
                "nowhere and swarmed the thing.\n\nHe's got an idea for another balloon, but we need to " ..
                "make sure that the past doesn't repeat itself. I need you to kill off those giblins. Or " ..
                "at the very least, enough of them to make them fear us.",
            rewardMoney = 78000,
        },
        [25970] = {
            description = "It's a short swim to the top. Not much trouble really. Hard to get any " ..
                "supplies up there though. Too heavy.\n\nAll of the ships in all of the Horde fleets stow " ..
                "a survival kit. I had a balloon from the old survival kit, but it fell on hard times " ..
                "recently. I need another survival kit.\n\nThere's a ship to the southeastish. Let's hope " ..
                "that the survivors were dumb and didn't take the survival kit. More survival kit for us.",
            rewardChoices = {{59679, 1}, {59680, 1}, {59681, 1}},
            rewardMoney = 78000,
        },
        [25971] = {
            description = "Survival kits never have any rope. It makes no sense! Rope and bombs, that's " ..
                "all they should store. The rest of this stuff is just a waste of space.\n\nExcept maybe " ..
                "the balloon. That's coming in handy right now.\n\nI bet those Kvaldir have rope. They're " ..
                "always riding around in boats, tying knots, dressing in nets. Go take some rope from " ..
                "them! I must have it for our plan to work. It is non-optional.",
            rewardMoney = 78000,
        },
        [25972] = {
            description = "All done! I'm confident it will work. And not a scrounger in sight to pop a " ..
                "hole in it this time! Well played.\n\nToldrek already swam up to catch it, all concerned " ..
                "about currents and what not. He said you'd get the honors though. Nice guy - don't know " ..
                "how he lasts.\n\nGo to the top with the balloon, take the flare gun from the crate, and " ..
                "scan the horizon for Horde ships. If you see any, fire the flare towards them. That's " ..
                "it! All there is to it.\n\nSwim. Float. Flare. Rescue! That last part's my favorite.",
            rewardMoney = 78000,
        },
        [25973] = {
            description = "They'll probably send a skiff over, which may take a bit. I'll stay here to " ..
                "make contact.\n\nYou need to return to the cave immediately and let them know that " ..
                "rescue is on its way. We can only hope that the naga have not found them yet.\n\nGo. " ..
                "Swim fast, <name>.",
            rewardChoices = {{59673, 1}, {59674, 1}, {59675, 1}},
            rewardMoney = 39000,
        },
        [25974] = {
            description = "So, you're the <name> everyone's been talking about? It's good to finally meet " ..
                "you.\n\nWell, enough talk, right? Let's get down to it. I need you to swim out northwest " ..
                "to the Sira'kess Front and kill those naga real quick.\n\nNothing fancy. They're looking " ..
                "for a fight, and we'll give them one! Well, you will.",
            rewardMoney = 82000,
        },
        [25975] = {
            description = "We've got our reinforcements, but we still need to find a way to pay them. " ..
                "That kind of action doesn't come cheap.\n\nUp on Deepfin Ridge to the northwest, the " ..
                "slimy gilblin have stolen all sorts of treasure. I think that it's time to reclaim some " ..
                "of it for the cause.",
            rewardMoney = 82000,
        },
        [25976] = {
            description = "Blood and thunder! We have our reinforcements, but they still need to be paid. " ..
                "They won't be cheap.\n\nUp on Deepfin Ridge to the northwest, the slimy gilblin have " ..
                "stolen all sorts of treasure. It's time to reclaim some of it for the " ..
                "Horde.\n\nHellscream's eyes are upon you, <name>!",
            rewardMoney = 82000,
        },
        [25977] = {
            description = "<name>, the snakes are after our daft and barmy. Go back northwest to Deepfin " ..
                "Ridge and plant some do me good in that pot and pan pitch and toss of theirs.\n\nThey'll " ..
                "kick and prance away with their alderman's nails tucked between their nutmegs when they " ..
                "see that. Not that they've got any nutmegs mind you.",
            rewardChoices = {{59639, 1}, {59638, 1}},
            rewardMoney = 164000,
        },
        [25978] = {
            description = "Khurgorn tells me the cataclysm upset the balance of the elements all over the " ..
                "world. Helm's Bed Lake, to the south, used to be beautiful and tranquil, but it is now " ..
                "overrun with agitated water elementals. When they started to leave the confines of the " ..
                "lake, I sent my troops in to keep them busy, but most have been frozen in blocks of " ..
                "ice.\n\nIf we can break them free, they have a good chance of recovering. I cannot spare " ..
                "the men for a second expedition out onto the lake. Would you be willing to try?",
            rewardMoney = 350,
        },
        [25979] = {
            description = "The elements are in turmoil, <class>. The cataclysm stirred up the " ..
                "long-dormant water spirits of Helm's Bed Lake, just to the south. They're angry, " ..
                "confused, and unwilling to hear my pleas.\n\nI have tried everything I know to calm " ..
                "them, to persuade them to stop lashing out and attacking the sergeant's " ..
                "mountaineers.\n\nIt pains me to say this, but no other options remain -- we must kill " ..
                "the elementals.",
            rewardMoney = 350,
        },
        [25980] = {
            description = "<name>, the naga are after our forces. I need you to go back northwest to " ..
                "Deepfin Ridge and stick our standard in their general, Fathom-Caller Azrajar.\n\nThey'll " ..
                "swim away with their tails tucked between their... er. Well, I guess they don't have any " ..
                "legs, now do they?",
            rewardChoices = {{59636, 1}, {59635, 1}},
            rewardMoney = 164000,
        },
        [25981] = {
            description = "<name>, there are these demon squid-things out there that are eating gilblins' " ..
                "heads and then taking them over! That's one way to get slaves.\n\nThink you could swim " ..
                "out northwest onto Deepfin Ridge or into the Sira'kess Front and bring me back some of " ..
                "those Merciless things?",
            rewardMoney = 82000,
        },
        [25982] = {
            description = "<name>, there are demon squids out there that are eating gilblins' heads and " ..
                "then taking them over! They better not come in here!\n\nThink you could swim out " ..
                "northwest onto Deepfin Ridge or into the Sira'kess Front and bring me back some of those " ..
                "Merciless things? Preferably dead, I think.",
            rewardMoney = 82000,
        },
        [25983] = {
            description = "We need to get this information up to Captain Taylor on Promontory Point! He's " ..
                "out there to the northwest with Erunak Stonespeaker and the Earthen Ring.",
        },
        [25984] = {
            description = "<name>, I need you to get this information to Legionnaire Nazgrim on " ..
                "Promontory Point. He's up there to the northwest with Erunak Stonespeaker and those " ..
                "Earthen Ring people.",
        },
        [25985] = {
            description = "<name>, is it true you're going to try to commune with the " ..
                "ancients?\n\nSouthwest of here is the Shrine of Aviana, the matron of all flying " ..
                "creatures. It's the home of my favorite instructor, Choluna. I've never encountered one " ..
                "who was so deeply in touch with the spirits of this world. You could learn a lot from " ..
                "her!\n\nThe recent attacks have isolated the shrine. But it's easily accessible from the " ..
                "air - look for the second biggest tree on Hyjal. Good luck!",
            rewardMoney = 7800,
        },
        [25986] = {
            description = "You've been a great help in securing the mines and rescuing the trapped " ..
                "miners.\n\nThe Senate will be heartened to hear that you and Captain Tharran's " ..
                "mountaineers have made progress in securing Dun Morogh.\n\nWhat worries me is that I " ..
                "haven't seen any reports from Sergeant Bahrum and his detachment. They were sent east, " ..
                "along the road toward Helm's Bed Lake, and ordered to set up a small outpost. Would you " ..
                "go to Bahrum's Post and check in on the sergeant?",
            rewardMoney = 35,
        },
        [25987] = {
            description = "Hey, <name>, I've got an idea for a disguise! Take one of these merciless " ..
                "whatchamacallits and put it on your head.\n\nWhat could possibly go wrong?\n\nReady to " ..
                "put it on?",
            rewardChoices = {{59632, 1}, {59633, 1}},
            rewardMoney = 164000,
        },
        [25988] = {
            description = "I've got an idea for a sweet disguise, but I'm going to need your help, " ..
                "<name>! Take one of these merciless corpses and put it on your head.\n\nI know, I know, " ..
                "but it's dead, so what could possibly go wrong other than you smelling bad for a day or " ..
                "two?\n\nReady to put it on?",
            rewardChoices = {{59629, 1}, {59630, 1}},
            rewardMoney = 164000,
        },
        [25989] = {
            description = "Everything in my body tells me that Nespirah is trying to speak with me, but I " ..
                "cannot hear her. Perhaps the naga have done something to her voice.\n\n<Duarn thinks to " ..
                "himself for a moment.>\n\nNespirah's voice may be suppressed... that means... we need to " ..
                "find a voice for her!\n\nI've got it! The Idra'kess have been known to train deepseeker " ..
                "crabs as battle companions. Use this net to capture a crab, and bring it to me. You will " ..
                "likely find them prowling the chamber's outer edges.",
            rewardMoney = 59000,
        },
        [25990] = {
            description = "A trained shaman has the ability to communicate with the four elements of " ..
                "earth, fire, air and water. This is known.\n\nWhat is not as widely known, however, is " ..
                "the presence of a fifth element. This element is not as clearly described as the other " ..
                "four, but it has to do with the shared... commonality between all living " ..
                "creatures.\n\nMy theory is that the crab, as a creature of the sea, is close enough to " ..
                "Nespirah that, with the elements' coaxing, we can convince it to act as Nespirah's " ..
                "mouthpiece.",
            rewardMoney = 39000,
        },
        [25991] = {
            description = "<Duarn closes his eyes, pauses, and nods.>\n\nNespirah has just informed me " ..
                "that we are not the only people fighting inside of this shell. A small group of Horde " ..
                "slaves has escaped and is currently fighting off the naga on the other side of the " ..
                "shell, up on the ledge that overlooks Nespirah's heart.\n\nGo find them, <name>, and see " ..
                "what help they can lend us. With their aid, we may be able to rouse Nespirah from her " ..
                "torpor.\n\nI will remain here, should you need anything.",
            rewardMoney = 39000,
        },
        [25992] = {
            description = "I honestly don't know how we've survived this long. The naga took my armor and " ..
                "weapons, and left me with rags and a mining pick... and THAT snapped in half long " ..
                "ago.\n\nIf we're to stand any hope of turning the tide, I'm going to need something to " ..
                "fight with... as will my companions, though they may be too proud to admit it.\n\nI've " ..
                "seen weapon racks in the naga storage areas nearby. I'm not accustomed to fighting with " ..
                "a trident, but it'll sure be better than fighting with my fists.",
            rewardChoices = {{59741, 1}, {59743, 1}, {59742, 1}},
            rewardMoney = 78000,
        },
        [25993] = {
            description = "< Legionnaire Nazgrim listens intently to your recount of Duarn and Nespirah's " ..
                "conversation.>\n\nI see. So the creature wants our help waking it up, is that " ..
                "it?\n\nWith hundreds of slaves already picking away at her pearls, the beast seems to be " ..
                "a pretty heavy sleeper. You might have better luck, though.\n\nMy suggestion? Look " ..
                "around the creature's flesh for signs of weakness. Maybe that weapon of yours will find " ..
                "a ticklish spot and force the beast to come to its senses.",
            rewardMoney = 78000,
        },
        [25994] = {
            description = "My time in the pearl pits, however short, has made me curious about the naga's " ..
                "goals. Yes, I now know that the naga want to use Nespirah as an engine of war, but if " ..
                "that's the case, then why are they enslaving men to mine her pearls?\n\nAssuming we " ..
                "escape this creature's hull, I would very much like to study these objects. The pearls " ..
                "we found in the pits were much too large to carry, but I've seen the warlords and " ..
                "prophets occasionally carrying around smaller ones.",
            rewardMoney = 78000,
        },
        [25995] = {
            description = "My men are flagging, <name>. We won't last much longer against these naga, I'm " ..
                "afraid. With the Idra'kess' weapons, and Nespirah's pearls, we should be ready to bust " ..
                "out of here.\n\nFollow the wall northeast, and look for a ramp to the upper chamber. I " ..
                "assume their leader is in there, or perhaps the key to Nespirah's awakening. Hopefully " ..
                "both.\n\nIf you feel strong enough, head up to the top of the shell and look for some " ..
                "answers. Hellscream's eyes are upon you!",
            rewardChoices = {{59735, 1}, {59736, 1}, {59737, 1}},
            rewardMoney = 234000,
        },
        [25996] = {
            description = "Thanks to you and the Legionnaire, Nespirah has full control of her body... " ..
                "but most of the naga don't know this yet. Once we make our escape, she will activate her " ..
                "biological defenses and destroy the naga from within.\n\nMake yourself ready... I will " ..
                "now tell Nespirah to begin the countdown.",
            rewardMoney = 78000,
        },
        [25997] = {
            description = "A cadre of Dark Iron spies have taken over Ironband's Compound to the south, " ..
                "beyond Helm's Bed Lake. The mountaineers are normally able to keep them from getting " ..
                "into Dun Morogh, but everything is in disarray right now.\n\nThe Dark Iron dwarves would " ..
                "be fools if they didn't take advantage of the chaos. We have to find out what they're " ..
                "planning and stop them before they do any damage.\n\nWill you see if you can discover " ..
                "what they're doing down at Ironband's Compound?",
            rewardChoices = {{57575, 1}, {57576, 1}, {57578, 1}},
            rewardMoney = 350,
        },
        [25998] = {
            description = "According to the plans you captured, the Dark Irons are planning a large-scale " ..
                "attack on the Ironforge Airfield! The council has moved most of our forces down into Dun " ..
                "Morogh to deal with the instability brought by the cataclysm, leaving our defenses " ..
                "weakened at the airfield.\n\nWe need a way to get you to the airfield quickly. Take the " ..
                "road back west toward Gol'Bolar Quarry and find Mathel Rustwrench. He should have a " ..
                "flying machine you can use. Go!",
        },
        [26000] = {
            description = "Hurry, <name>!\n\nMake your way to that cavern at once.\n\nWe shall go behind " ..
                "you to ensure that you are not followed.",
        },
        [26003] = {rewardMoney = 2000},
        [26004] = {rewardMoney = 4000},
        [26005] = {
            description = "Captain Taylor and many of the other survivors have already made their way to " ..
                "the surface. I'm sure some are just looking to rid themselves of this place for good, " ..
                "but we still have work to do if we're going to stop the naga from invading the plane of " ..
                "water.\n\nFirst, we need to set eyes on the tentacled fiend that destroyed our ships " ..
                "when we first arrived - we don't want a repeat of that nightmare.\n\nHexascrub left " ..
                "these behind for you. They should speed your trip up a bit.",
            rewardMoney = 59000,
        },
        [26006] = {
            description = "Legionnaire Nazgrim and many of the other survivors have already made their " ..
                "way to the surface. I'm sure some are just looking to rid themselves of this place for " ..
                "good, but we still have work to do if we're going to stop the naga from invading the " ..
                "plane of water.\n\nFirst, we need to set eyes on the tentacled fiend that destroyed our " ..
                "ships when we first arrived - we don't want a repeat of that nightmare.\n\nFiasco left " ..
                "these behind for you. They should speed your trip up a bit.",
            rewardMoney = 59000,
        },
        [26007] = {
            description = "This warrior was near death, but I fear we do not have the time to await his " ..
                "full recovery. He has information we desperately need to know.\n\nBe patient with him, " ..
                "but keep him talking until we've learned all that we can.\n\nWith luck we might discover " ..
                "just what we're up against...",
        },
        [26008] = {
            description = "I simply cannot bear the thought of so many others like this warrior " ..
                "imprisoned, surrounded by naga.\n\nSomething must be done to rescue them!\n\nTry this, " ..
                "<name>. Use it on the prison cells to make them buoyant.\n\nIf we can get them to the " ..
                "surface, at least they stand a chance at being rescued.",
            rewardChoices = {{59769, 1}, {59770, 1}, {59771, 1}},
            rewardMoney = 78000,
        },
        [26009] = {rewardMoney = 4500},
        [26011] = {rewardMoney = 2200},
        [26012] = {
            description = "My old friend Krasus sends word of dire happenings at Wyrmrest, in " ..
                "Dragonblight. His missive was brief, but it seems that there has been some sort of " ..
                "attack on the Ruby Sanctum beneath the Temple.\n\nPressing business here in Dalaran " ..
                "keeps me from attending to the matter personally, but I have heard word of your exploits " ..
                "in the Lich King's Citadel and you are doubtless up to the task -- perhaps you could " ..
                "assist Krasus in my stead?",
            rewardMoney = 8200,
        },
        [26013] = {
            description = "<race>, something terrible has transpired within the Ruby Sanctum beneath the " ..
                "Temple.\n\nThe entry to the Sanctum is in ruins, and its guardians violently slain. We " ..
                "sent scouts to investigate, but they have not returned. I cannot help but fear the " ..
                "worst.\n\nEnter the Ruby Sanctum and discover what has befallen the home of my flight. " ..
                "Once we have more information, we can plan our next steps accordingly.",
            rewardMoney = 82000,
        },
        [26014] = {
            description = "Private <name>, at attention! Ve are havink a small problem!\n\nVe have sent " ..
                "Humphrey and Oskar Digsong out to Underlight Canyon, to the northvest, but they are not " ..
                "comink back. They vere supposed to scout out the area, but ve have lost all contact with " ..
                "them.\n\nYour assignment, Private <name>, is to locate our comrades and, if they live, " ..
                "bring them back to me!",
            rewardMoney = 7800,
        },
        [26015] = {
            description = "Oskar's last wish, before he floated up into that great-eel's gullet, was to " ..
                "bring back food for the captain, so that's what we'll do.\n\nMy brother had a genius " ..
                "plan. He saw those murlocs luring fish out of the reeds with a phosphorescent antenna, " ..
                "and devised a way to make one of his own. All ya need is something that glows.\n\nKill " ..
                "the crabs and groupers that roam the canyon's floor. They aren't edible themselves, but " ..
                "their phosphora is far more valuable than their meat.",
            rewardMoney = 78000,
        },
        [26017] = {
            description = "Stick this device on your head, then swim through the kelp and coral along the " ..
                "canyon's edge. There should be all kinds of little fish in there that find your new " ..
                "antenna irresistible.\n\nWhen we return to Darkbreak Cove, we'll have armfuls of fish " ..
                "for everyone!",
            rewardMoney = 78000,
        },
        [26018] = {
            description = "Oh yeah! I was supposed to put together a report! I'd almost " ..
                "forgotten!\n\nLooks like mostly harmless wildlife around here... 'cept for those blasted " ..
                "eels... and a few murlocs. Cap'n will be more interested in the murlocs, I think.\n\nGo " ..
                "engage a few of 'em in combat and see what kinda moves they got. From what I've seen, " ..
                "the big ones hunt for fish in the kelp, and the little ones practice some kind o' magic " ..
                "or another... but that's all I know.",
            rewardMoney = 78000,
        },
        [26019] = {
            description = "<This appears to be an egg from one of the devious great-eels that float up " ..
                "above the canyon. You wonder whether or not Humphrey might be interested in something " ..
                "like this.>",
            rewardMoney = 39000,
        },
        [26021] = {
            description = "Those eels ate my brother. My brother, <name>! It's time someone showed 'em " ..
                "who's boss.\n\n<Humphrey removes several sticks of dynamite from his vest and shoves " ..
                "them through the egg's outer membrane.>\n\nThe great-eels to the south are too tough to " ..
                "fight one-on-one, but with this egg, we should be able to even the odds. Place it near " ..
                "one of those creatures, then... kablooie!\n\nIf the bomb doesn't kill the eel outright, " ..
                "it should be near enough to death for you to finish it off.",
            rewardChoices = {{59656, 1}, {59657, 1}, {59658, 1}},
            rewardMoney = 156000,
        },
        [26022] = {rewardMoney = 2200},
        [26023] = {rewardMoney = 225},
        [26024] = {
            description = "A bounty has been placed on the head of Marez Cowl, a high-level advisor and " ..
                "operative of the Syndicate. She was last seen within the Syndicate controlled territory " ..
                "of Stromgarde.\n\nBounty may be collected from Captain Nials.\n\nBe warned: Marez is a " ..
                "skilled and cunning warlock, known for her trafficking with demons. Extreme caution is " ..
                "advised when hunting her.",
            rewardChoices = {{59182, 1}, {59183, 1}, {59184, 1}, {59185, 1}},
            rewardMoney = 5000,
        },
        [26025] = {rewardMoney = 2200},
        [26027] = {rewardMoney = 2200},
        [26028] = {rewardMoney = 6500},
        [26029] = {rewardMoney = 4500},
        [26030] = {rewardMoney = 2200},
        [26031] = {rewardMoney = 2200},
        [26032] = {rewardMoney = 2200},
        [26034] = {
            description = "This was no reckless attack, but rather a carefully orchestrated strike " ..
                "against the heart of the Red Dragonflight.\n\nZarithrian, on the bluff over there, is " ..
                "overseeing the assault, but the true leader of this force is a brash and powerful " ..
                "Twilight dragon named Halion. Not since Dargonax has a full-grown spawn of Sinestra's " ..
                "twisted experiments been seen.\n\nSlay him, <name>, and then when the invasion has been " ..
                "fully repelled, report to Krasus regarding all you have seen here.",
            rewardMoney = 246000,
        },
        [26035] = {
            description = "Archmage Malin sent me here to collect reagents for him. I was at a loss as to " ..
                "how I was going to collect the items, but now that you're here, I think my problem's " ..
                "solved.\n\nI need Witherbark tusks and Witherbark medicine pouches.\n\nCould you find " ..
                "those for me? The Witherbark live to the southeast of Arathi.",
            rewardMoney = 4000,
        },
        [26036] = {
            description = "Hey, <name>. Sorry to be so short with ye earlier... and no, that ain't a " ..
                "pun.\n\nI figured out where Trelane's first item ended up: Kor'gresh has it in " ..
                "Boulderfist Hall. An' by the way he was throwing down blasts of ice at his kin to keep " ..
                "them in line, he must be close to figurin' out how to use all of its " ..
                "powers.\n\nBoulderfist Hall's south of here an' then east of Thandol Span. Find the ogre " ..
                "an' get back that wand.\n\nWhile you're gone, I'll figure out what we're gonna do about " ..
                "Stromgarde.",
            rewardMoney = 2000,
        },
        [26037] = {
            description = "All rested?\n\nHere's our next step: there're ogres all around the Tower of " ..
                "Arathor in Stromgarde. We're gonna need to ward you against the tower's defenses. To do " ..
                "that, we're gonna need some gems the Boulderfist shaman have taken a liking to. They " ..
                "took 'em from the tower, but they're not gonna stay in their possession for long.\n\nGet " ..
                "one of them gems an' bring 'em to Kryten--he knows the spell to enchant it.",
            rewardMoney = 2200,
        },
        [26038] = {
            description = "Here's what you're looking for: Trelane's phylactery, Trelane's orb, and " ..
                "Trelane's ember agate.\n\nAll three should be in chests within the tower. You shouldn't " ..
                "have a problem opening the chests on your own; you just have to be careful of the " ..
                "ogres.\n\nYou'll need to have your weapons at the ready. Those ogres find out you're " ..
                "there and stealing from them, and they'll be sure to put the hurt on you.\n\nBe careful, " ..
                "and good luck.",
            rewardChoices = {{59159, 1}, {59160, 1}, {59161, 1}, {59162, 1}, {59163, 1}},
            rewardMoney = 4500,
        },
        [26039] = {rewardMoney = 2500},
        [26040] = {
            description = "Wha...what IS this!?\n\nThere's great pain growing... from deep in my " ..
                "bowels.\n\nI think... ugh... they must have poisoned me!\n\nThey fed us strangely " ..
                "glowing seaweed that they grow around their stronghold...\n\nI think these cramps will " ..
                "worsen if I don't get more soon...\n\nPlease, <race>. Try to find me some!",
        },
        [26041] = {rewardMoney = 5000},
        [26043] = {rewardMoney = 6500},
        [26045] = {rewardMoney = 2200},
        [26046] = {rewardMoney = 2200},
        [26047] = {rewardMoney = 2200},
        [26049] = {
            description = "Myzrael's no innocent princess. She's a terribly dangerous force, and the " ..
                "giants had every reason to chain her down there. I'm afraid you've been " ..
                "had.\n\nAccording to Gerrig, you have to summon her at the Shards of Myzrael where you " ..
                "first spoke with her. Defeat her and gather her Eldritch Shackles, then bind them to the " ..
                "Shards.\n\nHere's the scroll you'll need. Be careful with it; I risked a few teeth to " ..
                "get it. Good luck, <name>.",
            rewardChoices = {{59208, 1}, {59209, 1}, {59210, 1}, {59211, 1}},
            rewardMoney = 5000,
        },
        [26050] = {rewardMoney = 2500},
        [26051] = {rewardMoney = 5000},
        [26053] = {rewardMoney = 2200},
        [26055] = {rewardMoney = 2500},
        [26056] = {
            description = "One of the Earthen Ring, Wavespeaker Valoren, swam down into the Nightmare " ..
                "Depths to the northeast. We haven't heard from her in awhile.\n\nSwim out there and see " ..
                "if you can find her.",
        },
        [26057] = {
            description = "One of the Earthen Ring, Wavespeaker Valoren, swam down into the Nightmare " ..
                "Depths to the northeast. We haven't heard from her in awhile.\n\nSwim out there and see " ..
                "if you can find her.",
        },
        [26058] = {rewardMoney = 6500},
        [26060] = {rewardMoney = 2500},
        [26061] = {rewardMoney = 2500},
        [26062] = {rewardMoney = 7000},
        [26063] = {rewardMoney = 2200},
        [26064] = {rewardMoney = 2500},
        [26065] = {
            description = "Those tentacle horrors rising from the depths have trapped that poor beast. " ..
                "Please, <name>, can you save it by destroying those things?\n\nWill you free " ..
                "Wil'hai?\n\nHere, take my totem and plant it near the tentacles. The cold it emanates " ..
                "will cause major shrinkage on those monsters and then you'll be able to destroy them.",
            rewardChoices = {{59627, 1}, {59628, 1}},
            rewardMoney = 164000,
        },
        [26066] = {rewardMoney = 2500},
        [26067] = {rewardMoney = 8000},
        [26070] = {
            description = "Our Earthen Ring friends here are wondering if we can lend them a hand. There " ..
                "are faceless down below in the Scalding Chasm that are defiling all of the " ..
                "wildlife.\n\nCan you take care of that for me?",
            rewardChoices = {{59623, 1}, {59624, 1}, {59625, 1}},
            rewardMoney = 82000,
        },
        [26071] = {
            description = "These Earthen Ring want us to do their killing for them. There are faceless " ..
                "down below in the Scalding Chasm that are defiling all of the wildlife.\n\nSwim down " ..
                "there and take care of it.",
            rewardChoices = {{59620, 1}, {59621, 1}, {59622, 1}},
            rewardMoney = 82000,
        },
        [26072] = {
            description = "You must take my totem down into the Scalding Chasm. Use it to capture the " ..
                "energies of the faceless as they die. The totem will keep them from returning from " ..
                "whence they came.\n\nWhen the totem is full, bring it back to me and we will use it to " ..
                "lure their leader up from deep down below.",
            rewardMoney = 82000,
        },
        [26073] = {rewardMoney = 10700},
        [26075] = {rewardMoney = 5500},
        [26076] = {rewardMoney = 5500},
        [26078] = {
            description = "The Dark Iron attack took us by surprise. Their saboteurs managed to damage " ..
                "most of our aircraft, steam tanks, and supplies. We were only able to get a few of our " ..
                "bombers airborne.\n\nEvery technician, recruit, and guard I can spare is scrambling to " ..
                "get the others repaired and flight-ready. Our infantry can only hold out for so long. " ..
                "Take this equipment and help extinguish the burning bombers.",
            rewardMoney = 350,
        },
        [26079] = {
            description = "The Stromgarde Militia has placed bounties on the heads of Lord Falconcrest, " ..
                "and his bodyguard Otto. Falconcrest heads the Syndicate's efforts in the Arathi " ..
                "Highlands, and his death would cause a major disruption in those efforts.\n\nHis " ..
                "bodyguard Otto, although not a strategic target, is a fierce opponent and has killed " ..
                "dozens of our defenders.\n\nTheir bounties may be collected from Captain Nials.",
            rewardChoices = {{59174, 1}, {59175, 1}, {59176, 1}, {59177, 1}},
            rewardMoney = 5000,
        },
        [26080] = {
            description = "<name>, I'm gonna need ya to bring this back to Captain Glovaal. With my " ..
                "condition, it'll take me a week to get back to Darkbreak Cove, and we don't have any " ..
                "time to waste.",
            rewardChoices = {{59650, 1}, {59651, 1}, {59652, 1}},
            rewardMoney = 7800,
        },
        [26081] = {rewardMoney = 4500},
        [26082] = {rewardMoney = 5500},
        [26083] = {rewardMoney = 1100},
        [26084] = {rewardMoney = 1100},
        [26085] = {
            description = "While our engineers work on getting the bombers ready to fly again, our guards " ..
                "and mountaineers continue to fight the invaders.\n\nThey've been out there since the " ..
                "incursion began, without so much as a chance to catch some sleep or have a meal. " ..
                "Ironforge's defenders are among the best on Azeroth, but even they have limits.\n\nTake " ..
                "these banners and plant them in banks of loose snow. Remind the men what they are " ..
                "fighting for and help keep their morale high.",
            rewardMoney = 350,
        },
        [26086] = {
            description = "<Captain Verne looks down at his watch.>\n\nWhere is that hunter? I sent Orako " ..
                "to Underlight Canyon to prepare a recon report a week ago! Sure, he's a handful, and I " ..
                "didn't mind getting him out of my hair, but I need his report.\n\nSay, what's your name? " ..
                "<name>? Would you be willing to go track him down? It seems strange to send a <class> to " ..
                "find a hunter, but I'm running out of options.",
            rewardMoney = 7800,
        },
        [26087] = {
            description = "Shooting fish in a barrel is easy. Shooting fish in an ocean is a little " ..
                "harder.\n\nHave you seen the murlocs down in the canyon, <class>? They don't shoot at " ..
                "all! They have little balls full of glow-juice on their heads that make the fish come to " ..
                "THEM. Hey, we should try that!\n\nGo south, and kill the crabs and groupers in the " ..
                "canyon. They have lots of glow-juice in their skin. I've seen it!",
            rewardMoney = 78000,
        },
        [26088] = {
            description = "< Orako rolls the glow-juice into a ball, then attaches it to a device that " ..
                "he's clearly been working on for a long time.>\n\nHere, I got you this hat. It has a " ..
                "light on it, and it will make fish follow you. Just like the murlocs!\n\nThe murlocs " ..
                "like to hunt in the kelp and coral along the sides of the canyon. If you put on this hat " ..
                "and swim in that kelp, you might catch some fish like they do.",
            rewardMoney = 78000,
        },
        [26089] = {
            description = "A fish ate my wolf, and murlocs look like fish. I'm going to make those " ..
                "murlocs pay!\n\nHead back down to the canyon and kill the fishmen! My wolf will be " ..
                "avenged!",
            rewardMoney = 78000,
        },
        [26090] = {
            description = "<This appears to be an egg from one of the devious great-eels that float up " ..
                "above the canyon. You wonder whether or not Orako might be interested in something like " ..
                "this.>",
            rewardMoney = 39000,
        },
        [26091] = {
            description = "< Orako removes an explosive trap from his sack and shoves it through the " ..
                "egg's outer membrane.>\n\nThis will make the egg explode. Place the egg down next to one " ..
                "of those giant eels, and wait for them to come close. When the egg explodes, the big " ..
                "fish will be almost dead, and you can finish killing it.\n\nSave my wolf! With this egg, " ..
                "you can do it.",
            rewardChoices = {{59653, 1}, {59654, 1}, {59655, 1}},
            rewardMoney = 156000,
        },
        [26092] = {
            description = "<You remind Orako that he was supposed to send a report back to Captain " ..
                "Verne.>\n\nRight, a report. All that I've seen here is fish. Lots and lots of fish.\n\n< " ..
                "Orako looks over at the sack of fish that you brought for him.>\n\nBring this back to " ..
                "the captain. This is my report.",
            rewardChoices = {{59647, 1}, {59648, 1}, {59649, 1}},
            rewardMoney = 7800,
        },
        [26093] = {
            description = "We are fighting a war for Stromgarde, and we are losing. The ogres, the " ..
                "Syndicate and we have divided our once great city, and each faction battles the other " ..
                "into a bloody stalemate.\n\nBut our forces dwindle while our enemy grows.\n\nThough " ..
                "Southshore has fallen, we must not let any further ground be yielded to our " ..
                "enemies.\n\nGo to the Syndicate base in Northfold Manor and slay them. We must reclaim " ..
                "the land for ourselves before the Horde has a chance to creep further.",
            rewardMoney = 2000,
        },
        [26094] = {
            description = "My chief engineer tells me that he's managed to get one of the bombers " ..
                "repaired and airworthy. Take these bombs with you, and look for the repaired bomber at " ..
                "the start of the runway.\n\nOnce you're airborne, use the bombs to do as much damage to " ..
                "the attacking Dark Iron dwarves as you can. I've heard rumors that they're preparing to " ..
                "deploy a new kind of war golem. Keep your eyes peeled for those golems and make them " ..
                "your highest priority targets.",
            rewardMoney = 350,
        },
        [26095] = {
            description = "The Syndicate in Stromgarde do battle with our contingent of militia there. In " ..
                "order to urge the rabble to fight our more disciplined troops, the Syndicate leaders " ..
                "have placed a bounty on our soldiers, awarding gold for each Stromgarde Badge gathered " ..
                "off killed militiamen.\n\nWe want those badges retrieved - we cannot allow the " ..
                "cutthroats to take trophies from our brave fallen!\n\nEnter the Syndicate-controlled " ..
                "area of Stromgarde and hunt them for our badges.",
            rewardChoices = {{59190, 1}, {59191, 1}, {59192, 1}, {59193, 1}},
            rewardMoney = 5000,
        },
        [26096] = {
            description = "We think that we have a use for the merciless ones that your friend from the " ..
                "cave delivered to us. But I need a preservative for it.\n\nDown below in the Scalding " ..
                "Chasm are some mushrooms with the properties that I need. Bring some back up to me and " ..
                "I'll see what I can do.",
            rewardMoney = 82000,
        },
        [26102] = {
            description = "With you leading the way, we've finally broken the momentum of the Dark Iron " ..
                "attack. General Grimaxe, the Dark Iron leader, is attempting to rally his troops from " ..
                "the center of their lines on the frozen lake to the south.\n\nHe stands atop one of " ..
                "their new dark iron golems, shouting orders to his men. If he succeeds in rallying them, " ..
                "they may still be able to overpower us. You must prevent that, <name>. Destroy the golem " ..
                "guarding him, then kill General Grimaxe himself. He is the key to our victory.",
            rewardChoices = {{57579, 1}, {57580, 1}, {57581, 1}, {57582, 1}},
            rewardMoney = 350,
        },
        [26103] = {
            description = "Submarine fuel is expensive!\n\nThe powers-that-be in Gnomeregan were generous " ..
                "enough to deliver several fuel barrels, but we're burning through it faster than " ..
                "expected. That means we're going to need to improvise.\n\nIt's a well-known fact that " ..
                "sea creatures are full of all kinds of interesting chemicals... like oil. Take this " ..
                "device up to Kothrun's End and stick it into the corpses of terrapins, remoras, and " ..
                "hammerhead sharks. If we don't get more submarine fuel, their oil might be our only hope.",
            rewardMoney = 78000,
        },
        [26105] = {
            description = "The Horde has spies in this area? Darkbreak Cove is nearby, and inside lies " ..
                "the Pincer X2! The Horde must not be allowed anywhere nearby!\n\nSomeone in Darkbreak " ..
                "Cove will want to hear of this... after you finish slaying some more of these dirty " ..
                "Horde spies.",
            rewardMoney = 78000,
        },
        [26106] = {
            description = "How much do you know about fuel, <name>? Constructing the perfect fuel is a " ..
                "tricky job, as there's plenty of factors to balance: chrono-pyroxidation parameters, " ..
                "tempero-incendiary variables, conflagrational siltification criteria... and that's only " ..
                "naming a few.\n\nHopefully the samples you brought me can be combined in the right " ..
                "proportions to create... the perfect bio-fuel. Use that table over there and try " ..
                "combining some samples! Bring the result to me when you're done.",
            rewardChoices = {{59644, 1}, {59645, 1}, {59646, 1}},
            rewardMoney = 78000,
        },
        [26107] = {rewardMoney = 2500},
        [26108] = {rewardMoney = 2500},
        [26110] = {
            description = "It's funny. Kin and I have been through so much together, and here we find " ..
                "ourselves back in Arathi, like so many years ago.\n\nWe broke up a plot to create a new " ..
                "plague right here, her and I. It doesn't look like the Horde learned their lesson, " ..
                "because they're all over this farm yet again.\n\nTheir undead courier is shuffling " ..
                "around as obvious as daylight. If you want to help, find the courier and bring back " ..
                "whatever they're carrying.",
            rewardMoney = 2500,
        },
        [26111] = {
            description = "I now imbue you with the energies of the corrupting faceless.\n\nSwim down to " ..
                "my luring totem in the trench to the northeast. Release the energies through it. Bring " ..
                "back the brain of their leader.\n\nCall forth to Ick'thys the Unfathomable... it will " ..
                "come!",
            rewardChoices = {{59618, 1}, {59619, 1}, {59617, 1}},
            rewardMoney = 164000,
        },
        [26112] = {
            description = "So just how did all those Dark Iron warriors end up here, on the doorstep of " ..
                "Ironforge, on the verge of invading our city?\n\nDoes not 'Empress' Moira, a member of " ..
                "our esteemed Council of Three Hammers, rule the Dark Iron? This cannot have happened " ..
                "without her knowledge and consent. This was no ragtag band of rebel dwarves, but a " ..
                "well-organized and fully equipped invasion force.\n\nI have prepared a report on the " ..
                "battle for the airfield. Take it to Ironforge, to the High Seat and confront her!",
            rewardMoney = 700,
        },
        [26113] = {
            description = "The Horde have held Go'shek Farm to the east for a long time; it's never been " ..
                "of much concern compared to the rest of our problems here. But there's been reports of " ..
                "undead activity in the area.\n\nAnything more alarming than shuffling peons over there " ..
                "warrants investigation. This isn't the first time the undead have been up to no good at " ..
                "the farm, so I've sent my best scouts there to check it out. Report to Quae and Kinelory " ..
                "and they'll fill you in.",
            rewardMoney = 1200,
        },
        [26114] = {
            description = "< Quae begins to go through the folder.>\n\nExpansion...control of " ..
                "territory... these undead aren't cooking up anything new, but they're planning to roll " ..
                "over all of Arathi. We need to disrupt their plans.\n\nI'll keep a lookout from up here. " ..
                "You go with Kin, and get those invasion plans. We're not going to let these walking " ..
                "corpses even know what day it is out here.\n\nAnd keep her safe, you hear me?",
            rewardMoney = 250,
        },
        [26115] = {rewardMoney = 10700},
        [26116] = {description = "All right, <name>. I'm ready if you are.\n\nShall we?", rewardMoney = 2500},
        [26117] = {
            description = "I've seen Kinelory look way worse after a night in the tavern than she does " ..
                "now. You obviously did a good job protecting her.\n\nRefuge Pointe will want to know of " ..
                "our success. I'm going to stay here with Kin and let her catch her breath. Go on ahead " ..
                "without us.",
            rewardChoices = {{59168, 1}, {59169, 1}, {59170, 1}},
            rewardMoney = 5000,
        },
        [26118] = {
            description = "The ambassador's betrayal will long haunt me. You must arrest him before he " ..
                "can do further harm, or worse, before he can escape and start planning the next attack. " ..
                "Ironforge is not safe with Ambassador Slaghammer free inside the city.\n\nTake these " ..
                "manacles and go to the Dark Iron embassy. It's just to the north of the High Seat, " ..
                "around the rim of the Great Forge. Arrest Ambassador Slaghammer and return with him.",
            rewardChoices = {{57583, 1}, {57584, 1}, {57585, 1}},
            rewardMoney = 350,
        },
        [26120] = {
            description = "The Dragonmaw orcs nearby are fast becoming a nuisance. Their suicidal attacks " ..
                "on the grove are merely annoying, though they provide my sentinels with some needed " ..
                "practice.\n\nMy scouts, however, have seen them rounding up black dragon whelps in nets. " ..
                "The last thing these lands need is a crude revival of dragon-taming. Strike out to the " ..
                "east, <class>, and cut down the whelpstealers; make sure their folly does not come back " ..
                "to haunt us later.",
            rewardChoices = {{59116, 1}, {59115, 1}, {59114, 1}},
            rewardMoney = 1800,
        },
        [26121] = {
            description = "You are seeink spies up above? This is not good... not good at all, " ..
                "comrade.\n\nReturn to Korthun's End and destroy them, my friend.",
            rewardMoney = 78000,
        },
        [26122] = {
            description = "Have you ever smelled submarine fuel, <name>? It's nasty stuff. Unfortunately, " ..
                "we need to burn huge amounts of it to get the Verne to move, and it's both bad-smelling " ..
                "AND deadly to the local wildlife. We need to be more environmentally conscious.\n\nThe " ..
                "sea creatures nearby have particularly oily flesh. Take this device up to Seabrush - " ..
                "just above this cave - and use it on the corpses of terrapins, remoras, and hammerhead " ..
                "sharks. Their oil might save the lives of hundreds of other sea creatures.",
            rewardMoney = 78000,
        },
        [26124] = {
            description = "The Alliance has spies in this area? Tenebrous Cavern is nearby, and inside " ..
                "lies the Horde's new submarine, the Verne! The Alliance must not be allowed anywhere " ..
                "nearby!\n\nSomeone in the cavern will want to hear of this incursion... after you finish " ..
                "slaying some more of these scheming Alliance spies.",
            rewardMoney = 78000,
        },
        [26125] = {
            description = "You saw spies up above? This is not good... I won't have it.\n\nReturn to " ..
                "Seabrush and get rid of them before they start trickling into our hideout.",
            rewardMoney = 78000,
        },
        [26126] = {
            description = "How much do you know about fuel, <name>? Constructing the perfect fuel is a " ..
                "tricky job, as there's plenty of factors to balance: chrono-pyroxidation parameters, " ..
                "tempero-incendiary variables, conflagrational siltification criteria... and that's only " ..
                "naming a few.\n\nHopefully the samples you brought me can be combined in the right " ..
                "proportions to create... the perfect bio-fuel. Use that table over there and try " ..
                "combining some samples! Bring the result to me when you're done.",
            rewardChoices = {{59641, 1}, {59642, 1}, {59643, 1}},
            rewardMoney = 78000,
        },
        [26127] = {
            description = "I and everyone else thought these fools were just Dark Iron up to no good, but " ..
                "these nutters are fullblown cultists!\n\nThe Twilight's Hammer wants nothing short of " ..
                "the destruction of the entire world. They've thrown their lot in with Deathwing and " ..
                "Ragnaros, and they've got a history with the Dark Iron.\n\nBut it doesn't matter who " ..
                "they are, what matters is they're in Dun Modr and they need to get out! I'll not let any " ..
                "past here. You get in there and crack some skulls!",
            rewardMoney = 3500,
        },
        [26128] = {
            description = "I've defended the Thandol Span from being destroyed before, against the Dark " ..
                "Iron themselves. And so did my father, and his father before him...\n\nThe only Dark " ..
                "Iron that managed to give me the slip ran straight for the bridge. Something's amiss, " ..
                "and I'm betting when we get there we'll be waltzing right into an ugly trap.\n\nI could " ..
                "use your help, <name>, for Ironforge. Are you with me?",
            rewardChoices = {{59110, 1}, {59111, 1}, {59112, 1}, {59113, 1}},
            rewardMoney = 3500,
        },
        [26129] = {
            description = "Listen, <name>. For the first time since the civil war I agree with Greymane. " ..
                "Now is the time to put aside our quarrel.\n\nIt sure doesn't look like these beasts care " ..
                "much whether you're a rebel or a royal.\n\nSend word back to Greymane. My men will join " ..
                "his.\n\nThere's a safehouse not far from here, in Josiah's cellar. My lads stashed some " ..
                "heavy artillery there.\n\nTell our king that my arsenals are now at his disposal.",
            rewardMoney = 5,
        },
        [26130] = {
            description = "L'ghorek is the ancient that rests upon the shelf across from us. It is being " ..
                "controlled and its life energies slowly consumed by something immense beneath " ..
                "us.\n\nThere is a cave known as the Undershell down below L'ghorek. In that cave are " ..
                "three powerful ogre magi that are maintaining a ritual connecting the thing below with " ..
                "the ancient. You must kill these three to disconnect L'ghorek.",
            rewardMoney = 82000,
        },
        [26131] = {
            description = "I've been waiting for the council to hear my plea for hours, and it's not " ..
                "looking good. Moira's greatest desire seems to be to paralyze the council.\n\nMeanwhile, " ..
                "Loch Modan suffers. Our enemies are many and our resources are few. Please, <name>, " ..
                "perhaps you will hear me if the council will not. Speak to Gryth Thurden, Ironforge's " ..
                "gryphon master. He's in the eastern part of the Great Forge. He'll provide a free flight " ..
                "to the South Gate Pass. Introduce yourself to Pilot Hammerfoot once you arrive.",
            rewardMoney = 35,
        },
        [26132] = {
            description = "The ogre magi within the Undershell have summoned protectors for themselves: " ..
                "fleshling fiends from the netherworld.\n\nWe cannot risk these aberrations from being " ..
                "later used against our forces. While you are in there, I want you to destroy as many of " ..
                "those things as you can.",
            rewardMoney = 82000,
        },
        [26133] = {
            description = "Those ogre magi inside the Undershell have summoned defenders: fleshling " ..
                "fiends from the netherworld.\n\nI do not want to see these aberrations used against our " ..
                "forces. While you are in there, destroy all of them!",
            rewardMoney = 82000,
        },
        [26135] = {
            description = "What you told me of the naga before has been plaguing my mind. Who are these " ..
                "allies they're summoning? Do they really think they can defeat the " ..
                "Tidehunter?\n\nEscaping this cave brings a degree of relief, but our purpose here " ..
                "remains. I'm hoping you will be willing to seek answers from the Battlemaiden one last " ..
                "time.\n\nThere's only one place that I can think of where they would have taken the " ..
                "artifact - the temple atop the ruins. It's sure to be well guarded. Proceed carefully.",
            rewardChoices = {{59666, 1}, {59667, 1}, {59668, 1}},
            rewardMoney = 312000,
        },
        [26137] = {
            description = "I'm sure you've seen just how bad the damage to the Loch is by now. The damage " ..
                "spreads further than that, I'm afraid; all that water had to go somewhere, and it went " ..
                "down into the Wetlands.\n\nThere's a lot of fine dwarves down there trying to help out, " ..
                "and they need supplies. That's why I sent two of my mountaineers ahead with a cask of " ..
                "ale along the path into the Wetlands.\n\nI haven't heard back from them since they set " ..
                "off down the road to Dun Algaz. Would you mind checking up on them?",
            rewardMoney = 600,
        },
        [26139] = {
            description = "You should go on ahead and warn the other side of the span about this, " ..
                "<name>.\n\nOver the bridge to the north you'll find Refuge Pointe, the stronghold of the " ..
                "Alliance in Arathi. Tell Captain Nials to keep an eye out for these Twilight's Hammer " ..
                "curs.",
            rewardMoney = 900,
        },
        [26140] = {
            description = "Place the dead merciless one upon your head to pose as one of their " ..
                "slaves.\n\nEnter L'ghorek. Commune with the ancient.",
            rewardMoney = 82000,
        },
        [26141] = {
            description = "ON THE OTHER... SIDE OF... MY CHAMBER THERE... ARE... CANDIDATES FOR " ..
                "ASCENSION.\n\nWE WILL NEED... THEIR... RUNESTONES OF BINDING... TO CREATE A... MEANS OF " ..
                "CONTROLLING... A BOUND ELEMENTAL.",
            rewardMoney = 82000,
        },
        [26142] = {
            description = "TO STOP... THEIR... RITUALS OF ASCENSION... YOU MUST DESTROY... THE ANCIENT " ..
                "CONDUITS.\n\nTHEY USE... THE CONDUITS TO... SIPHON... MY ENERGIES AWAY... AND MAKE... " ..
                "ASCENDANTS.\n\nA FIGHT WITH... NEPTULON IS IMMINENT. THE TWILIGHT'S HAMMER... MUST BE " ..
                "DENIED... THESE CREATURES.",
            rewardMoney = 82000,
        },
        [26143] = {
            description = "<The voice of the ancient presses against your mind.>\n\nNOW THAT... YOU HAVE " ..
                "STOLEN... THE ENERGIES OF... THE FAITHFUL, ENTER... THE TEMPLE AND... DESTROY... " ..
                "HALLAZEAL THE ASCENDED!",
            rewardChoices = {{59608, 1}, {59609, 1}, {59610, 1}, {59607, 1}},
            rewardMoney = 258000,
        },
        [26144] = {
            description = "The Twilight cultist dropped this key. Use it to free the Alliance prisoners " ..
                "in the cages inside of L'ghorek.\n\nHurry before the prisoners become sacrifices to " ..
                "whatever lurks below!",
            rewardChoices = {{59614, 1}, {59615, 1}, {59616, 1}},
            rewardMoney = 82000,
        },
        [26145] = {
            description = "<class>, you may or may not be aware of the trogg threat looming over dwarven " ..
                "lands. With the Ironforge Reserve called up to the Alliance Front, we're left with a " ..
                "fraction of the defense forces needed to keep these lands safe. My regiment is assigned " ..
                "to watch over the town here and we cannot leave our post for fear of invasion.\n\nBut we " ..
                "need some pressure put on those damned troggs lurking in the hills. If you're up to the " ..
                "task, wage an assault on the troggs. Bring me back eight trogg stone teeth as proof.",
            rewardMoney = 500,
        },
        [26146] = {
            description = "We need to protect the Loch, <name>! With so many of the King's soldiers " ..
                "fighting valiantly on remote battlefields, we've become overwhelmed on the home front. " ..
                "Troggs are tunneling up from every crevice! The trogg infestation poses the largest " ..
                "threat to Ironforge.\n\nWe need you, brave adventurer, to venture forth and lay waste to " ..
                "the trogg threat. Slay twelve Stonesplinter troggs and venture back.",
            rewardChoices = {{58984, 1}, {58985, 1}, {58986, 1}},
            rewardItems = {{414, 1}},
            rewardMoney = 500,
        },
        [26147] = {
            description = "The Mountaineers tell me you are quite brave and capable, <name>. We need a " ..
                "<race> like you around here. The Trogg problem isn't getting any better. The reserves " ..
                "have been called to the front and we're all alone out here. But now that we have a " ..
                "seasoned <class> here, let's see what you can do.\n\nGo out and kill 8 Stonesplinter " ..
                "Shaman and 8 Stonesplinter Bonesnappers. You should find them in and around the caves in " ..
                "the southern mountains.\n\nLet's see if you live up to your reputation, Trogg-Slayer.",
            rewardChoices = {{58994, 1}, {58995, 1}, {58996, 1}},
            rewardItems = {{2863, 1}},
            rewardMoney = 500,
        },
        [26148] = {
            description = "It appears that these beasts in Loch Modan are following the lead of a " ..
                "chieftain named Grawmug. He's the biggest of all the troggs here, lurking deep within " ..
                "the darkness of the caves to the north.\n\nIf you feel yourself worthy, <name>, I want " ..
                "you to lead the assassination mission on Grawmug.",
            rewardChoices = {{58988, 1}, {58989, 1}, {58990, 1}},
            rewardMoney = 1000,
        },
        [26149] = {
            description = "The Twilight cultist dropped this key. Use it to free the Horde prisoners in " ..
                "the cages inside of L'ghorek.\n\nHurry before the prisoners become sacrifices to " ..
                "whatever lurks below!",
            rewardChoices = {{59611, 1}, {59612, 1}, {59613, 1}},
            rewardMoney = 82000,
        },
        [26150] = {
            description = "You seem like the helpful type, <name>. How about doing an old man a " ..
                "favor?\n\nThe last time I was over at the Maclure Vineyards I overheard Maybell crying " ..
                "in her cottage. Would you be so kind as to go check up on her? I'm a little worried.",
        },
        [26152] = {
            description = "By decree of the Stormwind Army, a bounty has been placed on the head of James " ..
                "Clark.\n\nClark is wanted for robbery, burglary, arson, and murder. He is also a suspect " ..
                "in the kidnapping and disappearance of the Brackwell's prized pig, Princess.\n\nJames " ..
                "Clark was last seen heading towards Eastvale Logging Camp.\n\nBring James Clark to " ..
                "justice and report to Marshal McCree at Eastvale Logging Camp.",
        },
        [26153] = {
            description = "My daughter Penny loves pumpkin pancakes but we have had a shortage of " ..
                "pumpkins here in Elwynn from the frostbite last season. I have heard of a new pumpkin " ..
                "patch north of Stormwind that might be ripe for the picking now though. Head out and " ..
                "harvest a few of those ripe pumpkins for me and let's see what we can do.",
            rewardMoney = 114000,
        },
        [26154] = {
            description = "NOW, TAKE... THE ATTUNED RUNESTONE... AND USE... IT TO POSSESS... ONE OF... " ..
                "THE BOUND TORRENTS... AT... THE CENTRAL TEMPLE. THEY WILL IGNORE... YOU. YOU ARE " ..
                "BENEATH... THEIR NOTICE.\n\nUSE... THE ELEMENTAL'S POWERS... TO DESTROY... THE TWILIGHT " ..
                "DEVOTEES... AND... THEIR... FACELESS OVERSEERS.",
            rewardMoney = 164000,
        },
        [26157] = {
            description = "I need you to pass on a message for me.\n\nKasim Sharim is an old blood mage " ..
                "that knows a great deal about the demons of the Blasted Lands. Though you wouldn't know " ..
                "from looking at him, he's quite old, and very powerful... if a little eccentric. As of " ..
                "late, he spends his days in the back of the Serpent's Coil, a cave not far from where " ..
                "you killed those cultists.\n\nPlease, deliver this message to him. He will know what it " ..
                "means.",
            rewardMoney = 8500,
        },
        [26158] = {
            description = "Did you have fun fighting your way to the back of this cave? I admit, I " ..
                "haven't picked the most... convenient of spots to perform my studies, especially for " ..
                "passing adventurers who wish to enter and leave at will.\n\nHowever, I can allow you to " ..
                "attune yourself to my bloodstone teleporters. Simply place your hands on the stone in " ..
                "the back corner, and you will be teleported outside of the cave. Then use the stone " ..
                "outside to teleport back!",
            rewardMoney = 2100,
        },
        [26159] = {
            description = "Like any good bloodmage, I perform my magic with blood. All blood is " ..
                "different, and the Blasted Lands has several useful flavors, if you know where to " ..
                "look.\n\nFor our purposes? Basilisks and hyenas, even amounts. We're going to need " ..
                "plenty of it. Head west, to the center of the Blasted Lands. And don't forget... you can " ..
                "use that teleporter!",
            rewardMoney = 8500,
        },
        [26160] = {
            description = "I suppose you want to know what we're doing. Here's the short version - a " ..
                "version at which I happen to be an expert:\n\nThe Shadowsworn cultists wish to summon " ..
                "the demon, Razelikh, back to the Blasted Lands. We cannot allow this to happen. So we're " ..
                "going to summon him ourselves, and then kill him. A task not as simple as it " ..
                "sounds...\n\nLet me know when you are ready to begin the blood ritual, and then stand " ..
                "back.",
            rewardMoney = 2100,
        },
        [26161] = {
            description = "We need Loramus Thalipedes, the demon hunter. He knows Razelikh's true name, " ..
                "and as you know: if you know the name of the demon, you have power over it. The problem " ..
                "is that Loramus has been killed, and his body torn apart.\n\nIf you bring me the pieces, " ..
                "we still have a recourse. All three pieces are in the west... the Dreadmaul ogres hide " ..
                "them in their caves. Move quickly, for much like Grimeo, Loramus also owes me a debt...",
            rewardMoney = 8500,
        },
        [26162] = {
            description = "Up on the bluffs to the west lies a powerful altar. A powerful DEMONIC altar, " ..
                "guarded by cultists, but powerful nonetheless. If you can reach it, you can use it to " ..
                "bring Loramus back to us.\n\nThe altar will likely resist your efforts, so you'll have " ..
                "to protect Loramus' body while the ritual completes. Bring the demon hunter back to me " ..
                "afterwards.",
            rewardChoices = {{59387, 1}, {59388, 1}, {59389, 1}, {59390, 1}, {59391, 1}},
            rewardMoney = 25500,
        },
        [26163] = {
            description = "Razelikh plans to return to the Blasted Lands and overwhelm Azeroth with his " ..
                "demons. Even now, he is preparing to summon his legions to eliminate us. With these " ..
                "three amulets, we have the method to summon him... but no way to destroy him.\n\n<The " ..
                "gnome quickly draws a rune in the air, then hands it to you.>\n\nDeliver this to Grimeo " ..
                "at the Dark Portal, to the southeast. He will guide you. Quickly! Time is short! And so " ..
                "am I!",
            rewardMoney = 2100,
        },
        [26164] = {
            description = "Kasim wants you to gather granite chips from these chunks of rock around the " ..
                "Dark Portal. I don't know what he'd want rocks for, but I have my suspicions, and " ..
                "they're not pleasant ones.\n\nUse this pick and look for small outcroppings of rock " ..
                "along the edge of the portal's blast radius.",
            rewardMoney = 8500,
        },
        [26165] = {
            description = "Sharim wants demon blood. Speaking personally, the stuff does not even seem " ..
                "like blood to me - more like liquid rot - but that is of no consequence.\n\nLuckily for " ..
                "you, the area around the Dark Portal is crawling with demons. Infernals, felhounds, " ..
                "felguards... they've all got what you need, in copious, pustulent amounts.",
            rewardMoney = 8500,
        },
        [26166] = {
            description = "<Grimeo finishes packing the materials up in a neatly-wrapped " ..
                "package.>\n\nThat's all that the gnome asked of us. When you see him, make sure you let " ..
                "him know that this task ends my debt. I will not suffer his requests any longer.",
            rewardMoney = 4000,
        },
        [26167] = {
            description = "To summon our demon, we need three amulets, and the first is the Amulet of " ..
                "Allistarj.\n\nAllistarj himself is dead, but he locked his amulet up in a trove inside " ..
                "this very cave. Along with the other amulets, this relic will give us access to " ..
                "Razelikh's perch.\n\n<Kasim concentrates for a moment.>\n\nThe amulet is close to the " ..
                "entrance. I recommend using the teleporter.",
            rewardMoney = 8500,
        },
        [26168] = {
            description = "The second amulet, Sevine's amulet, is in the hands of a murloc, far to the " ..
                "south, on a shelf that overlooks the Shattershore. How it ended up in that murloc's " ..
                "possession, I cannot say, but I can state with certainty that you will find it " ..
                "there.\n\nBring her amulet to me, along with the rest.",
            rewardMoney = 8500,
        },
        [26169] = {
            description = "Grol... the ogre.\n\n<Kasim laughs.>\n\nIt would seem that Grol's body no " ..
                "longer rests with the ogres. His body, along with his amulet of power, is in a wrecked " ..
                "ship off the Shattershore, to the east. His amulet is the last... once combined, the " ..
                "three will give us access to Razelikh, and therein lies our chance to stop his madness.",
            rewardChoices = {{59380, 1}, {59381, 1}, {59382, 1}, {59383, 1}},
            rewardMoney = 8500,
        },
        [26170] = {
            description = "The knife is ready. Loramus is present, and he knows what he must do. I must " ..
                "now take the three amulets and use their enchantment to grant you access to Razelikh, " ..
                "the amulets' creator.\n\nI am prepared to perform the ritual on you and Loramus. Speak " ..
                "with me when you are both ready.",
            rewardMoney = 2100,
        },
        [26171] = {
            description = "Hero, listen well.\n\nFirst, we must travel to the Deathly Usher, who waits at " ..
                "the northern foot of the Rise of the Defiler, to our northwest. The usher will take us " ..
                "to the top of the rise. Once there, you will help me defeat Razelikh, for I fear I am " ..
                "not strong enough to defeat him alone.\n\nMost importantly, I need you to hold the stone " ..
                "knife, and do not use it until I tell you to. The knife will trap Razelikh's soul within " ..
                "its new, eternal prison.\n\nIf we succeed, speak with Grimeo, the draenei.",
            rewardChoices = {{59398, 1}, {59397, 1}, {59396, 1}},
            rewardMoney = 34700,
        },
        [26172] = {
            description = "Contrary to popular belief, ancient and powerful bloodmages do NOT drink " ..
                "blood. We eat normal food like everybody else - something which can be hard to come by " ..
                "in the recesses of a hostile cultist stronghold.\n\nThe ashmane boars in the central " ..
                "valley of the Blasted Lands are, if nothing else, convenient for eating, as their meat " ..
                "does not require any cooking. Would you hunt these boars and help me replenish my " ..
                "ever-dwindling foodstores?",
            rewardChoices = {{59384, 1}, {59385, 1}, {59386, 1}},
            rewardMoney = 8500,
        },
        [26173] = {
            description = "The only reason you see me standing aside Horde soldiers is because our duty " ..
                "outweighs our enmity... however slightly. We have been charged with protecting the Dark " ..
                "Portal from unauthorized travel, and with the recent cataclysm, we are particularly " ..
                "susceptible to an attack. We've already heard reports of black dragons in the " ..
                "area...\n\nWith my men focused on their duty, we need someone to keep the area demons in " ..
                "check. Around the portal you will find three demon lieutenants. Slay them.",
            rewardMoney = 17000,
        },
        [26174] = {
            description = "< Watch Commander Relthorn Netherwane speaks in hushed tones.>\n\nI have " ..
                "orders from... higher up... that you would be suitable for. I've seen the Horde " ..
                "periodically referring to a stack of papers on that barrel over there. I'd like you to " ..
                "take a look at those papers and find out what it is that they're plotting. My duty and " ..
                "station prevent me from such a questionable task, but a newcomer like you might be able " ..
                "to slip in unnoticed...",
            rewardChoices = {{59393, 1}, {59394, 1}, {59395, 1}},
            rewardMoney = 8500,
        },
        [26175] = {
            description = "Other than what you've seen, the Portal's been surprisingly quiet. There isn't " ..
                "much more work I can give to you, I'm afraid.\n\nIf you're looking for trouble, you " ..
                "might try the Gilnean fishing village to the southwest. Surwich, I think it was.\n\nI " ..
                "know we're supposed to be friends with the Gilneans, but really? Worgen? I had enough " ..
                "trouble getting used to the draenei.",
            rewardMoney = 4500,
        },
        [26176] = {
            description = "You've helped us quite a bit here. If you're leaving, I'd ask you to take this " ..
                "status report up to Thelsamar.\n\nFollow the road just north, and you can't miss it. " ..
                "Mountaineer Kadrell will want the report.",
            rewardMoney = 500,
        },
        [26177] = {
            description = "Fresh crab legs have always been one of the King's favorite foods. We have had " ..
                "good luck catching fresh crabs in the canals over the past few weeks. Do you think you " ..
                "can lend me a hand and catch a few of them for me? Be sure to catch them alive, they are " ..
                "no good to me dead, the King requires the freshest catch we can muster.",
            rewardMoney = 20000,
        },
        [26179] = {
            description = "This explains the buildup of Venture Co. employees and equipment we've seen in " ..
                "Mulgore. Those goblins... their company is expanding too quickly for their own good. " ..
                "It's how they say, show a goblin something, and you can hear the scales in the " ..
                "background.\n\nGreedy little things, they are. Unfortunately for their business " ..
                "enterprise, we tauren cannot allow them to conduct their operations in our lands. Go to " ..
                "their mine northeast of the ravaged caravan and send them a message.",
            rewardMoney = 175,
        },
        [26180] = {
            description = "According to the documents you salvaged from the caravan, the Venture Co. " ..
                "created many plans to attempt to drive us from our lands here, so that they could have " ..
                "free reign to plunder our lands.\n\nThe depths that they would sink to accomplish their " ..
                "goals disgusts and appalls me. I want the mastermind behind their plans killed. His name " ..
                "is Supervisor Fizsprocket, you will find him at the Venture Co. mine east of the ravaged " ..
                "caravan. Bring me his clipboard, we shall see if we find out anything useful.",
            rewardChoices = {{57208, 1}, {57242, 1}},
            rewardMoney = 450,
        },
        [26181] = {
            description = "YOU MUST RETURN... TO... THE DARKBREAK COVE. ERUNAK STONESPEAKER AWAITS... YOU " ..
                "WITHIN.\n\nI DIE NOW....",
        },
        [26182] = {
            description = "YOU MUST RETURN... TO... THE TENEBROUS CAVERN. ERUNAK STONESPEAKER AWAITS... " ..
                "YOU WITHIN.\n\nI DIE NOW....",
        },
        [26183] = {
            description = "I am forever in debt to our King for all that he has done for us. One thing I " ..
                "can do for him is make his favorite drink! Lucky for us, the ingredients we need to make " ..
                "this wonderful drink are located right here in Stormwind City. Apple trees can be found " ..
                "in every district of Stormwind. These trees are too tall to pick the fruit from, but " ..
                "lucky for us the apples have fallen to the ground and are easy to retrieve.",
            rewardMoney = 20000,
        },
        [26184] = {
            description = "Not surprisingly, most of our citizens in Surwich did not come to the Blasted " ..
                "Lands for the pleasant atmosphere. They came following the dream of an idealistic druid: " ..
                "Marl Wormthorn. Wormthorn believed that the Tainted Scar could be healed, and attempted " ..
                "to grow it back.\n\nIt looks like he was wrong. He grew his forest, but the land is " ..
                "still plagued by demons, and his great-tree is twisted and gnarled.\n\nI'm still " ..
                "hopeful. Maybe if we head into the Tainted Forest and clear out some of the taint...",
            rewardMoney = 17500,
        },
        [26185] = {
            description = "I believe that the taint of the Blasted Lands has finally exerted its " ..
                "influence over my friend Wormthorn. His experiment has failed, and his great-tree now " ..
                "only serves as a focus for the demons to rally around.\n\nThe tree must come down, and " ..
                "Wormthorn with it. Speak with the Cenarion Observer on the other side of town; she " ..
                "should have some idea how to proceed.\n\n<name>: the act we are about to commit must not " ..
                "be made known to the townspeople of Surwich. Morale is low enough as-is.",
            rewardMoney = 900,
        },
        [26186] = {
            description = "We need a way to get Wormthorn's attention. Something to break him out of his " ..
                "trance. Something that's guaranteed to work.\n\nThe few types of wildlife that managed " ..
                "to make a foothold in the Tainted Forest are, without a doubt, affected by the land's " ..
                "latent energies. Your task is to collect their body parts and find a way to combine them " ..
                "into a vessel. If Wormthorn's trance is druidic, or even if it is demonic, a large " ..
                "enough vessel of tainted animal flesh should be able to break it.",
            rewardMoney = 17500,
        },
        [26187] = {
            description = "When word gets out about what we've done... there's no saying what the " ..
                "citizens of Surwich will do. They cling so closely to Wormthorn's dream...\n\n...but " ..
                "still, it must be done. Take the demoniac vessel and use it on Marl Wormthorn to pull " ..
                "him from his trance. Return to me when he is no more.",
            rewardChoices = {{59399, 1}, {59400, 1}, {59401, 1}, {59402, 1}},
            rewardMoney = 26500,
        },
        [26188] = {
            description = "My grandfather told me stories about his battles with a strider named " ..
                "Mazzranache. He told me of its demonic red eyes, razor-sharp talons and venomous " ..
                "bite.\n\nAs fortune would have it, while traveling across the plains, I encountered it, " ..
                "and it took a nasty bite from my shoulder. He was as terrible as my grandfather " ..
                "described. I have gathered all the parts of the remedy I need to cure myself... except a " ..
                "flatland cougar femur.\n\nI grow weaker by the moment... please, help me.",
            rewardChoices = {{57209, 1}, {57234, 1}, {66616, 1}},
            rewardMoney = 225,
        },
        [26189] = {
            description = "When we hauled up here to get away from the raptors, we put ourselves right " ..
                "next to a whole slew of Dragonmaw orcs!\n\nI've heard the stories in Menethil, how the " ..
                "Dragonmaw are even cruder barbarians than other orcs, how they strangle black dragons " ..
                "with their bare hands... I don't know how much of it's true, but I know we can't just " ..
                "let 'em sit up here in the hills.\n\nYou've got the chops for it, <name>. Head east to " ..
                "the Angerfang Encampment, take care of those orcs, and make sure you get their leader!",
            rewardMoney = 3500,
        },
        [26190] = {
            description = "If there is one meal I know the King likes, it's fresh catfish. Catfish are " ..
                "easy to prepare but hard to catch. That's where you come in! We have a good population " ..
                "of Gigantic Catfish here in the waters of Stormwind but the competition to catch them is " ..
                "intense to say the least. I need you to figure out a way to \"acquire\" some of these " ..
                "fine catfish for our King. You will find fisherman at the small canal docks around town. " ..
                "You should be able to figure out the rest of the plan on your own.",
            rewardMoney = 56000,
        },
        [26192] = {
            description = "The orphans of Stormwind are often forgotten, but not today my friend. The " ..
                "king has requested a special batch of cookies be baked and sent immediately over to the " ..
                "orphanage. I was almost finished with the final batch when I ran out of confectioners' " ..
                "sugar. Can you run out and get some more for me? You should be able to find it at any of " ..
                "the general stores or inns inside of Stormwind.",
            rewardMoney = 20000,
        },
        [26193] = {
            description = "The whispers of the elements are crowding my thoughts, <name>...\n\nThe Throne " ..
                "of Tides is under siege!\n\nI cannot stand idly by while the naga threaten Neptulon's " ..
                "realm. We must find a way to join forces with him.\n\nCaptain Taylor will escort me to " ..
                "the depths where I can commune directly with Neptulon.\n\nI must ask you to take a more " ..
                "violent path. Keep the enemy forces distracted until I arrive safely at entrance to the " ..
                "Throne of Tides.\n\nMay the spirits see us through, <name>.",
            rewardChoices = {{59604, 1}, {59606, 1}, {59605, 1}},
            rewardMoney = 246000,
        },
        [26194] = {
            description = "The whispers of the elements are crowding my thoughts, <name>...\n\nThe Throne " ..
                "of Tides is under siege!\n\nI cannot stand idly by while the naga threaten Neptulon's " ..
                "realm. We must find a way to join forces with him.\n\nNazgrim will escort me to the " ..
                "depths where I can commune directly with Neptulon.\n\nI must ask you to take a more " ..
                "violent path. Keep the enemy forces distracted until I arrive safely at entrance to the " ..
                "Throne of Tides.\n\nMay the spirits see us through, <name>.",
            rewardChoices = {{59601, 1}, {59603, 1}, {59602, 1}},
            rewardMoney = 246000,
        },
        [26195] = {
            description = "The greenwarden was a local legend. Many thought him a myth... the plant-man, " ..
                "protector of the wetlands. The night elves came here just to find him, and after they " ..
                "succeeded they ended up settling down to the east.\n\nThey've got a whole grove over " ..
                "there to watch over the greenwarden, and I've heard he's been acting up, enraged by the " ..
                "flooding and damage to the land.\n\nThe elves are good people. They could use the help " ..
                "of someone like you. If you get a chance, go tell the head druid what you've done here.",
            rewardMoney = 800,
        },
        [26196] = {
            description = "The dwarves of Dun Modr fight day and night against the Dark Iron that have " ..
                "invaded their old home. While we cannot yet send our sentinels to risk their lives for " ..
                "them, we do send much needed supplies that they may sustain their vigil.\n\nIf you " ..
                "would, bring this package to Longbraid the Grim, north of here. His men must certainly " ..
                "need its contents.",
            rewardMoney = 900,
        },
        [26197] = {
            description = "It's a victory for us every time we're able to help another survivor escape " ..
                "from the contaminated halls of Gnomeregan. <class>s like you will play an important part " ..
                "in the future of Gnomeregan. To that end, our leader, High Tinker Mekkatorque has " ..
                "assembled a team of trainers to help you learn your arts.\n\nBipsi Frostflinger will " ..
                "help oversee your training and adjustment to life on the surface. She's waiting for you " ..
                "outside the tall building to the northeast.",
            rewardMoney = 8,
        },
        [26198] = {
            description = "As you go on wild adventures and grow your power, you'll start to develop new " ..
                "connections to the arcane, granting you new spells.\n\nYou'll see. Go do it! Show me " ..
                "what you learn! I'll be here.",
            rewardItems = {{59042, 1}},
            rewardMoney = 40,
        },
        [26199] = {
            description = "It's a victory for us every time we're able to help another survivor escape " ..
                "from the contaminated halls of Gnomeregan. <class>s like you will play an important part " ..
                "in the future of Gnomeregan. To that end, our leader, High Tinker Mekkatorque, has " ..
                "assembled a team of trainers to help you learn your arts.\n\n\"Doc\" Cogspin will help " ..
                "oversee your training and adjustment to life on the surface. She's waiting for you near " ..
                "the cluster of buildings to the north.",
            rewardMoney = 8,
        },
        [26200] = {
            description = "You know, as you go out into this crazy world and get more powerful, you'll " ..
                "also start to discover new powers that you didn't know before.\n\nWhy don't you go out, " ..
                "get some more experience, and then come back and show me what you've learned!",
            rewardItems = {{59040, 1}},
            rewardMoney = 40,
        },
        [26201] = {
            description = "I'm not at all surprised that a warlock like you fought your way out of " ..
                "Gnomeregan. Few people, even among the gnomes, truly understand the nature of the power " ..
                "we wield.\n\nAs you become more powerful, you're going to start hearing the fel voices " ..
                "revealing their secrets to you, teaching you new spells.\n\nI want you to go get some " ..
                "more experience. Once you learn something new, show me.",
            rewardItems = {{59041, 1}},
            rewardMoney = 40,
        },
        [26202] = {
            description = "It's a victory for us every time we're able to help another survivor escape " ..
                "from the contaminated halls of Gnomeregan. We're going to need all the help we can get " ..
                "to reclaim our home and rid ourselves of the troggs and irradiated gnomes. To that end, " ..
                "our leader, High Tinker Mekkatorque, has assembled a team of trainers to help you learn " ..
                "your, uh, \"arts\".\n\nAlamar Grimm has taken up residence in the building just west of " ..
                "this one. He possesses powers similar to yours and can help you get adjusted.",
            rewardMoney = 8,
        },
        [26203] = {
            description = "It's a victory for us every time we're able to help another survivor escape " ..
                "from the contaminated halls of Gnomeregan. <class>s like you will play an important part " ..
                "in the future of Gnomeregan. To that end, our leader, High Tinker Mekkatorque, has " ..
                "assembled a team of trainers to help you learn your arts.\n\nDrill Sergeant Steamcrank " ..
                "will help oversee your training and adjustment to life on the surface. He's waiting for " ..
                "you on the small practice field across the road.",
            rewardMoney = 8,
        },
        [26204] = {
            description = "Learning is the best way to improve. As you learn more, you'll start to " ..
                "discover you can do things you never realized!\n\nGo, get some more experience, and " ..
                "learn a new technique. Then, come back and demonstrate it on a training dummy.",
            rewardItems = {{59039, 1}},
            rewardMoney = 40,
        },
        [26205] = {
            description = "If the multi-bot works, it will help us do all kinds of jobs that are " ..
                "unpleasant or dangerous for us gnomes!\n\nAfter Thermaplugg detonated his irradiator at " ..
                "the end of Operation: Gnomeregan, toxic clouds and ooze began bubbling up at the old " ..
                "airfield south of town.\n\nIf we don't get it under control, the contamination could " ..
                "spread to the rest of our lands. Take the multi-bot with you, and bring it close to the " ..
                "geysers in the green pools at the Toxic Airfield. Your bot should spring into action!",
            rewardMoney = 35,
        },
        [26206] = {
            description = "It's a victory for us every time we're able to help another survivor escape " ..
                "from the contaminated halls of Gnomeregan. <class>s like you will play an important part " ..
                "in the future of Gnomeregan. To that end, our leader, High Tinker Mekkatorque, has " ..
                "assembled a team of trainers to help you learn your arts.\n\nKelsey Steelspark, a key " ..
                "member of Gnomeregan Covert Ops, will help oversee your training and adjustment to life " ..
                "on the surface. She should be in the council tent to the northwest.",
            rewardMoney = 8,
        },
        [26207] = {
            description = "As you learn more and become a better rogue, you'll start to learn new " ..
                "abilities.\n\nOne of the most potent ones is to chain together moves in a combination, " ..
                "exploiting your enemy's weakness and opening up the opportunity to use stronger " ..
                "maneuvers.\n\nGo, get some more experience and figure out how to do it. Once you can, " ..
                "come back here and try it out.",
            rewardItems = {{59043, 1}},
            rewardMoney = 40,
        },
        [26208] = {
            description = "The dwarves of Ironforge kindly took us in when the trogg invasion and " ..
                "radiation forced us to leave Gnomeregan for the first time. But even the kindness of " ..
                "friends can't quell the longing for home.\n\nI sent out a call for brave gnomes and " ..
                "other members of the Alliance to help us regain control of Gnomeregan and defeat the " ..
                "usurper Thermaplugg once and for all.\n\nWe weren't able to achieve everything " ..
                "Operation: Gnomeregan set out to do, but Thermaplugg is on the run and we're closer to " ..
                "home than ever.",
            rewardMoney = 35,
        },
        [26209] = {
            description = "Here's the deal, kid, we've got a full-blown murder on our hands. Double " ..
                "homicide... Single horse... icide.\n\nWorse yet, we're in Westfall. I could throw a rock " ..
                "behind me and hit a dozen hobos with motive enough to want to wipe these people (and " ..
                "horse) out.\n\nNow I don't know who did this and I sure don't appreciate having to come " ..
                "to this dump to investigate the deaths of a couple of squatters, but I'll be damned if I " ..
                "don't find the perp. You want to help? Go talk to some bums. The hobo... knows.",
            rewardChoices = {{58906, 1}, {58907, 1}, {58908, 1}},
            rewardMoney = 400,
        },
        [26210] = {rewardMoney = 3000},
        [26211] = {rewardMoney = 3000},
        [26212] = {rewardMoney = 6000},
        [26213] = {
            description = "Seeing as how we have no other leads, we may as well chase down the " ..
                "information you got.\n\nThere are a couple of Riverpaw gnoll camps in the area. Track " ..
                "them down and search for clues. Bring back anything that you might find. Isolate your " ..
                "search to the Riverpaw gnolls and scouts.",
            rewardMoney = 350,
        },
        [26214] = {
            description = "As pointless as I think that this is going to be, we need to investigate all " ..
                "of our leads.\n\nI need you to head out to the Longshore, west of here, on the coast, " ..
                "and shake up some murlocs. Try to find a clue or some info that can help shed some light " ..
                "on the murders.\n\nReturn to me if you get lucky, rookie.",
            rewardMoney = 400,
        },
        [26215] = {
            description = "Looks like we got ourselves a real \"whodunit\" here, rookie. Unfortunately, " ..
                "it looks like the locals aren't willing to talk and the clues you got off the gnolls and " ..
                "murlocs are damn near worthless. We're going to have to initiate plan... be on the " ..
                "lookout for Two-Shoed Lou.\n\nTwo-Shoed Lou is an old confidential informant of mine " ..
                "who, ironically, makes his home at the Furlbrow's old pumpkin farm. Head west to the " ..
                "farm and find out what Lou knows.\n\nIf he gives you any guff tell him that Horatio sent " ..
                "you.",
        },
        [26219] = {
            description = "We've located the beast that destroyed our ships. It makes its lair in " ..
                "Darkbreak Cove, a giant underwater cavern bordering the abyss.\n\nThis time we're ready. " ..
                "The gnomes have been engineering a beauty for us back at Stormwind, and it's packing " ..
                "firepower that'll make that fiend wet itself.\n\nWhen the Pincer X2 pulls up to dock " ..
                "beside the ship, make your way on board and help out however you can. We'll be right " ..
                "behind you.",
            rewardMoney = 78000,
        },
        [26220] = {
            description = "Feeding a hungry orc army is never an easy task. Luckily for us, we have a " ..
                "good supply of mature swine meat from the pig farms and surrounding areas south of " ..
                "Orgrimmar. Do me a favor and slaughter some of those pigs for their delicious belly " ..
                "meat. I will slice it up and make bacon for the troops' breakfast.",
            rewardMoney = 114000,
        },
        [26221] = {
            description = "We've located the beast that destroyed our ships. It makes its lair in " ..
                "Tenebrous Cavern, a giant underwater cave bordering the Abyssal Breach.\n\nThis time " ..
                "we're ready. The goblins have been proving their worth by making a vicious machine for " ..
                "us back at Bilgewater Harbor, and it's packing firepower that'll make that fiend wet " ..
                "itself.\n\nWhen the Verne pulls up to dock beside the ship, make your way on board and " ..
                "find a way to make yourself useful. We'll be right behind you.",
            rewardMoney = 78000,
        },
        [26222] = {
            description = "There's just too much to do around here, and too few gnomes on their feet to " ..
                "help! The high tinker has asked me to start converting some of our old bots and parts " ..
                "from Operation: Gnomeregan. I hope to have a new line of multi-bots ready for a field " ..
                "test soon!\n\nI don't suppose you'd have some time to help, do you? There are all kinds " ..
                "of parts scattered around. Pick up anything you find and bring it back to me. You never " ..
                "know what could turn out to be useful!",
            rewardMoney = 35,
        },
        [26223] = {rewardMoney = 3000},
        [26224] = {rewardMoney = 6500},
        [26225] = {rewardMoney = 3000},
        [26226] = {
            description = "There are a number of small lakes scattered around Orgrimmar. These lakes fill " ..
                "up with crawfish every year. That's where you come in, <name>. I need you to catch some " ..
                "of those delicious crustaceans and return to me when you are done. Assuming your catch " ..
                "is successful, our Horde army will feast tonight.",
            rewardMoney = 114000,
        },
        [26227] = {
            description = "Sometimes the troops want something sweet to eat. I don't always give them " ..
                "what they want but this time, I am going to make an exception. I am sure you have seen " ..
                "the local cactus that grows here in Orgrimmar. These cactus produce a tasty treat called " ..
                "prickly pear fruit. The trouble is the fruit are covered in spines! Watch your hands and " ..
                "bring me back a handful of that fruit.",
            rewardMoney = 114000,
        },
        [26228] = {
            description = "Listen, I really shouldn't be talkin' to you, but I owe Horatio a favor or " ..
                "two. I don't really know nothin' about what happened to the Furlbrows, but I might be " ..
                "able to point you in the right direction.\n\n<Lou hands you a large crate.>\n\nThat " ..
                "crate used to be my home before I struck it rich. Now I'm livin' the life every hobo " ..
                "dreams of!\n\nRight, so you take that there livin' crate and head to the Jangolode Mine, " ..
                "southwest of here. Head to the back of the mine and once there, hide in the crate.",
        },
        [26229] = {
            description = "Back before those damned kobolds gave me a permanent limp I used to be William " ..
                "Pestle's number one candle supplier. Hell, I even came up with the line \"I TAKE " ..
                "CANDLE!\" Yea, that was me. Kobold would say \"You no take candle!\" and I'd just " ..
                "respond \"I TAKE CANDLE!\" and then bash their brains in!\n\n<Jimb drifts off for a " ..
                "second.>\n\nGood times... The best times.\n\nNow? Can't even use the bathroom without " ..
                "assistance. You want to help me? Kill me some kobolds. You'll find a good load of 'em in " ..
                "the nearby mine.",
            rewardChoices = {{58902, 1}, {58904, 1}, {58905, 1}, {58903, 1}},
        },
        [26230] = {
            description = "Life in Westfall 's hard, <sonny/missy>! Every day is a struggle. We can " ..
                "sometimes go weeks without a decent meal. That's why it's important that we all help " ..
                "each other out. Maybe you can lend a hand, eh? I'm making dirt pies and need some " ..
                "ingredients.\n\nGet me some fresh dirt from the pumpkin patch out front and a bundle of " ..
                "coyote tails. You'll find coyotes wandering around in the wilds of Westfall.\n\nGet " ..
                "moving! We got mouths to feed.",
            rewardItems = {{58933, 1}},
        },
        [26232] = {
            description = "A couple of thugs recently showed up at the farm, causin' all kinds of " ..
                "trouble. I don't know where they came from or who they're working for, but I KNOW " ..
                "they're bad news. I may have overheard 'em talkin' 'bout subjects that might interest " ..
                "you.\n\nIf you're interested, you'll find the thugs back behind the farmhouse. If you " ..
                "get caught or killed, I don't know you. Never seen ya!\n\nGood luck, kid.",
            rewardMoney = 350,
        },
        [26233] = {
            description = "As you know, <name>, Garrosh has relegated the trolls of Orgrimmar to the " ..
                "western outskirts of the city. Fortunately, that means that we have easy access to their " ..
                "supplies. I am working on a large batch of jambalaya for the infantry and I need as much " ..
                "rice as possible. Lucky for us, the trolls keep it stored in barrels near their " ..
                "structures. Retrieve these barrels of Darkspear rice for me and I should be able to " ..
                "finish up.",
            rewardMoney = 114000,
        },
        [26234] = {
            description = "As you know, <name>, Garrosh has relegated the goblins of Orgrimmar to the " ..
                "western outskirts of the city. Fortunately, that means that we have easy access to their " ..
                "supplies. I am working on a large batch of jambalaya for the infantry and I need as much " ..
                "rice as possible. Lucky for us, the goblins keep it stored in barrels near their " ..
                "structures. Retrieve these barrels of Kezan rice for me and I should be able to finish " ..
                "up.",
            rewardMoney = 114000,
        },
        [26235] = {
            description = "We have had a problem with thieves stealing our infantry rations here in " ..
                "Orgrimmar for the last couple of weeks. I recently received some intelligence of where " ..
                "these crimes are taking place. Anywhere you see piles of crates and supplies, there are " ..
                "likely to be thieves nearby. I need you to hunt these thieves down and recover the " ..
                "stolen rations. Return to me when you are done.",
            rewardMoney = 114000,
        },
        [26236] = {
            description = "So what do we know so far? We need to follow the clues.\n\nOver at the Jansen " ..
                "Stead you found a water-soaked letter and some scraps of red cloth. Here at the " ..
                "Furlbrow's you overheard a conversation between some shadowy figure and an ogre mage. " ..
                "You also got a confession to the murder from a bunch of thugs - whom you then " ..
                "killed.\n\nSomething isn't adding up, rookie.\n\nThere's an old couple, southeast of " ..
                "here, at the Saldean's Farm. Head over there and speak with Farmer Saldean. Find out " ..
                "what he knows.",
        },
        [26237] = {
            description = "Times are tough, <brother/sister>. With the downtrodden masses of Stormwind " ..
                "migrating into Westfall, resources are stretched as thin as they've ever been. The " ..
                "people are restless and in need of help.\n\nOur own farmhouse has been serving as a " ..
                "halfway house for years. Salma does the best that she can to keep our guests alive, but " ..
                "sometimes the watchers get 'em. Watchers are those twisted abominations roaming my " ..
                "fields - a little present left behind by the Defias, before they were driven off. Help " ..
                "us!",
            rewardMoney = 500,
        },
        [26238] = {rewardMoney = 3000},
        [26240] = {rewardMoney = 3000},
        [26241] = {
            description = "Hello, dear. Welcome to our home. Hmm, you don't look like you're homeless. " ..
                "Have you come to help us? If so, you're just in time! I'm planning dinner for the young " ..
                "ones and need a few simple ingredients.\n\nIf you could get me some okra, goretusk " ..
                "flanks and stringy fleshripper meat I can make my famous Westfall stew! You'll find all " ..
                "of the ingredients near our farm. Just be careful of the harvest watchers. They are " ..
                "merciless killers.",
            rewardChoices = {{58909, 1}, {58910, 1}, {58911, 1}},
        },
        [26244] = {
            description = "We're in the plane of earth, <name>. Everything is absorbed by the land " ..
                "eventually.\n\nThe Storm's Fury will soon be turned to dust and we won't be able to gain " ..
                "any insight from its remains.\n\nGo and destroy the elementals that are dismantling the " ..
                "ship. We're only delaying the inevitable, but we need to buy ourselves some time if " ..
                "we're to track down all the pieces of the World Pillar.",
            rewardChoices = {{61502, 1}, {61503, 1}, {61504, 1}},
            rewardMoney = 82000,
        },
        [26245] = {
            description = "The Archstone was being transported inside a flying Horde gunship called the " ..
                "Storm's Fury.\n\nThe airship crashed south of here and our scrying has revealed the " ..
                "Archstone's no longer on it.\n\nSearch the ship for clues related to what might've " ..
                "happened.",
            rewardMoney = 82000,
        },
        [26246] = {
            description = "<You leaf to the final, interrupted entry.>\n\n...approaching the Temple of " ..
                "Earth at 300 knots and commencing landing maneuvers according to new route. We've made " ..
                "note of a low pressure system in the north and redrawn our...\n\nBLOOD AND THUNDER! " ..
                "ALLIANCE SCUM APPROACH!!",
        },
        [26247] = {
            description = "The Earthen Ring is a neutral organization, <name>. We cannot pick sides in " ..
                "the war between the Horde and the Alliance.\n\nLook around you -- our members come from " ..
                "all backgrounds. Our mission would be compromised should racial tensions be put above " ..
                "our goal. Let's try to keep this under wraps until we have more information.\n\nWe must " ..
                "not jump to conclusions just yet. I'll send you and one of our new members to look for " ..
                "the Alliance gunship.\n\nFind out what you can without dragging us into the conflict.",
            rewardMoney = 41000,
        },
        [26248] = {
            description = "Something's wrong here, <name>.\n\nThe ship's crew has been slain. Yet there " ..
                "is no bloodshed or damage to the ship's structure.\n\nThis was not the Horde's " ..
                "doing.\n\nWe will find the answers we seek by speaking to the spirits of the dead. They " ..
                "have not yet left this world.\n\nTake this totem and place it near the corpses of the " ..
                "fallen. You will have a few seconds to listen to their last few thoughts.\n\nBeware, " ..
                "however! There is no telling how the spirits of the dead will react to our prodding.",
            rewardChoices = {{61497, 1}, {61499, 1}, {61501, 1}},
            rewardMoney = 82000,
        },
        [26249] = {
            description = "It's possible we'll find further clues inside the admiral's cabin. You will " ..
                "find it directly below us.\n\nSee if there are any survivors or information that will " ..
                "lead us closer to the World Pillar fragment. Be careful, <name>. Whoever got the crew " ..
                "might still be out there.",
            rewardMoney = 41000,
        },
        [26250] = {
            description = "It's not too late, <name>. The cultists are probably still here.\n\nGo below " ..
                "decks, find out who's in charge and subdue them.\n\nWe will obtain answers to our " ..
                "questions, one way or another.",
            rewardMoney = 62000,
        },
        [26251] = {
            description = "It looks like the Twilight's Hammer's still on the ship. Go below decks and " ..
                "take them out.\n\nBe careful, <name>. I've a feeling they're not here for a spiritual " ..
                "retreat, if you know what I mean.",
            rewardMoney = 82000,
        },
        [26252] = {
            description = "You have found what appears to be the heart of a harvest watcher.\n\nFrom the " ..
                "sound being emitted by the device you can tell that it's still fully functional. Perhaps " ..
                "you should return it to Farmer Saldean.",
        },
        [26254] = {
            description = "Hop on, <name>. Let's see what Mr. Ogreface has to say for himself.\n\nDon't " ..
                "be shy, Stormbeak's only ever dropped a passenger a couple of times before.",
            rewardChoices = {{61493, 1}, {61494, 1}, {61498, 1}},
            rewardMoney = 62000,
        },
        [26255] = {
            description = "You must get word back to the others at the temple. Chances are, the fragment " ..
                "is already getting moved to a more secure location.\n\nTell Maruut what you know. I'm " ..
                "going to do a little investigating about this Twilight Council in the meantime.",
            rewardMoney = 62000,
        },
        [26256] = {
            description = "The Twilight's Hammer are wielding foul magic here, <name>. They animate and " ..
                "energize the remains of Deathwing's blood, so that instead of drying out and " ..
                "disappearing it thrives and becomes more abundant.\n\nTake out one of the bloodshapers, " ..
                "see if they have any clues as to where we can find this \"forgemaster.\"",
            rewardMoney = 62000,
        },
        [26257] = {
            description = "From what I've heard, all you really need to do is find a suitable harvest " ..
                "golem and drop in the heart. Once you've done that you should be able to take full " ..
                "control of the creature.\n\nI think there's a whole field of overloaded harvest golems " ..
                "west of here, at the Molsen Farm. Look for the arcs of electricity.\n\nShould you manage " ..
                "to get it working, use the golem to destroy the energized harvest reapers at the old " ..
                "Molsen farm. Those monsters are much more destructive than the ones on our farm.",
            rewardChoices = {{58915, 1}, {58916, 1}, {58917, 1}},
        },
        [26258] = {
            description = "The Twilight's Hammer involvement in the disappearance of the World Pillar " ..
                "fragment makes complete sense. Let us hope that we can act swiftly enough to recover " ..
                "it.\n\n<Maruut places his hand on your shoulder.>\n\nI've established a spiritual bond " ..
                "with you. We should be able to communicate while you remain in Deepholm.\n\nGo to " ..
                "Deathwing's Fall to the southeast and investigate the Twilight's Hammer operation there.",
            rewardMoney = 62000,
        },
        [26259] = {
            description = "When Deathwing escaped to Deepholm, his corruption was extreme, but perhaps " ..
                "not yet absolute.\n\nThe cultists at Deathwing's Fall harvest and shape the corrupted " ..
                "blood he left behind into living organisms to draw from their power.\n\nWhat if a trace " ..
                "of the Earthwarder's essence remains? After all, Neltharion was the aspect of earth " ..
                "before he was the aspect of death.\n\nGather samples from the living blood the cultists " ..
                "have created and we'll see if any trace of the Earthwarder remains.",
            rewardChoices = {{61490, 1}, {61491, 1}, {61492, 1}},
            rewardMoney = 82000,
        },
        [26260] = {
            description = "Go to the tower the slave spoke of. You should find it on the northeastern end " ..
                "of the camp.\n\nIf we can act fast enough we might be able to eavesdrop on the " ..
                "forgemaster's meeting.",
            rewardMoney = 82000,
        },
        [26261] = {
            description = "According to the orders you found, there is a key inside the tent in the " ..
                "southeastern end of Deathwing's Fall.\n\nObtain it and free the slaves in the quarry to " ..
                "the south.",
            rewardChoices = {{61487, 1}, {61488, 1}, {61489, 1}},
            rewardMoney = 82000,
        },
        [26263] = {rewardMoney = 6500},
        [26264] = {
            description = "Most of us have seen the sickly and deranged gnomes suffering from exposure to " ..
                "the poisons and radiation of Gnomeregan. Eventually, they will devolve further, until " ..
                "they become mindless, but mostly harmless, puddles of toxic sludge.\n\nMy research " ..
                "suggests that we may even be able to restore them from this state. Go to the Toxic " ..
                "Airfield to the south, subdue the toxic sludge I told you about, and bring back the " ..
                "possessions of the gnomes they once were.",
            rewardMoney = 35,
        },
        [26265] = {
            description = "Tock Sprysprocket has some crazy theory about these toxic sludges being the " ..
                "last remnants of gnomes, so my men have orders not to engage them for now.\n\nHowever, " ..
                "the Toxic Airfield, just south of us, is teeming with living contamination. They are " ..
                "elementals composed of contaminated water and other toxic materials. Left unchecked, " ..
                "they'll overrun the town. Will you help us dispose of them?",
            rewardItems = {{59038, 1}, {59053, 1}},
            rewardMoney = 35,
        },
        [26266] = {
            description = "About four years ago, in the dead of the night, a little girl walked right " ..
                "into our farmhouse and collapsed on the floor. Nobody had a clue as to her identity. The " ..
                "poor little thing had no recollection of who she was or where she came from - truly a " ..
                "lost soul.\n\nSoon after, we adopted the little girl and named her Hope - for that is " ..
                "what she represented.\n\nShe is now a young lady, caring for the destitute and homeless " ..
                "of Westfall. Take my Westfall stew to her at Sentinel Hill, south of here.",
        },
        [26267] = {rewardMoney = 3000},
        [26268] = {rewardMoney = 3000},
        [26269] = {rewardMoney = 1800},
        [26270] = {
            description = "It's been many years since anyone has offered to lend us aid, <name>. Had you " ..
                "not come along, we might not have made it through the coming winter. You have proven " ..
                "yourself to be a selfless individual - a person that we can trust. I only wish we had " ..
                "something of value to offer you.\n\nWhile I have no information to assist you in your " ..
                "crusade to bring the Furlbrow's murderer to justice, perhaps my wife can help. Speak to " ..
                "Salma inside and she will tell you what you need to know before you leave.",
            rewardMoney = 600,
        },
        [26271] = {
            description = "Yes, I heard about the Furlbrow murders. It is very tragic, but such tragedy " ..
                "is a way of life in Westfall. There are many people here who simply no longer have the " ..
                "means or inclination to keep themselves fed. They have given up hope. Do you understand " ..
                "what it means to be left so hopeless as to stop caring about life? We must work together " ..
                "to show them that there is hope. That with the dawning day a better life comes.\n\nTake " ..
                "my mother's Westfall stew and help feed the homeless around Sentinel Hill.",
        },
        [26272] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Voldreka to the east.",
            rewardMoney = 25,
        },
        [26273] = {
            description = "Alright, mon. We start simple. I need ta know dat you know the basics of the " ..
                "dark arts.\n\nGo thrash dose tiki targets. Take it slowly. Natural-like. I'll watch how " ..
                "you form your casts and we'll go from dere.",
            rewardMoney = 35,
        },
        [26274] = {
            description = "I tink I have something I should let ya know.\n\nAs ya' get more powahful, yo' " ..
                "gonna staht hearin' da voices - teachin' you new tings, new spells.\n\nGo, get some more " ..
                "experience, 'den come back an show me what ya learned.",
            rewardMoney = 40,
        },
        [26275] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [26276] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52873, 1}},
            rewardMoney = 50,
        },
        [26277] = {
            description = "Ya definitely more den expected, mon. I'm sure dere's more important stuff we " ..
                "can be usin' ya talents on now. Ya don't need ta hang out with da newbloods no " ..
                "more.\n\nHead down to da village to da southeast and make yaself known. Lend a hand here " ..
                "and there and I'm sure ya make yer way up to sometin' more prestigious quick enough.",
            rewardMoney = 25,
        },
        [26278] = {rewardMoney = 1800},
        [26279] = {rewardMoney = 1800},
        [26280] = {rewardMoney = 1800},
        [26281] = {rewardMoney = 3500},
        [26283] = {rewardMoney = 6500},
        [26284] = {
            description = "Fer a job like this, I normally bring me whole crew o' demolitionists. With " ..
                "some help in settin' up th' powder, th' charges, and th' rest o' th' gear, the job gets " ..
                "done a lot faster.\n\nThose blasted troggs have me men caged all around Frostmane Hold. " ..
                "Now I'm 'ere all alone without th' personnel I need to finish th' job.\n\nYou look like " ..
                "a capable <class>, though. Would you find th' demolitionists th' troggs captured and " ..
                "break them out o' their cages?",
            rewardMoney = 50,
        },
        [26285] = {
            description = "It's gonna take a lot of powder ta collapse those caves. I don't know whether " ..
                "th' damnable troggs understood that when they stole me supplies and kidnapped me " ..
                "demolitionists! But th' outcome's th' same.\n\nAin't gonna be able ta blow nothin' up " ..
                "until I've got that powder back.\n\nGo south to Frostmane Hold and kill any o' those " ..
                "troggs you find. Any one o' 'em could be carryin' me kegs o' powder.",
            rewardMoney = 50,
        },
        [26286] = {
            description = "After my tour of duty was over in Grizzly Hills, I returned to Westfall, only " ..
                "to find the land in worse condition than when I left.\n\nThe price of our war left " ..
                "thousands of citizens homeless. They now migrate here and squat upon the deserted " ..
                "farmhouses and towns of the region.\n\nTo make matters worse, we are now under attack by " ..
                "the gnolls. The Westfall Brigade needs your help, <name>. Slay the attacking gnolls and " ..
                "recover their orders. Someone is pulling their strings and we need to find out whom!",
            rewardChoices = {{58912, 1}, {58913, 1}, {58914, 1}},
            rewardMoney = 600,
        },
        [26287] = {
            description = "We were once known as the People's Militia. These days, though, we fight under " ..
                "the banner of Stormwind, with the full support of King Varian Wrynn. Our goals here in " ..
                "Westfall are many: to clean up the mess left behind by the Defias, to expand the reach " ..
                "of the Alliance and to maintain order. So far we are failing on all fronts.\n\nTimes are " ..
                "worse now than when the Defias ran amok. Now with the indigenous gnolls of the region up " ..
                "in arms, we find ourselves backed into a corner. Help us, <name>!",
            rewardMoney = 600,
        },
        [26288] = {
            description = "South of here is an area of Westfall known as the Dust Plains. From what we " ..
                "know the gnolls of the region have made the Dust Plains their unofficial capital. As " ..
                "with any capital, there exists a leader at the heart. If we are to put an end to these " ..
                "attacks, we must track down the gnoll in charge and end him.\n\nVenture forth into the " ..
                "Dust Plains, find the gnoll leader, Jango Spothide, and kill him. Take out any other " ..
                "gnolls that get in your way.",
            rewardChoices = {{58918, 1}, {58919, 1}, {58920, 1}},
            rewardMoney = 600,
        },
        [26289] = {
            description = "SI: 7 has been tracking Helix Gearbreaker since he entered Alliance territory " ..
                "two weeks ago. The letter I received from Mathias Shaw explained that he sent an agent " ..
                "by the name of Kearnen to Westfall to shadow Helix. Find Agent Kearnen and you'll find " ..
                "Helix Gearbreaker.\n\nKearnen came into town for supplies two days ago. She mentioned " ..
                "that she would be near Mortwake's Tower, southeast of here, on the Dust Plains.\n\nGet " ..
                "going, <name>.",
        },
        [26290] = {
            description = "Helix has got himself holed up inside Klaven Mortwake's old tower. I won't lie " ..
                "to you, <name>, it's heavily guarded. I count six armed mercenaries just on the outside. " ..
                "There's no way you're getting inside that tower by yourself. Lucky for you, Claire and I " ..
                "are here.\n\n<Kearnen pats her sniper rifle.>\n\nI'll cover your entry.\n\nTake this " ..
                "shrouding potion, you'll need it once you get inside. Use it as soon as you enter the " ..
                "tower and head upstairs. Find out what Helix is hiding up there!",
        },
        [26291] = {
            description = "I'll be filling out my report and heading back to Stormwind shortly. SI: 7 " ..
                "must be informed of the happenings in Westfall. I would recommend you do the same and " ..
                "report back to Gryan.",
            rewardChoices = {{58924, 1}, {58925, 1}, {58926, 1}},
            rewardMoney = 600,
        },
        [26292] = {
            description = "We have had a camp near Moonbrook for quite some time now, <name>. One of my " ..
                "best soldiers works the area along with a company of Sentinel Hill troopers. Report to " ..
                "Captain Alpert now and find out if he has any news about the happenings in " ..
                "Moonbrook.\n\nAnother ally of mine is also at the Moonbrook camp. His name is Thoralius. " ..
                "I met Thoralius in Northrend during my time in Valgarde. He is a wise and powerful " ..
                "shaman. Perhaps his abilities could help us solve this mystery.",
        },
        [26293] = {
            description = "The \"Worldbreakers\" hide in a highland wilderness, squatting behind the " ..
                "Alliance kingdoms in the east. We will crush them, and we will do so with the mightiest " ..
                "army ever assembled since our victories in Northrend.\n\nI tasked our new goblin allies " ..
                "with the assembly of a host of war machines. Reports from the field reveal that their " ..
                "workmanship is sometimes... lacking.\n\nI will not go to battle with faulty machines. " ..
                "See Foreman Glibbs here in Orgrimmar and ensure my war machines are battle-ready!",
            rewardMoney = 22500,
        },
        [26294] = {
            description = "<Glibbs mops sweat from his brow with a greasy handkerchief.>\n\nHellscream " ..
                "isn't happy with our work? Oh - we even NAMED the \"Hellscream Demolisher\" after him. " ..
                "This is very bad. My boys need to step it up.\n\nMaybe you can help set an example. A " ..
                "set of Hellscream Demolishers just rolled off the blocks and are ready for inspection. " ..
                "Give them a thorough going-over, and if you find any problems, give the Chief Engineer a " ..
                "good thrashing. Remind them that the eyes of Hellscream are upon them!",
            rewardMoney = 90000,
        },
        [26295] = {
            description = "We've noticed a rise in violent acts amongst the homeless of the area. " ..
                "Something or someone is getting them all riled up. Now whoever is behind all this is " ..
                "getting more organized. Just recently a group of thugs came through here handing out " ..
                "pamphlets.\n\nEnter Moonbrook and look for evidence. Propaganda, leaflets, whatever... " ..
                "Bring whatever you find back to me. Maybe we can find the source through the writings.",
            rewardMoney = 600,
        },
        [26296] = {
            description = "The material of this bandana is identical to the material found at the " ..
                "Furlbrow murder scene. You should collect more red bandanas as evidence and return what " ..
                "you find to Captain Alpert.",
            rewardChoices = {{58921, 1}, {58922, 1}, {58923, 1}},
        },
        [26297] = {
            description = "It looks like the meeting the shadowy figure spoke of is starting soon. The " ..
                "homeless are starting to mobilize. I need you to attend the rally and gather " ..
                "information, <name>.\n\nGo to the center of Moonbrook and listen in on the rally. Return " ..
                "to me with whatever you find out.",
            rewardMoney = 700,
        },
        [26298] = {rewardMoney = 2000},
        [26299] = {rewardMoney = 2000},
        [26300] = {rewardMoney = 4500},
        [26301] = {rewardMoney = 2200},
        [26302] = {rewardMoney = 1100},
        [26303] = {rewardMoney = 2500},
        [26304] = {rewardMoney = 5000},
        [26305] = {rewardMoney = 5000},
        [26306] = {rewardMoney = 3500},
        [26307] = {rewardMoney = 3500},
        [26308] = {rewardMoney = 3500},
        [26309] = {rewardMoney = 3500},
        [26310] = {rewardMoney = 3500},
        [26311] = {
            description = "The Warchief has designs to launch an all-out assault on the Twilight " ..
                "Highlands. Once there we hope to ally with the Dragonmaw orcs.\n\nThrough my own sources " ..
                "I've discovered that a Dragonmaw orc resides here, in Orgrimmar. He is known as " ..
                "Herezegor Flametusk, and once he commanded legions of their warriors.\n\nHis insider " ..
                "knowledge is precious to us. Find Flametusk and obtain for us a chart of the Twilight " ..
                "Highlands waterways.\n\nLast I hear, Flametusk was washed up at a bar in the Valley of " ..
                "Honor...",
            rewardChoices = {{63922, 1}, {63923, 1}, {63924, 1}},
            rewardMoney = 90000,
        },
        [26312] = {
            description = "When da attack started, we pushed out to take da field as quickly as we could. " ..
                "Dere forces were deep and endless... we underestimated dem. Now some of our best shaman " ..
                "be stranded out dere, exhausted, far from our defenses.\n\nMake your way out and take da " ..
                "pressure off of our stranded brothas. Even a small break in battle be a chance to get " ..
                "much needed room ta breathe.\n\nBe swift, <class>.",
            rewardMoney = 86000,
        },
        [26313] = {
            description = "Elementals are chaotic by nature, but dis kind of organized aggression is out " ..
                "of character. More so down here where dere deaths be a bit more permanent. I suspect dis " ..
                "is Therazane the Stonemother's doin', but I have to be sure.\n\nDestroy da Irestone " ..
                "Rumblers and bring me their cores. We'll be settlin' here and now if dis is da " ..
                "Stonemother's hatred brought down on us.",
            rewardMoney = 86000,
        },
        [26314] = {
            description = "We're fortunate dat those giants be havin' such bad aim. Luck is sure to be " ..
                "favorin' dem eventually though.\n\nWe need to get dem off da battlefield, but I don't " ..
                "tink takin' dem head on would be very smart.\n\nTake dis grapplin' line, get a good hold " ..
                "on one of their ankles and pull their legs out from under dem. Once dey are on da " ..
                "ground, dey should be easy ta be finishin' off.",
            rewardMoney = 86000,
        },
        [26315] = {
            description = "Have ya seen the looming giant in the distance to the northeast? Dat is Boden " ..
                "the Imposing, one of Therazane the Stonemother's Stone Lords.\n\nWe be knowin' little of " ..
                "da Stone Lords, but Boden is not known ta be very level-headed. Sadly, he seems to be da " ..
                "one leadin' dis assault, so he's the one we must be confrontin'.\n\nTake dis " ..
                "proclamation to him and read it aloud on behalf of da Earthen Ring. I know it be a bit " ..
                "of a stretch to think words will settle dis, but we have to try. Be cautious.",
            rewardChoices = {{61434, 1}, {61435, 1}, {61433, 1}},
            rewardMoney = 86000,
        },
        [26316] = {
            description = "The cataclysm tore open deep caves beneath Frostmane Hold and troggs flooded " ..
                "out of their warrens. They succeeded in displacing the trolls who used to live there and " ..
                "they stand to drive us out if we do not act.\n\nHigh Tinker Mekkatorque hired the " ..
                "renowned demolitionist, Jessup McCree, to close the caves and stem the trogg advance. " ..
                "We've received no word about whether he was able to stop the troggs. Would you look for " ..
                "him at his camp near Frostmane Hold, to the south beyond the Toxic Airfield?",
        },
        [26318] = {
            description = "My team has finished settin' up th' powder kegs and th' detonator at the " ..
                "bottom o' th' cave in th' western part of Frostmane Hold. All you need to do is venture " ..
                "down there and activate th' detonator to explode the powder and collapse those " ..
                "tunnels.\n\nThat'll stop th' flow of troggs from th' deep parts of th' earth. " ..
                "Mekkatorque'll have an easier time of dealin' with the remainin' troggs if you can take " ..
                "out their leader, who calls 'imself Boss Bruggor. Good luck, <name>.",
            rewardChoices = {{59044, 1}, {59045, 1}, {59046, 1}},
            rewardMoney = 50,
        },
        [26319] = {
            description = "There is a shaman here, Thoralius, who might be able to aid us. He is a friend " ..
                "of Gryan's who has recently come to Westfall to study the elemental devastation that has " ..
                "befallen us.\n\nSpeak to Thoralius and see if there is something that he can do to shed " ..
                "some light on the identity of this shadowy figure.",
        },
        [26320] = {
            description = "This incense will put your body and mind in a deep meditative state. Once the " ..
                "trance begins you will be pulled into the spirit world. Do not fight the trance once it " ..
                "has begun, <name>. Allow the spirits to show you what they know.\n\nYou must leave now. " ..
                "Go to the Deadmines, a place which I am told holds great significance in the history of " ..
                "Westfall. Once inside, use the incense.\n\nYou may enter the Deadmines through the old " ..
                "farmhouse south of here. Follow the homeless.\n\nReturn to Gryan with your discovery.",
            rewardMoney = 700,
        },
        [26322] = {
            description = "I had no idea that VanCleef had a daughter, <name>. If there was one thing " ..
                "that man was exceptionally skilled at, it was keeping secrets.\n\nHow tragic. Poor thing " ..
                "witnessed a horrible act. Had I only known.\n\nWhat was that? Did you hear something? It " ..
                "seems as if the gnolls are pulling back... where are my guards?\n\nON GUARD, <name>!",
            rewardChoices = {{58927, 1}, {58928, 1}, {58929, 1}, {58930, 1}, {58931, 1}},
            rewardMoney = 2000,
        },
        [26324] = {
            description = "We have a map of the Highland approaches. The plan is clear: we will show " ..
                "ourselves in force. The Dragonmaw orcs, on seeing the might of our combined forces on " ..
                "their shore, will have no choice but to ally with us in our crusade to destroy the " ..
                "Twilight's Hammer.\n\nThe fleet is assembling at Bilgewater Port in Azshara. I grow " ..
                "impatient with their progress.\n\n<class>! You have a knack for greasing the wheels of " ..
                "my war machine. Seek out Warlord Krogg in Azshara and find out what's taking so long.",
            rewardMoney = 68000,
        },
        [26325] = {rewardMoney = 2000},
        [26326] = {
            description = "Only one piece of the World Pillar remains, and it is in the hands of the " ..
                "Stonemother herself. Worse, the temple has come under siege by elementals and giants. " ..
                "It's not a terrible leap of logic to assume they're acting by her will.\n\nGo out and " ..
                "meet the elementals in battle to the northwest. Work with Torunscar and Norsala to find " ..
                "a way to communicate with their leaders and seek out the World Pillar. We would prefer " ..
                "such be done peacefully, but we will do whatever we must to seal the rift.",
            rewardMoney = 8600,
        },
        [26327] = {
            description = "You don't want to waste your time talking to me right now, <lad/lass>. Thargas " ..
                "Anvilmar himself is just on the other side of these wagons.\n\nSurely you've heard of " ..
                "him? He fought to defend the Thandol Span from the Dark Iron alongside the King of " ..
                "Stormwind! He's one of the finest heroes of Ironforge.\n\nRight now though, he's in the " ..
                "thick of it! Go out there and let him know you're ready to help. Just keep a good " ..
                "distance, he swings wide.",
        },
        [26328] = {
            description = "<Norsala reaches to the ground in an attempt to discern Diamant's location, " ..
                "but jumps back in shock after a moment's contact.>\n\nMy! Dat was unexpected. Diamant " ..
                "ain't far at all. When I reached out ta him, he spoke back wit me and told me where we " ..
                "could be finin' him. Head towards tha northeastern edge of the Jagged Wastes - Diamant " ..
                "will be expectin' ya.\n\n<name>, be careful. It may be unlike an earth bein' to lay an " ..
                "ambush, but it was unlike dem to siege the temple in da first place.",
            rewardMoney = 21500,
        },
        [26329] = {
            description = "Well, it's time to start packin' up and movin' on to the next job. There's " ..
                "always somethin' else to blow up out there. Somewhere, there's a mountain needs movin' " ..
                "or a gorge that needs carvin', and I'll be there to do it.\n\nI don't suppose you'd do " ..
                "me one more favor? Would you take this report back to High Tinker Mekkatorque in New " ..
                "Tinkertown? He needs to know that th' troggs won't be botherin' his people again anytime " ..
                "soon.",
            rewardMoney = 5,
        },
        [26330] = {rewardMoney = 4000},
        [26331] = {
            description = "Our old enemy, Thermaplugg, is doing his best to keep us from rebuilding and " ..
                "finishing our reclamation of Gnomeregan. He's sent one of his most loyal henchmen, Razlo " ..
                "Crushcog, and a force of irradiated gnomes to harry us.\n\nThey've taken over an old " ..
                "arsenal up the road to the north, and Crushcog's technicians are repairing those " ..
                "weapons. We have to stop them before they're able to get those mechano-tanks back " ..
                "online. Go to Crushcog's Arsenal and eliminate as many of the technicians as you can.",
            rewardMoney = 75,
        },
        [26332] = {rewardMoney = 4000},
        [26333] = {
            description = "We've lost more than a couple scouts trying to find out what exactly Razlo " ..
                "Crushcog plans to do with all those mechano-tanks his irradiated technicians are " ..
                "repairing.\n\nWe can't afford to take it slowly anymore. We must act before Crushcog " ..
                "turns his followers and his weapons on us.\n\nThis techno-grenade packs enough explosive " ..
                "power to destroy the mechano-tanks and deny Crushcog their use. Take it north with you " ..
                "along the road to Crushcog's Arsenal and take out those tanks!",
            rewardChoices = {{59047, 1}, {59048, 1}, {59049, 1}},
            rewardMoney = 75,
        },
        [26334] = {rewardMoney = 6000},
        [26335] = {
            description = "Hellscream expects an armada of ships for his invasion, but the docks here are " ..
                "weeks behind schedule. Costs are rampant and quality is poor. Corruption is the problem, " ..
                "<name>! And I need you to root it out.\n\nThe Foebreaker, a warship berthed at the " ..
                "northwest pier, should have been outfitted days ago. Something reeks. Go there and " ..
                "oversee the construction yourself.\n\nFind out who's disrupting our naval preparations " ..
                "and deal with them!",
        },
        [26336] = {
            description = "You're all right, <name>. It's not every day you come across a so-called hero " ..
                "that has a clue what they're doing once they get this far from home, so I'll let you in " ..
                "on some more work.\n\nI've a friend by the name of Shakes O'Breen. He's the captain of a " ..
                "crew of pirates, the Blackwater Raiders; good men, respectable as pirates go. They dock " ..
                "at Faldir's Cove, hidden along the southern shore.\n\nI'm sure O'Breen will have " ..
                "lucrative jobs for you if you're interested.",
            rewardMoney = 1200,
        },
        [26337] = {
            description = "<It's not hard to see why the Foebreaker is behind schedule. Every other day, " ..
                "a foreman comes in and changes the blueprints.>\n\n<Most troubling are the recent " ..
                "alterations. The workers have been ordered to remove rivets to save on costs!>\n\n<You'd " ..
                "better track down one of the Bilgewater foremen responsible for this and make an example " ..
                "out of him, before any Horde lives are lost in a faulty ship.>",
            rewardMoney = 90000,
        },
        [26338] = {rewardMoney = 4500},
        [26339] = {
            description = "While High Tinker Mekkatorque, his military advisors, and I finalize the plans " ..
                "for the attack on Razlo Crushcog, I've sent my assistant ahead to Brewnall Village to " ..
                "begin preparations.\n\nTo get to Brewnall Village, follow the road southeast out of " ..
                "town. Once you arrive, find Jarvi Shadowstep and see if he needs any help. Our dwarven " ..
                "cousins have dispatched a cadre of mountaineers from Ironforge to join us in the fight " ..
                "against Crushcog.",
            rewardMoney = 10,
        },
        [26340] = {rewardMoney = 175},
        [26341] = {
            description = "I've scouted all over these highlands, <name>, and there's one thing I've " ..
                "found I haven't been able to explain.\n\nTo the northeast of here, there's a circle of " ..
                "stones, like the others you'll find everywhere in Arathi... but the largest and most " ..
                "imposing of them, built into the mountainside itself.\n\nJust between you and me, I " ..
                "heard voices while I was there. Whispers of the earth. If you're the curious type, you " ..
                "could go see for yourself...",
        },
        [26342] = {
            description = "We have reliable intelligence that Razlo Crushcog has taken up a defensive " ..
                "position on the island in the middle of frozen Iceflow Lake. To make matters worse, he's " ..
                "surrounded himself with a network of sentry-bots that will detect any possible " ..
                "attackers.\n\nIf we're to take on Crushcog, we'll need to take out those sentries. This " ..
                "device launches a dark, sticky paint that will coat the optical sensors of Crushcog's " ..
                "sentry-bots. Use it to take out his early warning system.",
            rewardMoney = 100,
        },
        [26343] = {rewardMoney = 2000},
        [26344] = {rewardMoney = 2200},
        [26345] = {rewardMoney = 5000},
        [26346] = {
            description = "As the stone goes quiet, you're left with a vague sense of unease. Something " ..
                "isn't right.\n\nPerhaps you should tell Skuerto of what you've done so far.",
            rewardMoney = 1100,
        },
        [26350] = {rewardMoney = 225},
        [26351] = {rewardMoney = 2200},
        [26352] = {rewardMoney = 2500},
        [26357] = {rewardMoney = 3500},
        [26359] = {rewardMoney = 2200},
        [26360] = {rewardMoney = 2500},
        [26362] = {rewardMoney = 5000},
        [26363] = {rewardMoney = 3500},
        [26364] = {
            description = "Our cousins, the dwarves of Ironforge, have agreed to help us in the battle " ..
                "against Razlo Crushcog. Mountaineer Stonegrind is a veteran who knows Dun Morogh well. " ..
                "He and High Tinker Mekkatorque stand ready on a small snow-covered island in Iceflow " ..
                "Lake to the north. Meet up with them there and let the high tinker know when you are " ..
                "ready to face the traitor Crushcog.\n\nTake this orbital targeting device and use it " ..
                "during the battle. It will help guide the high tinker's special weapons.",
            rewardChoices = {{59050, 1}, {59051, 1}, {59052, 1}},
            rewardMoney = 200,
        },
        [26366] = {rewardMoney = 3500},
        [26367] = {rewardMoney = 3500},
        [26368] = {rewardMoney = 3500},
        [26369] = {rewardMoney = 6500},
        [26381] = {rewardMoney = 3500},
        [26382] = {rewardMoney = 3500},
        [26384] = {rewardMoney = 1700},
        [26386] = {rewardMoney = 7500},
        [26387] = {rewardMoney = 3500},
        [26399] = {rewardMoney = 2500},
        [26400] = {rewardMoney = 2500},
        [26403] = {rewardMoney = 2500},
        [26404] = {rewardMoney = 2500},
        [26405] = {rewardMoney = 5000},
        [26406] = {rewardMoney = 3500},
        [26407] = {rewardMoney = 1400},
        [26412] = {rewardMoney = 2500},
        [26416] = {rewardMoney = 500},
        [26417] = {rewardMoney = 1800},
        [26418] = {rewardMoney = 3500},
        [26419] = {rewardMoney = 11000},
        [26428] = {rewardMoney = 4500},
        [26429] = {rewardMoney = 2500},
        [26430] = {rewardMoney = 2200},
        [26432] = {rewardMoney = 1700},
        [26433] = {rewardMoney = 2500},
        [26434] = {rewardMoney = 2500},
        [26435] = {rewardMoney = 800},
        [26448] = {rewardMoney = 1300},
        [26450] = {rewardMoney = 2500},
        [26451] = {rewardMoney = 114000},
        [26487] = {rewardMoney = 2500},
        [26489] = {rewardMoney = 2500},
        [26493] = {rewardMoney = 5500},
        [26494] = {rewardMoney = 300},
        [26495] = {rewardMoney = 300},
        [26533] = {rewardMoney = 3000},
        [26534] = {rewardMoney = 2200},
        [26535] = {rewardMoney = 6500},
        [26550] = {rewardMoney = 3000},
        [26551] = {rewardMoney = 2500},
        [26552] = {rewardMoney = 300},
        [26553] = {rewardMoney = 6500},
        [26554] = {rewardMoney = 300},
        [26555] = {rewardMoney = 9500},
        [26566] = {
            description = "We will need all the weapons, inventions, and soldiers we can get in order to " ..
                "defeat Razlo Crushcog and his followers.\n\nOver to the northeast, you'll find Engineer " ..
                "Grindspark, one of a new generation of brilliant gnomish minds. Why, he hasn't had an " ..
                "explosion in over three prototypes!\n\nBut enough bragging. Engineer Grindspark is " ..
                "working on a bot that he says will help clean up the toxic airfield. You should " ..
                "introduce yourself to him and see if he needs any help testing it.",
        },
        [26589] = {rewardMoney = 2500},
        [26590] = {rewardMoney = 2500},
        [26592] = {rewardMoney = 2500},
        [26594] = {rewardMoney = 6500},
        [26595] = {rewardMoney = 3000},
        [26597] = {rewardMoney = 3500},
        [26599] = {rewardMoney = 3500},
        [26600] = {rewardMoney = 6500},
        [26601] = {rewardMoney = 10000},
        [26602] = {rewardMoney = 10000},
        [26604] = {rewardMoney = 3000},
        [26605] = {rewardMoney = 3000},
        [26606] = {rewardMoney = 6500},
        [26609] = {rewardMoney = 2500},
        [26610] = {rewardMoney = 2500},
        [26611] = {rewardMoney = 800},
        [26612] = {rewardMoney = 6500},
        [26613] = {rewardMoney = 3500},
        [26614] = {rewardMoney = 3500},
        [26617] = {rewardMoney = 6500},
        [26624] = {rewardMoney = 350},
        [26629] = {rewardMoney = 3500},
        [26631] = {rewardMoney = 2500},
        [26633] = {rewardMoney = 3500},
        [26634] = {rewardMoney = 3500},
        [26635] = {rewardMoney = 3500},
        [26644] = {rewardMoney = 2500},
        [26647] = {rewardMoney = 3500},
        [26649] = {rewardMoney = 7000},
        [26650] = {rewardMoney = 1800},
        [26662] = {rewardMoney = 3500},
        [26663] = {rewardMoney = 3500},
        [26664] = {rewardMoney = 3500},
        [26665] = {rewardMoney = 3500},
        [26678] = {rewardMoney = 350},
        [26679] = {rewardMoney = 900},
        [26682] = {rewardMoney = 4000},
        [26695] = {rewardMoney = 3500},
        [26696] = {rewardMoney = 350},
        [26697] = {rewardMoney = 3500},
        [26698] = {rewardMoney = 350},
        [26699] = {rewardMoney = 3500},
        [26700] = {rewardMoney = 3500},
        [26701] = {rewardMoney = 350},
        [26703] = {rewardMoney = 11000},
        [26888] = {rewardMoney = 8700},
        [26891] = {rewardMoney = 8000},
        [26892] = {rewardMoney = 8000},
        [26899] = {rewardMoney = 9300},
        [26901] = {rewardMoney = 14700},
        [26903] = {rewardMoney = 14700},
        [26905] = {rewardMoney = 14700},
        [26907] = {rewardMoney = 14700},
        [26908] = {rewardMoney = 350},
        [26911] = {rewardMoney = 1100},
        [26912] = {rewardMoney = 5000},
        [26915] = {
            description = "By now, you know the basics of combat as rogue, but I want to teach you a new " ..
                "skill. As rogues, we are renowned for our ability to execute chains of combat " ..
                "techniques, often saving the most powerful strikes for the end.\n\nAs you get more " ..
                "experience, you'll learn new things - and this is one of the ones you'll learn first. " ..
                "Once you have, I want you to go try it on one of the training dummies south of the " ..
                "entrance to the abbey.",
            rewardMoney = 50,
        },
        [26920] = {rewardMoney = 900},
        [26921] = {rewardMoney = 3500},
        [26922] = {rewardMoney = 3500},
        [26923] = {rewardMoney = 7500},
        [26924] = {rewardMoney = 11000},
        [26925] = {rewardMoney = 7500},
        [26926] = {rewardMoney = 350},
        [26930] = {rewardMoney = 3000},
        [26931] = {rewardMoney = 4000},
        [26933] = {rewardMoney = 4000},
        [26934] = {
            description = "I need plagued grass for an... an experiment, of sorts. Those Argent Crusaders " ..
                "and those infernal Cenarion druids have done too good a job of healing the plaguelands, " ..
                "however... and I can't find proper reagents within a reasonable walking " ..
                "distance.\n\nSome of the local wildlife retain the plague's touch, however. Kill a " ..
                "diseased black bear, then retrieve the grass that grows where its decaying body lies. " ..
                "It's not optimal, but it'll do.",
            rewardMoney = 4000,
        },
        [26935] = {rewardMoney = 400},
        [26936] = {rewardMoney = 2000},
        [26938] = {rewardMoney = 12000},
        [26946] = {
            description = "I'm certain that by now, you've mastered using Sinister Strike against your " ..
                "enemies. But, as you learn more and advance as a rogue, you'll start to figure out new " ..
                "techniques. One you should figure out soon is called Eviscerate. It can be a strong way " ..
                "to end a combination of attacks.\n\nI want you to get some more experience, figure it " ..
                "out, then try it on a training dummy near the southeastern edge of Aldrassil.",
        },
        [26952] = {rewardMoney = 400},
        [26953] = {rewardMoney = 8000},
        [26954] = {rewardMoney = 4000},
        [26955] = {rewardMoney = 8500},
        [26956] = {rewardMoney = 4000},
        [26957] = {rewardMoney = 1100},
        [26978] = {rewardMoney = 4000},
        [26979] = {rewardMoney = 2000},
        [26999] = {rewardMoney = 4000},
        [27000] = {rewardMoney = 4000},
        [27001] = {rewardMoney = 4000},
        [27002] = {rewardMoney = 3000},
        [27011] = {rewardMoney = 4000},
        [27012] = {rewardMoney = 4000},
        [27013] = {rewardMoney = 4000},
        [27017] = {rewardMoney = 4500},
        [27053] = {rewardMoney = 2000},
        [27055] = {rewardMoney = 14000},
        [27057] = {rewardMoney = 4500},
        [27068] = {rewardMoney = 28000},
        [27070] = {rewardMoney = 28000},
        [27071] = {rewardMoney = 28000},
        [27076] = {rewardMoney = 28000},
        [27083] = {rewardMoney = 500},
        [27084] = {rewardMoney = 5000},
        [27085] = {rewardMoney = 10000},
        [27086] = {rewardMoney = 5000},
        [27087] = {rewardMoney = 500},
        [27090] = {rewardMoney = 15000},
        [27105] = {rewardMoney = 20000},
        [27107] = {rewardMoney = 20000},
        [27108] = {rewardMoney = 20000},
        [27117] = {rewardMoney = 11000},
        [27130] = {rewardMoney = 500},
        [27144] = {rewardMoney = 5000},
        [27150] = {rewardMoney = 400},
        [27151] = {rewardMoney = 4000},
        [27152] = {rewardMoney = 4000},
        [27153] = {rewardMoney = 4000},
        [27154] = {rewardMoney = 4000},
        [27155] = {rewardMoney = 4000},
        [27156] = {rewardMoney = 4000},
        [27157] = {rewardMoney = 4000},
        [27183] = {rewardMoney = 7500},
        [27184] = {rewardMoney = 7500},
        [27186] = {rewardMoney = 4000},
        [27188] = {rewardMoney = 7500},
        [27189] = {rewardMoney = 7500},
        [27190] = {rewardMoney = 7500},
        [27191] = {rewardMoney = 7500},
        [27227] = {rewardMoney = 30000},
        [27228] = {rewardMoney = 29300},
        [27229] = {rewardMoney = 7500},
        [27230] = {rewardMoney = 29300},
        [27244] = {rewardMoney = 7500},
        [27261] = {rewardMoney = 8000},
        [27267] = {
            description = "It seems that the leaders of SI:7 have taken an interest in your progress and " ..
                "your service to the Alliance. Osborne the Night Man, a high ranking member of SI:7, has " ..
                "asked to speak with you. Look for him in the southern part of Stormwind's Old " ..
                "Town.\n\nI'm not sure what Osborne wants with you, but it seemed important.",
        },
        [27279] = {
            description = "A messenger just arrived from Orgrimmar bearing a communication for you. " ..
                "Gordul, the senior rogue trainer in Orgrimmar, has sent for you. You must head to " ..
                "Orgrimmar immediately and meet with him in the Cleft of Shadow.\n\nWhen Gordul summons " ..
                "you, the prudent thing to do is obey. Do not keep him waiting, <name>.",
        },
        [27292] = {rewardMoney = 2000},
        [27293] = {rewardMoney = 4500},
        [27294] = {rewardMoney = 8000},
        [27296] = {rewardMoney = 4500},
        [27297] = {rewardMoney = 13000},
        [27311] = {rewardMoney = 5500},
        [27313] = {rewardMoney = 5500},
        [27315] = {rewardMoney = 11500},
        [27317] = {rewardMoney = 5500},
        [27319] = {rewardMoney = 11500},
        [27321] = {rewardMoney = 5500},
        [27324] = {rewardMoney = 11500},
        [27326] = {rewardMoney = 5500},
        [27328] = {rewardMoney = 12000},
        [27330] = {rewardMoney = 12000},
        [27336] = {rewardMoney = 4500},
        [27339] = {rewardMoney = 4500},
        [27340] = {rewardMoney = 4500},
        [27347] = {rewardMoney = 8500},
        [27348] = {rewardMoney = 8500},
        [27351] = {
            description = "SI:7 has been watching your progress with interest. You service to the " ..
                "Alliance is well-known and tales of your deeds have reached the king's ears.\n\nIn " ..
                "recognition of your service, King Wrynn has commissioned the royal armorer to forge a " ..
                "special weapon.\n\nThe cursed Shadowfang Keep in Silverpine Forest is home to the exotic " ..
                "materials for your weapon. Travel there and recover Commander Springvale's sharpening " ..
                "stone, a supply of moonsteel ingots, and sinew from the ghouls and geists infesting the " ..
                "keep.",
            rewardItems = {{65486, 1}},
        },
        [27352] = {rewardMoney = 29300},
        [27358] = {rewardMoney = 6000},
        [27359] = {rewardMoney = 29300},
        [27367] = {rewardMoney = 500},
        [27368] = {rewardMoney = 5000},
        [27369] = {rewardMoney = 5000},
        [27370] = {rewardMoney = 500},
        [27371] = {rewardMoney = 5000},
        [27372] = {rewardMoney = 5000},
        [27373] = {rewardMoney = 2500},
        [27396] = {
            description = "Many members of the Shattered Hand do not survive their training, <name>. Not " ..
                "only have you survived, but you will soon become a feared blade of the Horde.\n\nAs a " ..
                "reward for your progress, the warchief has commissioned his personal smith to forge a " ..
                "weapon.\n\nThe cursed Shadowfang Keep in Silverpine Forest is the only place to get the " ..
                "materials you'll need. Travel there and recover Commander Springvale's sharpening stone, " ..
                "a supply of moonsteel ingots, and sinew from the ghouls and geists infesting the keep.",
            rewardItems = {{65487, 1}},
        },
        [27407] = {rewardMoney = 4500},
        [27408] = {rewardMoney = 4500},
        [27409] = {rewardMoney = 4500},
        [27410] = {rewardMoney = 4500},
        [27411] = {rewardMoney = 14000},
        [27412] = {rewardMoney = 4500},
        [27413] = {rewardMoney = 4500},
        [27418] = {rewardMoney = 14000},
        [27579] = {rewardMoney = 800},
        [27582] = {rewardMoney = 800},
        [27596] = {rewardMoney = 33300},
        [27603] = {rewardMoney = 30700},
        [27635] = {
            description = "You've been down here in Gnomeregan for a long time, <name>, and it's amazing " ..
                "that you've survived and kept your wits so long! We need to get you out.\n\nBefore we " ..
                "can send you to the surface to join the rest of the gnomes, you have to go through the " ..
                "decontamination process. Just head into the next room and board the Sanitron 500. It " ..
                "will do the rest! It shouldn't even hurt... much.\n\nWhen you're all done, check in with " ..
                "Technician Braggle and he'll make sure you get some suitable gear.",
            rewardMoney = 25,
        },
        [27671] = {
            description = "If we don't do something quick, neither Nevin nor the survivors will make it " ..
                "out of here alive. I'm going to give you my squad's emergency teleport beacon. We still " ..
                "have enough strength and ammunition to fight our way out of here, but those survivors " ..
                "are in no condition to make a run for it.\n\nUse the beacon on survivors to arrange for " ..
                "them to be teleported out of here to the safe area my men have set up. Once you've done " ..
                "that, report back to me and we'll make arrangements to get you out of here.",
            rewardMoney = 15,
        },
        [27679] = {rewardMoney = 18700},
        [27680] = {rewardMoney = 20000},
        [27681] = {rewardMoney = 18700},
        [27682] = {rewardMoney = 18700},
        [27683] = {rewardMoney = 500},
        [27684] = {rewardMoney = 500},
        [27692] = {rewardMoney = 18700},
        [27697] = {rewardMoney = 14000},
        [27698] = {rewardMoney = 15300},
        [27989] = {rewardMoney = 6500},
        [27994] = {rewardMoney = 6500},
        [27995] = {rewardMoney = 6500},
        [27997] = {rewardMoney = 6500},
        [28000] = {rewardMoney = 6500},
        [28044] = {rewardMoney = 6500},
        [28045] = {rewardMoney = 5500},
        [28047] = {rewardMoney = 5500},
        [28048] = {rewardMoney = 11500},
        [28049] = {rewardMoney = 6500},
        [28051] = {rewardMoney = 5500},
        [28086] = {rewardMoney = 6500},
        [28087] = {rewardMoney = 6500},
        [28088] = {rewardMoney = 12500},
        [28098] = {rewardMoney = 12500},
        [28100] = {rewardMoney = 3500},
        [28102] = {rewardMoney = 6500},
        [28113] = {rewardMoney = 13000},
        [28116] = {rewardMoney = 6500},
        [28119] = {rewardMoney = 6500},
        [28121] = {rewardMoney = 6500},
        [28125] = {rewardMoney = 6500},
        [28126] = {rewardMoney = 13000},
        [28127] = {rewardMoney = 6500},
        [28128] = {rewardMoney = 13000},
        [28129] = {rewardMoney = 6500},
        [28131] = {rewardMoney = 6500},
        [28136] = {rewardMoney = 6500},
        [28139] = {rewardMoney = 6500},
        [28140] = {rewardMoney = 13000},
        [28148] = {rewardMoney = 6500},
        [28150] = {rewardMoney = 700},
        [28152] = {rewardMoney = 700},
        [28153] = {rewardMoney = 6500},
        [28155] = {rewardMoney = 20000},
        [28157] = {rewardMoney = 6500},
        [28158] = {rewardMoney = 6500},
        [28159] = {rewardMoney = 13000},
        [28161] = {rewardMoney = 19500},
        [28190] = {rewardMoney = 7000},
        [28207] = {rewardMoney = 7000},
        [28208] = {rewardMoney = 7000},
        [28213] = {rewardMoney = 13500},
        [28214] = {rewardMoney = 7000},
        [28217] = {rewardMoney = 7000},
        [28218] = {rewardMoney = 7000},
        [28219] = {rewardMoney = 7000},
        [28220] = {rewardMoney = 7000},
        [28221] = {rewardMoney = 7000},
        [28222] = {rewardMoney = 7000},
        [28224] = {rewardMoney = 7000},
        [28228] = {rewardMoney = 14000},
        [28229] = {rewardMoney = 5000},
        [28256] = {rewardMoney = 7000},
        [28257] = {rewardMoney = 14000},
        [28261] = {rewardMoney = 7000},
        [28262] = {
            description = "Lord Tony Romano, one of the senior rogue trainers in Stormwind's SI:7, has " ..
                "sent word that he wants to speak with you. Head to Stormwind as soon as you can and look " ..
                "for him in the SI:7 building just south of Old Town.",
        },
        [28264] = {rewardMoney = 21000},
        [28288] = {rewardMoney = 6500},
        [28298] = {
            description = "Gordul, leader of the rogues of the Shattered Hand in Orgrimmar, wishes to " ..
                "meet with you. Make your way to Orgrimmar quickly, <name> and seek him in the Cleft of " ..
                "Shadow. He must have an important mission for you.",
        },
        [28305] = {rewardMoney = 1700},
        [28306] = {rewardMoney = 1700},
        [28333] = {rewardMoney = 7000},
        [28334] = {rewardMoney = 7000},
        [28335] = {rewardMoney = 7000},
        [28336] = {rewardMoney = 7000},
        [28338] = {rewardMoney = 14000},
        [28339] = {rewardMoney = 7000},
        [28340] = {rewardMoney = 14000},
        [28341] = {rewardMoney = 7000},
        [28342] = {rewardMoney = 7000},
        [28357] = {rewardMoney = 7000},
        [28358] = {rewardMoney = 7000},
        [28359] = {rewardMoney = 14000},
        [28360] = {rewardMoney = 7000},
        [28361] = {rewardMoney = 7000},
        [28362] = {rewardMoney = 7000},
        [28364] = {rewardMoney = 14000},
        [28366] = {rewardMoney = 7000},
        [28368] = {rewardMoney = 14000},
        [28370] = {rewardMoney = 7000},
        [28372] = {rewardMoney = 3500},
        [28373] = {rewardMoney = 1800},
        [28374] = {rewardMoney = 14000},
        [28380] = {rewardMoney = 3500},
        [28406] = {
            description = "Things are getting interesting in Blackrock Mountain, <name>. Our sources " ..
                "report that the Dark Iron dwarves have formed closer ties with Twilight's Hammer and " ..
                "both are preparing for a major offensive.\n\nI've made the contents of the report known " ..
                "to key leaders in Stormwind and I want you to help deal with this emerging Dark Iron " ..
                "threat.\n\nThe rations for most of the Dark Iron army are kept in the East and West " ..
                "Garrison of Blackrock Depths. Take this poison and apply it to their grain reserves.",
            rewardItems = {{65624, 1}},
            rewardMoney = 14500,
        },
        [28460] = {rewardMoney = 14500},
        [28463] = {
            description = "As a member of the Shattered Hand, you know that it is our job to watch the " ..
                "Horde's enemies. We have discovered that the Dark Iron dwarves and their new allies, " ..
                "Twilight's Hammer, are preparing to attack.\n\nI'm sending you to help deal with this " ..
                "threat before the Dark Iron army marches. Take this poison and apply it to the soldiers' " ..
                "rations of grain in Blackrock Depths.\n\nThe rations for most of the Dark Iron army are " ..
                "kept in the East and West Garrison of Blackrock Depths.",
            rewardItems = {{65629, 1}},
            rewardMoney = 14500,
        },
        [28467] = {rewardMoney = 5500},
        [28469] = {rewardMoney = 14500},
        [28470] = {rewardMoney = 14500},
        [28471] = {rewardMoney = 3500},
        [28472] = {rewardMoney = 3500},
        [28479] = {rewardMoney = 4000},
        [28508] = {rewardMoney = 900},
        [28513] = {rewardMoney = 7500},
        [28518] = {rewardMoney = 7500},
        [28519] = {rewardMoney = 7500},
        [28521] = {rewardMoney = 3500},
        [28522] = {rewardMoney = 14500},
        [28530] = {rewardMoney = 14500},
        [28534] = {rewardMoney = 1900},
        [28535] = {rewardMoney = 1900},
        [28536] = {rewardMoney = 4000},
        [28537] = {rewardMoney = 15000},
        [28540] = {rewardMoney = 15000},
        [28609] = {rewardMoney = 4000},
        [28610] = {rewardMoney = 7500},
        [28618] = {rewardMoney = 4000},
        [28624] = {rewardMoney = 4000},
        [28625] = {rewardMoney = 7500},
        [28626] = {rewardMoney = 4000},
        [28627] = {rewardMoney = 4000},
        [28628] = {rewardMoney = 4000},
        [28629] = {rewardMoney = 15500},
        [28630] = {rewardMoney = 4000},
        [28631] = {rewardMoney = 15500},
        [28632] = {rewardMoney = 7500},
        [28634] = {rewardMoney = 3500},
        [28647] = {rewardMoney = 7300},
        [28656] = {rewardMoney = 15000},
        [28674] = {rewardMoney = 4000},
        [28676] = {rewardMoney = 4000},
        [28701] = {rewardMoney = 16000},
        [28722] = {rewardMoney = 7500},
        [28723] = {
            description = "Now that you're practiced in your new ability, perhaps you'd be willing to aid " ..
                "us in further pursuing the corruption haunting Shadowglen.\n\nDentaria Silverglade, " ..
                "Priestess of the Moon, has offered to aid us. You should find her between the two pools " ..
                "just north of our great tree. Circle around the tree to reach her and offer her any help " ..
                "that you can, young <class>.",
            rewardMoney = 25,
        },
        [28724] = {
            description = "Our friend Iverron has fallen to poison from the nearby webwood spiders. I can " ..
                "tend to him to keep his state from deteriorating, but I need someone to gather an " ..
                "ingredient to prepare him an antidote.\n\nAll around the ponds you should find Moonpetal " ..
                "Lilies. These flowers have great healing properties, and I can use them with the " ..
                "ingredients I already have to restore Iverron to better health.\n\nWould you gather them " ..
                "for me? There should be many just in sight of here, near the water's edge.",
            rewardChoices = {{10655, 1}, {10656, 1}},
            rewardMoney = 50,
        },
        [28725] = {
            description = "I must ask something more dangerous of you. Strange news has traveled to me " ..
                "through the whisperings of the forest spirits. The mysterious woodland protector, " ..
                "Tarindrella, has returned to Shadowglen again.\n\nThe dryad's presence has not been felt " ..
                "in the forests since before the blessing of Teldrassil. Something is surely amiss if she " ..
                "has journeyed back to this land.\n\nSeek out Tarindrella in the Shadowthread cave to the " ..
                "north. It is dangerous, but we will be prepared with this antidote just in case.",
            rewardMoney = 40,
        },
        [28728] = {
            description = "I will pursue the trail of the Gnarlpine and track this corruption to its " ..
                "source. If you ever encounter Athridas Bearmantle in Dolanaar, he knows intimately of " ..
                "the problems that plague this forest, and he can direct you on how to help " ..
                "further.\n\nI'm sure we will meet again with time. Perhaps you can aid me in dealing " ..
                "with the source of this corruption once I locate it. For now, I will take you back to " ..
                "Dentaria so that you may finish your training. Thank you for all that you have done, " ..
                "<name>.",
            rewardMoney = 50,
        },
        [28730] = {
            description = "Tenaron Stormgrip oversees all that happens in this glade. He presides at the " ..
                "top of Aldrassil.\n\nIf you look to your south, you will see the underside of the ramp " ..
                "that leads up to him. Ascend this ramp and complete your training.\n\nIt was wonderful " ..
                "to have met you, <name>. I swell with pride knowing that among young night elves, there " ..
                "are some so selfless and full of life as you are. You will do great things for our " ..
                "people. You will do great things for this world.\n\nUntil we meet again.",
            rewardChoices = {{4907, 1}, {5395, 1}, {11189, 1}},
            rewardMoney = 100,
        },
        [28750] = {rewardMoney = 900},
        [28764] = {
            description = "So you're the new recruit from Stormwind, eh? I'm Marshal McBride, commander " ..
                "of this garrison. Glad to have you on board...\n\n<McBride looks through some " ..
                "papers.>\n\n<name>. It is <name>, right?\n\nYou've arrived just in time. The Blackrock " ..
                "orcs have managed to sneak into Northshire through a break in the mountain. My soldiers " ..
                "are doing the best that they can to push them back, but I fear they will be overwhelmed " ..
                "soon.\n\nHead northwest into the forest and kill the attacking Blackrock worgs! Help my " ..
                "soldiers!",
            rewardItems = {{57254, 1}},
            rewardMoney = 50,
        },
        [28772] = {
            description = "The invading orcs aren't fools. They are sizing us up, making sure that when " ..
                "they attack it will be to their advantage.\n\nIn the forest, to the northwest, are " ..
                "Blackrock spies. They peer at us through spyglasses, watching our every move - waiting. " ..
                "I want you take the fight to them!\n\nKill the Blackrock spies! We must show them that " ..
                "we know they are watching us and that we are prepared!",
            rewardItems = {{57387, 1}},
            rewardMoney = 40,
        },
        [28787] = {
            description = "While you were out training I received an urgent message from Sergeant Willem. " ..
                "Turns out that the Blackrock orcs have hired goblin assassins. They ambushed our " ..
                "battalion behind the abbey. Willem has asked me to send him a hero. You have to go help " ..
                "them, <name>!\n\nFind Sergeant Willem north of the abbey at the command tent. Go!",
            rewardMoney = 13,
        },
        [28795] = {
            description = "Have you ever seen a goblin, <name>? They're wretched little green-skinned " ..
                "monsters that love only two things: gold and themselves.\n\nThe Blackrock orcs have " ..
                "enlisted the aid of goblin assassins to kill our soldiers. If you look to the field in " ..
                "the north you can barely make out their silhouettes, sneaking about in the grass.\n\nI " ..
                "need you to head out there and kill every goblin that you see. They need to learn that " ..
                "nobody messes with the Alliance!",
            rewardItems = {{2186, 1}},
            rewardMoney = 50,
        },
        [28798] = {rewardMoney = 114000},
        [28799] = {rewardMoney = 74000},
        [28800] = {rewardMoney = 94000},
        [28801] = {rewardMoney = 114000},
        [28802] = {rewardMoney = 9000},
        [28803] = {rewardMoney = 114000},
        [28804] = {rewardMoney = 114000},
        [28821] = {
            description = "Excellent work, <name>! The rear is now officially clear. We'll take care of " ..
                "the stragglers. I want you to go back to Marshal McBride, standing in front of " ..
                "Northshire Abbey, south of here, and let him know that the goblin situation is under " ..
                "control.\n\nFarewell, <class>.",
            rewardMoney = 7,
        },
        [28829] = {rewardMoney = 8000},
        [28830] = {rewardMoney = 8000},
        [28831] = {rewardMoney = 8000},
        [28837] = {rewardMoney = 8000},
        [28841] = {rewardMoney = 8500},
        [28842] = {rewardMoney = 16500},
        [28847] = {rewardMoney = 800},
        [28848] = {rewardMoney = 800},
        [28856] = {rewardMoney = 4000},
        [29261] = {rewardMoney = 114000},
        [29262] = {rewardMoney = 114000},
        [29408] = {rewardMoney = 35},
        [29410] = {rewardMoney = 8},
        [29542] = {rewardMoney = 2800},
        [29548] = {
            description = "Well, you heard the King. Admiral Taylor's last transmission came from " ..
                "somewhere in the southern seas.\n\nWe will begin our search from the air! Locating the " ..
                "Prince - the White Pawn - is of critical priority.\n\nThe Skyfire is fueled, supplied, " ..
                "and ready to depart. She and her crew idle in the sky just north of the harbor.\n\nMake " ..
                "your last preparations, then meet Admiral Rogers on the deck. We will depart without " ..
                "delay.",
            rewardMoney = 98000,
        },
        [29566] = {rewardMoney = 3400},
        [29571] = {rewardMoney = 3400},
        [29582] = {rewardMoney = 3600},
        [29609] = {
            description = "Welcome to Northrend. I have been asked to arrange travel for you to Dalaran " ..
                "so that you can meet our friends in the city.\n\nSpeak with me and accept a ride to " ..
                "Dalaran. Once you land, make your way to The Filthy Animal.\n\nMake contact with Uda the " ..
                "Beast immediately.\n\nShe can help you bind your hearthstone to the city so you can use " ..
                "the portal in Sunreaver's Sanctuary to travel back to Orgrimmar quickly.",
        },
        [29905] = {rewardItems = {{84105, 1}}, rewardMoney = 196000},
        [30036] = {
            description = "First, you will need weapons suited to your talents. Retrieve a pair of " ..
                "daggers from one of the weapon racks below, bring them to me, and show me that you know " ..
                "how to hold them properly.",
            rewardMoney = 15,
        },
        [30039] = {
            description = "Freshly arrived for your training, your first task is simple: Speak to Master " ..
                "Shang Xi.",
            rewardMoney = 2,
        },
        [30043] = {
            description = "Fresh to your training, your first task is simple: Speak to Master Shang Xi.",
            rewardMoney = 2,
        },
        [30147] = {rewardMoney = 114000},
        [30508] = {
            description = "It would seem that your Admiral Taylor has awakened from his injuries. He and " ..
                "his people are upstairs.\n\nHe has requested your presence.",
            rewardMoney = 10200,
        },
        [30597] = {rewardXP = 69400},
        [30724] = {
            description = "They are attacking again!\n\n<Lin looks to the Ox Gate.>\n\nArchers... on the " ..
                "wall!\n\nI need you to get up there. My wife Suna went to scout the wall with that fool " ..
                "Lao-Chen. Perhaps if he had spent more time preparing defenses and less building that " ..
                "ridiculous ale lift contraption...\n\nIt matters not. Get a kite from Len, to the west, " ..
                "and then get up there and find my wife. She'll know what to do next.",
            rewardMoney = 10600,
        },
        [30746] = {
            description = "<The roar bellows out again, louder and more fierce than any of the yetis " ..
                "you've encountered so far. Again, a grummle voice replies...>\n\nEep! Please, great Kota " ..
                "Kon, forgive grummle. Let me go, I'll bring lots of kafa right away! Promise!\n\n<The " ..
                "beast called Kota Kon answers with another meaty roar.>",
            rewardMoney = 106000,
        },
        [30772] = {
            description = "Ahead of us is the main thrust of the yaungol army.\n\nHere, they prepare " ..
                "their vast army to attack the villages of Kun-Lai.\n\nIf we strike at the Osul now, we " ..
                "can cut them at their very core.\n\nRemember, for every of their number that we strike " ..
                "down here, we save one of our own back at home.",
            rewardChoices = {
                {83671, 1}, {83672, 1}, {83673, 1}, {83674, 1}, {83675, 1}, {83676, 1}, {83677, 1},
                {83678, 1}, {83679, 1},
            },
            rewardMoney = 110000,
        },
        [30794] = {
            description = "I... am alive... but barely. They killed the rest. My friends... and " ..
                "family...\n\nI must return to the village... But, I do not have long, and cannot move on " ..
                "my own... are you a healer? I... have a healing potion in my hut... search my " ..
                "belongings. You can use your magic, if you have it.",
            rewardMoney = 51000,
        },
        [30889] = {
            description = "Good to meet you, <class>. We have traps all along the pass to help us catch " ..
                "mantid that might be sneaking through, but their numbers have been so great that most of " ..
                "the traps have already been triggered.\n\nTaoshi said you might be able to reset some of " ..
                "them while you're out there. Can you help?",
            rewardMoney = 110000,
        },
        [30893] = {
            description = "Gao-ran's men need help down on the southern front. If you want to stand by " ..
                "the Shado-Pan, that's where you should do it.",
            rewardChoices = {
                {83698, 1}, {83699, 1}, {83700, 1}, {83701, 1}, {83702, 1}, {83703, 1}, {83704, 1},
                {83705, 1}, {83706, 1},
            },
            rewardMoney = 110000,
        },
        [30923] = {
            description = "Every day, the mantid build up munitions for use on their enemies. We cannot " ..
                "stop them, just you and I... but we can set them back.\n\n< Tai Ho hands you some " ..
                "explosives.>\n\nI need to keep a low profile. Would you do the honors?",
            rewardMoney = 110000,
        },
        [30960] = {
            description = "I still have some cleanup to do here in the pass - there are some mantid still " ..
                "making it through. You're a valuable person to have at hand though, and I know Taran " ..
                "wouldn't appreciate me keeping you longer for such basic work.\n\nTaran should still be " ..
                "in the main camp with Gao-Ran. Report back in. I'll catch up with you a bit later.",
            rewardMoney = 27500,
        },
        [30975] = {
            description = "Let's press these insects back across the bridge and break their " ..
                "spirits!\n\nFollow my lead.",
            rewardChoices = {{83721, 1}, {83722, 1}, {83723, 1}, {83724, 1}, {83725, 1}},
            rewardMoney = 110000,
        },
        [30991] = {
            description = "When I trained as a Brewmaster, I didn't expect to use my knowledge like " ..
                "this...\n\nDid you know beer catches fire when lit? Well, with yaungol oil mixed in, " ..
                "it's downright explosive.\n\nI've mixed the oil in with these kegs. Roll them at the " ..
                "yaungol over by the gate, and ignite them when you get close.\n\nIt'll take a few " ..
                "seconds for the keg to blow, but when it does...\n\nWell, let's just say I wouldn't want " ..
                "to be over there.\n\nWhich is why I'll be over here. Mourning the loss of this brew.",
            rewardItems = {{88531, 1}},
            rewardMoney = 106000,
        },
        [31011] = {
            description = "The Zandalari have begun their attack! You must help defend the village!\n\nIf " ..
                "we can't push them back, we will never find the Thunder King's remains!",
            rewardMoney = 106000,
        },
        [31047] = {
            description = "Do you know the story of the great cloud serpents of Pandaria, " ..
                "<name>?\n\nSomeday you must hear it. Unfortunately, there is no time to tell it " ..
                "now.\n\nWhat you must know is that the wild cloudrunner serpents of Townlong are in " ..
                "trouble.\n\nThe mogu are capturing wild serpents and corrupting their minds, bending " ..
                "them to their sinister will.\n\nGo to Shan'ze Dao, to the northwest. Free the adult " ..
                "serpents from their chains. Save them!",
            rewardMoney = 114000,
        },
        [31048] = {
            description = "We've found ancient mogu burial urns among the ruins on Shan'ze Dao.\n\nThis " ..
                "is normally no problem, except these urns are home to angry mogu spirits.\n\nNot only do " ..
                "these urns pose a danger to anyone unlucky enough to find one, but they could be used " ..
                "for destruction if they were to fall into the wrong hands.\n\nWe must rid Shan'ze Dao of " ..
                "their presence.",
            rewardMoney = 114000,
        },
        [31138] = {
            description = "When you fight, you grow in skill. As you grow in skill, you will begin to " ..
                "figure out new moves. Go, explore, learn, and show me what you figure out.",
            rewardItems = {{59042, 1}},
            rewardMoney = 40,
        },
        [31140] = {
            description = "The invading orcs aren't fools. They are sizing us up, making sure that when " ..
                "they attack it will be to their advantage.\n\nIn the forest, to the northwest, are " ..
                "Blackrock spies. They peer at us through spyglasses, watching our every move - waiting. " ..
                "I want you take the fight to them!\n\nKill the Blackrock spies! We must show them that " ..
                "we know they are watching us and that we are prepared!",
            rewardItems = {{57387, 1}},
            rewardMoney = 40,
        },
        [31142] = {
            description = "Now that you've had the chance to test your abilities in battle, it's time to " ..
                "explain one more reason why training is so important.\n\nAs you get more experience, " ..
                "you'll be able to do new techniques you never thought of.\n\nGo, get some experience, " ..
                "learn a new skill, and demonstrate it on one of the training dummies.",
            rewardMoney = 50,
        },
        [31143] = {
            description = "While you were out training I received an urgent message from Sergeant Willem. " ..
                "Turns out that the Blackrock orcs have hired goblin assassins. They ambushed our " ..
                "battalion behind the abbey. Willem has asked me to send him a hero. You have to go help " ..
                "them, <name>!\n\nFind Sergeant Willem north of the abbey at the command tent. Go!",
            rewardMoney = 13,
        },
        [31146] = {
            description = "Ah, while you were off dealing with the mindless Scourge, this scroll arrived " ..
                "for you. The pandaren visitor, Ting, sent it for you. Maybe you monks can read this " ..
                "garbage, but I can't. You should go talk to her. She's in the Inn across the way.",
        },
        [31150] = {
            description = "<name>, this rune was given to me to pass on to ye. Take some time to read it " ..
                "when ye have a chance. I'm thinkin' it came from our visitor from afar, Lo. Take a " ..
                "gander at it and go find him inside Anvilmar.",
            rewardMoney = 25,
        },
        [31151] = {
            description = "The truth is, you already have the talent and ability to learn what you need " ..
                "to. What I can help you do is show you where to unlock it.\n\nFirst, you must practice " ..
                "until you begin to understand a new technique. The first technique you learn will be the " ..
                "Tiger Palm. Go, learn more until you have unlocked the potential within yourself, and " ..
                "then practice your new move!\n\nRemember - it's all in the mind!",
        },
        [31157] = {
            description = "As you walk the road of your training, you will begin to discover within " ..
                "yourself the power to unlock new techniques. You need not even learn them from me, or " ..
                "another more experienced monk - you will find that they come to you on their own.\n\nFor " ..
                "now, you should go and practice the basics. Gather more experience, and develop a new " ..
                "technique - once you have, you can practice it on the dummies nearby to master it.",
            rewardItems = {{87265, 1}},
        },
        [31160] = {
            description = "Lets put dose skills ta use. I'll start ya off easy, mon.\n\nThere be cats " ..
                "killing our boars. Dat food ain't for sharin'. Dose boars are gonna need ta be alive if " ..
                "ya be wanting food tonight.\n\nDey're all over the island. Bring me some cat pelts.",
            rewardMoney = 50,
        },
        [31161] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{85574, 1}},
            rewardMoney = 50,
        },
        [31166] = {
            description = "You have done well. As you continue along your path, you will grow, learning " ..
                "new techniques that you couldn't have imagined before.\n\nYour first lesson is the power " ..
                "of experience. Go, learn a new ability, and demonstrate it for me.",
        },
        [31169] = {
            description = "The true secret to the art of the monk is unlocking the knowledge and power " ..
                "hidden inside yourself.\n\nGo, get more experience, and learn a new skill. Then " ..
                "demonstrate it on one of the training dummies.",
        },
        [31170] = {
            description = "As you advance within your class, you will want to take advantage of the " ..
                "training that your class trainer can provide you. For young monks here on Sunstrider " ..
                "Isle, your trainer is Pao, our Pandaren visitor. Speak with her and see what training " ..
                "she has available for you.\n\nPao - as with all the trainers on Sunstrider Isle - is " ..
                "inside the Sunspire on the lower level.",
        },
        [31171] = {
            description = "Good. You are off to a bright start. This road will be long, and as you become " ..
                "more accomplished, you will begin to discover that you can do things you could never " ..
                "have imagined before.\n\nGo, get more experience, and learn a new technique. Once you " ..
                "have, demonstrate it on one of the training dummies.",
        },
        [31173] = {
            description = "I hope your people are all alright... the crash was unbelievably loud and " ..
                "destructive!\n\n<Mojo looks you over, evaluating your potential.>\n\nYes, you'll do " ..
                "fine. They've said that they need more people to fight, and they don't want me to hurt " ..
                "myself. I'm not afraid, but I don't want to intrude. So, I'll teach you.\n\nAs you may " ..
                "have discovered, your experiences in combat will unlock new potential within you. Go, " ..
                "see if you can master a new ability. Show it to me. You'll get the hang of things.",
        },
        [31228] = {
            description = "Prophet Khar'zul is a powerful caster, but he is also underestimating your " ..
                "abilities.\n\nKhar'zul and his forces must be destroyed to protect this village. His " ..
                "death will send a strong message to the Thunder King that we will not be " ..
                "defeated!\n\nYou'll find him on the Isle of Reckoning.",
            rewardChoices = {
                {82514, 1}, {82515, 1}, {82516, 1}, {82517, 1}, {82518, 1}, {82519, 1}, {82520, 1},
                {82521, 1}, {82522, 1},
            },
            rewardMoney = 106000,
        },
        [31239] = {rewardItems = {{84105, 1}}, rewardMoney = 98000},
        [31288] = {rewardMoney = 114000},
        [31291] = {rewardMoney = 114000},
        [31490] = {rewardMoney = 12000},
        [31493] = {rewardMoney = 12000},
        [31514] = {rewardMoney = 14000},
        [31585] = {rewardMoney = 9000},
        [31586] = {rewardMoney = 9000},
        [31587] = {rewardMoney = 9000},
        [31812] = {rewardMoney = 3500},
        [31813] = {rewardMoney = 94000},
        [31814] = {rewardMoney = 65000},
        [31815] = {rewardMoney = 94000},
        [31817] = {rewardMoney = 114000},
        [31836] = {
            description = "Welcome back <name>, the time has come for the next step of your training. " ..
                "Speak with Master Yoon in the Training Grounds below us for your next lesson.",
            rewardChoices = {{89548, 1}, {89549, 1}, {89550, 1}},
        },
        [31837] = {
            description = "Welcome back <name>, the time has come for the next step of your training. " ..
                "Speak with Master Cheng in the Training Grounds below us for your next lesson.",
            rewardChoices = {{89564, 1}, {89565, 1}},
        },
        [31838] = {
            description = "Welcome back <name>, the time has come for the next step of your training. " ..
                "Speak with Master Tsang in the Training Grounds below us for your next lesson.",
            rewardChoices = {{89567, 1}, {89569, 1}},
        },
        [31840] = {
            description = "Welcome Back, <name>. I see you've returned to hone your skills. Speak with " ..
                "Master Cheng in the Training Grounds below us for a practice sparring session.",
        },
        [31841] = {
            description = "Welcome Back, <name>. I see you've returned to hone your skills. Speak with " ..
                "Master Woo in the Training Grounds below us for a practice sparring session.",
        },
        [31843] = {
            description = "Welcome Back, <name>. I see you've returned to hone your skills. Speak with " ..
                "Master Yoon in the Training Grounds below us for a practice sparring session.",
        },
        [31844] = {
            description = "Welcome Back, <name>. I see you've returned to hone your skills. Speak with " ..
                "Master Cheng in the Training Grounds below us for a practice sparring session.",
        },
        [31845] = {
            description = "Welcome Back, <name>. I see you've returned to hone your skills. Speak with " ..
                "Master Tsang in the Training Grounds below us for a practice sparring session.",
        },
        [31846] = {
            description = "Welcome Back, <name>. I see you've returned to hone your skills. Speak with " ..
                "Master Hsu in the Training Grounds below us for a practice sparring session.",
        },
        [31855] = {
            description = "The time has come for you to return to the Peak of Serenity to continue your " ..
                "training. Use Zen Pilgrimage to return there and speak with Master Hight when you arrive.",
        },
        [31856] = {
            description = "The time has come for you to venture to the Peak of Serenity to begin training " ..
                "in the ways of the Monk. Use Zen Pilgrimage to go there and speak with Master Hight when " ..
                "you arrive.",
        },
        [31857] = {
            description = "The time has come for you to return to the Peak of Serenity to continue your " ..
                "training. Use Zen Pilgrimage to return there and speak with Master Hight when you arrive.",
        },
        [31870] = {rewardMoney = 68000},
        [31989] = {
            description = "The time has come for you to return to the Peak of Serenity to complete your " ..
                "training. Use Zen Pilgrimage to return there and speak with Master Hight when you arrive.",
        },
        [32009] = {rewardMoney = 9000},
        [32434] = {rewardItems = {{93146, 1}}, rewardMoney = 94000},
        [32521] = {rewardItems = {{94220, 1}}, rewardMoney = 228000},
        [32900] = {
            description = "My mind is spinning with boredom - I never get to leave this place!\n\nYou " ..
                "look like you've seen some adventures. If you can bring me a truly heroic story, I've " ..
                "got something special I'm sure you'll be interested in.",
            rewardItems = {{98546, 1}},
            rewardMoney = 342000,
        },
    },
    npcs = {
        [1160] = {spawns = {[11] = {{15.2, 23.6}, {15.4, 23.4}, {15.6, 23.4}}}, zoneID = 11},
        [1163] = {
            spawns = {
                [38] = {
                    {27.4, 85.4}, {27.4, 85.6}, {28, 82}, {28.2, 81.2}, {28.2, 86.8}, {28.4, 83.6},
                    {28.8, 83.4}, {28.8, 85.8}, {29.2, 81.2}, {29.2, 87.4}, {29.4, 84.8}, {29.6, 82.6},
                    {29.8, 84}, {30, 80}, {30.4, 84.6}, {30.8, 85}, {31.8, 86.4}, {32.4, 87.4}, {32.6, 87.8},
                    {33, 89.6}, {33.4, 89}, {33.8, 88.6}, {34.2, 87.6}, {34.4, 81.4}, {34.4, 85},
                    {34.4, 87.2}, {34.6, 86.4}, {34.8, 79.2}, {34.8, 89.8}, {35, 90.6}, {35.2, 82.4},
                    {35.2, 84}, {35.4, 79.6}, {35.4, 83.4}, {35.6, 79.6}, {35.6, 83.2}, {35.8, 89},
                    {36, 84.8}, {36.2, 81.2}, {36.2, 82.2},
                },
            },
            zoneID = 38,
        },
        [1166] = {
            spawns = {
                [38] = {
                    {27.4, 85.4}, {27.4, 85.6}, {27.8, 81.6}, {28, 81.2}, {28.2, 86.8}, {28.4, 83.6},
                    {28.8, 83.4}, {29, 81.2}, {29, 87.6}, {29.2, 81.6}, {29.2, 87.4}, {29.6, 81.2},
                    {29.8, 81.6}, {30, 83.8}, {31.6, 86.2}, {32.2, 87.2}, {33.4, 89}, {33.8, 88.6},
                    {34.2, 81.6}, {34.2, 85}, {34.4, 87.4}, {34.4, 87.6}, {34.6, 84.8}, {34.6, 89.4},
                    {34.8, 84.4}, {35, 90.6}, {35.2, 87.4}, {35.4, 80}, {35.4, 87.6}, {35.6, 87.4},
                    {35.8, 84}, {36, 84.8}, {36.2, 82.4}, {36.2, 83.4}, {36.4, 78}, {36.4, 79.4},
                    {36.4, 81.4}, {36.6, 78.2}, {36.6, 81.2}, {36.6, 84.4},
                },
            },
            zoneID = 38,
        },
        [1748] = {
            spawns = {
                [1497] = {{50.2, 87.4}, {50.6, 88.6}, {53.6, 92.4}, {55.8, 96.4}, {55.8, 96.6}},
                [1519] = {
                    {38.4, 44.4}, {38.4, 44.8}, {38.6, 44.8}, {38.8, 44}, {40.6, 45.6}, {41, 42.8},
                    {41.6, 43.6}, {77.4, 18.4}, {78, 18},
                },
                [1637] = {{34, 35.4}, {34.6, 37.8}, {37, 37.2}},
                [1638] = {{56.2, 51}},
            },
            zoneID = 1519,
        },
        [3231] = {
            spawns = {
                [14] = {
                    {34.2, 45.2}, {34.2, 46}, {34.2, 47.6}, {34.2, 49}, {34.4, 44.2}, {34.4, 51},
                    {34.4, 52.6}, {34.4, 53.8}, {34.6, 47.4}, {34.6, 48.4}, {34.6, 51.4}, {34.6, 51.8},
                    {34.6, 54}, {34.8, 25.8}, {34.8, 29}, {34.8, 29.6}, {34.8, 55}, {35, 24}, {35.2, 26.8},
                    {35.2, 45.4}, {35.4, 24.8}, {35.4, 57}, {35.4, 58.6}, {35.6, 24.4}, {35.6, 27.4},
                    {35.6, 30.4}, {35.6, 55.4}, {35.6, 56.2}, {35.8, 51.8}, {35.8, 57.8}, {36.2, 22.2},
                    {36.2, 22.6}, {36.6, 22}, {36.6, 23}, {36.8, 19.8}, {36.8, 21}, {37, 19}, {37.2, 17.4},
                    {37.4, 15.8}, {37.6, 15.4},
                },
                [17] = {
                    {62.4, 12}, {62.8, 12.6}, {63, 21}, {63, 22}, {63, 22.6}, {63, 23.6}, {63, 27.6},
                    {63.2, 10.4}, {63.2, 11.2}, {63.2, 11.8}, {63.2, 25.4}, {63.2, 25.6}, {63.2, 27},
                    {63.4, 8.6}, {63.6, 27.4}, {63.8, 8.2}, {63.8, 9.4}, {63.8, 27.8}, {64.2, 5.2},
                    {64.2, 7.4}, {64.4, 6},
                },
            },
            zoneID = 14,
        },
        [5296] = {
            spawns = {
                [357] = {
                    {52, 31.4}, {52, 31.6}, {52.2, 29.6}, {52.6, 30.6}, {52.8, 30.4}, {53, 31.8}, {54, 32.4},
                    {54.4, 33}, {54.6, 33.8}, {54.8, 32.4}, {55, 33}, {55.6, 33.4},
                },
            },
            zoneID = 357,
        },
        [5297] = {
            spawns = {
                [357] = {
                    {52.4, 31.8}, {53.2, 31.8}, {53.6, 32}, {54.4, 33}, {54.4, 33.8}, {54.6, 33.8},
                    {54.8, 32.4}, {55.4, 32.8}, {55.6, 33},
                },
            },
            zoneID = 357,
        },
        [7665] = {
            spawns = {
                [4] = {
                    {42.2, 13.4}, {42.4, 12.4}, {42.4, 13.8}, {42.6, 12.4}, {42.6, 13.8}, {43, 12.8},
                    {43.4, 14.8}, {43.6, 15.2}, {44, 15.8}, {44.6, 17.2},
                },
            },
            zoneID = 4,
        },
        [7666] = {spawns = {[4] = {{66.8, 29.4}, {66.8, 29.6}, {67.6, 29.8}}}, zoneID = 4},
        [7667] = {spawns = {[4] = {{40.4, 30}, {40.6, 30.2}, {40.8, 29.4}, {40.8, 30.6}}}, zoneID = 4},
        [9165] = {
            spawns = {
                [490] = {
                    {57.4, 35.2}, {57.6, 35}, {59.4, 35.8}, {59.8, 35.8}, {60.6, 35.8}, {61.4, 35},
                    {62.2, 34.4}, {62.6, 34.2}, {63.6, 33.4}, {63.8, 34.2}, {65.6, 34}, {66.4, 34.6},
                    {67, 27}, {67.4, 33.8}, {68.2, 25.4}, {68.2, 25.6}, {68.4, 24.2}, {68.4, 33.4},
                    {68.6, 23.2}, {68.6, 23.6}, {68.8, 33}, {69.2, 32.4}, {70.4, 26.6}, {70.4, 27.6},
                    {70.6, 27.2}, {70.6, 27.8}, {71.2, 28.8}, {72, 30.4}, {72.6, 31}, {73.4, 32},
                    {73.6, 33.4}, {73.6, 34.2}, {77, 39.2}, {77.2, 40.2}, {77.2, 59.4}, {77.2, 59.8},
                    {77.6, 60.6}, {77.8, 40.4}, {77.8, 58.6}, {77.8, 59.6},
                },
            },
            zoneID = 490,
        },
        [14527] = {
            spawns = {
                [490] = {
                    {24.2, 54.6}, {24.8, 41.4}, {25.4, 49.8}, {25.6, 49.6}, {25.8, 48.6}, {25.8, 61.4},
                    {26.2, 45.8}, {26.2, 48}, {26.6, 44}, {26.6, 61.2}, {27.2, 46.8}, {27.2, 51.4},
                    {27.4, 48.2}, {27.4, 48.6}, {27.4, 55.4}, {27.6, 48.4}, {27.8, 44.2}, {27.8, 49},
                    {27.8, 52.6}, {27.8, 55.2}, {28, 58.8}, {28.2, 53.6}, {28.4, 65.2}, {28.4, 66},
                    {28.6, 47.4}, {28.8, 49.4}, {29, 65.2}, {29.2, 50.2}, {29.4, 50.6}, {29.4, 56.2},
                    {29.6, 45.8}, {29.6, 50.4}, {29.6, 52.6}, {29.6, 55.4}, {29.6, 71.2}, {29.8, 47.6},
                    {29.8, 73.6}, {30, 57.2}, {30.2, 47.4}, {30.2, 66.8},
                },
            },
            zoneID = 490,
        },
        [39926] = {
            spawns = {
                [616] = {
                    {57.4, 17}, {58, 17.4}, {58, 18.8}, {58.2, 18.2}, {58.2, 22.2}, {59, 18.6}, {59.4, 23.4},
                    {59.4, 23.6}, {59.6, 23.6}, {60.6, 22.4}, {61.2, 35.4}, {61.4, 34}, {62.8, 31.4},
                    {63, 19.4}, {63, 19.6}, {63.4, 29.6}, {63.6, 27.4}, {63.6, 29.4}, {63.6, 30.8},
                    {63.8, 19.4}, {64.2, 26}, {64.4, 27.6}, {64.6, 27.4}, {65.2, 18.6}, {65.2, 20},
                    {65.4, 20.6}, {65.6, 19.8}, {66, 21}, {66, 23.4}, {66.6, 20.4}, {66.6, 21}, {67.2, 22.6},
                    {67.4, 23.6}, {67.4, 25.4}, {67.4, 25.6}, {67.6, 23.4}, {67.6, 23.6}, {67.6, 25.4},
                    {68.2, 21.2}, {69.4, 23},
                },
            },
        },
        [41009] = {spawns = {[406] = {{73.2, 61}}}, zoneID = 406},
        [41098] = {spawns = {[4815] = {{58.2, 49}, {60.2, 59.4}}}},
        [44490] = {spawns = {[5145] = {{69.6, 34.4}, {69.6, 34.6}}}, zoneID = 5145},
    },
    objects = {},
    items = {},
}
