--rainlib demo
--beardman studios
--btns ⬇️⬆️⬅️➡️❎🅾️
function _init()
    rainlib:init()
end

function _update()
    if (btn(⬅️)) rainlib.direction -= 0.1
    if (btn(➡️)) rainlib.direction += 0.1
    rainlib:update()
end

function _draw()
    cls()
    map()

    rainlib:draw()    
end
