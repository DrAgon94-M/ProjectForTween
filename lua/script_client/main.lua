UI:openWindow("GUI/WndTool", nil, "asset")
Lib.subscribeEvent(Event.EVENT_FINISH_DEAL_GAME_INFO, function()
    Blockman.Instance().gameSettings:setCurQualityLevel(0)
end)