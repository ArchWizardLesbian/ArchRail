return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Joker={
            j_arch_pink_joker = {
                name = 'Party Joker',
                text = { "Played {C:attention}Wild Cards{} give",
                         "{C:mult}+?{} Mult and {C:chips}+?{} Chips",
                         "when scored"
                }
            },
            j_arch_brown_joker = {
                name = 'Chocolate Bar',
                text = { "Get a {C:attention}Double Tag{} at end of boss blind",
                         "{C:inactive}(Is destroyed after {C:attention}#1#{C:inactive} triggers){}"
                }
            },
            j_arch_pretzel = {
                name = 'Pretzel',
                text = { "{C:mult}+#3#{} Mult if played hand",
                         "contains a Two Pair",
                         "{C:green}#1# in #2#{} chance to",
                         "be destroyed at end of blind"
                }
            },
            j_arch_deadcard = {
                name = 'Seismograph',
                text = { "{C:green}Fixed 50%{} chance to retrigger",
                         "{C:attention}held in hand{} effects"
                }
            },
            j_arch_nickel = {
                name = "Nickel",
                text = {
                    "Each {C:gold}Gold Sealed{} card",
                    "held in hand at end",
                    "of round earns {C:money}+$#1#{}",
                },
            },
            j_arch_geologist = {
                name = "Geologist",
                text = {
                    "{C:spectral}Primers{} are {X:spectral,C:white}X#1#{} more common",
                },
            },
            j_arch_redherr = {
                name = "Red Herring",
                text = {
                    "Discarded {C:attention}Aces of{} {C:hearts}Hearts{}",
                    "give {C:red}+#1#{} discards"
                }
            },
            j_arch_lovesick = {
                name = "Lovesick Joker",
                text = {
                    "{C:mult}+#1#{} Mult per remaining Discard",
                    "Gains {C:mult}+#2#{} Mult when a {C:hearts}Hearts{} card is destroyed"
                }
            },
            j_arch_esper = {
                name = "Esper",
                text = {
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, and",
                    "{C:dark_edition}Polychrome{} cards",
                    "appear {C:attention}#1#X{} more often",
                }
            },
            j_arch_todust = {
                name = 'To Dust',
                text = { "{C:green}Fixed 75%{} chance to retrigger",
                         "{C:attention}held in hand{} effects of",
                         "{C:spades}Spades{} and {C:clubs}Clubs{} twice",
                         "{C:inactive}(Faded Memory + Blackboard){}"
                }
            },
           j_arch_prisma = {
                name = 'Iridescent Joker',
                text = { "{C:attention}+#1# Selection Limit{} per {C:attention}#2# Glass Cards{} or",
                         "{C:attention}Wild Cards{} in {C:attention}full deck{}, picks lesser value",
                         "{C:inactive}(Currently {C:attention}+#3#{}{C:inactive} Selection Limit){}",
                         "{C:inactive}(Party Joker + Glass Joker){}"
                }
            },
            j_arch_gamblecore = {
                name = 'GamblerTempName',
                text = { "{C:green}+#1# Odds{} per {C:attention}#2# Wild Cards{}",
                         "in {C:attention}full deck{}",
                         "{C:inactive}(Currently {C:attention}+#3#{}{C:inactive} Odds){}",
                         "{C:inactive}(Party Joker + Oops! All Sixes){}"
                }
            },
            j_arch_pyromancer = {
                name = "Pyromancer",
                text = {
                    "{X:mult,C:white}X#1#{} Mult per {C:purple}Tarot{}",
                    "card used this run",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive})",
                    "{C:inactive}(Ametrine + Fortune Teller){}"
                },
            },
            j_arch_inked = {
                name = "Inked Joker",
                text = {
                    "Gains {X:red,C:white}X0.04{} Mult for",
                    "each {C:attention}Joker{} slot when",
                    "a {C:purple}Tarot{} card is used",
                    "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive})",
                    "{C:inactive}(Obsidian + Joker Stencil){}"
                },
            },
            j_arch_model = {
                name = "Photoshoot",
                text = {
                    "First played {C:attention}face",
                    "card earns {C:money}$#1#{}",
                    "when scored",
                    "{C:inactive}(Citrine + Photograph){}"
                },
            },
            j_arch_charitous_joker = {
                name = "Charitous Joker",
                text = {
                    "Each {C:diamonds}Diamonds{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                    "{C:inactive}(Sapphire + Greedy Joker){}"
                },
            },
            j_arch_chaste_joker = {
                name = "Chaste Joker",
                text = {
                    "Each {C:hearts}Hearts{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                    "{C:inactive}(Sapphire + Lusty Joker){}"
                },
            },
            j_arch_patient_joker = {
                name = "Patient Joker",
                text = {
                    "Each {C:spades}Spades{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                    "{C:inactive}(Sapphire + Wrathful Joker){}"
                },
            },
            j_arch_temperate_joker = {
                name = "Temperate Joker",
                text = {
                    "Each {C:clubs}Clubs{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                    "{C:inactive}(Sapphire + Gluttonous Joker){}"
                },
            },
            j_arch_minotaur = {
                name = "Minotaur",
                text = {
                    "Each played {C:diamonds}Diamonds{} card",
                    "gives {C:chips}+#1#{} Chips for",
                    "each {C:money}$#2#{} you have",
                    "when scored",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
                    "{C:inactive}(Greedy Joker + Bull){}"
                },
            },
            j_arch_ecstatic_face = {
                name = "Ecstatic Face",
                text = {
                    "Played {C:attention}face{} cards",
                    "give {C:red}+#1#{} Mult",
                    "per {C:money}$#2#{} when scored",
                    "{C:inactive}(Sunstone + Smiley Face){}"
                },
            },
            j_arch_neutral_face = {
                name = "Neutral Face",
                text = {
                    "Played {C:attention}face{} cards",
                    "give {X:mult,C:white}x#1#{} Mult",
                    "when scored",
                    "{C:inactive}(Ametrine + Smiley Face){}"
                },
            },
            j_arch_frowny_face = {
                name = "Frowny Face",
                text = {
                    "Played {C:attention}face{} cards",
                    "are retriggered {C:attention}2{} times and",
                    "give {X:mult,C:white}X#1#{} Mult",
                    "when scored",
                    "{C:inactive}(Cobalt + Neutral Face){}"
                },
            },
            j_arch_choco_pretz = {
                name = 'Chocolate-Dipped Pretzel',
                text = { "{C:green}#1# in #2#{} chance to be destroyed at",
                         "end of blind, otherwise, gives a",
                         "{C:attention}Double Tag{} and levels {C:attention}Two Pair{}",
                         "{C:inactive}(Chocolate Bar + Pretzel){}"
                }
            },
            j_arch_joker_undefined_404 = {
                name = 'ERROR',
                text = { "{C:dark_edition}+#1# Mult{}",
                         "{C:inactive}(Misprint + Misprint){}"
                }
            },
            j_arch_twilight = {
                name = 'Twilight',
                text = { "{C:attention}+#1#{} Levels to",
                         "final played hand",
                         "{C:inactive}(Moonstone + Dusk){}"
                }
            },
            j_arch_scholarship = {
                name = 'Scholarship',
                text = { "When round begins,",
                         "add an {C:attention}Ace{} with a random",
                         "{C:attention}suit{} and a random",
                         "{C:attention}seal{} to your hand",
                         "{C:inactive}(Scholar + Certificate){}"
                }
            },
            j_arch_rna = {
                name = 'RNA',
                text = {
                    "If {C:attention}first hand{} of round",
                    "has exactly {C:attention}2{} cards, add #1#",
                    "permanent copy of each to deck",
                    "and draw them to {C:attention}hand",
                    "{C:inactive}(Quartz + DNA){}"
                }
            },
            j_arch_forefire = {
                name = 'Forest Fire',
                text = {
                    "If discarded hand has",
                    "exactly {C:attention}1{} card, this",
                    "Joker gains {X:mult,C:white}X#1#{} Mult and",
                    "discarded card is destroyed",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult){}",
                    "{C:inactive}(Ruby + Campfire){}"
                }
            },
            j_arch_ametr = { --2 fusions so far
                name = 'Ametrine',
                text = { "{C:mult}+#1#{} Mult",
                         "{C:spectral,E:1}Fusion Material{}"
                }
            },
            j_arch_sapphire = { --4 fusions so far
                name = 'Sapphire',
                text = { "{C:chips}+#1#{} Chips",
                         "{C:spectral,E:1}Fusion Material{}"
                }
            },
            j_arch_citrine = { --1 fusions so far
                name = 'Citrine',
                text = { "Earn {C:money}+$#1#{} at end of blind",
                         "{C:spectral,E:1}Fusion Material{}"
                }
            },
            j_arch_moonst = { --1 fusions so far
                name = "Moonstone",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_quartz = { --1 fusions so far
                name = "Quartz",
                text = {
                    "{X:red,C:white}X0.5{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Quartz included",
                    "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive})",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_obsid = { --1 fusions so far
                name = "Obsidian",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:tarot}Tarot{} card",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive}(Must have room)",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_sunstone = { --1 fusions so far
                name = "Sunstone",
                text = {
                    "{C:chips}+#1#{} Chip for",
                    "each {C:money}$1{} you have",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_cobalt = { --2 fusions so far
                name = "Cobalt",
                text = {
                    "Each played card has a {C:green}#1# in #2#{}",
                    "chance to be retriggered {C:attention}#3#{} time",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_ruby = { --1 fusions so far
                name = "Ruby",
                text = {
                    "If {C:attention}first discard{} of round",
                    "has only {C:attention}1{} card, destroy it",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
        },
        Enhanced = {},
        Other={},
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={
            v_arch_alchemy={
                name = "Sulphur",
                text = {
                    "{C:spectral}Primers{} are {X:spectral,C:white}X#1#{} more common",
                },
            },
            v_arch_alchemy_plus={
                name = "Brimstone",
                text = {
                    "{C:spectral}Primers{} are {X:spectral,C:white}X#1#{} more common",
                },
            },
        },
        Partner={
            pnr_arch_pretzelbuddy={
                name = "Crispy",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "level {C:attention}Two Pair{}",
                    "at end of blind",
                },
            },
        }
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_arch_primer= "Primer",
        },
        high_scores={},
        labels={
            arch_primer= "Primer",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
            pnr_arch_pretzelbuddy_1={
                "I will burn your house down"
            },
            pnr_arch_pretzelbuddy_2={
                "You're such a good person"
            },
            pnr_arch_pretzelbuddy_3={
                "Sometimes all you need is",
                "a little {C:attention}crisp{} in life",
                "{C:inactive,s:0.4}it's me, I'm the crisp"
            },
            pnr_arch_pretzelbuddy_4={
                "I hate {C:attention}The Arm{}, worst blind"
            },
            pnr_arch_pretzelbuddy_5={
                "I love {C:attention}The Arm{}, I hope we don't have",
                "to go against {C:attention}The Club{} or some shit"
            },
            pnr_arch_pretzelbuddy_6={
                "I'm a bad person I think...",
                "ok, that was a lie, sorry"
            },
            pnr_arch_pretzelbuddy_7={
                "I am invicible"
            },
            pnr_arch_pretzelbuddy_8={
                "Mmmmm, thinking about fire rn"
            },
            pnr_arch_pretzelbuddy_9={
                "{C:attention}Momma{} wants {C:attention}Vodka{}"
            },
            pnr_arch_pretzelbuddy_10={
                "I love you, you're so cool"
            },
            pnr_arch_pretzelbuddy_11={
                "Play more {C:attention}Two Pairs{},",
                "please, I am begging you, this",
                "is litteraly all I am capable of"
            },
            pnr_arch_pretzelbuddy_12={
                "You suck at this game"
            },
            pnr_arch_pretzelbuddy_13={
                "Do you think you're better than me?"
            },
            pnr_arch_pretzelbuddy_14={
                "The {C:attention}Jack of Clubs{} looks kinda hot, ngl"
            },
            pnr_arch_pretzelbuddy_15={
                "The {C:attention}Queen of Clubs{} looks kinda hot, ngl"
            },
            pnr_arch_pretzelbuddy_16={
                "{C:attention}Jacks{} always think they're so fucking cool,",
                "fucking {C:attention}Jacks{}"
            },
            pnr_arch_pretzelbuddy_17={
                "I hate royalty, think they're so good"
            },
            pnr_arch_pretzelbuddy_18={
                "Do you think {C:attention}Fantasy{} is free later tonight?"
            },
            pnr_arch_pretzelbuddy_19={
                "I love arson"
            },
            pnr_arch_pretzelbuddy_20={
                "I think I might be bipolar"
            },
            pnr_arch_pretzelbuddy_21={
                "I'm sorry I'm like this"
            },
            pnr_arch_pretzelbuddy_22={
                "Why was I cursed to have no limbs"
            },
            pnr_arch_pretzelbuddy_23={
                "More {C:attention}Two Pair{}"
            },
            pnr_arch_pretzelbuddy_24={
                "I like {C:attention}Two Pairs{}"
            },
            pnr_arch_pretzelbuddy_25={
                "{C:attention}Momma{} wanna see {C:attention}Two Pair{}"
            },--if adding more crispy quips, please also modify the partner lua to check for higher numbers
        },
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}