function Object:doMove(to, duration)
    if not self:isValid() then
        perror("this object is not valid.")
        return
    end

    local getter = function()
        return self:getPosition()
    end

    local setter = function(value)
        self:setPosition(value)
    end

    return Tween:tweener(getter, setter, to, duration)
end