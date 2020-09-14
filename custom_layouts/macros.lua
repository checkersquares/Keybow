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
function init()
    local r = 0
    local g = 0
    local b = 0
    if current_mode == Modes.NUMPAD then 
        r = 155
        g = 155
        b = 155
    elseif current_mode == Modes.WINDOWS then 
        r = 0
        g = 161
        b = 241
    elseif current_mode == Modes.CSHARP then
        r = 93
        g = 43
        b = 144
    elseif current_mode == Modes.PYTHON then
        r = 48
        g = 105
        b = 152
    end
    for i=1, 11 do
        keybow.set_pixel(i, r, g, b)
    end
end

function set_mode_key()
    if current_mode == Modes.NUMPAD then 
        keybow.set_pixel(0, 255,255,255)
    elseif current_mode == Modes.WINDOWS then 
        keybow.set_pixel(0, 124,187,0)
    elseif current_mode == Modes.CSHARP then
        keybow.set_pixel(0, 0, 120, 215)
    elseif current_mode == Modes.PYTHON then
        keybow.set_pixel(0, 255, 212, 59)
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
        keybow.tap_key(keybow.F13, pressed)
    elseif key == 2 then
        keybow.tap_key(keybow.F14, pressed)
    elseif key == 3 then
        keybow.tap_key(keybow.F15, pressed)
    elseif key == 4 then
        keybow.tap_key(keybow.F16, pressed)
    elseif key == 5 then
        keybow.tap_key(keybow.F17, pressed)
    elseif key == 6 then
        keybow.tap_key(keybow.F18, pressed)
    elseif key == 7 then
        keybow.tap_key(keybow.F19, pressed)
    elseif key == 8 then
        keybow.tap_key(keybow.F20, pressed)
    elseif key == 9 then
        keybow.tap_key(keybow.F21, pressed)
    elseif key == 10 then
        keybow.tap_key(keybow.F22, pressed)
    elseif key == 11 then
        keybow.tap_key(keybow.F23, pressed)
    else
        keybow.text("Error", pressed)
    end
end

function mode_csharp(key)
    -- TODO Add C# Macros
    if key == 1 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 2 then
        keybow.text("prop", pressed)
        tabtab()
    elseif key == 3 then
        keybow.text("propfull", pressed)
        tabtab()
    elseif key == 4 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 5 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 6 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 7 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 8 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 9 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 10 then
        keybow.text("class", pressed)
        tabtab()
    elseif key == 11 then
        keybow.text("class", pressed)
        tabtab()
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