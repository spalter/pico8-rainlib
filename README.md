# PICO-8 rainlib
A small library that allows you to create and draw rain effects in PICO-8.

## Installation & Usage
All required code is included in the `rainlib_m.lua` file. Copy the file to your PICO-8 project directory and include it in your `main.lua` file. It should look something like this:

```lua
#include "rainlib_m.lua"

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

There two version of the rainlib in the project. One is the `rainlib.lua` which is the development version with more readable core. The second one is `rainlib_m.lua` which contains a compressed version of the `rainlib.lua`. Use the compressed version unless you want to do changes to the lib. It uses less tokes and characters for your game.

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
    #include rainlib/main.lua
    #include rainlib/rainlib.lua
    ```

2. Edit the `.lua` files and simply run the PICO-8 emulator. The library will be loaded automatically. However, make sure to save the lua files.
