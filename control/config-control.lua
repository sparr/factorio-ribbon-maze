--[[
   Copyright 2018 H8UL

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
--]]

----------------------------------------
-- Settings and configuration caching --
----------------------------------------

local function updateRibbonMazeConfig()

    --
    -- create config object
    --
    local config = createRibbonMazeConfig()
    if not config then
        error('createRibbonMazeConfig() returned nil')
    end

    --
    -- perform any checks and calculations
    --
    local resourceMatrixMax = 0
    for k,_ in pairs(config.resourceMatrix) do
        if k > resourceMatrixMax then
            resourceMatrixMax = k
        end
    end
    config.resourceMatrixMax = resourceMatrixMax

    --
    -- assign to global
    --
    global.ribbonMazeConfig = config
    return config
end

-- Accessor function used throughout the mod:
function ribbonMazeConfig()
    return global.ribbonMazeConfig or updateRibbonMazeConfig()
end

-- register with script.on_configuration_changed(ribbonMazeConfigurationChanged):
function ribbonMazeConfigurationChanged()
    updateRibbonMazeConfig()
end

-- register with script.on_event(defines.events.on_runtime_mod_setting_changed, ribbonMazeModSettingChanged):
function ribbonMazeModSettingChanged()
    updateRibbonMazeConfig()
end