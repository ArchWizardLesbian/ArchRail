SMODS.Joker({
	key = "pink_joker",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 3,
	cost = 8,
	config = {
		extra = {
			mult = 8,
			multgain = 1
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { arch.mult, arch.multgain },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Hearts") then
				local arch = card.ability.extra
				arch.mult = arch.mult + arch.multgain
			end
			if context.other_card:is_suit("Clubs") then
				local arch = card.ability.extra
				return{
					mult = arch.mult,
				}
			end
		end
	end,
})

SMODS.Joker({
	key = "brown_joker",
	atlas = "joke",
	pos = { x = 1, y = 0 },
	rarity = 3,
	cost = 8,
	config = {
		extra = {
			dollar = 1,
			dollargain = 0.1
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { arch.dollar, arch.dollargain },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Diamonds") then
				local arch = card.ability.extra
				arch.dollar = arch.dollar + arch.dollargain
			end
			if context.other_card:is_suit("Clubs") then
				local arch = card.ability.extra
				return{
					dollars = arch.dollar,
				}
			end
		end
	end,
})