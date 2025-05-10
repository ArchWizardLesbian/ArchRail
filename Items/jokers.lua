SMODS.Joker({
	key = "pink_joker",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 3,
	cost = 8,
	config = {
		extra = {
			mult = 4,
			multgain = 1
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		local anv = card.ability.extra
		return {
			vars = { anv.mult },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Hearts") then
				local anv = card.ability.extra
				anv.mult = anv.mult + anv.multgain
			end
			if context.other_card:is_suit("Clubs") then
				local anv = card.ability.extra
				return{
					mult = anv.mult,
				}
			end
		end
	end,
})