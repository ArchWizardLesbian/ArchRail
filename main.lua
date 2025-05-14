ARCH = {}
ARCH.C = {}

ARCH.compat = {
    partners = (SMODS.Mods['partner'] or {}).can_load or false
}

SMODS.load_file("Items/jokers.lua")()
--SMODS.load_file("Items/primer.lua")()
SMODS.load_file("Items/shaders.lua")()

if ARCH.compat.partners then
SMODS.load_file("Items/partner.lua")()
end

--joker ATLAS
SMODS.Atlas{
    key = "joke",
    path = "joker.png",
    px = 71,
    py = 95
}

--primer joker ATLAS
SMODS.Atlas{
    key = "prim",
    path = "primers.png",
    px = 71,
    py = 95
}

--Mod icon
SMODS.Atlas({
    key = "modicon",
    path = "modicon.png",
    px = 34,
    py = 34
})

if ARCH.compat.partners then
--Partner Mod atlas
SMODS.Atlas{
    key = "minijoke",
    px = 46,
    py = 58,
    path = "partners.png"
}
end