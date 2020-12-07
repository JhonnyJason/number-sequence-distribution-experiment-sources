distributiontestmodule = {name: "distributiontestmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["distributiontestmodule"]?  then console.log "[distributiontestmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
babylonFunction = null

############################################################
distributiontestmodule.initialize = () ->
    log "distributiontestmodule.initialize"
    babylonFunction = allModules.babylonfunctionmodule
    return


############################################################
displayByteDistribution = (numbers) ->
    byteCount = []
    byteCount.length = 256
    byteCount.fill(0)
    
    byteCount[number]++ for number in numbers
    olog {byteCount}
    return

testRunBabylon = (start, iterations) ->
    log "testRunBabylon (start: " + start + ", iterations: " + iterations + ")"
    numbers = babylonFunction(start, iterations)
    # olog {start, iterations, numbers}
    log "start: " + start + ", iterations: " + iterations
    displayByteDistribution(numbers)
    return

############################################################
distributiontestmodule.runTest = ->
    log "distributiontestmodule.runTest"
    
    return

module.exports = distributiontestmodule