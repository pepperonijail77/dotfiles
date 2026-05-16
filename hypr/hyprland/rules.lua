---------------
---- RULES ----
---------------

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    -- border_size = 0,
    rounding    = 0,
})

hl.window_rule({
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    -- border_size = 0,
    rounding    = 0,
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "qalculate",
    match = { class = "qalculate.*" },

    float           = true,
    persistent_size = true,
    opacity         = 0.8,
    min_size        = {0, 198},
})

-- hl.window_rule({
--     name  = "bars",
--     match = { tag = "negative:bar" },

--     hyprbars:no_bar = true,
-- })