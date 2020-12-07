compressiontestmodule = {name: "compressiontestmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["compressiontestmodule"]?  then console.log "[compressiontestmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
#region modulesFromEnvironment
crypto = require "crypto"
butl = require "thingy-byte-utils"

mappingFunction = null

#endregion

############################################################
#region internalProperties
CHUNK_SIZE = 2 # || 4
bufferFakeFile = null

allChunks = []

#endregion

############################################################
compressiontestmodule.initialize = () ->
    log "compressiontestmodule.initialize"
    mappingFunction = allModules.pseudorandomsha1module

    bufferFakeFile = await crypto.randomBytes(444)
    # olog {bufferFakeFile}
    disectFileToChunks()
    # olog {allChunks}
    # log butl.bytesToUtf8(randomBytes)
    return

############################################################
disectFileToChunks = ->
    if CHUNK_SIZE == 2
        allChunks = new Uint16Array(bufferFakeFile.buffer, bufferFakeFile.byteOffset, bufferFakeFile.length / 2)
    if CHUNK_SIZE == 4
        allChunks = new Uint32Array(bufferFakeFile.buffer, bufferFakeFile.byteOffset, bufferFakeFile.length / 4)
    return


compressiontestmodule.runTest = ->
    log "compressiontestmodule.runTest"
    mappingFunction.createSequenceMapping(0, CHUNK_SIZE, 1)
    matchFactor = mappingFunction.getMatchingFactor(allChunks)
    log matchFactor
    return
    


module.exports = compressiontestmodule