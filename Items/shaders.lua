SMODS.Shader({ key = 'corrupted', path = 'corrupted.fs' })
SMODS.Shader({ key = 'hyperwave', path = 'hyperwave.fs' })
SMODS.Shader({ key = 'retrograph', path = 'retrograph.fs' })
SMODS.Shader({ key = 'goldsheet', path = 'goldsheet.fs' })


SMODS.Edition({
    key = "corrupted",
    loc_txt = {
        name = "Corrupted",
        label = "Corrupted",
        text = { -- True effect to be implemented = -2 Reroll Cost
            "{C:mult}+#1#{} Mult"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'corrupted',
    config = { mult = 15 },
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
            "{X:mult,C:white}X#1#{} Mult"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'hyperwave',
    config = { x_mult = 2 },
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
            "{C:dark_edition}+#1#{} Joker Slot",
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'retrograph',
    config = { card_limit = 1 },
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit, card.edition.chips } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,
})

SMODS.Edition({
    key = "goldsheet",
    loc_txt = {
        name = "Phosphorescent",
        label = "Phosphorescent",
        text = { -- True effect to be implemented = something something money?
            "{C:chips}+#2#{} Chips"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'goldsheet',
    config = { chips = 75 },
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit, card.edition.chips } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.chips
            }
        end
    end
})