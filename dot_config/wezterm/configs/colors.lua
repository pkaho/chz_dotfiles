local wezterm = require("wezterm")

local M = {
    -- title
    active_title_fg   = "#ffb400",
    inactive_title_fg = "#8c7b52",
    title_bg          = "#000005",
    unseen            = "#7a4b00",

    -- popups
    popups_bg         = "#fff6e0",
    popups_fg         = "#4a443f",
}

function M.setup_header_popups(config)
    config.window_frame = {
        font = wezterm.font({
            family = "", -- 留空不使用默认的 Roboto 字体
            weight = "Bold",
        }),
        font_size = 11,
        active_titlebar_bg = M.title_bg,
        inactive_titlebar_bg = M.title_bg,
    }
    config.command_palette_bg_color = M.popups_bg
    config.command_palette_fg_color = M.popups_fg
    config.command_palette_font_size = 14.0
    config.char_select_bg_color = M.popups_bg
    config.char_select_fg_color = M.popups_fg
    config.char_select_fg_color = M.popups_fg
    config.char_select_font_size = 14.0
end

return M
