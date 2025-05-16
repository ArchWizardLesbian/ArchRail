return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Joker={
            j_arch_pink_joker = {
                name = 'Party Joker',
                text = { ""
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
                text = { "{C:green}#1# in #2#{} chance to be destroyed at",
                         "end of blind, otherwise, levels {C:attention}Two Pair{}"
                }
            },
            j_arch_deadcard = {
                name = 'Faded Memory',
                text = { "{C:green}Fixed 50%{} chance to retrigger",
                         "{C:attention}held in hand{} effects"
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
                },
            },
            j_arch_chaste_joker = {
                name = "Chaste Joker",
                text = {
                    "Each {C:hearts}Hearts{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                },
            },
            j_arch_patient_joker = {
                name = "Patient Joker",
                text = {
                    "Each {C:spades}Spades{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                },
            },
            j_arch_temperate_joker = {
                name = "Temperate Joker",
                text = {
                    "Each {C:clubs}Clubs{}",
                    "held in hand",
                    "gives {C:chips}+#1#{} Chips",
                },
            },
            j_arch_minotaur = {
                name = "Minotaur",
                text = {
                    "Each played card",
                    "gives {C:chips}+#1#{} Chips for",
                    "each {C:money}$1{} you have",
                    "when scored",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                    "{C:inactive}(Cobalt + Bull){}"
                },
            },
            j_arch_neutral_face = {
                name = "Neutral Face",
                text = {
                    "Played {C:attention}face{} cards",
                    "give {X:red,C:white}X#1#{} Mult",
                    "when scored",
                },
            },
            j_arch_frowny_face = {
                name = "Frowny Face",
                text = {
                    "Played {C:attention}face{} cards",
                    "give {X:red,C:white}X#1#{} Mult",
                    "when scored",
                },
            },
            j_arch_ametr = { --1 fusions so far
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
            j_arch_moonst = { --0 fusions so far
                name = "Moonstone",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_quartz = { --0 fusions so far
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
            j_arch_cobalt = { --1 fusions so far
                name = "Cobalt",
                text = {
                    "Each played card has a {C:green}#1# in #2#{}",
                    "chance to be {C:attention}retriggered{} #3# time",
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
        Voucher={},
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
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}