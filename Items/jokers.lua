SMODS.Joker({
	key = "pink_joker",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 2,
	cost = 4,
	config = {
		extra = {
			max = 36,
			min = 0
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
        local loc_mult = ' ' .. (localize('k_mult')) .. ' '
        main_start = {
			{ n = G.UIT.T, config = { text = ' Scored', colour = G.C.UI.TEXT_DARK, scale = 0.32 } },
			{ n = G.UIT.T, config = { text = ' Wild Cards', colour = G.C.FILTER, scale = 0.32 } },
			{ n = G.UIT.T, config = { text = ' give', colour = G.C.UI.TEXT_DARK, scale = 0.32 } },
            { n = G.UIT.T, config = { text = ' +', colour = G.C.MULT, scale = 0.32 } },
            { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = 'rand()', colour = G.C.JOKER_GREY }, { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11) .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'), colour = G.C.RED },
                            loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
                            loc_mult, loc_mult, loc_mult, loc_mult },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start }
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.ability.effect == "Wild Card" then
				local arch = card.ability.extra
				return{
					mult = pseudorandom('partytime', card.ability.extra.min, card.ability.extra.max)
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
	cost = 6,
	config = {
		extra = {
			odds = 2,
			triggersleft = 6
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, arch.triggersleft },
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
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

SMODS.Joker({
	key = "pretzel",
	atlas = "joke",
	pos = { x = 2, y = 0 },
	rarity = 2,
	cost = 1,
	allow_duplicates = true,
	config = {
		extra = {
			odds = 3,
			odds2 = 6
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { (G.GAME and G.GAME.probabilities.normal or 1), arch.odds, arch.odds2 },
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('arch_pretz') < G.GAME.probabilities.normal / card.ability.extra.odds then
				play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
				card.T.r = -0.2
                card:juice_up(0.3, 0.4)
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Bite!', colour = G.C.MULT })
				return {
					level_up = true,
  					level_up_hand = "Two Pair"
				}
			elseif pseudorandom('arch_pretz_second') < G.GAME.probabilities.normal / card.ability.extra.odds2 then
				card:remove()
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Ate!', colour = G.C.MULT })
				card = nil
			end
		end
	end
})

SMODS.Joker({
	key = "deadcard",
	atlas = "joke",
	pos = { x = 3, y = 0 },
	rarity = 1,
	cost = 3,
	allow_duplicates = true,
	config = {},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {}
	end,
	calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
			if pseudorandom('alostmemory') < 0.5 then
				return {
					repetitions = 1
				}
			end
		end
    end
})

SMODS.Joker({
    key = "todust",
    atlas = "joke",
    pos = { x = 4, y = 0 },
    rarity = "fuse_fusion",
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            Xmult = 0.1, 
            joker1 = "arch_deadcard",
            joker2 = "j_blackboard"
        }
    },
    loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {}
	end,
	calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
			if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
				if pseudorandom('alostmemory') < 0.75 then
					return {
						repetitions = 2
					}
				end
			end
  	  	end
	end
})