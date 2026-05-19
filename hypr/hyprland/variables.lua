-----------------------
---- LOOK AND FEEL ----
-----------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in    = 5,
        gaps_out   = 10,
        float_gaps = 30,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(88c0d0ee)", "rgba(8fbcbbee)"}, angle = 45 },
            inactive_border = "rgba(4c566aaa)",
        },

        resize_on_border = false,

        -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = false,

        snap = {
            enabled     = true,
            window_gap  = 10,
            monitor_gap = 15,
        }
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity     = 1.0,
        inactive_opacity   = 0.6,
        fullscreen_opacity = 1.0,

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 4,
            vibrancy  = 0.1696,
            popups    = false,
        },

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
    },
})
