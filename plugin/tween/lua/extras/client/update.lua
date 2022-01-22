local renderHandler = {}
local index = 0

do
    DrawRender.addEntry("easing", function()
        for id, handler in pairs(renderHandler) do
            local reslut = handler()

            if not reslut then
                renderHandler[id] = nil
            end
        end
    end)

    DrawRender:setEasingEnabled(true)
end

local function register(func)
    index = index + 1
    local curIndex = index

    renderHandler[curIndex] = func

    return function()
        renderHandler[curIndex] = nil
    end
end

return register