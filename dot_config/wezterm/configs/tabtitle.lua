local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title:gsub("%.exe$", "")
    title = wezterm.truncate_right(title, max_width - 2)

    local has_unseen = false
    for _, pane in ipairs(tab.panes) do
        if pane.has_unseen_output then
            has_unseen = true
            break
        end
    end

    local fg_color = tab.is_active and "#58b879" or "#808080"
    -- local bg_color = "#000000"
    local bg_color = "#181826"
    local on_color = "#fffacd"
    local zoom_indicator = tab.active_pane.is_zoomed and " 󰬡 " or " "
    local unseen_indicator = has_unseen and " ●" or " "

    local elements = {
        { fg = fg_color, bg = bg_color, text = "" },
        { fg = bg_color, bg = fg_color, text = zoom_indicator .. title },
        { fg = on_color, bg = fg_color, text = unseen_indicator },
        { fg = fg_color, bg = bg_color, text = "" },
    }

    local cells = {}
    for _, element in ipairs(elements) do
        table.insert(cells, { Foreground = { Color = element.fg } })
        table.insert(cells, { Background = { Color = element.bg } })
        table.insert(cells, { Attribute = { Intensity = "Bold" } })
        table.insert(cells, { Text = element.text })
    end

    return cells
end)
