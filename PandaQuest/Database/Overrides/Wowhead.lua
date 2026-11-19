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
        [40] = {
            description = "<name>, there's a new threat in Elwynn Forest! Murlocs are swimming up the " ..
                "streams of eastern Elwynn, scaring away fish and attacking gentle folk!\n\nI warned " ..
                "Marshal Dughan, but he's more worried about the gnolls and the bandits. He's not " ..
                "convinced that the murlocs are a danger.\n\nPlease, <name>, speak to Dughan and persuade " ..
                "him to send more troops to the east!",
        },
        [487] = {
            description = "The road to Darnassus must be kept safe. Corrupted furbolgs from the Gnarlpine " ..
                "tribe have been attacking travelers relentlessly.\n\nImportant news and commerce travels " ..
                "to and from Darnassus by way of this road daily. We cannot afford to have a rogue band " ..
                "of heathens terrorizing people.\n\nTake up arms in the name of the sacred forest, " ..
                "<class>. Their den lies up this northern path. Slay these Gnarlpine ambushers and report " ..
                "back to me.",
            rewardMoney = 300,
        },
        [851] = {
            description = "Verog may be hard to find, but judging by the info you gathered, his mate " ..
                "Wyneth is always in his command tent just west of here. If we kill her, Verog will come " ..
                "running.\n\nRegthar sent us here to scout, but he also said we should seize any " ..
                "opportunity to upset the centaur chain of command if we can. Lure out Verog and kill him!",
            rewardChoices = {{59566, 1}, {59567, 1}},
            rewardMoney = 800,
        },
        [852] = {
            description = "Hezrul Bloodmark is the leader of the Kolkar centaurs in the Barrens. He is " ..
                "fierce, brutal and cunning. Defeating him would disrupt and fracture the Kolkars, " ..
                "greatly reducing their threat to us.\n\nSo kill him. Bring me Hezrul's Head, and I will " ..
                "mount it from this outpost, so that they may know fear.\n\nHezrul leads his people from " ..
                "the Lushwater Oasis, to the south.",
            rewardChoices = {{59585, 1}, {59586, 1}, {59587, 1}},
            rewardItems = {{5351, 1}},
            rewardMoney = 1100,
        },
        [872] = {
            description = "Pigmen running amok right on the border of Durotar? Not on my watch! It is as " ..
                "they say, <name>: The best defense is crushing all who oppose you.\n\nOne of my scouts " ..
                "followed the quilboar after the last caravan raid, so we know where to strike. Kreenig " ..
                "Snarlsnout is the mastermind behind the attacks along the river. Crush him, <class>. " ..
                "Defeat him and disembowel his forces so that the attacks on this camp cease.\n\nSearch " ..
                "for a quilboar-infested cavern along the river, just south of our stables.",
            rewardChoices = {{59542, 1}, {59543, 1}, {59544, 1}},
        },
        [881] = {
            description = "Whitemist, or ' Echeyakee ' in the tauren tongue, is the king of the savannah " ..
                "cats. He hunts with such stealth, they say he's like a thin, white mist on the earth. He " ..
                "kills so fast his prey have no time for fear or pain.\n\nThe tauren say he is both mercy " ..
                "and death.\n\n<name>, I now set you on the path to hunt Echeyakee. His lair is just " ..
                "northwest of here, on the north side of a small mountain, among the bones of giant " ..
                "Kodo.\n\nGo. Blow this horn when you reach his lair. Blow the horn, and he will come.",
        },
        [895] = {
            description = "WANTED!\n\n\"Cap'n\" J. Garvey of the Maiden's Dagger\n\nCharged with piracy " ..
                "on the open seas, kidnapping, extortion, arson, slavery, et al. Garvey recently arrived " ..
                "in these waters leading a crew of Southsea Freebooters and was last seen assaulting Fray " ..
                "Island. Bring proof of death in an identifiable condition!\n\n-- Gazlowe",
            rewardChoices = {{49446, 1}, {49543, 1}, {49548, 1}, {49560, 1}},
            rewardMoney = 800,
        },
        [3091] = {
            description = "Just a moment ago a messenger was looking for you, <name>. I believe she was " ..
                "sent by the warrior trainer Harutt. If this note is from Harutt, I wouldn't take long in " ..
                "reading it's contents.",
        },
        [3110] = {
            description = "<name>, this rune was given to me to pass on to ye. Take some time to read it " ..
                "when ye have a chance. I'm thinkin' it came from the priest trainer Branstock. Take a " ..
                "gander at it and go find him inside Anvilmar.",
            rewardMoney = 25,
        },
        [3117] = {
            description = "This sigil was given to me by a messenger from our hunter trainer, Ayanna. It " ..
                "seems Ayanna would have words with you when you have a moment. Read it and bring it to " ..
                "her afterwards.",
            rewardMoney = 25,
        },
        [6341] = {
            description = "Everyone in Dolanaar is so proud of Sister Aquinne. I'm certain she'll be " ..
                "pleased to receive this thoughtful gift from Nyoma.\n\nWhen you're ready to travel to " ..
                "Darnassus, just speak to me again and for a few coins, you can hire a hippogryph to take " ..
                "you there. I'm told Sister Aquinne enjoys the solitude of a small plaza just south of " ..
                "the hippogryph master in Darnassus. Look for her there after you arrive.",
        },
        [6482] = {
            description = "Eh? Who are you?\n\n<name>? You're no furbolg. They are cursed! They thought I " ..
                "was a bear and captured me, and now they starve me! My strength is failing...\n\nHelp me " ..
                "escape, then speak with my sister Yama at the Splintertree Post to the east.\n\n<name>! " ..
                "I must escape!",
            rewardMoney = 1700,
        },
        [7383] = {
            description = "You must now visit the moonwell that rests under the boughs of the Oracle " ..
                "Tree, far to the northwest. The first and most powerful of our wells, its waters are " ..
                "said to possess the very essence of Elune's Powers.\n\nRetrieve a phial of its water and " ..
                "return to me. I will meet you at the crossroads in front of Darnassus when your task is " ..
                "complete.",
        },
        [7491] = {
            description = "Overlord Runthak awaits your arrival in the Valley of Strength.\n\n<The " ..
                "Warchief salutes you.>\n\nDo not keep your public waiting, hero.",
            rewardChoices = {{18406, 1}, {18403, 1}, {18404, 1}},
        },
        [7810] = {
            description = "There must be more to being a master of the arena than this! Perhaps the " ..
                "Pirate who runs the event at Gurubashi will know!",
        },
        [8114] = {
            description = "<name>, you have taken the battle of Arathi Basin to our enemies and earned " ..
                "great honors in that field of battle. You have shown us your worth as a <class>, and you " ..
                "have shown our enemies that we will not submit to their villainy!\n\nBecause of your " ..
                "proven value to us, I have a difficult task for you. I want you to take and hold at " ..
                "least four of the bases in Arathi Basin. If you can do that, then we will not only " ..
                "secure critical resources, we will show the Horde our dominance!\n\nGo, <name>, and good " ..
                "fortune.",
            rewardMoney = 27000,
        },
        [8166] = {
            description = "<name>, the battle for Arathi Basin is a battle for resources and territory. " ..
                "Key points in the area must be held and operated in order to supply our forces with much " ..
                "needed raw materials and supplies. I charge you to assault the points farthest from our " ..
                "Arathi Basin base.\n\nAssault the farm, the mine, the lumber mill and the blacksmith " ..
                "when they are controlled by the enemy. Find the enemy's banner and rip it from its flag " ..
                "post!\n\nWhen you have done this to all four points, return to me.",
            rewardMoney = 13000,
        },
        [8169] = {
            description = "As you no doubt have heard, the League of Arathor is sending large numbers of " ..
                "troops into Arathi Basin. Eager for food and supplies, these Alliance fools are intent " ..
                "to take and control the rich resources there. We must show them that Arathi will never " ..
                "again be a home for humans!\n\nGo to Arathi Basin and assault the mine, the lumber mill, " ..
                "the blacksmith and the stables. Pull down the enemies' banners, declaring those " ..
                "territories for the Horde.\n\nGo, <name>. Report back to me when this task is complete.",
            rewardMoney = 13000,
        },
        [8264] = {rewardItems = {{20230, 1}}},
        [8310] = {
            description = "I think I can formulate an elixir that will allow us to more readily decipher " ..
                "the glyphs and language of the silithid and Qiraji!\n\nWhat do I need? Glad you asked! I " ..
                "need brains!\n\nNormally I'd need a brain from each silithid type that inhabit the " ..
                "hives. Another brave explorer brought me two of 'em here... and never came back from " ..
                "Hive'Regal.\n\nBring me back a silithid brain from Hive'Regal... and be careful not to " ..
                "end up like him!",
            rewardMoney = 17000,
        },
        [8335] = {
            description = "A betrayer of our people resides atop Falthrien Academy to the " ..
                "southwest.\n\nFelendren is his name, and he was banished from blood elf lands for " ..
                "failing to heed the warnings of our teachers and elders. He is the worst of our society, " ..
                "as he lives only to feed his insatiable magical addictions. He refused to learn control; " ..
                "he is a shell of his former self - one of the Wretched - and he is a threat to the " ..
                "Sunspire.\n\nDestroy him and the wraiths he uses as minions.",
            rewardChoices = {{20838, 1}, {20841, 1}},
            rewardMoney = 200,
        },
        [8346] = {
            description = "If there is only one lesson you deign to remember from your time on Sunstrider " ..
                "Isle, let it be this - control your thirst for magic. It is a thirst unending, <name> - " ..
                "what you absorb must be controlled and released via Arcane Torrent. Failure is to become " ..
                "one of the Wretched... hopelessly addicted and insane.\n\nSeek out a mana wyrm and " ..
                "unleash your Arcane Torrent upon it. Learn to master your power. When you have " ..
                "sufficiently released an Arcane Torrent, return to me.",
            rewardChoices = {{20999, 1}, {21000, 1}, {21001, 1}},
        },
        [8463] = {
            description = "A group of Wretched recently raided a supply of unstable mana crystals from " ..
                "one of our arcane sanctums. If not handled properly, the crystals could explode with " ..
                "enough force to blow a hole into the city walls.\n\nNow, <name>, I don't quite care if " ..
                "they blow themselves up while tapping unstable arcane sources, but the whole incident " ..
                "would make my men look bad.\n\nBring me back any remaining stolen crystals you find; " ..
                "they might still be inside their original crates.",
            rewardMoney = 100,
        },
        [8490] = {
            description = "Ancient runestones once powered a protective barrier across the Eversong " ..
                "border. Many were destroyed during Arthas' attack; others were stolen.\n\nOf the three " ..
                "that remain, only this one has retained its powers. The runestone to the east might be " ..
                "salvageable, though.\n\nTake this crystal and instill its energy on the Eastern " ..
                "Runestone. The process should take but a minute. Beware though, nearby Scourge will be " ..
                "drawn to it and will seek to destroy it. Do not let them!",
            rewardMoney = 350,
        },
        [8886] = {
            description = "Thank goodness for you, <class>! Those slimy Grimscale murlocs have pirated " ..
                "away my cargo! It's bad enough that the Wretched have stolen what little magical goods I " ..
                "had, but the murlocs took the rest! What has this land come to?\n\nCould you retrieve my " ..
                "cargo? I can't expect that you'd be able to get all of it back, but I'll be grateful for " ..
                "any of it at this point. It was the Grimscale murlocs in the huts, just to the west and " ..
                "south of the anchorage on the Golden Strand, I'm sure of it!",
            rewardMoney = 225,
        },
        [9170] = {
            description = "The odious traitor, Dar'Khan, has risen to great power among the ranks of the " ..
                "Scourge. His lieutenants command vast armies of undead against our dwindling " ..
                "numbers.\n\nMasophet the Black, Jurion the Deceiver, Borgoth the Bloodletter, Mirdoran " ..
                "the Fallen. Learn these names well for in the Ghostlands these Scourge leaders are " ..
                "second only to Dar'Khan himself. Slay them and their mindless armies will be thrown into " ..
                "disarray.",
            rewardChoices = {{22996, 1}, {22997, 1}, {22998, 1}},
            rewardMoney = 2500,
        },
        [9283] = {
            description = "The healing crystals are replenished, but that is not the only way we can help " ..
                "the injured. All draenei can tap the gift of the Naaru to heal. You must use this " ..
                "ability to heal one of the crash survivors.\n\nYou'll find most of the survivors in the " ..
                "areas to the west and northwest, but the crash scattered us all over the vale.\n\nThe " ..
                "survivors have suffered from exposure to the irradiated power crystals, so you should be " ..
                "able to find them by the red glow that surround them.\n\nYou must save them, <name>.",
            rewardItems = {{23389, 1}},
            rewardMoney = 65,
        },
        [9327] = {
            description = "I know it seems strange, but these Forsaken are here to help. You should speak " ..
                "with their leader, High Executor Mavren. He's in the tower on the west side of " ..
                "town.\n\nAnd, <class>, when you're done talking with him return to me; I have something " ..
                "dire that needs to be dealt with immediately!",
        },
        [9454] = {
            description = "You're starting to make a name for yourself, <name>. How about trying your " ..
                "hand at hunting?\n\nBack on Draenor, our greatest hunters would hunt a beast that " ..
                "resembled the moongraze stag of this region known as a talbuk.\n\nIf you think yourself " ..
                "draenei enough, go out into the wilds and kill enough stags to fill your pack with " ..
                "meat.\n\nYou will find them grazing south of Azure Watch. Watch out for their horns!",
            rewardItems = {{24105, 5}, {27686, 1}},
            rewardMoney = 100,
        },
        [9455] = {
            description = "The crystal you found on the nightstalker runt's body appears to be a piece of " ..
                "the Exodar. This may help explain the unusual appearance and demeanor of some of the " ..
                "animals in this region.\n\nTake the crystal back to Azure Watch. The exarch will surely " ..
                "want to know about this discovery.",
        },
        [9457] = {
            description = "So this Naias is the mastermind behind the Bloodscalp and their exotic magic? " ..
                "I'll admit, this is the last place I expected my inquiry to lead, but no matter, our " ..
                "findings may still prove useful.\n\nOff the coast to the northwest is an island " ..
                "inhabited by lesser water elementals. There's a crude stone slab there that might serve " ..
                "as an altar for the likes of the trolls. Take the totem you found to that altar. Let's " ..
                "see if we can draw this Naias out and distill his power into a more agreeable form.",
            rewardChoices = {{61091, 1}, {61092, 1}, {61093, 1}},
            rewardMoney = 4000,
        },
        [9542] = {
            description = "You no longer see unrecognizable symbology in the totems. The totem of Yor " ..
                "reads to you just as easily as your native tongue.\n\nThe markings identify another " ..
                "furbolg den, due west of here. You are able to expertly decipher the language on the " ..
                "totem and know that your destination is Bristlelimb Village. Yor will guide you but if " ..
                "you get lost, you know that you are able to take the ancient elven road in the forest " ..
                "leading west to reach your destination.",
        },
        [9560] = {
            description = "My brother and I were hunting in the woods to the east when we were ambushed " ..
                "by strange, insect-like beasts. Such aberrations have never before been seen in " ..
                "Azuremyst! Could they be a sign of the coming apocalypse? The apocalypse that YOU are " ..
                "destined to prevent?\n\nIf you truly are the Promised One, you will strike the creatures " ..
                "of the apocalypse down... and bring me their hides. From their hides, I can fashion " ..
                "armor of great power!\n\nFind them to the east, beyond the road.",
            rewardChoices = {{24107, 1}, {24108, 1}, {24109, 1}},
        },
        [9561] = {
            description = "The translation is ready now, <name>.\n\n< Anchorite Paetheus points out a " ..
                "block of text at the end of his translation.>\n\n'The enemy is nearly upon us. We've " ..
                "gathered up all the survivors and retreated to the temple to the east. It's the last " ..
                "ground we truly hold on the island, and there is a sense among the survivors that we " ..
                "will make our last stand here. I've taken care to bury my last few possessions on the " ..
                "grounds of the temple, with the hope that someone will find them and know what happened " ..
                "here.'",
            rewardItems = {{23846, 1}},
        },
        [9635] = {
            description = "The swamp gas is truly amazing, and can be very useful, mon! But first, you " ..
                "gotta be able to suck it up, and that, my friend, requires a Zapthrottle Mote " ..
                "Extractor.\n\nNow, I could just give you the schematics, but I'll need something in " ..
                "return first. How about some spare parts? Last time I checked, there were plenty lying " ..
                "around near the broken steam pump at the Dead Mire, far to the northeast.\n\nI heard " ..
                "that the withered giants spread the pieces all over that dried-out lake bed.",
            rewardItems = {{23888, 1}},
        },
        [9639] = {
            description = "Journal, what journal? You're thinking of Kamsis, surely.\n\nGo and ask her " ..
                "about it. I can't leave my project right now or all my work will be wasted!",
        },
        [9701] = {
            description = "We need to learn all that we can of the sporelings at Sporeggar and their " ..
                "relationship to the creatures around them. One way to do that is what I'm doing; passive " ..
                "observation while making a note of their interactions.\n\nI need you to head over to the " ..
                "Spawning Glen to the west. Investigate the whole area and then return to tell me what " ..
                "you saw.",
            rewardMoney = 29000,
        },
        [9728] = {
            description = "While the druids from the expedition have made themselves busy studying plants " ..
                "and researching the lakes, I've made it my business to deal with the hostiles in the " ..
                "area.\n\nEver since we set foot in Zangarmarsh, the naga have launched lethal attacks " ..
                "against us without warning. We've done our best to keep them at bay, but our resources " ..
                "are limited.\n\nI want you to go to the various naga strongholds in Zangarmarsh and show " ..
                "them that we're not to be crossed. Bring me their claws as proof of your victories.",
            rewardItems = {{28100, 5}},
            rewardMoney = 31000,
        },
        [9734] = {
            description = "Return to Ysiel and let her know that help will be extended to her as soon as " ..
                "it is possible.\n\nAffairs in Moonglade and Silithus have kept our members occupied, but " ..
                "we will do our best to send the necessary resources to the Cenarion Refuge.",
            rewardChoices = {{25522, 1}, {25523, 1}, {25524, 1}},
        },
        [9775] = {
            description = "Shadow Hunter Denjai will no doubt expect to receive a report about my " ..
                "progress in establishing our outpost. I've prepared a short summary of what we've " ..
                "accomplished here already, but with the loss of Scout Jyoba, I can't spare a runner to " ..
                "take the report to Denjai's base of Zabra'jin to the west.\n\nIf you're headed that way, " ..
                "would you mind bringing this to him? Shadow Hunter Denjai can be a little intimidating " ..
                "at first, but once you get used to him, he's not so bad.",
        },
        [9800] = {
            description = "You are ill-equipped to face the restless elements of Nagrand. Before you can " ..
                "help the Earthen Ring, you must help yourself.\n\nTo the west you will find dung heaps " ..
                "left behind by the wildlife of Nagrand. You must search the dung for the digested " ..
                "remnants of the Nagrand caracoli. From this bean I am able to make a tablet that will " ..
                "aid you in your battle against the restless forces of nature.\n\nReturn to me when you " ..
                "have collected no less than two fists worth of caracoli... Ogre sized fists.",
            rewardItems = {{24421, 5}},
        },
        [9838] = {
            description = "A great responsibility has been bestowed upon you, <name>. If the signs that " ..
                "the Violet Eye has observed are to be trusted, then you must help them.\n\nFor all my " ..
                "disagreements with Cedric, the work that men like Alturus do is still important. Beware " ..
                "that they do not use you, however. Remember it is you who the key is bound to, not them. " ..
                "But if the danger in Karazhan is real, then it is they who are best prepared to guide " ..
                "you in dealing with it. Go back to Alturus and help him in any way that you can.",
        },
        [9869] = {
            description = "Greetings, <race>. I am Ioki, elementalist of the Earthen Ring. I have come to " ..
                "Telaar to inform the Kurenai of the state of the elements.\n\nCould I ask a favor of " ..
                "you? Would you travel to the Throne of the Elements in the northern hills of Nagrand, " ..
                "beyond Skysong Lake, and tell elementalist Sharvak that I have arrived at Telaar safely? " ..
                "She will surely reward you for this small deed.",
            rewardMoney = 35000,
        },
        [9872] = {
            description = "The parchment holds a crudely painted map of Nagrand. There is a big red 'X' " ..
                "where Garadar would be on the map. It would seem that these savages are planning an " ..
                "attack on the city. Take the Murkblood invasion plans to Garrosh in Garadar.",
        },
        [9917] = {
            description = "Do my eyes deceive me or is there an ogre hunting party over yonder? What " ..
                "could ogres be doing this far from their mound? I don't like this one bit, stranger. " ..
                "First Murkbloods and now ogres. We just don't have the manpower to handle all of these " ..
                "threats to our land.\n\nCould you investigate the ogre presence to the east for us? " ..
                "Their forward camp is about 200 paces east of here. You'll know you're at the right " ..
                "place if you see the Boulderfist hunters. Kill them to find the plans!",
        },
        [9924] = {
            description = "< Arechron sighs.>\n\nThis is so embarrassing. Do you remember my boy, Corki? " ..
                "You rescued him from the Burning Blade Ruins recently. Well, his curiosity has gotten " ..
                "the best of him once more. He told me that he was going to investigate the Boulderfist " ..
                "menace for 'uncle' Mo'mor and ran off to the ogre mounds in the Halaani Basin, north of " ..
                "here.\n\nDo you think you could track him down? I would be eternally grateful.",
            rewardChoices = {{25631, 1}, {25632, 1}, {25633, 1}},
        },
        [9936] = {
            description = "Wanted: Dead or Alive\n\nGiselda the Crone of Kil'sorrow and her lackeys for " ..
                "murder, ritual sacrifice, communing with the Legion, kidnapping, and burglary.\n\nKnown " ..
                "to congregate at Kil'sorrow Fortress in southeastern Nagrand, near the border of " ..
                "Terokkar.\n\nLarge gold reward to be dispensed by Warden Moi'bff Jill at Telaar to " ..
                "anyone able to bring Giselda to justice.",
            rewardMoney = 105000,
        },
        [9951] = {
            description = "Quick, hide! The eyes of Naphthal'ar are upon you... upon us all!\n\nI dare " ..
                "not go to the top of the tower to speak with it, but you... you look as if you might " ..
                "know the right words to say. Just be careful, it doesn't like jokes and will not suffer " ..
                "fools easily.\n\nIf you can, convince it to come down for tea. But, by all means, get it " ..
                "to stop staring at me!",
            rewardChoices = {{28026, 1}, {28028, 1}, {31723, 1}, {25542, 1}, {28027, 1}},
        },
        [9986] = {
            description = "We need to show the arakkoa that they cannot attack our people with impunity. " ..
                "If we don't stop them here, the roads will no longer be safe for our merchants, " ..
                "couriers, or soldiers.\n\nMy scouts have identified the leaders of each of the major " ..
                "arakkoa settlements in the area. Seek out Ashkaz, Ayit, and Urdak, in Veil Reskk, Veil " ..
                "Shienor, and Veil Skith and kill them.",
            rewardChoices = {{22829, 5}, {22832, 5}},
            rewardMoney = 31000,
        },
        [9994] = {
            description = "I don't know about you, but I have no idea what all of those things are. I do " ..
                "know one thing though - they look dangerous!\n\n<name>, I think you should take this box " ..
                "of parts to Jenai Starwhisper at the Allerian Stronghold to the southeast. She may have " ..
                "some idea of what these are.",
            rewardMoney = 16000,
        },
        [10007] = {
            description = "Knowing Thander and Bertelm, they won't tolerate such a large buildup of " ..
                "hostile forces on our doorstep. Asking them to dispatch members of the garrison to " ..
                "participate in an attack on the camp isn't an option either. It would just leave us too " ..
                "vulnerable to attack.\n\nIt falls to us to do what we can to diminish the threat the fel " ..
                "orc buildup poses. Kill what you can of their forces and I will look for ways to stall " ..
                "any reinforcements.",
            rewardChoices = {{25971, 1}, {25972, 1}, {25973, 1}},
            rewardMoney = 31000,
        },
        [10010] = {
            description = "< Sal'salabim points to the blueprint.>\n\nYou see where fel cannons are?\n\n< " ..
                "Sal'salabim draws an arrow denoting a change of direction.>\n\nYou turn fel cannon " ..
                "around and use on structures.\n\nWait! Don't be mad! One thing you not know. Overseers " ..
                "have key to turn cannons. You need key first! One from each overseer!\n\nNot so easy, " ..
                "eh?\n\nTake information back to Altruis.",
        },
        [10016] = {
            description = "Have you come across the timber worgs in your travels? I've had the " ..
                "opportunity to observe them while mapping some of the northern reaches of the forest. I " ..
                "wouldn't recommend getting close to them unless you're prepared for combat.\n\nThey have " ..
                "no fear of us and won't hesitate to defend their territory.\n\nIt's fitting that such a " ..
                "creature would have a magnificent tail. I've been trying to collect enough of them to " ..
                "trim a new cloak, but the worgs have a habit of evading my snares. Will you help?",
            rewardMoney = 31000,
        },
        [10022] = {
            description = "Now that I have the fur I'll need for the trim, I've been thinking that the " ..
                "pelt of a particular wolf would make a good hood for my cloak. Imagine seeing your enemy " ..
                "clad in the pelt of the most cunning predator in the forest!\n\nI've tried trapping old " ..
                "Ironjaw without success. I've tried cornering him, outsmarting him, and baiting him. " ..
                "None of it has worked.\n\nHe stalks the northeastern reaches of the forest, and I'd " ..
                "gladly reward you if you could succeed where I have failed.",
            rewardChoices = {{25974, 1}, {25975, 1}, {25976, 1}, {25977, 1}},
            rewardMoney = 31000,
        },
        [10023] = {
            description = "You've done well in gathering the first pelts.\n\nThe final piece of the " ..
                "vestments requires a pelt unlike any other. There is one particular wolf, an old and " ..
                "cunning one, that has earned his place as the patriarch of the forest wolves. He is " ..
                "known among them as Ironjaw, the mighty hunter.\n\nIn my visions, I have seen him " ..
                "wandering the northeastern region of the forest. Including his pelt in the vestments " ..
                "will surely light the wolf spirit's path.\n\nDo not mourn Ironjaw. He will be well " ..
                "honored.",
            rewardMoney = 31000,
        },
        [10026] = {
            description = "It's embarrassing to admit this, but something has happened to me here in " ..
                "Terokkar Forest that hasn't occurred since my apprentice days.\n\nOccasionally, my " ..
                "spells will fizzle when I know I've done everything correctly. I almost drove myself " ..
                "crazy the first time it happened.\n\nI think I've found the cause. The forest is full of " ..
                "creatures called warp stalkers, demonic creatures with an affinity for magic and a habit " ..
                "of disturbing magical flows. The best way to deal with them is simply to kill them.",
            rewardMoney = 31000,
        },
        [10037] = {
            description = "Speaking of lakes, there's a lake with real good fishin' up to the northeast. " ..
                "I used to go up there with my friends, but my mom won't let me go anymore.\n\nShe says " ..
                "it's too dangerous, but I haven't seen anything up there but a few little spiders. Like " ..
                "spiders can do anything to you...\n\nMy favorites were always the eels that live up " ..
                "there. If you're going to be up by the lake, would you think about bringing back some of " ..
                "the eels? They're feisty but once you subdue 'em, you can bring 'em back no problem.",
            rewardItems = {{25978, 1}},
        },
        [10041] = {
            description = "I don't know who they are, but I know they're hostile!\n\nI'm going to give " ..
                "you a disguise, and I want you to go in there and speak with three of them that I've " ..
                "observed as being 'chatty'. Talk with the initiate, the laborer, and the " ..
                "advisor.\n\nJust watch out; there're a few hunters in there who'll be able to see " ..
                "through your disguise and they look tough! And whatever you do, don't leave the village " ..
                "-- the disguise is kind of flimsy. If you lose your disguise, come back to me and I'll " ..
                "give you another.",
            rewardMoney = 33000,
        },
        [10044] = {
            description = "The Greatmother has asked that I seek you out and deliver a message. She " ..
                "wishes to speak with you at once.\n\nMy will has been sapped but make no mistake, " ..
                "<name>, if you anger the Greatmother, I will come down upon you with all the force that " ..
                "I can muster. She is in the main hall.\n\n< Garrosh points at the large building to the " ..
                "north.>\n\nListen to what she has to say and do as she tells you.",
        },
        [10069] = {
            description = "It is time for your first lesson in the ways of the Light, <name>. As you " ..
                "fight more battles, it will bring you closer to the light, and you'll start to uncover " ..
                "new abilities.\n\nGo, get more experience, and learn a new ability. Return and " ..
                "demonstrate it for me, and we'll continue your training.",
        },
        [10071] = {
            description = "As you grow in power, you'll start to figure out the tricks of the " ..
                "trade.\n\nOne of the first things you'll probably figure out is how to Eviscerate your " ..
                "enemy after landing some initial attacks.\n\nGet some experience, learn how to do it, " ..
                "and then find one of the training dummies outside and give it a try.",
        },
        [10075] = {rewardItems = {{26044, 1}}, rewardMoney = 29000},
        [10085] = {
            description = "I need for you to journey to the villages of the ancestors, <name>. Seek each " ..
                "one out and see if the ancestors remain.\n\nVisit Sunspring Post to the north, visit the " ..
                "Laughing Skull Ruins far to the north against the mountains, visit Garadar to the " ..
                "northeast, and finally, visit the Bleeding Hollow Ruins on the borders of Nagrand and " ..
                "the Terokkar Forest, to the east.\n\nReturn to me once you have observed the ancestors " ..
                "in their homes.",
        },
        [10093] = {
            description = "Fortunately, the Path of Glory is not the only trace of my people in these " ..
                "lands. To the west, a few of our holy sites survive, although some have been " ..
                "overrun.\n\nWhile Velen prepared for the journey that would lead him to Azeroth, those " ..
                "of us who would remain behind sought to reestablish a presence at our holy places.\n\nIn " ..
                "the western part of the Hellfire Peninsula, you will find a small group of draenei at " ..
                "the Temple of Telhamat, led by Amaan the Wise. I am certain he'd be interested in " ..
                "meeting you.",
        },
        [10123] = {
            description = "Doom Lord Kazzak commands the Burning Legion in Outland. While we can't get to " ..
                "Kazzak - yet - we can and must get to his lieutenants that command Legion troops from " ..
                "the ground.\n\nThey have stationed dreadlords in Felspark Ravine, east of here. They are " ..
                "responsible for these infernal storms that rain down upon our heads. To take them and " ..
                "their minions out would be a great set back to the Burning Legion.",
            rewardChoices = {{29908, 1}, {29909, 1}, {29910, 1}, {29911, 1}, {29913, 1}},
        },
        [10141] = {
            description = "While the Burning Legion invaded Azeroth, they were also at work here, in " ..
                "Outland. We have tracked their movements over the years, but this latest activity, " ..
                "<class> - well, this is beyond anything we've seen.\n\nSeek out Sergeant Altumus near " ..
                "the eastern supply caravan. She has been monitoring the invaders and may have insights " ..
                "into their purpose.\n\nBe swift - and take care, <name> - the Burning Legion is not to " ..
                "be underestimated.",
        },
        [10198] = {
            description = "I've prepared a uniform with the pieces you obtained. It is magically enhanced " ..
                "to complete the illusion.\n\nWe spotted Commander Dawnforge going in to meet Arcanist " ..
                "Ardonis a few minutes ago. He had a full retinue of guards with him, so whatever they're " ..
                "discussing is bound to be incredibly important; see if you can catch any of it.\n\nOh, I " ..
                "almost forgot. You'll want to stay away from the arcane golems patrolling the manaforge. " ..
                "They will see right through the illusion.",
            rewardChoices = {{30383, 1}, {30384, 1}, {30386, 1}, {30397, 1}},
        },
        [10227] = {
            description = "I see dead draenei. They're all around us.\n\nBah, nobody believes me because " ..
                "I'm a child. Not even my own mommy believes me.\n\n< Ha'lei points to Ramdor.>\n\nHe " ..
                "believes me, though... He sees them too. Boy does he get angry about it!\n\nIt's kind of " ..
                "funny. I see ghosts and people just smile and pat me on the head, trying to placate me. " ..
                "Ramdor sees ghosts and people label him as crazy. I sure hope I never grow up!\n\nYou " ..
                "should probably talk to Ramdor before you go inside. He was once a death priest.",
        },
        [10231] = {
            description = "Ramdor? Hrm, let me think... Ramdor... Oh yes, the death priest. What does he " ..
                "want with the book? Well it doesn't matter. Yes I lied to you and no I don't have the " ..
                "book. Not anymore, anyway. It was stolen. Probably by one of those filthy " ..
                "refugees.\n\nBesides, Auchindoun is now defunct. We have no use for the book. If you " ..
                "find it, you can keep it.\n\nLike I said, I saw some of those ruffians snooping around " ..
                "the terrace last week. Start your search with them. They're probably playing dice in the " ..
                "slums.",
        },
        [10236] = {
            description = "I can't believe I left Booty Bay to come to Outland. My cousin Screed Luckheed " ..
                "promised me I would make a fortune, but instead he flew off in his zeppelin and left me " ..
                "here to try to scrape a living out of this mine.\n\nHow am I suppose to make a living " ..
                "here with helboars and demons and fel orcs attacking all the time? My shredder here was " ..
                "broken yesterday and the parts I need to fix it were stolen by fel orcs. They took the " ..
                "parts into the fissure to the southwest and may have dropped them there.",
            rewardItems = {{23424, 5}},
            rewardMoney = 20000,
        },
        [10238] = {
            description = "Why would fel orcs steal my shredder parts? I hate them so much. They just " ..
                "sneak into my camp here and take things all the time. A couple of days ago they stole " ..
                "three of my peons! Now the rest of my peons have run off because they are afraid they " ..
                "are going to be eaten by fel orcs.\n\nI can't run a mine without peons. If you could " ..
                "save the peons that I lost maybe the others would come back. The fel orcs have their " ..
                "camps along the wall to the southwest.",
            rewardItems = {{30858, 5}},
            rewardMoney = 20000,
        },
        [10248] = {
            description = "Doctor Vomisa, Ph.T. at your service. Here, take this controller. I want you " ..
                "to activate it and give my newly-invented Scrap Reaver X6000 a spin.\n\nJust stay " ..
                "nearby! The controller is tied to my console here, and if you get too far away, the " ..
                "robot will cease to function.\n\nTry out everything... I'll be watching and calibrating " ..
                "its servos based upon your test run.",
            rewardMoney = 41000,
        },
        [10252] = {
            description = "It has already begun. Levixus stands atop the ruins of Auchindoun and reads " ..
                "from the book of the dead. He calls the dead out by name and, through demonic ritual, " ..
                "binds the tortured souls to his will. He will raise all of Auchindoun if given the " ..
                "chance!\n\nBut... you must first prepare. You cannot do battle with that which you " ..
                "cannot see.\n\n<Nitrin hands you a parchment.>\n\nBring me the items I require to brew " ..
                "the tincture. It will open your mind and allow you to see into the spirit world.",
        },
        [10264] = {
            description = "The naaru of Shattrath City have been trying to find a means to bring the " ..
                "Consortium over to their way of seeing things.\n\nLuck would have it that the business " ..
                "relationship between the ethereals and the blood elves of the Netherstorm has recently " ..
                "soured.\n\nThere's a Consortium representative in town named Nether-Stalker Khay'ji who " ..
                "recently ran into trouble with a pack of renegade ethereals. As a representative of the " ..
                "Scryers, I would like for you to help him in any way that you can.",
        },
        [10267] = {
            description = "Our business relations with the blood elves appear to be at an end. A few " ..
                "weeks ago a large shipment of surveying equipment was delivered to them at Manaforge " ..
                "Duro. They have refused to pay for it.\n\n<name>, I would ask that you pay the blood " ..
                "elves of Manaforge Duro to the east a visit. They appear to be having some trouble with " ..
                "an infestation of mana creatures there, so take advantage of their preoccupation.\n\nI " ..
                "care not what happens to them, but I would very much like to see the return of our " ..
                "property.",
            rewardChoices = {{30271, 1}, {30272, 1}, {30273, 1}},
            rewardMoney = 41000,
        },
        [10303] = {
            description = "You must eliminate... the blood elf... threat. Find out... what they're... up " ..
                "to!\n\nThey're on the... ridge behind me.",
            rewardChoices = {{24133, 1}, {24134, 1}, {24135, 1}},
        },
        [10343] = {
            description = "Kael'thas's assault on Kirin'Var began with thundering noise and a bright " ..
                "flash of light in the officer quarters to the northwest. The destruction there was the " ..
                "most severe and after the withdrawal of the blood elves, a strange thing began to " ..
                "happen.\n\nBeings of pure mana began streaming into the village from all over the area. " ..
                "For now, we're containing them as we can, but with more information about the weapon " ..
                "Kael'thas used, I hope to cut off the flow of mana creatures entirely.",
        },
        [10350] = {
            description = "While you have learned many hard lessons from me during our time together, it " ..
                "is time that I entrusted you to wiser hands.\n\nBehomat, who trained me when I was as " ..
                "green as grass, will be your new teacher. I have told him that you will be seeking him " ..
                "out, and he is expecting you.\n\nYou will find him at the center of the Warriors' " ..
                "Terrace, at the highest point of the Traders Tier of the Exodar.",
            rewardChoices = {{23423, 1}, {23429, 1}, {23430, 1}, {23431, 1}},
        },
        [10388] = {
            description = "Hope you enjoyed your flight, friend. A messenger arrived while you were away " ..
                "- seems Nazgrel 's got a new use for you. You'd best head back to Thrallmar and check in " ..
                "with him. I have a feeling the Legion's just getting warmed up.",
        },
        [10389] = {
            description = "Greetings, <name>. I've deciphered the Legion missive and uncovered the " ..
                "demons' strategic plans for this Peninsula. Apparently, there is a large group of " ..
                "hellish terrorfiends gathering near the Pools of Aggonar in the west. We cannot allow " ..
                "such a force to go unchallenged. You must go there and decimate their cursed numbers.",
            rewardMoney = 20000,
        },
        [10396] = {
            description = "Now we focus on the second target - Forge Camp: Rage. It lies just west of " ..
                "Mageddon. Trouble is, the demons have a number of fel cannons aimed straight at the " ..
                "Horde's outpost of Thrallmar! Though I can scarcely believe it, we actually need the " ..
                "Horde to help us hold the line at the Dark Portal. We can't afford to let Thrallmar " ..
                "fall. You've got to destroy these cannons before the Legion pulverizes our allies!",
            rewardMoney = 20000,
        },
        [10412] = {
            description = "It is no secret that Kael'thas Sunstrider perceives us as a great threat. " ..
                "Let's face it - not many sin'dorei, fresh from Silvermoon, are willing to join the sort " ..
                "of company that Kael keeps.\n\nIt's also no secret that this is not just a war of words. " ..
                "Scryers and the armies that serve Kael'thas attack each other on sight. The only way to " ..
                "prove you're with us, <name>, is to do your share of fighting.\n\nKael's lower ranking " ..
                "followers wear Firewing signets to indicate their rank. Bring them to me.",
        },
        [10433] = {
            description = "The ethereals are clever and very observant, so it's no accident that I'm here " ..
                "posing as a simple furrier. In fact, I've been sent from Area 52 to appraise the " ..
                "technology the ethereals use to generate their eco-domes.\n\nI'd like to enlist your " ..
                "help, <class>. We've been asked to use non-goblin agents whenever possible.\n\nWhat I " ..
                "want you to do is bring me a number of ripfang lynx pelts in the guise of a hunter. You " ..
                "can find the lynxes all over Eco-Dome Midrealm.",
            rewardMoney = 41000,
        },
        [10466] = {
            description = "You've made your pledge, <class>. Now it is up to you to see it " ..
                "through.\n\nServe the Scale of the Sands well and you will be rewarded. Fail and the " ..
                "timeline as we know it will be unravelled!",
            rewardItems = {{29299, 1}},
        },
        [10479] = {
            description = "Though we seek a peaceful life, our enemies are many. Of these, none match the " ..
                "ogres in sheer brute power.\n\nIf you seek to prove your prowess to us, bring me the " ..
                "warbeads they wear around their necks. I will tell others of your accomplishments.",
        },
        [10486] = {
            description = "The Thunderlord were once a proud orc clan before they were transformed into " ..
                "fel orcs through the blood of Mannoroth.\n\nRecently we recovered this orc stronghold " ..
                "from the ogres that infest the ravine below. They had moved in when the Thunderlord clan " ..
                "abandoned it.\n\nWe will keep this place and I will have your help doing so.\n\nIn the " ..
                "Jagged Ridge to the south and the west, there are bloodletters that have become like a " ..
                "plague upon us. They eat and breed incessantly.\n\nKill them and then return to me.",
            rewardMoney = 35000,
        },
        [10487] = {
            description = "The Alliance has recently moved in to the west, using their elven magics to " ..
                "grow a town and grove in a short matter of time. We must keep their defenses weak so " ..
                "that they do not also grow a spine.\n\nI have a plan that will do that and more. I want " ..
                "you to traverse the bridge to the southwest, which crosses over Bloodmaul Ravine and " ..
                "leads into the Living Grove.\n\nAttack their fey drake defenses in the Living Grove and " ..
                "bring back the magical dust that sometimes can be found upon their wings.",
            rewardMoney = 35000,
        },
        [10505] = {
            description = "To the south of the Bladespire clan lies yet another threat: Bloodmaul " ..
                "Outpost.\n\nWhile the Bloodmaul ogres are not the strongest clan in the mountains, not " ..
                "having the favor of the gronn known as Gruul the Dragonkiller, they run a close " ..
                "second.\n\nNow that we've dealt with winnowing the Bladespire, it is time to turn our " ..
                "eye upon their rivals.\n\nFrom Bladespire Hold head south through the ravine until you " ..
                "come to Bloodmaul Outpost. Slay as many of the Bloodmaul ogres in the vicinity as you " ..
                "can.",
            rewardChoices = {{31477, 1}, {31478, 1}, {31479, 1}, {31480, 1}},
            rewardMoney = 35000,
        },
        [10512] = {
            description = "I'll not take another sip of that ill-smelling muck! But it does give me an " ..
                "idea.\n\n<Borgrim gets a twinkle in his eye.>\n\nSo here's the plan. We know that the " ..
                "Bloodmaul practically live off of this swill. But I wonder what their enemies, the " ..
                "Bladespire ogres, think of it?\n\n<name>, I want you to take the rest of this rubbish " ..
                "and see if you can get the Bladespire ogres tanked. You can find them by heading north " ..
                "from Bloodmaul Outpost through the ravine.",
            rewardMoney = 35000,
        },
        [10515] = {
            description = "We need to show those flayers what happens when you mess with Oronok's " ..
                "business!\n\nI want you to go back to the Shattered Plains and destroy every flayer egg " ..
                "that you see. They'll be deep in flayer territory so keep your guard up.",
        },
        [10516] = {
            description = "I know it's strange, but I do want to stay in this cage. It gives me the " ..
                "perfect opportunity to do what I came here for; to gather information on the " ..
                "Bladespire.\n\nI can leave at any time, but I would like to have my sword and shield " ..
                "back.\n\nTwo of their leaders have my trappings. Droggam has my sword and Mugdorg has my " ..
                "shield.\n\nIf you have need, obtain and use the brew from Bloodmaul Outpost to the south " ..
                "to thin out their help and entice those two, but beware their sober guards who don't " ..
                "drink!",
            rewardMoney = 35000,
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
            rewardChoices = {{30923, 1}, {30945, 1}, {30956, 1}, {30981, 1}},
        },
        [10542] = {
            description = "T'chali used to be a pretty friendly troll. Me come down here to teach the " ..
                "Bloodmaul how to brew their beer. But once me do that, the Bloodmaul bury T'chali and " ..
                "leave him here to rot!\n\nThe worst part of it was that they stole me hookah!\n\nSo, you " ..
                "want to help T'chali? You bring me hookah back. T'chali think the ogres that stole it " ..
                "headed southwest over by the mine.\n\nAnd while you're in there, pick up some brews, too!",
            rewardMoney = 35000,
        },
        [10562] = {
            description = "Don't let your guard down, <race>. We're under constant assault from the " ..
                "Burning Legion.\n\nFrom their base of Legion Hold to the northwest, the demons rain down " ..
                "a ceaseless stream of infernals. As quickly as we can kill them, the new meteors impact " ..
                "and begin a new wave of attacks.\n\nMy men are ragged and exhausted. I don't know how " ..
                "much longer they'll hold out. Please, <name>, lend your help to our defenses. Take your " ..
                "place on the line and halt the advance of the infernals!",
            rewardMoney = 41000,
        },
        [10564] = {
            description = "The device we've assembled won't win any beauty contests, but it should be " ..
                "capable of destroying the infernals amassed at Legion Hold. Judging from what the fel " ..
                "reaver power core's energy did to the Fetid Pool, it holds a respectable amount of " ..
                "explosive power.\n\nIf you set the device off in the middle of the green glyph at the " ..
                "hold, it should be in range to hit all of the infernals.",
            rewardChoices = {{30929, 1}, {30946, 1}, {30947, 1}, {30986, 1}},
            rewardMoney = 41000,
        },
        [10572] = {
            description = "We cannot permit the Legion to carry out its plan to destroy Wildhammer " ..
                "Stronghold on their march to the Black Temple.\n\nThere's only one way to stop them, " ..
                "<name>. You must create an explosive large enough to destroy the Legion's entire " ..
                "stockpile of infernals at the hold.\n\nThe Fetid Pool near Legion Hold holds an old fel " ..
                "reaver power core you could use as the base of your device. Search the other wreckage " ..
                "near the fel reaver for armor plating we might be able to make a casing from.",
            rewardMoney = 41000,
        },
        [10576] = {
            description = "<Borak looks you up and down.>\n\nThis is going to be tricky, but I think I " ..
                "can make it work.\n\nI can disguise you as one of these Illidari blood elves, <name>. " ..
                "What I need first, though, are several pieces of their armor. It is imperative that the " ..
                "armor be clean. No blood stains! We want to avoid suspicion.\n\nBring me the gear and " ..
                "I'll take care of the rest of the disguise.\n\nOnce the disguise is assembled, you're " ..
                "going to deliver the message to the Grand Commander - in person.",
        },
        [10597] = {
            description = "We can't allow the Legion to trample us on their march to Black " ..
                "Temple.\n\nFind a way to destroy the infernals they intend to use against us. That's not " ..
                "a request, <name>; it's an order.\n\nThe Fetid Pool near Legion Hold holds an old fel " ..
                "reaver power core you could use as the basis for a kind of fel bomb. Search the other " ..
                "wreckage near the fel reaver for a section of armor plating. You should be able to make " ..
                "a bomb powerful enough to take out those infernals and give the hold a nice shake!",
            rewardMoney = 41000,
        },
        [10599] = {
            description = "While you were taking care of the infernals at Legion Hold, I've been going " ..
                "over your reports. We've got no reason to believe the Legion lied about what's going on " ..
                "at the Deathforge. They're really cranking out infernals down there, so I've dispatched " ..
                "a scouting party to keep watch over it.\n\nIf we don't shut down the Deathforge, they'll " ..
                "rebuild the infernal stockpile that you destroyed at Legion Hold.\n\nReport to Scout " ..
                "Zagran atop Slag Watch, to the southeast of here and overlooking the Deathforge.",
        },
        [10615] = {
            description = "The information you have helped me reveal about the nature of the arakkoa here " ..
                "will be of great interest to another.\n\nWe were visited by members of the Cenarion " ..
                "Expedition, who have also become concerned with the arakkoa's intentions here in the " ..
                "Blade's Edge Mountains.\n\nYou should seek him out. His name is Timeon, and you will " ..
                "find him at Evergrove in Ruuan Weald. Follow the road west from here, then north when it " ..
                "forks in Razor Ridge. Finally, follow the road west when it splits in the Bladed Gulch.",
        },
        [10622] = {
            description = "Akama has been tracking your progress quite closely, <name>.\n\nThe Ashtongue " ..
                "you've slain at the Ruins of Baa'ri are amongst the most evil Broken known among us... " ..
                "carefully hand-picked by Akama himself to maintain the facade we need to present to " ..
                "Illidan. The Deathsworn, however, know of Akama's true intentions.\n\nFirst things " ..
                "first. We need to know that you are not with Illidan. A Satyr known as Zandras watches " ..
                "over us from above the prison walls on his behalf. Slay him as proof of your allegiance.",
        },
        [10625] = {
            description = "I call them \" Spectrecles.\" Clever, no? When you equip these goggles, you " ..
                "will be able to see the spirits of Shadowmoon Valley.\n\nBefore I let you have them, " ..
                "though, you must promise me that you will help us clear out the ghosts at the " ..
                "village.\n\nTake the goggles and destroy any and all spirits that you see wandering " ..
                "about Shadowmoon Village. Hopefully, destroying these spirits will force any that remain " ..
                "to move elsewhere.",
            rewardMoney = 41000,
        },
        [10639] = {
            description = "With Gorefiend's items restored, there is but one last piece to this puzzle: A " ..
                "host.\n\n<The ancient shadowmoon spirit 's lips curl up to form a wicked " ..
                "grin.>\n\nSurely you did not believe the fairy tale that I told you. The Altar of " ..
                "Shadows is my prison. Without your help, I would have been stuck here for all eternity. " ..
                "Now, I will take over your body and you will destroy my captors and break these bonds. " ..
                "Refuse and we will both be stuck here forever.\n\nTeron Gorefiend will be free!",
            rewardChoices = {{31104, 1}, {31105, 1}, {31106, 1}, {31107, 1}, {31109, 1}, {31110, 1}},
        },
        [10640] = {
            description = "It is rare in this day and age to hear of those who follow the path of the " ..
                "demon hunter. It is rarer still to find someone who does and has no allegiance to " ..
                "Illidan.\n\nThere are rumors of one such individual here in Outland. One name is said to " ..
                "be feared in the Legion fields of Nagrand more than any army of Aldor vindicators. That " ..
                "name is Altruis.\n\nGo to western Nagrand and find him. He might be willing to shed some " ..
                "light on these new demon hunter training grounds.",
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
        [10681] = {
            description = "The elements need your help, <race>! Shadowmoon Valley has been subject to " ..
                "unspeakable evils. The spirits remain tortured to this day. Many are enraged and " ..
                "unwilling to commune with the Earthen Ring.\n\nHelp this world heal, " ..
                "friend.\n\nSoutheast of Shadowmoon Village - in the heart of Shadowmoon Valley - you " ..
                "will find an area known as the Altar of Damnation. Make your way there and speak with " ..
                "Earthmender Torlok.",
        },
        [10685] = {
            description = "According to Akama's letter, four fragments of the medallion were unearthed " ..
                "and given to the Ashtongue Corruptors. These dreaded Broken were once powerful shaman " ..
                "who now defile the very elements they revered.\n\nHaalum, Corruptor of Air, can be found " ..
                "at Netherwing Pass. Eykenen and Uylaru, Corruptors of Earth and Fire, were last seen at " ..
                "the Fel Pits near the Hand of Gul'dan. Lakaan, Corruptor of Water, is rumored to be near " ..
                "Coilskar Point.\n\nFind them and obtain the medallion fragments.",
        },
        [10702] = {
            description = "All Horde forces in this region have been dispatched to handle the attacks " ..
                "from the Burning Legion. This means that we are short-handed for grunt work.\n\nOur " ..
                "supply caravans are in constant danger from the wildlife of the region. We can't veer 15 " ..
                "feet off the road without running into a chimaera, felboar, or abnormally large " ..
                "scorpion.\n\nGet out there and clear Shadowmoon Valley of its sadistic wildlife! Just " ..
                "kill 'em all!",
            rewardMoney = 123000,
        },
        [10704] = {
            description = "A message was embedded in the ata'mal crystal that you recovered. Nexus-Prince " ..
                "Haramad has given us information vital to our campaign against Tempest Keep.\n\nHe tells " ..
                "us that there are two pieces, shards to a key, which, when combined, will unlock the " ..
                "keep's Arcatraz satellite.\n\nOne half is possessed by an ancient in the Botanica known " ..
                "as Warp Splinter. The other is held by Pathaleon the Calculator inside the " ..
                "Mechanar.\n\nBring both shards to me and I will combine them into the Arcatraz key.",
            rewardChoices = {{31460, 1}, {31461, 1}, {31462, 1}, {31464, 1}, {31465, 1}},
            rewardItems = {{31084, 1}},
            rewardMoney = 132000,
        },
        [10710] = {
            description = "I've been fiddling with the Zephyrium Capicitorium and I'm ready to perform " ..
                "another test! Do you want to help?\n\nThis next flight should be short, but " ..
                "fast!\n\nUm... and although I'm sure there's no danger... I have this, uh, waiver that " ..
                "I'd like you to sign. It's just a formality, I assure you!\n\nBest of luck! Talk to " ..
                "Rally to launch yourself, and come back to me after the experiment is over!",
            rewardMoney = 16000,
        },
        [10711] = {
            description = "<name>, I raised the efficiency of the Zephyrium Capacitorium by 30 percent. " ..
                "That will launch a test subject of your weight and wind drag ratio to new heights! Want " ..
                "to test my theory? This experiment ought to send you near Razaan's Landing.\n\nSpeak " ..
                "with Rally... he'll get you prepared for launch.",
            rewardMoney = 24000,
        },
        [10721] = {
            description = "<name>, I have a pet boar named Huffer. He wants to help you to have some fun " ..
                "with one of the nearby sons of Gruul.\n\nGrulloc inhabits a place known as the Cursed " ..
                "Hollow. When you get there, let Huffer loose. The gronn will have a fine time chasing " ..
                "him around, and you will retrieve the bag that he guards and deliver it to Baron " ..
                "Sablemane.\n\nTo get to the Cursed Hollow, head down the northern ramp and east through " ..
                "Dragons' End. The hollow is on the eastern edge.",
            rewardMoney = 37000,
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
        [10791] = {
            description = "I've nearly completed the vestments that I'll wear during the ceremony. As I " ..
                "add the finishing touches, I'd like you to set this incense by the candles near the " ..
                "runestone to my left.\n\nI believe it will help us to attract the wolf spirit's " ..
                "attention, since it was made in the days of the orcish clans. I can almost imagine my " ..
                "ancestors using it in a ceremony paying tribute to the wolf spirit after a successful " ..
                "hunt.\n\nOnce you've placed the incense, I'll begin the ceremony.",
            rewardChoices = {{25974, 1}, {25975, 1}, {25976, 1}, {25977, 1}},
        },
        [10795] = {
            description = "Good, I've seen you around and I've been meaning to speak to you about a " ..
                "matter of some importance.\n\nThere are reports coming in that for some reason the " ..
                "Bloodmaul ogres are planning an offensive against Sylvanaar and Ruuan Weald. We don't " ..
                "know who or what is pushing them to do this, but I intend to nip their plan in the " ..
                "bud!\n\nBloodmaul Camp is where the attacks are to be staged from. Head northwest down " ..
                "the ramp out of the Ruuan Weald and you will find it. I want you to kill their leader, " ..
                "Dorgok!",
            rewardMoney = 37000,
        },
        [10826] = {
            description = "By now it should be clear to you why we oppose the Burning Legion and those " ..
                "who serve them.\n\nIf you wish to prove yourself to the Aldor, bring me the insignias of " ..
                "high-ranking Legion and their Shadow Council followers. Here in Shadowmoon you will find " ..
                "a strong Legion presence to the far west in Legion Hold and the Deathforge.",
        },
        [10853] = {
            description = "The spirits of the nether drakes in the Singing Ridge are in need of " ..
                "liberation.\n\nThe nether drakes were not always nether drakes. They used to be black " ..
                "drakes.\n\nBut then, with the destruction of this world, a wave of nether energy washed " ..
                "over everything and had the side-effect of changing the drakeling eggs.\n\nNow they are " ..
                "all twisted versions of their former selves. We must help them to find peace.\n\nDo this " ..
                "by slaying a drake near to the spirit calling totem, and then take its spirit from it.",
            rewardChoices = {{31711, 1}, {31712, 1}, {31713, 1}, {31714, 1}},
            rewardItems = {{31437, 5}},
            rewardMoney = 37000,
        },
        [10856] = {
            description = "Brave acts of industrial sabotage will only get us so far, <name>. Just as " ..
                "Forge Base: Oblivion serves as an assembly site for Fel Reavers, Forge Base: Gehenna " ..
                "serves as a staging ground for their army as it is where the majority of the Legion's " ..
                "teleportation devices are located.\n\nI want you to go in there and put a dent in their " ..
                "numbers. They must have a full regiment of wrathbringers by now and we just can't allow " ..
                "that.",
        },
        [10889] = {
            description = "Your actions, while brave, will surely rouse a vindictive response from " ..
                "Terokk.\n\nHurry to Shattrath. Send word to Rilak!",
            rewardMoney = 26000,
        },
        [10894] = {
            description = "Hmm, I'm not certain what we should do. I'm not much of a military " ..
                "planner.\n\nWatcher Moonshade will know what to do. He's heading up our defensive " ..
                "efforts at the Wyrmskull Tunnel to the west at the end of Wyrmskull Bridge. We have a " ..
                "force out there just in case the cultists try anything funny.\n\nPlease, take the note " ..
                "to him with all due haste.",
        },
        [10898] = {
            description = "Skywing flutters around you.\n\nYou get the feeling he wants you to follow him.",
            rewardChoices = {{31764, 1}, {31765, 1}, {31766, 1}},
            rewardItems = {{31760, 1}},
            rewardMoney = 66000,
        },
        [10913] = {
            description = "Is there nothing that can be done to stem the tide of corruption? My soldiers " ..
                "have been battling the Auchenai for days now with no end in sight. Each casualty, " ..
                "whether Auchenai or Sha'tar, is snatched from the battlefield - their souls lifted and " ..
                "taken to parts unknown.\n\nI will not have it! A proper burial is out of the question " ..
                "but those fiends will not have their souls! Take this torch and travel to the field of " ..
                "battle, directly east of here. Burn every corpse you see! We will not fuel their rituals.",
        },
        [10915] = {
            description = "They are feeding the souls they steal to a coffin that they have dragged out " ..
                "from the Auchenai Crypts. My scouts believe the contents of the coffin to contain the " ..
                "first exarch of the crypts. They seek to resurrect the ancient one!\n\nYou must battle " ..
                "your way to the western side of Auchindoun and disturb the contents of that coffin " ..
                "before they feed it enough souls. Should you lose your way, follow the walking " ..
                "souls.\n\nDestroy whatever is inside that coffin!",
            rewardChoices = {{31794, 1}, {31796, 1}, {31797, 1}, {31798, 1}},
        },
        [10917] = {
            description = "As an outcast, I am marked for death by arakkoa loyal to the city of Skettis. " ..
                "I cannot leave these walls for fear of my life, but that doesn't mean I cannot strike at " ..
                "them in retaliation.\n\nI have a small cache of treasure that I'm willing to part with, " ..
                "should you help me strike back at my would-be assassins. Bring me feathers from the " ..
                "denizens of the various Veils of Terokkar as proof of their demise.",
            rewardItems = {{31800, 1}},
            rewardMoney = 33000,
        },
        [10923] = {
            description = "Now you must use the Dread Relic in a foul necromantic ritual if you wish to " ..
                "challenge Teribus the Cursed. To the northeast, beyond Auchindoun, is the Writhing " ..
                "Mound, a place where necromancers gather.\n\nThe auchenai death-speakers and doomsayers " ..
                "carry doom skulls that are laced with powerful necro-enchantments. If you collect enough " ..
                "skulls you can use their power along with the power of the Dread Relic to command " ..
                "Teribus to face you.",
            rewardChoices = {{31816, 1}, {31817, 1}, {31818, 1}},
        },
        [10936] = {
            description = "While we were busy, a messenger was waiting out in the hall. I suppose he grew " ..
                "tired, or perhaps he simply ran away at the sight of Jules floating around the " ..
                "room.\n\nEither way, Force Commander Danath is looking for you. I suggest that you seek " ..
                "an audience with him inside the barracks as quickly as possible!",
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
        [10989] = {
            description = "Mog'dorg the Wizened waits for you at top of da tower. He tells me to look for " ..
                "a <race> <class> just like you. You go speak with him about smart things.\n\nGo now, but " ..
                "don't tell no one. It's a secret!",
        },
        [11013] = {
            description = "Netherwing Ledge... What was once a bastion of sanctuary for the Netherwing is " ..
                "now home to the Dragonmaw. While the orcs may have control of our territory, our magic " ..
                "there is still strong. Strong enough to cloak your true identity and allow you to " ..
                "infiltrate the ranks of Dragonmaw.\n\nI have prepared this letter for you to present to " ..
                "their leader, Overlord Mor'ghor. Fly headlong into the maw of our enemy and seek out " ..
                "Dragonmaw Base Camp to start your new life as a fel orc of Illidan Stormrage.",
        },
        [11032] = {rewardChoices = {{29290, 1}, {29287, 1}, {29283, 1}}},
        [11033] = {rewardChoices = {{29290, 1}, {29279, 1}, {29287, 1}}},
        [11036] = {
            description = "I'll be the first to admit I'm not quite sure what this order is for, but " ..
                "Rocket-Chief Fuselage 's instructions were very specific -- only the very best fruit, " ..
                "preserved to survive a long voyage and sealed against the elements.\n\nThere were other " ..
                "specifications, zero-gravity this and low pressure that. I don't pretend to understand " ..
                "it, but the price is right, so he'll get his superfood. Bring this crate to him up at " ..
                "Area 52. After crossing into Netherstorm, keep following the road until you see the town.",
        },
        [11041] = {
            description = "In the name of our great master... For the glory of Illidan!\n\nBy order of " ..
                "Overlord Mor'ghor, the great plateau of Netherwing Ledge is to be secured. With all " ..
                "Netherwing drakes captured or forced off of the land, rock flayers are running rampant " ..
                "and threatening crystal harvesting operations.\n\nDestroy them all, their den mother and " ..
                "her consort, Arvoar.\n\nMor'ghor commands it!\n\n<It would appear that this orc failed " ..
                "to take the plateau. It is time to prove your worth to Mor'ghor!>",
            rewardChoices = {{32865, 1}, {32866, 1}, {32867, 1}, {32868, 1}},
            rewardMoney = 132000,
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
        [11060] = {rewardItems = {{32602, 1}}, rewardMoney = 4400, startedBy = {{23300}}},
        [11062] = {
            description = "<name>, we were wondering if you might be willing to visit our friends just to " ..
                "the north at the Skyguard Outpost?\n\nSky Commander Keller and his Skyguard are here " ..
                "running missions for our mutual protection, and he's asked us to send along anyone that " ..
                "we feel would excel at helping out.\n\nThat would be you!\n\nHead up there as soon as " ..
                "you can, and please, give him our regards.",
            rewardMoney = 4400,
        },
        [11064] = {
            description = "Don't let the gray hair fool you, grunt. I'm still ten times the rider that " ..
                "you are! And don't go thinking that this old dog doesn't have any tricks up his " ..
                "sleeve.\n\nNow all you gotta do is follow me and try not to get knocked down off your " ..
                "mount. If you can do that, Oldie will admit defeat.\n\nWe'll lift off as soon as you're " ..
                "ready.",
            rewardMoney = 44000,
        },
        [11090] = {
            description = "<Balthas holds up an alien looking device.>\n\nThis is a soul cannon. Its " ..
                "effects are devastating when attuned. This one is attuned to my blood. The same blood " ..
                "flowing through the veins of Reth'hedron - my brother. Aye, his misplaced allegiance " ..
                "will be the end of him.\n\nTake the cannon and fly to the Twilight Ridge in western " ..
                "Nagrand. Locate Reth'hedron and fire! You must stay on your mount and within range for " ..
                "the effects to take hold. Stand your ground against him and he will have no choice but " ..
                "to flee!",
            rewardChoices = {{32869, 1}, {32870, 1}, {32871, 1}, {32872, 1}},
            rewardMoney = 44000,
        },
        [11105] = {rewardChoices = {{29305, 1}, {29297, 1}, {29309, 1}}},
        [11106] = {rewardChoices = {{29301, 1}, {29305, 1}, {29309, 1}}},
        [11208] = {
            description = "Drazzit will expect to hear something from me soon, but I don't think the site " ..
                "is secure enough for me to leave. If you have time, would you be willing to take some of " ..
                "the salvaged cargo down to him at Mudsprocket?\n\nIf you haven't been there yet, it's a " ..
                "small settlement to the southwest of here, beyond the Stonemaul Ruins. You can take the " ..
                "road there from Tabetha's Farm, too. When you get to Mudsprocket, the guy you're looking " ..
                "for is Drazzit Dripvalve.",
        },
        [11331] = {
            description = "Here'sh the deal. I'm not going to the captain with thish news. I'm an amateur " ..
                "alchemist, thish ishn't my job, and I'm on break!\n\nBeshides, he'sh a big grumpkin... " ..
                "and you know him better than I do!\n\nSho, jusht go up into the keep and tell him. I'm " ..
                "sure he'll be reashonable about the whole thing...hic.\n\n<Peppy turns back to her " ..
                "drinking.>",
        },
        [11367] = {
            description = "Binder Murdis created Megalith to be a kind of keystone for the runed giants " ..
                "and to lead them in their mission. Defeating Megalith will leave them lost and without " ..
                "direction. I will ask Chieftain Ashtotem to divert some of our men as we move north and " ..
                "dedicate them to eliminating the last of the runed giants. Without their giants, the " ..
                "Iron Dwarves cannot stand against us.\n\nSearch the foothills of Frostblade Peak, north " ..
                "of Giants' Run for Megalith and defeat him!",
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
            rewardMoney = 100000,
        },
        [11378] = {
            description = "The tastes of my customers range from the mundane to the exotic. And sometimes " ..
                "they want to do very mundane things with the exotic objects they seek.\n\nSuch is the " ..
                "case with my latest request. My client, who shall remain nameless, wishes to obtain the " ..
                "head of the Epoch Hunter to mount on his wall.\n\n<class>, will you find a way to travel " ..
                "back in time to Old Hillsbrad and procure said head for my trophy-hunting patron?",
            rewardItems = {{29434, 1}},
            rewardMoney = 132000,
        },
        [11379] = {
            description = "I'm trying to invent something with some real zing. But to be honest, I'm more " ..
                "of an idea goblin these days. I've lost my sense of adventure.\n\nBut you... remind me " ..
                "of my younger days; ready to take on the world with a sword in one hand and a skillet in " ..
                "the other.\n\nI want you to take my beloved cooking pot and head out to Blade's Edge. " ..
                "Throw in some shortribs and crunchy serpent--already cooked for extra flavor--and broil " ..
                "it over an abyssal's corpse, the only thing hot enough to do the trick.",
            rewardChoices = {{33844, 1}, {33857, 1}},
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
        [11387] = {
            description = "There are mechanical constructs within the Mechanar which Mah'duun has been " ..
                "told must be dismantled.\n\nGo to Tempest Keep, find the tempest-forge destroyers and " ..
                "destroy them.\n\nThen you may return to collect the bounty.",
            rewardItems = {{29460, 1}},
            rewardMoney = 88000,
        },
        [11398] = {
            description = "The Scourge creature you just destroyed had this device held in its clutches. " ..
                "It has a jewel set into it which looks similar to the one that tops the scourging " ..
                "crystals.\n\nSurely, Apothecary Anastasia would like to have a look at this.",
        },
        [11411] = {
            description = "In my travels as a courier, I've seen a number of strange denizens of the " ..
                "Howling Fjord, but one group stands out. From a distance, they look like tauren, but " ..
                "upon closer inspection, they're quite different -- sturdier and shaggier.\n\nI found one " ..
                "of their settlements far to the north, beyond Halgrind, Skorn, and the northern forests. " ..
                "Camp Winterhoof, it's called, and it sits in the foothills of Gjalerhorn near the border " ..
                "with Grizzly Hills. Make contact with them, and see if they might be of use to us.",
        },
        [11433] = {
            description = "I've overheard what you've had to say with Greatmother Ankha. With all due " ..
                "respect, she's not having you go far enough.\n\nYou must also deal with the vrykul that " ..
                "lie dormant in the Waking Halls beneath Gjalerbron!\n\nI have no doubt that the rituals " ..
                "involved with awakening them are the key to their downfall. Most likely the necrolords " ..
                "have some device that you can use to bring the vrykul out of their dormant state " ..
                "prematurely.\n\nSurely such a disruption will prove fatal to the vrykul.",
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
            rewardMoney = 47000,
        },
        [11451] = {
            description = "Hi, I wrote a poem for my friend Caylee. She likes to hang out with the Aldor " ..
                "in Shattrath City. You know, in Outland?\n\nCould you take my poem to her? My mommy says " ..
                "I'm too young to go to Shattrath City!",
        },
        [11481] = {
            description = "By the naaru, I thank you, <race>, for your efforts.\n\nOur work is far from " ..
                "finished, however, and I must request that you undertake a critical mission - one as " ..
                "important as any I've issued.\n\nOur forces are spread thinly. To compound the strain, " ..
                "we've had to dispatch a contingent to Azeroth to investigate developments at the Sunwell " ..
                "Plateau.\n\nYou are needed there, <name>. Report to Larethor. Tell him that I wish we " ..
                "could spare more men.",
            rewardMoney = 4400,
        },
        [11482] = {
            description = "Hear me, <race>.\n\nDuty requires that you return to Azeroth. Every able " ..
                "person is to report to the Sunwell Plateau immediately.\n\nI'm afraid I have no more " ..
                "information to share, except this:\n\nYou'll be joining forces with the Aldor for this " ..
                "mission. Speak with a draenei by the name of Larethor when you arrive.\n\nApparently, " ..
                "the situation calls for us to set our differences aside and join forces.\n\nPrepare " ..
                "yourself, friend. This sounds serious.",
            rewardMoney = 4400,
        },
        [11489] = {
            description = "The most important part of your job while controlling the construct is the " ..
                "collection of data. I've placed an iron dwarf relic in the cart over yonder. It's the " ..
                "floating, lightning infused crystal.\n\nGet on the work bench and I'll put you back in " ..
                "the construct. Once you're back in the driver's seat, use the construct's data " ..
                "collection ability to pick up the test data.",
        },
        [11516] = {
            description = "We have to shut down this gateway to stop Legion reinforcements to the Isle of " ..
                "Quel'Danas.\n\nTake these embers, they contain one of my creations: a living flare. It " ..
                "is designed to act as a powerful destructive force - as long as it has been provided " ..
                "enough energy.\n\nFind the fel sparks that wander the area and slay them near the living " ..
                "flare. The flare will grow in power each time, until it becomes unstable.\n\nOnce you've " ..
                "achieved this bring the flare to the gateway. It will know what to do.",
            rewardItems = {{35232, 1}},
            rewardMoney = 44000,
        },
        [11521] = {
            description = "My stocks are presently sufficient, but I'll need plenty of razorthorn roots " ..
                "to keep up with the demand.\n\nCollecting the roots is difficult, but I know a special " ..
                "method of extraction.\n\nUsing the glands of the Razorthorn flayers, one can control a " ..
                "ravager there and use it to expose a root.\n\nTo find the roots, travel to Outlands and " ..
                "fly northeast from Shattrath until you reach Razorthorn Rise.\n\nReturn to me, <name>, " ..
                "once you have collected five of the roots.",
            rewardItems = {{35232, 1}},
            rewardMoney = 44000,
        },
        [11540] = {
            description = "We've driven the Dawnblade army out of the Sun's Reach Harbor. Sun's Reach is " ..
                "ours in its entirety. Yet somehow... I'm not entirely satisfied.\n\nI want you to go to " ..
                "Dawnstar Village, west of here, and slay any surviving Dawnblade combatants. They sealed " ..
                "their fate when they followed Kael to this place.",
            rewardMoney = 44000,
        },
        [11543] = {
            description = "We've managed to capture Sun's Reach in its entirety. Unfortunately a fleet of " ..
                "Dawnblade reservists is on its way to take back the harbor.\n\nTake this oil and secure " ..
                "a dragonhawk from Ayren Cloudbreaker. You should be able to fly within reach of the " ..
                "ships' sails; once you're close enough, set them on fire.\n\nLand in one of the ships " ..
                "and attack the reservists. With their ship sails on fire they won't be able to mount " ..
                "much of a defense.",
        },
        [11548] = {
            description = "We've built a memorial to honor those slain in battle. It's but a small " ..
                "consolation to the families that lost their loved ones.\n\nI am taking up a collection " ..
                "to aid the orphans and spouses of our war heroes. If you can spare a small donation it " ..
                "would go a long way.",
        },
        [11595] = {
            description = "Hellscream has the weight of the Horde upon his shoulders. Do not be dissuaded " ..
                "from your duties because of his temperament, <name>.\n\n<Saurfang nods.>\n\nDid you " ..
                "think that I would forget the name of a hero of Orgrimmar? It is not every day that I " ..
                "have the pleasure of putting the head of Nefarian on a pike!\n\nThe Scourge have begun " ..
                "their assault upon this fortress. Our soldiers steady the line, but are in desperate " ..
                "need of backup. Report to Razgor. He is stationed directly outside of Warsong Hold.",
        },
        [11597] = {
            description = "It seems that we always meet in the direst of circumstances, Scarab Lord. Were " ..
                "you not saving the world from certain destruction the last time we met?\n\n<Saurfang " ..
                "chuckles.>\n\nYour assistance is most welcome in Northrend, despite what the young " ..
                "chieftain might say.\n\nIf we had even a dozen more soldiers with your power, we would " ..
                "be sitting in Orgrimmar right now, hunched over a warm fire.\n\nReport to Overlord " ..
                "Razgor, right outside the main entry to Warsong Hold, to the south.",
        },
        [11599] = {
            description = "I recently received word from William Allerton, a family friend, that my " ..
                "brother enlisted here in Valiance Keep on the same day he did. Thing is... my brother's " ..
                "been dead for years.\n\nI sold everything I owned to come looking for Thassarian, only " ..
                "to be stonewalled by the local bureaucracy. I've even been threatened with arrest if I " ..
                "keep snooping around.\n\nI need someone in the good graces of the higher-ups... someone " ..
                "like you. If you can help me, I heard that William's stationed at the Farshire mine.",
        },
        [11601] = {
            description = "Poor Mr. Allerton might yet help us find my brother.\n\n< Leryssa unveils a " ..
                "voluminous book, not unlike an army recruitment ledger.>\n\nI borrowed it, ok? Let's " ..
                "see, does that enlistment card have a date?\n\nWilliam saw Thassarian at the enlistment " ..
                "line. Their entries must be near each other... here it is!\n\nHe was assigned to... Unit " ..
                "S? All the other military units are named after Alliance towns.\n\nWho's in the unit? " ..
                "Where are they deployed? We need rumors. See if the innkeeper's heard anything.",
        },
        [11656] = {
            description = "Tuskarr magic is similar to what your people call shamanism. While we serve " ..
                "the elements differently than you, the power that we are able to call forth is " ..
                "formidable.\n\n<Waltor waves a torch-like baton in front of you.>\n\nWith this tuskarr " ..
                "torch I want you to return to the mist and strike at the Kvaldir vessels. You will find " ..
                "three of their vessels docked behind the mist at Garrosh's Landing, north of here, and " ..
                "one docked off the shores of Pal'ea, to the south. Burn their ships in effigy! For all " ..
                "to see!",
            rewardChoices = {{37207, 1}, {37418, 1}, {37483, 1}, {37556, 1}},
        },
        [11688] = {
            description = "Just look at 'em! My beautiful kodos are helpless to defend themselves against " ..
                "those filthy swine! I need you to buy me some time, <race>. I think I can cure the kodo " ..
                "of the sickness, but you need to keep the unliving swine off 'em, else there'll be " ..
                "nothin' left to cure!\n\nGet out there and send those swine to their graves - " ..
                "permanently!",
        },
        [11692] = {
            description = "You're a proven <hero/heroine>. I have another problem!\n\nMy boss, Tinky, " ..
                "went east with Bixie Wrenchshanker and I CAN'T get the outgoing on this thing to work! " ..
                "Tinky's the only one that can fix it and we really need it working one-hundred " ..
                "percent.\n\nYou think you could find them? Bixie said something about following some old " ..
                "magnataur to a place called The Dens of Dying.\n\nI'm guessing that's where you'll find " ..
                "them.\n\nYou can catch a ride out there by talking with Kara Thricestar at the runway.",
        },
        [11789] = {
            description = "You there! Please, I need your help. This soldier will succumb to the " ..
                "cryptfiends' venom unless we act immediately.\n\nI've managed to slow down the poison, " ..
                "but without a suitable supply of antidote I cannot counteract it.\n\nI was promised a " ..
                "new shipment of anti-venom in the Stormbreaker's most recent trip from the south. Go " ..
                "inside its hold and search for a chest of first aid supplies.\n\nHurry, <class>! We " ..
                "can't afford to lose any more men unnecessarily.",
            rewardItems = {{22850, 2}},
        },
        [11877] = {
            description = "As we press the offensive on Quel'Danas, we've discovered that Kael'thas' " ..
                "minions are planning a counterattack. By ordering the Sunfury blood elves, based in " ..
                "Netherstorm, to attack our operations in Outland, he hopes to draw troops and attention " ..
                "away from the Sunwell.\n\nWe must not allow this to happen, <name>. Each and every blade " ..
                "is needed on the front lines.\n\nGo to Netherstorm and capture their attack plans. Any " ..
                "of the Sunfury blood elves up there could be in possession of the plans. Good luck, " ..
                "<name>.",
            rewardItems = {{35232, 1}},
            rewardMoney = 44000,
        },
        [11878] = {
            description = "Although you have acted valiantly in freeing the trapped calves, many of them " ..
                "will still die. You see, without a caretaker, these calves must fend for themselves in " ..
                "the wild.\n\nBut there is a way! Hope yet remains!\n\nNorth of here in the mammoth " ..
                "fields, bordering the Scalding Pools, you will find Khu'nok the Behemoth: a mammoth as " ..
                "wise as he is ancient. Take this mammoth orphan and present it to Khu'nok. He will know " ..
                "what to do.",
        },
        [11880] = {
            description = "I'm sure that 'gnomish inventor' is a crackpot. He was babbling about some " ..
                "dark distortions that have begun to appear in the Spirit Fields around Oshu'gun in " ..
                "Nagrand.\n\nAccording to him, these, uh, multiphase... um, spectro-goggles will allow " ..
                "the wearer to see the distortions and take readings from them. He insisted that " ..
                "recording this data was fundamental to our campaign at the Sunwell. I think he's nuts, " ..
                "but I'm under orders to investigate anything that might help. Would you mind taking some " ..
                "readings?",
            rewardMoney = 34000,
        },
        [11902] = {
            description = "The sacks of grain emanate the foul stench you've come to associate with the " ..
                "Plague. This probably explains what happened to the footmen defending the mine.\n\nYou'd " ..
                "best bring word back to Gerald Green.",
        },
        [11919] = {
            description = "The blues have begun to cover their drakes in mysterious runes. I must " ..
                "discover their significance.\n\n< Raelorasz pokes his hand with a spear and coats the " ..
                "tip with his blood.>\n\nTake this and use it on one of them. Wait for it to become " ..
                "subdued, then bring it here to me before it expires.\n\nTheir hatchlings feed around the " ..
                "northwest edge of the valley.",
            rewardChoices = {{37226, 1}, {37382, 1}, {37435, 1}, {37513, 1}},
            rewardMoney = 47000,
        },
        [12168] = {
            description = "An inscription on the back of the favor reads,\n\n\"To my favorite " ..
                "pupil,\n\nIf you continue to show promise, I will teach you wonders beyond your " ..
                "imaginings.\n\nIf you do not, I will have you destroyed!\n\nAs ever,\n\nHigh Cultist " ..
                "Zangus\"\n\nNo doubt the warden at Stars' Rest will want to see this.",
        },
        [12177] = {
            description = "Ah, we have a small problem. Grizzly hides... they be brown, mon!\n\nThink... " ..
                "think!\n\nI got it, mon! Is like this: gray is black an' white all mixed up. You get me " ..
                "some coal an' some flour, I'll grind it all up and dust the hides with it. No one will " ..
                "know the better!\n\nBlacksmiths sell coal for smeltin' an' you can get flour from the " ..
                "provisioner.",
        },
        [12207] = {
            description = "Long ago, powerful druids planted a tree to the northeast of here.\n\nIt was " ..
                "called Vordrassil and it was to be a world tree. It is not known why, but after the tree " ..
                "was fully grown, the druids decided it needed to be destroyed.\n\nEver since we arrived " ..
                "here, the earth has spoken to me, <name>. Its cries of pain come from the places where " ..
                "Vordrassil's remains fell on the ground.\n\nCorrupting ooze roams those places. Bring me " ..
                "samples of it so we may begin to heal the land.",
            rewardChoices = {{38719, 1}, {39023, 1}, {39052, 1}, {39090, 1}},
        },
        [12222] = {
            description = "Even as we attempt to fight off the Horde, the Dragonflayer tribe musters in " ..
                "their village of Voldrune, near the coast to the south.\n\nThe most powerful warriors in " ..
                "the village are granted flame-imbued talismans that give them the ability to control " ..
                "powerful, savage proto-drakes. If we can gain control of one of these drakes, perhaps we " ..
                "can use it to neutralize the threat posed by Voldrune.\n\nThe Dragonflayer flamebinders " ..
                "create the talismans and imbue them with power. Kill them and take the talismans.",
            rewardMoney = 56000,
        },
        [12294] = {
            description = "Very well, <name>. Your people kept their end of the bargain.\n\nTell Dumont " ..
                "that we'll honor the deal.",
        },
        [12299] = {
            description = "It's good to meet you. Let us celebrate our pact by partaking in some good old " ..
                "fashioned Horde-killing.\n\nYou'll find marauders from Conquest Hold just outside our " ..
                "town, west of here. Why don't you head out there and hunt them like the filthy animals " ..
                "they are?\n\nLet's see if our new allies can back all their talk with some action.",
            rewardChoices = {{38762, 1}, {38760, 1}, {38761, 1}},
            rewardMoney = 112000,
        },
        [12309] = {
            description = "After the Scourge breached the south wall, I ordered Cavalier Durkon to " ..
                "investigate the town crypt. Moments ago I was handed his report.\n\nThe undead that " ..
                "plague us are coming from two sources: the ruins of Wintergarde, now a breeding ground " ..
                "for Scourge, and our very own town crypt! Amidst the chaos and confusion the Scourge " ..
                "managed to get a necrolord inside the crypt.\n\nIn his message, Durkon requested " ..
                "assistance. You will find him and help him, <name>. The crypt is on the western border " ..
                "of the town square.",
        },
        [12433] = {
            description = "Gah! Not again. Another blown gasket....\n\nEvery time one of these goes, " ..
                "lubricant gums up all of the gears. Without solvent, it takes hours to clean.\n\nTell ya " ..
                "what, <race>. There's some fancy rocket fuel on the Venture Company barge in the dock " ..
                "there - element 115 I think they call it. That stuff makes for a great solvent.\n\nGet " ..
                "me one of those and I'll make it worth your trouble.",
            rewardMoney = 56000,
        },
        [12443] = {
            description = "Gah! Not again. Another blown gasket....\n\nEvery time one of these goes, " ..
                "lubricant gums up all of the gears. Without solvent, it takes hours to clean.\n\nTell ya " ..
                "what, <race>. There's some fancy rocket fuel on the Venture Company barge in the dock " ..
                "there - element 115 I think they call it. That stuff makes for a great solvent.\n\nGet " ..
                "me one of those and I'll make it worth your trouble.",
            rewardMoney = 56000,
        },
        [12487] = {
            description = "I've received a request for help from our base in the Grizzly Hills. I'm " ..
                "sending you to see Conqueror Krenna.\n\n<The high executor waves a sheaf of parchment in " ..
                "the air as if he could care less what is written on it.>\n\nShe's attempting to secure " ..
                "all of the natural resources or somesuch. Just watch your back around her. The word is " ..
                "that she's aggressive even for an orc.\n\nFollow the road east and then southeast. Cross " ..
                "the bridge at the Dragonspine Tributary and go east from the Evergreen Trading Post.",
        },
        [12502] = {
            description = "Listen, <class>. This is the Argent Crusade. Our men will fight to the end and " ..
                "never complain no matter what the conditions.\n\nThat said, we've taken some heavy " ..
                "casualties in this campaign and we've been hitting it hard with little or no sleep for " ..
                "months. That all takes a toll on morale, whether we admit it or not.\n\nIt may not seem " ..
                "like much, but seeing our standard raised over the battlefield is of considerable " ..
                "comfort to a soldier. Take these banners and raise them at the pedestals in Drak'Sotra.",
            rewardMoney = 15800,
        },
        [12503] = {
            description = "Despite our substantial successes in the lower third of Zul'Drak, we must " ..
                "still face the onslaught of the Scourge. Such is the way in this frigid hell.\n\nThe " ..
                "attacks are unrelenting, yet my men need rest. If you are willing, we could use your aid " ..
                "in reinforcing them.\n\nBelow in the courtyard you'll find no end to the fighting. " ..
                "Dispatch the Scourge there with all the zeal you can muster, <class>.",
            rewardMoney = 62000,
        },
        [12522] = {
            description = "She's ruined... ruined! I told that captain to be careful with such a precious " ..
                "cargo, but would she listen to me? No!\n\nWhen the ship ran aground, it damaged my " ..
                "flying machine, the Spirit of Gnomeregan. Now, we're left without any means to send our " ..
                "reports!\n\nThere is a chance, though, that the Venture Company's antics may work in our " ..
                "favor. They shot down another flying machine right about where Monte parachuted into the " ..
                "swamp to the east. Go there and retrieve the engine. It may be our only hope.",
            rewardMoney = 48000,
        },
        [12534] = {
            description = "Bristlepine can be dangerous, but most stay far away from wolvar. Wasps on " ..
                "other hand not fear the Frenzyheart... they even kill some of our hunters.\n\nI know " ..
                "Rakjak want wasp queen dead, but no wolvar want to go into her hive. You go kill wasp " ..
                "queen in Sapphire Hive to southeast and get stinger for Rakjak. Me bet Rakjak like that.",
            rewardChoices = {{39346, 1}, {39387, 1}, {39436, 1}, {39450, 1}},
            rewardMoney = 65000,
        },
        [12537] = {
            description = "Okay, the crystal things...\n\nThe big-tongues use the crystals to power their " ..
                "rain shrines. Zepik not know quite how it works, but Zepik does know that if they use " ..
                "wrong crystals, the clouds and the rain go crazy!\n\nZepik tried to sneak in at one of " ..
                "their other rain shrines, but it not go so well. It sure to go much better with " ..
                "two!\n\nTake crystals, place at big stone pillar shrine thing, then smash them to " ..
                "release power. Zepik not sure what will happen, so might want to step back after.",
            rewardChoices = {{39347, 1}, {39400, 1}, {39437, 1}, {39457, 1}},
            rewardMoney = 65000,
        },
        [12543] = {
            description = "We not know you, stranger, but we know you want something.\n\nWe will talk to " ..
                "Bones of Nozronn for you, but you must bring us offerings. We need powerful emperor " ..
                "cobra fangs to complete our oracle's necklace.\n\nGo to the Wildgrowth Mangal, northeast " ..
                "of our hut, find cobras and bring back best fangs. Then we make bones speak to you.",
            rewardMoney = 62000,
        },
        [12573] = {
            description = "We have great idea. You were friends with puppy-men, they maybe listen to " ..
                "you.\n\nWe want you to go give offering to Shaman Vekjik. He southwest where river turns " ..
                "into waterfall. Tell puppy-man we no want fight. Tell him we play nice.\n\nYou good " ..
                "<race>. We trust you do this right.",
            rewardChoices = {{39672, 1}, {39673, 1}, {39674, 1}, {39675, 1}},
            rewardMoney = 65000,
        },
        [12576] = {
            description = "We try to be nice to puppy-men ever since they came, but they nothing but " ..
                "mean.\n\nWe okay with them being dumb - they not do much harm. Now they mess with sacred " ..
                "shrines though. Sacred shrines not for messing with. The Great Stones are here from all " ..
                "the way back when the Great Ones made us.\n\nWe wouldn't know what to do if the Great " ..
                "Mist Stone were hurt. Go to their camp to north... make puppy-men stop and not come back!",
            rewardMoney = 65000,
        },
        [12579] = {
            description = "I've always suspected that the pillars have been the main reason for our " ..
                "weather and seclusion from the undead... this confirms it a bit.\n\nNot terribly long " ..
                "ago, there was a sound of a great explosion when the Lifeblood Pillar fell. The weather " ..
                "changed for the mosswalkers almost immediately... it began to snow, something we never " ..
                "see.\n\nThey were able to stop the snow by bringing more lifeblood crystals to the Great " ..
                "Moss Stone. Perhaps if we can do the same, it will help ward off the undead as well.",
            rewardMoney = 65000,
        },
        [12588] = {
            description = "One of our troops came across an old treasure map during our last offensive. " ..
                "If what it shows is true, then there are priceless troll artifacts nearby.\n\nMy " ..
                "soldiers have their hands full, pressed between the Drakkari and the Scourge. I need you " ..
                "to follow up on this intelligence.\n\nTake this shovel and use it at the loose dirt " ..
                "mounds to the southwest. Return to me after a diligent search has been conducted.",
            rewardMoney = 15800,
        },
        [12596] = {
            description = "Welcome to The Argent Stand, scrub. I am Commander Kunz, but you - you can " ..
                "call me... Commander.\n\nDon't think you're going to just cruise through my region, " ..
                "picking which missions you're going to participate in, answering to no one.\n\nHere, you " ..
                "report to me and you follow my orders to the letter. Understood?!\n\nFirst, you're going " ..
                "to get familiar with my men and the region we're charged with clearing.\n\nReport to " ..
                "each of them and do as they ask. Return to me when your patrol is done.",
            rewardChoices = {{39800, 1}, {39850, 1}, {39851, 1}, {39864, 1}, {39827, 1}},
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
            rewardMoney = 62000,
        },
        [12599] = {
            description = "Well, it ain't glamorous, but it needs doin'.\n\nMy troops have been fightin' " ..
                "their hearts out while knee-deep in stagnant water for days on end. That just can't be " ..
                "good fer ya.\n\nWhat they need is a nice fire to dry 'em out and lighten their " ..
                "spirits.\n\nThis part of the city's soaked, but the dead roots of these thornwood trees " ..
                "have a way of resistin' the moisture.\n\nRound us up some fuel for burnin' and we'll be " ..
                "mighty grateful.",
            rewardMoney = 15800,
        },
        [12603] = {
            description = "The primordial drakes occupy most of the area to the north and east, and I can " ..
                "feel the heat of their breath even at this distance. Before we can challenge the " ..
                "mightiest among the drakes, we must test our skills against the lesser " ..
                "creatures.\n\nStill, don't let your guard down; any one of these beasts can devour a man " ..
                "whole. Once you've familiarized yourself with the combat tactics of these drakes, return " ..
                "and I will tell you our next step.",
            rewardMoney = 65000,
        },
        [12631] = {
            description = "Crafted of bone and dripping with blood, this choker is of intricate and " ..
                "deliberate design.\n\nGazing upon it overwhelms you with an ominous presence - one that " ..
                "compels you to wear it. You fight the urge, and resolve to bring it back to Ebon " ..
                "Watch.\n\nIf anyone can explain this, a death knight can....",
            rewardMoney = 46000,
        },
        [12644] = {
            description = "Now that we've got the raw materials, I've had my assistant ready the still. " ..
                "He'll oversee the process, but I want you to help keep everything under control. You " ..
                "might be tempted to think that we just throw everything into the still and let it sit, " ..
                "but you're wrong.\n\nIngredients and heat need to be added at certain times, and the " ..
                "pressure regulated at others. You'll have no more than 10 seconds to react to a " ..
                "situation. Speak with \"Tipsy\" McManus when you're ready to start distilling.",
            rewardMoney = 48000,
        },
        [12666] = {
            description = "Quetz'lun may be dead, but I can still feel her spirit lingering in the " ..
                "underworld at the altar. We have to find a way to get you to her.\n\nLuckily for us, I " ..
                "just happen to have a supply of former supplicants at hand who are no longer in need of " ..
                "their sacred adornments. Both my subduers and claws are likely to still be wearing " ..
                "them.\n\nBring the adornments to me and I'll draw upon their energy to enable you to " ..
                "cross over into Quetz'lun's underworld nightmare.",
        },
        [12668] = {
            description = "I have something special planned for my favorite high priests. But first you " ..
                "get to prove yourself in laying the foundation for my revenge.\n\nYou do still want to " ..
                "live, yes?\n\nAs you have seen, my devotees are enjoying their stay here, but now it's " ..
                "time for them to make final restitution.\n\nDo me the smallest of favors if you would, " ..
                "<name>. Lure them near my soul fonts and then put an end to their existences.\n\nThey " ..
                "taste so delicious, and their sacrifice will not go in vain, I can assure you.",
        },
        [12673] = {
            description = "If ya ever gonna be worthy of da Lich King's gifts, ya must learn ta be a " ..
                "great leader - one who be commandin' respect!\n\nI got a task dat gonna refine your " ..
                "command skills, mon....\n\nSumma my minions be trained ta harvest blight crystals from " ..
                "da land below, but dey be lazy and slow. You gonna be in charge o' dem, mon.\n\nTake dis " ..
                "scepter and teach 'em how to get da job done. When dey be under your control, make 'em " ..
                "harvest dem crystals!",
            rewardMoney = 59000,
        },
        [12677] = {
            description = "Blight crystals?! What could this scumbag Drakuru be up to? Clearly, he's " ..
                "working on something significant.\n\nContinue to do his bidding and perhaps once he's " ..
                "more familiar with you he'll reveal his plans. In the meantime, we need to have a look " ..
                "at these crystals.\n\nWhile you're in Voltarus, try to get some samples of the harvested " ..
                "crystals when no one's looking.\n\nBe alert! Handling those crystals can trigger your " ..
                "disguise to fail.",
            rewardMoney = 59000,
        },
        [12690] = {
            description = "It be time we start our march to Gundrak, mon. It be time for me ta turn ya " ..
                "loose on dem trolls!\n\nDey breached our wall and put a whole army just north of " ..
                "us.\n\nHahaha!\n\nDey be fuel for da fire, mon! We gunna take da chieftiains an' kill da " ..
                "rest! It all be part of my master plan....\n\nYou take dis scepter and go command my " ..
                "abominations. Bring 'em to da Drakkari army and kill em all! When da chieftains come, my " ..
                "pet Shalewing gunna snatch 'em up and bring 'em here to me.",
            rewardMoney = 59000,
        },
        [12692] = {
            description = "Okay, I going back to Frenzyheart Hill to make sure all Frenzyheart know what " ..
                "you done for wolvar and for Zepik. You great hunter and they dumb to think you " ..
                "not.\n\nGo back to hill and talk to Elder Harkek... I make sure he knows you not traitor " ..
                "before any other Frenzyheart.\n\nThank you, Lich Hunter.",
            rewardMoney = 33000,
        },
        [12702] = {
            description = "I bet you not guess what happen again.\n\nNope, not Goregek or " ..
                "chickens.\n\nOkay, I lie. Goregek let chickens out again. Dumb Goregek and rumbly " ..
                "belly.\n\nLet me know if you need help from any of the hunters... they around here " ..
                "somewhere.",
            rewardMoney = 65000,
        },
        [12703] = {
            description = "You the great Lich Hunter, eh? Good to have such strong Frenzyheart ally for " ..
                "battle. Maybe you strong enough to call Kartak even.\n\nBig battle at Kartak's Hold to " ..
                "southwest. Go kill spark big-tongues until you get good bit of Oracle Blood. Bring blood " ..
                "to altar in Kartak's Hold to call Kartak for delicious feast of big-tongue.\n\nKartak " ..
                "take your body if you worthy... with Kartak's powers, you slaughter more big-tongues " ..
                "than even best dreams.\n\nGo kill lots, hunter!",
            rewardMoney = 136000,
        },
        [12734] = {
            description = "Rejek just became youngest warrior in all of Frenzyheart tribe. Father gave " ..
                "Rejek a mighty sword to defeat Frenzyheart enemies, but old tradition say sword need to " ..
                "be blooded first. Older warrior usually do that. You do this honor for Rejek?\n\nTake " ..
                "blade, put in corpses of all Frenzyheart foes: wasps and hardknuckles to southwest, and " ..
                "the big-tongues. Maybe blood blade on Mistwhispers, far to northwest near Bittertide " ..
                "Lake.",
            rewardMoney = 74000,
        },
        [12788] = {
            description = "We have a breakthrough! Our zombie specimens have given new insight into the " ..
                "nature of the Scourge's plague. They have born rotten, delicious fruit...\n\nTake this " ..
                "box to Silvermoon City. Inside is a head that is infected with the zombie plague, and " ..
                "something else... an anti-plague. The two plagues battle within the zombie brain, and " ..
                "that brain is the key to a cure, I am certain of it.\n\nBring the box to my assistant, " ..
                "Apothecary Tepesh. She attends Lor'themar Theron in Silvermoon City.",
            rewardMoney = 57000,
            startedBy = {{28318}},
        },
        [12792] = {
            description = "Listen up, <race>!\n\nThis entire region is full of crises. Everywhere you " ..
                "look you'll find those who could use your assistance.\n\n<Kunz looks you squarely in the " ..
                "eye.>\n\nNo one needs your help right now more than Riannah. The scourge have forced " ..
                "their way between us, leaving her and those she commands isolated.\n\nLight's Breach, " ..
                "where her forces are holding out, lies just southwest of here.",
            rewardMoney = 6000,
        },
        [12799] = {
            description = "You should be happy he's coming, they said. You'll enjoy his company, they " ..
                "said....\n\nWell it's not as if I had a choice in the matter. Finklestein is the " ..
                "Crusade's best alchemist. I suppose I should be honored that he's chosen my post to set " ..
                "up shop. But ever since he's arrived, I've been relegated to collecting various " ..
                "alchemical ingredients.\n\nSay, <race>, how about you give me a hand? Just south of here " ..
                "are some pools that are haunted by spirits of ancient trolls. Collect their ectoplasm " ..
                "for me.",
            rewardMoney = 59000,
        },
        [12853] = {
            description = "Hey there, pal!\n\nDo you like excitement and explosions?! Who doesn't? I know " ..
                "just the place for you. Down at luxurious K3, they're always making innovative " ..
                "inventions and finding all-new ways to make things blow up! Sounds thrilling, doesn't " ..
                "it? If you want to be part of the fun, head on down today and speak to Jeer " ..
                "Sparksocket!\n\nMandatory disclaimer: manual labor may be required to partake in " ..
                "previously indicated \"excitement.\"",
            rewardMoney = 6800,
        },
        [12856] = {
            description = "To be slain honorably on the field of battle brings us all glory. To be frozen " ..
                "in a block of ice and endlessly taunted does not....\n\nYou are to fly to the frost " ..
                "giant city of Dun Niffelem, just east of the Valley of Ancient Winters, and liberate our " ..
                "captive proto-drakes. With them, you will be able to free our sisters from their frozen " ..
                "bonds and carry them safely home.\n\nBeware the giants' clubs, sister, lest you find " ..
                "yourself numbered among the captives.",
            rewardMoney = 74000,
        },
        [12859] = {
            description = "Trolls attack Rageclaw Den and kick Rageclaw out! It get worse. Trolls now " ..
                "burning village! This very bad. Chief make top Rageclaw shaman, Moky, do study on fire. " ..
                "Results very surprising! Fire still hot and can burn things.\n\nWill you help Rageclaw " ..
                "and put fire out? Moky has special Rageclaw fire extinguisher for you. Use special fire " ..
                "extinguisher to put out fire at Rageclaw Den to southeast. Sometimes take many sprays to " ..
                "douse fire, but extinguisher always have water! Rageclaw magic strong!",
            rewardItems = {{41755, 1}, {199210, 1, "Northrend Adventuring Supplies"}},
            rewardMoney = 59000,
        },
        [12861] = {
            description = "Drakuru... You know who this troll is? I think bad troll are controlled by the " ..
                "Drakuru troll. They call themself Drakuru trolls - that how I know. Now you see why I am " ..
                "chief of Rageclaw. Smartest of all wolvar!\n\nBut that not why I talk to you now. Bad " ..
                "troll come and kick Rageclaw out of den. Rageclaw that no run away held as prisoner in " ..
                "village. You go to Rageclaw Den, southeast, and free captured Rageclaw. Kill troll for " ..
                "lock opener. You maybe kill many troll for many lock opener.",
            rewardChoices = {{41760, 1}, {41761, 1}, {41762, 1}, {41763, 1}},
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
            rewardMoney = 59000,
        },
        [12863] = {
            description = "Ah! Thanks for coming up here, <lad/lass>.\n\nJudging by your wide eyes and " ..
                "shivering hands, I'd venture a guess that you're somewhat new. Sounds like it would be " ..
                "good for you to meet our gracious hosts then!\n\nWe've got some extra medical " ..
                "supplies... to be honest, we weren't expecting to have such a comfortable setup. Go " ..
                "ahead and give this crate to Glorthal over there, and lend them a hand if you would too. " ..
                "We don't want them to think we're ungrateful for how welcoming they've been.",
            rewardMoney = 6800,
        },
        [12867] = {
            description = "A few weeks ago, if you looked up, you'd see dozens of those beautiful eagles " ..
                "soaring the skies. Now, only a few if any. They've taken to staying with their nests " ..
                "nearly all the time now because the harpies have been stealing their eggs.\n\nThe " ..
                "harpies have grown a taste for eagle flesh, it seems... the sick wretches are caring for " ..
                "the eggs long enough to feast on the hatchlings. Go into the valleys to the north or the " ..
                "east and find the eggs... bring them back here, and I'll take them back to the nests.",
            rewardMoney = 68000,
        },
        [12870] = {
            description = "Why hello thar!\n\nBefore you be headin' off to do your grand questin' and " ..
                "adventure, might I beg a wee favor of ya, <lad/lass>?\n\nThese mountains be packed " ..
                "full'a precious relics and baubles... this place be a dream come true for tha league. " ..
                "I'd be much obliged if ya could bring any such treasures you stumble upon back ta me. " ..
                "You can even share in me ale for tha trouble! Trust me <lad/lass>, that's a rich deal!",
            rewardChoices = {{43462, 1}, {43470, 1}, {43472, 2}, {43473, 2}},
            rewardMoney = 68000,
        },
        [12871] = {
            description = "Interesting. I don't see any locking mechanisms on the shell. That suggests to " ..
                "me that it may take more than just finding the other piece to combine the " ..
                "keystone.\n\nTake the shell back to the expedition leader, Lagnus, at Frosthold. Once he " ..
                "gets over his awe, he should be able to glean what the core looks like based on the " ..
                "shell, and maybe they can get the Frost Dwarves to help find it.\n\nI'm going to see if " ..
                "I can find out how to combine the two pieces. We'll catch up once we've both made some " ..
                "progress.",
            extraObjectives = {{{[67] = {{48.4, 60.8}, {48.6, 60.8}}}, nil, "Tracker Thulin"}},
            rewardMoney = 7400,
        },
        [12875] = {
            description = "I don't know where this core is hiding, but ye knew that. I said I'd help " ..
                "though, and that I shall.\n\nThere's a hermit by the name of Drom Frostgrip who lives in " ..
                "a cave north of here... down in tha valley. We've strayed away from the titans a bit " ..
                "ourselves being that there are so few about, but Drom's loyal to the old ways... he " ..
                "keeps an eye on their most precious places and speaks te the keeper Creteus " ..
                "often.\n\nYer sure to find him in the back of his cave... tell'm I sent ye and he'll " ..
                "help ye.",
            rewardMoney = 74000,
        },
        [12879] = {
            description = "<As you retrieve the core from the chest, you hear the thumping of heavy " ..
                "footsteps rushing towards you from the corridor. There is the faint sound of battle in " ..
                "the distance.>",
            rewardMoney = 74000,
        },
        [12883] = {
            description = "Minions be hearin' da call of your masta! Da Lich King be givin' Drakuru full " ..
                "control of da armies of da Scourge in Zul'Drak. We be commanded ta kill " ..
                "everyting.\n\nEVERYTING MUST DIE!\n\nWe be processin' all da corpses in da Dead Fields " ..
                "and sendin' em up ta Prince Navarius' crew in Zeramas for Scourgin'! Notin' goes ta " ..
                "waste on Drakuru's watch!\n\nSoon we be drinkin' da blood of da prophets ta become " ..
                "stronger dan eva before! Zul'Drak and Gundrak gonna fall to da Scourge!",
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
            rewardMoney = 118000,
        },
        [12894] = {
            description = "Crusader Dargath, Crusader MacKellar, Engineer Reed and the twins, Gerk and " ..
                "Burr, were sent to the Dead Fields to establish a battle front days ago. As of my last " ..
                "correspondence with them, they had successfully established a camp on the border of the " ..
                "Dead Fields, northwest of here.\n\nIn light of this newfound information about Drakuru " ..
                "and Prince Navarius I think it would be prudent to send someone to the Crusader Forward " ..
                "Camp post-haste.\n\nPack up your belongings, <name>. You must leave at once!",
        },
        [12903] = {
            description = "We were attacked by Prince Navarius and at least a dozen Scourge. I told " ..
                "Dargath and the twins to stay inside the tank, but they wouldn't listen. Dargath looked " ..
                "me in the eyes and said, \"If somebody doesn't get out of this tank, they'll kill us " ..
                "all.\" He then made Reed cut the engine and charged. Most heroic thing I've ever " ..
                "seen.\n\nI heard the Prince barking orders to the monsters. Sounded like he was taking " ..
                "them to Thrym's End, northwest of here. We have to rescue our friends. Will you go look " ..
                "for them?",
            rewardChoices = {{39816, 1}, {39886, 1}, {39890, 1}, {39889, 1}},
            rewardItems = {{199210, 1, "Northrend Adventuring Supplies"}},
        },
        [12920] = {
            description = "What are you waiting for? The language barrier has been broken, thanks to " ..
                "Moteha. Contact Brann Bronzebeard and find out anything you can about where he's hiding " ..
                "and what he's chasing after.\n\nMaybe we can still salvage something from this disaster.",
            rewardMoney = 58000,
        },
        [12921] = {
            description = "Excellent. There's an exit in the eastern end of the mine that leads to " ..
                "Brunnhildar Village. Follow it and I'll meet you there.\n\nWe must not be seen together " ..
                "so no one suspects you of aiding me. I'll use my magic to disguise my appearance. Do not " ..
                "worry, <race> -- we'll find your friend in no time.",
        },
        [12925] = {
            description = "The Lich King sent emissaries to us on three different occasions. All three " ..
                "were promptly dismembered.\n\nOur sisters in Valkyrion were not as dedicated to our " ..
                "traditions and accepted the Scourge's advances. Now instead of capturing their drakes " ..
                "from the wild, they raise them from the blight and filth that the Scourge wallow " ..
                "in.\n\nTake the frost oil that the Valkyrion Hyldnir carry on them and use it to freeze " ..
                "any blighted eggs you find. Rumors speak of a fetid pool of blight where the eggs are " ..
                "kept.",
            rewardMoney = 74000,
        },
        [12953] = {
            description = "The crate is filled with incendiary harpoons. You recall seeing harpoon guns " ..
                "and dry stacks of hay outside.\n\nPerhaps Iva will appreciate the extra effort and " ..
                "reward you appropriately.",
            rewardChoices = {{42850, 1}, {42874, 1}, {42884, 1}, {42896, 1}},
            rewardMoney = 58000,
        },
        [12956] = {
            description = "Clearly, this is more than an ordinary hunk of metal.\n\nUnlike any ore you're " ..
                "familiar with, it is hard but not brittle, far lighter than it looks, and glows even " ..
                "when cool.\n\nLooking closer, you can make out one of Thorim 's runes shining beneath " ..
                "the surface....",
            rewardMoney = 58000,
        },
        [12968] = {
            description = "The witch that started it all, Yulda the Stormspeaker came to our very " ..
                "village. She dared to insult our noble traditions and spouted the Lich King's venomous " ..
                "promises of power.\n\nShe ought to have left with a sword through her, but her magic was " ..
                "strong and she managed to escape.\n\nSeek her in Valkyrion inside the largest dwelling " ..
                "and show her that we are not to be trifled with.",
            rewardMoney = 58000,
        },
        [12977] = {
            description = "You have done a great service to the giants of Dun Niffelem. Without your aid, " ..
                "this monument would not exist.\n\nAs you silently ponder its significance, feelings " ..
                "begin to flood your heart. The feelings fill your mind with thoughts and images... as " ..
                "well as a sense of urgency.\n\nThe sensations fade and leave you with a knowledge of " ..
                "what you must do. The restless spirits at Thunderfall must be put to rest.\n\nAs you set " ..
                "off, you find that your hands have been filled with an ethereal horn.",
            rewardMoney = 74000,
        },
        [12999] = {
            description = "You remember Lady Nightswood, don't you? She certainly remembers you. She's " ..
                "the forlorn and very angry banshee that you 'saved' when you also broke Vile and myself " ..
                "out from under the Lich King's dominion.\n\nThe lady has gone into Jotunheim and " ..
                "possessed their bone witch. She intends to wreak havoc upon the vrykul from " ..
                "within.\n\nShe has asked that you seek her out. You'll find her in the cave on the south " ..
                "side of Njorndar Village to the southwest within Jotunheim.",
            rewardMoney = 7400,
        },
        [13000] = {
            description = "The cold in these mountains is brutal. We have a day or two before we burn up " ..
                "all the wood from the wreckage.\n\nWe spotted worgs inside a cave directly east of here. " ..
                "I need you to find the cave and obtain some furs. It might not sound like much, but it " ..
                "might be the difference between freezing to death and living another day.\n\nWorgs don't " ..
                "hunt alone, so I'm giving you a flare. It should buy you some time if you find yourself " ..
                "outnumbered.",
            rewardChoices = {{42788, 1}, {42801, 1}, {42813, 1}, {42832, 1}},
            rewardMoney = 71000,
        },
        [13006] = {
            description = "As you draw near the helm, you notice that the frigid environment is already " ..
                "taking its toll on the artifact's surface. What is now just a thin layer of ice will " ..
                "surely grow to envelop it entirely.\n\nNot about to let your hard efforts go to waste, " ..
                "you resolve to scour the region in search of a solution.\n\nJust as you set off, the " ..
                "eyes of the helm flash and an image of the nearby Hibernal Cavern enters your mind.",
            rewardMoney = 74000,
        },
        [13036] = {
            description = "Long has been the path to our salvation, young <class>. We have fought across " ..
                "continents, worlds even, to reach this point. Now we face our greatest challenge: the " ..
                "destruction of the Lich King and his Scourge.\n\nAlas, we fight this battle divided. The " ..
                "Horde and Alliance are in the throes of war and will lend us no support. We must remain " ..
                "unyielding in our cause! For what choice have we to do otherwise?\n\nDo you join the " ..
                "cause? Lend us your strength, <class>! My commander, Entari, awaits you at his post.",
        },
        [13040] = {
            description = "The number of injured soldiers rises with each passing day. They are being " ..
                "stricken by some type of toxin that we have never before seen. Whatever it is that these " ..
                "Nerubians hold within their venom glands is lethal and incurable! So far we've only been " ..
                "able to slow down the poison flowing through the victim's bodies. We must devise a " ..
                "cure!\n\nVenture northwest to the valley outside of the Vanguard and slay the Forgotten " ..
                "Depths Nerubians. Recover their venom glands and bring them to me.",
            rewardChoices = {{33447, 5}, {33448, 5}},
            rewardMoney = 68000,
        },
        [13070] = {
            description = "The chill of death stirs in the west, threatening to freeze our hearts and " ..
                "souls to this wasteland and bind us to its dark master. We will stand and we will " ..
                "fight!\n\nThe preparations have begun. Report to Siegemaster Fezzik at the front gate " ..
                "for your assignment.",
        },
        [13074] = {
            description = "What we need exists only in the emerald dream... acorns that are infused with " ..
                "a powerful restorative magic. Many places in this sacred glade are closely tied with the " ..
                "dream, and my shrine is among them.\n\nI will send you into the dream to recover some of " ..
                "these acorns. Be prepared though <class>, for this method of entering the dream is " ..
                "dangerous, and it is very likely you will be beset by nightmares.\n\nRecover a few " ..
                "acorns quickly, and then depart from my shrine or pinch yourself to return to our world.",
            rewardMoney = 74000,
        },
        [13105] = {
            description = "The Vanguard is secure, ally. We have reclaimed the Valley of Echoes and taken " ..
                "down the web walls blocking entry to the Breach. Now is the time to strike at " ..
                "Scourgeholme and establish our presence inside Icecrown. The battlefront moves on!\n\nI " ..
                "have asked the Ebon Watcher for his assistance with our assault upon Scourgeholme. His " ..
                "intimate knowledge of the Scourge will be invaluable in our effort.\n\nGo now and report " ..
                "to him at the tent outside of the Breach, northwest of here.",
        },
        [13110] = {
            description = "Not all of our soldiers made it out of Scourgeholme. Many were slain and " ..
                "turned into twisted reflections of their former selves. Such is the way of the Scourge. " ..
                "For those damned souls, there is no eternal peace. We must provide their souls " ..
                "rest.\n\nTravel through the Breach into Scourgeholme and slay the skeletal reanimated " ..
                "crusaders. Sprinkle this holy water on their bones so that their spirits may be freed.",
            rewardChoices = {{43832, 1}, {43833, 1}, {43834, 1}, {43835, 1}},
        },
        [13132] = {
            description = "Only luck spared me from the same fate as me mates.\n\nIn the scurry I got " ..
                "knocked down - was a wee bit tipsy to begin with. Looked up ta see the first of 'em " ..
                "turn.\n\nThere was a big ol' fella watchin' with a whole mess o' guards. They were " ..
                "chantin' Ymiron... maybe killin' him will free me mates?",
            rewardChoices = {{44408, 1}, {44409, 1}, {44410, 1}, {44411, 1}, {44412, 1}},
            rewardMoney = 296000,
        },
        [13154] = {
            description = "Dragons are incredible! Well, their bones at least! I've been equipping our " ..
                "archers with arrowheads made of Dragonbone. Unfortunately, since the massacre at " ..
                "Angrathar, it has become almost impossible to get bone from Dragonblight.\n\nHowever, " ..
                "the Forest of Shadows on the western edge of Wintergrasp has enough bones to tide us " ..
                "over.\n\nHead to the Forest of Shadows and bring back any bone splinters you can " ..
                "find!\n\nThe Horde have been seen collecting bone splinters in the area. Slay them!",
            rewardMoney = 74000,
            startedBy = {{31052}},
        },
        [13178] = {
            description = "Welcome to the Wintergrasp Fortress, <name>. Warlord Garrosh demands one " ..
                "thing: Slay them all!\n\nReturn to me when ten of the strongest members of the Alliance " ..
                "are dead.",
            rewardMoney = 114000,
            startedBy = {{31091}},
        },
        [13195] = {
            description = "My, it is quite chilly up here! Reminds me of the stormy peaks of Kaarinos on " ..
                "Argus. However, with all of this snow and ice, our soldiers can easily catch " ..
                "cold.\n\nHead to the Steppe of Life in southwestern Wintergrasp, and bring me back 10 " ..
                "Horde Herb Pouches. I will grind the herbs into a medicine to protect against the " ..
                "cold.\n\nThe Horde have been seen collecting them from the plant life in the area. Do " ..
                "not hesitate to slay them and retrieve the herbs!\n\nYou may also find one on a lasher " ..
                "in the area.",
            rewardMoney = 74000,
        },
        [13293] = {
            description = "You need to get down to Ymirheim, that big frost vrykul town in the middle of " ..
                "Icecrown.\n\nOur boy, Blast Thunderbomb, is down there on the west side of town " ..
                "representing the Warsong Offensive in a competition against the Alliance. It's his " ..
                "jumpbot versus theirs in a king of the mountain contest!\n\nDon't let us down, <name>. " ..
                "Goblin engineering pride is on the line! Besides, all the boys here in the hold are " ..
                "counting on you.\n\nThat and we've got money riding on it that you can kick those " ..
                "cowards in the pants!",
        },
        [13329] = {
            description = "The Conflagration, the ground before Corp'rethar, south of the Ironwall " ..
                "Rampart, is where the Lich King's elite soldiers have formed up to defend the " ..
                "citadel.\n\nLed by a contingent of death knights, a legion of skeletal reavers bars the " ..
                "way. I fear that even when these reavers fall, the Scourge will simply reconstitute them " ..
                "and send them back at us.\n\nI've come up with a plan to stop this, but I have no way of " ..
                "knowing if it will work. Take this solution and use it to dissolve the remains of the " ..
                "reavers.",
            rewardMoney = 74000,
        },
        [13378] = {description = "Speak with Chief Engineer Copperclaw.", rewardMoney = 7400},
        [13388] = {
            description = "Things are looking good. Let's do this.\n\nThe stack of bombs is right near " ..
                "the pit. I'll start to evacuate the men.",
            rewardMoney = 7400,
        },
        [13409] = {
            description = "The fel orcs of Hellfire Citadel must be scoured from our birthland! To attack " ..
                "them, we must first secure forward staging points near the Citadel.\n\nOur outrunners " ..
                "found three fortifications that will suit this purpose, but the Alliance has the same " ..
                "idea and even now sends forces to take them!\n\nWe want you to stop the Alliance and " ..
                "capture these forts. Aid in the capture of each fort and then return to me.\n\nFor the " ..
                "Horde!",
            rewardItems = {{40477, 1}, {24581, 3}},
            rewardMoney = 7000,
        },
        [13415] = {
            description = "Norgannon's shell is within our reach, <name>. Take the inventor's disk into " ..
                "the library's interior. There should be a console there that you can activate with the " ..
                "disk. I imagine Mimir stored more there than just Norgannon's shell. There are probably " ..
                "enough schematics stored there to keep Ironforge's engineers occupied for " ..
                "years!\n\nAnyway, use the disk to recover the shell. Hopefully, Mimir hasn't decided to " ..
                "put any more obstacles in our way.",
            rewardMoney = 37000,
        },
        [13422] = {
            description = "You've succeeded where others have failed. Yet you cannot rest on your " ..
                "laurels.\n\nYou must show others what strength and commitment really mean.\n\nThe male " ..
                "insubordinates inside the Forlorn Mine need to be disciplined once again. Show them " ..
                "sister... show them what it means to disobey us.",
            rewardItems = {{44751, 1}},
            rewardMoney = 55000,
        },
        [13508] = {
            description = "I have a scout that we lost contact with a couple days ago. I assumed her " ..
                "dead, but it appears that she's been captured. The trolls indicate that they have at " ..
                "least two captives though... the only other person that comes to mind is Alanndarian " ..
                "Nightsong, a civilian that was in the area against my advisement early yesterday.\n\nThe " ..
                "Shatterspear have established a war camp to the north - it is almost certainly where any " ..
                "of their prisoners are being taken. Find them and free them if you're able.",
            rewardMoney = 600,
        },
        [13513] = {
            description = "I've already been working on something for breaking down their protective " ..
                "wards. With a focus based in their power and a bit of druidic magic, we should be able " ..
                "to breach their shields.\n\nFind their shaman to the east and southeast and recover " ..
                "several of their amulets. I will prepare them and imbue an arrow that you can deliver to " ..
                "Sandrya Moonfall for the attack.",
            rewardMoney = 600,
        },
        [13523] = {
            description = "Do not worry about me. My wounds are deep and death will soon come to " ..
                "me.\n\nIt is all up to you now... you must stop the Twilight's Hammer.\n\nThe Old Gods " ..
                "they worship have granted them power over the restless water spirits... but that power " ..
                "is tenuous. Channel Elune's presence through this orb once the elementals have been " ..
                "defeated.\n\nUse the power of Elune to banish the spirits permanently.",
            rewardChoices = {{52662, 1}, {55127, 1}},
            rewardMoney = 600,
        },
        [13539] = {
            description = "While the Alliance may be pounding on our doors, a true tactician looks beyond " ..
                "the obvious.\n\n\"Attack him where he is unprepared, appear where you are not " ..
                "expected.\"\n\n<name>, I need you to travel across the Wintergrasp River and destroy one " ..
                "of the three towers to the south. Our Warlocks report that the towers are draining power " ..
                "we could use to bolster our own troops.\n\nReturn to me once you've destroyed a tower.",
            rewardMoney = 114000,
        },
        [13543] = {
            description = "I've flown through the ruins of Auberdine on a scouting mission. There are " ..
                "three Twilight's Hammer cultists that are responsible for the elementals that have " ..
                "overrun the destroyed town.\n\nHead west into the ruins. Seek out and slay Cloudtamer " ..
                "Wildmane, Windmaster Tzu-Tzu, and Skylord Braax.\n\nOnly then will Sentinel Selarin and " ..
                "her forces stand a chance of taking back their home.",
        },
        [13547] = {
            description = "Your friends back at the refugee camp are unaware of the true and imminent " ..
                "danger that the Twilight's Hammer cultists have already brought into the world.\n\nFor " ..
                "you to deal with that, we'll first need to get some help from the dead of " ..
                "Auberdine.\n\nSearch through the ruins of the town and find the corpses of Thundris " ..
                "Windweaver, Elissa Starbreeze, Taldan, and Caylais Moonfeather. Coax the spirits from " ..
                "their bodies and then return with them to me here.",
        },
        [13549] = {
            description = "Along with the Drakkari artifacts, I'm interested in returning to Zandalar " ..
                "with some of the Zul'Drak wildlife. I have males of both the frost leopards and icepaw " ..
                "bears, but I need females!\n\nToo bad that my trapper was killed in a most unfortunate " ..
                "accident. Perhaps you would be willing to fill in for him?\n\nPut the leopards and bears " ..
                "to sleep with this blowgun then lift their tails and return with some females if you " ..
                "would be so kind. They can be found near the Altars of Rhunok, Quetz'lun, and Har'koa.",
            rewardMoney = 65000,
        },
        [13558] = {
            description = "Aetherion is almost in our world, but he can still be dealt with!\n\nAt the " ..
                "end of the dock floats a ritual orb. I want you to use it to complete the ritual, " ..
                "beckoning the elemental lord down from his vortex.\n\nTrust me, <name>, I and the other " ..
                "spirits that you have freed will greatly weaken Aetherion. However, it will be up to you " ..
                "to finish him off for good and save the Kaldorei people of Darkshore from utter " ..
                "destruction.\n\nDeliver his essence to Corvine Moonrise at the refugee camp so he will " ..
                "know.",
            rewardChoices = {{52596, 1}, {52622, 1}},
            rewardMoney = 1600,
        },
        [13563] = {
            description = "I would like to extend my gratitude for saving us. I would call myself " ..
                "fortunate, but my beloved, Anaya, lays long dead. I am alone and deeply troubled, and " ..
                "sadly, I require your aid yet again.\n\nWandering the woods of Darkshore after my " ..
                "rescue, I found myself in the ruins of Bashal'Aran... where I saw the haunted spirit of " ..
                "my beloved.\n\nShe must be freed, but I lack the heart to do it. Her spirit must be " ..
                "destroyed.",
            rewardChoices = {{52599, 1}, {52654, 1}},
            rewardMoney = 400,
        },
        [13564] = {
            description = "Please help... I can barely sit up.\n\nMy friend, a bear named Grimclaw, he's " ..
                "not here. I sent him ahead to let the Sentinels know we were coming before we left " ..
                "Auberdine, but he never arrived. I sensed something might be amiss as we were leaving, " ..
                "but with the evacuation, I never had a chance to act on it.\n\nIf he's injured, there's " ..
                "only one place that he would go - the Withering Thicket, north of Auberdine, down the " ..
                "road to the south from here. Bring him back to me safely... he's my only family.",
            rewardMoney = 400,
        },
        [13591] = {
            description = "The letter from Garrosh Hellscream makes clear the suspicions that were raised " ..
                "during the offensive on the Shatterspear. The presence of forsaken at the tower ruins " ..
                "and horde supplies and enforcers at the Shatterspear War Camp were only the start. " ..
                "Garrosh himself contacted the Shatterspear to spur their offensive towards Lor'danel, " ..
                "and it seems clear that he fully intends to push from the south as well.\n\nGlynda " ..
                "Nal'Shea will need this information if the night elves are to be prepared.",
            rewardChoices = {{52675, 1}, {55128, 1}, {55129, 1}},
            rewardMoney = 1400,
        },
        [13606] = {
            description = "Freya's Sigil is going to be one of the tougher ones, I reckon.\n\nAccording " ..
                "to the Archivum, the essence of the Sigil is tied to her three elder servants, " ..
                "Brightleaf, Ironbranch and Stonebark. Should any of the elders be harmed, the Sigil's " ..
                "integrity will be compromised.\n\nSparing the elders, however, means that Freya will be " ..
                "more powerful when you face her.\n\nWhat can I say, <name>. We're stuck between a rock " ..
                "and hard place.",
            rewardMoney = 296000,
        },
        [13613] = {
            description = "Our forces are holding up admirably, <class>.\n\nBe that as it may, there are " ..
                "yet wounded to attend to - many still in the field of battle.\n\nI have created a salve " ..
                "that should grant the wounded enough energy to return to the ramparts for treatment. " ..
                "Please administer it to any in need before they become lost to us.",
            rewardChoices = {{56633, 1}, {56634, 1}, {56635, 1}},
            rewardMoney = 1300,
        },
        [13639] = {
            description = "Ironband has an excavation to the southeast and he's been needing a hefty " ..
                "amount of explosives sent from the league for all the carving. Huldar, Miran, and Saean " ..
                "just departed with the most recent load and could probably use a hand.\n\nThey can't " ..
                "have made it very far, strong as they are. They can only move so fast laden down with " ..
                "those barrels.\n\nThey're taking the normal route to the site, leaving south out of town " ..
                "and following the curve of the Loch. Go catch up with them and help'm out, will ya?",
            rewardMoney = 600,
        },
        [13656] = {
            description = "The document bears the Explorers' League crest and contains extensive " ..
                "information on the indigenous creatures of Loch Modan. Sooty smudges lead you to believe " ..
                "it was likely stolen by the Dark Iron spies in the area.\n\nYou recall mention of " ..
                "missing documents at the Explorers' League building in Thelsamar.",
            rewardMoney = 1600,
        },
        [13692] = {
            description = "My sword was lost at sea. Catch it and bring it back!",
            rewardItems = {{34863, 1}},
        },
        [13712] = {
            description = "You're coming with me, <name>.\n\nThere's no one else that I can spare, and we " ..
                "cannot afford for Splintertree to be lost.\n\nPrepare yourself, and speak to me again " ..
                "when you are ready.",
            rewardItems = {{60644, 1}},
            rewardMoney = 1000,
        },
        [13727] = {
            description = "You are nearly ready to compete in the grand melee. To prove yourself worthy " ..
                "of this honor, you must defeat a champion of the Argent Crusade.\n\nGo to the stables " ..
                "outside the pavilion, equip your lance, and mount up. Speak to Squire Danny at the " ..
                "Argent Valiants' Ring on the western edge of the grounds. The squire will call out your " ..
                "opponent when you're ready.\n\nAfter the battle is concluded, we will speak of the " ..
                "outcome.",
            rewardMoney = 74000,
        },
        [13801] = {
            description = "D-did you hear that? Ghosts! I hate ghosts!\n\nTheir eerie howls are coming " ..
                "from the barrows to the south. Ahhh! Make them stop!!\n\nPlease, <mister/missy> I'll pay " ..
                "good money to get those voices out of my head!",
            rewardMoney = 1300,
        },
        [13844] = {
            description = "Before you rejoin the battle, <class>, something urgent has come to my " ..
                "attention. My scouts report that the Forsaken are scouring the ruined tower of Althalaxx " ..
                "to our south.\n\nPrior to the assault, that bleak tower housed a fanatical arm of the " ..
                "Shadow Council commanded by the fallen highborne Athrikus Narassin. Narassin is long " ..
                "since dead, but if any of his work survives, we can't allow it out of our sight. " ..
                "Retrieve his research and kill the Forsaken commander who's plundering the ruins.",
            rewardChoices = {{52591, 1}, {52607, 1}, {52623, 1}},
            rewardMoney = 600,
        },
        [13850] = {
            description = "You want to ride a Venomhide? Then I've got bad news for you.\n\nThe Venomhide " ..
                "Ravasaurs, they're all poison: Poison blood, poison spit, poison skin. You climb on one, " ..
                "you fall off dead in a few hours.\n\nYou'd have to build up a resistance to their toxins " ..
                "before I sold you one, and that takes a long, LONG time... you'd need to be splashed " ..
                "with poisonous blood while fighting one numerous times. If you're really interested, the " ..
                "venomhides prefer the northern area of the Marshlands, northwest of here.",
            rewardMoney = 8000,
        },
        [13871] = {
            description = "It's not as like I haven't got enough to think about here!\n\nKeeping this " ..
                "place operational is hard enough without constant elf and draenei harassment.\n\nNow, on " ..
                "top of everything, there's an assassin lurking around the camp who's killed an important " ..
                "diplomat... on my watch!\n\nWhoever it is couldn't have gotten far, <class>. Scour the " ..
                "camp until you find her and then avenge the diplomat!\n\nAt least I can bring the " ..
                "assassin's head with me when I have to answer to Hellscream.",
            rewardChoices = {{56718, 1}, {56719, 1}, {56720, 1}},
            rewardMoney = 1400,
        },
        [13872] = {
            description = "The man standing right across from me is known as Hephaestus Pilgrim. He's one " ..
                "of the worgen.\n\nHe and his sister came to Astranaar not long ago looking for a place " ..
                "to live. From what little I've been able to glean, he's interested in trying to help the " ..
                "Earthen Ring with the Cataclysm. His sister is even more powerful. She's gone east to " ..
                "try and help the shaman deal with the volcano.\n\nPerhaps he can help. Take the charm " ..
                "over to him and see what he thinks.",
        },
        [13873] = {
            description = "I... I cannot believe she's gone. It all happened so fast....\n\nI understand " ..
                "that I have you to thank for avenging my mistress. For that, you have my gratitude, and " ..
                "that of Silvermoon.\n\nIn her wisdom, my lady foresaw this end. She prepared a missive " ..
                "to be delivered in the event that something happened to her.\n\nWe were to join an " ..
                "Orgrimmar retinue at the crossroads just north of here. Please, <race>, meet them in our " ..
                "stead and see that the message is delivered.",
            rewardMoney = 1100,
        },
        [13875] = {
            description = "I have a bit of a personal request for you, <class>.\n\nIt has been many moons " ..
                "since I have seen my love, Draaka. It will be many more before we are able to be " ..
                "together again. I fear that as time passes, her love for me will wane.\n\nThis braid has " ..
                "special meaning to the two of us, as do Thorned Bloodcups, the flower of this " ..
                "region.\n\nI ask that you pluck the flowers and weave them into this twine, then present " ..
                "the gift to Draaka on my behalf.",
            rewardChoices = {{56655, 1}, {56656, 1}, {56657, 1}},
            rewardMoney = 1400,
        },
        [13880] = {
            description = "<The massive earth elemental gazes down upon you.>\n\nThe flow of the lava " ..
                "must be stopped if we are to prevail. I will grant to you a portion of my power. Use it " ..
                "to fill the lava fissures!",
            rewardMoney = 1500,
        },
        [13881] = {
            description = "My first concern right now is for the thistle bear families who call what's " ..
                "left of these woods home. Just to our south, beyond the bear shrine, an entire " ..
                "generation has fallen ill. Gruesomely ill.\n\n<name>, I don't know what they're " ..
                "suffering from, but it's consumed them from within. It pains me that a whole generation " ..
                "is beyond saving, but we've got to kill them off so that the earth can reclaim their " ..
                "bodies.\n\nMore importantly, we need to find the source. Investigate the shallow lake " ..
                "they drink from!",
            rewardMoney = 1000,
        },
        [13899] = {
            description = "If the naga want to throw in their lot with the Twilight's Hammer, then may " ..
                "Elune have mercy on them.\n\nGo into their lair in the island of Nazj'vel and find their " ..
                "leader, the naga warlord known only as Wrathspine.\n\nPerhaps the horn of the ancients " ..
                "can still be saved.",
        },
        [13905] = {
            description = "The hatchling looks at you for a moment, almost as if wondering whether you'll " ..
                "understand. It scrawls a picture of a pair of feathers in the dirt, then points with one " ..
                "claw to the bindings at its elbows and knees.\n\nIt doesn't seem hungry, but what could " ..
                "the feathers be for?\n\nIt must want them for adornments like the ones you've seen on " ..
                "other raptors. The largest feathers come from the searing rocs that congregate around " ..
                "the bones of large creatures in western Tanaris, northeast of Thistleshrub Valley.",
            rewardItems = {{47196, 1}},
        },
        [13906] = {
            description = "With your expert feeding and care, your venomhide hatchling will grow quickly. " ..
                "As they grow, their hatchling teeth will be replaced by adult teeth. If you keep the " ..
                "teeth shed by your hatchling as it grows, you'll have an easy way to tell when it's " ..
                "mature enough to be trained as a mount.\n\nYour venomhide will let you know what it " ..
                "needs, so pay close attention. When it has shed all of its baby teeth, return to me with " ..
                "your venomhide and the materials for your saddle and I'll do the rest.",
            rewardItems = {{46102, 1}},
        },
        [13907] = {
            description = "The big beards at Ironforge sent me here to check on Remtravel's dig the " ..
                "moment they got word of the disaster. Look at it! Precious artifacts washed to sea, " ..
                "months of tedious digging undone in a moment.\n\nWhen the tidal waves hit, they " ..
                "demolished the murloc encampments along the shore. Good news? Naw, not with my luck. The " ..
                "survivors are squatting in the shelter of the ruins, and they're doing more damage than " ..
                "the elements ever could. Would you mind getting your waders on and taking care of things?",
            rewardMoney = 1000,
        },
        [13919] = {
            description = "It didn't work.\n\n<A sorrowful and resigned expression upon his face, " ..
                "Pelturas removes the tear from the soup and gently washes it.>\n\nThe eruption of " ..
                "Thunder Peak must have affected it in some way. You must take the tear to the Moonwell " ..
                "of Purity, which still lies intact, protected by the goddess' power, at the southeast " ..
                "base of the volcano.\n\nThere, you will wash it in the sacred waters of Elune. What " ..
                "happens beyond that, I cannot say. I fear for my daughter's life. It is in your hands " ..
                "now, <name>.",
        },
        [13921] = {
            description = "<A voice from inside the moonwell flows over your mind, bringing you a perfect " ..
                "sense of peace.>\n\nYou seek to cure a child, but know that all things come at a cost. " ..
                "To the east lies Raynewood Tower. Standing outside the tower, next to my moonwell, is " ..
                "one who has fallen into corruption.\n\nAvrus Illwhisper seeks forgiveness and " ..
                "redemption, <name>. Will you help him to attain that which he desires and in so doing " ..
                "achieve your own goal?",
        },
        [13944] = {
            description = "< Tweedle gesticulates emphatically.>\n\nI've done it! This should satisfy " ..
                "even Goggath!\n\nWe just need a test that will sufficiently show off our efforts... ahh, " ..
                "the wagon!\n\nThe bossman's wanted that rotted out piece of junk hauled off for days. " ..
                "Use my explosives to get rid of it, then see what the captain has to say!",
        },
        [13947] = {
            description = "So, Tweedle finally came through on those explosives, eh?\n\nThey couldn't " ..
                "have come at a better time. The elves of Astranaar are preparing to make a devastating " ..
                "assault on our camp as we speak.\n\nDrop our new weapon on them from the skies! The " ..
                "destruction of Astranaar will be a dagger in the heart of night elves " ..
                "everywhere!\n\nSpeak with Thraka when you're ready to begin the assault.\n\nAim true, " ..
                "<class>.",
            rewardChoices = {{56661, 1}, {56662, 1}, {56663, 1}},
            rewardMoney = 1500,
        },
        [13962] = {
            description = "The triage kits will help us keep up the fight, but we are at a " ..
                "stalemate.\n\nThe dryads die easy enough, but their leader is resurrecting them soon " ..
                "after they fall. We face an endless stream of the vermin!\n\nKeeper Ordanus hides in " ..
                "that mutated tree. Our efforts to fight our way to him have been in vain. Perhaps you " ..
                "could work your way to him while we contend with his dryads...\n\nSurely, this is " ..
                "child's play for someone who has conquered Astranaar. No?",
        },
        [13967] = {
            description = "The furbolg are more numerous than we expected in these southern regions. They " ..
                "have also been far more aggressive here than we would like.\n\nWith our resources " ..
                "divided between hunting down elves and harvesting much-needed lumber, that leaves you to " ..
                "help me put an end to our furbolg distraction.\n\nI have research to conduct here. In " ..
                "the meantime, I need you to take a more hands-on approach. Bring me the ears of nearby " ..
                "furbolg as proof to Tarkan that the problem is being dealt with.",
            rewardMoney = 1800,
        },
        [13968] = {
            description = "In the wake of the chaos down south, this \" Tortusk \" brute seems to have " ..
                "rallied all of the Razormane refugees to his banner. Under his leadership, he's turned " ..
                "them into little more than brigands. There's no negotiating with his type; Tortusk must " ..
                "be destroyed.\n\nIf our prisoner is to be believed, you'll find Tortusk southeast of " ..
                "here at a place called Thorn Hill. Search the bluffs where he has a commanding view of " ..
                "the road. Kill him, <name>, and the immediate threat should cease.",
            rewardChoices = {{59533, 1}, {59534, 1}, {59535, 1}},
            rewardMoney = 1000,
        },
        [13976] = {
            description = "Care to make a quick trip to the south? I've three friends that I haven't " ..
                "heard from in a while. With these strange tentacles popping out of the ground to the " ..
                "north, and all of the demonic activity, I don't dare leave my family.\n\nBolyun set up " ..
                "his camp in the southwest corner of the forest, just to the northwest of that damnable " ..
                "Fire Scar Shrine. Alenndaar and Harlown joined him, so they should all be okay, but you " ..
                "never know.\n\nThanks, <name>.",
        },
        [13981] = {
            description = "This is clearly the biggest explosive that you've ever laid eyes upon. What in " ..
                "the world could the goblins be thinking about bombing with such a monstrosity?\n\nTo " ..
                "your eye the thing looks like it's almost complete. The goblins appear to have built it " ..
                "well -- it looks as if it's impervious to any damage that you could do to it, and " ..
                "certainly too big for you to carry out of here.\n\nYou'd better report The Bomb to " ..
                "Huntress Jalin at Stardust Spire to the southwest!",
            rewardMoney = 1800,
        },
        [13999] = {
            description = "Think of the possibilities, <name>! Fast-growing fungal delivery agents for " ..
                "any manner of toxins. My companions in the Undercity will want to hear about " ..
                "this.\n\nHere are my notes and some additional samples. If we're fast, we can catch the " ..
                "next ship bound for the Eastern Kingdoms. Take the road east of here and follow it to " ..
                "the goblin town of Ratchet. Look for the Broken Keel tavern toward the south side of " ..
                "town and deliver these to my associate Sashya within.",
            rewardMoney = 600,
        },
        [14019] = {
            description = "We've got major problems with the monkeys in the jungle to the east. They've " ..
                "stolen all of our explosives, and now they're going around throwing them.\n\nSometimes " ..
                "at us!\n\nI had Fizz Lighter take some of his nitro and put it in these bananas. No " ..
                "monkey can resist a bunch of bananas!\n\nAll you have to do is go out there and feed " ..
                "them.",
            rewardChoices = {{52898, 1}, {52928, 1}, {52943, 1}},
            rewardMoney = 125,
        },
        [14057] = {
            description = "Now, any good mutiny is going to need serious firepower. Cap'n Garvey claimed " ..
                "all the best firearms for himself: A whole shipment of big, heavy dwarven flintlocks. He " ..
                "keeps them at his side in the other building across the island. Grab me six of those " ..
                "rifles and I'll distribute them to me future officers...",
        },
        [14063] = {
            description = "Now for my favorite part of any mutiny: the killin'! For pirates, it doesn't " ..
                "matter who's supposed to be in charge, only who's in control of the ships. Anchored on " ..
                "the east end of this island is the Maiden's Dagger, Cap'n Garvey's old flagship. He left " ..
                "his most trusted officer in charge: Alicia Cuthbert. Once we take her out, the ship is " ..
                "ours, and so's the sea.\n\nI'll get the men onto the boats. I need you to board the " ..
                "Dagger and blow this horn from on deck - that'll be our signal to board. Yar!",
            rewardChoices = {{59573, 1}, {59574, 1}, {59575, 1}, {59576, 1}},
            rewardMoney = 1800,
        },
        [14066] = {
            description = "Not long ago, a shipment of silver was stolen en route from here to " ..
                "Crossroads. It was meant as payroll to the guards, and we want that silver back.\n\nI'll " ..
                "ask around here for clues, but I want you to investigate the scene of the crime. Head " ..
                "west and look for a crashed caravan wagon just north of the road between here and " ..
                "Crossroads. Find out who took our silver and get it back!",
        },
        [14091] = {
            description = "The lieutenant appears to have died from severe wounds. The prince might want " ..
                "to hear this news.\n\nYou hear the sound of fighting coming from the market.",
            rewardMoney = 35,
        },
        [14109] = {
            description = "A new outfit? You don't say! There's quite a buzz surrounding your party. " ..
                "Everyone who's anyone on the island is going to be there.\n\nWell, happy shopping. " ..
                "Swindle Street has some of the best bargains anywhere!",
            rewardMoney = 50,
        },
        [14113] = {
            description = "Oh my gosh, babe! Everyone is here! Who cares about some stupid dragon?\n\nWe " ..
                "setup the party around the pool. Sounds like they're having a great time. You are going " ..
                "to look so good!\n\nWhy don't you head over to the pool and keep everyone entertained? " ..
                "I'll join you in a moment... I just have to slip into something even more amazing!",
            rewardMoney = 50,
        },
        [14118] = {
            description = "As we chew up the resources of this land for our war machines, we deprive the " ..
                "local animals of their homes. If they are to die anyway, we should not allow that meat " ..
                "to go to waste. Not when the maw of Orgrimmar gapes open, hungry.\n\nKill the weakened " ..
                "mosshoof stags that remain in this area and collect their meat for our peons and grunts.",
            rewardMoney = 350,
        },
        [14121] = {
            description = "We're all going to die!!!\n\n<You slap Megs to calm her down.>\n\nSorry about " ..
                "that, <Mr./Ms.> <name>. Okay, we need to find a way to get a lot of moolah " ..
                "quickly.\n\nThere are reports of the Trade Prince sending hired looters into the " ..
                "streets.\n\nYou could take the hot rod out there and run them down, snatching the loot " ..
                "that they've illegally stolen. There wouldn't be anything wrong with that, right?",
            rewardMoney = 75,
        },
        [14146] = {
            description = "Egah - what's going on?\n\n<Screams, shouts, and the roar of combat fills the " ..
                "radio.>\n\n<name>! Get back here right away. Hurry back to the gates - we're under " ..
                "attack!\n\nHelp us fend off the invaders. I'm arming your grenade launcher!!",
        },
        [14191] = {
            description = "You can decipher bits and pieces of the text, but it will require extensive " ..
                "study before Furien's work becomes coherent.\n\nFor now, as you look off to the " ..
                "northeast, you think you can make out some of the ruins depicted in the journal.\n\nFrom " ..
                "what you can tell, these ruins seem to have been of some significance to Furien's " ..
                "research.",
        },
        [14195] = {
            description = "Something has changed... perhaps a side-effect of Elune's cleansing " ..
                "ritual.\n\nWhile it's by no means perfect yet, your understanding of the ancient " ..
                "language in the journal has vastly improved.\n\nThe ruins in the northern mountains of " ..
                "Sargeron appear to be the main focus of Furien's enthusiasm. Something there, he felt, " ..
                "would aid him in driving the Alliance from this region.\n\nYou close the journal " ..
                "determined to find this ruin and discover its secrets.",
        },
        [14196] = {
            description = "You are now able to understand the script in which the journal was " ..
                "written.\n\nAlong the runestone, it is explained that the monument's gemstones were " ..
                "imbued with the power to summon a firestorm.\n\nThe storm could grow to be a mighty " ..
                "weapon either through sustained worship of Elune, or charged by spiritual energies of " ..
                "the fallen.\n\nLooking down upon the newly revealed ghosts of Elune's disciples, you " ..
                "reason that you have neither the time, nor the inclination to worship the goddess of " ..
                "your enemy....",
        },
        [14198] = {
            description = "You cannot help but to feel a twinge of pride, having unlocked this long lost " ..
                "secret of the ancient worshippers of Elune.\n\nYou now possess the power to inflict " ..
                "great damage upon your enemy.\n\nAs it was Furien's tireless work that made this " ..
                "possible, it only seems right that the weapon should be unleashed upon those who took " ..
                "his life.\n\nThe Alliance scum at Nijel's Point shall pay for their offenses against the " ..
                "Horde!",
            rewardChoices = {{55962, 1}, {55963, 1}, {55964, 1}},
            rewardMoney = 6000,
        },
        [14201] = {
            description = "The ruins around Lake Mennar, to our east, have a tale to tell. The lesser " ..
                "races - like those clumsy dwarves - would go after the truth with picks and shovels. " ..
                "<Malynea wrinkles her nose.> We'll be using more elegant methods.\n\nMy scrying magic is " ..
                "somewhat rusty, but with the right trinket I should be able to peer through the shrouds " ..
                "of time. The bones of my forefathers have long since rotted away but some of their " ..
                "personal treasures may remain - bring me some.",
            rewardMoney = 500,
        },
        [14209] = {
            description = "Those ancient ruins have survived ten thousand years of wind and weather, so I " ..
                "brought out my biggest and bestest bulldozer to flatten 'em. I call her " ..
                "\"Margene.\"\n\nBut my dozer's been letting me down lately, <name>. The moment I drove " ..
                "her into those haunted woods, her engine seized up with a spine-chilling howl. Now my " ..
                "engineers tell me something's clogging her valves. Go over there and inspect Margene's " ..
                "engine compartment, and bring me back a sample of whatever gunk has her stalled.",
            rewardMoney = 350,
        },
        [14214] = {
            description = "It's time, <name>. We'll take it from here.\n\nTell King Greymane that my " ..
                "father's arsenal will be at his disposal. There's more than enough firepower here to " ..
                "blow the worgen from here to the north sea.",
        },
        [14230] = {
            description = "The local demons seem to get quite a kick out of stealing all of our arcane " ..
                "manuals. I highly doubt most of them can even read, so they're probably doing it just to " ..
                "spite us.\n\nI could care less about most of the books they've taken, but they took an " ..
                "Abjurer's Manual that I'm going to need if there's any hope of keeping apprentices like " ..
                "you alive amidst Xylem's \"trials.\" Find the demons at the Lagash Encampment to the " ..
                "southeast and retrieve the Abjurer's Manual.\n\nThat's all. Scoot.",
            rewardMoney = 1000,
        },
        [14232] = {
            description = "Sorrem has made no secret of his disdain for the Burning Blade at Thunder Axe " ..
                "Fortress.\n\nSurely, proof of their demise would be of value to him.",
            rewardMoney = 3000,
        },
        [14235] = {
            description = "Our hunter, Kilag Gorefang, and a few scouts, traveled into the vale down the " ..
                "path to the west. They're...searching for... 'precious cargo'... that we were guarding " ..
                "when the filthy Alliance sunk our ship.\n\nThe way is blocked by deadly plants and they " ..
                "have not been able to break through.\n\n<name>, prove your worth as a goblin and a " ..
                "<class>. Journey into the Vicious Vale to find Kilag.",
        },
        [14238] = {
            description = "Keep your voice down. The glen north and west of here is crawling with " ..
                "Alliance assassins.\n\nUnfortunately, we haven't been able to spot them. The cowards! " ..
                "They hide and won't fight face-to-face.\n\nYou goblins are known for your wondrous " ..
                "goggles. Surely you have a pair that will allow you to see them?\n\nI need you to team " ..
                "up with one of my scouts and kill any of the SI:7 assassins that you spot.",
            rewardChoices = {{52900, 1}, {52930, 1}, {52946, 1}},
            rewardMoney = 175,
        },
        [14246] = {
            description = "As the region becomes more lush, the creatures of the desert are being forced " ..
                "into increasingly confined spaces.\n\nA particularly distressing result is the impending " ..
                "extinction of the local swoops. Predators feast on the birds and their eggs when they " ..
                "take nest.\n\nI have acquired some swoop eggs from Tanaris and coated them with an " ..
                "irresistible pheromone. Place one in each nest you find, then protect it until a swoop " ..
                "comes to carry it off.\n\nYou will be doing a service to the balance of this land.",
            rewardChoices = {{55894, 1}, {55895, 1}},
            rewardMoney = 3000,
        },
        [14248] = {
            description = "Great news! Foreman Dampwick has uncovered a cave full of kaja'mite on the " ..
                "island! What are the odds?\n\nOf course, there's a downside. He took some of the " ..
                "survivors with him to help mine the ore, but none of them have made it out.\n\nCrazy as " ..
                "it sounds, the foreman said that there are monkeys in the cave... with mining picks! " ..
                "They're mining the kaja'mite! How is that even possible?\n\nCan you head southeast to " ..
                "the cavern? The foreman is standing just outside the entrance.",
        },
        [14251] = {
            description = "There's never been danger of centaur attack this far north before. Someone put " ..
                "'em up to it, I just know it!\n\nRegardless, I'm wiped out. I had everything invested in " ..
                "this haul.\n\nFortunately, there's one thing no centaur can take from me and that's " ..
                "goblin ingenuity! I'll start from scratch and build an empire!\n\n< Bizby spots a " ..
                "scorpion in the distance.>\n\nThere's always a market for poison. Whatdya say, friend?",
            rewardMoney = 3000,
        },
        [14269] = {
            description = "Most of us made it here alive... but there are worgen on this side of the city " ..
                "as well.\n\nWe're going to continue heading south once everyone's accounted for.\n\nThat " ..
                "reminds me, someone was asking about you. A woman named Loren... she seemed a little " ..
                "disappointed when I told her you were all right.\n\nI think she mentioned she owes you " ..
                "money.",
            rewardMoney = 35,
        },
        [14285] = {
            description = "There's only so much I can teach right now with all these worgen trying to " ..
                "dismember us.\n\nWe really should think about heading south with the other survivors. " ..
                "We've been told that King Greymane is there.\n\nIf we stick together our chances of " ..
                "survival will increase... especially if you choose someone nutritious-looking to stand " ..
                "next to.",
            rewardMoney = 13,
        },
        [14287] = {
            description = "I've taught you all that is practical for now.\n\nIt is time we joined with " ..
                "the other survivors. The others mentioned that King Greymane and his royal guard are " ..
                "just south of here.\n\nWe should go there and seek safety in numbers.",
            rewardMoney = 13,
        },
        [14299] = {
            description = "Quite marvelous of you! A pleasure to observe. Much to study.\n\nOff you go " ..
                "now, retire to my tower. Joanna will get you situated. I shall open a portal for you.",
            rewardChoices = {{53401, 1}, {53420, 1}},
            rewardMoney = 700,
        },
        [14306] = {
            description = "With such an abrupt change to the ecology, it is to be expected that some of " ..
                "the flora and fauna don't react as well as we'd hope.\n\nThe uprooted lashers are a " ..
                "troublesome example of this. Roaming the fields to the east and south they are a " ..
                "detriment to the region and must be disposed of.\n\nWhile you're about, please deal with " ..
                "any of these pests that you find.",
            rewardChoices = {{55899, 1}, {55900, 1}, {55901, 1}},
            rewardMoney = 3000,
        },
        [14323] = {
            description = "One other thing I need. Hot water.\n\nNot easy around here. Not hot springs, " ..
                "no friends to share. One good way though. Have this sponge... it's ultra absorbent! Use " ..
                "it to go soak Vile Splashes at the sandbar eastish.\n\nWith enough, go squeeze them out " ..
                "over near the tower to summon jumbo elemental. He has hot water.",
        },
        [14327] = {
            description = "It would seem that we have no choice.\n\nAs reluctant as I am to cooperate " ..
                "with the Kolkar, there is wisdom in the words of their Khan.\n\nYou may give him my word " ..
                "that we shall lend our spears to the battle.",
        },
        [14328] = {
            description = "The Gelkis reside in southwest Desolace. They are just as stubborn as the " ..
                "Magram, and since they have not suffered war and relocation, they are considerably " ..
                "stronger.\n\nHumbling the Gelkis will require an extreme show of force.\n\nKhan Shodo " ..
                "and his three sons rule the clan. Shodo is aging, and suffers from old war wounds. He " ..
                "never leaves the depths of his cave. The strength of his rule lies in his sons.\n\nSlay " ..
                "them, and persuade the Khan to commit to our cause.",
        },
        [14334] = {
            description = "Ahoy, mon!\n\nYou think you be able ta do something for da village " ..
                "here?\n\nMost whales we can handle fine, but there be a special whale out there that be " ..
                "too big for our spears.\n\nBlubbergut been gettin' bigger an' bigger - eatin' up the " ..
                "fish we use to live on!\n\nGet out there and find the thing, then make him pay for his " ..
                "gluttony!",
            rewardChoices = {{55956, 1}, {55957, 1}, {55955, 1}, {55958, 1}},
            rewardMoney = 3500,
        },
        [14340] = {
            description = "Every man's got to learn his own lessons I suppose.\n\nHere, take my wizard " ..
                "hat. I have no doubt that he'll take you on as an apprentice if you look the role... you " ..
                "just might have to jump through some hoops first. Tiny flaming hoops, suspended over " ..
                "spikes, with spinning blades on the other side.\n\nYou should be able to find an image " ..
                "of Xylem on top of that hill to the northeast.",
            rewardMoney = 700,
        },
        [14363] = {
            description = "With his dying breath, Kohor mentioned the summoning of a demon that could " ..
                "threaten the entire region.\n\nHe may have been bluffing, but that's not a chance worth " ..
                "taking.\n\nThis cannot wait for the Alliance's invasion of Desolace to take shape. You " ..
                "must scour Thunder Axe Fortress for clues and bring an end to this potential threat.",
            rewardMoney = 3000,
        },
        [14365] = {
            description = "We have recently received a plea for help from a researcher of the Cenarion " ..
                "Circle.\n\nWe have no one we can spare to send, so I ask that you pay her a visit on our " ..
                "behalf.\n\nKorrah is posted near the ruined tower of Ethel Rethor, on the coast to the " ..
                "west.",
        },
        [14369] = {
            description = "I'm not going to lie, <name>. I don't like the idea of having worgen among our " ..
                "ranks.\n\nWho knows how long 'til Krennan's concoction wears off and you're trying to " ..
                "chomp one of our heads off.\n\nUntil that time, however, we can make ample use of your " ..
                "ferocity.\n\nI want you to go out in the battlefield and kill as many of those Forsaken " ..
                "as you can, in as brutal a way as you can.\n\nWe're going to put the fear of the worgen " ..
                "in them, <name>.",
            rewardChoices = {{54979, 1}, {54980, 1}},
            rewardMoney = 125,
        },
        [14377] = {
            description = "A cursory study of the azsharite you brought me reveals that it's not " ..
                "biological in nature, nor is it naturally formed. There's another creature in Azshara " ..
                "with similar properties: the cliff giants that lumber around these cliffs.\n\nOne of the " ..
                "giants seems willing to help our research along. Take the meat you collected to " ..
                "Gormungan, the giant standing just west of here. Befriend him, then grill him - find out " ..
                "if he knows the secret of azsharite!",
            rewardMoney = 400,
        },
        [14379] = {
            description = "Thargad works practically nonstop chasing after ancient Titan relics. He stays " ..
                "so busy that if it weren't for me, he'd probably forget to eat!\n\nSpeaking of eating, " ..
                "I'd like to prepare him something special - perhaps you could help me out?\n\nLobstrock " ..
                "roam all over the coast to the west. I'd never last in a fight with them myself, but I " ..
                "could make a great meal if you were to bring me some of their tails!",
            rewardMoney = 3500,
        },
        [14385] = {
            description = "Well, I can think of one surefire way to send a giant running to the bathroom, " ..
                "but you're not going to like it. What we need is a... massive... laxative. Oh hey! Would " ..
                "you believe the gnomes have something of the sort? That can't be a coincidence. I wonder " ..
                "what they're trying to push through over there?\n\nOur intelligence reports that the " ..
                "laxative was delivered to Gadgetspring's tower, down on the shoreline south of the " ..
                "Secret Lab. Retrieve that laxative and feed it to Gormungan!",
            rewardMoney = 600,
        },
        [14388] = {
            description = "Okay, new plan. We'll SCARE it out of 'em! In my experience most large " ..
                "creatures are terrified of tiny ones - like rats. Hmm. This place is crawling with rats, " ..
                "but how do we coax them over to the giant?\n\nHey! You don't mind having your cellular " ..
                "matrix broken down and reassembled do you? It's only painful while it's happening. I can " ..
                "shrink you down to rat-sized and you can ride one of these brutes over there like a " ..
                "horse. It's so crazy it's got to work! Speak with me when you're ready for shrinkage...",
            rewardMoney = 1300,
        },
        [14391] = {
            description = "Azuregos and Kalecgos are due to meet up at the Northern Rocketway Terminus. " ..
                "You should meet with them there to make sure that Kalecgos doesn't require any " ..
                "additional help.\n\nShould you prefer to not be dead, Anara will likely be able to help.",
            rewardMoney = 1100,
        },
        [14402] = {
            description = "I suppose now is as good a time to leave as any.\n\nI have my best outfit, my " ..
                "favorite book and my loving cat.\n\nI hope I'm not forgetting anything.\n\nTell that " ..
                "mayor of yours that I'll be on my way. I suppose I'll see you in town with the others!",
            rewardMoney = 85,
        },
        [14407] = {
            description = "Hey! I'm glad I caught you.\n\nI come on behalf of my master, Kalec. He " ..
                "requires your aid. Find him under the bridge in the slums as soon as you can!",
            rewardMoney = 450,
        },
        [14433] = {
            description = "In order to infiltrate and disrupt the Blackmaw negotiations, we'll need to " ..
                "know where they're happening. In Blackmaw Hold to the southwest, I suspect you'll find " ..
                "night elven ambassadors milling around, making preparations.\n\n<Haggrum spits on the " ..
                "ground.>\n\nKill them at your leisure, and search the area for important documents. Oh, " ..
                "and grab a set of their ambassador's robes, we'll need them.",
            rewardMoney = 900,
        },
        [14438] = {
            description = "<name>, there are many conflicts that wound this land. It is my hope that you " ..
                "will not bear witness to as many of them as our elders have. Yet there is one that I " ..
                "would ask you to seek. It will give you some sense of how terrible, if left unchecked, " ..
                "even a small threat can be to the land.\n\nPalemane gnolls have settled to the south of " ..
                "Bloodhoof and in a cave to the west. They disrespect our attempts to communicate with " ..
                "them, and they slay the wildlife of Mulgore unbridled.\n\nWords are no longer the answer.",
            rewardItems = {{57204, 1}},
            rewardMoney = 125,
        },
        [14452] = {
            description = "Behold, <name>. The very presence of the Bristleback is a blight. Nothing is " ..
                "left in their wake but corpses and barren land. Camp Narache could become what we see " ..
                "here in but a few days, unless we stand and fight.\n\nThis will be your Rite of " ..
                "Strength; the first ceremony of a tauren brave. Go into the heart of the thornsnarl and " ..
                "kill Bristleback quilboar, then return to me.",
            rewardChoices = {{57199, 1}, {57216, 1}, {57231, 1}},
            rewardMoney = 35,
        },
        [14461] = {
            description = "We must do more than simply hunt boars here. The eyesore that has been left " ..
                "upon the land must be purged.\n\nTo give them a wild thirst for blood, the battleboars " ..
                "are force-fed raw flesh. Take this torch, and use it to burn the troughs of meat and " ..
                "gore to cinders.",
            rewardMoney = 75,
        },
        [14473] = {
            description = "Looks like those monkeys will steal anything! Those thieving little monsters " ..
                "have driven the teraptor matriarch into a frenzy by stealing her eggs. Worse yet, the " ..
                "eggs have started to hatch! We've got hungry teraptor hatchlings running around all over " ..
                "the place, looking to make a quick meal out of us!\n\nWe didn't start this, but it's our " ..
                "problem now. You'll have to head into the jungle and kill those hungry teraptor " ..
                "hatchlings before they kill us all.",
            rewardMoney = 125,
        },
        [20440] = {
            description = "Our sacred wells have been tainted, and I will need your help to fix " ..
                "this.\n\nTo cleanse each well, I must create a cleansing totem, then you must bring the " ..
                "totem to the well and perform a cleansing ritual.\n\nFirst we will create a cleansing " ..
                "totem for the Winterhoof Water Well. To do this, the land must offer its aid. Hunt " ..
                "prairie wolves for their paws and adult plainstriders for their talons. They are to the " ..
                "southwest.\n\nReturn to me with the paws and talons, <name>.",
        },
        [20441] = {
            description = "Again, be sure you are ready to leave Bloodhoof Village behind, <name>. The " ..
                "next step on your journey will take you far from here.\n\nYour path continues to lead " ..
                "onward, across the fields of Mulgore, the eyes of the Earth Mother on you at all times. " ..
                "When you are ready, consume the waters near the tribal fire. Once you have ingested the " ..
                "holy waters, your eyes will be opened, and the spirits will guide you.",
            rewardChoices = {{57206, 1}, {57222, 1}},
        },
        [24428] = {
            description = "You have accomplished the truly impossible. The brood mother of the Black " ..
                "Dragonflight lies dead at your feet. Seize her head and deliver it to Zardeth of the " ..
                "Black Claw.",
            rewardChoices = {{49486, 1}, {49485, 1}, {49487, 1}},
        },
        [24442] = {
            description = "Looking over the captured attack plans, you find a map of the Eastern Kingdoms " ..
                "and Kalimdor with major settlements marked. Reading over the orders, you learn that " ..
                "Kvaldir captains have drafted plans for a series of devastating raids.\n\nAccording to " ..
                "the orders, the attacks are to begin after Mistcaller Yngvar \"consults the Heart of the " ..
                "Mists.\" Perhaps you could delay the attacks by capturing the omen from the Mistcaller's " ..
                "Cave on the western side of Hrothgar's Landing and notify Justicar Mariel Trueheart.",
            rewardMoney = 74000,
        },
        [24470] = {
            description = "Alright, <name>, listen up. I know a thing or two about troggs, and one of " ..
                "those things is that the biggest, strongest troggs get the most respect. The brutes " ..
                "value strength over anything else.\n\nYe see those great big troggs sitting back behind " ..
                "the front lines? They're the closest they have to what ye'd call a leader. Go take out a " ..
                "few, and show 'em what it means to mess with the Sons of Ironforge!",
            rewardChoices = {{66928, 1}, {66929, 1}, {66930, 1}},
            rewardMoney = 35,
        },
        [24474] = {
            description = "I don't know how ANYONE expects to get any work done around here if we don't " ..
                "have any ale! Our beer level here in Anvilmar is dangerously low.\n\nLucky for us, we've " ..
                "stowed some backup kegs for just such an occasion. West of Anvilmar, along the valley's " ..
                "northern border, ye'll find kegs of Stormhammer Stout and Theramore Pale Ale. Just to " ..
                "the east of here, ye'll find a stash of Gnomenbrau. That's me personal favorite.",
            rewardMoney = 35,
        },
        [24477] = {
            description = "<name>, my <boy/beautiful flower>! Are you into archaeology?\n\nWe've an " ..
                "exciting opportunity right outside our front door. All the shaking from today's seismic " ..
                "event has knocked a number of artifacts loose from the soil around our encampment. " ..
                "Survey along the valley's northern border, and you should find all sorts of treasures. " ..
                "Bring some back to me, and perhaps we can study them together.\n\nRight, then! Off you " ..
                "go!",
            rewardMoney = 35,
        },
        [24489] = {
            description = "I'm notoriously bad at reading troll facial expressions. That being said, " ..
                "these trolls don't look angry to me. They seem to be confused... maybe a little " ..
                "frightened.\n\nSomething happened that we're not seeing here, <name>. I say we do some " ..
                "investigation before we just kill every troll in sight.\n\nThere are three troll camps " ..
                "in the area: one to the southeast, one to the southwest, and one due west. Each camp has " ..
                "a soothsayer... see if you can get close enough to listen to what they're saying.",
            rewardMoney = 50,
        },
        [24496] = {
            description = "<name>, this rune was given to me to pass on to ye. Take some time to read it " ..
                "when ye have a chance. I'm thinkin' it came from the mage trainer Teegli. Take a gander " ..
                "at it and go find her inside Anvilmar.",
            rewardMoney = 25,
        },
        [24499] = {
            description = "We're severely undermanned to be risking a venture into the citadel, but " ..
                "opportunities like this are too rare to pass up.\n\nClear the way to the far side and " ..
                "secure the passage to the Pit of Saron. We will need to hold it to move our men further " ..
                "into the citadel.",
            rewardMoney = 296000,
        },
        [24506] = {
            description = "<class>! Come close quickly, I must have a word!\n\nMy queen, the Lady " ..
                "Sylvanas Windrunner, has uncovered a hole in the defenses of Icecrown Citadel into a " ..
                "place she referred to as \" The Forge of Souls.\" She sent word before she left for me " ..
                "to find fierce fighters to send her way. I think you'll do.\n\nGo to her within the " ..
                "entrance to the forge, <class>.",
            rewardMoney = 19000,
        },
        [24517] = {
            description = "Do you see the trail below us, <name>? That is MY trail. And if the Alliance " ..
                "dogs choose to use my trail, they'd best be looking over their shoulder.\n\nIt's time to " ..
                "collect my toll! Slay the footsoldiers from Honor's Stand and see if we can't send them " ..
                "scurrying back to their walls.\n\nBe sure to take out at least one of their officers " ..
                "patrolling the road. They need to realize that nobody is safe.",
            rewardMoney = 3000,
        },
        [24542] = {
            description = "The great archdruid Naralex recently appeared here in the Barrens. He's either " ..
                "behind this mess or trying to fix it. Either way, you should talk with him before this " ..
                "jungle engulfs the whole world! He's in a small tauren camp to the southeast.\n\nAlong " ..
                "the way, it would be helpful for you to gather plant samples for him to study. The " ..
                "newest flower buds will tell him a great deal about the most recent changes in the " ..
                "jungle.",
            rewardMoney = 3000,
        },
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
        [24578] = {
            description = "It took a while, but I think I've put together what happened here. At least " ..
                "partially.\n\nThere were survivors of the Curse in this town. They joined others in the " ..
                "mountains, in Tempest's Reach.\n\nEveryone left, except the man who kept the journal, " ..
                "old man Bradshaw. He noticed that the worgen attacks had stopped all of a sudden and " ..
                "decided to venture into the Blackwald.\n\nThere is an abandoned mill just northeast of " ..
                "town, it was where Bradshaw lived. See if you can find any clues there.",
            rewardMoney = 110,
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
        [24587] = {
            description = "The great fire giant, Ignis the Furnace Master toils away inside of Ulduar 's " ..
                "Colossal Forge. Under orders from Loken, Ignis creates weapons that are terrifying in " ..
                "their power.\n\nThe Council of Six has decreed that Ignis must die!",
            rewardMoney = 296000,
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
        [24601] = {
            description = "This confirms it. The overgrowth here is not being caused by a mere " ..
                "overabundance of energy.\n\nDo you understand? This is beyond what happened at the " ..
                "Wailing Caverns now. A rift into the Nightmare must have torn open in the middle of the " ..
                "very land we're standing on! And to think it's my fault...\n\nI'm done picking at the " ..
                "edges of this wound. Go to the west, to the center of the overgrowth, and meet me again " ..
                "there. We will dive into the heart of this corruption and force it shut!",
            rewardChoices = {{53159, 1}, {53160, 1}, {53161, 1}},
            rewardMoney = 3000,
        },
        [24607] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Nortet to the east.",
            rewardMoney = 25,
        },
        [24618] = {
            description = "We have fought the Alliance to a standstill here, even as the land beneath our " ..
                "feet falls apart. To the east you will find the Battlescar, a wide swath of decimated " ..
                "terrain. It is little more than a line in the sand, but it must be OUR line.\n\nIn the " ..
                "center of the scar you will find a flag marker designating who controls it. Scout out " ..
                "the flag.\n\nIf it's not already ours, capture it for the Horde - it will swing the " ..
                "battle in our favor. Investigate the scar and kill anyone you find in there!",
            rewardMoney = 3500,
        },
        [24620] = {
            description = "These parts - so lovely! Muscle and sinew and fingers and toes... I am SO " ..
                "hungry right now.\n\nBut work must come first. Once I stitch this pile of parts together " ..
                "I'm going to need a heart strong enough to pump sludge through this rat's nest of veins. " ..
                "I would use my own heart, but it's a shriveled up husk resembling a turnip.\n\nNo, I " ..
                "need some real power. Get me a kodo heart from one of those giant landquaker bulls to " ..
                "the south of the Battlescar.",
            rewardMoney = 3500,
        },
        [24654] = {
            description = "The silithid! They're bugs, <name>. Or something like bugs. They're not " ..
                "natural... and we built a fortress on the equivalent of an anthill.\n\nTake this burning " ..
                "pitch. It'll set the buggers on fire and plug up their burrows at the same time. Be " ..
                "careful when you pour this stuff on there - the silithid will come out in " ..
                "swarms!\n\nLook for silithid mounds around the exterior of Desolation Hold. They look " ..
                "like heaps of sand. Kill anything that crawls out.",
            rewardMoney = 3500,
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
        [24715] = {
            description = "<Suddenly, the robotic gorilla's eyes light up, and it begins to " ..
                "speak.>\n\n\"...operational capacity... less than 5%... accidentally... punctured oil " ..
                "reservoir...\"\n\n\"...use coconut milk... rock... save A-Me 01...\"\n\n<A-Me closes her " ..
                "eyes.>",
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
        [24724] = {rewardItems = {{11562, 6}}},
        [24726] = {rewardItems = {{11563, 6}}},
        [24727] = {rewardItems = {{11567, 6}}},
        [24728] = {rewardItems = {{11564, 6}}},
        [24754] = {
            description = "Ya done quite well for ya'self, <class>. I'm sure I could teach ya a trick or " ..
                "two here and dere, but I not be wastin' ya time on tiki targets no longer.\n\nl put one " ..
                "last trial before ya den, mon. Head over to da provin' pit in the middle of dis area and " ..
                "fight a real baddy - one dat wants ta kill ya back. Just let the jailor by the pit know " ..
                "when ya ready.",
            rewardItems = {{52873, 1}},
            rewardMoney = 50,
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
        [24758] = {
            description = "Tha Darkspear tribe have long been victims. Outcasts. We found ourselves " ..
                "fleein' our homes time 'n time again... but dis time, it's not fleein' dat drives us " ..
                "here.\n\nVol'jin has offered us leadership through wisdom, and it has kept us alive dis " ..
                "long. Now dat same wisdom offers portents of a chaotic future for tha Horde unda Garrosh " ..
                "Hellscream.\n\nNo, dis time we not fleein'. Dis time, we are fightin' for a home dat " ..
                "will last.\n\nIt's time to begin ya trainin', <name>. Speak with Nekali to the east.",
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
        [24812] = {
            description = "Da naga have committed great atrocities on our people. Da time ta show dem " ..
                "mercy has long passed.\n\nEnter da cave and kill any naga you find dere. Every naga dead " ..
                "dis day is one less naga ta take us unawares later on. I trust ya will be thorough.",
            rewardChoices = {{52878, 1}, {52883, 1}, {52886, 1}},
            rewardMoney = 75,
        },
        [24823] = {rewardItems = {{50397, 1}}, rewardMoney = 74000},
        [24835] = {rewardItems = {{50404, 1}}, rewardMoney = 74000},
        [24847] = {rewardChoices = {{50398, 1}, {50402, 1}, {50400, 1}, {52572, 1}}},
        [24863] = {
            description = "Horde scouts hiding in the ruins up ahead ambushed my supply train. Only two " ..
                "of my bodyguards made it out of there alive. And me? I used to have hair!\n\nThe " ..
                "supplies I was delivering are scattered through the ruins up ahead. Gather them up and " ..
                "take them to Janice Mattingly at Honor's Stand. If they can't make it to Stonetalon, at " ..
                "least we can keep them out of Horde hands...",
            rewardMoney = 2500,
        },
        [24868] = {
            description = "<name>, you and Ace need to march those naga hatchlings down there and use " ..
                "them as leverage to convince the leader of the naga to surrender to us.\n\nAce knows " ..
                "where to go on the south side of the ruins... just follow him.",
            rewardChoices = {{52908, 1}, {52954, 1}},
            rewardMoney = 450,
        },
        [24901] = {
            description = "<name>, you have to defend us!\n\nI had the eggheads deploy the town's cannon " ..
                "defenses, but it seems like there's an unlimited supply of these Oomlot warriors!\n\nGet " ..
                "your behind into one of those B.C. Eliminators and eliminate the pygmy threat to the " ..
                "town!",
            rewardChoices = {{52909, 1}, {52955, 1}},
            rewardMoney = 225,
        },
        [24939] = {
            description = "We've got the hardware but not the manpower, <name>. Man one of the carronades " ..
                "on the shore here and take out those incoming boats!",
            rewardChoices = {{53268, 1}, {53282, 1}, {53296, 1}},
            rewardMoney = 2500,
        },
        [24951] = {
            description = "Now that we've got a good pile of fresh chunks, we just tie it to this " ..
                "rope...and now you're ready to go catch me a silithid.\n\nWhat? Don't give me that look, " ..
                "it's perfectly safe. Well, mostly safe. Okay, you might die painfully. But it'll be " ..
                "easy! Just throw this meat out there, wait for a bug to pounce on it, and then drag 'em " ..
                "back here by the rope!\n\nGo after one of the swarmers. I haven't seen the other ones go " ..
                "for hyenas before, and you should find plenty of swarmers around the edge of the pit.",
            rewardMoney = 7000,
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
        [25023] = {
            description = "Alright then, grab onto the ladder. We gotta get outa here!\n\nWe'll make a " ..
                "flyby of the town, and then I'm gonna get you to some old friends!",
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
        [25032] = {
            description = "Yes, I see the other half now, mon...to the south...\n\nWe be close now, mon. " ..
                "It's in an oasis, buried in de muck beneath de water. Don't delay!",
            rewardChoices = {{56840, 1}, {56841, 1}, {56842, 1}, {56843, 1}},
            rewardMoney = 13000,
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
        [25107] = {
            description = "At the bottom of the chest, you find a large tablet. Made of a material " ..
                "resembling stone, but completely smooth and flawless, it is covered in strange " ..
                "writing.\n\nWhile some resembles the writing on the walls, other scripts appear " ..
                "completely different. Andoren would probably like to see this.",
            rewardChoices = {{56900, 1}, {56901, 1}, {56902, 1}},
            rewardMoney = 14000,
        },
        [25110] = {
            description = "Assistant Greely is clearly bewildered and intimidated. How will she help you " ..
                "to find a way to rescue everyone in this condition?\n\nMaybe if she were to drink one of " ..
                "those Kaja'Cola Zero-One drinks you saw, she'd be able to have a bright idea?",
            rewardMoney = 300,
        },
        [25112] = {
            description = "I make my money around here selling animal parts. I've been perfecting a " ..
                "foolproof method of maximizing profit: The butcherbot!\n\nThese little guys are " ..
                "programmed to harvest every scrap of usable material from the wildlife around here, on a " ..
                "case-by-case basis. He does all the work, and best of all, only I know how to get the " ..
                "goods back out of him.\n\nIf you're interested in making some coin, take one of these " ..
                "guys for a spin. I need some glasshide basilisk parts; you'll find a bunch of them to " ..
                "the south.",
            rewardMoney = 6500,
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
        [25141] = {
            description = "Let's start with the basics, shall we? I'm the only rogue trainer in town, so " ..
                "you're going to have to learn it from me.\n\nGo get some more experience, figure out how " ..
                "to eviscerate your foes, and then show me on the training dummies here. I'll evaluate " ..
                "your form.",
            rewardItems = {{53376, 1}},
        },
        [25164] = {
            description = "The naga are upon us, <class>. Aid us in fightin' dem off!",
            rewardChoices = {{59765, 1}, {59766, 1}, {59767, 1}},
            rewardMoney = 156000,
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
        [25189] = {
            description = "Who are you? What happened?\n\nI was alone in my hut, meditating, " ..
                "when...\n\nAhh, I remember now. The spirits cried out, and the river swept in. I'm lucky " ..
                "that you found me here. I am old, and no longer physically able to endure the elements " ..
                "like this. Will you lead me out of here?",
            rewardMoney = 225,
        },
        [25338] = {
            description = "The wandering forest walkers that can be found meandering through the forest " ..
                "are our next target, <name>. Night elves have enlisted treants as allies to fight " ..
                "against the horde. Their movement may be slow, but their role as protectors is " ..
                "undeniable.\n\nSoon we will be able to use this power for our own benefit.\n\nFind three " ..
                "wandering forest walkers; kill them, and use the muisek vessel to shrink and capture " ..
                "them.",
            rewardMoney = 4000,
        },
        [25375] = {
            description = "The gordunni are not known to tame animals. If they're learning, this is cause " ..
                "for alarm. While the sasquatch they've tamed may be the major threat to our camp, the " ..
                "gordunni who captured him should be dealt with as well. If left, they may simply capture " ..
                "another.\n\nKill the gordunni tamers, and make sure the ogres know their efforts will " ..
                "not be tolerated!",
            rewardMoney = 4500,
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
        [25399] = {
            description = "The Hatecrest are fighting fiercely! Their leader is a priority, but we need " ..
                "to kill as many of them as we can.\n\nGo ahead of me, I'll meet you on the battlefield. " ..
                "Show them no mercy!",
            rewardMoney = 4000,
        },
        [25412] = {
            description = "We called upon the fury and flame of the One, my former master.\n\nThe Inferno " ..
                "is by His design.\n\nHis true name is never uttered, it holds His power.\n\nEach of us " ..
                "was told but a piece. Each piece engraved on a firestone.\n\nThe One's true name is " ..
                "here, in the Inferno. Seek the three stones...",
        },
        [25451] = {
            description = "You have found a pristine yeti hide that is exceptionally thick and sturdy - " ..
                "more so than even the ones you've seen from the yeti in Rage Scar.\n\nConsidering that " ..
                "Pratt McGrubben at the Feathermoon Stronghold is in the market for yeti hides, this " ..
                "particular one may be of considerable interest to him.",
            rewardMoney = 8000,
        },
        [25491] = {
            description = "This land has been scourged by fire, but it may yet renew itself.\n\nSome " ..
                "seeds deep in the soil may have withstood the scorching heat here in The Flamewake. " ..
                "These durable plants are the key to this forest's regrowth. Please, collect some of " ..
                "these seedlings for me.",
            rewardMoney = 78000,
        },
        [25531] = {
            description = "I thank you for freeing me. Let us take advantage of the distraction you've " ..
                "created and get out of here.\n\nWe must hurry before the cultists catch on.\n\nMeet me " ..
                "again when we've left this place.",
        },
        [25534] = {
            description = "As you may have seen, the ship docked to the north has its cannons blazing. " ..
                "While it's pretty fun watching the gnomes run face-first into a hail of iron, my " ..
                "bruisers keep doing it too, and it's absolutely killing my overhead expenses.\n\nI'd " ..
                "like you to try and dance through the cannonfire, get on that ship, and kill the " ..
                "taskmaster leading the cannoneers. The rest of the crew is probably a bunch of spineless " ..
                "prats; once he's down, we should be good.",
            rewardMoney = 6500,
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
        [25596] = {
            description = "Hey, <name>, you haven't seen our gunsmith, Synge, have you?\n\nI just know " ..
                "that the pirates captured him! He said that he was going to try to sell them some " ..
                "rifles, or something.\n\nWould you please look for him up at the Southsea Holdfast to " ..
                "the east? I'll bet that no-good gnome he's always traveling with, Wizzle Brassbolts, got " ..
                "him into trouble!",
            rewardMoney = 5500,
        },
        [25698] = {
            description = "Sevine's amulet is in the hands of a murloc, far to the east, on a shelf that " ..
                "overlooks the Shattershore. How it ended up in that murloc's possession, I cannot say, " ..
                "but I can state with certainty that you will find it there.\n\nI feel a stronger " ..
                "connection with Sevine than with the rest of Razelikh's servants... possibly because she " ..
                "built the Altar of Storms, upon which you resurrected me. Bring her Amulet to Lynnore, " ..
                "along with the rest.",
            rewardMoney = 8500,
        },
        [25706] = {
            description = "No number of naga deaths will bring back the Rockpool tribe, but any amount of " ..
                "revenge will help the spirits of my people rest more easily.\n\nMany of the more " ..
                "powerful Bloodwash have set up a fortress in the caverns to the northwest. Slay them, in " ..
                "the name of the Rockpool. The remaining Bloodwash have erected gladiatorial pools and " ..
                "Azsh'ir altars on our beach, where they pit my people against one another and worship " ..
                "their false god. Slay them, in the name of the Tidehunter.",
            rewardChoices = {{59403, 1}, {59404, 1}, {59405, 1}},
            rewardMoney = 17000,
        },
        [25714] = {
            description = "It's time for you to visit the Watcher. He's been in a bit of a mood lately, " ..
                "and I'm not quite sure why.\n\nHead up to the top of the mage tower and check in with " ..
                "him. I don't have any work for you here, but I'm certain that he will.",
            rewardMoney = 800,
        },
        [25793] = {
            description = "The purpose of this base was to establish a foothold in Stonetalon for " ..
                "Theramore and to open up a supply line to the night elves. The Horde, unfortunately, has " ..
                "given us one hell of a fight. Hellscream's armies are mighty and unrelenting. I haven't " ..
                "seen this type of ferocity from the Horde since the second war.\n\nNow it would appear " ..
                "that the mine the Explorers' League dug out is being used by the Horde to \"backdoor\" " ..
                "us. We need to seal that thing off!",
        },
        [25836] = {
            description = "Well, it looks like it's time for us to part ways, at least for a while. To " ..
                "the northwest, the tauren of Freewind Post are in desperate need of your assistance in " ..
                "pushing back the Grimtotem clan!\n\nYou know, you've been such a great help around here, " ..
                "I bet you're going to be their <hero/heroine> in no-time!",
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
        [25962] = {
            description = "Been all over the place. Blown all kinds of things up. I thought I might have " ..
                "some trouble carrying on the trend, what with the water and all, but it's all just a " ..
                "matter of inspiration.\n\nI found something volatile enough to make bombs out of! " ..
                "There's a bunch of kelp hanging under the terrace to the southwest. Normally kelp stores " ..
                "gas that makes it float - this kelp produces a different kind of heavy gas. It keeps it " ..
                "hanging, but also makes for great explosions.\n\nGather me some?",
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
        [25971] = {
            description = "Survival kits never have any rope. It makes no sense! Rope and bombs, that's " ..
                "all they should store. The rest of this stuff is just a waste of space.\n\nExcept maybe " ..
                "the balloon. That's coming in handy right now.\n\nI bet those Kvaldir have rope. They're " ..
                "always riding around in boats, tying knots, dressing in nets. Go take some rope from " ..
                "them! I must have it for our plan to work. It is non-optional.",
            rewardMoney = 78000,
        },
        [25996] = {
            description = "Thanks to you and the Legionnaire, Nespirah has full control of her body... " ..
                "but most of the naga don't know this yet. Once we make our escape, she will activate her " ..
                "biological defenses and destroy the naga from within.\n\nMake yourself ready... I will " ..
                "now tell Nespirah to begin the countdown.",
            rewardMoney = 78000,
        },
        [26008] = {
            description = "I simply cannot bear the thought of so many others like this warrior " ..
                "imprisoned, surrounded by naga.\n\nSomething must be done to rescue them!\n\nTry this, " ..
                "<name>. Use it on the prison cells to make them buoyant.\n\nIf we can get them to the " ..
                "surface, at least they stand a chance at being rescued.",
            rewardChoices = {{59769, 1}, {59770, 1}, {59771, 1}},
            rewardMoney = 78000,
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
        [26043] = {
            description = "By order of Overlord Krom'gar, Cragpool Lake is OFF LIMITS!\n\nThe ferocious " ..
                "beast known as Cragjaw has made the lake a death trap. Should you dispatch of Cragjaw, " ..
                "take his huge tooth as a trophy and return it to Spy-Mistress Anara for a reward.",
            rewardChoices = {{57481, 1}, {57482, 1}, {57483, 1}, {57480, 1}},
            rewardMoney = 6500,
        },
        [26067] = {
            description = "Ah, it is done! Now to test it out.\n\nTravel to the main point of conflict " ..
                "within Greatwood Vale and use my voodoo stick on the Krom'gar marauders battling the " ..
                "Grimtotem. My voodoo magic should renew their vigor and allow them to crush our " ..
                "enemies!\n\nGo now, <name>!",
            rewardMoney = 8000,
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
        [26185] = {
            description = "I believe that the taint of the Blasted Lands has finally exerted its " ..
                "influence over my friend Wormthorn. His experiment has failed, and his great-tree now " ..
                "only serves as a focus for the demons to rally around.\n\nThe tree must come down, and " ..
                "Wormthorn with it. Speak with the Cenarion Observer on the other side of town; she " ..
                "should have some idea how to proceed.\n\n<name>: the act we are about to commit must not " ..
                "be made known to the townspeople of Surwich. Morale is low enough as-is.",
            rewardMoney = 900,
        },
        [26196] = {
            description = "The dwarves of Dun Modr fight day and night against the Dark Iron that have " ..
                "invaded their old home. While we cannot yet send our sentinels to risk their lives for " ..
                "them, we do send much needed supplies that they may sustain their vigil.\n\nIf you " ..
                "would, bring this package to Longbraid the Grim, north of here. His men must certainly " ..
                "need its contents.",
            rewardMoney = 900,
        },
        [26621] = {
            description = "The weapons the Horde has supplied us with will be more than enough. The four " ..
                "of us should split up and arm as many Dragonmaw workers and merchants as we " ..
                "can.\n\nDon't underestimate us, <name>. You'll find even our tradesmen are ferocious in " ..
                "battle.\n\nLet's do as much damage as possible. Arm a squad of Dragonmaw and lay waste " ..
                "to the fel enforcers and warlocks that have intimidated my people for so long. Then meet " ..
                "back here to launch our final strike!",
            rewardChoices = {{63889, 1}, {63890, 1}},
            rewardMoney = 270000,
        },
        [26778] = {
            description = "Can you hear them, <name>? There's so many of them. They wander their graves, " ..
                "shuffling across the cold ground on rotting limbs.\n\nThe dead cry out in the still air. " ..
                "They suffer in their own flesh, forced from sleep! Every night I venture to the " ..
                "graveyard to put more of them to rest, but it's never enough.\n\nHelp me, <name>. Put " ..
                "the ghouls that swarm Raven Hill Cemetery out of their misery. Strike down as many as " ..
                "you can.",
            rewardChoices = {{60921, 1}, {60922, 1}, {60923, 1}},
            rewardMoney = 1700,
        },
        [27317] = {
            description = "A tauren rattle lays here, exuding supernatural power. Its keepers slain, the " ..
                "artifact is undefended.\n\nSurely the brave will have some insight into its significance?",
            rewardMoney = 5500,
        },
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
        [27717] = {
            description = "<An ancient, slightly cracked slab of stone with an immense number of " ..
                "inscriptions etched on all sides of it. You're unable to decipher the language, but the " ..
                "sheer amount of text and the semi-ornate nature of the stone suggest that this might " ..
                "carry significant value.>\n\n< Elendri Goldenbrow, back with the Nespirah survivors, was " ..
                "looking for something exactly like this.>",
            rewardChoices = {{59693, 1}, {59694, 1}, {59695, 1}},
            rewardMoney = 78000,
        },
        [28001] = {
            description = "We may be safe here, but there are a lot of Wildhammer who could still use " ..
                "support. Our wing can offer that, but we need to keep bolsterin' our forces if we're " ..
                "going to clear the Twilight completely.\n\nI'm going to have words with Colin " ..
                "Thundermar. Only a coward turns down the callin' of his people, especially in a time " ..
                "this dire.\n\nGo to Thundermar, find Colin and get a real explanation out of'm. I won't " ..
                "be putting up with cowardice in a Wildhammer leader.",
            rewardMoney = 45000,
        },
        [29308] = {
            description = "You are the first mortal to witness a dragon council, <name>, and among the " ..
                "only beings in Azeroth to take part in the choosing of an Aspect.\n\nMy ascension has " ..
                "endowed me with incredible power. I have taken the liberty to strengthen Tarecgosa's " ..
                "bond with you, though she will require a more... permanent home.\n\nI would have you " ..
                "venture one last time into the Plane of Fire and bring me the heart of Ragnaros.\n\nWhen " ..
                "next we meet, I will be able to suitably thank you for all that you have done.",
            rewardMoney = 282000,
        },
        [29324] = {
            description = "Have you met Sister Aquinne? She and I grew up together in Dolanaar, and she " ..
                "recently came to the city to study at the Temple of the Moon. We decided to go for a " ..
                "boat ride, but the clumsy oarsman managed to capsize the craft!\n\nWhen we got back to " ..
                "the shore, Aquinne's moon pendant was missing. The lakes in Darnassus are full of giant " ..
                "catfish who will gobble up anything shiny!\n\nI've been catching them nonstop, hoping to " ..
                "find the one with her pendant. I don't suppose you want to help?",
            rewardItems = {{67414, 1}},
            rewardMoney = 20000,
        },
        [29757] = {
            description = "Have you heard about the crisis we're having at the pools?\n\nToads have moved " ..
                "in and are spawning like crazy! It's become a real problem for the lotus " ..
                "farmers.\n\nCoincidentally, I make a jam out of gelatinous toadspawn. I call it " ..
                "\"Bottletoads\" and it's a big hit with the kids around here. Can't keep any in " ..
                "stock.\n\nIf you're heading to the pools, you'd be doing everyone a favor by uh... " ..
                "liberating some of those toad eggs.\n\nInto this bottle. For me.\n\nJust look for " ..
                "bubbles and scoop right in!",
            rewardMoney = 102000,
        },
        [30056] = {
            description = "Brave <class>, you could not have arrived at a better time. My daughter is " ..
                "missing!\n\nI've got a suspicion that the virmen took her down into that stinking little " ..
                "warren of theirs. I'm too old to fight virmen, and my farmhand is already exhausted from " ..
                "fighting them off all morning.\n\nCould you look for her?",
            rewardMoney = 102000,
        },
        [30265] = {
            description = "I've been staring down into the waters of the lake, pondering life, love, and " ..
                "everything beautiful, and suddenly I realized that the sparkles in the water aren't just " ..
                "a reflection of my radiant personality, there are actually some sort of shining objects " ..
                "down there! Surely valuable.\n\nWould you mind taking a drip and relieving the lake's " ..
                "depths of its mysterious sparkles? Pretty please?",
            rewardMoney = 114000,
        },
        [30466] = {
            description = "Training these savages has been quite a task, <name>.\n\nFinding ways to " ..
                "motivate them was easy enough; the problem is keeping them motivated.. and focused... " ..
                "and awake.\n\nNow that you're back, you can help me in getting the less disciplined " ..
                "Hozen moving, if you catch my drift. I'll leave the method up to you.",
            rewardMoney = 98000,
        },
        [30489] = {
            description = "Say, if you really are here to help, I could use me some needles off them " ..
                "sprites in Pranksters' Hollow.\n\nThe grummles don't believe in luck they can't smell. " ..
                "They'll pay better for yaks that have that fresh needle scent.",
            rewardMoney = 106000,
        },
        [30515] = {
            description = "The yaungol have always been a difficult, proud people, but never this violent " ..
                "or aggressive.\n\nI do not know what has prompted this change in their behavior, but we " ..
                "don't have time to find out, now. We fear for our lives and livelihoods as long as " ..
                "Ur-Bataar, leader of the Bataari yaungol, lives.\n\nGo, set the banner in his camp " ..
                "ablaze to challenge him, and then defeat him in battle. Only then will we be secure.",
            rewardMoney = 204000,
        },
        [30666] = {
            description = "Normally, my day consists of catching fish, and then eating the fish I caught, " ..
                "followed by sleeping. Note that I did not include \"fight with a crocolisk\" in that " ..
                "list of activities.\n\nYou look like a handy <class>. Can you go get rid of some of " ..
                "these crocolisks, so I can get back to my regular routine? The crocolisks normally keep " ..
                "to themselves up at Kea Krak, to the northwest.",
            rewardMoney = 102000,
        },
        [30723] = {
            description = "Hmm... If Shado-Master Chong trusted you, perhaps you can help us.\n\nThe " ..
                "yaungol are our enemies.\n\nStill, we must prove we are better than they. We will show " ..
                "them honor in death.\n\nAs after most battles, the carrion birds have begun gathering. " ..
                "Thin their numbers, so the bodies of our foes will not be desecrated. They've gathered " ..
                "at the battlefield to the west.",
            rewardMoney = 106000,
        },
        [30746] = {
            description = "<The roar bellows out again, louder and more fierce than any of the yetis " ..
                "you've encountered so far. Again, a grummle voice replies...>\n\nEep! Please, great Kota " ..
                "Kon, forgive grummle. Let me go, I'll bring lots of kafa right away! Promise!\n\n<The " ..
                "beast called Kota Kon answers with another meaty roar.>",
            rewardMoney = 106000,
        },
        [30806] = {
            description = "Many have perished here. We will need to honor them properly, which means " ..
                "gathering the makings of incense of life.\n\nIt doesn't just smell nice - it has " ..
                "restorative properties, and can even help plants grow. Maybe I can get a whiff of the " ..
                "ingredients to get me back on my feet.\n\nThe materials can be found on creatures around " ..
                "here - except for the spices, which were stolen by the mercenaries who pillaged the " ..
                "village.",
            rewardMoney = 102000,
        },
        [31251] = {
            description = "Yeah, yeah.\n\nEveryone knows us goblins do tinkering. And explosives. And... " ..
                "well, ya' know, the less reputable stuff.\n\nBut what nobody knows is that I'm really a " ..
                "great chef! It's a hobby of mine.\n\nGather us up some meaty bits from the creatures " ..
                "around here, and I'll cook us up the best meals ANYWHERE!\n\nAnd I promise, I'll only " ..
                "use three or four percent rocket fuel.",
            rewardMoney = 102000,
        },
        [31354] = {
            description = "That was some amazing work you and the captain did out there, $p! It's an " ..
                "honor to have you on the crew.\n\nOh! And Ju Lien survived! He swam ashore just after " ..
                "you started letting the harpoons fly. He was raving about some kind of gigantic egg or " ..
                "something that washed in with Jiao.\n\nGo check up on him, will you? He's probably " ..
                "hauled it out of the water by now.",
            rewardMoney = 114000,
        },
        [31590] = {
            description = "Great work so far, <name>! You are going to be a pro at this pet stuff before " ..
                "you know it. Now it's time to catch a pet of your own!\n\nHead back out and find a " ..
                "battle pet to fight, engage it in battle, and throw your trap once it's low on health. " ..
                "Bring your catch back for me to see once you are finished.\n\nRemember, you need at " ..
                "least one pet at level 3 to use your trap!",
            rewardMoney = 114000,
        },
        [31872] = {
            description = "Just as the land continues to grow, my team is stronger than ever. Are you " ..
                "sure you wish to combat me? There is no shame in admitting defeat now.",
            rewardMoney = 114000,
        },
        [31941] = {
            description = "Grandpa always said, \"A squash a week, and your tail won't reek.\"\n\n<Yoon " ..
                "subtly sniffs the air.>\n\nYup. I think it's been about a week. Could you help me plant " ..
                "a Jade Squash?",
            rewardMoney = 57000,
        },
        [32275] = {
            description = "The Zandalari train skyscreamers to become ferocious beasts in the skies. The " ..
                "spiritbinders require endless sacrifices - of our people - to be brought to them. And, " ..
                "the jaguar warriors venture ever closer toward the heart of our camp.\n\nFind them in " ..
                "Za'Tual and remove the threat.",
            rewardMoney = 114000,
        },
        [32527] = {
            description = "The Court of Bones crawls with mogu forces. Endlessly do they perform their " ..
                "rituals of lightning and thunder.\n\nIf our mission to take this island is to succeed, " ..
                "then we cannot allow them to hold such a strategic position.\n\nThey must be eliminated.",
            rewardMoney = 114000,
        },
    },
    npcs = {
        [3667] = {
            spawns = {
                [148] = {
                    {41.4, 60.2}, {41.4, 60.6}, {41.8, 59.2}, {42.4, 58.4}, {42.4, 60.4}, {42.4, 60.6},
                    {42.4, 62.2}, {42.4, 62.6}, {42.6, 60.6}, {42.8, 62.2}, {42.8, 62.6}, {43.2, 59.4},
                    {43.4, 59.8}, {43.6, 59.2}, {43.6, 60}, {43.6, 61.6},
                },
            },
            zoneID = 148,
        },
        [4949] = {spawns = {[1637] = {{32, 37.8}, {32.6, 37.6}}}, zoneID = 1637},
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
        [11863] = {spawns = {[405] = {{38.8, 27.2}}}, zoneID = 405},
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
        [30208] = {
            spawns = {
                [67] = {
                    {68.4, 58}, {68.4, 60}, {68.4, 63.2}, {68.6, 60}, {68.6, 63.2}, {69.2, 57}, {69.4, 58.6},
                    {69.4, 61.2}, {69.6, 59}, {69.6, 61.2}, {70, 60.2}, {70.2, 57.4}, {70.2, 58.4},
                    {70.2, 62.4}, {70.2, 62.6}, {70.6, 59.4}, {70.6, 59.6}, {70.8, 56.8}, {70.8, 58.4},
                    {70.8, 61.2}, {71.8, 62.8}, {72.4, 62.2}, {72.6, 62.2},
                },
            },
            zoneID = 67,
        },
        [34723] = {
            spawns = {
                [14] = {
                    {34.8, 32}, {35.6, 31}, {36.4, 3.6}, {37.2, 29.4}, {38.2, 28.6}, {38.4, 19.8},
                    {38.4, 23.8}, {39.4, 19.2}, {39.4, 22.6}, {39.8, 19.2}, {39.8, 27.2}, {41.2, 20.6},
                    {41.4, 19.2}, {41.6, 19.4}, {42.2, 19.8}, {42.4, 18.4}, {42.6, 17.8}, {42.6, 20.2},
                    {43, 17.2}, {43.2, 20.8}, {43.4, 16.2}, {43.4, 24.4}, {43.8, 22}, {45, 13.6},
                    {45.4, 12.6}, {45.6, 11.6},
                },
                [17] = {
                    {34, 57.4}, {35.2, 56.4}, {37.2, 33.2}, {38.2, 63.6}, {39, 62.2}, {39.4, 53.8},
                    {39.8, 53.6}, {41.6, 30.6}, {42.4, 30.2}, {43.2, 29.4}, {44, 50}, {44.6, 48}, {45, 47.2},
                    {46.6, 27.4}, {47, 42}, {47.6, 40.4}, {48.2, 26.6}, {48.8, 48.8}, {49.6, 48.6},
                    {50.2, 21.6}, {51, 19.8}, {51.4, 24.8}, {51.8, 24.6}, {52.6, 30}, {53.2, 23.8},
                    {54.4, 27.8}, {54.6, 45.6}, {56.4, 10.8}, {57, 25.2}, {57.4, 20.4}, {58, 19.6},
                    {59.2, 40.8}, {60.4, 8.8}, {61.2, 20.8}, {62.2, 37.6}, {63.2, 14}, {64, 34.8},
                    {65.4, 15.2}, {65.8, 14.2}, {66.6, 30.2},
                },
                [215] = {
                    {32.4, 19.4}, {32.4, 20}, {32.8, 17.8}, {33.4, 16.4}, {33.6, 19.6}, {34, 25.8},
                    {34.2, 27.2}, {34.4, 27.8}, {35.8, 33.6}, {36.2, 34.8}, {38, 15.2}, {38.2, 38.2},
                    {39.4, 12.6}, {41.6, 14.4}, {41.8, 12.2}, {42.6, 12}, {43.8, 11.8}, {44.2, 39.4},
                    {45.4, 11.4}, {46, 13.6}, {46.2, 39}, {47, 11.2}, {47, 13.4}, {47.8, 13.2}, {49.4, 11.6},
                    {49.4, 13.8}, {49.6, 38}, {50, 11.8}, {52, 14.6}, {53.8, 12.4}, {54, 14.6}, {55.6, 33},
                    {57.2, 14}, {57.4, 31.6}, {57.8, 11.8}, {58.8, 29.4}, {59.6, 13.4}, {61.2, 27.6},
                    {63.4, 25}, {64.4, 23.4},
                },
                [1637] = {
                    {28.4, 58.2}, {30.2, 56.4}, {33.4, 55.8}, {34.8, 56.2}, {37.4, 58}, {42.2, 65.4},
                    {43, 66.2}, {43.8, 67.4}, {44, 67.6}, {44.4, 68.8}, {45, 69.4}, {46.8, 72.4},
                    {47.2, 73.2}, {47.6, 74}, {48.8, 76.4}, {50.2, 86.4}, {50.2, 93.2}, {50.4, 91},
                },
                [1638] = {
                    {13.4, 19.6}, {13.6, 20.6}, {14, 23.6}, {14.2, 25.4}, {14.2, 27.6}, {14.4, 27.2},
                    {14.6, 26.6}, {14.6, 28}, {14.8, 31}, {15.4, 34.8}, {25.6, 72.4},
                },
                [4709] = {
                    {34, 16.8}, {34.8, 16.6}, {35.4, 16.2}, {36.8, 15.4}, {38.4, 14.2}, {38.6, 23.8},
                    {40, 13.2}, {41, 22}, {41.4, 12.2}, {42, 20.8}, {42.6, 20.2}, {43.4, 19},
                },
            },
            zoneID = 17,
        },
        [35918] = {spawns = {[4720] = {{35.4, 75.6}}}, zoneID = 4720},
        [68651] = {subName = "Leader of the Kirin Tor"},
    },
    objects = {},
    items = {},
}
