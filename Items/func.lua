function ARCH.madness(float)
    local freezeval = (2+G.GAME.probabilities.normal)/3
    if pseudorandom('madnessbrain_1') > 0.4 then
        float = float + 1.45
        freezeval = freezeval + 1
    end
    if pseudorandom('madnessbrain_2') > 0.4 then
        float = float + 0.34
    end
    if pseudorandom('madnessbrain_3') > 0.4 then
        float = float + 6.67
    end
    if pseudorandom('madnessbrain_4') > 0.4 then
        float = float * (1+(float/13.24))
        freezeval = freezeval + 1
    end
    if pseudorandom('madnessbrain_5') > 0.6 then
        float = float + 10.24
        freezeval = freezeval/2
    end
    if pseudorandom('madnessbrain_6') > 0.4 then
        float = float + 3.14
    else
        float = 1.45+(float/11)
        freezeval = freezeval + 3
    end
    if pseudorandom('madnessbrain_7') > 0.6 then
        float = float * 1.21
    end
    if pseudorandom('madnessbrain_8') > 0.6 then
        float = float * 1.314
        freezeval = freezeval + 1
    end
    if pseudorandom('madnessbrain_9') > 0.7 then
        float = float * 3.14
    end
    if pseudorandom('madnessbrain_10') > 0.8 and float < 30 then
        float = (float * float)/1.52
    end
    if float < 2 then
        float = (float+2.12)*1.1
        freezeval = freezeval + 1
    end
    if float > 129 then
        float = (12+(float/1.2))*0.91
    end
    if float > 139 then
        float = (27+(float/1.3))*0.96
    end
    if float > 149 then
        float = (30+(float/1.4))*1.01
    end
    if pseudorandom('madnessbrain_11') > 0.4 then
        return float * 1.13
    end
    if pseudorandom('madnessbrain_12') > 0.4 then
        return float * 1.42
    end
    if pseudorandom('madnessbrain_13') > 0.4 then
        return float / 1.24
    end
    if pseudorandom('madnessbrain_14') > 0.8 then
        return float * 3.24
    end
    if pseudorandom('madnessbrain_15') > 0.9 then
        return float * 10.51
    end
    if float > 465*(1+(freezeval*0.1)) then
        float = ((327/float)*1.451)*(1+pseudorandom('madnessbrain_16'))*(1+pseudorandom('madnessbrain_17'))*(1+pseudorandom('madnessbrain_18'))*(1+pseudorandom('madnessbrain_19'))*(1+pseudorandom('madnessbrain_20'))
    end
    if float < 11 then
        float = 4*((1.2+((1.4+float)*1.1))*(1.2+((1.4+float)*1.1)))
    end
    if float > 52*(1+(freezeval*0.1)) or float < 1 then
        float = (12*(1+pseudorandom('madnessbrain_21')))*1.1
    end
    freezeval = (2+G.GAME.probabilities.normal)/3
    return float*freezeval
end