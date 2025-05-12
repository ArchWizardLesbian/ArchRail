Partner_API.Partner{
    key = "pretzelbuddy",
    name = "Pretzel Partner",
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    loc_txt = {},
    atlas = "minijoke",
    config = {extra = {odds = 8}},
    loc_vars = function(self, info_queue, card)
        arch = card.ability.extra
        return { vars = {(G.GAME and G.GAME.probabilities.normal or 1), arch.odds} }
    end,
    calculate = function(self, card, context)
        if context.partner_setting_blind then
            if pseudorandom('arch_pretz') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    level_up = true,
  					level_up_hand = "Two Pair"
                }
            end
        end
    end
}