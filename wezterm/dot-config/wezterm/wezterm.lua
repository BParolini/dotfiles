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

    -- background = {
    --     {
    --         source = {
    --             File = wezterm.config_dir .. "/bg_image.jpg",
    --         },
    --         attachment = "Fixed",
    --         vertical_align = "Middle",
    --         horizontal_align = "Center",
    --         opacity = 1.0,
    --         hsb = {
    --             hue = 1.0,
    --             saturation = 1.0,
    --             brightness = 0.03,
    --         },
    --         height = "Cover",
    --         width = "Cover",
    --     },
    -- },

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
    font_size = 13.0,
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
