hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

-- Reload configuration
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "R", function() hs.reload() end)
-- Register lock screen
hs.hotkey.bind({"alt", "cmd"}, "L", function() hs.caffeinate.lockScreen() end)
-- Register windowHints
hs.hotkey.bind({"alt", "cmd"}, "Tab", function() hs.hints.windowHints() end)
-- Register Hammerspoon console
hs.hotkey.bind({"alt", "cmd"}, "Z", function() hs.toggleConsole() end)
-- Register Hammerspoon API manual: Open Hammerspoon manual in default browser
hs.hotkey.bind({"alt", "cmd"}, "H", function() hs.doc.hsdocs.forceExternalBrowser(true) hs.doc.hsdocs.moduleEntitiesInSidebar(true) hs.doc.hsdocs.help() end)

-- Use SpoonInstall Spoon to install other Spoons
hs.loadSpoon("SpoonInstall")
Install = spoon.SpoonInstall
-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
Install:andUse("ModalMgr")
Install:andUse("HCalendar")
Install:andUse("HoldToQuit", { start = true })

--------------------------------------------------------------------------------
Install:andUse("Caffeine")
caffeine = hs.menubar.new()
if caffeine then
    function setCaffeineDisplay(state)
        if state then caffeine:setTitle("🌕")
        else caffeine:setTitle("🌑") end
    end
    caffeine:setClickCallback(function () setCaffeineDisplay(hs.caffeinate.toggle("displayIdle")) end)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

--------------------------------------------------------------------------------
-- 用于查看当前 App 快捷键
Install:andUse("KSheet", { fn = function(s)
    hs.hotkey.bind({"alt", "cmd"}, "S", function() spoon.KSheet:show() spoon.ModalMgr:deactivateAll() spoon.ModalMgr:activate({"cheatsheetM"}) end)
end})
if spoon.KSheet then
    spoon.ModalMgr:new("cheatsheetM")
    local cmodal = spoon.ModalMgr.modal_list["cheatsheetM"]
    cmodal:bind('', 'escape', '退出', function() spoon.KSheet:hide() spoon.ModalMgr:deactivate({"cheatsheetM"}) end)
end

--------------------------------------------------------------------------------
Install:andUse("WinWin", { fn = function(s)
    hs.hotkey.bind({"alt", "cmd"}, "R", function() spoon.ModalMgr:deactivateAll() spoon.ModalMgr:activate({"resizeM"}, "#B22222") end)
end})
if spoon.WinWin then
    spoon.ModalMgr:new("resizeM")
    local cmodal = spoon.ModalMgr.modal_list["resizeM"]
    cmodal:bind('', 'escape', '退出', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
    cmodal:bind('', 'tab', '键位提示', function() spoon.ModalMgr:toggleCheatsheet() end)
    cmodal:bind('', 'A', '向左移动', function() spoon.WinWin:stepMove("left") end, nil, function() spoon.WinWin:stepMove("left") end)
    cmodal:bind('', 'D', '向右移动', function() spoon.WinWin:stepMove("right") end, nil, function() spoon.WinWin:stepMove("right") end)
    cmodal:bind('', 'W', '向上移动', function() spoon.WinWin:stepMove("up") end, nil, function() spoon.WinWin:stepMove("up") end)
    cmodal:bind('', 'S', '向下移动', function() spoon.WinWin:stepMove("down") end, nil, function() spoon.WinWin:stepMove("down") end)
    cmodal:bind('', 'H', '左半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfleft") end)
    cmodal:bind('', 'L', '右半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfright") end)
    cmodal:bind('', 'K', '上半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfup") end)
    cmodal:bind('', 'J', '下半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfdown") end)
    cmodal:bind('', 'Y', '左上角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNW") end)
    cmodal:bind('', 'O', '右上角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNE") end)
    cmodal:bind('', 'U', '左下角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSW") end)
    cmodal:bind('', 'I', '右下角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSE") end)
    cmodal:bind('', 'F', '全屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("fullscreen") end)
    cmodal:bind('', 'C', '居中', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("center") end)
    cmodal:bind('', '=', '窗口放大', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
    cmodal:bind('', '-', '窗口缩小', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)
    cmodal:bind('ctrl', 'H', '向左收缩', function() spoon.WinWin:stepResize("left") end, nil, function() spoon.WinWin:stepResize("left") end)
    cmodal:bind('ctrl', 'L', '向右扩展', function() spoon.WinWin:stepResize("right") end, nil, function() spoon.WinWin:stepResize("right") end)
    cmodal:bind('ctrl', 'K', '向上收缩', function() spoon.WinWin:stepResize("up") end, nil, function() spoon.WinWin:stepResize("up") end)
    cmodal:bind('ctrl', 'J', '向下扩展', function() spoon.WinWin:stepResize("down") end, nil, function() spoon.WinWin:stepResize("down") end)
    cmodal:bind('', 'left', '移至左边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("left") end)
    cmodal:bind('', 'right', '移至右边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("right") end)
    cmodal:bind('', 'up', '移至上边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("up") end)
    cmodal:bind('', 'down', '移至下边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("down") end)
    cmodal:bind('', 'space', '移至下一个屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("next") end)
    cmodal:bind('', '[', '撤销最后一个窗口操作', function() spoon.WinWin:undo() end)
    cmodal:bind('', ']', '重做最后一个窗口操作', function() spoon.WinWin:redo() end)
    cmodal:bind('', '`', '将光标移至所在窗口中心位置', function() spoon.WinWin:centerCursor() end)
end

--------------------------------------------------------------------------------
spoon.ModalMgr.supervisor:enter()
hs.notify.show("配置加载完成...", "️", "")
