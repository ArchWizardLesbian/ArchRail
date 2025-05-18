SMODS.Shader({ key = 'corrupted', path = 'corrupted.fs' })
SMODS.Shader({ key = 'hyperwave', path = 'hyperwave.fs' })
SMODS.Shader({ key = 'retrograph', path = 'retrograph.fs' })


SMODS.Edition({
    key = "corrupted",
    loc_txt = {
        name = "Corrupted",
        label = "Corrupted",
        text = { -- True effect to be implemented = -2 Reroll Cost
            "{C:dark_edition}+1{} Joker Slot",
            "{X:mult,C:white}X#2#{} Mult"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'corrupted',
    config = { card_limit = 1, x_mult = 1.5 },
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit, card.edition.x_mult } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end
})

SMODS.Edition({
    key = "hyperwave",
    loc_txt = {
        name = "Polywave",
        label = "Polywave",
        text = {
            "{C:dark_edition}+1{} Joker Slot",
            "{X:mult,C:white}X#2#{} Mult"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'hyperwave',
    config = { card_limit = 1, x_mult = 1.5 },
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit, card.edition.x_mult } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end
})

SMODS.Edition({
    key = "retrograph",
    loc_txt = {
        name = "Screen",
        label = "Screen",
        text = { -- True effect to be implemented = +handsize?
            "{C:dark_edition}+1{} Joker Slot",
            "{X:mult,C:white}X#2#{} Mult"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'retrograph',
    config = { card_limit = 1, x_mult = 1.5 },
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit, card.edition.x_mult } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end
})