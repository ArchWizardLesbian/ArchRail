SMODS.Joker({
	key = "pink_joker",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 1,
	cost = 4,
	config = {
		extra = {
			max = 21,
			min = 3
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
			{ n = G.UIT.T, config = { text = 'Scored', colour = G.C.UI.TEXT_DARK, scale = 0.32 } },
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
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_wild'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_wild') then
                return true
            end
        end
        return false
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
			triggersleft = 5
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { arch.triggersleft },
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss then
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
	cost = 3,
	allow_duplicates = true,
	config = {
		extra = {
			odds = 8
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { (G.GAME and G.GAME.probabilities.normal or 1), arch.odds },
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('arch_pretz') < G.GAME.probabilities.normal / card.ability.extra.odds then
				card:remove()
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Ate!', colour = G.C.MULT })
				card = nil
			else
				play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
				card.T.r = -0.2
                card:juice_up(0.3, 0.4)
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Bite!', colour = G.C.MULT })
				return {
					level_up = true,
  					level_up_hand = "Two Pair"
				}
			end
		end
	end
})


SMODS.Joker({
	key = "deadcard",
	atlas = "joke",
	pos = { x = 3, y = 0 },
	rarity = 1,
	cost = 4,
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


SMODS.Joker {
    key = "nickel",
	atlas = "joke",
    pos = { x = 0, y = 3 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { dollars = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.end_of_round and context.other_card.seal == 'Gold' then
            return {            
            	dollars = card.ability.extra.dollars,
            	func = function() -- This is for timing purposes, this goes after the dollar modification
            	    G.E_MANAGER:add_event(Event({
            	        func = function()
            	            G.GAME.dollar_buffer = 0
             	            return true
                       	end
                    }))
                end
            }
        end
    end,
    in_pool = function(self, args)
    local seal_count = 0
    if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.seal == 'Gold' then
                seal_count = seal_count + 1
            end
        end
    end
    if seal_count > 0 then
        return true
    else
        return false
    end
    end,
}

SMODS.Joker {
    key = "geologist",
	atlas = "joke",
    pos = { x = 0, y = 3 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { rarmult = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rarmult } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME['arch_primer_mod'] = ((G.GAME['arch_primer_mod'] or 1)*card.ability.extra.rarmult)or G.GAME['arch_primer_mod']
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME['arch_primer_mod'] = ((G.GAME['arch_primer_mod'] or 1)/card.ability.extra.rarmult) or G.GAME['arch_primer_mod']
    end,
}



FusionJokers.fusions:add_fusion("j_blackboard", nil, false, "j_arch_deadcard", nil, false, "j_arch_todust", 6)
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
        extra = {}
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


--[[
FusionJokers.fusions:add_fusion("j_glass_joker", nil, false, "j_arch_pink_joker", nil, false, "j_arch_prisma", 7)
SMODS.Joker({
    key = "prisma",
    atlas = "joke",
    pos = { x = 2, y = 1 },
	soul_pos = { x = 3, y = 1 },
    rarity = "fuse_fusion",
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = true,
    config = {
        extra = {
			selectionUp = 1,
			enhancementReq = 2,
			prev_tally = 0,
			selection_increase = 0
		}
    },
	loc_vars = function (self, info_queue, card)
		local arch = card.ability.extra
		local enhance_tally = 0
		local enhance_tally2 = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.ability.effect == "Wild Card" then
					enhance_tally = enhance_tally + 1
				elseif playing_card.ability.effect == "Glass Card" then
					enhance_tally2 = enhance_tally2 + 1
				end
            end
        end
		enhance_tally = math.floor((math.min(enhance_tally,enhance_tally2))/arch.enhancementReq)
		return {
			vars = { arch.selectionUp, arch.enhancementReq, arch.selection_increase },
		}
	end,
	update = function(self, card, context)
		local arch = card.ability.extra
		local enhance_tally = 0
		local enhance_tally2 = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if playing_card.ability.effect == "Wild Card" then
					enhance_tally = enhance_tally + 1
				elseif playing_card.ability.effect == "Glass Card" then
					enhance_tally2 = enhance_tally2 + 1
				end
			end
		end
		enhance_tally = math.floor((math.min(enhance_tally,enhance_tally2))/arch.enhancementReq)
		if enhance_tally ~= arch.prev_tally then
			if G.hand then
				local tally_to_selection = enhance_tally - arch.prev_tally
				arch.selection_increase = (enhance_tally*arch.selectionUp)
				G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + arch.selection_increase
				arch.prev_tally = arch.prev_tally + tally_to_selection
			end
		end
	end,
	remove_from_deck = function(self, card, context)
		local arch = card.ability.extra
		if G.hand then
			G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - arch.selection_increase
		end
	end
})


FusionJokers.fusions:add_fusion("j_oops", nil, false, "j_arch_citrine", nil, false, "j_arch_gamblecore", 8)
SMODS.Joker({
    key = "gamblecore",
    atlas = "joke",
    pos = { x = 1, y = 1 },
    rarity = "fuse_fusion",
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = true,
    
    -- effect = +1 Odds per $10(?) you have

})
]]


FusionJokers.fusions:add_fusion("j_fortune_teller", nil, false, "j_arch_ametr", nil, false, "j_arch_pyromancer", 8)
SMODS.Joker({
    key = "pyromancer",
    atlas = "joke",
    pos = { x = 0, y = 1 },
    rarity = "fuse_fusion",
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = true,
    config = { extra = { xmult = 0.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1+(card.ability.extra.xmult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)) } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Tarot" then
            return {
                message = localize { type = 'variable', key = 'x_mult', vars = { 1+(card.ability.extra.xmult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)) } },
            }
        end
        if context.joker_main then
            return {
                xmult = 1 + (card.ability.extra.xmult *
                    (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0))
            }
        end
    end,
})


FusionJokers.fusions:add_fusion("j_joker_stencil", nil, false, "j_arch_obsid", nil, false, "j_arch_inked", 10)
SMODS.Joker({
    key = "inked",
    atlas = "joke",
    pos = { x = 4, y = 1 },
    rarity = "fuse_fusion",
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = true,
    config = { extra = { xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Tarot" then
            local arch = card.ability.extra
			arch.xmult = arch.xmult + (G.jokers.config.card_limit*0.04)
			card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Inked!', colour = G.C.MULT })
        end
        if context.joker_main then
            local arch = card.ability.extra
			return {
                xmult = arch.xmult
            }
        end
    end,
})


FusionJokers.fusions:add_fusion("j_photograph", nil, false, "j_arch_citrine", nil, false, "j_arch_model", 8)
SMODS.Joker({
    key = "model",
	atlas = "joke",
    blueprint_compat = true,
    rarity = "fuse_fusion",
    cost = 8,
    pos = { x = 0, y = 3 },
    --pixel_size = { h = 95 / 1.2 },
    config = { extra = { dollars = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            local is_first_face = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then
                    is_first_face = context.scoring_hand[i] == context.other_card
                    break
                end
            end
            if is_first_face then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            	return {
            	    dollars = card.ability.extra.dollars,
            	    func = function() -- This is for timing purposes, this goes after the dollar modification
            	        G.E_MANAGER:add_event(Event({
            	            func = function()
            	            	G.GAME.dollar_buffer = 0
             	            	return true
                       		end
                    	}))
                	end
            	}
            end
        end
    end
})


FusionJokers.fusions:add_fusion("j_bull", nil, false, "j_arch_cobalt", nil, false, "j_arch_minotaur", 12)
SMODS.Joker {
    key = "minotaur",
	atlas = "joke",
    blueprint_compat = true,
    rarity = "fuse_fusion",
    cost = 12,
    pos = { x = 0, y = 3 },
    config = { extra = { chips = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * math.max(0, (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                chips = to_number(card.ability.extra.chips * math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0))))
            }
        end
    end,
}



FusionJokers.fusions:add_fusion("j_greedy_joker", nil, false, "j_arch_sapphire", nil, false, "j_arch_charitous_joker", 3)
SMODS.Joker {
    key = "charitous_joker",
	atlas = "joke",
    pos = { x = 5, y = 0 },
    rarity = "fuse_fusion",
    blueprint_compat = true,
    cost = 5,
    config = { extra = { chips = 70 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and
            context.other_card:is_suit("Diamonds") then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}


FusionJokers.fusions:add_fusion("j_lusty_joker", nil, false, "j_arch_sapphire", nil, false, "j_arch_chaste_joker", 3)
SMODS.Joker {
    key = "chaste_joker",
	atlas = "joke",
    pos = { x = 5, y = 1 },
    rarity = "fuse_fusion",
    blueprint_compat = true,
    cost = 5,
    config = { extra = { chips = 70 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and
            context.other_card:is_suit("Hearts") then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}


FusionJokers.fusions:add_fusion("j_wrathful_joker", nil, false, "j_arch_sapphire", nil, false, "j_arch_patient_joker", 3)
SMODS.Joker {
    key = "patient_joker",
	atlas = "joke",
    pos = { x = 5, y = 2 },
    rarity = "fuse_fusion",
    blueprint_compat = true,
    cost = 5,
    config = { extra = { chips = 70 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and
            context.other_card:is_suit("Spades") then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}


FusionJokers.fusions:add_fusion("j_gluttenous_joker", nil, false, "j_arch_sapphire", nil, false, "j_arch_temperate_joker", 3)
SMODS.Joker {
    key = "temperate_joker",
	atlas = "joke",
    pos = { x = 5, y = 3 },
    rarity = "fuse_fusion",
    blueprint_compat = true,
    cost = 5,
    config = { extra = { chips = 70 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and
            context.other_card:is_suit("Clubs") then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}


FusionJokers.fusions:add_fusion("j_smiley", nil, false, "j_arch_ametr", nil, false, "j_arch_neutral_face", 4)
SMODS.Joker {
    key = "neutral_face",
	atlas = "joke",
    blueprint_compat = true,
    rarity = "fuse_fusion",
    cost = 4,
    pos = { x = 3, y = 2 },
    config = { extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

FusionJokers.fusions:add_fusion("j_smiley", nil, false, "j_arch_sunstone", nil, false, "j_arch_ecstatic_face", 12)
SMODS.Joker {
    key = "ecstatic_face",
    atlas = "joke",
    blueprint_compat = true,
    rarity = "fuse_fusion",
    cost = 12,
    pos = { x = 4, y = 2 },
    config = { extra = { mult = 4, dollars = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.dollars, card.ability.extra.mult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars) } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                mult = to_number(card.ability.extra.mult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars))
            }
        end
    end
}

FusionJokers.fusions:add_fusion("j_arch_neutral_face", nil, false, "j_arch_cobalt", nil, false, "j_arch_frowny_face", 12)
SMODS.Joker {
    key = "frowny_face",
	atlas = "joke",
    blueprint_compat = true,
    rarity = "fuse_fusion",
    cost = 12,
    pos = { x = 2, y = 2 },
    config = { extra = { xmult = 1.25, retriggers = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.repetition and context.cardarea == G.play and context.other_card:is_face() then
            return {
                repetitions = card.ability.extra.retriggers
            }
        end
    end
}


FusionJokers.fusions:add_fusion("j_arch_brown_joker", nil, false, "j_arch_pretzel", nil, false, "j_arch_choco_pretzel", 12)
SMODS.Joker({
	key = "choco_pretz",
	atlas = "joke",
	pos = { x = 2, y = 3 },
	rarity = "fuse_fusion",
	cost = 12,
	config = {
		extra = {
			odds = 40
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		local arch = card.ability.extra
		return {
			vars = { (G.GAME and G.GAME.probabilities.normal or 1), arch.odds },
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('arch_choco_pretz') < G.GAME.probabilities.normal / card.ability.extra.odds then
				card:remove()
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Ate!', colour = G.C.MULT })
				card = nil
			else
				add_tag(Tag('tag_double'))
				play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
				card.T.r = -0.2
                card:juice_up(0.3, 0.4)
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Bite!', colour = G.C.MULT })
				return {
					level_up = true,
  					level_up_hand = "Two Pair"
				}
			end
		end
	end
})


FusionJokers.fusions:add_fusion("j_misprint", nil, false, "j_misprint", nil, false, "j_arch_joker_undefined_404", 13)
SMODS.Joker({
	key = "joker_undefined_404",
	atlas = "joke",
	pos = { x = 1, y = 3 },
	rarity = "fuse_fusion",
	cost = 13,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { mult = 31.4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local arch = card.ability.extra
            arch.mult = ARCH.madness(arch.mult,2)
            return {
                mult = arch.mult
            }
        end
    end
})


FusionJokers.fusions:add_fusion("j_scholar", nil, false, "j_certificate", nil, false, "j_arch_scholarship", 8)
SMODS.Joker({
	key = "scholarship",
	atlas = "joke",
	pos = { x = 0, y = 3 },
	rarity = "fuse_fusion",
	cost = 13,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('arch_scholarship')),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
            return {
                func = function()
                    -- This is for retrigger purposes, Jokers need to return something to retrigger
                    -- You can also do this outside the return and `return nil, true` instead
                    G.E_MANAGER:add_event(Event({
                        func = function()
                        local cards = {}
                        for i = 1, 1 do
                            local _suit, _rank =
                                pseudorandom_element(SMODS.Suits, pseudoseed('arch_scholarship')).card_key, 'A'
                            local cen_pool = {}
                            cards[i] = create_playing_card({
                                front = G.P_CARDS[_suit .. '_' .. _rank],
                                center = pseudorandom_element(cen_pool, pseudoseed('arch_scholarship'))
                            }, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                        cards[i]:set_seal(SMODS.poll_seal({guaranteed = true}))
                        end
                        SMODS.calculate_context({ playing_card_added = true, cards = cards })
                        return true
                    end
                    }))
                    SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                end
            }
        end
    end,
})


FusionJokers.fusions:add_fusion("j_dna", nil, false, "j_arch_quartz", nil, false, "j_arch_frowny_face", 12)
SMODS.Joker {
    key = "rna",
    blueprint_compat = true,
    atlas = "joke",
	pos = { x = 0, y = 3 },
	rarity = "fuse_fusion",
    cost = 8,
    config = { extra = { cards = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,
     calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 2 then
            G.E_MANAGER:add_event(Event({
            func = function()
                local _first_dissolve = nil
                local new_cards = {}
                for i = 1, card.ability.extra.cards do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card:start_materialize(nil, _first_dissolve)
                    _first_dissolve = true
                    new_cards[#new_cards + 1] = _card
                end
                for i = 1, card.ability.extra.cards do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(context.full_hand[2], nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card:start_materialize(nil, _first_dissolve)
                    _first_dissolve = true
                    new_cards[#new_cards + 1] = _card
                end
                SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                return true
            end
            }))
        end
    end
}