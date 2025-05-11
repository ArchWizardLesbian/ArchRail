ANVA = {}
ANVA.C = {}
SMODS.load_file("Items/jokers.lua")()
SMODS.load_file("Items/shaders.lua")()

--joker ATLAS
SMODS.Atlas{
    key = "joke",
    path = "joker.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = "enha",
    path = "enhancement.png",
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