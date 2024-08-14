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

## Tools

### Aseprite
This project uses the [Aseprite](https://www.aseprite.org/) sprite editor for sprites.

*Workflow:*
1. Make changes to the `spritesheet.png` and save the file.
2. Import the changes in PICO-8 with `import spritesheet.png`
3. In case you want to export the spritesheet, use `export spritesheet.png` after making a change in the PICO-8 editor.

### Emulation
This library is for the [PICO-8](https://www.lexaloffle.com/pico-8.php) fantasy console.

### Development
The code is maintained with the [Visual Studio Code](https://code.visualstudio.com/) code editor. But any editor can be used.

*Workflow:*
1. Create a new PICO-8 cart and put the following code in:

    ```lua
    include "main.lua"
    include "rainlib.lua"
    ```

2. Edit the `.lua` files and simply run the PICO-8 emulator. The library will be loaded automatically. However, make sure to save the lua files.