function ARCH.madness(numberModded,iterations)
    local modBooster = 1+(0.15*G.GAME.probabilities.normal)
    for i = 1, iterations, 1 do
        numberModded = numberModded * pseudorandom('ARCH.madness',0.75*modBooster,3.25*(modBooster*modBooster))
        if numberModded > 40 then
            numberModded = numberModded * pseudorandom('ARCH.madness2',0.15*modBooster,1.15*(modBooster))
            if  numberModded > 70 then
                numberModded = numberModded * pseudorandom('ARCH.madness3',0.15*modBooster,0.85*(modBooster))
                if  numberModded > 120 then
                    numberModded = numberModded * pseudorandom('ARCH.madness4',0.15*modBooster,0.65*(modBooster))
                end
            end
        end
    end
    for i = 1, iterations, 1 do
        if  numberModded < 15 then
            numberModded = numberModded + pseudorandom('ARCH.madness5',0.45*modBooster,1.65*(modBooster))
            if  numberModded < 10 then
                numberModded = numberModded + pseudorandom('ARCH.madness6',0.45*modBooster,1.65*(modBooster))
            end
        end
    end
    if numberModded > 12500 then
        numberModded = pseudorandom('ARCH.madness7',9.74,numberModded)
    end
    return numberModded
end