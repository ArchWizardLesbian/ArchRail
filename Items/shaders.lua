SMODS.Shader({ key = 'corrupted', path = 'corrupted.fs' })

SMODS.Edition({
    key = "corrupted",
    loc_txt = {
        name = "Corrupted",
        label = "Corrupted",
        text = {
            "{C:chips}#1#{} chips"
        }
    },

    shader = "corrupted",
    discovered = true,
    unlocked = true,
    config = { chips = -15 },
    in_shop = true,
    weight = 8,
    extra_cost = -4,
    apply_to_float = true,
    loc_vars = function(self)
        return { vars = { self.config.chips } }
    end
})