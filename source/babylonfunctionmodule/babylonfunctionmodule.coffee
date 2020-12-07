MIN_ITER = 3

##############################################################################
module.exports = (startValue, iterations) ->
    x = 10 ** 2
    out = []
    
    motivation = iterations
    while motivation--
        x = 0.5 * (x - startValue / x)
        out.push(Math.abs(Math.floor((x * 100) % 255)))

    return out