SMODS.Rarity({
	key = "primer",
	badge_colour = G.C.SECONDARY_SET.Spectral,
	pools = {
		["Joker"] = true,
	},
	default_weight = 0.025
})

SMODS.Joker({
	key = "ametr",
	atlas = "prim",
	pos = { x = 0, y = 0 },
	rarity = "arch_primer",
	cost = 6,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
})

SMODS.Joker({
	key = "sapphire",
	atlas = "prim",
	pos = { x = 1, y = 0 },
	rarity = "arch_primer",
	cost = 6,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { chips = 30 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
})

SMODS.Joker({
	key = "citrine",
	atlas = "prim",
	pos = { x = 2, y = 0 },
	rarity = "arch_primer",
	cost = 6,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { dollars = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
})

SMODS.Joker({
	key = "moonst",
	atlas = "prim",
	pos = { x = 0, y = 1 },
	rarity = "arch_primer",
	cost = 7,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { odds = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    
	calculate = function(self, card, context)
        if context.before and context.main_eval and pseudorandom('vremade_space') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end,

	in_pool = function(self, args)
        return false
    end
})

SMODS.Joker({
	key = "quartz",
	atlas = "prim",
	pos = { x = 1, y = 1 },
	rarity = "arch_primer",
	cost = 7,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.jokers and (((math.max(1,(G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_arch_quartz", true)))/2)) or 1 } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = (((math.max(1,(G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_arch_quartz", true)))/2))
            }
        end
    end,

	in_pool = function(self, args)
        return false
    end
})

FusionJokers.fusions:add_fusion("j_arch_sapphire", nil, false, "j_arch_ametr", nil, false, "j_arch_obsid", 2)
SMODS.Joker({
	key = "obsid",
	atlas = "prim",
	pos = { x = 2, y = 1 },
	rarity = "arch_primer",
	cost = 7,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { odds = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and pseudorandom('arch_obsid') < G.GAME.probabilities.normal / card.ability.extra.odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            return {
                func = function()
                    -- This is for retrigger purposes, Jokers need to return something to retrigger
                    -- You can also do this outside the return and `return nil, true` instead
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card {
                                        set = 'Tarot',
                                        key_append = 'arch_obsid' -- Optional, useful for checking the source of the creation in `in_pool`.
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                                context.blueprint_card or card)
                            return true
                        end)
                    }))
                end
            }
        end
    end,

	in_pool = function(self, args)
        return false
    end
})

--[[
SMODS.Joker({
	key = "???",
	atlas = "prim",
	pos = { x = 1, y = 0 },
	rarity = "arch_primer",
	cost = 9,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { chips = 30 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
})
]]

SMODS.Joker({
	key = "cobalt",
	atlas = "prim",
	pos = { x = 1, y = 2 },
	rarity = "arch_primer",
	cost = 9,
	allow_duplicates = true,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
    config = { extra = { retriggers = 1, odds = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.retriggers } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and pseudorandom('arch_cobalt') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                repetitions = card.ability.extra.retriggers
            }
        end
    end
})