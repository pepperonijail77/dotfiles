---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "compose:ralt",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,

            middle_button_emulation = true,
            tap_to_click            = true,
        },
    },
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "special",
    workspace_name = "magic",
})

hl.gesture({
    fingers = 2,
    direction = "pinch",
    action = "cursor_zoom",
    zoom_level = 1.2,
    mode = "live",
})