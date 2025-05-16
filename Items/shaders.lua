SMODS.Shader({ key = 'corrupted', path = 'corrupted.fs' })


SMODS.Edition({
    key = "corrupted",
    loc_txt = {
        name = "Corrupted",
        label = "Corrupted",
        text = {
            "{C:green}Retrigger{} this card",
            "{C:inactive,s:0.5}(Effect to be changed in future update){}" -- if you know how to make an edition give -reroll cost, pls tell me ;-;
        }
    },
    shader = "corrupted",
    discovered = true,
    unlocked = true,
    config = { extra = { repetitions = 1 } },
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
})
