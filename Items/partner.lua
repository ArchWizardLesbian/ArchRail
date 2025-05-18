Partner_API.Partner{
    key = "pretzelbuddy",
    name = "Pretzel Partner",
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    loc_txt = {},
--    individual_quips = true,
    atlas = "minijoke",
    config = {extra = {related_card = "j_arch_pretzel", odds = 2}},
    loc_vars = function(self, info_queue, card)
        arch = card.ability.extra
        return { vars = {(G.GAME and G.GAME.probabilities.normal or 1), arch.odds} }
    end,

    calculate = function(self, card, context)
        if context.partner_end_of_round then
            if pseudorandom('arch_pretz') < G.GAME.probabilities.normal / card.ability.extra.odds then
				play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
				card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Bite!', colour = G.C.MULT })
                level_up_hand(card, "Two Pair", nil, 1)
                update_hand_text({sound = "button", volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = "", level = ""})
			end
		end
    end
}