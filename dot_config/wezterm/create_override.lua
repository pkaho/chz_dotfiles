local wezterm = require("wezterm")

return function(config)
    config.font = wezterm.font_with_fallback({
        -- en
        { family = "SF Mono",                      scale = 1.0 },
        { family = "MonoLisa",                     scale = 1.0 },
        { family = "TX-02",                        scale = 1.0 },
        { family = "JetBrainsMono Nerd Font Mono", scale = 1.0 },
        { family = "Maple Mono NF",                scale = 1.0 },
        { family = "FiraCode Nerd Font Mono",      scale = 1.0 },
        { family = "Iosevka Nerd Font Mono",       scale = 1.1 },
        -- cn
        { family = "LXGW Neo XiHei",               scale = 1.0 },
        { family = "Maple Mono NF CN",             scale = 1.0 },
        { family = "LXGW WenKai",                  scale = 1.0 },
    })
end
