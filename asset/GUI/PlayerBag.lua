local timeScale = 1
local showOperator ---@type TweenerOperator
local closeOperator ---@type TweenerOperator
local textOperator ---@type SequenceOperator

function self:onOpen()
    self.btn_close.onMouseClick = function()
        self:hide()
    end

    self:setXPosition(UDim.new(1, 0))

    self:startTextColorAnim()
end

function self:hide()
    showOperator = UI:doTrans(self, {x = {0.4, 0}}, 0.5)
        :onStart(function() print("start time : ", os.clock()) end)
        :onFinish(function() print("finish time : ", os.clock()) end)
        :setEaseByFunc(function(e, f, c, d)
            return f + c * (e / d) --Lerp 函数
        end)
        :setLoops(3)
        :onStepCompleted(print, "step Completed")
        :setTimeScale(timeScale)
end

function self:show()
    self:setVisible(true)
    closeOperator = UI:doTrans(self, {x = {0, 0}}, 0.5)
        :setEase(EaseType.outCirc)
        :onStart(print, "PlayerBag", "Show", "Start")
        :onFinish(print, "PlayerBag", "Show", "Finish")
        :setAutoKill(false)
        :setTimeScale(timeScale)
end

function self:startTextColorAnim()
    local text = self.text_title
    local duration = 0.5
    textOperator = Tween:sequence()
        :add(UI:doTextColorByColor(text, Color.new(1, 0, 0), duration):from(Color.new(1, 1, 0)))
        :add(UI:doTextColorByColor(text, Color.new(1, 0, 1), duration))
        :add(UI:doTextColorByColor(text, Color.new(0, 0, 1), duration))
        :add(UI:doTextColorByColor(text, Color.new(0, 1, 1), duration))
        :add(UI:doTextColorByColor(text, Color.new(0, 1, 0), duration))
        :add(UI:doTextColorByColor(text, Color.new(1, 1, 0), duration))
        :setLoops(-1, LoopType.Restart)
        :setTimeScale(timeScale)
end

function self:setTimeScale(value)
    timeScale = value

    ---@type TweenBaseOperator[]
    local operators = { showOperator, closeOperator, textOperator }

    for _, operator in ipairs(operators) do
        if operator and operator:isValid() then
            operator:setTimeScale(value)
        end
    end
end