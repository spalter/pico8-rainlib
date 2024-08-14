--rainlib demo
--by beardman studios

-- just example code for the demo
-- you can use this as a template for your own projects

-- pico-8 init function
function _init()
    --your code here--
    rainlib:init()
end

-- default pico-8 update function
function _update()
    --your code here--
    if (btn(0)) rainlib.direction -= 0.1
    if (btn(1)) rainlib.direction += 0.1
    if (btn(5)) rainlib.color += 1
    if (btn(4)) rainlib.has_thunder = not rainlib.has_thunder

    if (rainlib.color>15) rainlib.color = 0
    rainlib:update()
end

-- default pico-8 draw function
function _draw()
    cls()
    map()
    --your code here--

    rainlib:draw()
end
