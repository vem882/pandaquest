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
        [12207] = {
            description = "Long ago, powerful druids planted a tree to the northeast of here.\n\nIt was " ..
                "called Vordrassil and it was to be a world tree. It is not known why, but after the tree " ..
                "was fully grown, the druids decided it needed to be destroyed.\n\nEver since we arrived " ..
                "here, the earth has spoken to me, <name>. Its cries of pain come from the places where " ..
                "Vordrassil's remains fell on the ground.\n\nCorrupting ooze roams those places. Bring me " ..
                "samples of it so we may begin to heal the land.",
            rewardChoices = {{38719, 1}, {39023, 1}, {39052, 1}, {39090, 1}},
        },
        [12299] = {
            description = "It's good to meet you. Let us celebrate our pact by partaking in some good old " ..
                "fashioned Horde-killing.\n\nYou'll find marauders from Conquest Hold just outside our " ..
                "town, west of here. Why don't you head out there and hunt them like the filthy animals " ..
                "they are?\n\nLet's see if our new allies can back all their talk with some action.",
            rewardChoices = {{38762, 1}, {38760, 1}, {38761, 1}},
            rewardMoney = 112000,
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
        [12631] = {
            description = "Crafted of bone and dripping with blood, this choker is of intricate and " ..
                "deliberate design.\n\nGazing upon it overwhelms you with an ominous presence - one that " ..
                "compels you to wear it. You fight the urge, and resolve to bring it back to Ebon " ..
                "Watch.\n\nIf anyone can explain this, a death knight can....",
            rewardMoney = 46000,
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
        [29308] = {
            description = "You are the first mortal to witness a dragon council, <name>, and among the " ..
                "only beings in Azeroth to take part in the choosing of an Aspect.\n\nMy ascension has " ..
                "endowed me with incredible power. I have taken the liberty to strengthen Tarecgosa's " ..
                "bond with you, though she will require a more... permanent home.\n\nI would have you " ..
                "venture one last time into the Plane of Fire and bring me the heart of Ragnaros.\n\nWhen " ..
                "next we meet, I will be able to suitably thank you for all that you have done.",
            rewardMoney = 282000,
        },
        [31872] = {
            description = "Just as the land continues to grow, my team is stronger than ever. Are you " ..
                "sure you wish to combat me? There is no shame in admitting defeat now.",
            rewardMoney = 114000,
        },
    },
    npcs = {
        [4949] = {spawns = {[1637] = {{32, 37.8}, {32.6, 37.6}}}, zoneID = 1637},
    },
    objects = {},
    items = {},
}
