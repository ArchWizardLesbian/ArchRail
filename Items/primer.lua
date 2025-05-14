SMODS.Rarity({
	key = "primer",
	badge_colour = G.C.RARITY.Rare,
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
	cost = 3,
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