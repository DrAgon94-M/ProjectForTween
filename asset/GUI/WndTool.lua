

function self:onOpen()
    local uiPlayerBag = UI:openWindow("GUI/PlayerBag", nil, "asset")
    local uiAddItem = UI:openWindow("GUI/AddItem", nil, "asset")
    local uiShowText = UI:openWindow("GUI/showText", nil, "asset")

    self.btnForOpen.playerBag.onMouseClick = function()
        uiPlayerBag:show()
    end

    self.btnForOpen.addItem.onMouseClick = function()
        uiAddItem:show()
    end

    self.btnForOpen.showText.onMouseClick = function()
        uiShowText:showText()
    end

    self.timeScale.speed1.onMouseClick = function()
        Tween:setTimeScale(1)
    end
    self.timeScale.speed05.onMouseClick = function()
        Tween:setTimeScale(0.5)
    end
    self.timeScale.speed01.onMouseClick = function()
        Tween:setTimeScale(0.1)
    end
    self.timeScale.speed1ForAddItem.onMouseClick = function()
        uiAddItem:setTimeScale(1)
    end
    self.timeScale.speed01ForAddItem.onMouseClick = function()
        uiAddItem:setTimeScale(0.1)
    end
    self.timeScale.speed1ForPlayerBag.onMouseClick = function()
        uiPlayerBag:setTimeScale(1)
    end
    self.timeScale.speed01ForPlayerBag.onMouseClick = function()
        uiPlayerBag:setTimeScale(0.1)
    end
end