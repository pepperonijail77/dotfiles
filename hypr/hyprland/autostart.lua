-------------------
---- AUTOSTART ----
-------------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
    hl.exec_cmd("uwsm-app -- hyprpaper")
    hl.exec_cmd("uwsm-app -- waybar")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("uwsm-app -- swaync")
    hl.exec_cmd("uwsm-app -- swayosd-server")
    hl.exec_cmd("uwsm-app -- hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-paste --watch clipvault store")
end)
