rawset(_G, "Tween", {})

local manager = require "core.manager"
local enum = require "core.enum"
local update = require "extras.client.update"

do
    update(function()
        manager:update()
        return true
    end)

    rawset(_G, "LoopType", enum.loopType)
    rawset(_G, "EaseType", enum.easeType)
end

function Tween:tweener(getter, setter, to, duration, tid)
    return manager:createTweener(getter, setter, to, duration, tid)
end

function Tween:sequence()
    return manager:createSequence()
end

function Tween:setTimeScale(value)
    manager:setTimeScale(value)
end