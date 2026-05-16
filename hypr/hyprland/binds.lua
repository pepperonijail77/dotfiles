------------------
---- PROGRAMS ----
------------------

local terminal    = "kitty"
local fileManager = "nemo"
local browser     = "firefox-developer-edition"
local menu        = "rofi -show drun -run-command \"uwsm-app -- {cmd}\""
local runner      = "hyprland-run"
local window      = "rofi -show window"
local lock        = "hyprlock"
local screenshot  = "hyprshot"
local mail        = "flatpak run com.tutanota.Tutanota --password-store=basic"
local calculator  = "qalculate-gtk"


---------------------
---- KEYBINDINGS ----
---------------------

-- https://wiki.hypr.land/Configuring/Basics/Binds/

local function run (cmd)
    return hl.dsp.exec_cmd("uwsm-app -- " .. cmd)
end

hl.bind("SUPER + Return",    run(terminal))
hl.bind("SUPER + E",         run(fileManager))
hl.bind("SUPER + B",         run(browser))
hl.bind("SUPER + SHIFT + B", run(browser .. " --private-window"))

hl.bind("SUPER + C",         hl.dsp.window.close())
hl.bind("ALT + F4",          hl.dsp.window.kill())
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || uwsm stop || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + G",         hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + Space",     run("pkill rofi || " .. menu))
hl.bind("SUPER + R",         run(runner))
hl.bind("SUPER + P",         hl.dsp.window.pseudo())
hl.bind("SUPER + J",         hl.dsp.layout("togglesplit"))
hl.bind("SUPER + F",         hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + L",         run(lock))
hl.bind("Print",             run(screenshot .. " -m output"))
hl.bind("SHIFT + Print",     run(screenshot .. " -m region"))
hl.bind("ALT + Print",       run(screenshot .. " -m window"))
hl.bind("SUPER + V",         run("clipvault list | rofi -dmenu -display-columns 2 | clipvault get | wl-copy"))
hl.bind("SUPER + H",         hl.dsp.window.tag({ tag = "bar" }))
hl.bind("SUPER + K",         hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + Slash",     run("swaync-client -t -sw"))

hl.bind("SUPER + left",          hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right",         hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",            hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",          hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,               hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,       hl.dsp.window.move({ workspace = i }))
    hl.bind("SUPER + ALT + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("SUPER + S",               hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S",       hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("SUPER + ALT + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

hl.bind("SUPER + Tab",         hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_down",  hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",    hl.dsp.focus({ workspace = "e-1" }))
hl.bind("ALT + Tab",           function ()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    -- hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("ALT + SHIFT + Tab",   function ()
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
    -- hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
    -- hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("swayosd-client --output-volume +1"),          { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("swayosd-client --output-volume -1"),          { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),  { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("swayosd-client --brightness raise"),          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"),          { locked = true, repeating = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("swayosd-client --playerctl next"),            { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("swayosd-client --playerctl previous"),        { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),      { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),      { locked = true })
hl.bind("XF86Explorer",   run(fileManager))
hl.bind("XF86HomePage",   run(fileManager))
hl.bind("XF86Mail",       run(mail))
hl.bind("XF86Calculator", run(calculator))
