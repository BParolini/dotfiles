-- Pull the WezTerm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    audible_bell = "Disabled",

    default_prog = { "/opt/homebrew/bin/tmux" },

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

    font = wezterm.font_with_fallback({
        { family = "JetBrainsMono Nerd Font", weight = "DemiBold" },
        { family = "Iosevka Nerd Font", weight = "DemiBold" },
        { family = "FiraCode Nerd Font", weight = "DemiBold" },
    }),
    font_size = 13.0,
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
