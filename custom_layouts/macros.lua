require "keybow"

-- Enum
Modes = { NUMPAD=1, WINDOWS=2, CSHARP=3, PYTHON=4}

-- variables
current_mode = Modes.NUMPAD

function setup()
    keybow.auto_lights(false)
    keybow.clear_lights()
    current_mode = Modes.NUMPAD
    init()
end

-- Custom Functions
-- Set Colors of keys
function init()
    if current_mode == Modes.NUMPAD then 
        keybow.set_pixel(0, 255, 0, 0)
        r = 255
        g = 255
        b = 255
        for i=1, 11 do
            keybow.set_pixel(i, r, g, b)
            r = r-15
            g = g-15
            b = b-15
        end
    elseif current_mode == Modes.WINDOWS then 
        keybow.set_pixel(0, 0, 255, 0)
        -- start cmd
        keybow.set_pixel(1, 50, 50, 50)
        -- start chrome
        keybow.set_pixel(2, 65, 129, 238)
        -- start explorer
        keybow.set_pixel(3, 246, 204, 91)
        -- start VNC
        keybow.set_pixel(4,39, 135, 236)
        -- start Word
        keybow.set_pixel(5, 42, 85, 148)
        -- start Excel
        keybow.set_pixel(6, 32, 112, 70)
        -- start control panel
        keybow.set_pixel(7, 0, 114, 205)
        -- start GitHub
        keybow.set_pixel(8, 48, 47, 47)
        -- Start Wisual Studio
        keybow.set_pixel(9, 101, 32, 118)
        -- Start VS Code
        keybow.set_pixel(10, 34, 160, 233)
        -- Start Notepad
        keybow.set_pixel(11, 164, 235, 122)
    elseif current_mode == Modes.CSHARP then
        -- Switch button
        keybow.set_pixel(0, 255, 0, 255)
        -- public
        keybow.set_pixel(1, 0, 255, 0)
        -- private
        keybow.set_pixel(2, 255, 0, 0)
        -- class
        keybow.set_pixel(3, 0, 255, 127)
        -- interface
        keybow.set_pixel(4, 173, 255, 47)
        -- constructor
        keybow.set_pixel(5, 255, 255, 255)
        -- property
        keybow.set_pixel(6, 30, 144, 255)
        -- full property
        keybow.set_pixel(7, 0, 114, 225)
        -- Binding
        keybow.set_pixel(8, 160, 82, 45)
        -- region
        keybow.set_pixel(9, 50, 50, 50)
        -- endregion
        keybow.set_pixel(10, 20, 20, 20)
        -- comment
        keybow.set_pixel(11, 56, 154, 66)
    elseif current_mode == Modes.PYTHON then
        keybow.set_pixel(0, 0, 255, 0)
        keybow.set_pixel(1, 0, 0, 0)
        keybow.set_pixel(2, 0, 0, 0)
        keybow.set_pixel(3, 0, 0, 0)
        keybow.set_pixel(4, 0, 0, 0)
        keybow.set_pixel(5, 0, 0, 0)
        keybow.set_pixel(6, 0, 0, 0)
        keybow.set_pixel(7, 0, 0, 0)
        keybow.set_pixel(8, 0, 0, 0)
        keybow.set_pixel(9, 0, 0, 0)
        keybow.set_pixel(10, 0, 0, 0)
        keybow.set_pixel(11, 0, 0, 0)
    end
end

-- Change current mode
function change_mode()
    if current_mode == Modes.NUMPAD then 
        current_mode = Modes.WINDOWS
    elseif current_mode == Modes.WINDOWS then
        current_mode = Modes.CSHARP
    elseif current_mode == Modes.CSHARP then
        current_mode = Modes.PYTHON
    elseif current_mode == Modes.PYTHON then
        current_mode = Modes.NUMPAD
    end
    set_mode_key()
end

function mode_numpad(key)
    if key == 1 then
        keybow.tap_key("0", pressed)
    elseif key == 2 then
        keybow.tap_key(keybow.ENTER, pressed)
    elseif key == 3 then
        keybow.tap_key("1", pressed)
    elseif key == 4 then
        keybow.tap_key("2", pressed)
    elseif key == 5 then
        keybow.tap_key("3", pressed)
    elseif key == 6 then
        keybow.tap_key("4", pressed)
    elseif key == 7 then
        keybow.tap_key("5", pressed)
    elseif key == 8 then
        keybow.tap_key("6", pressed)
    elseif key == 9 then
        keybow.tap_key("7", pressed)
    elseif key == 10 then
        keybow.tap_key("8", pressed)
    elseif key == 11 then
        keybow.tap_key("9", pressed)
    else
        keybow.text("Error", pressed)
    end
end

function mode_windows(key)
    -- TODO Add windows Macros
    if key == 1 then
        open_program("cmd")
    elseif key == 2 then
        open_program("Chrome")
    elseif key == 3 then
        open_program("Explorer")
    elseif key == 4 then
        open_program("VNC")
    elseif key == 5 then
        open_program("Word")
    elseif key == 6 then
        open_program("Excel")
    elseif key == 7 then
        open_program("control")
    elseif key == 8 then
        open_program("GitHub")
    elseif key == 9 then
        open_program("Visual Studio")
    elseif key == 10 then
        open_program("Visual Studio Code")
    elseif key == 11 then
        open_program("Notepad")
    else
        keybow.text("Error", pressed)
    end
end

function open_program(name)
    keybow.set_modifier(keybow.LEFT_META, keybow.KEY_DOWN)
    keybow.tap_key("s", pressed)
    keybow.set_modifier(keybow.LEFT_META, keybow.KEY_UP)
    keybow.sleep(20)
    keybow.text(name, pressed)
    keybow.sleep(20)
    keybow.tap_enter()
end

function mode_csharp(key)
    -- TODO Add C# Macros
    if key == 1 then
        keybow.text("public ", pressed)
    elseif key == 2 then
        keybow.text("private ", pressed)
    elseif key == 3 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 4 then
        keybow.text("interface", pressed)
        tabtab()
    elseif key == 5 then
        keybow.text("ctor", pressed)
        tabtab()
    elseif key == 6 then
        keybow.text("prop", pressed)
        tabtab()
    elseif key == 7 then
        keybow.text("propfull", pressed)
        tabtab()
    elseif key == 8 then
        keybow.text("{Binding Path}", pressed)
    elseif key == 9 then
        keybow.text("#region ", pressed)
    elseif key == 10 then
        keybow.text("#endregion", pressed)
    elseif key == 11 then
        keybow.text("// ", pressed)
    else
        keybow.text("Error", pressed)
    end
end

function tabtab()
    keybow.tap_tab()
    keybow.tap_tab()
end

function mode_python(key)
    -- TODO Add python Macros
    if key == 1 then
        keybow.set_key("0", pressed)
    elseif key == 2 then
        keybow.set_key(keybow.ENTER, pressed)
    elseif key == 3 then
        keybow.set_key("1", pressed)
    elseif key == 4 then
        keybow.set_key("2", pressed)
    elseif key == 5 then
        keybow.set_key("3", pressed)
    elseif key == 6 then
        keybow.set_key("4", pressed)
    elseif key == 7 then
        keybow.set_key("5", pressed)
    elseif key == 8 then
        keybow.set_key("6", pressed)
    elseif key == 9 then
        keybow.set_key("7", pressed)
    elseif key == 10 then
        keybow.set_key("8", pressed)
    elseif key == 11 then
        keybow.set_key("9", pressed)
    else
        keybow.text("Error", pressed)
    end
end

function key_press(key)
    -- switch by mode
    if current_mode == Modes.NUMPAD then
        mode_numpad(key)
    elseif current_mode == Modes.WINDOWS then
        mode_windows(key)
    elseif current_mode == Modes.CSHARP then
        mode_csharp(key)
    elseif current_mode == Modes.PYTHON then
        mode_windows(key)
    end
end

-- Key mappings --
function handle_key_00(pressed)
    if pressed then
        change_mode()
    end
end

function handle_key_01(pressed)
    if pressed then
        key_press(1)
    end
end

function handle_key_02(pressed)
    if pressed then
        key_press(2)
    end
end

function handle_key_03(pressed)
    if pressed then
        key_press(3)
    end
end

function handle_key_04(pressed)
    if pressed then
        key_press(4)
    end
end

function handle_key_05(pressed)
    if pressed then
        key_press(5)
    end
end

function handle_key_06(pressed)
    if pressed then
        key_press(6)
    end
end

function handle_key_07(pressed)
    if pressed then
        key_press(7)
    end
end

function handle_key_08(pressed)
    if pressed then
        key_press(8)
    end
end

function handle_key_09(pressed)
    if pressed then
        key_press(9)
    end
end

function handle_key_10(pressed)
    if pressed then
        key_press(10)
    end
end

function handle_key_11(pressed)
    if pressed then
        key_press(11)
    end
end
