-- Pull the WezTerm API
local wezterm = require("wezterm")

-- Helper variable to store the detected OS
-- local is_windows = wezterm.target_triple:find("windows") ~= nil
-- local is_mac = wezterm.target_triple:find("apple") ~= nil
local is_linux = wezterm.target_triple:find("linux") ~= nil

local preferred_adapter
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
    if is_linux then
        if not gpu.name:find("NVIDIA") then
            preferred_adapter = gpu
            break
        end
    else
        preferred_adapter = gpu
    end
end

-- This will hold the configuration
local config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    audible_bell = "Disabled",

    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",
    webgpu_preferred_adapter = preferred_adapter,

    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    window_padding = {
        left = "3px",
        right = "3px",
        top = "3px",
        bottom = "3px",
    },

    -- color_scheme = "tokyonight_moon",
    color_scheme = "catppuccin-mocha",
    -- color_scheme = "Kanagawa (Gogh)",
    -- color_scheme = "nord",
    -- color_scheme = "rose-pine",

    font = wezterm.font_with_fallback({
        { family = "JetBrainsMono Nerd Font", weight = "DemiBold" },
        { family = "Iosevka Nerd Font", weight = "DemiBold" },
        { family = "FiraCode Nerd Font", weight = "DemiBold" },
    }),

    keys = {
        {
            key = "Enter",
            mods = "OPT",
            action = wezterm.action.SendKey({ key = "Enter", mods = "OPT" }),
        },
    },
}

if wezterm.target_triple:find("linux") then
    config.default_prog = { "/bin/tmux" }
    config.font_size = 12.0
elseif wezterm.target_triple:find("darwin") then
    config.default_prog = { "/opt/homebrew/bin/tmux" }
    config.font_size = 14.0
end

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
