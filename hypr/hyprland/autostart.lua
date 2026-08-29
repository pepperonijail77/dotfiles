-------------------
---- AUTOSTART ----
-------------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
    hl.exec_cmd("uwsm-app -- swaybg -i ~/.wallpapers/nord.jpg")
    hl.exec_cmd("uwsm-app -- waybar")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("uwsm-app -- swaync")
    hl.exec_cmd("uwsm-app -- swayosd-server")
    hl.exec_cmd("uwsm-app -- swayidle -C $XDG_CONFIG_HOME/swayidle/hyprland")
    hl.exec_cmd("lxpolkit")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("uwsm-app -- steam -silent")
end)
