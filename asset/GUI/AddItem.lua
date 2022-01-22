local originSize
local zeroSize
local itemImg
local shadow
local timeScale = 1
local operator ---@type SequenceOperator

function self:onOpen()
    originSize = {width = {0, 90}, height = {0, 90}}
    zeroSize = {width = {0, 0}, height = {0, 0}}

    itemImg = self.img_item
    itemImg:setSize(UDim2.new(0, 0, 0, 0))

    shadow = self.img_shadow
    shadow:setAlpha(0)
    shadow:setVisible(false)
end

function self:show()
    operator = Tween:sequence()
        :addCallBack(shadow.setVisible, shadow, true)
        :addParallel(
            UI:doTrans(itemImg, originSize, 0.5),
            UI:doFade(shadow, 0.6, 0.5)
        )
        :add(UI:doRotateZ(itemImg, 360, 3):setEase(EaseType.inOutElastic))
        :addDelay(1)
        :addParallel(
            UI:doTrans(itemImg, zeroSize, 0.5),
            UI:doFade(shadow, 0, 0.5)
        )
        :addCallBack(shadow.setVisible, shadow, false)
        :setLoops(2, LoopType.Restart)
        :setTimeScale(timeScale)
end

function self:setTimeScale(value)
    timeScale = value
    if operator and operator:isValid() then
        operator:setTimeScale(value)
    end
end