SMODS.Shader({ key = 'corrupted', path = 'corrupted.fs' })

--[[
SMODS.Edition({
    key = "corrupted",
    loc_txt = {
        name = "Corrupted",
        label = "Corrupted",
        text = {
            "{C:attention}-#1#{} {C:green}reroll{} cost"
        }
    },

    shader = "corrupted",
    discovered = true,
    unlocked = true,
    config = { extra = { reroll_sale = 2 } },
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
    loc_vars = function(self, info_queue, card)
    return {
      vars = {
        self.config.extra.reroll_sale
      }
    }
    end,
    
    add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - self.config.extra.reroll_sale
    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - self.config.extra.reroll_sale)
  end,
    remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + self.config.extra.reroll_sale
    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + self.config.extra.reroll_sale)
  end,
})
]]