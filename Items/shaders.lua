SMODS.Shader({ key = 'corrupted', path = 'corrupted.fs' })
SMODS.Shader({ key = 'hyperwave', path = 'hyperwave.fs' })


SMODS.Edition({
    key = "corrupted",
    loc_txt = {
        name = "Corrupted",
        label = "Corrupted",
        text = {
            "{C:attention}+#1#{} Joker Slots"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'corrupted',
    config = { card_limit = 2 },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "negative", per = 1.5, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
    get_weight = function(self)
        return self.weight
    end,
})


SMODS.Edition({
    key = "hyperwave",
    loc_txt = {
        name = "Polywave",
        label = "Polywave",
        text = {
            "{C:attention}+#1#{} Joker Slots"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'hyperwave',
    config = { card_limit = 2 },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "negative", per = 1.5, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
    get_weight = function(self)
        return self.weight
    end,
})