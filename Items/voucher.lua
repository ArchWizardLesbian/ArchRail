SMODS.Voucher {
    key = 'alchemy',
    atlas = "vouch",
    pos = { x = 0, y = 0 },
    config = { extra = { rarmult = 2 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rarmult } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME['arch_primer_mod'] = ((G.GAME['arch_primer_mod'] or 1)*card.ability.extra.rarmult)or G.GAME['arch_primer_mod']
                return true
            end
        }))
    end
}

SMODS.Voucher {
    key = 'alchemy_plus',
    atlas = "vouch",
    pos = { x = 1, y = 0 },
    config = { extra = { rarmult = 4 }, },
    requires = { 'v_vremade_overstock_norm' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rarmult } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME['arch_primer_mod'] = ((G.GAME['arch_primer_mod'] or 1)*card.ability.extra.rarmult)or G.GAME['arch_primer_mod']
                return true
            end
        }))
    end,
}