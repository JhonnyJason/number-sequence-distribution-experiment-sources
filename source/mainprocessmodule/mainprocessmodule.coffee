mainprocessmodule = {name: "mainprocessmodule"}
##############################################################################
#region logPrintFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["mainprocessmodule"]?  then console.log "[mainprocessmodule]: " + arg
    return
olog = (o) -> log "\n" + ostr(o)
ostr = (o) -> JSON.stringify(o, null, 4)
print = (arg) -> console.log(arg)
#endregion

##############################################################################
#region modulesFromEnvironment
distributionTester = null
compressionTester = null
cfg = null
#endregion

##############################################################################
mainprocessmodule.initialize = ->
    log "mainprocessmodule.initialize"
    distributionTester = allModules.distributiontestmodule
    compressionTester = allModules.compressiontestmodule
    cfg = allModules.configmodule
    return 


##############################################################################
#region exposedFunctions
mainprocessmodule.execute = (args) ->
    log "mainprocessmodule.execute"
    # distributionTester.runTest()
    compressionTester.runTest()
    
    return
#endregion

module.exports = mainprocessmodule
