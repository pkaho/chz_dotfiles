local wezterm = require("wezterm")
local C = require("configs.colors")

local config = wezterm.config_builder()

config = {
    color_scheme = "Catppuccin Mocha", -- Mocha Macchiato Frappe Latte

    -- 字体
    -- stylua: ignore start
    font = wezterm.font_with_fallback({
        -- en
        { family = "JetBrainsMono Nerd Font Mono", scale = 1.0 },
        { family = "Iosevka Nerd Font Mono",       scale = 1.1 },
        { family = "TX-02",                        scale = 1.0 },
        { family = "FiraCode Nerd Font Mono",      scale = 1.0 },
        { family = "Maple Mono NF",                scale = 1.0 },
        -- cn
        { family = "LXGW Neo XiHei",               scale = 1.0 },
        { family = "Maple Mono NF CN",             scale = 1.0 },
        { family = "LXGW WenKai",                  scale = 1.0 },
    }),
    -- stylua: ignore end
    font_size = 12,

    -- tab
    use_fancy_tab_bar = true,
    show_new_tab_button_in_tab_bar = false,
    -- show_close_tab_button_in_tabs = false

    -- performance
    max_fps = 60,
    animation_fps = 60,

    -- 窗口行为
    window_decorations = "RESIZE",
    adjust_window_size_when_changing_font_size = false,
    window_close_confirmation = "NeverPrompt",

    -- 启动大小
    initial_cols = 70,
    initial_rows = 18,

    -- 滚动
    enable_scroll_bar = true,
    min_scroll_bar_height = "9cell",
    scrollback_lines = 3500,
    mouse_wheel_scrolls_tabs = true,
    scroll_to_bottom_on_input = true,

    -- 非活动窗格 hsb 设置
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.55,
    },

    -- 窗格间隙
    window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5,
    },
}

C.setup_header_popups(config)
require("configs.domains")(config)
require("configs.keybinds")(config)
require("configs.mouse")(config)
require("configs.rules")(config)
require("configs.tabtitle")

return config
