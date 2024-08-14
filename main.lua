--rainlib demo
--beardman studios
--btns ⬇️⬆️⬅️➡️❎🅾️
function _init()
    rainlib:init()
end

function _update()
    if (btn(⬅️)) rainlib.direction -= 0.1
    if (btn(➡️)) rainlib.direction += 0.1
    if (btn(❎)) rainlib.color += 1
    if (btn(🅾️)) rainlib.has_thunder = not rainlib.has_thunder

    if (rainlib.color>15) rainlib.color = 0
    rainlib:update()
end

function _draw()
    cls()
    map()

    rainlib:draw()    
end
