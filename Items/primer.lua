SMODS.Rarity({
	key = "primer",
	badge_colour = G.C.SECONDARY_SET.Spectral,
	pools = {
		["Joker"] = true,
	},
	default_weight = 0.05
})

SMODS.Joker({
	key = "ametr",
	atlas = "prim",
	pos = { x = 0, y = 0 },
	rarity = "arch_primer",
	cost = 2,
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
	cost = 2,
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
	cost = 2,
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