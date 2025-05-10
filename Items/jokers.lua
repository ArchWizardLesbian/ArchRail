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
			odds = 4,
			triggersleft = 4
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, arch.triggersleft },
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if pseudorandom('arch_choco') < G.GAME.probabilities.normal / card.ability.extra.odds then
				add_tag(Tag('tag_double'))
				play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
    	        card.ability.extra.triggersleft = card.ability.extra.triggersleft - 1
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Bite!', colour = G.C.MULT })
				if card.ability.extra.triggersleft <= 0 then
               	    card:remove()
					card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Ate!', colour = G.C.MULT })
					card = nil
				end
			end
		end
    end
})