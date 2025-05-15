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
                },
            },
            j_arch_inked = {
                name = "Inked Joker",
                text = {
                    "Gains {X:red,C:white}X0.04{} Mult for",
                    "each {C:attention}Joker{} slot when",
                    "a {C:purple}Tarot{} card is used",
                    "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive})",
                },
            },
            j_arch_ametr = {
                name = 'Ametrine',
                text = { "{C:mult}+#1#{} Mult",
                         "{C:spectral,E:1}Fusion Material{}"
                }
            },
            j_arch_sapphire = {
                name = 'Sapphire',
                text = { "{C:chips}+#1#{} Chips",
                         "{C:spectral,E:1}Fusion Material{}"
                }
            },
            j_arch_citrine = {
                name = 'Citrine',
                text = { "Earn {C:money}+$#1#{} at end of blind",
                         "{C:spectral,E:1}Fusion Material{}"
                }
            },
            j_arch_moonst = {
                name = "Moonstone",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}",
                    "{C:spectral,E:1}Fusion Material{}"
                },
            },
            j_arch_quartz = {
                name = "Quartz",
                text = {
                    "{X:red,C:white}X0.5{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Quartz included",
                    "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive})",
                },
            },
            j_arch_obsid = {
                name = "Obsidian",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:tarot}Tarot{} card",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive}(Must have room)",
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