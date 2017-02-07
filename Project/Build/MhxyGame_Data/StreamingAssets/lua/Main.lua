require "Game/Main/GameMain"

function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

--主入口函数。从这里开始lua逻辑
function Main()				
	
	local main = GameMain();

end


--场景切换通知
function OnLevelWasLoaded(level)
	Time.timeSinceLevelLoad = 0
end