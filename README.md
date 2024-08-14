# PICO-8 rainlib
A small library that allows you to create and draw rain effects in PICO-8.

## Installation & Usage
All required code is included in the `rainlib.lua` file. Copy the file to your PICO-8 project directory and include it in your `main.lua` file. It should look something like this:

```lua
#include "rainlib.lua"

function _init()
    rainlib.init()
end

function _update()
    rainlib.update()
end

function _draw()
    rainlib.draw()
end
```
