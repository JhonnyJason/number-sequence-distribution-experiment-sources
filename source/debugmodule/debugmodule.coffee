debugmodule = {name: "debugmodule"}

##############################################################################
debugmodule.initialize = () ->
    # console.log "debugmodule.initialize - nothing to do"
    return     

##############################################################################
debugmodule.modulesToDebug = 
    unbreaker: true
    # cliargumentsmodule: true
    compressiontestmodule: true
    # configmodule: true
    # distributiontestmodule: true
    # mainprocessmodule: true
    # startupmodule: true
    pseudorandomsha1module: true
    
module.exports = debugmodule