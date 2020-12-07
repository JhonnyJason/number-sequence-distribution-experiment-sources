pseudorandomsha1module = {name: "pseudorandomsha1module"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["pseudorandomsha1module"]?  then console.log "[pseudorandomsha1module]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
crypto = require("crypto")
butl = require "thingy-byte-utils"

############################################################
NR_OF_INDICES = 256
indexedChunks = []
chunkMapping = {}

############################################################
pseudorandomsha1module.initialize = () ->
    log "pseudorandomsha1module.initialize"
    return

############################################################
nextChunk = (prev) ->
    return crypto.createHash('sha1').update(prev).digest()

indexSequence = (sequenceBuffer, distance, size) ->
    for byte,i in sequenceBuffer by distance
        chunk = sequenceBuffer.slice(i, i+size)
        label = chunk.toString("hex")
        chunkMapping[label] = indexedChunks.push(chunk)
    return


uint16ToHex = (num) ->
    buf = Buffer.alloc(2)
    buf.writeUInt16BE(num)
    result = buf.toString("hex")
    # olog {num, result}
    return result

############################################################
pseudorandomsha1module.createSequenceMapping = (seed, chunkSize, indexDistance) ->
    log "pseudorandomsha1module.createSequenceMapping"

    if typeof seed == "object" then seed = Buffer.from(seed)
    if typeof seed == "number" then seed = ""+seed
    if typeof seed == "string" then seed = butl.utf8ToBytes(seed)
    chunk = seed

    requiredLength = NR_OF_INDICES * indexDistance + chunkSize
    allChunks = []
    currentLength = 0

    loop
        chunk = nextChunk(chunk)
        currentLength += chunk.length
        allChunks.push(chunk)
        if currentLength >= requiredLength then break
    
    sequenceBuffer = Buffer.concat(allChunks)
    indexSequence(sequenceBuffer, indexDistance, chunkSize)
    # olog chunkMapping
    return

pseudorandomsha1module.getMatchingFactor = (allChunks) ->
    matched = 0

    allLabels = (uint16ToHex(num) for num in allChunks)
    # olog allLabels

    for label in allLabels
        index = chunkMapping[label]
        if index? then matched++
    
    log matched
    log allChunks.length
    
    return 1.0 * matched / allChunks.length
     
module.exports = pseudorandomsha1module